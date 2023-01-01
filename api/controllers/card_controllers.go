package controllers

import (
	"crypto/rand"
	"errors"
	"fmt"
	"github.com/gorilla/mux"
	"math/big"
	"mocks/api/auth"
	"mocks/api/models"
	"mocks/api/responses"
	"net/http"
	"strconv"
)

func (server *Server) GetCard(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	cid, err := strconv.ParseUint(vars["id"], 10, 32)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}
	card := models.Card{}
	cardGotten, err := card.FindCardByID(server.DB, uint32(cid))
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}
	fmt.Println(cardGotten)
	responses.JSON(w, http.StatusOK, cardGotten)
}

func (server *Server) GetAllCard(w http.ResponseWriter, r *http.Request) {

	//vars := mux.Vars(r)
	//cid, err := strconv.ParseUint(vars["id"], 10, 32)
	//if err != nil {
	//	responses.ERROR(w, http.StatusBadRequest, err)
	//	return
	//}
	card := models.Card{}
	cardGotten, err := card.FindCardByIDAll(server.DB)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}
	fmt.Println(cardGotten)
	responses.JSON(w, http.StatusOK, cardGotten)
}

func (server *Server) CardGenerateInit(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)

	packCode := models.PackCode{
		PackCodeKey: vars["packCode"],
	}

	pc, err := packCode.GetPackCodeDetails(server.DB)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}
	userID, ok := ValidateUser(r, w, packCode.AccountId)
	if ok == false {
		responses.ERROR(w, http.StatusBadRequest, errors.New("invalid pack code"))
	}

	Packs := models.Packs{
		PackId: packCode.PackId,
	}

	_, err = Packs.GetPackDetailsByID(server.DB)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}
	cardsCommon, err := server.CardGenerateCommon(Packs.CardAmount)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}
	//responses.JSON(w, http.StatusOK, cardsCommon)
	cardsRare, err := server.CardGenerateRare(Packs.CardAmount)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}
	cards := append(cardsCommon, cardsRare...)
	acm := models.AccountCardMap{}
	_, err = acm.InsertCards(cards, server.DB, userID)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}
	//packCode = models.PackCode{}
	_, err = pc.DeleteUsedPackCode(server.DB)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}

	responses.JSON(w, http.StatusOK, cards)

}

func (server *Server) CardGenerateCommon(CardAmount int64) ([]models.Card, error) {

	card := models.Card{}
	var cards []models.Card
	c, err := card.GenerateCommon(server.DB, CardAmount)
	if err != nil {
		return nil, err
	}
	for i := 0; i < int(CardAmount)/5*4; i++ {
		nBig, err := rand.Int(rand.Reader, big.NewInt(int64(len(c))-1))
		if err != nil {
			return nil, err
		}
		n := nBig.Int64()
		n++
		cards = append(cards, c[n])
	}
	return cards, nil
}

func (server *Server) CardGenerateRare(CardAmount int64) ([]models.Card, error) {
	card := models.Card{}
	var cards []models.Card
	c, err := card.GenerateRare(server.DB, CardAmount)
	if err != nil {
		return nil, err
	}
	for i := 0; i < int(CardAmount)/5; i++ {
		nBig, err := rand.Int(rand.Reader, big.NewInt(int64(len(c))-1))
		if err != nil {
			return nil, err
		}
		n := nBig.Int64()
		n++
		cards = append(cards, c[n])
	}
	return cards, nil

}

func (server *Server) CardList(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	accountCardMap := models.AccountCardMap{}
	//var accountCardMaps []models.AccountCardMap
	userId, err := auth.ExtractTokenID(r)
	if err != nil {
		responses.ERROR(w, http.StatusUnauthorized, errors.New("unauthorized"))
		return
	}

	a, err := accountCardMap.CardList(server.DB, userId)

	responses.JSON(w, http.StatusOK, a)
}

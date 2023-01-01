package controllers

import (
	"crypto/rand"
	"encoding/base32"
	"errors"
	"fmt"
	"github.com/gorilla/mux"
	"mocks/api/auth"
	"mocks/api/models"
	"mocks/api/responses"
	"net/http"
)

func (server *Server) PackGenerate(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Generate packs")
	vars := mux.Vars(r)
	userId, err := auth.ExtractTokenID(r)

	randomBytes := make([]byte, 64)
	_, err = rand.Read(randomBytes)
	if err != nil {
		panic(err)
	}
	gen_pack_code := base32.StdEncoding.EncodeToString(randomBytes)[:24]

	Packs := models.Packs{
		PackCode: vars["pack"],
	}
	_, err = Packs.GetPackDetailsByCode(server.DB)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}

	packCode := models.PackCode{
		PackCodeKey: gen_pack_code,
		PackId:      Packs.PackId,
		AccountId:   int64(userId),
	}
	codeInserted, err := packCode.PackCodeInsert(w, r, server.DB)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return
	}
	responses.JSON(w, http.StatusOK, codeInserted.PackCodeKey)
}

func ValidateUser(r *http.Request, w http.ResponseWriter, accountID int64) (int64, bool) {
	userId, err := auth.ExtractTokenID(r)
	if err != nil {
		responses.ERROR(w, http.StatusBadRequest, err)
		return 0, false
	}
	if int64(userId) != accountID {
		responses.ERROR(w, http.StatusBadRequest, errors.New("invalid"))
	}
	return int64(userId), true
}

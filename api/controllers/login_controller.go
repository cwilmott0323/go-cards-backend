package controllers

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	"golang.org/x/crypto/bcrypt"
	"mocks/api/auth"
	"mocks/api/models"
	"mocks/api/responses"
	"mocks/api/utils/formaterror"
)

func (server *Server) Login(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Here")
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		responses.ERROR(w, http.StatusUnauthorized, err)
		return
	}
	account := models.Account{}
	err = json.Unmarshal(body, &account)
	if err != nil {
		responses.ERROR(w, http.StatusUnauthorized, err)
		return
	}

	//account.Prepare()
	//err = account.Validate("login")
	//if err != nil {
	//	responses.ERROR(w, http.StatusUnprocessableEntity, err)
	//	return
	//}
	token, err := server.SignIn(account.Email, account.Password)
	if err != nil {
		formattedError := formaterror.FormatError(err.Error())
		responses.ERROR(w, http.StatusUnauthorized, formattedError)
		return
	}
	responses.JSON(w, http.StatusOK, token)
}

func (server *Server) SignIn(email, password string) (string, error) {

	var err error

	account := models.Account{}

	err = server.DB.Debug().Model(models.Account{}).Where("email = ?", email).Take(&account).Error
	if err != nil {
		return "", err
	}
	err = VerifyPassword(account.Password, password)
	if err != nil && err == bcrypt.ErrMismatchedHashAndPassword {
		return "", err
	}
	return auth.CreateToken(uint32(account.AccountId))
}

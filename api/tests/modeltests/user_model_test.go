package modeltests

import (
	_ "github.com/jinzhu/gorm/dialects/mysql"    //mysql driver
	_ "github.com/jinzhu/gorm/dialects/postgres" //postgres driver
	"github.com/stretchr/testify/assert"
	"log"
	"mocks/api/models"
	"testing"
	//"mocks/api/models"
)

func TestFindAccountByID(t *testing.T) {
	err := refreshUserTable()
	if err != nil {
		log.Fatal(err)
	}

	err = seedUsers()
	if err != nil {
		log.Fatal(err)
	}

	users, err := userInstance.FindAccountByID(server.DB, 1)

	if err != nil {
		t.Errorf("this is the error getting the users: %v\n", err)
		return
	}
	assert.Equal(t, users.AccountId, int64(1))
}

func TestFindAccountByIDNotFound(t *testing.T) {
	err := refreshUserTable()
	if err != nil {
		log.Fatal(err)
	}

	err = seedUsers()
	if err != nil {
		log.Fatal(err)
	}

	_, err = userInstance.FindAccountByID(server.DB, 100)

	if err == nil {
		t.Errorf("error expected here")
		return
	}
	assert.Error(t, err, "Account Not Found")
}

func TestCreateAccount(t *testing.T) {
	err := refreshUserTable()
	if err != nil {
		log.Fatal(err)
	}

	newAccount := models.Account{
		AccountId: 1,
		Password:  "password",
		Email:     "test@test.com",
	}

	savedUser, err := newAccount.CreateAccount(server.DB)
	if err != nil {
		t.Errorf("this is the error getting the users: %v\n", err)
		return
	}
	assert.Equal(t, newAccount.AccountId, savedUser.AccountId)
	assert.Equal(t, newAccount.Email, savedUser.Email)
}

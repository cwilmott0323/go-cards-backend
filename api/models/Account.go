package models

import (
	"errors"
	"github.com/jinzhu/gorm"
	"time"
)

type AccountCardMap struct {
	AccountId int64 `gorm:"not null;" json:"id"`
	CardId    int64 `gorm:"not null;" json:"cardid"`
	Count     int64 `gorm:"not null;" json:"count"`
}

type AccountCardMapCards struct {
	AccountId   int64  `gorm:"not null;" json:"id"`
	CardId      int64  `gorm:"not null;" json:"cardid"`
	Count       int64  `gorm:"not null;" json:"count"`
	CardID      uint32 `gorm:"primary_key;auto_increment" json:"cid"`
	CardName    string `gorm:"size(100);not null;unique" json:"name"`
	Attack      int64  `gorm:"size(100);not null;" json:"attack"`
	Defence     int64  `gorm:"size(100);not null;" json:"defence"`
	Description string `gorm:"size(1024);" json:"description"`
	Ability     string `gorm:"size(64000);" json:"ability"`
	Typing      string `gorm:"size(64);not null;" json:"typing"`
	Rarity      string `gorm:"size(64);not null;" json:"rarity"`
	Type        string `gorm:"size(64);not null;" json:"type"`
	Set         string `gorm:"size(1024);not null;" json:"set"`
	SetCode     string `gorm:"size(1024);not null;" json:"set_code"`
}

type Account struct {
	AccountId int64     `gorm:"primary_key;auto_increment" json:"id"`
	Password  string    `gorm:"size(255);not null;" json:"password"`
	Email     string    `gorm:"size(255);not null;unique" json:"email"`
	Username  string    `gorm:"size(255);not null;unique" json:"username"`
	CreatedOn time.Time `gorm:"default:CURRENT_TIMESTAMP" json:"created_on"`
	LastLogin time.Time `gorm:"default:CURRENT_TIMESTAMP" json:"last_login"`
}

var AccountCardMaps []AccountCardMapCards
var ACM []AccountCardMap

func (a *Account) FindAccountByID(db *gorm.DB, aid uint32) (*Account, error) {
	var err error
	err = db.Debug().Model(Account{}).Where("account_id = ?", aid).Take(&a).Error
	if gorm.IsRecordNotFoundError(err) {
		return &Account{}, errors.New("Account Not Found")
	}
	if err != nil {
		return &Account{}, err
	}
	return a, err
}

func (a *Account) CreateAccount(db *gorm.DB) (*Account, error) {
	var err error
	err = db.Debug().Create(&a).Error
	if err != nil {
		return &Account{}, err
	}
	return a, err
}

func (a *AccountCardMap) CardList(db *gorm.DB, userid uint32) ([]AccountCardMapCards, error) {
	var err error
	err = db.Table("account_card_maps").Select("*").Joins("left join cards on cards.card_id = account_card_maps.card_id").Where("account_id = ?", userid).Find(&AccountCardMaps).Error
	if err != nil {
		return []AccountCardMapCards{}, err
	}
	if gorm.IsRecordNotFoundError(err) {
		return []AccountCardMapCards{}, errors.New("card Not Found")
	}

	return AccountCardMaps, err
}

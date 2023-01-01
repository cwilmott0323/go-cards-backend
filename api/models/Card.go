package models

import (
	"errors"
	"fmt"
	"github.com/jinzhu/gorm"
)

type Card struct {
	CardID      uint32 `gorm:"primary_key;auto_increment" json:"id"`
	Name        string `gorm:"size(100);not null;unique" json:"name"`
	Attack      int64  `gorm:"size(100);" json:"attack"`
	Defence     int64  `gorm:"size(100);not null;" json:"defence"`
	Description string `gorm:"size(1024);" json:"description"`
	Ability     string `gorm:"size(64000);" json:"ability"`
	Typing      string `gorm:"size(64);not null;" json:"typing"`
	Rarity      string `gorm:"size(64);not null;" json:"rarity"`
	Type        string `gorm:"size(64);not null;" json:"type"`
	Set         string `gorm:"size(1024);not null;" json:"set"`
	SetCode     string `gorm:"size(1024);not null;" json:"set_code"`
	Image       string `gorm:"size(1024);not null;" json:"image"`
}

var Cards []Card

func (c *Card) FindCardByID(db *gorm.DB, cid uint32) (*Card, error) {
	var err error
	err = db.Debug().Model(Card{}).Where("card_id = ?", cid).Take(&c).Error
	if err != nil {
		return &Card{}, err
	}
	fmt.Println(c)
	if gorm.IsRecordNotFoundError(err) {
		return &Card{}, errors.New("Card Not Found")
	}
	return c, err
}

func (c *Card) FindCardByIDAll(db *gorm.DB) ([]Card, error) {
	var err error
	var cards []Card
	//db.Debug().Model(Card{}).Where("card_id in (1,2)")
	err = db.Debug().Model([]Card{}).Where("card_id in (1,2,3,4,5,6)").Order("card_id").Limit(6).Find(&cards).Error
	if err != nil {
		return []Card{}, err
	}
	fmt.Println("Here", c)
	if gorm.IsRecordNotFoundError(err) {
		return []Card{}, errors.New("Card Not Found")
	}
	return cards, err
}

func (c *Card) GenerateCommon(db *gorm.DB, amount int64) ([]Card, error) {
	var err error
	err = db.Debug().Where("rarity = 'Common'").Find(&Cards).Error
	if err != nil {
		return []Card{}, err
	}
	if gorm.IsRecordNotFoundError(err) {
		return []Card{}, errors.New("Card Not Found")
	}

	return Cards, err
}

func (c *Card) GenerateRare(db *gorm.DB, amount int64) ([]Card, error) {
	var err error
	err = db.Debug().Where("rarity != 'Common'").Find(&Cards).Error
	if err != nil {
		return []Card{}, err
	}
	if gorm.IsRecordNotFoundError(err) {
		return []Card{}, errors.New("Card Not Found")
	}

	return Cards, err
}

func (a AccountCardMap) InsertCards(cards []Card, db *gorm.DB, userID int64) (*AccountCardMap, error) {
	var err error
	for _, v := range cards {
		err = db.Debug().Where("card_id = ? and account_id = ?", v.CardID, userID).Find(&a).Error
		if gorm.IsRecordNotFoundError(err) {
			a = AccountCardMap{
				AccountId: userID,
				CardId:    int64(v.CardID),
				Count:     1,
			}
			err = db.Debug().Create(&a).Error
			if err != nil {
				return &AccountCardMap{}, err

			}
		} else if err == nil {

			a = AccountCardMap{
				AccountId: userID,
				CardId:    int64(v.CardID),
				Count:     a.Count,
			}
			err = db.Debug().Model(&a).Where("card_id = ?", a.CardId).Update("count", a.Count+1).Error
		}
	}

	return &a, nil
}

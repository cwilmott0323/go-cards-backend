package models

import (
	"time"
)

type APIKey struct {
	AccountId int64     `gorm:"not null;unique" json:"id"`
	APIKey    string    `gorm:"size:255;not null;unique" json:"api_key"`
	Inserted  time.Time `gorm:"default:CURRENT_TIMESTAMP" json:"inserted"`
}

//func (key *APIKey) InsertKey(db *gorm.DB) (*APIKey, error) {
//	var err error
//	err = db.Debug().Create(&key).Error
//	if err != nil {
//		return &APIKey{}, err
//	}
//	return key, err
//}

//func (key *APIKey) CheckAuth(db *gorm.DB) (*APIKey, error, bool) {
//	var err error
//	err = db.Debug().Model(Account{}).Where("api_key = ?", key.APIKey).Take(&key).Error
//	if err != nil {
//		return &APIKey{}, err, false
//	}
//	if gorm.IsRecordNotFoundError(err) {
//		return &APIKey{}, errors.New("APIKey Not Found"), false
//	}
//	return key, err, true
//}

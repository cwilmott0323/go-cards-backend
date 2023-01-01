package models

import (
	"errors"
	"github.com/jinzhu/gorm"
	"net/http"
)

type PackCode struct {
	PackCodeId  int64  `gorm:"primary_key;auto_increment;" json:"packCodeId"`
	PackCodeKey string `gorm:"size(255);not null;unique" json:"packCodeKey"`
	PackId      int64  `gorm:"not null;" json:"packId"`
	AccountId   int64  `gorm:"not null;" json:"accountId"`
}

type Packs struct {
	PackId     int64  `gorm:"primary_key;auto_increment;" json:"packId"`
	PackName   string `gorm:"size(100);not null;" json:"packName"`
	PackCode   string `gorm:"size(100);not null;" json:"packCode"`
	CardAmount int64  `gorm:"size(100);not null;" json:"cardAmount"`
}

func (packCode *PackCode) PackCodeInsert(w http.ResponseWriter, r *http.Request, db *gorm.DB) (*PackCode, error) {
	var err error
	err = db.Debug().Create(&packCode).Error
	if err != nil {
		return &PackCode{}, err
	}
	return packCode, err
}

func (packs *Packs) GetPackDetailsByCode(db *gorm.DB) (*Packs, error) {
	var err error
	err = db.Debug().Model(Packs{}).Where("pack_code = ?", packs.PackCode).Take(&packs).Error
	if err != nil {
		return &Packs{}, err
	}
	if gorm.IsRecordNotFoundError(err) {
		return &Packs{}, errors.New("Account Not Found")
	}
	return packs, err
}

func (packs *Packs) GetPackDetailsByID(db *gorm.DB) (*Packs, error) {
	var err error
	err = db.Debug().Model(Packs{}).Where("pack_id = ?", packs.PackId).Take(&packs).Error
	if err != nil {
		return &Packs{}, err
	}
	if gorm.IsRecordNotFoundError(err) {
		return &Packs{}, errors.New("Account Not Found")
	}
	return packs, err
}

func (packCode *PackCode) GetPackCodeDetails(db *gorm.DB) (*PackCode, error) {
	var err error
	err = db.Debug().Model(Packs{}).Where("pack_code_key = ?", packCode.PackCodeKey).Take(&packCode).Error
	if err != nil {
		return &PackCode{}, err
	}
	if gorm.IsRecordNotFoundError(err) {
		return &PackCode{}, errors.New("Account Not Found")
	}
	return packCode, err
}

func (packCode *PackCode) DeleteUsedPackCode(db *gorm.DB) (*PackCode, error) {
	var err error
	err = db.Where("pack_code_id = ?", packCode.PackCodeId).Delete(&packCode).Error
	if err != nil {
		return &PackCode{}, err
	}
	return packCode, nil
}

package modeltests

import (
	"fmt"
	"log"
	"os"
	"testing"

	"github.com/jinzhu/gorm"
	"github.com/joho/godotenv"
	"mocks/api/controllers"
	"mocks/api/models"
)

var server = controllers.Server{}
var userInstance = models.Account{}

func TestMain(m *testing.M) {
	var err error
	err = godotenv.Load(os.ExpandEnv("../../../.env"))
	if err != nil {
		log.Fatalf("Error getting env %v\n", err)
	}
	Database()

	os.Exit(m.Run())
}

func Database() {

	var err error
	TestDbDriver := os.Getenv("TestDB_DRIVER")
	if TestDbDriver == "postgres" {
		DBURL := fmt.Sprintf("host=%s port=%s user=%s dbname=%s sslmode=disable password=%s", os.Getenv("TestDB_HOST"), os.Getenv("TestDB_PORT"), os.Getenv("TestDB_USER"), os.Getenv("TestDB_NAME"), os.Getenv("TestDB_PASSWORD"))
		server.DB, err = gorm.Open(TestDbDriver, DBURL)
		if err != nil {
			fmt.Printf("Cannot connect to %s database\n", TestDbDriver)
			log.Fatal("This is the error:", err)
		} else {
			fmt.Printf("We are connected to the %s database\n", TestDbDriver)
		}
	}
}

func refreshUserTable() error {
	err := server.DB.DropTableIfExists(&models.Account{}).Error
	if err != nil {
		return err
	}
	err = server.DB.AutoMigrate(&models.Account{}).Error
	if err != nil {
		return err
	}
	log.Printf("Successfully refreshed table")
	return nil
}

func seedOneUser() (models.Account, error) {

	refreshUserTable()

	user := models.Account{
		Email:    "pet@gmail.com",
		Password: "password",
	}

	err := server.DB.Model(&models.Account{}).Create(&user).Error
	if err != nil {
		log.Fatalf("cannot seed users table: %v", err)
	}
	return user, nil
}

func seedUsers() error {

	users := []models.Account{
		models.Account{
			Email:    "steven@gmail.com",
			Password: "password",
		},
		models.Account{
			Email:    "kenny@gmail.com",
			Password: "password",
		},
	}

	for i, _ := range users {
		err := server.DB.Model(&models.Account{}).Create(&users[i]).Error
		if err != nil {
			return err
		}
	}
	return nil
}

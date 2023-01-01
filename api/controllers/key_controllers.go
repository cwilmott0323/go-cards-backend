package controllers

//func (server *Server) GenerateAPIKey(w http.ResponseWriter, r *http.Request) {
//	randomBytes := make([]byte, 32)
//	_, err := rand.Read(randomBytes)
//	if err != nil {
//		panic(err)
//	}
//	key := base32.StdEncoding.EncodeToString(randomBytes)[:16]
//
//	approved := server.verifyAccount(w, r)
//	if approved == false {
//		return
//	}
//	server.insertKey(key, w, r)
//}

//func (server *Server) insertKey(key string, w http.ResponseWriter, r *http.Request) {
//
//	vars := mux.Vars(r)
//	uid, err := strconv.ParseUint(vars["id"], 10, 32)
//	if err != nil {
//		responses.ERROR(w, http.StatusBadRequest, err)
//		return
//	}
//
//	APIkey := models.APIKey{
//		AccountId: int64(uid),
//		APIKey:    key,
//	}
//
//	keyInserted, err := APIkey.InsertKey(server.DB)
//	if err != nil {
//		responses.ERROR(w, http.StatusBadRequest, err)
//		return
//	}
//	responses.JSON(w, http.StatusOK, keyInserted)
//}

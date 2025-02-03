package main

import (
	"database/sql"
	"encoding/json"
	"log"
	"net/http"
	"strings"

	"github.com/gorilla/mux"
	_ "github.com/mattn/go-sqlite3"
)

type Item struct {
	Name        string         `json:"name"`
	Description CustomNullString `json:"description"`
	Category    []string       `json:"category"`
	TimeLimit   int            `json:"timeLimit"`
	Status      string         `json:"status"`
	DueDate     CustomNullString `json:"dueDate"`
	Location    CustomNullString `json:"location"`
}

type CustomNullString struct {
	sql.NullString
}

func (ns *CustomNullString) Scan(value interface{}) error {
	if value == nil {
		ns.Valid = false
		ns.String = ""
		return nil
	}
	ns.String, ns.Valid = value.(string)
	return nil
}

func (ns CustomNullString) MarshalJSON() ([]byte, error) {
	if ns.Valid {
		return json.Marshal(ns.String)
	}
	return json.Marshal("")
}

func main() {
	request := mux.NewRouter()
	request.Use(DevCors)
	request.HandleFunc("/items", GetItemsHandler).Methods("GET")

	log.Println("Starting server on :8080")
	http.ListenAndServe(":8080", request)
}

// allow cors
func DevCors(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")
		next.ServeHTTP(w, r)
	})
}

func GetItemsHandler(w http.ResponseWriter, r *http.Request) {
	db, err := sql.Open("sqlite3", "./items.db")
	if err != nil {
		http.Error(w, "Failed to connect to the database", http.StatusInternalServerError)
		log.Fatal(err)
	}
	defer db.Close()

	rows, err := db.Query("SELECT name, description, category, timeLimit, status, dueDate, location FROM items")
	if err != nil {
		http.Error(w, "Failed to retrieve items", http.StatusInternalServerError)
		log.Fatal(err)
	}
	defer rows.Close()

	var items []Item

	for rows.Next() {
		var item Item
		var category string

		err := rows.Scan(&item.Name, &item.Description, &category, &item.TimeLimit, &item.Status, &item.DueDate, &item.Location)
		if err != nil {
			http.Error(w, "Failed to scan item data", http.StatusInternalServerError)
			log.Fatal(err)
		}

		item.Category = splitCategory(category)
		items = append(items, item)
	}

	if err := rows.Err(); err != nil {
		http.Error(w, "Error processing rows", http.StatusInternalServerError)
		log.Fatal(err)
	}

	w.Header().Set("Content-Type", "application/json")
	jsonData, err := json.MarshalIndent(items, "", "    ")
	if err != nil {
		http.Error(w, "Failed to convert items to JSON", http.StatusInternalServerError)
		log.Fatal(err)
	}

	w.Write(jsonData)
}

func splitCategory(categories string) []string {
	if categories == "" {
		return []string{}
	}
	return strings.Split(categories, ",")
}

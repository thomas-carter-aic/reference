package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, `{"message": "Hello from Go Service!"}`)
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("🚀 Go service running on port 3002")
	http.ListenAndServe(":3002", nil)
}

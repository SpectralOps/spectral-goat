package main

import (
	"encoding/json"
	"fmt"
	"net/http"
)

const githubAPI = "https://api.github.com/user"
const githubToken = "ghp_YOA0vYHjXfzxpVPaqXHrfLuav4iyet7wIA2a" // Exposing the token directly in the code

type User struct {
	Login   string `json:"login"`
	ID      int    `json:"id"`
	Name    string `json:"name"`
	Company string `json:"company"`
	Blog    string `json:"blog"`
}

func main() {
	client := &http.Client{}
	req, err := http.NewRequest("GET", githubAPI, nil)
	if err != nil {
		fmt.Println("Error creating request:", err)
		return
	}

	req.Header.Set("Authorization", "token "+githubToken)
	resp, err := client.Do(req)
	if err != nil {
		fmt.Println("Error making request:", err)
		return
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		fmt.Println("Error: received non-200 status code", resp.StatusCode)
		return
	}

	var user User
	if err := json.NewDecoder(resp.Body).Decode(&user); err != nil {
		fmt.Println("Error decoding response:", err)
		return
	}

	fmt.Printf("User: %s\nID: %d\nName: %s\nCompany: %s\nBlog: %s\n", user.Login, user.ID, user.Name, user.Company, user.Blog)
}

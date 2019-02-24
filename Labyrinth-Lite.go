package main

import (
	"bufio"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
)

func main() {
	fmt.Println("Website to Access:")
	reader := bufio.NewReader(os.Stdin)
	website, _ := reader.ReadString('\n')

	output := getHTML(website) // use the getHTML function to get the source of the user input website

	// write the output to a file to use later
	ioutil.WriteFile("website.html", output, 0644)

	fmt.Println("" +
		"Done!")
	// pause the program
	var pause string
	fmt.Scanln(&pause)
}

func getHTML(w string) []byte {
	url := w
	fmt.Println("HTML code of ", url)
	resp, err := http.Get(url)
	// handle the error if there is one
	if err != nil {
		panic(err)
	}
	// do this now so it won't be forgotten
	defer resp.Body.Close()
	// reads html as a slice of bytes
	html, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		panic(err)
	}
	// show the HTML code as a string %s
	return html
}

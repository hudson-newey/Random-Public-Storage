package main

import (
	"os" 
	"fmt"
	"log"
	"io/ioutil"
	"net/http"
	"strings"
	"bufio"
)

var replacer = strings.NewReplacer("get ", "")
func main() {
	for ok := true; ok; ok = true {
		dir, err := os.Getwd()
		if err != nil {
			log.Fatal(err)
		}
	  fmt.Print(dir + "$", " ")

	  // user input
	  scanner := bufio.NewScanner(os.Stdin)
	  var text string
	  scanner.Scan()
	  text = scanner.Text()
	  command := text

	  // start of command if statements
	  testingCommand := command
	  if (command == "clear" || command == "cls") { fmt.Println("\033c") }
	  if (command == "exit") { os.Exit(1) }
	  if (strings.Contains(testingCommand, "cd")) { // chnage directory
		newdir := strings.Replace(command, "cd ", "", 1)
		os.Chdir(newdir)
	  }

	  // list directory
	  if (command == "ls") {
		files, err := ioutil.ReadDir("./")
		if err != nil {
			log.Fatal(err)
		}
	
		for _, f := range files {
				fmt.Println(f.Name())
		}
	  }

	  //imports
	  if (strings.Contains(testingCommand, "get")) {

		// TAKE GET OUT OF THE STRING
		str := command
		str = replacer.Replace(str)

		output := getHTML(str)
		importdata := string(output[:])

		err := ioutil.WriteFile(str + ".txt", []byte(importdata), 0755)
		if err != nil { // if there was an error creating the file go here
			fmt.Printf("Unable to write file: %v", err)
		}
	  }


	  // END
	}
}

func getHTML(w string) []byte {
	url := "https://pastebin.com/raw/" + w
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

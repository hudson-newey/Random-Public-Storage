/*
Wire Tap Copyright (C) 2018 Grathium Sofwares <grathiumsoftwears@gmail.com>
	This program comes with ABSOLUTELY NO WARRANTY
	This is a free software, and you are welcome to redistribute it under certain
	conditions.
*/

package main

import (
	"os"
	"fmt"
	"log"
	"io/ioutil"
	"io"
	"net/http"
	"strings"
	"bufio"
	"os/exec"
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
	  if (strings.Contains(testingCommand, "cd ")) { // chnage directory
			os.Chdir(strings.Replace(command, "cd ", "", 1))
	  }
		if (strings.Contains(testingCommand, "rm ")) { // delete file
			os.Remove(strings.Replace(command, "rm ", "", 1))
		}
		if (strings.Contains(testingCommand, "cat ")) { // read out contents of file
			readFile(strings.Replace(command, "cat ", "", 1))
		}
		if (strings.Contains(testingCommand, "s/ ")) {
			exec.Command(strings.Replace(command, "s/ ", "", 1))
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
		fmt.Println(str)

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

func readFile(path string) bool {
    // Open file for reading.
    var file, err = os.OpenFile(path, os.O_RDWR, 0644)
    if isError(err) {
        return false
    }
    defer file.Close()

    // Read file, line by line
    var text = make([]byte, 1024)
    for {
        _, err = file.Read(text)

        // Break if finally arrived at end of file
        if err == io.EOF {
            break
        }

        // Break if error occured
        if err != nil && err != io.EOF {
            isError(err)
            break
        }
    }

    fmt.Println(string(text)) //output
		return true
}

/* error checking function */
func isError(err error) bool {
    if err != nil {
        fmt.Println(err.Error())
    }

    return (err != nil)
}

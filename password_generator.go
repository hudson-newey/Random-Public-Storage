package main
import (
	"fmt"
	"math/rand"
	"time"
	)


var output string = ""
func main() {
	for ok := true; ok; ok = true {
		for i := 0; i < 24; i++ {
			time.Sleep(time.Duration(10) * time.Microsecond) // wait a big because go is so god-damn fast
		
			rand.Seed(time.Now().UTC().UnixNano())
			output = output + randomString(1)
		}
		
		fmt.Println(output) //OUTPUT PASSWORD
		
		// pause the program
		var pause string
		fmt.Scanln(&pause)
		
		output = ""
	} // loop and reset the program if the user wants a new password
	
// end of main function
}

func randomString(l int) string {
    bytes := make([]byte, l)
    for i := 0; i < l; i++ {
        bytes[i] = byte(randInt(65, 90))
    }
    return string(bytes)
}

func randInt(min int, max int) int {
    return min + rand.Intn(max-min)
}

package main

import (
	"os"
	"fmt"
	"strings"
)

func main() {
	arabicValue := RomanValue{readArg()}.ToArabic()

	fmt.Println(arabicValue)
}

func readArg() string {
	if len(os.Args) < 2 {
		panic("Invalid number of arguments")
	}
	return os.Args[1]
}

func romanToInt(s string) int {
	return map[string]int{
		"i": 1,
		"v": 5,
		"x": 10,
		"l": 50,
		"c": 100,
		"d": 500,
		"m": 1000,
	}[strings.ToLower(s)]
}

type RomanValue struct {
	value string
}

func (r RomanValue) At(index int) string {
	return r.value[index:index+1]
}

func (r RomanValue) Length() int {
	return len(r.value)
}

func (r RomanValue) ToArabic() int {
	arabicValue := 0

	for i := 0; i < r.Length(); i++ {
		currChar := r.At(i)

		if i + 1 < r.Length() {
			peekChar := r.At(i + 1)

			if romanToInt(currChar) >= romanToInt(peekChar) {
				arabicValue += romanToInt(currChar)
			} else {
				arabicValue += (romanToInt(peekChar) - romanToInt(currChar))
				i++
			}

		} else {
			arabicValue += romanToInt(currChar)
		}

	}

	return arabicValue
}

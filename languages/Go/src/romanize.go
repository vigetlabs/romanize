package main

import (
	"os"
	"fmt"
	"strconv"
	"bytes"
)

var RD = [9]string{"I", "V", "X", "L", "C", "D", "M", "", ""}

func main() {
	romanValue := ArabicValue{readArg()}.ToRoman()

	fmt.Println(romanValue)
}

func readArg() int {
	if len(os.Args) < 2 {
		panic("Invalid number of arguments")
	}

	val, err := strconv.Atoi(os.Args[1])
	if err != nil {
		panic("Invalid number argument")
	}

	return val
}

func romanizeDigit(d, p int) string {
	switch d {
		case 1: return RD[2*p]
		case 2: return RD[2*p]   + RD[2*p]
		case 3: return RD[2*p]   + RD[2*p]   + RD[2*p]
		case 4: return RD[2*p]	 + RD[2*p+1]
		case 5: return RD[2*p+1]
		case 6: return RD[2*p+1] + RD[2*p]
		case 7: return RD[2*p+1] + RD[2*p]   + RD[2*p]
		case 8: return RD[2*p+1] + RD[2*p]   + RD[2*p] + RD[2*p]
		case 9: return RD[2*p]   + RD[2*p+2]
	}
	return ""
}

type ArabicValue struct {
	value int
}

func (a ArabicValue) ToRoman() string {
	parts := make(map[int]int)

	val := a.value

	parts[3] = val / 1000
	val -= parts[3] * 1000
	parts[2] = val / 100
	val -= parts[2] * 100
	parts[1] = val / 10
	val -= parts[1] * 10
	parts[0] = val

	var romanValue bytes.Buffer

	for i := 3; i >= 0; i-- {
		romanValue.WriteString(romanizeDigit(parts[i], i))
	}

	return romanValue.String()
}

package main

import (
	"fmt"
	"reflect"
)

type data struct {
	d int
	n string
}

func main() {
	s := data{12, "string"}
	va := reflect.ValueOf(s)
	fmt.Println(va)
}

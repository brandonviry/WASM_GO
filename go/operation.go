package main

import (
    "syscall/js"

)

func add(this js.Value, i []js.Value) interface{} {
    sum := i[0].Int() 

    for index := 1; index < len(i); index++ {
        sum += i[index].Int()
    }
    return js.ValueOf(sum)
}

func moy(this js.Value, i []js.Value) interface{} {
    m := i[0].Int() 

    for index := 1; index < len(i); index++ {
        m += i[index].Int()
    }
    return js.ValueOf(m/len(i))
}

func subtract(this js.Value, i []js.Value) interface{} {
    difference := i[0].Int() - i[1].Int()
    return js.ValueOf(difference)
}

func multi(this js.Value,arg []js.Value) interface{} {
    return js.ValueOf(arg[0].Int()*arg[1].Int())
}


func registerCallbacks() {
    js.Global().Set("add", js.FuncOf(add))
    js.Global().Set("subtract", js.FuncOf(subtract))
    js.Global().Set("multi", js.FuncOf(multi))
    js.Global().Set("moyenne", js.FuncOf(moy))
}



func main() {
    c := make(chan struct{}, 0)
    registerCallbacks()

    <-c
    select {}
}

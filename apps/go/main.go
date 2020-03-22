package main

import (
    "fmt"
    "os"
    "time"
)

func main() {
    fmt.Println("START!!!!")
    var sum float64
    count := 5

    for i := 0; i < count; i++ {
        start := time.Now()

        fi, err := os.Open("/fixtures/sample.csv")
        if err != nil {panic(err)}
        fo, err := os.Create("./sample.csv")
        if err != nil {panic(err)}

        buffer := make([]byte, 1024)
        for {
            n, err := fi.Read(buffer)
            if n == 0 {
                break
            }
            if err != nil {panic(err)}

            fo.Write(buffer[:n])
        }

        end := time.Now()
        result := (end.Sub(start)).Seconds()
        sum = sum + result
        fmt.Printf("Time Result: %.4f\n", result)
    }

    fmt.Printf("Average: %.4f\n", sum / float64(count))
}
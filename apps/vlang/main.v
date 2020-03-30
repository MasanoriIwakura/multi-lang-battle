//#include <stdio.h>

import os
import time

fn main() {
	println('Hello, Vlang')

	count := 5
	mut sum := 0.0

	mut i := 0
	for i < count {
		println('START!!!!!')
		start := time.ticks()

    file := os.read_file('/fixtures/sample.csv') or {
      println('File open error.')
      exit
    }

    mut ofile := os.open('./sample.csv') or {
      println('File open error.')
      println(err)
      exit
    }

    ofile.write(file)

    ofile.close()

    end := time.ticks()
		t := end - start
    println(t)
		sum = sum + f64(t) * 1000
		C.printf('Time Result: %.4f\n', t * 1000)
		i++
	}
}

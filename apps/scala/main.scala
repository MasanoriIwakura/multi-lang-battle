import java.io.File
import java.io.PrintWriter

import scala.io.Source

object Main {
  def main(args: Array[String]) {
    val COUNT = 5
    val FILE = "/fixtures/sample.csv"
    val OFILE = "./sample.csv"
    var sum = 0.0

    println("START!!!!!!!!")

    for (i <- 1 to COUNT) {
      val start = System.currentTimeMillis
      val writer = new PrintWriter(new File(OFILE))

      for (line <- Source.fromFile(FILE).getLines) {
        writer.write(line + "\n")       
      }
      writer.close

      val end = System.currentTimeMillis
      val time = (end - start) / 1000.toDouble
      sum = sum + time

      printf("Time Result: %.4f\n", time)
    }

    printf("Scala Average: %.4f\n", sum / COUNT)
  }
}

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

class Main {
  public static void main(String[] args) throws IOException {
    final var COUNT = 5;
    final var FILE = Paths.get("/fixtures/sample.csv");
    final var OFILE = Paths.get("./sample.csv");
    var sum = 0.0;

    System.out.println("START!!!!!");

    for (var i = 0; i < COUNT; i++) {
      var start = System.currentTimeMillis();
      try (BufferedReader br = Files.newBufferedReader(FILE);
        var bw = Files.newBufferedWriter(OFILE)) {
        String line;
        while ((line = br.readLine()) != null) {
          bw.write(line + "\n");
        }
      }

      var end = System.currentTimeMillis();
      var time = (double) (end - start) / 1000;
      sum += time;

      System.out.printf("Time Result: %.4f\n", time);
    }

    System.out.printf("Java Average: %.4f\n", sum / COUNT);
  }
}

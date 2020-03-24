import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

class Main {
  public static void main(String[] args) throws IOException {
    final int COUNT = 5;
    final Path FILE = Paths.get("/fixtures/sample.csv");
    final Path OFILE = Paths.get("./sample.csv");
    double sum = 0;

    System.out.println("START!!!!!");

    for (int i = 0; i < COUNT; i++) {
      long start = System.currentTimeMillis();
      try (BufferedReader br = Files.newBufferedReader(FILE);
        BufferedWriter bw = Files.newBufferedWriter(OFILE)) {
        String line;
        while ((line = br.readLine()) != null) {
          bw.write(line + "\n");
        }
      }

      long end = System.currentTimeMillis();
      double time = (double) (end - start) / 1000;
      sum += time;

      System.out.printf("Time Result: %.4f\n", time);
    }

    System.out.printf("Java Average: %.4f\n", sum / COUNT);
  }
}


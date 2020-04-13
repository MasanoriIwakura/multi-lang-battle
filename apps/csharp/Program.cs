using System.IO;
using System;

namespace csharp
{
    class Program
    {
        static void Main(string[] args)
        {
            const int COUNT = 3;
            double sum = 0;
            var stopwatch = new System.Diagnostics.Stopwatch();

            Console.WriteLine("START!!!!");

            for (var i = 0; i < COUNT; i++)
            {
                stopwatch.Start();

                using (var sr = new StreamReader("/fixtures/sample.csv"))
                using (var sw = new StreamWriter("./sample.csv"))
                {
                    string line;
                    while ((line = sr.ReadLine()) != null)
                    {
                        sw.WriteLine(line);
                    }
                }

                stopwatch.Stop();
                TimeSpan ts = stopwatch.Elapsed;
                Console.WriteLine($"{ts.Seconds}.{ts.Milliseconds}");
                sum += ts.TotalMilliseconds / 1000;
                stopwatch.Reset();
            }

            Console.WriteLine("C# Average: {0:F4}", (float) sum / COUNT);
        }
    }
}

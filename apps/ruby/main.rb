# frozen_string_literal: true

def main
  count = 5
  sum = 0

  puts 'START!!!!!!'

  (1..count).each do |i|
    start = Time.now

    File.open('/fixtures/sample.csv', 'r') do |f|
      File.open('./sample.csv', 'w') do |of|
        f.each_line do |line|
          of.puts(line)
        end
      end
    end

    e = Time.now
    t = e - start
    sum += t

    printf("Time Result: %.4f\n", t)
  end

  printf("Ruby Average: %.4f\n", sum / count)
end

main

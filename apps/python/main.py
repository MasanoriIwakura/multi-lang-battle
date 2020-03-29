import time

def main():
    print('START!!!!!!')
    count = 5
    sum = 0;

    for i in range(count):
        start = time.time()
        with open('/fixtures/sample.csv', mode='r') as f:
            with open('./sample.csv', mode='w') as of:
                while True:
                    line = f.readline()
                    of.write(line)
                    if not line:
                        break

        end = time.time()
        result = end - start
        sum += result
        print("Time Result: %.4f" %(result))

    print("Python Average: %.4f" %(sum / count))

if __name__ == '__main__':
    main()


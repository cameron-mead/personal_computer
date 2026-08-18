from time import sleep
import random

lines = []

# import random lines from file and populates lines
def import_lines():
    global lines
    with open('/home/cameron/.scripts/silly/random_lines.txt', 'r') as file:
        lines = file.readlines()

# return random line from file
def get_line():
    return random.choice(lines).strip()

# return random interval from, 0.1 to 1.1 seconds
def get_interval():
    return random.uniform(0.01, 0.25)

def main():
    import_lines()
    total = 0
    try:
        while True:
            print(get_line())
            interval = get_interval()
            total += interval
            sleep(interval)
    except KeyboardInterrupt:
        print('aret operand detected --> signify end of process\n\n\nprocess completed in ' + str(total) + ' seconds\nexiting . . . . .')

if __name__ == '__main__':
    main()

from time import sleep
import random

lines = []

# import random lines from file and populates lines
def import_lines():
    global lines
    with open('random_lines.txt', 'r') as file:
        lines = file.readlines()

# return random line from file
def get_line():
    return random.choice(lines).strip()

# return random interval from, 0.1 to 1.1 seconds
def get_interval():
    return random.uniform(0.01, 0.15)

def main():
    import_lines()
    while True:
        print(get_line())
        sleep(get_interval())

if __name__ == '__main__':
    main()

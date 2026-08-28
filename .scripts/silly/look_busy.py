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
    previous_line = ''
    total_time = 0
    total_operations = 0
    try:
        while True:
            line = get_line()
            if previous_line != line:
                previous_line = line
                print(line)    
                interval = get_interval()
                total_time += interval
                total_operations += 1
                sleep(interval)
    except KeyboardInterrupt:
        print('aret operand detected --> signify end of process\n\n\n' + str(total_operations) + ' processes completed in ' + str(total_time) + ' seconds\nexiting . . . . .')

if __name__ == '__main__':
    main()

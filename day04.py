from re import split

def get_answer_part_1(filepath):
    count = 0
    with open(filepath, 'r') as f:
        line = f.readline().strip()
        while line:
            ls = [int(x) for x in split(',|-', line)]
            if (ls[0] == ls[2]) | (ls[1] == ls[3]):
                count += 1
            elif (ls[0] < ls[2]):
                if (ls[1] > ls[3]):
                    count += 1
            elif (ls[2] < ls[0]) & (ls[3] > ls[1]):
                count += 1
            line = f.readline().strip()
    return count



print("PART 1")
print(get_answer_part_1("input/day04_test.txt"))
print(get_answer_part_1("input/day04.txt"))

def get_answer_part_2(filepath):
    count = 0
    with open(filepath, 'r') as f:
        line = f.readline().strip()
        while line:
            ls = [int(x) for x in split(',|-', line)]
            if (ls[0] <= ls[2]) & (ls[1] >= ls[2]):
                    count += 1
            elif (ls[0] <= ls[3]) & (ls[1] >= ls[3]):
                count += 1
            elif (ls[2] <= ls[0]) & (ls[3] >= ls[0]):
                count += 1
            elif (ls[2] <= ls[1]) & (ls[3] >= ls[1]):
                count += 1
            line = f.readline().strip()
    return count

print("PART 2")
print(get_answer_part_2("input/day04_test.txt"))
print(get_answer_part_2("input/day04.txt"))

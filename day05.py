import re

ls1_test = ["Z", "N"]
ls2_test = ["M", "C", "D"]
ls3_test = ["P"]
ls_test = [[], ls1_test, ls2_test, ls3_test]

ls1 = ["H", "R", "B", "D", "Z", "F", "L", "S"]
ls2 = ["T", "B", "M", "Z", "R"]
ls3 = ["Z", "L", "C", "H", "N", "S"]
ls4 = ["S", "C", "F", "J"]
ls5 = ["P", "G", "H", "W", "R", "Z", "B"]
ls6= ["V", "J", "Z", "G", "D", "N", "M", "T"]
ls7 = ["G", "L", "N", "W", "F", "S", "P", "Q"]
ls8 = ["M", "Z", "R"]
ls9 = ["M", "C", "L", "G", "V", "R", "T"]
ls = [[], ls1, ls2, ls3, ls4, ls5, ls6, ls7, ls8, ls9]

def move_crates_one_at_a_time(count, start, end, stacks):
    for i in range(count):
        stacks[end].append(stacks[start].pop())
    return stacks

def get_top_crates(stacks):
    top_crates = ""
    for i in range(1, len(stacks)):
        if stacks[i]:
            top_crates += stacks[i][-1]
        else:
            top_crates += "_"
    return top_crates

def move_crates_as_stack(count, start, end, stacks):
    start_stack = stacks[start]
    crates = start_stack[(len(start_stack)-count):len(start_stack)]
    stacks[end].extend(crates)
    del start_stack[(len(start_stack)-count):len(start_stack)]
    return stacks

def get_answer_part_1(filepath, stacks):
    with open(filepath, 'r') as f:
        line = f.readline().strip()
        while line:
            operation = re.findall(r"\d+", line)
            stacks = move_crates_one_at_a_time(int(operation[0]), int(operation[1]), int(operation[2]), stacks)
            line = f.readline().strip()
        return get_top_crates(stacks)

def get_answer_part_2(filepath, stacks):
    with open(filepath, 'r') as f:
        line = f.readline().strip()
        while line:
            operation = re.findall(r"\d+", line)
            stacks = move_crates_as_stack(int(operation[0]), int(operation[1]), int(operation[2]), stacks)
            line = f.readline().strip()
        return get_top_crates(stacks)


print("PART 1")
#Don't run part 1 and part 2 at the same time, part 1 reorganises the stacks
#print(get_answer_part_1("input/day05_test.txt", ls_test))
#print(get_answer_part_1("input/day05.txt", ls))
print("PART 2")
print(get_answer_part_2("input/day05_test.txt", ls_test))
print(get_answer_part_2("input/day05.txt", ls))

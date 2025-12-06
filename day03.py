# part 1
def get_answer_1(filepath):
    with open(filepath, 'r') as f:
        ls = [line.strip() for line in f.readlines()]
    return sum([get_number_representation(get_duplicate_items(get_compartment_contents(l))) for l in ls])

def get_compartment_contents(rucksack: str) -> tuple[str]:
    halfway = int(len(rucksack)/2)
    first = rucksack[:halfway]
    second = rucksack[halfway:]
    return (first, second)

def get_duplicate_items(compartments: tuple[str]) -> set[str]:
    result = set(compartments[0])
    for i in range(1, len(compartments)):
        result = result.intersection(set(compartments[i]))
    return result


def get_number_representation(item: set[str]) -> int:
    item = list(item)
    if item[0].islower():
        return ord(item[0]) - 96
    else:
        return ord(item[0]) - 38

print("PART 1")
print(get_answer_1("input/day03_test.txt"))
print(get_answer_1("input/day03.txt"))

def get_answer_2(filepath: str, group_size=1) -> int:
    with open(filepath, 'r') as f:
        line = f.readline().strip()
        ls = []
        while line:
            group = []
            for i in range(group_size):
                group.append(line)
                line = f.readline().strip()
            ls.append(group)
    return sum([get_number_representation(get_duplicate_items(l)) for l in ls])

print("PART 2")
print(get_answer_2("input/day03_test.txt", 3))
print(get_answer_2("input/day03.txt", 3))
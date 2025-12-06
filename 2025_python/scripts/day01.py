

def parse_file(filepath: str) -> list[int]:
    with open(filepath, 'r') as f:
        line = f.readline()
        rotations = []
        while line:
            direction = line[0]
            amount = int(line[1:])
            if direction == 'R':
                rotations.append(amount)
            if direction == 'L':
                rotations.append(-amount)

            line = f.readline()
    return rotations

def rotate(position: int, rotations: int, max: int = 100) -> int:
    new_position = (position + rotations) % max
    return new_position

def get_all_positions(rotations: list[int], start_position: int = 50):
    position = start_position
    all_positions = [position]
    for rotation in rotations:
        position = rotate(position, rotation)
        all_positions.append(position)
    return all_positions


def part_one(filepath="./inputs/day01.txt") -> int:
    rotations =  parse_file(filepath)
    all_positions = get_all_positions(rotations)
    nr_of_zeros = 0
    for position in all_positions:
        if position == 0:
            nr_of_zeros += 1
    return nr_of_zeros


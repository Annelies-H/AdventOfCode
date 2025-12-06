def get_start_of_packet_marker_position(input: str, window_size: int) -> int:
    for i in range (3, len(input)):
        window = set(input[(i-window_size):i])
        if len(window) == window_size:
            return i


def get_answer_part_1(filepath):
    with open(filepath, 'r') as f:
        input = f.readline().strip()
        return get_start_of_packet_marker_position(input, 4)

def get_answer_part_2(filepath):
    with open(filepath, 'r') as f:
        input = f.readline().strip()
        return get_start_of_packet_marker_position(input, 14)

print("PART 1")
print(get_answer_part_1("input/day06_test.txt"))
print(get_answer_part_1("input/day06.txt"))
print("PART 2")
print(get_answer_part_2("input/day06_test.txt"))
print(get_answer_part_2("input/day06.txt"))
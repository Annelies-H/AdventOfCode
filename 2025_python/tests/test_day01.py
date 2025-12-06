from scripts.day01 import get_all_positions, parse_file, rotate, part_one


def test_parse_file():
    result = parse_file(filepath="./2025_python/tests/inputs/day01.txt")
    assert result == [-68, -30, 48, -5, 60, -55, -1, -99, 14, -82]
    print(result)

def test_rotate():
    # positive rotations
    assert rotate(position=0, rotations=8) == 8
    assert rotate(position=99, rotations=1) == 0
    assert rotate(position=95, rotations=60) == 55

    # negative rotations
    assert rotate(position=5, rotations=-5) == 0
    assert rotate(position=0, rotations=-1) == 99
    assert rotate(position=14, rotations=-82) == 32

def test_all_positions():
    rotations = [-68, -30, 48, -5, 60, -55, -1, -99, 14, -82]
    all_positions = get_all_positions(rotations=rotations)
    assert all_positions == [50, 82, 52, 0, 95, 55, 0, 99, 0, 14, 32]

def test_run_part_one():
    result = part_one("./2025_python/tests/inputs/day01.txt")
    assert result == 3
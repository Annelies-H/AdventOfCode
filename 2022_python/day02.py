scoring_part_1 = {
    "A X": 4, # rock - rock = draw -> 3 + 1
    "A Y": 8, # rock - paper = win -> 6 + 2
    "A Z": 3, # rock - scissors = lose -> 0 + 3
    "B X": 1, # paper - rock = lose -> 0 + 1
    "B Y": 5, # paper - paper = draw -> 3 + 2
    "B Z": 9, # paper - scissors = win -> 6 = 3
    "C X": 7, # scissors - rock = win -> 6 + 1
    "C Y": 2, # scissors - paper = lose -> 0 + 2
    "C Z": 6, # scissors - scissors = draw -> 3 = 3
}



scoring_part_2 = {
    "A X": 3, # rock - lose = scissors -> 0 + 3
    "A Y": 4, # rock - draw = rock -> 3 + 1
    "A Z": 8, # rock - win = paper -> 6 + 2
    "B X": 1, # paper - lose = rock -> 0 + 1
    "B Y": 5, # paper - draw = paper-> 3 + 2
    "B Z": 9, # paper - win = scissors -> 6 + 3
    "C X": 2, # scissors - lose = paper -> 0 + 2
    "C Y": 6, # scissors - draw = scissors -> 3 + 3
    "C Z": 7, # scissors - win = rock -> 6 + 1
}

def get_total_score(filepath, scoring):
    total_score = 0
    with open(filepath, 'r') as f:
        line = f.readline()
        while line:
            total_score += scoring[line.strip()]
            line = f.readline()
    return total_score

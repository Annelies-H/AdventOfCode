
#part 1
def get_max_calories(filepath):
    max_calories = 0
    with open(filepath, 'r') as f:
        current_calories = 0
        line = f.readline()
        while line:
            entry = line.strip()
            if entry:
                current_calories += int(entry)
            else:
                max_calories = max(max_calories, current_calories)
                current_calories = 0
            line = f.readline()
        max_calories = max(max_calories, current_calories)
    return max_calories

#part 2
def get_calories_top_x_elves(filepath, x=1):
    calories_per_elf = []
    with open(filepath, 'r') as f:
        current_calories = 0
        line = f.readline()
        while line:
            entry = line.strip()
            if entry:
                current_calories += int(entry)
            else:
                calories_per_elf.append(current_calories)
                current_calories = 0
            line = f.readline()
        calories_per_elf.append(current_calories)
    calories_per_elf.sort(reverse=True)
    return sum(calories_per_elf[:x])


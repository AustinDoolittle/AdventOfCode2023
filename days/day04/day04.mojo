from math import min, max

# alias DATA_FILE = "small.txt"
alias DATA_FILE = "large.txt"

alias MAX_RED = 12 
alias RED = "red"
alias RED_IDX = 0
alias MAX_GREEN = 13
alias GREEN = "green"
alias GREEN_IDX = 1
alias MAX_BLUE = 14
alias BLUE = "blue"
alias BLUE_IDX = 2


fn part1() raises -> Int:
    let text_path = Path(DATA_FILE)
    let f = open(text_path, "r")

    let text_lines = f.read().split("\n")
    var num_dupes = DynamicVector[Int](len(text_lines))
    for i in range(len(num_dupes)):
        num_dupes[i] = 1
    
    var running_sum = 0
    for i in range(len(text_lines)):
        let curr_line = text_lines[i]
        let split_line = curr_line.split(":")[1].split("|")
        let winning_numbers = split_line[0].split(" ")
        let my_numbers = split_line[1].split(" ")
        var winning_numbers_vec = DynamicVector[UInt8](100)
        
        for j in range(100):
            winning_numbers_vec[j] = 0
        
        for j in range(len(winning_numbers)):
            if len(winning_numbers[j]) == 0:
                continue
            
            let winning_number = atol(winning_numbers[j])
            winning_numbers_vec[winning_number] = 1
        
        var num_matches = 0
        for j in range(len(my_numbers)):
            if len(my_numbers[j]) == 0:
                continue
            
            let my_number = atol(my_numbers[j])
            if winning_numbers_vec[my_number] == 1:
                num_matches += 1

        if num_matches > 0:
            running_sum += 2 ** (num_matches-1)

    return running_sum

                

fn part2() raises -> Int:
    let text_path = Path(DATA_FILE)
    let f = open(text_path, "r")

    let text_lines = f.read().split("\n")
    var num_dupes = DynamicVector[Int](len(text_lines))
    for i in range(len(text_lines)):
        print(i)
        num_dupes[i] = 1
    
    var running_sum = 0
    for i in range(len(text_lines)):
        let curr_line = text_lines[i]
        let split_line = curr_line.split(":")[1].split("|")
        let winning_numbers = split_line[0].split(" ")
        let my_numbers = split_line[1].split(" ")
        var winning_numbers_vec = DynamicVector[UInt8](100)
        
        for j in range(100):
            winning_numbers_vec[j] = 0
        
        for j in range(len(winning_numbers)):
            if len(winning_numbers[j]) == 0:
                continue
            
            let winning_number = atol(winning_numbers[j])
            winning_numbers_vec[winning_number] = 1
        
        var num_matches = 0
        for j in range(len(my_numbers)):
            if len(my_numbers[j]) == 0:
                continue
            
            let my_number = atol(my_numbers[j])
            if winning_numbers_vec[my_number] == 1:
                num_matches += 1

        print(running_sum)
        running_sum += num_dupes[i]
        print(running_sum)
        for j in range(i+1, i+num_matches+1):
            num_dupes[j] += num_dupes[i]

    return running_sum

fn main() raises:
    let part1_solution = part1()
    print("part 1")    
    print(part1_solution)
    print()

    let part2_solution = part2()
    print("part 2")
    print(part2_solution)
    print()

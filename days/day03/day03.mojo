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
    var running_sum = 0
    for i in range(len(text_lines)):
        if len(text_lines[i]) == 0:
            break
        
        let curr_line = text_lines[i]

        var line_idx = 0
        while line_idx < len(curr_line):
            if not isdigit(curr_line._buffer[line_idx]):
                line_idx += 1 
                continue
            
            var offset = line_idx
            var part_number = 0
            while offset < len(curr_line) and isdigit(curr_line._buffer[offset]):
                part_number = part_number * 10 + atol(curr_line[offset])
                offset += 1
            
            # check if this is a valid part number
            var is_valid_part = False
            for delta_i in range(max(i-1, 0), min(i+2, len(text_lines)), 1):
                for delta_j in range(max(line_idx-1, 0), min(offset+1, len(curr_line)), 1):
                    if delta_i == i and (delta_j >= line_idx and delta_j < offset):
                        continue 

                    if not isdigit(text_lines[delta_i]._buffer[delta_j]) and text_lines[delta_i][delta_j] != ".":
                        is_valid_part = True
                        break
                
                if is_valid_part:
                    break
            
            if is_valid_part:
                running_sum += part_number

            line_idx = offset

    return running_sum
                

fn part2() raises -> Int:
    let text_path = Path(DATA_FILE)
    let f = open(text_path, "r")

    let text_lines = f.read().split("\n")
    var running_sum = 0
    for i in range(len(text_lines)):
        if len(text_lines[i]) == 0:
            break
        
        let curr_line = text_lines[i]

        var line_idx = 0
        while line_idx < len(curr_line):
            if not curr_line[line_idx] == "*":
                line_idx += 1 
                continue

            var found_left = False
            var left_val = -1
            var found_right = False
            var right_val = -1

            for delta_i in range(max(i-1, 0), min(i+2, len(text_lines)), 1):
                var delta_j = max(line_idx-1, 0)
                while delta_j < min(line_idx+2, len(curr_line)):
                    if (delta_i == i and delta_j == line_idx) or not isdigit(text_lines[delta_i]._buffer[delta_j]):
                        delta_j +=1
                        continue
                    
                    var digit_start = delta_j
                    while digit_start > 0:
                        if not isdigit(text_lines[delta_i]._buffer[digit_start-1]):
                            break
                        
                        digit_start -= 1

                    var digit_idx = digit_start
                    var digit_val = 0
                    while digit_idx < len(text_lines[delta_i]) and isdigit(text_lines[delta_i]._buffer[digit_idx]):
                        digit_val = digit_val * 10 + atol(text_lines[delta_i][digit_idx])
                        digit_idx += 1 
                    
                    delta_j = digit_idx
                    
                    if not found_left:
                        found_left = True
                        left_val = digit_val
                    elif not found_right:
                        found_right = True
                        right_val = digit_val
                    else:
                        return -1
            
            line_idx += 1

            if found_left and found_right:
                running_sum += left_val * right_val

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

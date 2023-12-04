
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
    var valid_sum = 0
    for i in range(len(text_lines)):
        var is_valid = True
        if len(text_lines[i]) == 0:
            break
        
        let split_line = text_lines[i].split(":")
        let reveal_strs = split_line[1].split(";")
        for j in range(len(reveal_strs)):
            let cubes_strs = reveal_strs[j].split(",")
            for k in range(len(cubes_strs)):
                var char_idx = 0
                let cube_str = cubes_strs[k][1:]  # strip leading space
                var num_cubes = 0
                while isdigit(cube_str._buffer[char_idx]):
                    num_cubes = num_cubes * 10 + atol(cube_str[char_idx])

                    char_idx += 1
                
                let color_str = cube_str[char_idx+1:]
                if (color_str == BLUE and num_cubes > MAX_BLUE) \
                    or (color_str == GREEN and num_cubes > MAX_GREEN) \
                    or (color_str == RED and num_cubes > MAX_RED):
                    is_valid = False
                    break
            
            if not is_valid:
                break
        if is_valid:
            valid_sum += (i + 1)
    return valid_sum
                

fn part2() raises -> Int:
    let text_path = Path(DATA_FILE)
    let f = open(text_path, "r")

    let text_lines = f.read().split("\n")
    var running_sum = 0
    for i in range(len(text_lines)):
        if len(text_lines[i]) == 0:
            break
        
        let split_line = text_lines[i].split(":")
        let reveal_strs = split_line[1].split(";")
        var max_vals = StaticIntTuple[3](0, 0, 0)

        for j in range(len(reveal_strs)):
            let cubes_strs = reveal_strs[j].split(",")
            for k in range(len(cubes_strs)):
                var char_idx = 0
                let cube_str = cubes_strs[k][1:]  # strip leading space
                var num_cubes = 0
                while isdigit(cube_str._buffer[char_idx]):
                    num_cubes = num_cubes * 10 + atol(cube_str[char_idx])

                    char_idx += 1
                
                let color_str = cube_str[char_idx+1:]
                let color_idx: Int
                if color_str == BLUE:
                    color_idx = BLUE_IDX
                elif color_str == RED:
                    color_idx = RED_IDX
                else:  # GREEN
                    color_idx = GREEN_IDX

                if num_cubes > max_vals[color_idx]:
                    max_vals[color_idx] = num_cubes
                
        running_sum += (max_vals[BLUE_IDX] * max_vals[RED_IDX] * max_vals[GREEN_IDX])
    
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

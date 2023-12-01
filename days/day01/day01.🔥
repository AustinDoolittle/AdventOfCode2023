
# alias DATA_FILE = "small.txt"
alias DATA_FILE = "large.txt"


fn str_startswith(target_string: String, prefix: String) -> Bool:
    if len(prefix) > len(target_string):
        return False

    for i in range(len(prefix)):
        if target_string[i] != prefix[i]:
            return False
    
    return True

fn part1() raises -> Int:
    let text_path = Path(DATA_FILE)
    let text_lines = text_path.read_text().split("\n")
    var running_sum = 0
    for i in range(len(text_lines)):
        let line = text_lines[i]
        var found_first_val: Bool = False
        var first_val = -1
        var last_val = -1
        for j in range(len(line)):
            let val: Int
            try:
                val = atol(line[j])
            except:
                val = -1
                continue

            if not found_first_val:
                first_val = val
                found_first_val = True
            
            last_val = val
        
        let new_val = (first_val * 10 + last_val)
        running_sum += new_val

    return running_sum

fn part2() raises -> Int:
    var number_arr = DynamicVector[String]()
    number_arr.append("one")
    number_arr.append("two")
    number_arr.append("three")
    number_arr.append("four")
    number_arr.append("five")
    number_arr.append("six")
    number_arr.append("seven")
    number_arr.append("eight")
    number_arr.append("nine")

    let text_path = Path(DATA_FILE)
    let text_lines = text_path.read_text().split("\n")
    var running_sum = 0
    for i in range(len(text_lines)):
        let line = text_lines[i]
        var found_first_val: Bool = False
        var first_val = -1
        var last_val = -1
        for j in range(len(line)):
            var val: Int = -1
            var found = False
            try:
                val = atol(line[j])
                found = True
            except:
                pass
            
            if not found:
                for k in range(len(number_arr)):
                    let number_word = number_arr[k]

                    if str_startswith(line[j:], number_word):
                        val = k + 1
                        found = True
                        break

            if not found:
                continue

            if not found_first_val:
                first_val = val
                found_first_val = True
            
            last_val = val
        
        let new_val = (first_val * 10 + last_val)
        running_sum += new_val

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
            
        

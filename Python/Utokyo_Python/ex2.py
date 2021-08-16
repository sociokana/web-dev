def calculate_ops(lp):
    init = 0
    for tup in lp:
        if tup[0] == '+':
            init += tup[1]
        elif tup[0] == "-":
            init -= tup[1]
        else:
            print("error")
    return init

    

print(calculate_ops([('+', 3), ('-', 5), ('+', 2), ('+', 1), ('-', 10)]) == -9)
print(calculate_ops([('-', 1), ('-', 2), ('-', 3)]) == -6)
print(calculate_ops([('+', 1), ('+', 2), ('+', 3)]) == 6)
print(calculate_ops([]) == 0)
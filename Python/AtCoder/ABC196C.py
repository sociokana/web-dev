# AtCoder Beginner Contest 196
# Problem C

how_many = int(input())
count = 0

for i in range(0:int(how_many)):
    if i[:range(int(i) / 2)] == i[:-1]:
        count += 1
print(count)

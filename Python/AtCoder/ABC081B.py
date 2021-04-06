#%%
how_many = int(input())
numbs = input()

numbers = numbs.split()

if how_many != len(numbers):
     print("Error!")

#print(numbers)

times = 0
flag = False

while True:
    for i in range(how_many):
        if int(numbers[i]) % 2 == 1:
            flag = True
            break
        else:
            numbers[i] = int(numbers[i]) / 2
            continue
    if flag == True:
        break
    times += 1

print(times)


#%% 

# Pythonic way

ns = int(input())
number_input = list(map(int, input().split()))

#print(len(number_input))

if ns != len(number_input):
     print("Error!")

count = 0

while all(n % 2 == 0 for n in number_input):
    number_input = [n / 2 for n in number_input]
    count += 1

print(count)

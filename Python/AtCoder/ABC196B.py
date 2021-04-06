# AtCoder Beginner Contest 196
# Problem B

number = input()

if number.find('.') == -1:
    print(number)
else:
    print(number[:number.find('.')])
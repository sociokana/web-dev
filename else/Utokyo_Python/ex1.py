# Ex1-1. 三角形の分類
#
# 三角形の三辺の長さとなるべき正数 a, b, c を受け取り、
#
#     三辺が三角形を構成しないならば 0
#     三辺が構成する三角形が鋭角三角形ならば1
#     三辺が構成する三角形が直角三角形ならば2
#     三辺が構成する三角形が鈍角三角形ならば3
#
# を返す関数 classify_triangle(a, b, c) を定義してください。


numbers = []

def classify_triangle(a, b, c):
    numbers = sorted([a, b, c])

    if numbers[-1] >= numbers[0] + numbers[1]:
        return 0
    else:
        if numbers[-1]^2 == numbers[0]^2 + numbers[1]^2:
            return 2
        elif numbers[-1]^2 > numbers[0]^2 + numbers[1]^2:
            return 1
        elif numbers[-1]^2 < numbers[0]^2 + numbers[1]^2:
            return 3


print(classify_triangle(3,6,5) == 3)
print(classify_triangle(3,4,5) == 2)
print(classify_triangle(4,3,3) == 1)
print(classify_triangle(1,1,3) == 0)
print(classify_triangle(1,2,1) == 0)
print(classify_triangle(3,2,1) == 0)
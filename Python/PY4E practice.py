# Course 1, Week 7 

largest = None
smallest = None

while True:
    num = input("Enter a number: ")
    if num == "done" : break
    else:
        try: 
            int(num)
            if (largest == None) and (smallest == None):
                largest = num
                smallest = num
            else:
                if int(num) >= int(largest):
                    largest = num 
                elif int(num) <= int(smallest):
                    smallest = num
        except:
            print("Invalid input")
        
print("Maximum is", largest)
print("Minimum is", smallest)


#%%

## Course 2, Week 2

import re
#import urllib2

txt = open("/Users/jhkim/Dropbox/dev/Python/regex_sum_1209014.txt")

#for line in urllib2.urlopen("http://py4e-data.dr-chuck.net/regex_sum_1209014.txt"):
#    print(line)
y = []

for line in txt:
    x = re.findall('[0-9]+', line)
    x = [int(n) for n in x]
    y.extend(x)
print(y)
sum(y)
# %%

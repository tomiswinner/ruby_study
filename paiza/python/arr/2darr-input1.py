arr = list(map(lambda x: x.split(), "1 3 5 7\n8 1 3 8".splitlines()))

for x in arr:
    for i, num in enumerate(x):
        if i == len(x) - 1:
            print(num)
            continue
        print(num, end=" ")

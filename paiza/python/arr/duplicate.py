arr = "1 3 5 1 2 3 6 6 5 1 4".split()

for x in sorted(list(set(arr))):
    print(x)

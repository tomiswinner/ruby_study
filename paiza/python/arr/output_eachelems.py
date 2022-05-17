arr = list(map(lambda x: x.split(), "1\n2 3\n4 5 6".splitlines()))

for x in arr:
    print(len(x))

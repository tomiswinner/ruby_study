arr = map(lambda x: x.split(), "1 2 3 4 5 6\n8 1 3 3 1 8".splitlines())

print(sum(map(len, arr)))


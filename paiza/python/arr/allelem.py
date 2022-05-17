arr = map(lambda x: x.split(), "6 5 4 3 2 1\n3 1 8 8 1 3".splitlines())

for x in arr:
   for i, y in enumerate(x):
       if i == len(x)-1:
           print(y,end="")
           continue
       print(f"{y}",end=" ")
   print("")

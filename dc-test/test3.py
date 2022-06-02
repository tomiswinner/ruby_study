arr = [0,1]

for i in range(30):
  if i == 0 or i == 1:
    print(arr[i])
    continue
  arr.append(0)
  arr[i] = arr[i-2] + arr[i-1]
  print(arr[i])


ans = 0

for num in range(1,1000+1):
  length = 0
  for i in reversed(str(num)):
    if int(i) < 4:
      length += int(i)
    elif 6 < int(i) and int(i) < 9:
      length += int(i) - 4
    elif int(i) == 4 or int(i) == 6 or int(i) == 9:
      length += 2
    elif int(i) == 5:
      length += 1
  
  if length == 9:
    ans += num

print(ans)

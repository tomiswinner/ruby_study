

def saiki(num,cnt):
  if '0' in str(num):
    return cnt + 1

  ans = 1

  for i in str(num):
    ans *= int(i)
  
  cnt += 1

  if len(str(ans)) == 1:
    return cnt 
  else:
    return saiki(ans, cnt)

howmany = 0

for i in range(10, 1000000+1):
  if saiki(i, 0) == 5:
    print(i)
    howmany += 1

print(howmany)
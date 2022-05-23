ans = 0

for i in range(1,20000+1):
  if i % 3 == 0 or '3' in str(i):
    ans += i

print(ans)
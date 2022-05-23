x = 1234567890

ans = 0

for i in range(1,20000001):
  if x % i == 0:
    ans += i

print(ans)
    

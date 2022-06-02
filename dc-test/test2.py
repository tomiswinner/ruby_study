num = 14515200

for i in range(1,10+1):
  ans = int(num / i)
  if num / i >= 50000:
    print(f'{num} ÷ {i} = {ans} ＊')
  else:
    print(f'{num} ÷ {i} = {ans}')
  num = ans
print(num)
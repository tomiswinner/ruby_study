import math

n = 2
while n <= math.sqrt(10**8):


df is_prime(x: int) -> bool:
  if x < 2:
    return False
  
  for i in range(2, int(x ** 0.5) + 1):
    if x % i == 0:
      return False
    
  return True
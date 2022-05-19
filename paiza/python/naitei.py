N, K, M = map(int, input().split())
cnt = 0

for _ in range(N):
    if int(input()) >= K:
        cnt += 1

num = cnt - M

if num < 0:
    print(0)
else:
    print(num)

    

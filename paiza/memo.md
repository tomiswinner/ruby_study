・二分探索
:赤丸_太字:int mid = low + (high – low)/2;

Maybe, you wonder why we are calculating the middle index this way, we can simply add the lower and higher index and divide it by 2.

:バツ:int mid = (low + high)/2;

But if we calculate the middle index like this means our code is not 100% correct, it contains bugs.

https://www.geeksforgeeks.org/binary-search/amp/

・閉区間と開区間
left = 0
right = len(nums) - 1

leftもrightもnumsの添え字として有効な値となっているので、これは「閉区間」です。
なるほど。。。
チェックマーク_緑
両目
バンザイ















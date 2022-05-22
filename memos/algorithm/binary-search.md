・二分探索
:赤丸_太字:int mid = low + (high – low)/2;

Maybe, you wonder why we are calculating the middle index this way, we can simply add the lower and higher index and divide it by 2.

:バツ:int mid = (low + high)/2;

But if we calculate the middle index like this means our code is not 100% correct, it contains bugs.

https://www.geeksforgeeks.org/binary-search/amp/

・閉区間と開区間
閉区間↓ []　（添え字がすべてあり得る値）
left = 0
right = len(nums) - 1

半開区間[) （添え字の片方があり得ない値）
left = 0
right = len(nums)

めぐる式が使えるのは半開区間のみ
[詳しくはこちら](https://mametter.hatenablog.com/entry/20161117/p1)

すげえためになる
https://www.akiradeveloper.com/post/algorithm-binary-search/
・二分探索、解説
https://satanic0258.hatenablog.com/entry/2016/04/04/205946
↑の親ページ
https://trap.jp/post/152/
・二分探索サンプルコード
https://mametter.hatenablog.com/entry/20161117/p1

・これよんでみ
https://pekoon.hatenablog.com/entry/2015/02/22/221806


## 二分探索
コーナケース(= 解が配列内に存在しない場合)は必ず除外必要

・半開区間
ex)  ［5,6,7,8,9,10]  if:tar <= なら
tar=10 の時は正しい値 arr[ok] は10になる
(条件が範囲内にある場合)
tar =11だと arr[ok]は10なのでおかしい(条件が範囲内にない場合)
なので、この条件に応じてコーナケースは除外する。
※if:tar < であれば、10は条件の範囲外となるので除外する。
※条件内の最小値を求める場合(okを減らしていく)
※条件内の最大値を求める場合はok,ngを反転させる
※ngが閉区間だとバグるのは、閉区間だった場合、一番左までokが辿り着かないから=ngの領域にはokは入り込めないから
・閉区間
コーナケースを除外しないとindexがout of boundsとなる。(最右端、最左端までいってmid +(-)1 だと、mid のある左端(右端)でout of bounds)
ok,ng は最後まではそれぞれいかないので、mid + 1, -1 してあげる必要あり。
※閉区間で行う場合、解も反転する。(= 半開区間にて条件に当てはまる最大値を求める場合、閉区間では条件に当てはまらない最小値がでてくる) これは　m+1, m-1だから最後に算出される値は本来範囲内の±1 となるから。
















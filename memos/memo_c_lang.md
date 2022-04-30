## C言語

+ std::cout << "hello world" << endl
標準出力するオブジェクト

+ fixed,setprecision(n)
小数点の桁数を指定する。

+ std::cin
標準入力を受け付けるオブジェクト
ex) cin >> n >> k;

+ std::vector
動的配列を宣言する。
ex) vector<double exmp;
ex) vector<int> a(k + 2, 0); k+2 個の 0 で要素を埋める。
ex) vector<vector<int>> data(3, vector<int>(4));   int 型 2次元配列(3 × 4) の宣言

+ rbegin, rend
降順ソート、以下どちらでもOK
ex) sort(A.rbegin(), A.rend());
sort(A.begin(), A.end(),  greater<int>());  

+ accumlate
配列の特定範囲の合計値を計算（引数にインデックスを渡せばその範囲）
ex)int sum = std::accumulate(v.begin(), v.end(), 0);


+ while(){}
while の{} は省略できるっぽいふざけんな



+ ちゃんとリンク遷移するように修正して！





1.テストコードを実装する
今回はシステムテストが実装されていました。大変良いと思います。
そもそもなぜテストを書く必要があるかということですが、
Rubyのような言語はプログラムを実行した瞬間にプログラムが正常に動作するかどうかがわかるからです。
翻ってみますと、Rubyはプログラムを実際に動かすまでは正常に動作するかどうかがわからないという言い方ができます。
簡単にご説明すると、Ruby(Javascriptも同様)は実際に動かしてみるまでエラーが出るかどうかわからないということです。
このような不安定なプログラムに対し、テストを書くことによって受けられる恩恵には下記のようなものがあります。

- プログラムが正常に動作することをテストで担保できる
- 生産性の向上

どういうことかと言いますと、実装にかかる時間が、テストを書いていない場合と比較して短くなることが多いと思われます。
例えば、テストを書いてない場合を考えてみたいと思います。
userを作成する という処理を実装した場合、userを作成する という機能が自分が期待している通りに動くかどうかを確認するためには、
大きく分けて下記のようなことを行う必要があると思います。

1.ブラウザを立ち上げてuserのnewページにアクセス
2.必要な項目を入力してsubmitボタンを押下
3.データが正常にDBに保存されたかを目視で確認

例えば、バリデーションの機能などを入れていると、上記の確認に加え、
バリデーションが期待通り動いているかどうかのチェックも必要になってきます。
そうしますと、3ステップにかかる以上の時間が必要になってきます。
一方でテストを書いている場合は、userを作成する という機能が正常に動くかどうかを検証するためのテストコードを実行するだけですので
ブラウザを開いたり必要な項目を入力したりといった人力の作業が減るわけです。
人力の作業が減るということは、その減った時間分だけ実装の時間に回せるということですので、
さらに新機能を開発したり、既存のコードをリファクタする時間が捻出できるようになります。
実務にでるとテストを書かないということの方が珍しいと思います。テストの実装にもぜひチャレンジしてみてください。



3.プログラムを改善する
大島さんのコードを読む限り、プログラムを始めて3~4ヶ月といことを鑑みると非常によくかけていると思います。
今よりさらに良いプログラムにするために、Rubyのコードの書き方を覚えていただくと良いと思います。
例えばですが、app/models/court.rb の convert_time_to_past_sec メソッドを例にご説明します。
Rubyは最後に評価された値を返してくれるので、明示的に return を記述する必要がありません。

def self.convert_time_to_past_sec(hours, mins)
  hours_sec = hours.to_i * 60 * 60
  mins_sec = mins.to_i * 60
  return hours_sec + mins_sec
end

上記のメソッドは下記のように実装するのが普通です。

def self.convert_time_to_past_sec(hours, mins)
  hours_sec = hours.to_i * 60 * 60
  mins_sec = mins.to_i * 60
  hours_sec + mins_sec
end

convert_time_to_past_sec メソッドのうち、最後に評価された値とは

hours_sec + mins_sec

ですので、convert_time_to_past_sec メソッドは return を記述しなくても
hours_sec と mins_sec を足した値を返してくれます。
returnを明示的に記述しなくて良いスタイルはRubyの言語設計です。
そのため、Rubyでは必要でない限り return を明示的に記述することは普通はしません。
では、一方でどのような場合に return が必要かというと、
処理を途中で中断したい場合などです。
例えば、app/models/court.rb の return_business_hour メソッドのように、早期リターンを使用する場合です。

def return_business_hour
  return "#{convert_open_time_to_hour_min} ～ #{convert_close_time_to_hour_min}" if open_time && close_time

  return '確認中'
end

上記の場合、 open_time と close_time が存在する場合 という条件が満たされたさいは特定の値を返したいので、
return を使って値を返し、その時点で処理を中断させる必要があります。
ちなみにですが、上記のメソッドは下記のように実装するのが普通です。

def return_business_hour
  return "#{convert_open_time_to_hour_min} ～ #{convert_close_time_to_hour_min}" if open_time && close_time

  '確認中'
end

また、メソッド名に return のような名前を使うこともありません。
なぜなら、メソッドとは何かしらの値を返すために作るからです。
したがって、下記のようなメソッド名にするのが良いでしょう。

def business_hour_text
  return "#{convert_open_time_to_hour_min} ～ #{convert_close_time_to_hour_min}" if open_time && close_time

  '確認中'
end

また、convert_open_time_to_hour_min メソッドも修正していただいた方が良いでしょう。

def convert_open_time_to_hour_min
  return (Time.zone.now.midnight + open_time).strftime('%H:%M')
end

このメソッドも return が必要ないです。
そして、convert_open_time_to_hour_min メソッドで行なっている処理自体は、business_hour_text メソッド内で
実装した方が良いでしょう。なぜなら、Time.zone.now を convert_open_time_to_hour_min と convert_close_time_to_hour_min で
それぞれ実装していると、タイミングによっては時間がズレてしまう可能性があるからです。
したがって、business_hour_text メソッドを下記のように修正していただく方が良いでしょう。

def business_hour_text
  now = Time.zone.now
  return "#{now.midnight.strftime('%H:%M') + open_time} ～ #{now.midnight.strftime('%H:%M') + close_time}" if open_time && close_time

  '確認中'
end

この場合、open_time と close_time が存在しなかった際、Time.zone.now の処理が無駄になるので、
条件を逆にした方が良いでしょう。

def business_hour_text
  return '確認中' unless open_time && close_time

  midnight = Time.zone.now.midnight.strftime('%H:%M')
  "#{midnight + open_time} ～ #{midnight + close_time}"
end


4.プログラムをex改善する2
次に改善したいコードですが、app/controllers/court_histories_controller.rb にあるコードになります。
具体的には下記の処理になります。

def index
  @courts = Court.none
  CourtHistory.where(user_id: current_user).order(created_at: :desc).each do |hisotory|
    @courts += Court.where(id: hisotory.court_id)
  end

  @courts = Kaminari.paginate_array(@courts).page(params[:page]).per(10)
end

上記の処理ですが、もっと簡潔にできそうです。
例えば、下記のように修正するのが良いでしょう。

def index
  courts = Court.where(
    id: CourtHistory.where(user_id: current_user).order(created_at: :desc).pluck(:court_id)
  )
  @courts = Kaminari.paginate_array(courts).page(params[:page]).per(10)
end

上記の処理ですが、order を適用したい場合は courts に実行しなければなりません。

def index
  courts = Court.where(
    id: CourtHistory.where(user_id: current_user).pluck(:court_id)
  ).order(created_at: :desc)
  @courts = Kaminari.paginate_array(courts).page(params[:page]).per(10)
end

また、current_user のid を条件にレコードを取得したい場合、
Railsでは下記のように実装するのが一般的です。

current_user.court_histories

この修正を適用すると下記のようになります。

def index
  courts = Court.where(id: current_user.court_histories.pluck(:court_id)).order(created_at: :desc)
  @courts = Kaminari.paginate_array(courts).page(params[:page]).per(10)
end

一時的に変数に代入したい場合はインスタンス変数を使用するよりも、
ローカル変数を使用する癖をつけていただいた方が良いでしょう。
そのほうが意図しない変数の上書きを防ぐことができます。

上記でみてきた修正に関しては、app/controllers/event_histories_controller.rb の index アクションにも当てはまります。
ぜひ修正にチャレンジしてみてください。



6.プログラムを改善する4
次に修正していただくと良いコードですが、app/controllers/courts_controller.rb の operate_court_history メソッドになります。
5.プログラムを改善する3でご説明したように、データを作成したり、削除する処理は基本的にモデルに実装するのが良いので、
この基本的な考え方に沿ってこのコントローラも修正していただくと良いでしょう。
Userクラスにメソッドを作成していただくと良いと思います。

def operate_court_history(court, court_id)
  CourtHistory.find_by(user_id: current_user.id, court_id: court_id).destroy if current_user.history_exists?(court)
  CourtHistory.create(user_id: current_user.id, court_id: court_id)
  return unless current_user.histories_reached_to_limit?(court)

  CourtHistory.where(user_id: current_user.id).order(:created_at).first.destroy
end

上記の処理をUserクラスのインスタンスメソッドとして実装します。

def create_and_destroy_court_histories(court, court_id)
  court_histories.find_by(court_id: court_id).destroy if history_exists?(court)
  court_histories.create(court_id: court_id)
  return unless histories_reached_to_limit?(court)

  court_histories.order(:created_id).first.destroy
end

operate_court_history メソッドは show アクションで呼び出されているので、show アクションを修正します。

def show
  @court = Court.find(params[:id])
  @tags = Tag.where(id: @court.court_tag_taggings.pluck(:id))
  current_user.create_and_destroy_court_histories(@court, params[:id]) if user_signed_in?
end

このように実装していただくと、テストを書けるようになり、また、courts_controller.rb 以外のファイルで
operate_court_history と同様の処理をしたくなった場合に、
create_and_destroy_court_histories メソッドを再利用することができます。
コントローラにメソッドを実装すると、基本的に他のファイルで使用することができません。
継承元の ApplicationController にメソッドを実装すると、ApplicationController を継承している場合は、
メソッドを再利用することができますが、テストを書くのが難しい点とRailsのアーキテクチャに沿っていないという理由から、
モデルにメソッドを切った方が良いでしょう。

ここまでのご説明内容でわからないことがあるかもしれませんが、１つ１つ調べながら理解していただければ良いと思います。
基本的には、

### Railsのことなら
#https://railsguides.jp/
#
#### Rubyのことなら
#https://www.ruby-lang.org/ja/
#
##### 具体的なRubyのメソッド等については
#https://docs.ruby-lang.org/ja/2.6.0/doc/index.html
#
#### RubyやRailsに関する初歩的な解説の良記事
#https://qiita.com/jnchito
#
#この辺のドキュメントや記事が参考になります。
#継続して学習していただくとより良いプログラムが書けるようになると思います。
#頑張ってください！
#```
#

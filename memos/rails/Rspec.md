+ before(:all)
[詳しくはこちら](https://qiita.com/kiyodori/items/5862efd9c5a5ed699f81)<br>
最初に一度しか実行されないが、ロールバックもされない。<br>
ロールバックしたければ、after(:all)でロールバックしてやる必要があるので、注意<br>
基本的には、before(:each)が無難。

こちらに before after の順序あり。<br>
[こちら](https://relishapp.com/rspec/rspec-core/v/2-0/docs/hooks/before-and-after-hooks)<br>
> Before and after blocks are called in the following order:
> before suite
> before all
> before each
> after each
> after all
> after suite

## エラー

+ rails_helper が読み込めないエラー
An error occurred while loading ./courts_spec.rb.<br>
Failure/Error: require 'rails_helper'<br>
LoadError:<br>
  cannot load such file -- rails_helper<br>

[こちらのリンクを確認](https://blog.beaglesoft.net/entry/2017/03/20/100000)<br>
解決せず >>" bundle exec rspec:install " を実行も、ファイルは存在。同じエラーが発生。



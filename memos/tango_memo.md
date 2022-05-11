+ build matrix
A build matrix is a set of keys and values that allows you to spawn several jobs starting from a single job definition. The CI will use every key/value combination performing value substitution when running your job. This allows you to run a job to test different versions of a language, a library, or an operating system.
[こちらに詳しい](https://ncorti.com/blog/howto-github-actions-build-matrix)<br>
A matrix strategy lets you use variables in a single job definition to automatically create multiple job runs that are based the combinations of the variables.<br>
環境とかを定義しておくと、一つのジョブを設定した環境を片っ端から組み合わせて実行してくれるよ！っていうgithub action の機能の一つ(github action は　CIツール)

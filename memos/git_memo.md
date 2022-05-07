+ gitignore の編集
1. gitignore の編集（追加・削除）
2. gir rm -r --cached [対象]　にてキャッシュを削除。
3. add, commit, push rm -r --cached [対象]　にてキャッシュを削除。
3. add, commit, push rm -r --cached [対象]　にてキャッシュを削除。
3. add, commit, push rm -r --cached [対象]　にてキャッシュを削除。
3. add, commit, push rm -r --cached [対象]　にてキャッシュを削除。
3. add, commit, push

+ git large file error
  容量が大きすぎるファイルはアップロードできない。
  間違ったファイルを削除するため、rebase を実行
  [参考にしたサイトはこちら](https://chaika.hatenablog.com/entry/2016/03/22/181243)

  git rebase -i [commit番号] 

  rebase したい対象の一つ前の commit を選択する。

  そのあと vi が表示されるので、pick となっている修正対象コミットを edit へ修正し、
  当該コミットの中へ(HEADが？)飛ばされるので、修正し git commit --amend
  （消したいファイルは git rm などで add を取り消してね）

  完了したら、git rebase --continue で rebase を反映（反映させたくない場合、abort）
  

  [vagrant@vagrant ruby_study]$ git push origin master
  Enumerating objects: 25, done.
  Counting objects: 100% (25/25), done.
  Compressing objects: 100% (18/18), done.
  Writing objects: 100% (18/18), 54.90 MiB | 389.00 KiB/s, done.
  Total 18 (delta 12), reused 0 (delta 0), pack-reused 0
  remote: Resolving deltas: 100% (12/12), completed with 7 local objects.
  remote: error: Trace: eb3d0485779468315a477ja0108695939ecf3e2a7291462752c3017c69d43b30a
  remote: error: See http://git.io/iEPt8g for more information.
  remote: error: File paiza/binary_search/.8th-2.rb.swp is 136.66 MB; this exceeds GitHub's file size limit of 100.00 MB
  remote: error: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.
  To github.com:tomiswinner/ruby_study.git
  ! [remote rejected] master -> master (pre-receive hook declined)
  error: failed to push some refs to 'github.com:tomiswinner/ruby_study.git'


  commit 246f410abcfc9fbf5dd93b7c951bba2f979b5891 (HEAD -> master)
  Author: tomiswinner <mouseofsack911@gmail.com>
  Date:   Fri Apr 15 06:35:01 2022 +0000

      [add] binary

  memos/memo_c_lang.md
  paiza/binary_search/.8th-2.rb.swp
  paiza/binary_search/8th-2.rb
  paiza/binary_search/8th-3.rb
  paiza/binary_search/test-8th.txt

  git log --name-only で push した内容をログで表示できる
  ↓参考になったgit log の方法。
  https://qiita.com/okasir4444/items/a0243f337e17d7b39e02
  git log --name-status のほうがよい、何が追加されたかなどステータスも確認できる。



+ error: failed to push some refs to 'github.com:tomiswinner/PF.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
>> git pull してないからっぽい。
[こちらを確認](https://qiita.com/cedric-ryo/items/4a6ed57549a3008fcb6a)

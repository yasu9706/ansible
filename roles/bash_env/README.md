# bash env


## 概要
bashrcやbash_aliasesなどを構成するためのrole

- minimum_environment: `ll`などの一般的なaliasの設定や、  
  historyのコントロールを設定する
- customized_prompt: カスタマイズされた独自bashプロンプト
- out_of_control: role外で書き込みが生じるもの
- その他ソフトウェアで必要なもの(nvmなど)


### 最低限bash
ls -lを実行するllエイリアスもないのは困る
lsは実際のところ`ls --color=auto`になっている

bash_completionもbashrcで設定しているっぽい

環境変数GCC_COLORS: gccでコンパイルする際にwarningやerror情報に
色を付けてくれる

historyはこの中に入れて良さそう

alias `mux`はtmuxを管理するroleでコントロールするのが妥当だが、
bash_alieasesに書き込みが発生する
playbookでroleを2つ実行する形でカバーするのが無難そう
例えばbashrcやbash_aliasesの最後の行は`out of control from ansible role`
みたいなコメント行にして、このrole以外での書き込みはその行以下にする

## 仕様
オンデマンド形式で必要なものをbashrcに組み込めるようにする。
オンデマンド… どこで欲しいものを宣言するか
play/playbookで宣言するのが妥当

bashrcやbash_aliasesを作り上げていくというよりも、
欲しい機能を実装するために結果として書き込む先がbashrcやbash_aliasesになっている、
という形の方がやりやすそう


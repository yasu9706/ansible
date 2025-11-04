# vim変数

`:h variables`参照

## 変数の型
- Number:  32bit/64bitの符号付き数。32bitか64bitかは`:echo v:numbersize`で確認できる？
- Float: 浮動小数点数
- String: 文字列
- List:  リスト。順番の概念あり。
  - Tuple: タプル。イミュータブル(不変)でいわゆる配列。順番の概念がある。  
    本当にある？`:h variables`では確認できなかったが下記ではタプルについて記載があった。(2025/10/29時点)  
    https://vim-jp.org/vimdoc-ja/eval.html
- Dictionary: 辞書型、キーバリュー型、連想配列。

少し特殊なもの

- Funcref: function()、vim9scriptでのfuncref()の戻り値の型、もしくはラムダ式で作成できる値の型。
- Special: 次の特殊な値の型: v:false, v:true, v:none, v:null
- Job: job_start()で作成されるオブジェクトの値。
- Channel: vimの外部プロセスとの通信につかうチャネルオブジェクトの型。
- Blob: binary object。ファイルから画像を読み込んだりそれをチャネルを通じて  
  送ることができる。

## 変数のスコープ
`:h variable-scope`を参照

-                   (  )    関数内では関数にローカル(l:)、  
                            レガシースクリプトではグローバル、  
                            vim9scriptではスクリプトにローカル(s:)
- buffer-variable   (b:)    現在のバッファにローカル
- window-variable   (w:)    現在のウィンドウにローカル
- tabpage-variable  (t:)    現在のタブページにローカル
- global-variable   (g:)    グローバル
- local-variable    (l:)    関数にローカル(旧来の関数のみ)
- script-variable   (s:)    :sourceされたVim scriptにローカル
- function-argument (a:)    関数の引数(旧来の関数のみ)
- vim-variable      (v:)    グローバル、Vimがあらかじめ定義

この内設定ファイル等で設定を行うことになるのはグローバルだけと言える。

## 変数の定義
`let 変数名`の形で定義する。

### 変数の確認
echo コマンドで変数の値を表示することができる。
なおechoコマンドの実行結果が表示される領域はコマンドの入力も兼ねているが、
ここはコマンドライン、あるいはメッセージエリアと呼ばれる。

グローバル変数の一覧をメッセージエリアに出力するには、
`:echo g:`か,`echo keys(g:)`を実行する。


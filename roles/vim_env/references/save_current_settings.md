# 現在設定の保存
## オプション(`set`で設定されるもの)の表示
`:mkvimrc /path/to/filename`で現在適用されている設定をファイルに書き出す。
詳細は`:h save-settings`を参照。

設定ファイルが肥大化して、`runtime! debian.vim`など、どこのパスにあるファイルを
runtimeしているのか分からなくなった場合は、一度試してみると良さそう。

mkvimrcで書き出される設定には変数は含まれていない。
例えば`markdown_fenced_languages`のような変数をvimrcで定義しているが、
これを含めて変数やその値は表示されない。

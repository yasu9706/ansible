# vim packages

詳細は`:h packages`を参照

- パッケージはアーカイブとしてダウンロードして解凍して使用できる。  
  アップデートや削除が容易。
- パッケージは相互に依存するようなプラグインを含むことができる。
- パッケージは開始時に自動的に読み込まれるようなプラグインや、  
  `:packadd`により必要なときにだけ読み込まれるようなプラグインを含むことができる。

vimは起動時に、vimrcを処理したあとに`packpath`に指定されている  
全てのディレクトリをスキャンし、`pack/*/start`ディレクトリ下のプラグインを検索する。  
まずそれらのディレクトリの全てが`runtimepath`に追加される。  
その後、全てのプラグインが読み込まれる。

例えばvimは`pack/foo/start/foobar/plugin/foo.vim`というファイルを見つけ、  
`~/.vim/pack/foo/start/foobar`をruntimepathに追加する。

`pack/*/opt`配下のファイルは自動的には追加されない。
`pack-add`というコマンドがあり、例えば`packadd foodebug`を実行すると  
`pack/*/opt/foodebug`を探し`~/.vim/pack/foo/opt/foodebug/plugin/debugger.vim`を  
見つけ出すとそれを実行する。

パッケージに`after`というディレクトリがある場合、そのディレクトリはruntimepathの  
末尾に追加される。これによってそこにあるものはあとから読み込まれる。

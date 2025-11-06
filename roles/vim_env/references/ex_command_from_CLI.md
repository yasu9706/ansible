# CLIからのexコマンドの実行
viはそもそもexエディタのvisualモードとして存在していた。
このexエディタはvimをパッケージインストールするとセットでついてくる。

## -cオプション
vimをCLIから起動し、かつ、起動時にexコマンドを非インタラクティブに  
実行する方法として`-c`オプションが存在する。  
例えば`vim -c ':q' some_file`のように実行することで、最初のファイルを  
読み込んだあとに`:q`を実行したことになり、ただちにvimを終了する。

ローカルホストで実行する分にはvimコマンドでも問題ないが、
例えばsshで非インタラクティブにvimを起動する場合、以下のような警告が表示される。

```
Vim: Warning: Output is not to a terminal
Vim: Warning: Input is not from a terminal
```

vim-plugの`:PlugInstall`も-cオプションから実行できるが、
実行が完了するまではvimのインタラクティブなウィンドウ(バッファ？)が表示される。


ssh ansible@ansible-rocky-agent00 'vim +PlugInstall +qa'

ssh ansible@ansible-rocky-agent00 'vim -S pluginstall'


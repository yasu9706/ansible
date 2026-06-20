# vimrc

## Overview 概要
オンデマンドで管理対象ノードのvim環境を構成する

ミニマムな設定ファイルをベースに機能を追加する。
基本的にはミニマムな設定、vimを最低限使えるようにするための設定を記載する。
デフォルトの挙動とは大きく異なるような設定に関しては
~/.vim/plugins/配下にファイルを作成し、
vimrc側ではそこを読み込む形で設定を行う。

主なタスク
- install_latest_manually: 最新vimのDL,ビルド、インストール
- distribute_minimum_vimrc: vimrcを配布する。`runtime! plugin/**/*.vim`  
  のような記載も末尾に加える
- plugin: pluginsを作成するタスクの集合
- ftplugin: ftpluginを作成するタスクの集合
- pack: vim packagesをインストールする作業の集合

vim packagesはgit cloneと標準のパッケージ機能を使用する。  
gitは別ロールlinux_packagesを利用してインストールする。

## 今後の計画


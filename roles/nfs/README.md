# nfs

## Overview 概要
NFSサーバ/クライアントのセットアップを行う。

下記の方針で設定を行う。

### 共通
- 下記の特定のユーザグループを利用するため、NFSv4を利用する。  
  NFSv3にはグループID数16という問題があり、これを回避するためにNFSv4を利用する。
- gid2049となるユーザグループ`nfs_rw`を設定する。共有ディレクトリはこの  
  ユーザグループが所有し、SGIDを設定する。共有ディレクトリにアクセスする  
  ユーザはこのユーザグループに所属する。
- サーバでのエクスポート対象のディレクトリや、クライアントでのマウント先について、  
  defaults/main.yamlでの設定値を使う。  
  この値はplaybook中での変数やhost_varsなどで上書き可能である。


## TODO


## Requirements

nfsに関連するパッケージのインストールは別roleにて行う。

nfsでのエクスポートを行うディレクトリに別ディスクのファイルシステムを
マウントする場合は事前にマウントポイントの作成とマウントを行っておく

## Role Variables
### 本role内でデフォルト値が設定されているもの
playbookやhost_vars等で上書き可能

### playbookやhost_vars等で設定が必要なもの


## Dependencies

A list of other roles hosted on Galaxy should go here, plus any details in  
regards to parameters that may need to be set for other roles,  
or variables that are used from other roles.

## Example Playbook

Including an example of how to use your role (for instance, with variables  
passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

## License

BSD

## Author Information

An optional section for the role authors to include contact information,  
or a website (HTML is not allowed).

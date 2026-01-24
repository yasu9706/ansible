# chrony

## Overview 概要
自宅PC上でのchronyによるNTP同期設定を行うためのrole

- サーバ
  - 基本的に日本国内のNICTのNTPサーバ(ntp.nict.jp)を優先的に参照する。
  - 優先サーバや他のサーバはgroup_varsなどで書き換え可能なように、  
    設定ファイルテンプレートに変数として定義する。
- クライアント
  - このサーバを参照する。
  - ノートPCなど持出しが発生する端末では上記サーバを優先する他、  
    サーバの参照先も参照する設定を入れる。
- 共通
  - パッケージインストール時に入ってくるものは設定ファイル以外は余計なものは消す  
    (/etc/chrony/conf.dなど)

## Terminology 用語


## TODO


## Requirements

Any pre-requisites that may not be covered by Ansible itself or the role  
should be mentioned here. For instance, if the role uses the EC2 module,  
it may be a good idea to mention in this section that the boto package  
is required.

## Role Variables

A description of the settable variables for this role should go here,  
including any variables that are in defaults/main.yml, vars/main.yml,  
and any variables that can/should be set via parameters to the role.  
Any variables that are read from other roles and/or the global scope  
(ie. hostvars, group vars, etc.) should be mentioned here as well.

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

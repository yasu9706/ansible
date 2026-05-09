# インストール・サービス状態
## パッケージ確認
rpm -q rsyslog
dpkg -l rsyslog

## サービス起動確認
systemctl status rsyslog
systemctl is-active rsyslog

## バージョン確認
rsyslogd -v

################################################################################
# メイン設定ファイル
## 構文の種類
### sysklogd形式      シンプル                   auth.* /var/log/auth.log
### レガシー形式      `$`で始まるディレクティブ  $ModLoad imtcp
### ReinerScript形式  ブロック構文               input(type="imtcp" port="514")

## globalディレクティブ(ある場合)
### workDirectoryのパス、rsyslogが書き込み可能か

## モジュールのローディング
### ReinerScriptの場合
grep module /etc/rsyslog.conf
#### `imjournal`と`imuxsock`が両方有効だと二重取り込みが発生する可能性がある

## インクルード設定(読み込み順、競合)
grep include /etc/rsyslog.conf

################################################################################
# リスニング設定 (サーバの場合)
## TCP/UDPモジュールの有効化
grep -e imtcp -e imudp /etc/rsyslog.conf

## 特定IPの限定
grep \$fromhost-ip /etc/rsyslog.conf

## ファイアウォール
firewall-cmd --list-all
sudo iptables -L

## SELinux/apparmor
getenforce
aa-status

################################################################################
# ログの転送・出力設定
## ローカル出力 — ファイルパス・権限・ローテーション対象か
## リモート転送(転送先ホスト、ポート、プロトコル、再送キュー設定)
grep omfwd /etc/rsyslog.conf

## TLS設定(gtlsドライバの設定、証明書のパス、証明書の有効期限)
## キュー設定(キュータイプ、最大キューサイズ、フルキュー時の動作)

################################################################################
# ファイル・ディレクトリのパーミッション
## /etc/rsyslog.conf、/etc/rsyslog.d/ (root所有・644以下)
stat /etc/rsyslog.conf /etc/rsyslog.d/*

## /var/log/ 以下のログファイル (適切な所有者・権限（機密ログは600等）)
ls -al /var/log

## 秘密鍵ファイル（TLS使用時） (600、root所有)

################################################################################
# ログローテーション（logrotate連携）
## /etc/logrotate.d/rsyslog の存在と設定
cat /etc/logrotate.conf
find /etc/logrotate.d/ -type f
find /etc/logrotate.d/ -type f | xargs grep . | dshbak -c

## ローテーション後のpostrotateでsystemctl reload rsyslogまたはHUPシグナル送信
cat /etc/logrotate.d/rsyslog   # postrotateかcopytruncateのどちらかが設定されているか
                               # 複数ファイルを対象にしている場合 sharedscripts があるか

### logrotateのデバッグ実行（実際には何もしない）
logrotate -d /etc/logrotate.d/rsyslog
#### 想定されているファイルがすべてローテートされるか(`rotating pattern:`の行)
#### ワイルドカード指定で不要なファイルがローテートされていないか
#### ローテーション間隔は正しいか(daily/weekly/monthly)
#### 保持世代数は正しいか(rotate 7など)
#### 空ファイルを無駄にローテーとしていないか(notifyempty)
#### などなど

### 手動実行（動作確認）
logrotate -f /etc/logrotate.d/rsyslog

### ローテーション後にrsyslogが新ファイルに書いているか確認
ls -li /var/log/messages*                         # inodeが変わっているか
lsof -p $(cat /run/rsyslogd.pid) | grep messages  # rsyslogが参照しているファイル

## 保存世代数・圧縮設定
grep -e rotate -e compress /etc/logrotate.d/rsyslog

################################################################################
# セキュリティ観点
## 不要なモジュールがロードされていないか
grep module /etc/rsyslog.conf

## 受信元のIPフィルタリング
grep \$fromhost-ip /etc/rsyslog.conf

## ログの改ざん防止（書き込み専用設定、WORM対応ストレージ）

## 認証なしでログを受け付けていないか（TLS相互認証の有無）

################################################################################
# 動作確認
## 設定構文チェック
rsyslogd -N1

## テストメッセージ送信
logger -p auth.info "test message"

## リアルタイム確認
tail -f /var/log/syslog   # または /var/log/messages

################################################################################
# パフォーマンス・信頼性
## キューのディスクスプール設定（ネットワーク断時のログ欠損防止）
## $ActionResumeRetryCount (転送失敗時のリトライ回数)
## ファイルディスクリプタ上限（大量ログ受信時）

# redmine-centos-ansible


最小構成でインストールしたCentOSにRedmineを自動インストールするためのAnsibleプレイブックです。

コマンド5個実行するだけで、あとはしばらく放置すればインストールが完了します。


## 概要

Ansibleを使ってRedmineを自動インストールするためのプレイブックです。以下のwebサイトで紹介されている手順におおむね準拠しています。

[Redmine 3.4をCentOS 7.3にインストールする手順](http://blog.redmine.jp/articles/3_4/install/centos/)


## システム構成

* Redmine 3.4
* CentOS 7.3
* PostgreSQL
* Apache
* Gitbucket


## Redmineのインストール手順

インストール直後の CentOS 7.3 に root でログインし以下の操作を行ってください。


### Ansibleとgitのインストール

```
yum update
yum install -y epel-release
yum install -y ansible
yum install -y git

```

### playbookのダウンロード

```
# playbookをセット
cd /usr/local/src
git clone https://github.com/farend/redmine-centos-ansible.git
```

### PostgreSQLに設定するパスワードの変更

ダウンロードしたプレイブック内のファイル `group_vars/redmine-servers` をエディタで開き、 `db_passwd_redmine` を適当な内容に変更してください。これはPostgreSQLのRedmine用ユーザー redmine に設定されるパスワードです。

vi /usr/local/src/redmine-centos-ansible/group_vars/redmine-servers

### playbook実行

下記コマンドを実行してください。Redmineの自動インストールが開始されます。

```
cd /usr/local/src/redmine-centos-ansible
ansible-playbook -i hosts site.yml
```

10〜20分ほどでインストールが完了します。webブラウザで `http://サーバIPアドレス/redmine` にアクセスしてください。Redmineの画面が表示されるはずです。
gitbucket webブラウザで `http://サーバIPアドレス/gitbucket` にアクセスしてください。gitbucketの画面が表示されるはずです。


## ライセンス

MIT License


## 作者

[ファーエンドテクノロジー株式会社](http://www.farend.co.jp/)

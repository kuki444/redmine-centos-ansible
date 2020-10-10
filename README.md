# redmine-centos-ansible


最小構成でインストールしたCentOSにRedmineを自動インストールするためのAnsibleプレイブックです。

コマンド5個実行するだけで、あとはしばらく放置すればインストールが完了します。


## 概要

Ansibleを使ってRedmineを自動インストールするためのプレイブックです。以下のwebサイトで紹介されている手順におおむね準拠しています。

[Redmine 3.4をCentOS 8.0にインストールする手順](http://blog.redmine.jp/articles/3_4/install/centos/)


## システム構成

* Redmine 4.1.1
* CentOS 8.2
* PostgreSQL 10.14
* Apache 2.4.37


## Redmineのインストール手順

インストール直後の CentOS 7.6 に root でログインし以下の操作を行ってください。


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
git clone https://github.com/kuki444/redmine-centos-ansible.git
```

### PostgreSQLに設定するパスワードの変更

ダウンロードしたプレイブック内のファイル `group_vars/redmine-servers` をエディタで開き、 `db_passwd_redmine` を適当な内容に変更してください。これはPostgreSQLのRedmine用ユーザー redmine に設定されるパスワードです。

vi /usr/local/src/redmine-centos-ansible/group_vars/redmine-servers

### 連携リポジトリ

# 配置場所
git
/var/lib/git/repo
subversion
/var/lib/svn/repo

# リポジトリ 作成
git
cd /var/lib/git/repo
git init --bare --shared プロジェクト識別子[.任意の文字].git
subversion
cd /var/lib/svn/repo
svnadmin create プロジェクト識別子[.任意の文字]
chmod -R g+w プロジェクト識別子[.任意の文字]

# リポジトリURL
git
http://サーバIPアドレス/git/プロジェクト識別子[.任意の文字].git
subversion
http://サーバIPアドレス/svn/プロジェクト識別子[.任意の文字]

### playbook実行

下記コマンドを実行してください。Redmineの自動インストールが開始されます。

```
cd /usr/local/src/redmine-centos-ansible
ansible-playbook -i hosts site.yml
```

10〜20分ほどでインストールが完了します。webブラウザで `http://サーバIPアドレス/redmine` にアクセスしてください。Redmineの画面が表示されるはずです。

## リポジトリ作成

```
# gitの場合
su - git
cd /var/lib/git/repo
git init --bare [プロジェクト識別子][.任意の文字].git
例：識別子が「test」の場合
git init --bare test.git
git init --bare test.2.git
# svnの場合
cd /var/lib/svn/repo
svnadmin create  [プロジェクト識別子][.任意の文字]
chown -R apache:apache
```

## リポジトリURL
git
`http://サーバIPアドレス/git/[プロジェクト識別子][.任意の文字].git` 
svn
`http://サーバIPアドレス/svn/[プロジェクト識別子][.任意の文字]` 


## redmine追加テーマ
Dwarf
bleuclair
farend_basic
farend_fancy
flat
gitmike

## redmine 追加 plugins
Issues XLS export
My Page Blocks plugin
Redmine Custom Query Count plugin
Redmine Extended Reminder plugin
Redmine Holidays Plugin
Redmine Issue Templates plugin
Redmine Issues Summary Graph plugin
Redmine Local Avatars plugin
Redmine SCM
Redmine Theme Changer plugin
Redmine Wiki Extensions plugin
Redmine Work Time plugin

## ライセンス

MIT License


## 作成元

[ファーエンドテクノロジー株式会社](http://www.farend.co.jp/)

## 変更
kuki444


# リポジトリ概要

株式会社日本資産運用基盤グループ(Japan Asset Management Platform Group Co.,Ltd.) 投資一任業務システムのDBを管理するリポジトリ。

# 環境構築

## 前提

FlywayではDDL、DMLを管理するものとする。  
DCLは手動で実施する必要がある。

### 手動実施内容

#### ユーザー・ロール作成

postgresユーザーでログインしてユーザー・ロール作成を行う。

1. [1.init-postgres.sql](1.init-postgres)を編集し各ユーザーのパスワードを設定する
2. postgresユーザーでログイン
3. [1.init-postgres.sql](1.init-postgres)を実行する

パスワードについてはSecretsManagerから取得する。

#### テーブルのデフォルト権限設定

Flywayでmigrationユーザーがテーブル作成を行うためテーブルのオーナーはmigrationユーザーとなる。  
このためmigrationユーザーでログインして各ロールのテーブルに対する権限を設定する。

1. migrationユーザーでログイン
2. [2.init-migration.sql](2.init-migration.sql)を実行する

## Flyway実行


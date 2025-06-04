-- postgresユーザーで実行するSQL

-- DB作成
CREATE DATABASE gbawrap;

-- ユーザー作成
CREATE USER admin WITH PASSWORD '';
CREATE USER migration WITH PASSWORD '';
CREATE USER online WITH PASSWORD '';
CREATE USER daily_batch WITH PASSWORD '';
CREATE USER report_batch WITH PASSWORD '';
CREATE USER operator WITH PASSWORD '';

-- アプリケーション用ロール作成
CREATE ROLE app_role;
GRANT CONNECT ON DATABASE gbawrap TO app_role;
GRANT USAGE ON SCHEMA public TO app_role;

-- アプリケーションロール設定
GRANT app_role TO online;
GRANT app_role TO daily_batch;
GRANT app_role TO report_batch;

-- migration
GRANT CREATE, CONNECT, TEMPORARY ON DATABASE gbawrap TO migration;

-- 管理者ロール作成
CREATE ROLE admin_role;
ALTER ROLE admin_role CREATEDB CREATEROLE;

-- 管理者ロール設定
GRANT admin_role TO admin;
GRANT migration TO admin;

-- 運用者用ロール作成
CREATE ROLE operator_role;
GRANT CONNECT ON DATABASE gbawrap TO operator_role;
GRANT USAGE ON SCHEMA public TO operator_role;

-- 運用者ロール設定
GRANT operator_role TO operator;

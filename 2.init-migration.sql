-- migrationユーザーで実行するSQL

-- アプリケーション用ロールのテーブルアクセス権設定
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON TABLES TO app_role;

-- アプリケーション用ロールのシーケンスアクセス権設定
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO app_role;

-- 運用者用ロールのテーブルアクセス権設定
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO operator_role;

-- 運用者用ロールのシーケンスアクセス権設定
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO operator_role;
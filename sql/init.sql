-- 创建应用数据库
CREATE DATABASE IF NOT EXISTS app_db 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- 创建应用用户（生产环境请使用强密码）
CREATE USER IF NOT EXISTS 'app_user'@'%' 
IDENTIFIED BY 'AppUser@123';

-- 授予权限
GRANT ALL PRIVILEGES ON app_db.* TO 'app_user'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'app_user'@'%';

-- 创建监控用户（用于健康检查）
CREATE USER IF NOT EXISTS 'health_check'@'localhost' 
IDENTIFIED BY 'Health@123';

-- 刷新权限
FLUSH PRIVILEGES;

-- 显示创建的数据库
SHOW DATABASES;

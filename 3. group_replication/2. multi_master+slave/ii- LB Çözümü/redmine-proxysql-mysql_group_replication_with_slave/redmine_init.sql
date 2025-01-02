-- Redmine veritabanını oluştur
CREATE DATABASE IF NOT EXISTS redmine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Redmine kullanıcısını oluştur ve yetkilendir
CREATE USER 'redmine'@'%' IDENTIFIED BY 'redmine_password';
GRANT ALL PRIVILEGES ON redmine.* TO 'redmine'@'%';
FLUSH PRIVILEGES; 
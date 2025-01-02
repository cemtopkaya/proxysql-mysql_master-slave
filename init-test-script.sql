########################## TEST SCRIPT START ##########################
CREATE DATABASE IF NOT EXISTS myDB;
USE myDB;
CREATE TABLE IF NOT EXISTS test (ID int NOT NULL AUTO_INCREMENT, UTS varchar(255),increment varchar(255), PRIMARY KEY (ID)) ENGINE=InnoDB;;
CREATE USER IF NOT EXISTS 'myuser'@'localhost' IDENTIFIED BY 'mypass';
CREATE USER IF NOT EXISTS 'myuser'@'%' IDENTIFIED BY 'mypass';
GRANT ALL ON *.* TO 'myuser'@'localhost';
GRANT ALL ON *.* TO 'myuser'@'%';
flush privileges;

########################## REDMINE DB SETUP START ####################
CREATE DATABASE IF NOT EXISTS redmine CHARACTER SET utf8mb4;
CREATE USER IF NOT EXISTS 'redmine'@'%' IDENTIFIED BY 'redmine_password';
GRANT ALL PRIVILEGES ON redmine.* TO 'redmine'@'%';
FLUSH PRIVILEGES;
########################## REDMINE DB SETUP END ######################

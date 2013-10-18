CREATE DATABASE IF NOT EXISTS wordpress_db;
CREATE USER 'root'@'localhost';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'root'@'localhost';

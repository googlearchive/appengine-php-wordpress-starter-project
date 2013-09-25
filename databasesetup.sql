CREATE DATABASE IF NOT EXISTS wordpress_db;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_password';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'localhost';
# 使用docker作为开发环境
## mysql
docker run -itd --name mysql-test -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql


create database business_portraits collate utf8mb4_bin
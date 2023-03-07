# 启动

## mysql
创建数据库selflearning，然后直接运行，JPA会自动创建表结构
```mysql
create database selflearning collate utf8mb4_bin
```

## hbase相关配置
修改application.yml中的hbase地址配置：
```shell
hbase.zookeeper.quorum=yourhost
```
启动hbase:
```shell
./bin/start-hbase.sh
```
在hbase shell中创建stu表:
```shell
create 'stu','info1','info2'
```
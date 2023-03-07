package com.atguigu.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.Assert.*;
@RunWith(SpringRunner.class)
@SpringBootTest
public class HelloControllerTest {
    @Autowired
    DataSource dataSource;

    @Test
    public void contextLoads() throws SQLException{
        // 如果使用druid数据源的配置，则这里dataSource的实现类是com.alibaba.druid.pool.DruidDataSource
        // 如果不使用druid，则这里使用tomcat默认的连接池：org.apache.tomcat.jdbc.pool.DataSource
        System.out.println(dataSource.getClass());
        Connection connection = dataSource.getConnection();
        System.out.println(connection);
        connection.close();
    }
}
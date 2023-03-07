package com.yzf.di;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
@MapperScan(value = "com.yzf.di.mapper")
@SpringBootApplication
//@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class SpringBootFetchDataSystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringBootFetchDataSystemApplication.class,args);
    }
}

package com.atguigu.spring5.testdemo;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GetDataSource {
    public static void main(String[] args) {
        ApplicationContext app = new ClassPathXmlApplicationContext("beanDruid.xml");
        DruidDataSource bean = app.getBean(DruidDataSource.class);
        System.out.println(bean);
    }
}

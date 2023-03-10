package com.atguigu.spring5.factorybean;

import com.atguigu.spring5.bean.Programmer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test1 {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("bean_programmer.xml");
        Programmer bean = context.getBean("ProgrammerBean", Programmer.class);
        System.out.println(bean);
    }
}

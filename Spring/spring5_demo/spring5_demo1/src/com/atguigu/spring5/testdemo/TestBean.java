package com.atguigu.spring5.testdemo;

import com.atguigu.spring5.Book;
import com.atguigu.spring5.Orders;
import com.atguigu.spring5.User;
import com.atguigu.spring5.bean.Emp;
import com.atguigu.spring5.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/14/20 1:39 PM
 */


public class TestBean {

    @Test
    public void testAdd(){
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("bean1.xml");
        User user = applicationContext.getBean("user", User.class);
        System.out.println(user);
        user.add();
    }
    @Test
    public void testBook(){
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("bean1.xml");
        Book book = applicationContext.getBean("book", Book.class);
        System.out.println(book);
    }

    @Test
    public void testOrders(){
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("bean1.xml");
        Orders orders = applicationContext.getBean("orders", Orders.class);
        orders.ordersTest();
    }

    @Test
    public void testBean1(){
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("bean2.xml");
        UserService userService = applicationContext.getBean("userService",UserService.class);
        userService.add();
    }

    @Test
    public void testBean3(){
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("bean3.xml");
        Emp emp = applicationContext.getBean("emp", Emp.class);
        System.out.println(emp);
    }

    @Test
    public void testBean4(){
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("bean4.xml");
        Emp emp = applicationContext.getBean("emp", Emp.class);
        System.out.println(emp);
    }
}

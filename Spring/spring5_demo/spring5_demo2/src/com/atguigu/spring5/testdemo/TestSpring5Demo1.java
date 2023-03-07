package com.atguigu.spring5.testdemo;

import com.atguigu.spring5.autowirex.Emp;
import com.atguigu.spring5.bean.Orders;
import com.atguigu.spring5.collectiontype.Book;
import com.atguigu.spring5.collectiontype.Course;
import com.atguigu.spring5.collectiontype.Stu;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/14/20 3:23 PM
 */


public class TestSpring5Demo1 {
    @Test
    public void testBean1(){
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("bean1.xml");
        Stu stu = applicationContext.getBean("stu",Stu.class);
        System.out.println(stu);
    }
    @Test
    public void testBean2(){
        /**
         * bean中可以控制每次新建是单实例还是多实例，默认是单实例。
         */
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("bean2.xml");
        Book book1 = applicationContext.getBean("book",Book.class);
        Book book2 = applicationContext.getBean("book",Book.class);
        System.out.println(book1);
        System.out.println(book2);
    }
    @Test
    public void testBean3(){
        /***
         * 使用工厂模式
         */
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("bean3.xml");
        Course course = applicationContext.getBean("myBean", Course.class);
        System.out.println(course);
    }
    @Test
    public void testBean4(){
        /***
         * IOC 操作 Bean 管理(bean 生命周期)
         * 1、生命周期
         * (1)从对象创建到对象销毁的过程
         * 2、bean 生命周期
         * (1)通过构造器创建 bean 实例(无参数构造)
         * (2)为 bean 的属性设置值和对其他 bean 引用(调用 set 方法)
         * (3)调用 bean 的初始化的方法(需要进行配置初始化的方法)
         * (4)bean 可以使用了(对象获取到了)
         * (5)当容器关闭时候,调用 bean 的销毁的方法(需要进行配置销毁的方法)
         */
        ClassPathXmlApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("bean4.xml");
        Orders orders = applicationContext.getBean("orders", Orders.class);
        System.out.println("第四步 获取创建bean实例对象");
        System.out.println(orders);

        applicationContext.close();
    }
    @Test
    public void test4() {
        /**
         *     <!--实现自动装配
         *         bean标签属性autowire，配置自动装配
         *         autowire属性常用两个值：
         *             byName根据属性名称注入 ，注入值bean的id值和类属性名称一样
         *             byType根据属性类型注入
         *     -->
         */
        ApplicationContext context =
                new ClassPathXmlApplicationContext("bean5.xml");
        Emp emp = context.getBean("emp", Emp.class);
        System.out.println(emp);
    }

}

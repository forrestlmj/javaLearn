package com.atguigu.spring5.test;

import com.atguigu.spring5.aopanno.User;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/23/20 3:02 PM
 */


public class TestAop {
    @Test
    public void testAopAnno() {
        ApplicationContext context =
                new ClassPathXmlApplicationContext("bean1.xml");
        User user = context.getBean("user", User.class);
        user.add();
    }

}

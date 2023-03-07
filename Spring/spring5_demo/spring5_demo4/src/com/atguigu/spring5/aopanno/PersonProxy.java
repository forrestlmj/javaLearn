package com.atguigu.spring5.aopanno;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/23/20 3:38 PM
 */

@Component
@Aspect
@Order(1)
public class PersonProxy {
    //后置通知（返回通知）

    @Before(value = "execution(* com.atguigu.spring5.aopanno.User.add(..))")
    public void afterReturning(){System.out.println("Person Before....");}
}

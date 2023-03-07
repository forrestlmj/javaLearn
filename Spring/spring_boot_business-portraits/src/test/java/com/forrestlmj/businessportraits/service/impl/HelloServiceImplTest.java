package com.forrestlmj.businessportraits.service.impl;

import com.forrestlmj.businessportraits.service.HelloService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;


@RunWith(SpringRunner.class)
@SpringBootTest
public class HelloServiceImplTest {
    @Autowired
    private HelloService helloService;

    @org.junit.Test
    public void sayHi() {
        System.out.println(helloService.sayHi());
    }
}
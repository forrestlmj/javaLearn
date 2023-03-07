package com.atguigu.springboot.controller;

import com.atguigu.springboot.bean.Person;
import com.atguigu.springboot.bean.TestValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：11/2/20 3:30 PM
 */

@RestController
public class HelloController {

    @Autowired
    private TestValue testValue;
    @Value("${person.last-name}")
    private String lastName;
    @Autowired
    private Person person;
    @GetMapping("sayHello")
    public String hello(){

        return "hello:"+person;
    }
    @GetMapping("testValue")
    public String testValue(){

        return "testValue:"+testValue.toString();
    }
}

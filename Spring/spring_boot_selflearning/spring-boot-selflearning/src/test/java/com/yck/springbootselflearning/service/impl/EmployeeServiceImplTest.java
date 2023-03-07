package com.yck.springbootselflearning.service.impl;

import com.yck.springbootselflearning.dao.Employee;
import com.yck.springbootselflearning.service.EmployeeService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
@RunWith(SpringRunner.class)
@SpringBootTest
public class EmployeeServiceImplTest {
    @Autowired
    private EmployeeService employeeService;
    @Test
    public void test1(){
        Employee e = employeeService.getEmpById(2);
        System.out.println(e);
    }
}
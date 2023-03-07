package com.yck.springbootselflearning.service.impl;

import com.yck.springbootselflearning.dao.Stu;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;
@SpringBootTest
@RunWith(SpringRunner.class)
public class StuServiceImplTest {

    @Autowired
    private StuServiceImpl stuService;
    @Test
    public void getStuById() {
        System.out.println(stuService.getStuById("11001"));
    }

    @Test
    public void saveStu() {
        Stu stu = new Stu();
        stu.setId("11001");
        stu.setTel("18811112222");
        stu.setGender("男");
        stu.setName("小杨同学");
        stuService.saveStu(stu);
    }

    @Test
    public void deleteStuById() {
        stuService.deleteStuById("11001");
    }
}
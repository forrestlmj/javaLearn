package com.yzf.di.service.impl;

import com.yzf.di.service.LogicViewInitJobService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;
@SpringBootTest
@RunWith(SpringRunner.class)
public class LogicViewInitJobServiceImplTest {



    @Autowired
    private LogicViewInitJobService logicViewInitJobService;

    @Before
    public void prepare(){

    }
    @Test
    public void getLogicViewInitJob() {
        PageRequest of = PageRequest.of(1, 10);
        logicViewInitJobService.getLogicViewInitJob("","",of);
    }
}
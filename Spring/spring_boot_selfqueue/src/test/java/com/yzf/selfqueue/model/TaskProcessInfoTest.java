package com.yzf.selfqueue.model;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.Serializable;
import java.math.BigInteger;

import static org.junit.jupiter.api.Assertions.*;
@RunWith(SpringRunner.class)
@SpringBootTest
class TaskProcessInfoTest {
    @Autowired
    private RedisTemplate<String, Serializable> serializableRedisTemplate;

    @Test
    public void rpush(){
        TaskProcessInfo taskProcessInfo = new TaskProcessInfo();
        taskProcessInfo.setTASK_ID((BigInteger.ONE));
        taskProcessInfo.setJOB_INFO("select * from dual");
//        taskProcessInfo.setResultSet(null);
        serializableRedisTemplate.opsForList().rightPush("mysql", taskProcessInfo);
    }
    @Test
    public void rpushNull(){
        TaskProcessInfo taskProcessInfo = new TaskProcessInfo();
        taskProcessInfo.setTASK_ID(null);
        taskProcessInfo.setJOB_INFO(null);
//        taskProcessInfo.setResultSet(null);
        serializableRedisTemplate.opsForList().rightPush("mysql", taskProcessInfo);
    }
}
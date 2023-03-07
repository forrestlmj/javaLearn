package com.yzf.selfqueue.util;

import com.yzf.selfqueue.model.TaskProcessInfo;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.HashMap;

import static org.junit.jupiter.api.Assertions.*;
@RunWith(SpringRunner.class)
@SpringBootTest
class RedisUtilsTest {

    @Test
    void rpush_mysql() {
        /**
         * 测试mysql队列
         */
        String key = "mysql";
        RedisUtils redisUtils = new RedisUtils();
        TaskProcessInfo taskProcessInfo = new TaskProcessInfo();
        taskProcessInfo.setTASK_ID(null);
        taskProcessInfo.setJOB_INFO("来自RedisUtilsTest的测试 rpush_mysql");
        HashMap<String,Object> hashMap = new HashMap<>();
        ArrayList<String> arrayList = new ArrayList<>();
        arrayList.add("row1");
        arrayList.add("row2");
        hashMap.put("row",arrayList);
        redisUtils.rpush(key,taskProcessInfo);
    }

    @Test
    void lpop() {
        String key = "mysql";
        RedisUtils redisUtils = new RedisUtils();
        TaskProcessInfo taskProcessInfo = redisUtils.lpop(key);
        if(taskProcessInfo != null){
            System.out.println(taskProcessInfo.getTASK_ID());
            System.out.println(taskProcessInfo.getJOB_INFO());
            System.out.println(taskProcessInfo.getTaskResultSet());
        }




    }
}
package com.yzf.selfqueue.dao;

import com.yzf.selfqueue.model.ConnectionInfo;
import com.yzf.selfqueue.model.TaskProcessInfo;
import com.yzf.selfqueue.model.TaskResultSet;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigInteger;

import static org.junit.jupiter.api.Assertions.*;
@RunWith(SpringRunner.class)
@SpringBootTest
class TaskProcessInfoDaoTest {
    @Autowired
    private TaskProcessInfoDao taskProcessInfoDao;

    @Test
    void save() {
        TaskProcessInfo taskProcessInfo = new TaskProcessInfo();
        taskProcessInfo.setTASK_ID(BigInteger.valueOf(2));


        ConnectionInfo connectionInfo = new ConnectionInfo();
        connectionInfo.setHost("127.0.0.1");
        connectionInfo.setPort("3309");
        connectionInfo.setDatabase("selfqueue_real");
        connectionInfo.setUser("root");
        connectionInfo.setPassword("123456");

        taskProcessInfo.setConnectionInfo(connectionInfo);
        taskProcessInfo.setJOB_INFO("{\"sql\":\"select * from dual\"}");

        TaskResultSet taskResultSet = new TaskResultSet();
        taskProcessInfo.setTaskResultSet(taskResultSet);

        taskProcessInfoDao.insert(taskProcessInfo);
        assertNotNull(taskProcessInfo.get_id());
        System.out.println(taskProcessInfo.get_id());
    }
}
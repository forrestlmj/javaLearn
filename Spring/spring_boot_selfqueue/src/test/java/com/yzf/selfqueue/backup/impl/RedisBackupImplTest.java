package com.yzf.selfqueue.backup.impl;

import com.yzf.selfqueue.model.TblQueryTaskMgr;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.Serializable;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;
@RunWith(SpringRunner.class)
@SpringBootTest
class RedisBackupImplTest {
    @Autowired
    private RedisTemplate<String, Serializable> serializableRedisTemplate;

    @Test
    void save() {
        TblQueryTaskMgr tblQueryTaskMgr = new TblQueryTaskMgr();
        tblQueryTaskMgr.setTask_type((long) 0);
        tblQueryTaskMgr.setTask_exec_status((long) 0);
        tblQueryTaskMgr.setTask_type((long) 1);
        tblQueryTaskMgr.setTask_id(BigInteger.valueOf(1));
        tblQueryTaskMgr.setTask_name("test");
        tblQueryTaskMgr.setJob_info("来自RedisBackupTest的测试 save");
        tblQueryTaskMgr.setCreate_time(Timestamp.valueOf(LocalDateTime.now()));
        ArrayList<TblQueryTaskMgr> tblQueryTaskMgrs= new ArrayList<>();
        tblQueryTaskMgrs.add(tblQueryTaskMgr);
        RedisBackupImpl redisBackupImpl = new RedisBackupImpl();
        assertTrue(redisBackupImpl.save(tblQueryTaskMgrs));

    }
}
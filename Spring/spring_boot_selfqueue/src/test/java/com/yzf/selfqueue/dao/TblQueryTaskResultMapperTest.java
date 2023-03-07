package com.yzf.selfqueue.dao;

import com.yzf.selfqueue.model.TblQueryTaskResult;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.*;
@RunWith(SpringRunner.class)
@SpringBootTest
class TblQueryTaskResultMapperTest {
    @Autowired
    private TblQueryTaskResultMapper tblQueryTaskResultMapper;
    @Test
    void insert() {
        TblQueryTaskResult tblQueryTaskResult = new TblQueryTaskResult();
        tblQueryTaskResult.setTask_id(2);
        tblQueryTaskResult.setDb_type(1);
        tblQueryTaskResult.setRes_url("11111212");
        assertTrue(tblQueryTaskResultMapper.insert(tblQueryTaskResult));

    }
}
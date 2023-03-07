package com.yzf.selfqueue.dao;

import com.yzf.selfqueue.model.TblQueryTaskMgr;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigInteger;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest
class TblQueryTaskMgrMapperTest {
    @Autowired
    private TblQueryTaskMgrMapper tblQueryTaskMgrMapper;
    @Test
    void getUnBackupData() {
        List<TblQueryTaskMgr> tblQueryTaskMgrs ;
        tblQueryTaskMgrs = tblQueryTaskMgrMapper.getUnBackupData();
        for(TblQueryTaskMgr tblQueryTaskMgr:tblQueryTaskMgrs){
            System.out.println(tblQueryTaskMgr.toString());
//            assertEquals(1,tblQueryTaskMgr.getTask_exec_status());
        }
    }

    @Test
    void updateStatus() {
        TblQueryTaskMgr tblQueryTaskMgr = new TblQueryTaskMgr();
        tblQueryTaskMgr.setTask_id(BigInteger.valueOf(1));
        tblQueryTaskMgrMapper.updateStatus(tblQueryTaskMgr);
    }
    @Test
    void updateStatusFinishFailed() {
        TblQueryTaskMgr tblQueryTaskMgr = new TblQueryTaskMgr();
        tblQueryTaskMgr.setTask_id(BigInteger.valueOf(1));
        tblQueryTaskMgr.setFinish_ratio(Long.valueOf(0));
//        tblQueryTaskMgr.setResult_count(Long.valueOf(13));
        tblQueryTaskMgr.setError_msg("test updateStatusFinishFailed 成功");
        tblQueryTaskMgrMapper.updateStatusFinish(tblQueryTaskMgr);
    }
    @Test
    void updateStatusFinish() {
        TblQueryTaskMgr tblQueryTaskMgr = new TblQueryTaskMgr();
        tblQueryTaskMgr.setTask_id(BigInteger.valueOf(1));
        tblQueryTaskMgr.setFinish_ratio(Long.valueOf(1));
        tblQueryTaskMgr.setResult_count(Long.valueOf(13));
        tblQueryTaskMgr.setDesc_msg("test updateStatusFinish 成功");
        tblQueryTaskMgrMapper.updateStatusFinish(tblQueryTaskMgr);
    }
}
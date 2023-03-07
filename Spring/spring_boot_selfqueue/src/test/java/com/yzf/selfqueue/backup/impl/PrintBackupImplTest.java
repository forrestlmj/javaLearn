package com.yzf.selfqueue.backup.impl;

import com.yzf.selfqueue.model.TblQueryTaskMgr;
import org.junit.Ignore;
import org.junit.jupiter.api.Test;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class PrintBackupImplTest {

    @Ignore
    void save() {
    }

    @Ignore
    void updateStatus() {
    }

    @Test
    void testSave() {
        TblQueryTaskMgr tblQueryTaskMgr = new TblQueryTaskMgr();
        tblQueryTaskMgr.setTask_state((long) 0);
        tblQueryTaskMgr.setTask_exec_status((long) 0);
        tblQueryTaskMgr.setTask_type((long) 0);
        tblQueryTaskMgr.setTask_id(BigInteger.valueOf(1));
        tblQueryTaskMgr.setTask_name("test");
        tblQueryTaskMgr.setCreate_time(Timestamp.valueOf(LocalDateTime.now()));

        tblQueryTaskMgr.setZone_port("000");

        ArrayList<TblQueryTaskMgr> tblQueryTaskMgrs= new ArrayList<>();
        tblQueryTaskMgrs.add(tblQueryTaskMgr);
        PrintBackupImpl printBackupImpl = new PrintBackupImpl();
        assertTrue(printBackupImpl.save(tblQueryTaskMgrs));
    }
}
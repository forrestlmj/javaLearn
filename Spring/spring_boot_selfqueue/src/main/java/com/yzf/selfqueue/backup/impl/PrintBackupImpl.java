package com.yzf.selfqueue.backup.impl;

import com.yzf.selfqueue.backup.Backup;
import com.yzf.selfqueue.model.TblQueryTaskMgr;

import java.util.List;

public class PrintBackupImpl extends BackupImpl {

    @Override
    public boolean save(List<TblQueryTaskMgr> tblQueryTaskMgrs) {
        try {
            for(TblQueryTaskMgr tblQueryTaskMgr:tblQueryTaskMgrs){
                createProcess(tblQueryTaskMgr);
                System.out.println(createProcess(tblQueryTaskMgr).toString());
            }
            return true;
        }catch (Exception e){
            // TODO 记录日志
            System.err.println(e);
            return false;
        }
    }
}

package com.yzf.selfqueue.backup.impl;

import com.yzf.selfqueue.backup.Backup;
import com.yzf.selfqueue.model.ConnectionInfo;
import com.yzf.selfqueue.model.TaskProcessInfo;
import com.yzf.selfqueue.model.TblQueryTaskMgr;

import java.util.List;

public class BackupImpl implements Backup {
    @Override
    public boolean save(List<TblQueryTaskMgr> tblQueryTaskMgrs){
        return true;
    }
    @Override
    public TaskProcessInfo createProcess(TblQueryTaskMgr tblQueryTaskMgr){
        TaskProcessInfo taskProcessInfo = new TaskProcessInfo();
        taskProcessInfo.setTASK_ID(tblQueryTaskMgr.getTask_id());
        taskProcessInfo.setJOB_INFO(tblQueryTaskMgr.getJob_info());
        taskProcessInfo.setDb_type(tblQueryTaskMgr.getTask_type());
        ConnectionInfo connectionInfo = new ConnectionInfo();
        connectionInfo.setHost(tblQueryTaskMgr.getZone_host());
        connectionInfo.setPort(tblQueryTaskMgr.getZone_port());
        connectionInfo.setDatabase(tblQueryTaskMgr.getZone_database_name());
        connectionInfo.setUser(tblQueryTaskMgr.getZone_user());
        connectionInfo.setPassword(tblQueryTaskMgr.getZone_password());

        taskProcessInfo.setConnectionInfo(connectionInfo);

        return taskProcessInfo;
    }
}

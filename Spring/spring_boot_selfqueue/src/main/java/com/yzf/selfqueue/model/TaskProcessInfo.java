package com.yzf.selfqueue.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;

public class TaskProcessInfo implements Serializable {
    private static final long serialVersionUID = 5237730257103305078L;

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    private String _id;
    private BigInteger TASK_ID;
    private String JOB_INFO;

    public long getDb_type() {
        return db_type;
    }

    public void setDb_type(long db_type) {
        this.db_type = db_type;
    }

    private long db_type;
    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public BigInteger getTASK_ID() {
        return TASK_ID;
    }

    public void setTASK_ID(BigInteger TASK_ID) {
        this.TASK_ID = TASK_ID;
    }

    public String getJOB_INFO() {
        return JOB_INFO;
    }

    public void setJOB_INFO(String JOB_INFO) {
        this.JOB_INFO = JOB_INFO;
    }

    public TaskResultSet getTaskResultSet() {
        return taskResultSet;
    }

    public void setTaskResultSet(TaskResultSet taskResultSet) {
        this.taskResultSet = taskResultSet;
    }

    //    public HashMap<String, Object> getResultSet() {
//        return resultSet;
//    }
//
//    public void setResultSet(HashMap<String, Object> resultSet) {
//        this.resultSet = resultSet;
//    }
    // resultSet为map不容易管理，后期应改为实体类TaskProcessResult
//    private HashMap<String,Object> resultSet;
    private TaskResultSet taskResultSet;
    private ConnectionInfo connectionInfo;

    public ConnectionInfo getConnectionInfo() {
        return connectionInfo;
    }

    public void setConnectionInfo(ConnectionInfo connectionInfo) {
        this.connectionInfo = connectionInfo;
    }
}

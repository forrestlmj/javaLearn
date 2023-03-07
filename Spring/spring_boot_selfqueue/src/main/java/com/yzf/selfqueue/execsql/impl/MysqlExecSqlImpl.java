package com.yzf.selfqueue.execsql.impl;

import com.yzf.selfqueue.model.TaskResultSet;
import com.yzf.selfqueue.runsql.imlp.RunMysqlQueueImpl;
import java.sql.SQLException;
public class MysqlExecSqlImpl extends ExecSqlImpl {
    @Override
    public TaskResultSet runSql(String sql) {
        RunMysqlQueueImpl runMysqlQueueImpl = new RunMysqlQueueImpl(taskProcessInfo.getConnectionInfo());
        try {
            runMysqlQueueImpl.open();
            taskProcessInfo.setTaskResultSet(runMysqlQueueImpl.run(sql));
            // TODO !目前问题! 每来一条sql语句就要进行断连接操作。
            if (!runMysqlQueueImpl.close()){
                System.err.println("关闭mysql连接失败");
            };
        } catch (SQLException e) {
            TaskResultSet taskResultSet = new TaskResultSet();
            taskResultSet.setSucceed(false);
            taskResultSet.setInfo(e.getMessage());
            taskProcessInfo.setTaskResultSet(taskResultSet);
        } catch (Exception e) {
            TaskResultSet taskResultSet = new TaskResultSet();
            taskResultSet.setSucceed(false);
            System.err.println(e);
            // -
            taskResultSet.setInfo("数据库连接错误");
            taskProcessInfo.setTaskResultSet(taskResultSet);
//            e.printStackTrace();
        }
        return taskProcessInfo.getTaskResultSet();
    }
}

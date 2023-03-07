package com.yzf.selfqueue.execsql;

import com.yzf.selfqueue.model.TaskProcessInfo;
import com.yzf.selfqueue.model.TaskResultSet;

public interface ExecSql {
    /**
     * 拉取sql,打开连接池，运行sql，保存结果，更新状态。
     * @param sql
     * @return
     */
    public TaskResultSet runSql(String sql);
    public boolean parseSql(TaskProcessInfo taskProcessInfo);
    public boolean getTask();
    public boolean save(TaskProcessInfo taskProcessInfo);
    public void run();
    public boolean isDMLIsSelect(String sql);
}

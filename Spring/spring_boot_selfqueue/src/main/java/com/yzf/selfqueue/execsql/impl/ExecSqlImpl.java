package com.yzf.selfqueue.execsql.impl;

import com.yzf.selfqueue.dao.TaskProcessInfoDao;
import com.yzf.selfqueue.dao.TblQueryTaskMgrMapper;
import com.yzf.selfqueue.dao.TblQueryTaskResultMapper;
import com.yzf.selfqueue.execsql.ExecSql;
import com.yzf.selfqueue.model.TaskProcessInfo;
import com.yzf.selfqueue.model.TaskResultSet;
import com.yzf.selfqueue.model.TblQueryTaskMgr;
import com.yzf.selfqueue.model.TblQueryTaskResult;
import com.yzf.selfqueue.util.ParseSql;
import com.yzf.selfqueue.util.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
@Configuration
public class ExecSqlImpl implements ExecSql {
    protected RedisUtils redisUtils = new RedisUtils();
    protected String json;
    // TODO !目前问题! 数据库连接所需要信息需要从 json解析

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    protected String sql;
    @Autowired
    public TblQueryTaskMgrMapper tblQueryTaskMgrMapper;
    @Autowired
    public TaskProcessInfoDao taskProcessInfoDao;
    @Autowired
    public TblQueryTaskResultMapper tblQueryTaskResultMapper;


    public TaskProcessInfo getTaskProcessInfo() {
        return taskProcessInfo;
    }

    public void setTaskProcessInfo(TaskProcessInfo taskProcessInfo) {
        this.taskProcessInfo = taskProcessInfo;
    }

    protected TaskProcessInfo taskProcessInfo;
    @Override
    public TaskResultSet runSql(String sql) {
        return taskProcessInfo.getTaskResultSet();
    }
    @Override
    public boolean isDMLIsSelect(String sql){
        return true;
    }
    @Override
    public boolean parseSql(TaskProcessInfo taskProcessInfo) {
        try {
            setSql(ParseSql.parse(taskProcessInfo.getJOB_INFO()));
            System.out.println(Thread.currentThread()+"解析sql:"+sql);
            return true;
        }catch (Exception e){
            System.err.println(e);
            TaskResultSet taskResultSet = new TaskResultSet();
            taskResultSet.setSucceed(false);
            taskResultSet.setInfo("无效json无法解析");
            taskProcessInfo.setTaskResultSet(taskResultSet);
            return false;
        }

    }
    @Override
    public boolean getTask() {
        // 拉取任务
        TaskProcessInfo taskProcessInfo = redisUtils.lpop("mysql");
        if(taskProcessInfo != null){
            setTaskProcessInfo(taskProcessInfo);
            System.out.println(Thread.currentThread()+"拉取任务id"+taskProcessInfo.getTASK_ID());
            return true;
        }else {
            return false;
        }

    }

    @Override
    public boolean save(TaskProcessInfo taskProcessInfo) {
        System.out.println(Thread.currentThread()+"保存任务完成。任务状态"+taskProcessInfo.getTaskResultSet().getInfo());
        // TaskProcessInfo 1.保存到存储mongodb
        taskProcessInfoDao.insert(taskProcessInfo);

        // TODO 2.更新TblQueryTaskResult
        TblQueryTaskResult tblQueryTaskResult = new TblQueryTaskResult();
        tblQueryTaskResult.setTask_id(taskProcessInfo.getTASK_ID().longValue());
        tblQueryTaskResult.setDb_type(taskProcessInfo.getDb_type());
        tblQueryTaskResult.setRes_url(taskProcessInfo.get_id());
        tblQueryTaskResultMapper.insert(tblQueryTaskResult);

        // 3.按照执行的结果，成功还是失败，更新Task表的状态。 实例化TblQueryTaskMgr，使用TblQueryTaskMgrMapper更新任务表。
        TblQueryTaskMgr tblQueryTaskMgr = new TblQueryTaskMgr();
        tblQueryTaskMgr.setTask_id(taskProcessInfo.getTASK_ID());
        tblQueryTaskMgr.setResult_count(taskProcessInfo.getTaskResultSet().getResultCount());
        if(taskProcessInfo.getTaskResultSet().isSucceed()){
            tblQueryTaskMgr.setFinish_ratio((long) 1);
            tblQueryTaskMgr.setDesc_msg(taskProcessInfo.getTaskResultSet().getInfo());
        }else {
            tblQueryTaskMgr.setFinish_ratio((long) 0);
            tblQueryTaskMgr.setError_msg(taskProcessInfo.getTaskResultSet().getInfo());
        }
        try{
            tblQueryTaskMgrMapper.updateStatusFinish(tblQueryTaskMgr);
            return true;
        }catch (Exception e){
            System.err.println(e);
            return false;
        }

    }

    @Override
    public void run() {
        if(getTask()){
            if(parseSql(getTaskProcessInfo()))
            {
                if(isDMLIsSelect(getSql())){
                    runSql(getSql());
                }else {
                    //TODO !目前问题! DDL或非DML的失败信息，也需要将resultSet存入到mongoDB
                    System.err.println("DDL或DML语句，不运行");
                    // taskProcessInfo.setResultSet(runMysqlQueue.run(sql));
                }
            }
            else {
                System.err.println("json解析失败");
            }
            // 无论是否执行Sql、执行Sql的结果成功还是失败，都进行保存。
            save(getTaskProcessInfo());
        }
    }
}

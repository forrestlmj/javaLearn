package com.yzf.selfqueue.execsql.impl;

import com.yzf.selfqueue.dao.TaskProcessInfoDao;
import com.yzf.selfqueue.dao.TblQueryTaskMgrMapper;
import com.yzf.selfqueue.model.TaskProcessInfo;
import com.yzf.selfqueue.model.TaskResultSet;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.*;

import java.math.BigInteger;
import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.assertEquals;
@RunWith(SpringRunner.class)
@SpringBootTest
//@MapperScan(basePackages = { "com.yzf.selfqueue" })
class MysqlExecSqlImplTest {
    @Autowired
    public TblQueryTaskMgrMapper tblQueryTaskMgrMapper;
    @Autowired
    public TaskProcessInfoDao taskProcessInfoDao;
//
//    MysqlExecSqlTest(TblQueryTaskMgrMapper tblQueryTaskMgrMapper) {
//        this.tblQueryTaskMgrMapper = tblQueryTaskMgrMapper;
//    }
    public TaskProcessInfo taskProcessInfo;
    public TaskResultSet taskResultSet;
    public MysqlExecSqlImpl mysqlExecSqlImpl;
    public void init(){
        taskProcessInfo = new TaskProcessInfo();
        taskResultSet = new TaskResultSet();
        mysqlExecSqlImpl = new MysqlExecSqlImpl();

        taskProcessInfo.setTaskResultSet(taskResultSet);
        mysqlExecSqlImpl.setTaskProcessInfo(taskProcessInfo);
        // 注意 这里 mapper要手动注入
        mysqlExecSqlImpl.tblQueryTaskMgrMapper = this.tblQueryTaskMgrMapper;
        mysqlExecSqlImpl.taskProcessInfoDao = this.taskProcessInfoDao;
    }


    @Test
    void runSqlInvalidConnext() {
        /**
         * TODO 1、测试连接失败
         */
        init();
//        assertFalse(mysqlExecSqlImpl.runSql("select * from sys.sys_config"))
        ;
    }
    @Test
    void runSqlInvaid() {
        /**
         * TODO 2、测试有错误的sql
         */
    }

    @Test
    void parseSql() {
        /**
         * TODO 从json中解析：1、数据库连接信息 2、sql
         *
         *
         */
    }

    @Test
    public void saveSucceedTaskResultSet() {
        /**
         * 保存执行成功的sql
         */
//        mysqlExecSqlImpl = new MysqlExecSqlImpl();
        init();
        taskProcessInfo.setTASK_ID(BigInteger.valueOf(1));
        taskResultSet.setSucceed(true);
        taskResultSet.setResultCount(Long.valueOf(13));
        taskResultSet.setInfo("测试 saveSucceedTaskResultSet 执行成功:"+ LocalDateTime.now());

        assertTrue(mysqlExecSqlImpl.save(taskProcessInfo));

    }
    @Test
    public void saveFailedTaskResultSet() {
        /**
         * 保存执行成功的sql
         */
        init();
        taskProcessInfo.setTASK_ID(BigInteger.valueOf(2));
        taskResultSet.setSucceed(false);
        taskResultSet.setInfo("测试saveFailedTaskResultSet：执行错误：...."+ LocalDateTime.now());

        assertTrue(mysqlExecSqlImpl.save(taskProcessInfo));

    }

    @Test
    void testRun() {
    }

    @Test
    void isSelect() {

    }

    @Test
    void getTask() {
    }
}
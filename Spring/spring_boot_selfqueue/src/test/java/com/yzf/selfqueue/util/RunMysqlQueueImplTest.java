package com.yzf.selfqueue.util;

import com.yzf.selfqueue.model.ConnectionInfo;
import com.yzf.selfqueue.model.TaskResultSet;
import com.yzf.selfqueue.runsql.imlp.RunMysqlQueueImpl;
import org.junit.Ignore;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;
@RunWith(SpringRunner.class)
@SpringBootTest
class RunMysqlQueueImplTest {
    private ConnectionInfo connectionInfo = new ConnectionInfo();
//    @BeforeEach
    void init(){
        connectionInfo.setHost("127.0.0.1");
        connectionInfo.setPort("3309");
        connectionInfo.setDatabase("selfqueue_real");
        connectionInfo.setUser("root");
        connectionInfo.setPassword("123456");
    }

    @Test
    void runInvalidDatabaseName() {
        /**
         * 错误的数据库连接
         */
        init();
        connectionInfo.setDatabase("doesnotexisit");
        RunMysqlQueueImpl runMysqlQueueImpl = new RunMysqlQueueImpl(connectionInfo);
        try {
            runMysqlQueueImpl.open();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            assertEquals("Unknown database 'doesnotexisit'",e.getMessage());
//            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    @Test
    void run() throws Exception {
        /**
         * 正确的sql
         */
        init();
        RunMysqlQueueImpl runMysqlQueueImpl = new RunMysqlQueueImpl(connectionInfo);
        runMysqlQueueImpl.open();
        TaskResultSet taskResultSet = runMysqlQueueImpl.run("select * from TBL_QUERY_TASK_MGR;");
        assertEquals(taskResultSet.isSucceed(),true);
        assertNotNull(taskResultSet.getResultCount());
        System.out.println(taskResultSet.getInfo());
        System.out.println("行数:"+taskResultSet.getResultCount());
        System.out.println("---");
    }

//    @Test
    @Ignore
    void runCancatLine() throws Exception {
        /**
         * 正确的sql,返回10行内的结果。取消，
         */
        init();
        RunMysqlQueueImpl runMysqlQueueImpl = new RunMysqlQueueImpl(connectionInfo);
        runMysqlQueueImpl.open();
//        runMysqlQueueImpl.setMaxReturnRowNumbers(10);
        TaskResultSet taskResultSet = runMysqlQueueImpl.run("select * from TBL_QUERY_TASK_MGR;");
//        assertEquals(hashMap);
        assertEquals(taskResultSet.isSucceed(),true);
    }


    @Test
    void tabledoesnotexist() throws Exception {
        /**
         * 错误的sql,无表
         */
        init();
        RunMysqlQueueImpl runMysqlQueueImpl = new RunMysqlQueueImpl(connectionInfo);
        runMysqlQueueImpl.open();

        TaskResultSet taskResultSet = runMysqlQueueImpl.run("select * from notexact;");
        assertEquals(taskResultSet.isSucceed(),false);
        System.err.println(taskResultSet.getInfo());
    }
    @Test
    void InvalidSyntax() throws Exception {
        /**
         * 错误的sql"You have an error in your SQL syntax"
         */
        init();
        RunMysqlQueueImpl runMysqlQueueImpl = new RunMysqlQueueImpl(connectionInfo);
        runMysqlQueueImpl.open();

        TaskResultSet taskResultSet = runMysqlQueueImpl.run("sdfsdf * sdfs sdfsdf;");
        assertEquals(taskResultSet.isSucceed(),false);
        System.err.println(taskResultSet.getInfo());
    }
}
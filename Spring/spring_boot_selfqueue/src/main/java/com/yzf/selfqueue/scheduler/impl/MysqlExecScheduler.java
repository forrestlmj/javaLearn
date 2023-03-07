package com.yzf.selfqueue.scheduler.impl;

import com.yzf.selfqueue.dao.TaskProcessInfoDao;
import com.yzf.selfqueue.dao.TblQueryTaskMgrMapper;
import com.yzf.selfqueue.execsql.impl.MysqlExecSqlImpl;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
@Configuration      //1.主要用于标记配置类，兼备Component的效果。
@EnableScheduling   // 2.开启定时任务
@Async("MysqlExecutor")
public class MysqlExecScheduler extends MysqlExecSqlImpl {
    @Scheduled(fixedDelay = 200L)
    public void configureTasks() {
        run();
    }
}

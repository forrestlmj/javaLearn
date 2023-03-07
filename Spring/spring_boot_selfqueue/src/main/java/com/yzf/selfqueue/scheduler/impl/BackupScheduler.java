package com.yzf.selfqueue.scheduler.impl;

import com.yzf.selfqueue.backup.impl.RedisBackupImpl;
import com.yzf.selfqueue.dao.TblQueryTaskMgrMapper;
import com.yzf.selfqueue.model.TblQueryTaskMgr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.time.LocalDateTime;
import java.util.List;

@Configuration      //1.主要用于标记配置类，兼备Component的效果。
@EnableScheduling   // 2.开启定时任务
public class BackupScheduler {
    // TODO Bug，初始化时候时候，读取线程丢失的查询数据（也就是上次停机时候，任务表中被锁为正在执行的数据）确认缓存中确实没有（如果缓存中有，则等消费队列自动拉取即可），那么将这些数据状态赋值为未运行运行
    public static Logger logger = LoggerFactory.getLogger(BackupScheduler.class);
    private final TblQueryTaskMgrMapper tblQueryTaskMgrMapper;
    public BackupScheduler(TblQueryTaskMgrMapper tblQueryTaskMgrMapper) {
        this.tblQueryTaskMgrMapper = tblQueryTaskMgrMapper;
    }

    //3.添加定时任务
    @Scheduled(cron = "0/1 * * * * ?")
    //或直接指定时间间隔，例如：1秒
    //@Scheduled(fixedRate=5000)
    public void configureTasks() throws InterruptedException {
        /**
         * 注意查询的异常处理
         */
        System.err.println("查询数据库: " + LocalDateTime.now());
        RedisBackupImpl redisBackupImpl = new RedisBackupImpl();

        List<TblQueryTaskMgr> tblQueryTaskMgrs = this.tblQueryTaskMgrMapper.getUnBackupData();
        if (tblQueryTaskMgrs.size()>0){
            // 更新状态库
            if(redisBackupImpl.save(tblQueryTaskMgrs) ){
                for(TblQueryTaskMgr tblQueryTaskMgr:tblQueryTaskMgrs){
                    this.tblQueryTaskMgrMapper.updateStatus(tblQueryTaskMgr);
                }
                System.out.println("查询完成： " + LocalDateTime.now());
            };
        }else {
            System.err.println("已备份至最新数据。");
        }
    }


}
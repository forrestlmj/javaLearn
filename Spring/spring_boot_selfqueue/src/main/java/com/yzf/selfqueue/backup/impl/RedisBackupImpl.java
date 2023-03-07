package com.yzf.selfqueue.backup.impl;

import com.yzf.selfqueue.backup.Backup;
import com.yzf.selfqueue.model.ConnectionInfo;
import com.yzf.selfqueue.model.TaskProcessInfo;
import com.yzf.selfqueue.model.TblQueryTaskMgr;
import com.yzf.selfqueue.util.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
public class RedisBackupImpl extends BackupImpl {
//    @Resource
//    private RedisTemplate<String, Serializable> serializableRedisTemplate;
//    @Resource
//    private RedisUtils redisUtils;
    RedisUtils redisUtils = new RedisUtils();

    @Override
    public boolean save(List<TblQueryTaskMgr> tblQueryTaskMgrs) {
        try {
            for(TblQueryTaskMgr tblQueryTaskMgr:tblQueryTaskMgrs){
                if (tblQueryTaskMgr.getTask_type() == 1){
                    //插入到mysql
                    rpush("mysql",tblQueryTaskMgr);
                    System.err.println(tblQueryTaskMgr.toString()+"up to redis succeed.");
                }
            }
        }catch (Exception e){
            System.err.println(e);
            return false;
        }

        return true;
    }

    private void rpush(String key,TblQueryTaskMgr tblQueryTaskMgr){
        // 这里把连接信息放入
        redisUtils.rpush(key,createProcess(tblQueryTaskMgr));
    }
}

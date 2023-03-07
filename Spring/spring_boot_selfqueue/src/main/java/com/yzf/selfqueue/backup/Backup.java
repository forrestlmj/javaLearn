package com.yzf.selfqueue.backup;

import com.yzf.selfqueue.model.TaskProcessInfo;
import com.yzf.selfqueue.model.TblQueryTaskMgr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.Serializable;
import java.util.List;

public interface Backup {
    /**
     * 备份taskTables
     * @param TblQueryTaskMgr 读取到未备份任务列表队列
     * @return 是否全部备份成功
     */
//    @Autowired
//    RedisTemplate<String, Serializable> serializableRedisTemplate = null;

    //    boolean save(List<TaskTable> taskTables);
    boolean save(List<TblQueryTaskMgr> tblQueryTaskMgrs);
    TaskProcessInfo createProcess(TblQueryTaskMgr tblQueryTaskMgr);
}

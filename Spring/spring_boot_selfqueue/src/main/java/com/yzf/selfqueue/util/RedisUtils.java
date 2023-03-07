package com.yzf.selfqueue.util;

import com.yzf.selfqueue.model.TaskProcessInfo;
import com.yzf.selfqueue.model.TblQueryTaskMgr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.Serializable;
@Component
public class RedisUtils {
    @Autowired
    private RedisTemplate<String, Serializable> serializableRedisTemplate;
    private static RedisUtils redisUtils;

    public static RedisUtils getRedisUtils() {
        return redisUtils;
    }

    public static void setRedisUtils(RedisUtils redisUtils) {
        RedisUtils.redisUtils = redisUtils;
    }
    public RedisUtils() {
    }
    @PostConstruct
    public void init() {
        redisUtils = this;
        redisUtils.serializableRedisTemplate = this.serializableRedisTemplate;
//        redisUtils.stringRedisTemplate = this.stringRedisTemplate;
    }
    public void rpush(String key,TaskProcessInfo taskProcessInfo){
        redisUtils.serializableRedisTemplate.opsForList().rightPush(key, taskProcessInfo);
    }
    public TaskProcessInfo lpop(String key){
        Object o = redisUtils.serializableRedisTemplate.opsForList().leftPop(key);
        return (TaskProcessInfo) o;
    }
//    public boolean isEmpty(String key){
//        return redisUtils.serializableRedisTemplate.opsForList().size(key) == 0;
//    }
}

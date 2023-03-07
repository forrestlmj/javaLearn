package com.yzf.selfqueue.dao;

import com.mongodb.BasicDBObject;
import com.yzf.selfqueue.model.TaskProcessInfo;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

@Component
public class TaskProcessInfoDao {

    @Autowired
    private MongoTemplate mongoTemplate;

    public void insert(TaskProcessInfo taskProcessInfo){

        mongoTemplate.insert(taskProcessInfo,taskProcessInfo.getClass().getSimpleName());

    }
    public void find(TaskProcessInfo taskProcessInfo){

    }
}

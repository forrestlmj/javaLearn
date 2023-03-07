package com.yzf.selfqueue.dao;

import com.yzf.selfqueue.model.TblQueryTaskResult;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TblQueryTaskResultMapper {
    //TODO sql存储结果与task的映射。
    @Insert("insert into di.task_res(task_id,res_url,db_type) values(#{task_id},#{res_url},#{db_type}) ")
    boolean insert(TblQueryTaskResult tblQueryTaskResult);

}

package com.yzf.selfqueue.dao;

import com.yzf.selfqueue.model.TblQueryTaskMgr;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;

import java.util.List;
@Mapper
public interface TblQueryTaskMgrMapper {
    /**
     * 扫描任务表，获得未查询的语句。
     * @return
     */
//    @Select("select * from tbl_query_task_mgr where task_exec_status = 1")
//    List<TblQueryTaskMgr> getUnBackupData();
    @Select("select t1.task_id,t1.job_info,t1.task_type,t1.zone_id,t2.zone_database_name,t2.zone_host,t2.zone_port,t2.zone_user,t2.zone_password from tbl_query_task_mgr t1 \n" +
            "left join tbl_datazone_def t2\n" +
            "on t1.zone_id = t2.zone_id\n" +
            "where task_exec_status = 1;")
    List<TblQueryTaskMgr> getUnBackupData();

    /**
     * 将任务表中的task_exec_status设为2，执行中，同时记录start_time
     * @param tblQueryTaskMgr
     */
    @Update("update tbl_query_task_mgr set task_exec_status = 2,start_time = current_timestamp() where task_id = #{task_id} ")
    void updateStatus(TblQueryTaskMgr tblQueryTaskMgr);

    /**
     * 将任务表中的task_exec_status设为0，执行完成，同时记录finish_time、结果条数，成功信息，错误信息
     * @param tblQueryTaskMgr
     */
    @Update("update tbl_query_task_mgr set task_exec_status = 0,finish_time = current_timestamp(),result_count = #{result_count}," +
            "finish_ratio = #{finish_ratio},error_msg = #{error_msg},desc_msg = #{desc_msg} where task_id = #{task_id}")
    void updateStatusFinish(TblQueryTaskMgr tblQueryTaskMgr);
}

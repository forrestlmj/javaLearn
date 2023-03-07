package com.yzf.selfqueue.model;

import javax.swing.*;
import java.sql.Timestamp;
import java.math.BigInteger;
public class TblQueryTaskMgr {
    private  BigInteger task_id;
    private  Long task_state;
    private  Long task_exec_status;
    private  Long task_type;
    private  String task_name;
    private  Long user_id;

    public BigInteger getTask_id() {
        return task_id;
    }

    public void setTask_id(BigInteger task_id) {
        this.task_id = task_id;
    }

    public Long getTask_state() {
        return task_state;
    }

    public void setTask_state(Long task_state) {
        this.task_state = task_state;
    }

    public Long getTask_exec_status() {
        return task_exec_status;
    }

    public void setTask_exec_status(Long task_exec_status) {
        this.task_exec_status = task_exec_status;
    }

    public Long getTask_type() {
        return task_type;
    }

    public void setTask_type(Long task_type) {
        this.task_type = task_type;
    }

    public String getTask_name() {
        return task_name;
    }

    public void setTask_name(String task_name) {
        this.task_name = task_name;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Timestamp getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Timestamp create_time) {
        this.create_time = create_time;
    }

    public Timestamp getStart_time() {
        return start_time;
    }

    public void setStart_time(Timestamp start_time) {
        this.start_time = start_time;
    }

    public Timestamp getFinish_time() {
        return finish_time;
    }

    public void setFinish_time(Timestamp finish_time) {
        this.finish_time = finish_time;
    }

    public Long getFinish_ratio() {
        return finish_ratio;
    }

    public void setFinish_ratio(Long finish_ratio) {
        this.finish_ratio = finish_ratio;
    }

    public Long getDelete_flag() {
        return delete_flag;
    }

    public void setDelete_flag(Long delete_flag) {
        this.delete_flag = delete_flag;
    }

    public String getError_msg() {
        return error_msg;
    }

    public void setError_msg(String error_msg) {
        this.error_msg = error_msg;
    }

    public String getDesc_msg() {
        return desc_msg;
    }

    public void setDesc_msg(String desc_msg) {
        this.desc_msg = desc_msg;
    }

    public Long getPriority_level() {
        return priority_level;
    }

    public void setPriority_level(Long priority_level) {
        this.priority_level = priority_level;
    }

    public Long getResult_count() {
        return result_count;
    }

    public void setResult_count(Long result_count) {
        this.result_count = result_count;
    }

    public String getJob_info() {
        return job_info;
    }

    public void setJob_info(String job_info) {
        this.job_info = job_info;
    }

    private Timestamp create_time;
    private  Timestamp start_time;
    private  Timestamp finish_time;
    private  Long finish_ratio;
    private  Long delete_flag;
    private  String error_msg;
    private  String desc_msg;
    private  Long priority_level;
    private  Long  result_count;
    private  String job_info ;
    public String toString(){
        return String.format(this.getTask_id().toString()+this.getTask_name()+this.job_info);
    }


    private long zone_id;
    private String  zone_name;
    private String  zone_host;

    public long getZone_id() {
        return zone_id;
    }

    public void setZone_id(long zone_id) {
        this.zone_id = zone_id;
    }

    public String getZone_name() {
        return zone_name;
    }

    public void setZone_name(String zone_name) {
        this.zone_name = zone_name;
    }

    public String getZone_host() {
        return zone_host;
    }

    public void setZone_host(String zone_host) {
        this.zone_host = zone_host;
    }

    public String getZone_port() {
        return zone_port;
    }

    public void setZone_port(String zone_port) {
        this.zone_port = zone_port;
    }

    public String getZone_user() {
        return zone_user;
    }

    public void setZone_user(String zone_user) {
        this.zone_user = zone_user;
    }

    public String getZone_password() {
        return zone_password;
    }

    public void setZone_password(String zone_password) {
        this.zone_password = zone_password;
    }

    public String getZone_database_name() {
        return zone_database_name;
    }

    public void setZone_database_name(String zone_database_name) {
        this.zone_database_name = zone_database_name;
    }

    private String  zone_port;
    private String  zone_user;
    private String  zone_password;
    private String  zone_database_name;
}

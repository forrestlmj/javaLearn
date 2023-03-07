package com.yzf.selfqueue.model;

public class TblQueryTaskResult {
    private long id;
    private long task_id;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getTask_id() {
        return task_id;
    }

    public void setTask_id(long task_id) {
        this.task_id = task_id;
    }

    public String getRes_url() {
        return res_url;
    }

    public void setRes_url(String res_url) {
        this.res_url = res_url;
    }

    public long getDb_type() {
        return db_type;
    }

    public void setDb_type(long db_type) {
        this.db_type = db_type;
    }

    private String res_url;
    private long db_type;

}

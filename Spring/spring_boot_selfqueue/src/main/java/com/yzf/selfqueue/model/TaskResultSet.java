package com.yzf.selfqueue.model;

import java.util.ArrayList;

public class TaskResultSet {
    private Long resultCount;
    private boolean isSucceed;

    public Long getResultCount() {
        return resultCount;
    }

    public void setResultCount(Long resultCount) {
        this.resultCount = resultCount;
    }

    public boolean isSucceed() {
        return isSucceed;
    }

    public void setSucceed(boolean succeed) {
        isSucceed = succeed;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public ArrayList<Object> getContent() {
        return content;
    }

    public void setContent(ArrayList<Object> content) {
        this.content = content;
    }

    private String info;
    private ArrayList<Object> content;
}

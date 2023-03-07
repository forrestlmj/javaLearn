package com.atguigu.spring5.bean;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/14/20 2:24 PM
 */


public class Dept {
    private String dname;

    @Override
    public String toString() {
        return "Dept{" +
                "dname='" + dname + '\'' +
                '}';
    }

    public void setDname(String dname) {
        this.dname = dname;
    }
}

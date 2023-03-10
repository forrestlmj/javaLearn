package com.atguigu.spring5.autowirex;

public class Dept {
    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    @Override
    public String toString() {
        return "Dept{" +
                "ename='" + ename + '\'' +
                '}';
    }

    private String ename;


}

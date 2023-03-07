package com.atguigu.spring5.collectiontype;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/14/20 3:29 PM
 */


public class Course {
    private String cname;

    @Override
    public String toString() {
        return "Course{" +
                "cname='" + cname + '\'' +
                '}';
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}

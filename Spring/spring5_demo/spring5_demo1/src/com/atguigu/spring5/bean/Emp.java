package com.atguigu.spring5.bean;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/14/20 2:23 PM
 */


public class Emp {
    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    private String ename;
    private String gender;

    private Dept dept;

    @Override
    public String toString() {
        return "Emp{" +
                "ename='" + ename + '\'' +
                ", gender='" + gender + '\'' +
                ", dept=" + dept +
                '}';
    }

    public void add(){
        System.out.println(ename+"::"+gender+"::"+dept);
    }
}

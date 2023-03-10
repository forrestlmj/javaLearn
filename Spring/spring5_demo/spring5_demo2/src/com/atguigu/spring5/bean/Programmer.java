package com.atguigu.spring5.bean;

public class Programmer {
    private String name;

    @Override
    public String toString() {
        return "Programmer{" +
                "name='" + name + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Programmer(String name) {
        this.name = name;
    }
}

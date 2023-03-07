package com.atguigu.springboot.bean;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：11/2/20 7:25 PM
 */

public class Dog {

    private String name;

    @Override
    public String toString() {
        return "Dog{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    private Integer age;

}

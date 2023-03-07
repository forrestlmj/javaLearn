package com.atguigu.spring5;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/23/20 11:33 AM
 */


public class UserDaoImpl implements UserDao{
    @Override
    public int add(int a, int b) {
        System.out.println("add方法执行....");
        return a+b;
    }

    @Override
    public String update(String id) {
        System.out.println("update方法执行....");
        return id;
    }
}

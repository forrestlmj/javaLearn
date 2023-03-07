package com.atguigu.spring5.service;

import com.atguigu.spring5.dao.UserDao;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/14/20 1:58 PM
 */


public class UserService {
    private UserDao userDao;
    public void setUserDao(UserDao userDao){
        this.userDao = userDao;
    }

    public void add(){
        System.out.println("service add .....");
        userDao.update();
    }
}

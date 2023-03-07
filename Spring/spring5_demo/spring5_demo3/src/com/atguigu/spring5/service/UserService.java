package com.atguigu.spring5.service;

import com.atguigu.spring5.dao.UserDao;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/15/20 5:37 PM
 */

@Service
public class UserService {
    @Value(value = "ss")
    private String name;
    // name UserDaoImpl1 扫描Repository
    @Resource(name = "userDaoImpl1")
    private UserDao userDao;

    public void add(){
        System.out.println("service add ...."+name);
        userDao.add();
    }
}
 
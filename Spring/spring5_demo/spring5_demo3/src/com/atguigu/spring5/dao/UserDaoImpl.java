package com.atguigu.spring5.dao;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/15/20 5:27 PM
 */
import org.springframework.stereotype.Repository;

@Repository(value = "userDaoImpl1")
public class UserDaoImpl implements UserDao{
    @Override
    public void add() {
        System.out.println("dao add.....");
    }
}

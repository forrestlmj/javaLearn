package com.atguigu.spring5.dao;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/15/20 5:27 PM
 */
import org.springframework.stereotype.Repository;

@Repository(value = "UserDaoImpl2")
public class UserDaoImpl2 implements UserDao{
    @Override
    public void add() {
        System.out.println("dao add By UserDaoImpl2.....");
    }
}

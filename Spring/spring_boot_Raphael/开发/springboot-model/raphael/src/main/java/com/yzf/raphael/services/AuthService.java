package com.yzf.raphael.services;

import com.yzf.raphael.model.Mysql.User;

public interface AuthService {
    boolean register(User userToAdd);
    String login(String username, String password);
}

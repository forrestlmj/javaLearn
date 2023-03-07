package com.yzf.raphael.services.impl;

import com.yzf.raphael.mapper.MysqlMapping.UserMapper;
import com.yzf.raphael.model.Mysql.User;
import com.yzf.raphael.services.AuthService;
import com.yzf.raphael.util.JwtTokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/10/20 4:16 PM
 */

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Resource
    private UserMapper userMapper;
    @Override
    public boolean register(User userToAdd) {
        final String username = userToAdd.getUsername();
        if(userMapper.getUserByName(username) != null){
            // TODO 返回已注册
            return false;
        }
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        final String rawPassword = userToAdd.getPassword();
        userToAdd.setPassword(encoder.encode(rawPassword));
        userMapper.save(userToAdd);
        return true;
    }

    @Override
    public String login(String username, String password) {

        UsernamePasswordAuthenticationToken upToken = new UsernamePasswordAuthenticationToken( username, password );
        final Authentication authentication = authenticationManager.authenticate(upToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        final UserDetails userDetails = userDetailsService.loadUserByUsername( username );
        final String token = jwtTokenUtil.generateToken(userDetails);
        return token;
    }

}

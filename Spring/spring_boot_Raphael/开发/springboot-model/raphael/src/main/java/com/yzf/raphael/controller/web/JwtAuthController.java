package com.yzf.raphael.controller.web;

import com.yzf.raphael.model.CompanyBriefInfo;
import com.yzf.raphael.model.Mysql.User;
import com.yzf.raphael.services.AuthService;
import com.yzf.raphael.util.CheckEmail;
import com.yzf.raphael.util.Result;
import com.yzf.raphael.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;

import javax.naming.AuthenticationException;
import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/10/20 4:09 PM
 */
@Api(tags = {"注册与登录"})
@RequestMapping(value = "/authentication")
@RestController
public class JwtAuthController {
//    Logger logger = LoggerFactory.getLogger()
    @Autowired
    private AuthService authService;
    @ApiOperation(value = "登录接口", notes = "生成token。成功返回200，失败400")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Result<String> createToken(
            @RequestBody User user
    ) throws AuthenticationException{
        if (CheckEmail.checkEmail(user.getUsername()) == true){
            try{
                return ResultGenerator.genSuccessResult(authService.login( user.getUsername(), user.getPassword()));
            }catch (Exception e){
                System.out.println(e);
                return ResultGenerator.genFailResult("登录失败，用户名或密码错误");

            }
        }else {
            return ResultGenerator.genFailResult("请使用邮箱作为用户名进行登录");
        }

    }

    @ApiOperation(value = "注册接口", notes = "输入用户名密码。成功返回200，失败400")
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public Result<String> register(
            @RequestBody User user
    ) throws AuthenticationException{
        if(authService.register(user) == true){
            return ResultGenerator.genSuccessResult("注册成功");
        }else
            return ResultGenerator.genFailResult("已注册，请直接登录");
    }

}

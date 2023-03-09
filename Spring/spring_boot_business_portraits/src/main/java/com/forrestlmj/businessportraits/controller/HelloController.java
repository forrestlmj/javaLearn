package com.forrestlmj.businessportraits.controller;


import com.forrestlmj.businessportraits.dao.HelloMessage;
import com.forrestlmj.businessportraits.service.HelloService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
@Api(tags = {"hello world模块"})
@RestController
public class HelloController {

    @Autowired
    private HelloService helloService;
    @ApiOperation(value = "hello接口",notes = "hello接口的描述")
    @GetMapping("/hello")
    public String hello(){

        return helloService.sayHi();
    }

    @ApiOperation(value = "带有参数的hello接口", notes = "带有参数的hello接口的描述")
    @GetMapping("/hello/param")
    public String helloParma(@Parameter @ApiParam(value = "参数", defaultValue = "王先生") String param){
        return helloService.sayHi()+param;
    }

    @ApiOperation(value = "restful风格的hello message接口-GET",notes = "请求路径中带有hello message id的请求标志")
    @GetMapping("/hello/meassge/{id}")
    public HelloMessage helloMessage(@PathVariable @ApiParam(value = "HelloMessage", defaultValue = "1") Integer id){
        return new HelloMessage(id,"你好","杨先生");
    }
}

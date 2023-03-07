package com.atguigu.springboot.config;

import com.atguigu.springboot.bean.Person;
import com.atguigu.springboot.service.HelloService;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * The type My app config.
 *
 * @author ：xxx
 * @description：@Configuration: 指当前类是一个配置类。用来替换之前的Spring配置文件。
 * 等同于在配置文件中用<bean></bean>配置添加组件
 * @date ：11/2/20 7:39 PM
 */
@Configuration
public class MyAppConfig {
    @Bean
    public HelloService helloService02(){
        System.out.println("配置类@Bean给容器添加组件");
        HelloService helloService = new HelloService();
//        System.out.println(helloService.toString());
        return new HelloService();
    }
}

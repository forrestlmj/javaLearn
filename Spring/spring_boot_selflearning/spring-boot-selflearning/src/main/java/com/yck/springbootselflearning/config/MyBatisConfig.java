package com.yck.springbootselflearning.config;

import org.mybatis.spring.boot.autoconfigure.ConfigurationCustomizer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author ：forrestlmj@github.com
 * @description：TODO
 * @date ：2021/1/4 上午11:37
 */

@Configuration
public class MyBatisConfig {
    Logger logger = LoggerFactory.getLogger(MyBatisConfig.class);

    @Bean
    public ConfigurationCustomizer configurationCustomizer(){
        logger.debug("加载MyBatis配置");
        return configuration -> configuration.setMapUnderscoreToCamelCase(true);
    }
}

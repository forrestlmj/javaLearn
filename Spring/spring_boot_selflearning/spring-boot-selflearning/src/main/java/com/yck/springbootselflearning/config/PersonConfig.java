package com.yck.springbootselflearning.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

/**
 * @author ：forrestlmj@github.com
 * @description：TODO
 * @date ：2021/1/2 下午3:02
 */

@Component
@ConfigurationProperties(prefix = "person")
public class PersonConfig {
    private String name;

    @Override
    public String toString() {
        return "PersonConfig{" +
                "name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    private String gender;
}

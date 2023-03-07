package com.atguigu.springboot.bean;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：11/3/20 9:28 AM
 */

@Component
public class TestValue {
    @Override
    public String toString() {
        return "TestValue{" +
                "testvalu2='" + testvalu2 + '\'' +
                '}';
    }

    @Value("${test.testvalue2}")
    private String testvalu2;
}

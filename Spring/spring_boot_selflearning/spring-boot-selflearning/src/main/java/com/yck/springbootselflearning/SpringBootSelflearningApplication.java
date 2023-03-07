package com.yck.springbootselflearning;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@MapperScan(value = "com.yck.springbootselflearning.mapper")
@SpringBootApplication
public class SpringBootSelflearningApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootSelflearningApplication.class, args);
	}

}

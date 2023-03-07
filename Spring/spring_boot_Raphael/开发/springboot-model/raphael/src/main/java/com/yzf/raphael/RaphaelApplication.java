package com.yzf.raphael;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.neo4j.repository.config.EnableNeo4jRepositories;
import springfox.documentation.oas.annotations.EnableOpenApi;
@MapperScan({"com.yzf.raphael.mapper"})
@SpringBootApplication
@EnableOpenApi
public class RaphaelApplication {

	public static void main(String[] args) {
		SpringApplication.run(RaphaelApplication.class, args);
	}

}

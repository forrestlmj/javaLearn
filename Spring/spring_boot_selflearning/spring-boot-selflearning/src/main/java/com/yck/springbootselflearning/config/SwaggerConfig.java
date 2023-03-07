package com.yck.springbootselflearning.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import javax.swing.text.Document;

/**
 * @author ：forrestlmj@github.com
 * @description：TODO
 * @date ：2021/1/1 下午4:34
 */

@Configuration
@EnableOpenApi
public class SwaggerConfig {
    Logger logger = LoggerFactory.getLogger(SwaggerConfig.class);
    @Bean
    public Docket postsApi(){
        // requestHandlerSelector决定扫描那些包作为openapi
        logger.debug("加载Swagger配置");
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("forrestlmj")
                .pathMapping("/")
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.yck.springbootselflearning"))
                .build();

    }

    private ApiInfo apiInfo(){
        return new ApiInfoBuilder()
                .title("企业画像项目")
                .description("企业画像是一个以SpringBoot技术栈的项目")
                .termsOfServiceUrl("https://blog.csdn.net/u011423145")
                .version("1.0.0")
                .build();
    }
}

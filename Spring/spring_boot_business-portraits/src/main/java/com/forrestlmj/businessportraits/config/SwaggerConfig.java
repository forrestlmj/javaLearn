package com.forrestlmj.businessportraits.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.RequestBody;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
public class SwaggerConfig {
    @Bean
    public Docket postApi(){
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("forrestlmj")
                .pathMapping("/")
                .apiInfo(generateApiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.forrestlmj.businessportraits"))
                .build();
    }

    private ApiInfo generateApiInfo(){
        return new ApiInfoBuilder()
                .title("企业画像")
                .description("企业画像是一个SpringBoot技术栈的后端项目")
                .termsOfServiceUrl("https://blog.csdn.net/u011423145")
                .version("1.0.0")
                .build();

    }



}

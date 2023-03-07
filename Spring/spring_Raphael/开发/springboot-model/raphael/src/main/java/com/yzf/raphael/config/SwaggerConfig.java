package com.yzf.raphael.config;

import com.google.common.collect.Lists;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static springfox.documentation.builders.PathSelectors.regex;

//https://stackoverflow.com/questions/50545286/spring-boot-swagger-ui-set-jwt-token
@Configuration
@EnableOpenApi
public class SwaggerConfig {

    public static final String AUTHORIZATION_HEADER = "Authorization";
    public static final String DEFAULT_INCLUDE_PATTERN = "/.*";


    @Bean
    public Docket createRestApi() {


        Docket docket = new Docket(DocumentationType.SWAGGER_2)
                .pathMapping("/")
                .apiInfo(ApiInfo.DEFAULT)
                .securityContexts(Lists.newArrayList(securityContext()))
                .securitySchemes(Lists.newArrayList(securitySchemes()));
//                .useDefaultResponseMessages(false);

        docket = docket
                .apiInfo(apiInfo())
                .select()
                .apis(
                        RequestHandlerSelectors.basePackage("com.yzf.raphael"))
//                .paths(regex(DEFAULT_INCLUDE_PATTERN))
                .build();
        return docket;

    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("拉斐尔企业画像 Restful API")
                .description("注册后，使用登录接口，获得'token'，点击Authorize填入 Bearer 'token'。\n\n"+
                        "三大报表资产负债表、现金流量表、利润表表样见：\n"+
                        "http://172.23.0.134/report/ReportServer?reportlet=dis_gs_quanguo_qykjzzcwbb2007.cpt&op=write&ztdm=727180515542700032&kjnd=2020&kjqj=6&btid=10000002&startTime=2020-06&endTime=2020-06&noFloatingCounts=485&qyid=727180515525922816&bbh=1597719798710&est=45ed3c37f1974f1599e3553846799afb4f3cfdfa"+
                        "\n\n其他表样参见UED：\n"+
                        "https://lanhuapp.com/web/#/item/project/product?pid=699205fd-1718-44e0-894f-72cfcbcd1e0e&docId=2496c312-727c-4324-9603-8d7a0dd57dd1&docType=axure&pageId=18d3b6fc77fe4176a3f7cc54891457aa&image_id=2496c312-727c-4324-9603-8d7a0dd57dd1&type=share_board&pwd=svTY&activeSectionId=&teamId=50d5b5e0-b7e0-47ba-a8be-36db0b52b3df&userId=cc3e48a3-66e4-4926-917b-32dac7fe6823&from=nav"+
                        "\n供应链关系图谱 返回数据格式支持Echarts")
                .version("1.0.0")
                .termsOfServiceUrl("")
                .build();
    }
//    private ApiKey apiKey() {
//        return new ApiKey("JWT", AUTHORIZATION_HEADER, "header");
//    }
    private List<SecurityScheme> securitySchemes() {
        return Lists.newArrayList(
                new ApiKey("JWT", AUTHORIZATION_HEADER, "header"));
    }
    private SecurityContext securityContext() {
        return SecurityContext.builder()
                .securityReferences(defaultAuth())
                .forPaths(PathSelectors.regex(DEFAULT_INCLUDE_PATTERN))
                .build();
    }

    List<SecurityReference> defaultAuth() {
        AuthorizationScope authorizationScope
                = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        return Lists.newArrayList(
                new SecurityReference("JWT", authorizationScopes));
    }

}
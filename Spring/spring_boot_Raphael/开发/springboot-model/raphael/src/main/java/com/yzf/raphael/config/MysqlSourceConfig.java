package com.yzf.raphael.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/10/20 3:35 PM
 */


@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = "com.yzf.raphael.mapper.MysqlMapping", sqlSessionTemplateRef = "mysqlSessionTemplate")
public class MysqlSourceConfig {
    @Value("${spring.mysql.username}")
    private String username;
    @Value("${spring.mysql.password}")
    private String password;

    @Value("${spring.mysql.url}")
    private String url;

    @Value("${spring.mysql.driver-class-name}")
    private String driverClass;

    @Value("${spring.mysql.maxActive}")
    private Integer maxActive;

    @Value("${spring.mysql.initialSize}")
    private Integer initialSize;

    @Value("${spring.mysql.minIdle}")
    private Integer minIdle;

    @Value("${spring.mysql.maxWait}")
    private Integer maxWait;

    @Value("${mybatis.type-aliases-package}")
    private String PACKAGE;

    @Value("${mybatis.mysql-mapper-locations}")
    private String LOCATION;

    @Bean(name = "mysqlDataSource")
    public DataSource mysqlDataSource(){
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(driverClass);
        dataSource.setUrl(url);
        dataSource.setMaxActive(maxActive);
        dataSource.setInitialSize(initialSize);
        dataSource.setMinIdle(minIdle);
        dataSource.setMaxWait(maxWait);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    @Bean(name = "mysqlTransactionManager")
    public DataSourceTransactionManager mysqlTransactionManager(){
        return new DataSourceTransactionManager(mysqlDataSource());
    }

    @Bean(name = "mysqlSessionFactory")
    public SqlSessionFactory mysqlSessionFactory() throws Exception {
        final SqlSessionFactoryBean SESSIONFACTORY = new SqlSessionFactoryBean();
        SESSIONFACTORY.setDataSource(mysqlDataSource());
        SESSIONFACTORY.setTypeAliasesPackage(PACKAGE);
        System.out.println("------------------->"+PACKAGE);
        System.out.println("---------------------->"+LOCATION);
        SESSIONFACTORY.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(LOCATION));
        SESSIONFACTORY.getObject().getConfiguration().setMapUnderscoreToCamelCase(true);//该配置将数据库中下划线自动转成驼峰命名的变量，并且只针对自定义的实体类生效，对map不生效的

        return SESSIONFACTORY.getObject();
    }

    @Bean(name = "mysqlSessionTemplate")
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier("mysqlSessionFactory") SqlSessionFactory sqlSessionFactory)
            throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}

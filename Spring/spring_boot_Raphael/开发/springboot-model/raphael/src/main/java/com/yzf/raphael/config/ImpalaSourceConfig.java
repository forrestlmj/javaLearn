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
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/21/20 8:45 PM
 */

@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = "com.yzf.raphael.mapper.ImpalaMapping", sqlSessionTemplateRef = "impalaSessionTemplate")
public class ImpalaSourceConfig {
    @Value("${spring.impala.url}")
    private String url;

    @Value("${spring.impala.driver-class-name}")
    private String driverClass;

    @Value("${spring.impala.maxActive}")
    private Integer maxActive;

    @Value("${spring.impala.initialSize}")
    private Integer initialSize;

    @Value("${spring.impala.minIdle}")
    private Integer minIdle;

    @Value("${spring.impala.maxWait}")
    private Integer maxWait;

    @Value("${mybatis.type-aliases-package}")
    private String PACKAGE;

    @Value("${mybatis.impala-mapper-locations}")
    private String LOCATION;
    @Bean(name = "impalaDataSource")
    public DataSource impalaDataSource(){
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(driverClass);
        dataSource.setUrl(url);
        dataSource.setMaxActive(maxActive);
        dataSource.setInitialSize(initialSize);
        dataSource.setMinIdle(minIdle);
        dataSource.setMaxWait(maxWait);
        return dataSource;
    }

    @Bean(name = "impalaTransactionManager")
    public DataSourceTransactionManager impalaTransactionManager(){
        return new DataSourceTransactionManager(impalaDataSource());
    }

    @Bean(name = "impalaSessionFactory")
    public SqlSessionFactory impalaSessionFactory() throws Exception {
        final SqlSessionFactoryBean SESSIONFACTORY = new SqlSessionFactoryBean();
        SESSIONFACTORY.setDataSource(impalaDataSource());
        SESSIONFACTORY.setTypeAliasesPackage(PACKAGE);
        System.out.println("------------------->"+PACKAGE);
        System.out.println("---------------------->"+LOCATION);
        SESSIONFACTORY.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(LOCATION));
        SESSIONFACTORY.getObject().getConfiguration().setMapUnderscoreToCamelCase(true);//该配置将数据库中下划线自动转成驼峰命名的变量，并且只针对自定义的实体类生效，对map不生效的
        return SESSIONFACTORY.getObject();
    }
    @Bean(name = "impalaSessionTemplate")
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier("impalaSessionFactory") SqlSessionFactory sqlSessionFactory)
            throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}

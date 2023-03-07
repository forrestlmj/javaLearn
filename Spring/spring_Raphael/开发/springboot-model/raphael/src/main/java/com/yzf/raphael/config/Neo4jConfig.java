package com.yzf.raphael.config;
import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Session;
import org.neo4j.ogm.session.SessionFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.neo4j.repository.config.EnableNeo4jRepositories;
import org.springframework.data.neo4j.transaction.Neo4jTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/20/20 9:15 PM
 */
@EnableNeo4jRepositories(basePackages = "com.yzf.raphael.repositories")
@Configuration
@EnableTransactionManagement
public class Neo4jConfig {
    /**
     * 建议按照官网配置，网上配置的例子版本往往不对
     * https://docs.spring.io/spring-data/neo4j/docs/5.3.4.RELEASE/reference/html/#reference
     */
    @Value("${spring.data.neo4j.uri}")
    private String uri;

    @Value("${spring.data.neo4j.username}")
    private String userName;

    @Value("${spring.data.neo4j.password}")
    private String password;

    @Bean
    public org.neo4j.ogm.config.Configuration getConfiguration() {
        org.neo4j.ogm.config.Configuration configuration = new org.neo4j.ogm.config.Configuration.Builder()
                .uri(uri).connectionPoolSize(100)
                .credentials(userName, password)
//                .withBasePackages("com.yzf.raphael")
                .build();

        return configuration;
    }

    @Bean
    public SessionFactory sessionFactory() {

        return new SessionFactory(getConfiguration(),"com.yzf.raphael.domain");
    }

    @Bean
    public Neo4jTransactionManager transactionManager() throws Exception {
        return new Neo4jTransactionManager(sessionFactory());
    }
}

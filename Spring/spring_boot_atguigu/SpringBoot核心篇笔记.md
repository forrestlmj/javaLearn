# 一、Spring Boot入门

说明：第一章这一部分是入门，通过即可

## 1、Spring Boot简介

## 2、微服务

## 3、环境准备

## 4、Spring Boot HelloWorld

### 4.1 创建maven项目

### 4.2 导入Spring boot相关依赖

```xml
<parent>
	<groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>1.5.9.RELEASE</version>
</parent>
<dependencies>
<dependency>
	<groupId>org.springframework.boot</groupId>
 	<artifactId>spring‐boot‐starter‐web</artifactId>
</dependency>
</dependencies>


```

### 4.3 编写一个主程序，启动Spring Boot应用

```java
@SpringBootApplication
public class HelloWorldApplication{
    public static void main(String[] args){
        SpringApplication.run(HelloWorldApplication.class, args);
    }
}

```

### 4.4 编写相关Controller

```java
@RestController
public class HelloController{
    @RequestMapping("/hello")
    public String hello(){
        return "hello;";
    }
}

```

## 5、Hello World探究

# 二、配置文件

说明：这一部分内容干货比较多，主要包括：

1、yaml文件的写法，map和list两种形式就够了

2、配置文件中属性的自动注入，也就是@Value与@ConfigurationProperties两个注解的使用，很常用。

3、yaml的多profile激活，也就是spring.activate.profile

4、自动配置的原理，这一部分还是看书理解较好。

## 1、配置文件

SpringBoot使用一个全局的配置文件，配置文件名是固定的：

* application.properties
* application.yml

配置文件作用：

* 修改SpringBoot自动配置的默认值
* SpringBoot在底层都自动配置好

YAML：

```yaml
server:
  port: 8081
 
```

XML：

```xml
<server>
	<port>8081</port>
</server>
```

## 2、YAML语法

### 2.1、基本语法

k:(空格)v：表示一对键值对，空格必须有。

以空格的缩进来控制层级关系。只要是左对齐的一列数据，都是一个层级的。

```yaml
server:
	port: 8081
	path: /hello

```

### 2.2、值的写法

分为普通写法与行内写法。

1、对象、Map

普通写法：

```yaml
friends: 
		lastName: zhangsan
		age: 20
```

行内写法：

```yaml
friends: {lastName: zhangsan,age: 18}
```

2、数组（List/Set）

```yaml
pets: 
	- cat
	- dog
	- pig

```

行内写法：

```yaml
pets: [cat,dog,pig]
```

## 3、配置文件值注入

### 3.0、Value用法

配置文件（application.properties)

```properties
person.lastName=ck
```

JavaBean:

```java

@Componet
public class Person{
    @Value("${person.lastName}")
    private String lastName;
}

```

RestController使用的时候，直接@Autowired，注入到类中即可。

```java

@RestController
public class RController{
    @Autowired
    private Person person;
    
    @GetMapping("/person")
    public String person(
    	return person.toString();
    )
}
```

### 3.1、ConfigurationProperties用法



配置文件（application.yml）

```yaml
person:
	lastName: hello
	age: 18
	boss: false
	birth: 2017/12/12
	maps: {k1: v1,k2: 12}
	lists:
		- lisi
		- zhaoliu
	dog:
		name: 小狗
		age: 18
```

JavaBean:

```java
/** 将配置文件中配置的每一个属性的值，映射到这个组件中，
 * @ConfigurationProperties: 告诉SpringBoot将本类中的所有属性和配置文件中相关的配置进行绑定。
 		@ConfigurationProperties(value = "person")，配置文件中person.xxx的所有属性一一对应。
 * 只用将这个组件注册到容器中的时候，使用（@Component）才能
@Componet
@ConfigurationProperties(value = "person")
public class Person{
	private String lastName;
	private Integer age;
	private Boolean boss;
	private Date birth;
	
	private Map<String,Object> maps;
	private List<Object> lists;
	private Dog dog;
}

```

在maven中倒入spring-boot-configuration-processor

```xml

<!‐‐导入配置文件处理器,配置文件进行绑定就会有提示‐‐>

<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring‐boot‐configuration‐processor</artifactId>
	<optional>true</optional>
</dependency>
```

### 3.2、@Value获取值与@ConfigurationProperties获取值比较



|          | @ConfigurationProperties | @Value     |
| -------- | :----------------------: | ---------- |
| 功能     | 批量注入配置文件中的属性 | 一个个指定 |
| 松散绑定 |           支持           | 不支持     |
|          |                          |            |
|          |                          |            |
|          |                          |            |

* 如果说，我们只是在某个业务逻辑中需要获取配置文件中的某个值，使用@Value
* 如果说，我们专门编写了一个JavaBean来和配置文件进行映射，我们使用@ConfigurationProperties

### 3.3、配置文件注入值数据教研

使用@Validated注解、@Email注解验证邮箱验证。

### 3.4、@PropertySource与@ImportResource & @Bean

@PropertySource:加载指定的配置文件。

```java
@PropertySource(value = {"classpath:person.properties"})
@Component
@ConfigurationProperties(prefix = "person")
public class Person{
    ...
}
```

上面的意思指的是从类路径中找到person.properties中找到person为前缀的配置，将配置注入到Person中。

[@PropertySource与@ConfigurationProperties](https://juejin.im/post/6844903992544198664)

### 3.5、使用@Configuration与@Bean给容器中添加组件

```java
/**
* @Configuration:当前类是一个配置类，用来替换之前的Spring文件。
* 等同于<bean></bean>
*/
@Configuration
public class MyAppConfig{
    //将方法的返回值返回到容器中；容器中这个组件的默认id就是方法名helloService02
    @Bean
    public HelloService helloService02(){
        return new HelloService();
    }
}

```

## 4、配置文件占位符

## 5、Profie

### 5.1、多Profile文件

默认使用application.yml文件

### 5.2 yml支持多文档块方式

yml的多文档块比properties好，因为可以在一个文件中管理所有环境。

```yaml
server:
	port: 8081
spring:
	profiles:
		active: prod
---
spring:
	profiles: dev
server:
	port: 8083

---
spring:
	profiles: prod
server:
	port: 8084
```

### 5.3、激活指定的profile

1、在yml文件中定义默认的：spring.profiles.activate=dev

2、在命令行：

java -jar spring-boot-02-config-0.0.1-SNAPSHOT.jar --spring.profiles.activate=dev;

3、虚拟机参数

-Dspring.profiles.activate=dev

## 6、配置文件的加载位置

从高到低：

-file:./config

-file:./

-classpath:/config

-classpath:/

## 7、外部配置加载顺序

从高到低：

* ###### 1、命令行参数：java -jar xxx.jar --server.port=8081

* 2、来自java:comp/env的JNDI属性

* 3、Java系统属性（System.getProperties()）

* 4、操作系统环境变量

* 5、RandomValuePropertySource

* ###### 6、jar包外部的application-{profile}.properties

* ###### 7、jar包内部的application-{profile}.properties

* ###### 8、jar包外部的application.properties

* ###### 9、jar包内部的application.properties

* 10、@Configuration注解类上的@PropertySource

## 8、自动配置原理

### 8.0、Java的四个元注解

在学习Spring的自动配置原理之前，必须了解Java的四个元注解：@Documented、@Target、@Retention、@Inherited

可以看这篇[博客](https://blog.csdn.net/lkp1603645756/article/details/84072600)，初步理解。

* @Documented。它代表着此注解会被Javadoc工具提取成文档。
* **@Target**。这个注解比较重要，代表注解可以用在什么地方。
  - ElementType.**TYPE**。类、接口、enum。
  - ElementType.**CONSTRUCTOR**。构造器声明。
  - ElemenetType.**METHOD**。方法。
  - ElemenetType.**FIELD**。域声明（包括 enum 实例） 
  - ElemenetType.**PARAMETER**。参数声明。比如@RequestParam
  - ElemenetType.**PACKAGE**。包声明
  - ElemenetType.**LOCAL_VARIABLE**。局部变量声明
* **@Retention**。表示在哪个阶段保留注解信息
  - RetentionPolicy.SOURCE。源码保留，但会被编译器丢弃。
  - RetentionPolicy.CLASS。class中可用但会被VM丢弃。
  - RetentionPolicy.RUNTIME。VM保留，因此可以通过**反射机制**读取注解的信息。
* @Inherited。允许子类继承父类中的注解。

比如经常使用的@Service注解源码是这样的：

```java
package org.springframework.stereotype;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Documented
@Target({ElementType.TYPE})
@Retention({RententionPolicy.RUNTIME})
@Component
public @interface Service{
    String value() default "";
}
```



### 8.1、自动配置原理

1、SpringBoot启动的时候加载**主配置类**，开启了自动配置功能**@EnableAutoConfiguration**。

2、@EnableAutoConfiguration作用：

* 利用EnableAutoConfigurationImportSelector给容器导入了一些组件。
* 可以查看selectImports()方法
* List configurations = getCandidateConfigurations(annotationMetadata, attributes)

```
解释：
1、SpringFactoriesLoader.loadFactoryNames()。
2、扫描所有jar包类路径下，META-INF/spring.factories。
3、把扫描到的这些文件的内容包装成properties对象。
4、从properties中获取到EnableAutoConfiguration.class类（类名）对应的值，然后把他们添加在容器中。

```

将类路径下META-INF/spring.factories里面配置的所有EnableAutoConfiguration的值加载到容器中：

```xml

# Initializers
org.springframework.context.ApplicationContextInitializer=\
org.springframework.boot.autoconfigure.SharedMetadataReaderFactoryContextInitializer,\
org.springframework.boot.autoconfigure.logging.AutoConfigurationReportLoggingInitializer

# Application Listeners
org.springframework.context.ApplicationListener=\
org.springframework.boot.autoconfigure.BackgroundPreinitializer

# Auto Configuration Import Listeners
org.springframework.boot.autoconfigure.AutoConfigurationImportListener=\
org.springframework.boot.autoconfigure.condition.ConditionEvaluationReportAutoConfigurationImportListener

# Auto Configuration Import Filters
org.springframework.boot.autoconfigure.AutoConfigurationImportFilter=\
org.springframework.boot.autoconfigure.condition.OnClassCondition

# Auto Configure
org.springframework.boot.autoconfigure.EnableAutoConfiguration=\
org.springframework.boot.autoconfigure.admin.SpringApplicationAdminJmxAutoConfiguration,\
org.springframework.boot.autoconfigure.aop.AopAutoConfiguration,\
org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration,\
org.springframework.boot.autoconfigure.batch.BatchAutoConfiguration,\
org.springframework.boot.autoconfigure.cache.CacheAutoConfiguration,\
org.springframework.boot.autoconfigure.cassandra.CassandraAutoConfiguration,\
org.springframework.boot.autoconfigure.cloud.CloudAutoConfiguration,\
org.springframework.boot.autoconfigure.context.ConfigurationPropertiesAutoConfiguration,\
org.springframework.boot.autoconfigure.context.MessageSourceAutoConfiguration,\
org.springframework.boot.autoconfigure.context.PropertyPlaceholderAutoConfiguration,\
org.springframework.boot.autoconfigure.couchbase.CouchbaseAutoConfiguration,\
org.springframework.boot.autoconfigure.dao.PersistenceExceptionTranslationAutoConfiguration,\
org.springframework.boot.autoconfigure.data.cassandra.CassandraDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.cassandra.CassandraRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.couchbase.CouchbaseDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.couchbase.CouchbaseRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.elasticsearch.ElasticsearchAutoConfiguration,\
org.springframework.boot.autoconfigure.data.elasticsearch.ElasticsearchDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.elasticsearch.ElasticsearchRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.jpa.JpaRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.ldap.LdapDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.ldap.LdapRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.mongo.MongoRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.neo4j.Neo4jDataAutoConfiguration,\
org.springframework.boot.autoconfigure.data.neo4j.Neo4jRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.solr.SolrRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration,\
org.springframework.boot.autoconfigure.data.redis.RedisRepositoriesAutoConfiguration,\
org.springframework.boot.autoconfigure.data.rest.RepositoryRestMvcAutoConfiguration,\
org.springframework.boot.autoconfigure.data.web.SpringDataWebAutoConfiguration,\
org.springframework.boot.autoconfigure.elasticsearch.jest.JestAutoConfiguration,\
org.springframework.boot.autoconfigure.freemarker.FreeMarkerAutoConfiguration,\
org.springframework.boot.autoconfigure.gson.GsonAutoConfiguration,\
org.springframework.boot.autoconfigure.h2.H2ConsoleAutoConfiguration,\
org.springframework.boot.autoconfigure.hateoas.HypermediaAutoConfiguration,\
org.springframework.boot.autoconfigure.hazelcast.HazelcastAutoConfiguration,\
org.springframework.boot.autoconfigure.hazelcast.HazelcastJpaDependencyAutoConfiguration,\
org.springframework.boot.autoconfigure.info.ProjectInfoAutoConfiguration,\
org.springframework.boot.autoconfigure.integration.IntegrationAutoConfiguration,\
org.springframework.boot.autoconfigure.jackson.JacksonAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.JdbcTemplateAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.JndiDataSourceAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.XADataSourceAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration,\
org.springframework.boot.autoconfigure.jms.JmsAutoConfiguration,\
org.springframework.boot.autoconfigure.jmx.JmxAutoConfiguration,\
org.springframework.boot.autoconfigure.jms.JndiConnectionFactoryAutoConfiguration,\
org.springframework.boot.autoconfigure.jms.activemq.ActiveMQAutoConfiguration,\
org.springframework.boot.autoconfigure.jms.artemis.ArtemisAutoConfiguration,\
org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration,\
org.springframework.boot.autoconfigure.groovy.template.GroovyTemplateAutoConfiguration,\
org.springframework.boot.autoconfigure.jersey.JerseyAutoConfiguration,\
org.springframework.boot.autoconfigure.jooq.JooqAutoConfiguration,\
org.springframework.boot.autoconfigure.kafka.KafkaAutoConfiguration,\
org.springframework.boot.autoconfigure.ldap.embedded.EmbeddedLdapAutoConfiguration,\
org.springframework.boot.autoconfigure.ldap.LdapAutoConfiguration,\
org.springframework.boot.autoconfigure.liquibase.LiquibaseAutoConfiguration,\
org.springframework.boot.autoconfigure.mail.MailSenderAutoConfiguration,\
org.springframework.boot.autoconfigure.mail.MailSenderValidatorAutoConfiguration,\
org.springframework.boot.autoconfigure.mobile.DeviceResolverAutoConfiguration,\
org.springframework.boot.autoconfigure.mobile.DeviceDelegatingViewResolverAutoConfiguration,\
org.springframework.boot.autoconfigure.mobile.SitePreferenceAutoConfiguration,\
org.springframework.boot.autoconfigure.mongo.embedded.EmbeddedMongoAutoConfiguration,\
org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration,\
org.springframework.boot.autoconfigure.mustache.MustacheAutoConfiguration,\
org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration,\
org.springframework.boot.autoconfigure.reactor.ReactorAutoConfiguration,\
org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration,\
org.springframework.boot.autoconfigure.security.SecurityFilterAutoConfiguration,\
org.springframework.boot.autoconfigure.security.FallbackWebSecurityAutoConfiguration,\
org.springframework.boot.autoconfigure.security.oauth2.OAuth2AutoConfiguration,\
org.springframework.boot.autoconfigure.sendgrid.SendGridAutoConfiguration,\
org.springframework.boot.autoconfigure.session.SessionAutoConfiguration,\
org.springframework.boot.autoconfigure.social.SocialWebAutoConfiguration,\
org.springframework.boot.autoconfigure.social.FacebookAutoConfiguration,\
org.springframework.boot.autoconfigure.social.LinkedInAutoConfiguration,\
org.springframework.boot.autoconfigure.social.TwitterAutoConfiguration,\
org.springframework.boot.autoconfigure.solr.SolrAutoConfiguration,\
org.springframework.boot.autoconfigure.thymeleaf.ThymeleafAutoConfiguration,\
org.springframework.boot.autoconfigure.transaction.TransactionAutoConfiguration,\
org.springframework.boot.autoconfigure.transaction.jta.JtaAutoConfiguration,\
org.springframework.boot.autoconfigure.validation.ValidationAutoConfiguration,\
org.springframework.boot.autoconfigure.web.DispatcherServletAutoConfiguration,\
org.springframework.boot.autoconfigure.web.EmbeddedServletContainerAutoConfiguration,\
org.springframework.boot.autoconfigure.web.ErrorMvcAutoConfiguration,\
org.springframework.boot.autoconfigure.web.HttpEncodingAutoConfiguration,\
org.springframework.boot.autoconfigure.web.HttpMessageConvertersAutoConfiguration,\
org.springframework.boot.autoconfigure.web.MultipartAutoConfiguration,\
org.springframework.boot.autoconfigure.web.ServerPropertiesAutoConfiguration,\
org.springframework.boot.autoconfigure.web.WebClientAutoConfiguration,\
org.springframework.boot.autoconfigure.web.WebMvcAutoConfiguration,\
org.springframework.boot.autoconfigure.websocket.WebSocketAutoConfiguration,\
org.springframework.boot.autoconfigure.websocket.WebSocketMessagingAutoConfiguration,\
org.springframework.boot.autoconfigure.webservices.WebServicesAutoConfiguration

# Failure analyzers
org.springframework.boot.diagnostics.FailureAnalyzer=\
org.springframework.boot.autoconfigure.diagnostics.analyzer.NoSuchBeanDefinitionFailureAnalyzer,\
org.springframework.boot.autoconfigure.jdbc.DataSourceBeanCreationFailureAnalyzer,\
org.springframework.boot.autoconfigure.jdbc.HikariDriverConfigurationFailureAnalyzer

# Template availability providers
org.springframework.boot.autoconfigure.template.TemplateAvailabilityProvider=\
org.springframework.boot.autoconfigure.freemarker.FreeMarkerTemplateAvailabilityProvider,\
org.springframework.boot.autoconfigure.mustache.MustacheTemplateAvailabilityProvider,\
org.springframework.boot.autoconfigure.groovy.template.GroovyTemplateAvailabilityProvider,\
org.springframework.boot.autoconfigure.thymeleaf.ThymeleafTemplateAvailabilityProvider,\
org.springframework.boot.autoconfigure.web.JspTemplateAvailabilityProvider

```

每一个这样的xxxAutoConfiguration类都是容器中的一个组件，都加入到容器中；用他们来做配置。

3、每一个自动配置类进行自动配置功能。

4、以**HttpEncodingAutoConfiguration**为例解释自动配置原理。TODO

```java
@Configuration
@EnableConfigurationProperties(HttpEncodingProperties.class)
@ConditionOnWebApplication
@ConditionOnClass

```



# 三、日志

说明：这部分在视频中没有讲太多实际操作，主要讲的是slf4j与logback的关系。这部分内容主要记录下，logback的xml配置如何编排好，以便于企业级的应用，

# 四、Web开发

说明：这部分视频中没有做前后端的分离，主要通过模板语言thymeleaf渲染，不再使用于一般企业的场景。而且模板语言在python技术栈也有对应的Jinji，这一类渲染类的模板语言对于后端工程师、大数据开发工程师的学习成本其实挺大的，主要原因是还是前后端工种不同，前端强调交互，后端、数据端强调稳定、准确。

因此这一块的学习重点应该是restful的api风格，比如get\post\put\delete的使用、swagger配置、前后端接口约定如返回码、认证方式（token or session）等相关内容。

另外这一块还讲了Servlet容器相关的知识，这一块内容属于原理相关的东西，大数据工程师不需要太关注。

# 五、Docker

说明：这部分视频中主要讲的是docker的使用，内容偏向入门，这部分不记录。

# 六、SpringBoot与数据访问

说明：这一部分是重点的的重点。要数量掌握

具体知识点：

1、jdbc

2、druid

3、SpringDataJPA

4、Mybatis

## 6.1、JDBC

```xml
<dependency>
	<groupId>org.framework.boot</groupId>	
    <artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>
<dependency>
	<groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <scope>runtime</scope>
</dependency>
```

```yml
spring:
	datasource:
		username: root
		password: 123456
		url: jdbc:mysql:///jdbc
		driver-class-name: com.mysql.jdbc.Driver
```

效果：

默认是用org.springframework.boot.autoconfigure.jdbc作为数据源;

数据源的相关配置在DataSourceProperties里面。

自动配置原理：

org.springframework.boot.autoconfigure.jdbc:

1、参考DataSourceConfiguration，根据配置创建数据源，默认使用Tomcat连接池；可以使用spring.datasource.type指定自定义的数据源类型。

2、SpringBoot默认可以支持：

```
org.apache.tomcat.jdbc.pool.DataSource、HikariDataSource、BasicDataSource、
```

3、自定义数据源类型

```java
@ConditionalOnMissingBean(DataSource.class)
@ConditionalOnProperty(name = "spring.datasource.type")
static class Generic {
    @Bean
    public DataSource dataSource(DataSourceProperties properties){
        // 使用DataSourceBuilder创建数据源，利用反射创建相应type的数据源，并且相关属性。
        return properties.initializeDataSourceBuilder().build();
    }
}
```

4、DataSourceInitializer:ApplicationListener;

```yml
schema:
	- classpath:department.sql
```



## 6.2、整合Druid数据源

#### 6.2.1、如果不是用Druid也可以

上述过程如果不整合durid也可以访问，只需要配置yml文件中的以下配置即可

```yml
spring:
	datasource:
		username: root
		password: root
		url: jdbc:mysql:///jdbc
		driver-class-name: com.mysql.jdbc.Driver
```

在Controller中引入JDBCTemplate

```java
@Autowired
private JDBCTemplate jdbcTemplate
    
```

然后在Controller直接写sql即可

```java
List<Map<String, Object>> map =  jdbcTemplate.query("select * from departement");
```

这个时候使用的Connection类型是：

```yml
Mybatisorg.apache.tomcat.jdbc.pool.DataSource
```

#### 6.2.2、如果使用的是Druid

只需要在yml文件中定义好datasource为druid即可，同时添加以下Druid的Config 文件，用于把ServletRegistrationBean、FilterRegistrationBean注册到SpringBoot的Servlet容器中，这样可以访问Druid的配置页面。

```java
@Configuration
public class DruidConfig {
    @ConfigurationProperties(prefix="spring.datasource")
    @Bean
    public DataSource druid(){
        return new DruidDataSource();
    }
    
    //配置Druid的配置
    //1、配置一个管理后台的Servlet
    @Bean
    public ServletRegistration statViewServlet(){
        ServletRegistrationBean bean = new ServletRegistrationBean(new StatViewServlet(), '/druid/*');
        Map<String,String> initParams = new HashMap<>();
        // 配置druid的登陆用户名
        initParams.put("loginUsername","admin");
        initParams.put("loginPassword","123456");
        // 默认就是允许所有访问
        initParams.put("allow","");
        
        bean.setInitParameters(initParams);
        return bean;
    }
}
```

## 6.3 整合MyBatis

```xml
<dependency>
	<groupId>org.mybatis.spring.boot</groupId>
	<artifactId>mybatis-spring-boot-starter</artifactId>
	<version>1.3.1</version>
</dependency>

```

步骤：

6.3.1、配置数据源相关属性。

6.3.2、给数据库建表。

6.3.3、创建JavaBean。

6.3.4、注解版

```java
@Mapper
public interface DepartmentMapper{
    @Select("select * from department where id = #{id}")
    public Department getDeptById(Integer id);
    
    @Delete("delete from department where id  = #{id}")
    public int deleteDeptById(Integer id);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into department(departmentName) value (#{departmentName})")
    public int insertDept(Department department);
    
    @Update("update department set departmentName = #{departmentName} where id = #{id}")
    public int updateDept(Department department);
}

```

6.3.5、注解版本

```xml
mybatis:
	config-location: classpath:mybatis/mybatis-config.xml
 	mapper-locations: classpath:mybaits/mapper/*.xml
```

## 6.4、整合SpringData JPA



### 6.4.1、SpringData简介

Application->SpringData->SpringData JPA/SpringData Redis/SpringData MongoDB->JPA规范->Hibernate/Toplink/OpenJPA

### 6.4.2、整合SpringData JPA

JPA;ORM 映射

1、编写一个实体类（bean）和数据表进行映射、并且配置好映射关系。

```java
@Entity
@Table(name="tbl_user")
public class User{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "last_name",length = 50)
    private String lastName;
    @Column
    private String email;
}

```

2、编写一个Dao接口来操作实体类对应的数据表

```java
public interface UserRepository extends JpaRepository<User, Integer>{
    
}
```

3、基本的JpaProperties

```java
spring:
	jpa:
		hibernate:
			ddl-auto: update
         show-sql: true
```

### 6.4.3、SpringData JPA中的知识点

1、JPA中的主键生成

Jpa的主键生成策略(GenerationTYPE)有四种:

- TABLE
- SEQUENCE
- IDENTITY
- AUTO

2、SpringDataJPA主要用到的几个关键注解如@Table、@Id、@Column、@Entity几种注解

# 七、启动配置原理

说明：这部分属于原理，暂不总结

# 八、自定义starter

说明：这部分属于定制化开发，暂不总结。

# 九、Spring Boot与swagger的集成

说明：从这部分开始，以下所有内容都是个人总结！用于记录。

## 9.1、Swagger 3.x的配置

swagger3.x的配置要比swagger2.x要简便的多。

在配置swagger2.x的时候，需要引入两个dependency:

```xml

<dependency>
	<groupId>io.springfox</groupId>
    <artifactId>springfox-swagger2</artifactId>
    <version>2.4.0</version>
</dependency>

<dependency>
	<groupId>io.springfox</groupId>
    <artifactId>springfox-swagger-ui</artifactId>
    <version>2.4.0</version>
</dependency>
```

除了配置SwaggerConfig以外，可能还要配置WebMvcAdapter的相关servlet配置，将swagger-ui的static下的页面都映射出来。

因此这里主要介绍配置swagger3的方法：

只需要引入一个pom包

```xml
<dependency>
	<groupId>io.springfox</groupId>
    <artifactId>springfox-boot-starter</artifactId>
	<version>3.0.0</version>
</dependency>
```

这个starter是3.0之后的新特性，但依旧是swagger团队自己定制的starter.

剩下只需要配置Swagger相关配置SwaggerConfig:

```java
// 配置Configrution
@Configuration
@EnableOpenApi
public class SwaggerConfig{
    // 向springboot注入Docket的Bean
    @Bean
    public Docket createApi(){
        return new Docket(DocumentationType.SWAGGER_2)
            .groupName("forrestlmj")
            .pathMapping("/")
            .apiInfo(apiInfo())
            .select()
            .build();
    }
    
    private ApiInfo apiInfo(){
        return new ApiInfoBuilder()
            .title("企业画像项目")
            .description("企业画像是一个以SpringBoot为技术栈的项目")
            .version("1.0.0")
            .build();
    }
    
}
```

## 9.2、Swagger的原理

### 9.2.1、swagger、swaggerhub、swaggerui、OAS文档、springfox

swagger不只支持java还支持其他语言

接口的设计是非常重要的，因此需要有文档来好好记录接口的意思。

springFox是swagger集成到spring framework的

### 9.2.2、swagger主要的类

注解在Configuration上。Docket、ApiInfo

注解在Bean上。ApiModel、ApiModelProperty

注解在Controller上。Api、ApiOperation、ApiParam

参考链接：

1、https://www.javainuse.com/spring/boot_swagger。印度人讲解的是视频。

2、https://www.bilibili.com/video/BV184411J7Vy?from=search&seid=7997038278609076366。b站上最全的swagger文档。

3、https://www.vojtechruzicka.com/documenting-spring-boot-rest-api-swagger-springfox/。B站视频上老哥主要查看的资料。

3、https://editor.swagger.io/，在线的swagger编辑器



# n、mybatis-plus

结合了mybatis与JPA的优点，但是用的人不多。

# n+1、dto、dao、vo等不同层之间的数据传输类型

## 为什么有这么多的数据传输类型

- 为安全性考虑，比如在数据库中存储的一些用户名密码，或是不能返回给前端展示的，同时也不能把数据库的主要字段暴露出去。
- 节省带宽，比如数据库中一些无用的信息没必要给前端或接口展示，浪费带宽。

## 每一层的基本含义

- PO。Persitant Obecct。常用。

  用于表示数据库中的一条记录映射成的java对象。PO仅仅用于表示数据，**没有任何数据操作**。通常遵守Java Bean的规范，拥有getter/setter方法。**其实对应的就是Spring Data JPA里面被注解为Entity或者Table的POJO类**。

- DAO。Data Access Object。天天在用。

  用于表示一个数据访问对象。使用DAO访问数据库，包括插入、更新、删除、查询等操作，与po一起使用。DAO一般在**持久层**(**其实就是指Spring Data Jpa与Mybatis的实现**)，完全封装数据库操作，对外暴露的方法使得上层应用不需要关注数据库相关的任何信息。

- VO。View/Value Object。常用。

  用于表示一个与前端进行交互的java对象。一般不能直接用上面的po，因为这样会暴露数据库的表结构等安全性问题。因此使用vo：只需要包行前端需要展示的数据即可，对于前端不需要的数据，比如数据创建和修改等时间字段，就不展示在vo里面了。通常遵守Java Bean的规范，拥有getter/setter方法。**其实对应的就是mvc中的controller返回前端的数据比如RequestBody、ResponseBody中包的业务数据**。

- DTO。Data Transfer Obect。其实不咋常用。

  和vo的字段差不多，通常用于不同服务或服务不同分层之间的数据传输。比如API服务需要使用的DTO就可能与VO存在差异，比如**API**服务。通常遵循Java Bean的规范，拥有getter/setter方法。这里的服务可能就是指Spring cloud中传输的dto。

- BO。Business Object。没咋见过。

  可能就是Spring Cloud中的服务调用概念。BO包含了业务逻辑，常常封装了对DAO、RPC等的调用。BO通常位于业务层，要**区分于直接对外提供服务的服务层**，可能就是指中台服务、Spring Cloud里面注册中心那一套。BO提供了基本业务单元的基本业务操作，在设计上属于被服务层业务流程调用的对象，一个业务流程可能需要调用多个BO来完成。

另外补充一下对于POJO的说明：

- POJO。Plan Old Java Object。和上面不一样。就是一个简单的java对象，上面说的PO\VO\DTO属于典型的POJO。而DAO、BO一般都不是POJO，因为他们类似于Mybatis、Spring DataJPA、Spring Cloud、rpc，属于操作po\vo\dto的主体。

## 这些数据传输类型如何在mvc中转化

如下图：

![](/home/yzf/IdeaProjects/Spring-Boot-In-Action/springboot_atguigu/img/po_vo_dto.jpg)

## 那么每一层之间有什么转换方案

目前主要方案有两种Model Mapper与MapStruct、BeanUtils（Apache/Spring）下都有

TODO **待教程补充**



参考链接：

1、https://www.zhihu.com/question/39651928，关于po、dto的讨论，知乎上的讨论值得一看。

2、https://zhuanlan.zhihu.com/p/102389552，dto、dao的总结。

3、https://www.baeldung.com/entity-to-and-from-dto-for-a-java-spring-application，Model Mapper的使用指南。

4、https://zhuanlan.zhihu.com/p/81264434，Model Mapper同类型的MapStruct的使用指南。

5、https://en.wikipedia.org/wiki/Data_access_object。wiki上对于DAO的解释，有增删改查的方法。给我的感觉就是提供一个interface 层，来访问数据库，与JPA的Repository和Mybatis的Mapper层功能是一样的。就是MVC中的model。












































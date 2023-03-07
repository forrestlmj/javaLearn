# 课程内容介绍
1、Spring框架描述
2、IOC容器
    2.1、IOC底层原理
    2.2、IOC接口（BeanFactory)
    2.3、IOC操作Bean管理（基于XML）
    2.4、IOC操作Bean管理（基于注解）
3、AOP
4、JDBCTemplate
5、事务管理


# Spring5框架描述
1、Spring是轻量级的JavaEE框架。
2、Spring有两个核心部分：IOC和AOP。
    2.1、IOC：控制反转，把创建对象的过程交给Spring管理。
    2.2、AOP：面向切面，不修改源代码进行功能增强。
3、方便进行事务操作
# IOC（概念与原理）
## 什么是IOC?
- 控制反转，把对象创建与对象调用之间的调用过程，交给Spring进行管理。
   1. 使用IOC的目的：降低耦合。
   2. 做入门案例就是IOC的实现。

- IOC底层原理
   1. xml解析。
   2. 工厂模式。
   3. 反射

## IOC（BeanFacory接口）
- IOC思想基于IOC容器完成，IOC容器底层就是对象工厂。
- Spring提供IOC容器实现两种方式：（两个接口）
   1. BeanFactory:IOC容器基本实现，是Spring内部的使用接口，不提供开发人员进行使用（加载配置文件时候不会创建对象，在获取对象（使用）才创建对象）。
   2. ApplicationContext：BeanFactory接口的字接口，提供更多更强大的功能，一般由开发人员进行使用（加载配置文件时候就会把配置文件中的对象进行创建）。

- ApplicationContext接口的实现类：
   1. FileSystemXmlApplicationContext。
   2. ClassXpathXmlApplicationCOntext。

## IOC操作Bean管理（概念）
- 什么是Bean管理
   * Bean管理包含两个操作：
   	1.  Spring创建对象。
    2. Spring注入属性。
- Bean管理操作有两种方式
    1. 基于xml配置文件方式实现。
    2. 基于注解方式实现。


## IOC操作Bean管理（基于xml创建对象与普通注入）
- 基于xml方式创建对象
    * 在Spring配置文件中，使用bean标签，标签里面添加对应属性，就可以实现对象创建。
    * 在bean标签有很多属性，介绍常用的属性。
        1. id属性：唯一标识。
        2. class属性：类全路径，用于标识这个标签页中对象属于哪个类。
    * 使用bean的xml方式创建对象的时候，默认使用的是无参构造方法。
- 基于xml方式注入属性。
    * DI：依赖注入，就是注入属性。
    * 第一种注入方式，使用set方法进行注入。
        1. 创建类，定义属性和对应的set方法。
        2. 在xml文件中，使用property标签，配置属性注入：
```html
<property name="bname" value="ss"></property>
```

  * 第二种注入方式，使用有参数构造进行注入。
        1. 创建类，定义属性，创建属性对应有参数构造方法。
        2. 在spring配置文件中进行配置。

```html        		        
<bean>
 	<constructor-arg name="oname" value="电脑"></constructor-arg>
 </bean>
```
## IOC操作Bean管理（Xml注入成员变量）
- 字面量。
- 注入属性-外部bean
    * 比如有Service类与dao类，在service类中调用dao类的方法，这个时候这样配置：
 

```html
    <bean id="userService" class="com.atguigu.spring5.service.UserService">
        <property name="userDao" ref="userDaoImpl"></property>
    </bean>
    <bean id="userDaoImpl" class="com.atguigu.spring5.dao.UserDaoImpl"></bean>
```

 - 注入属性-内部bean
```html
    <bean id="userService" class="com.atguigu.spring5.service.UserService">
        <property name="userDao">
            <bean id="userDaoImpl" class="com.atguigu.spring5.dao.UserDaoImpl"></bean>
        </property>
    </bean>
```
## IOC操作Bean管理（Xml注入集合属性）
- 注入数组类型

```html
    <bean id="stu" class="com.atguigu.spring5.collectiontype.Stu">
        <property name="courses">
            <array>
                <value>java课程</value>
                <value>数据库课程</value>
            </array>
        </property>
    </bean>
```
- 注入List集合类型

```html
    <property name="list">
        <list>
            <value>1</value>
            <value>2</value>
        </list>
    </property>
```

- 注入Map集合类型。

```html
    <property name="map">
        <map>
            <entry key="java" value="JAVA"></entry>
            <entry key="java2" value="JAVA2"></entry>
        </map>
    </property>
```

## IOC操作Bean管理（FactoryBean）
- Spring有两种类型bean
    * 普通bean:在配置文件中定义bean类型就是返回类型。
    * 工厂bean:在配置文件中定义bean类型可以返回类型不一样。这里比较难理解。
```java
        public class Mybean implements FactoryBean<Course>{
            @Override
            public Course getObject() throws Exception{
                Course course = new Couse();
                course.setCname("name");
                return course;
            }

            @Override
            public Class<?> getObjectType(){
                return null;
            }
            @Override
            public boolean isSingleton(){
                return false;
            }
        }

        <bean id="myBean" class="com.atguigu.spring5.factorybean.MyBean">
        </bean>

        @Test
        public void test3(){
            ApplicationContext context = new ClassPathXmlApplicationContext("bean3.xml");
            Course course = context.getBean("myBean", Course.class);
            Systom.out.println(course);
        }
```

## IOC操作Bean管理（bean作用域）
   - 设置bean实例是单实例还是多实例。

```html
        <bean id="book" class="com.atguigu.spring5.collectiontype.Book" scope="prototype">
        </bean>
```


## IOC操作Bean管理（bean生命周期）
- bean生命周期（算上后置处理器）
    1. 通过构造器创建bean实例（无参数构建）
    2. 为bean的属性设置值和对其他bean引用（调用set方法）
    3. 把bean实例传递给bean后置处理器方法：postProcessBeforeInitialization
    4. 调研bean的初始化方法（需要进行配置初始化防范）
    5. 把bean实例传递给bean后置处理器方法：postProcessAfterInitialization
    6. bean可以使用。
    7. 当容器关闭时候，调用bean销毁方法。

## IOC操作Bean管理（通过XML自动装配）重要
- 自动装配的意思就是不在通过ref进行关联。主要使用autowire关键字
 	1. 根据属性名称注入（也就是类emp中的private Dept dept这个dept）
```html
        <bean id="emp" class="com.atguigu.spring5.autowire.Emp" autowire="byName">
            <!--<property name="dept" ref="dept"></property>>-->
        </bean>
        <bean id="dept" class="com.atguigu.spring5.autowire.Dept"></bean>
```

2. 根据属性类型注入（也就是类emp中的private Dept dept这个Dept） 
```html
        <bean id="emp" class="com.atguigu.spring5.autowire.Emp" autowire="byType">
            <!--<property name="dept" ref="dept"></property>>-->
        </bean>
        <bean id="dept" class="com.atguigu.spring5.autowire.Dept"></bean>
```

    
## IOC操作Bean管理（基于注解方式）重要
- Spring针对Bean管理中创建对象提供注解
    1. @Component
    2. @Service
    3. @Controller
    4. @Repository
- 通过注解方式实现Controller、Service对象创建
    1. 开启组件扫描
        <context:component-scan base-backage="com.atguigu"></context:component-scan>
    2. 在类上添加@Service注解，声明这是一个Bean,被Spring管理
 

```java
        @Service(value="userService") // 等于<bean id="userService" class='...'>
        public class UserService{
            public void add(){
                System.out.println("Service add...");
            }
        }
```
    
- 基于注解方式实现属性注入    
1. @Autowired：根据属性类型进行自动装配，类似与 autowire="byType"  
```java
    @Service
    public class UserService {
        @Autowired
        private UserDao userDao;

        public void add(){
            System.out.println("service add....");
            userDao.add();
        }
    }
```
   2. @Qualifier：根据名称进行注入。与Autowired一起使用
    
```java
    @Autowired
    @Qualifier(value = "userDaoImpl1")
    private UserDao userDao;
```
   3. @Resource：可以根据类型注入，可以根据名称注入

```java
    @Resource //根据类型注入
    @Resource(value = "userDaoImpl1")
    private UserDao userDao
    7. @Value：注入普通类型属性
    @Value(value = "abc")
    private String name;
```

- 完全注解开发
    1. 创建配置类，替代xml配置文件
```java
    @Configuration
    @ComponentScan(basePackages = {"com.atguigu"})
    public class SpringConfig{
        
    }
```



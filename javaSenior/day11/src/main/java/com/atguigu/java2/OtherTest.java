package com.atguigu.java2;

import com.atguigu.java1.Person;
import org.junit.Test;

import java.lang.reflect.Constructor;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class OtherTest {
    @Test
    //getConstructors():获取当前运行时类中声明为public的构造器

    public void test1(){
        Class<Person> aClass = Person.class;
        Constructor<?>[] constructors = aClass.getConstructors();
        for (Constructor<?> constructor : constructors) {
            System.out.println(constructor);
        }

        System.out.println("------");
        Constructor<?>[] declaredConstructors = aClass.getDeclaredConstructors();
        for (Constructor<?> declaredConstructor : declaredConstructors) {
            System.out.println(declaredConstructor);
        }
    }

    /**
     *     获取运行时类的父类
     */
    @Test
    public void test2(){
        Class<Person> aClass = Person.class;
        Class<? super Person> superclass = aClass.getSuperclass();
        System.out.println(superclass);
    }

    /**
     *     获取运行时类的带泛型的父类
     */
    @Test
    public void test3(){
        Class<Person> aClass = Person.class;
        System.out.println(aClass.getGenericSuperclass());
    }

    /**
     *     获取运行时类的带泛型的父类的泛型
     */
    @Test
    public void test4(){
        Class clazz = Person.class;

        Type genericSuperclass = clazz.getGenericSuperclass();
        ParameterizedType paramType = (ParameterizedType) genericSuperclass;
        //获取泛型类型
        Type[] actualTypeArguments = paramType.getActualTypeArguments();
//        System.out.println(actualTypeArguments[0].getTypeName());
        System.out.println(((Class)actualTypeArguments[0]).getName());


    }

    /**
     *     获取运行时类实现的接口
     */
    @Test
    public void test5(){
        Class<Person> aClass = Person.class;
        for (Class<?> anInterface : aClass.getInterfaces()) {
            System.out.println(anInterface);
        }
        System.out.println("-----");
        for (Class<?> anInterface : aClass.getSuperclass().getInterfaces()) {
            System.out.println(anInterface);
        }
    }

    /**
     *         获取运行时类所在的包
     */
    @Test
    public void test6(){
        Class<Person> aClass = Person.class;
        System.out.println(aClass.getPackage());
    }

    /**
     *         获取运行时类声明的注解
     */
    @Test
    public void test7(){
        Class<Person> aClass = Person.class;
        for (Class<?> anInterface : aClass.getInterfaces()) {
            System.out.println(anInterface);
        }
    }
    @Test
    public void test8(){

    }

}

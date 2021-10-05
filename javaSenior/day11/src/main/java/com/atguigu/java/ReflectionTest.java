package com.atguigu.java;

import org.junit.Test;

import java.lang.annotation.ElementType;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ReflectionTest {
    //反射之前，对于Person的操作
    @Test
    public void test1(){
        Person person = new Person("Tom",19);

        System.out.println(person.getName());
    }
    @Test
    public void test2() throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException, NoSuchFieldException {
        Class clazz = Person.class;
        Constructor cons = clazz.getConstructor(String.class, int.class);
        Object o = cons.newInstance("new born Tom",0);
        Person person = (Person) o;
        System.out.println(person);
        System.out.println("--------");
        Field name = clazz.getDeclaredField("name");
        name.setAccessible(true);
        name.set(person,"new Tom");
        Field age = clazz.getDeclaredField("age");
        age.setAccessible(true);
        age.set(person,111);
        System.out.println(person);
        Method showNation = clazz.getDeclaredMethod("showNation",String.class);
        showNation.setAccessible(true);
        showNation.invoke(person,"中国");
    }
    //疑问1：通过直接new的方式或反射的方式都可以调用公共的结构，开发中到底用那个？
    //建议：直接new的方式。
    //什么时候会使用：反射的方式。 反射的特征：动态性
    //疑问2：反射机制与面向对象中的封装性是不是矛盾的？如何看待两个技术？
    //不矛盾。

    /*
    关于java.lang.Class类的理解
    1.类的加载过程：
    程序经过javac.exe命令以后，会生成一个或多个字节码文件(.class结尾)。
    接着我们使用java.exe命令对某个字节码文件进行解释运行。相当于将某个字节码文件
    加载到内存中。此过程就称为类的加载。加载到内存中的类，我们就称为运行时类，此
    运行时类，就作为Class的一个实例。

    2.换句话说，Class的实例就对应着一个运行时类。
    3.加载到内存中的运行时类，会缓存一定的时间。在此时间之内，我们可以通过不同的方式
    来获取此运行时类。
     */
    //获取Class的实例的方式（前三种方式需要掌握）
    @Test
    public void test3() throws ClassNotFoundException {
        // 1
        Class<Person> personClass = Person.class;
        System.out.println(personClass);
        //2
        Person person = new Person();
        System.out.println(person.getClass());
        //3
        Class<?> aClass = Class.forName("com.atguigu.java.Person");
        System.out.println(aClass);
        //4
        ClassLoader classLoader = ReflectionTest.class.getClassLoader();
        Class<?> aClass1 = classLoader.loadClass("java.util.Map");
        System.out.println(aClass1);

    }
    //Class实例可以是哪些结构的说明：

    @Test
    public void test4(){
        Class<Object> objectClass = Object.class;
        Class<Comparable> comparableClass = Comparable.class;
        Class<String> stringClass = String.class;
        Class c4 = int[][].class;
        Class c5 = ElementType.class;
        Class c6 = Override.class;
        Class c7 = int.class;
        Class c8 = void.class;
        Class c9 = Class.class;

        int[] a = new int[10];
        int[] b = new int[100];
        Class c10 = a.getClass();
        Class c11 = b.getClass();
        // 只要数组的元素类型与维度一样，就是同一个Class
        System.out.println(c10 == c11);

    }
}

package com.atguigu.java;

import org.junit.Test;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Random;

public class NewInstanceTest {
    @Test
    public void test1() throws InstantiationException, IllegalAccessException {
        /*
        newInstance():调用此方法，创建对应的运行时类的对象。内部调用了运行时类的空参的构造器。
        要想此方法正常的创建运行时类的对象，要求：
        1.运行时类必须提供空参的构造器
        2.空参的构造器的访问权限得够。通常，设置为public。
        在javabean中要求提供一个public的空参构造器。原因：
        1.便于通过反射，创建运行时类的对象
        2.便于子类继承此运行时类时，默认调用super()时，保证父类有此构造器
         */
        Class clazz = Person.class;
        Object o = clazz.newInstance();
        System.out.println(o);
    }

    @Test
    public void test2() throws InterruptedException, ClassNotFoundException, InstantiationException, IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        Random random = new Random();
        while (true){
            Thread.sleep(100);
            int i = random.nextInt(3);
            switch (i){
                case 0:
                    Class<?> aClass = Class.forName("com.atguigu.java.Person");
                    System.out.println(aClass.newInstance());
                    break;
                case 1:
                    Class<?> aClass1 = Class.forName("java.util.HashMap");
                    Method put = aClass1.getDeclaredMethod("put", Object.class, Object.class);
                    Object o = aClass1.newInstance();
                    put.invoke(o,"HashMap的Key","HashMap的Value");
                    System.out.println(o);
                case 2:
                    Class<?> aClass2 = Class.forName("java.lang.String");
                    Constructor<?> constructor = aClass2.getConstructor(String.class);
                    Object string = constructor.newInstance("这是一个String");
                    System.out.println(string);
            }
        }
    }

}

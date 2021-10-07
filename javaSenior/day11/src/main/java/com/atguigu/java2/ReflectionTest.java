package com.atguigu.java2;

import com.atguigu.java2.Person;
import org.junit.Test;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ReflectionTest {
    @Test
    public void testField1() throws InstantiationException, IllegalAccessException, NoSuchFieldException {
        Class aClass = Person.class;
        Object o = aClass.newInstance();
//        Person o1 = (Person) o;
        Field id = aClass.getField("id");
        id.set(o,12);
        Field name = aClass.getDeclaredField("name");
        name.setAccessible(true);
        name.set(o,"yck");
        System.out.println(o);
    }

    /**
     *     如何操作运行时类中的指定的方法 -- 需要掌握
     */
    @Test
    public void testMethod() throws NoSuchMethodException, InstantiationException, IllegalAccessException, InvocationTargetException {
        /*
        1.获取指定的某个方法
        getDeclaredMethod():参数1 ：指明获取的方法的名称  参数2：指明获取的方法的形参列表
         */

        Class aClass = Person.class;
        Object o = aClass.newInstance();
        Method show = aClass.getDeclaredMethod("show", String.class);
        //2.保证当前方法是可访问的
        show.setAccessible(true);
        /*
        3. 调用方法的invoke():参数1：方法的调用者  参数2：给方法形参赋值的实参
        invoke()的返回值即为对应类中调用的方法的返回值。
         */
        System.out.println(show.invoke(o, "中国"));
    }
    @Test
    public void testConstructor() throws InvocationTargetException, InstantiationException, IllegalAccessException, NoSuchMethodException {
        Class aClass = Person.class;
        Constructor constructor = aClass.getDeclaredConstructor(String.class, int.class, int.class);
        constructor.setAccessible(true);
        Object yck = constructor.newInstance("yck", 102, 28);
        System.out.println(yck);
    }
}

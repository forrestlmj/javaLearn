package com.atguigu.java2;

import com.atguigu.java2.Person;
import org.junit.Test;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Parameter;

public class MethodTest {
    @Test
    public void test1(){
        Class<Person> aClass = Person.class;
        //getMethods():获取当前运行时类及其所有父类中声明为public权限的方法

        Method[] methods = aClass.getMethods();
        for (Method method : methods) {
            System.out.println(method);
        }
        System.out.println("----");
        //getDeclaredMethods():获取当前运行时类中声明的所有方法。（不包含父类中声明的方法）

        for (Method declaredMethod : aClass.getDeclaredMethods()) {
            System.out.println(declaredMethod);
        }

    }
    /*
@Xxxx
权限修饰符  返回值类型  方法名(参数类型1 形参名1,...) throws XxxException{}
 */
    @Test
    public void test2(){
        Class aClass = Person.class;
        Method[] declaredMethods = aClass.getDeclaredMethods();
        for (Method method : declaredMethods) {
            System.out.println("---------");
            //1.获取方法声明的注解
            Annotation[] annotations = method.getAnnotations();
            for (Annotation annotation : annotations) {
                System.out.println(annotation);
            }
            //2.权限修饰符
            int modifiers = method.getModifiers();
            System.out.print(Modifier.toString(modifiers)+" ");
            //3.返回值类型
            System.out.println(method.getReturnType());
            //4.方法名
            System.out.println(method.getName());
            //5.形参列表
            Class<?>[] parameterTypes = method.getParameterTypes();
            for (int i = 0; i < parameterTypes.length; i++) {
                System.out.print(parameterTypes[i].getName()+",");
            }
            //6.抛出的异常
            Class<?>[] exceptionTypes = method.getExceptionTypes();
            for (int i = 0; i < exceptionTypes.length; i++) {
                if(i == exceptionTypes.length - 1){
                    System.out.print(exceptionTypes[i].getName());
                    break;
                }

                System.out.print(exceptionTypes[i].getName() + ",");

            }
        }
    }
}

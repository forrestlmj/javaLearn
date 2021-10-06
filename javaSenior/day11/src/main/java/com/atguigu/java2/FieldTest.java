package com.atguigu.java2;

import com.atguigu.java1.MyAnnotation;
import com.atguigu.java1.Person;
import org.junit.Test;

import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedType;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

public class FieldTest {
    @Test
    public void test1(){
        Class clazz = Person.class;
        Field[] fields = clazz.getFields();
        for (Field field : fields) {
            System.out.println(field);
        }
        System.out.println("---------");
        //getDeclaredFields():获取当前运行时类中声明的所有属性。（不包含父类中声明的属性）

        for (Field declaredField : clazz.getDeclaredFields()) {
            System.out.println(declaredField);
        }
    }
    //权限修饰符  数据类型 变量名

    @Test
    public void test2(){
        Class aClass = Person.class;
        Field[] declaredFields = aClass.getDeclaredFields();
        for (Field declaredField : declaredFields) {
//            AnnotatedType annotatedType = declaredField.getAnnotatedType();
//            System.out.println(annotatedType);
            //1.权限修饰符

            int modifiers = declaredField.getModifiers();
            System.out.print(Modifier.toString(modifiers)+" ");

            //2.数据类型
            System.out.print(declaredField.getType().getName()+" ");

            //3.变量名
            System.out.println(declaredField.getName());
            Annotation[] annotations = declaredField.getAnnotations();
//            MyAnnotation[] annotationsByType = declaredField.getAnnotationsByType(MyAnnotation.class);
            if(annotations != null && annotations.length>0){
                for (Annotation annotation : annotations) {
                    System.out.println("有注解");
                    System.out.println(annotation.annotationType());
                    System.out.println(annotation);
                }
            }
        }
    }
}

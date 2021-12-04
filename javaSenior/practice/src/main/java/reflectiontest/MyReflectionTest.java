package reflectiontest;

import annotationtest.ApiInfo;
import jdk.nashorn.internal.ir.annotations.Reference;
import org.junit.Test;

import java.lang.annotation.Annotation;
import java.lang.annotation.Documented;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class MyReflectionTest {
    @Test
    public void test(){
        Class<? extends Class> aClass = MyReflectionTest.class.getClass();
        System.out.println(aClass.getPackage());
    }
    @Test
    public void test1() throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        Class<Man> manClass = Man.class;
        Class<?>[] interfaces = manClass.getInterfaces();
        for (Class<?> anInterface : interfaces) {
            System.out.println(anInterface);
        }
        System.out.println("---");
        for (Method method : manClass.getMethods()) {
            System.out.println(method);
        }
        System.out.println("-----------------");
        for (Method declaredMethod : manClass.getDeclaredMethods()) {
            System.out.println(declaredMethod);
        }

        Constructor<Man> constructor = manClass.getDeclaredConstructor();
        Man man = constructor.newInstance();
        System.out.println(man);
    }

    /**
     * 通过反射获得类的注解信息。
     * Spring = IOC + AOP
     * AOP = 反射 + 注解 + 设计模式
     */
    @Test
    public void testAnnotation(){
        Class<Man> manClass = Man.class;
        for (Annotation annotation : manClass.getAnnotations()) {
            System.out.println(annotation);
            System.out.println(annotation.getClass());
        }
    }
}
interface Life{
    void breath();
    void eat();
    void sleep();
    void die();
}

interface Gender{
    void behavior();
}
class Human implements Life{
    private String name;
    private Integer age;
    @Override
    public void breath() {
        System.out.println("Human Breath");
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Human{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    @Override
    public void eat() {
        System.out.println("Human Eat");
    }

    @Override
    public void sleep() {
        System.out.println("Human Sleep");

    }

    @Override
    public void die() {
        System.out.println("Human Die");

    }
}
@ApiInfo(name = "男人", note = "继承人类，实现性别行为")
class Man extends Human implements Gender{

    public Man() {
    }

    @Override
    public String toString() {
        return "Man{}";
    }

    @Override
    public void behavior() {
        System.out.println("Man like car.");
    }
}
class Women extends Human implements Gender{
    @Override
    public void behavior() {
        System.out.println("Woman like shopping.");
    }
}

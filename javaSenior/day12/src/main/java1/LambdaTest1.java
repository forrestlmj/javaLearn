import org.junit.Assert;
import org.junit.Test;

import java.util.Comparator;
import java.util.function.BiFunction;
import java.util.function.Consumer;

/**
 * Lambda表达式的使用
 *
 * 1.举例： (o1,o2) -> Integer.compare(o1,o2);
 * 2.格式：
 *      -> :lambda操作符 或 箭头操作符
 *      ->左边：lambda形参列表 （其实就是接口中的抽象方法的形参列表）
 *      ->右边：lambda体 （其实就是重写的抽象方法的方法体）
 *
 * 3. Lambda表达式的使用：（分为6种情况介绍）
 *
 *    总结：
 *    ->左边：lambda形参列表的参数类型可以省略(类型推断)；如果lambda形参列表只有一个参数，其一对()也可以省略
 *    ->右边：lambda体应该使用一对{}包裹；如果lambda体只有一条执行语句（可能是return语句），省略这一对{}和return关键字
 *
 * 4.Lambda表达式的本质：作为函数式接口的实例
 *
 * 5. 如果一个接口中，只声明了一个抽象方法，则此接口就称为函数式接口。我们可以在一个接口上使用 @FunctionalInterface 注解，
 *   这样做可以检查它是否是一个函数式接口。
 *
 * 6. 所以以前用匿名实现类表示的现在都可以用Lambda表达式来写。
 *
 * @author shkstart
 * @create 2019 上午 11:40
 */

public class LambdaTest1 {
    //语法格式一：无参，无返回值
    @Test
    public void test1(){
        Runnable r1 = () -> System.out.println("nihao ");
        r1.run();
    }
    //语法格式二：Lambda 需要一个参数，但是没有返回值。
    @Test
    public void test2(){
        MyInterface<String> m = (s) -> System.out.println(s);
        m.method1("s");

        MyInterface<Integer> m2 = (i) -> System.out.println(i*2);
        m2.method1(100);

        System.out.println("----");
        Consumer<String> c = (i) -> System.out.println(i);
        Consumer<Integer> it = (i) -> System.out.println(i+1);
        c.accept("this message is from consumer");
        it.accept(100);
    }
    //语法格式三：数据类型可以省略，因为可由编译器推断得出，称为“类型推断”

    @Test
    public void test3(){
        Consumer<String> c = (s) -> System.out.println(s.length());
        c.accept("abaaaa");
    }
    //语法格式四：Lambda 若只需要一个参数时，参数的小括号可以省略

    @Test
    public void test4(){
        Consumer<String> c = s -> System.out.println(s.length());
        c.accept("lambda");
    }
    //语法格式五：Lambda 需要两个或以上的参数，多条执行语句，并且可以有返回值

    @Test
    public void test5(){

        Comparator<String> comStringLength = (s1,s2) ->{
            System.out.println(s1.length());
            System.out.println(s2.length());
            return Integer.compare(s1.length(),s2.length());
        };
        System.out.println(comStringLength.compare("abc", "ssss"));

        System.out.println("----");
        BiFunction<String,String,Integer> bi = (s1,s2) ->{
            return Integer.compare(s1.length(),s2.length());
        };


    }
    //语法格式六：当 Lambda 体只有一条语句时，return 与大括号若有，都可以省略

    @Test
    public void teszt6(){
        BiFunction<String,String,Boolean> bigger = (s1, s2) -> s1.length()>s2.length();

        Assert.assertTrue(bigger.apply("sss","s"));
        Assert.assertFalse(bigger.apply("s","ssss"));
    }
    @Test
    public void test7(){}

}

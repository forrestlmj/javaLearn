import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;

/**
 * java内置的4大核心函数式接口
 *
 * 消费型接口 Consumer<T>     void accept(T t)
 * 供给型接口 Supplier<T>     T get()
 * 函数型接口 Function<T,R>   R apply(T t)
 * 断定型接口 Predicate<T>    boolean test(T t)
 *
 *
 * @author shkstart
 * @create 2019 下午 2:29
 */
public class LambdaTest2 {
    @Test
    public void test1(){
        Supplier<List<String>> randomString = () -> {
          List<String> a = new ArrayList<>();
            Random r = new Random();
            for (int i = 0; i < 100; i++) {
                a.add(new String("abc_")+i);
            }
            return a;
        };
        List<String> strings = randomString.get();
        Consumer<List<String>> c = (l) -> {
            l.forEach(s->System.out.println(s.split("_")[s.split("_").length-1]));
        };
        c.accept(strings);
    }
    @Test
    public void test2(){
        List<String> s = new ArrayList<>();
        s.add("abc");
        s.add("abcd");
        s.add("s");
        s.add("ssssss");
        s.add("sssss");
        Function<String,Integer> stringLength = z ->  z.length();
        Predicate<Integer> lengthPre = ln -> ln%2 == 0 ;
        for (String s1 : s) {
            if (lengthPre.test(
                    stringLength.apply(s1)
            )) System.out.println(s1);
//            System.out.println();
        }
    }
}

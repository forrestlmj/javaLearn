package lambdatest;

import org.junit.Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Stream;

public class StreamAPITest {
    @Test
    public void test(){
        List<String> a = new ArrayList<String >(){{
            add("aa");add("aa");add("Aaa");
            add("Aaa");add("Bbb");add("cdeww");add("AAccaa");
        }};
        System.out.println(a.parallelStream().map(String::length).filter(integer -> integer > 3).count());
        System.out.println(a.stream().distinct().count());
        System.out.println(a.parallelStream().count());

        // 排序
        a.stream().sorted((x,y) -> Integer.compare(x.length(),y.length()))
                .forEach(System.out::println);
    }
    @Test
    public void test2(){

    }
}

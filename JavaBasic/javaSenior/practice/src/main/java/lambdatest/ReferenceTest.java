package lambdatest;

import org.junit.Test;

import java.util.function.Consumer;
import java.util.function.Function;

public class ReferenceTest {
    @Test
    public void test(){
        Function<String,Integer> s = String::length;
        System.out.println(s.apply("ssss"));
    }
    @Test
    public void test2(){
        Function<String, String> s = String::new;
        System.out.println(s.apply("ssss"));
    }
}

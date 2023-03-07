package lambdatest;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.function.Supplier;

public class CoreFunctionTest {
    @Test
    public void test(){
        Supplier<String> s = () -> {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 10; i++) {
                sb.append('a');
            }
            return sb.toString();
        };
        System.out.println(s.get());
    }
    @Test
    public void test2(){
        Function<String, List<String>> f = (s) -> {
            List<String> a = new ArrayList<>();
            for (char c : s.toCharArray()) {
                a.add(String.valueOf(c));
            }
            return a;
        };
        System.out.println(f.apply("sbabaa"));
    }
}

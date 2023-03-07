package lambdatest;

import java.util.ArrayList;
import java.util.List;

@FunctionalInterface
interface Readable<T>{
    boolean isEmpty(T text);
}

public class FunctionalInterfaceTest {
    public static void main(String[] args) {
        Readable<String> r = (a) -> {
            return a.isEmpty();
        };
        System.out.println(r.isEmpty(""));

        Readable<Integer> i = (a) -> a.equals(0);
        System.out.println(i.isEmpty(1));

        Readable<List<Integer>> l = (a) -> a.size()>0;

        System.out.println(l.isEmpty(new ArrayList<Integer>() {{
            add(1);
            add(2);
        }}));
    }
}


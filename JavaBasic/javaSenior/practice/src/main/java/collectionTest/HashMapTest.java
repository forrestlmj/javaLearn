package collectionTest;

import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

public class HashMapTest {
    @Test
    public void test(){
        int a = 23;
        int b = 21111;
        String s = "1";
        Object o = new Object();
        System.out.println(a & 11);
        System.out.println(b & 11);
    }
    @Test
    public void test1(){
        Map<String,String> m = new HashMap<>();
        m.put(null,"abc");
        m.put("abc",null);
        System.out.println(m);
    }
}

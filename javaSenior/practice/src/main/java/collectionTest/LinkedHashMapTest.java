package collectionTest;

import org.junit.Test;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * LinkedHashMap 相比于HashMap的优势是保持插入顺序有序
 */
public class LinkedHashMapTest {
    @Test
    public void test(){
        LinkedHashMap<String, String> m = new LinkedHashMap<>();
        m.put("abc", "123");
        m.put("a", "1");
        m.put("z", "-1");

        System.out.println(m);

    }
}

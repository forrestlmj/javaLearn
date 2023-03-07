package collectionTest;

import org.junit.Test;

import java.util.Hashtable;
import java.util.Map;

public class HashTableTest {
    @Test
    public void test(){
        Map<String,String> m = new Hashtable<>();
        // HashTable不可以放null
//        m.put("abc",null);
        System.out.println(m);
    }
}

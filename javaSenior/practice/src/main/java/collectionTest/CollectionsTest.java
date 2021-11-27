package collectionTest;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Collections;

public class CollectionsTest {
    @Test
    public void test(){
        ArrayList<String> strings = new ArrayList<String>() {{
            add("abc");
            add("dec");
            add("zcc");
        }};
        Collections.shuffle(strings);
        System.out.println(strings);
        Collections.sort(strings);
        System.out.println(strings);
        System.out.println(Collections.min(strings));
    }
}

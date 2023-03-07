import org.junit.Test;

import java.util.LinkedList;

public class LinkedListTest {
    @Test
    public void test1(){
        LinkedList<String> list = new LinkedList<String>();
        list.add("avc");
        list.add("2");
        list.add(1,"2222");
        System.out.println(list);
    }

}

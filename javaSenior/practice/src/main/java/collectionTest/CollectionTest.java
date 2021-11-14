package collectionTest;

import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public class CollectionTest {
    Collection<String> c = new MyCollection<>();

    @Before
    public void prepare(){
        c.clear();
        c.add("12");
        c.add("1");
        c.add("2");
        c.add("12");
        c.add("3");
        c.add("1");
    }
    @Test
    public void test0(){
        System.out.println(c);
    }
    @Test
    public void test(){

        c.remove("1");
        System.out.println(c);

    }

    @Test
    public void test2(){
        Iterator<String> iterator = c.iterator();
        while(iterator.hasNext()){
            System.out.println(iterator.next());
        }
    }
    @Test
    public void test3(){
        c.remove("12");
        System.out.println(c);
    }
    @Test
    public void test4(){
        Iterator<String> iterator = c.iterator();
        while (iterator.hasNext()){
            String next = iterator.next();
            if(next.length()>1){
                iterator.remove();
            }
        }
        System.out.println(c);
    }
}

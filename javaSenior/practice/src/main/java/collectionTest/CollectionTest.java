package collectionTest;

import org.junit.Before;
import org.junit.Test;

import java.util.*;

public class CollectionTest {
    Collection<String> c = new MyCollection<>();
    List<String> a = new ArrayList<>();

    @Before
    public void prepare(){
        a.clear();
        a.add("1");
        a.add("2");
        a.add("12");
        a.add("3");
        a.add("1");
        a.add("12");


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
    @Test
    public void test5(){
        Iterator<String> it = a.iterator();
        while (it.hasNext()) {
            String next = it.next();
            if(next.length()>1) it.remove();
        }
        System.out.println(a);
    }

    @Test
    public void test6(){
        List<String> strings = Arrays.asList("ABC", "DEF");
//        strings.add("sdf");
        System.out.println(strings);
    }
}

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

/**
 * Collection接口中声明的方法的测试
 *
 * 结论：
 * 向Collection接口的实现类的对象中添加数据obj时，要求obj所在类要重写equals().
 *
 * @author shkstart
 * @create 2019 上午 10:04
 */
public class CollectionTest1 {
    @Test
    public void test(){
        Collection coll = new ArrayList();
        coll.add("string");
        coll.add(1);

        Person person = new Person("yck",18);
        coll.add(person);
        System.out.println(coll);
        System.out.println(coll.contains(new Person("yck",18)));

        System.out.println("----");
        System.out.println(coll.contains("string"));
        String string = new String("string");
        System.out.println(string == "string");
        System.out.println(coll.contains(string));

        Collection coll2 = Arrays.asList("string",1);
        System.out.println(coll.containsAll(coll2));
    }
    @Test
    public void test2(){
        //3.remove(Object obj):从当前集合中移除obj元素。

        Collection coll = new ArrayList();
//        coll.remove(1);
        System.out.println(coll);
        coll.add(new Person("yck",30));
        coll.add(new Person("yck",31));
        coll.add(new Person("yck",32));
        Person yck = new Person("yck", 30);
        coll.remove(yck);
        System.out.println(coll);
    }

    @Test
    public void test3(){
        Collection coll = new ArrayList();
        coll.add(123);
        coll.add(456);
        coll.add(new Person("yck",111));
        Collection coll1 = new ArrayList();
        coll1.add(123);
        coll1.add(456);
        coll1.add(new Person("yck",111));
        System.out.println(coll.equals(coll1));
        System.out.println(coll.retainAll(coll1));
    }

    @Test
    public void test4(){
        Collection coll = new ArrayList();
        coll.add(123);
        coll.add(456);
        coll.add(new Person("Jerry",20));
        coll.add(new String("Tom"));
        coll.add(false);

        System.out.println(coll.hashCode());
        System.out.println("-----");
        Object[] objects = coll.toArray();
        for (int i = 0; i < objects.length; i++) {
            System.out.println(objects[i]);
        }
        List arr1 = Arrays.asList(new int[]{123, 456});
        System.out.println(arr1.size());//1

        List arr2 = Arrays.asList(new Integer[]{123, 456});
        System.out.println(arr2.size());//2

    }
}

import org.junit.Test;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/**
 * 集合元素的遍历操作，使用迭代器Iterator接口
 * 1.内部的方法：hasNext() 和  next()
 * 2.集合对象每次调用iterator()方法都得到一个全新的迭代器对象，
 * 默认游标都在集合的第一个元素之前。
 * 3.内部定义了remove(),可以在遍历的时候，删除集合中的元素。此方法不同于集合直接调用remove()
 *
 * @author shkstart
 * @create 2019 上午 10:44
 */
public class IteratorTest {
    @Test
    public void test(){
        Collection coll = new ArrayList();
        coll.add("abc");
        coll.add(1);
        coll.add(new Person("yck",12));

        Iterator iterator = coll.iterator();
        while(iterator.hasNext()){
            System.out.println(iterator.next());
        }
    }

    @Test
    public void test1(){
        Collection coll = new ArrayList();
        coll.add("abc");
        coll.add(1);
        coll.add(new Person("yck",12));

        Iterator iterator = coll.iterator();

        while (iterator.hasNext()){
            Object next = iterator.next();
            if("abc".equals(next)){
                iterator.remove();
            }
        }
        Iterator iterator1 = coll.iterator();
        while(iterator1.hasNext()){
            System.out.println(iterator1.next());
        }

    }
}


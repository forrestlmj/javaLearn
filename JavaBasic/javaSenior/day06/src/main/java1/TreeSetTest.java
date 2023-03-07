import org.junit.Test;

import java.util.Iterator;
import java.util.TreeSet;

public class TreeSetTest {

    /**
     *
     *     1.向TreeSet中添加的数据，要求是相同类的对象。
     *     2.两种排序方式：自然排序（实现Comparable接口） 和 定制排序（Comparator）
     *
     *
     *     3.自然排序中，比较两个对象是否相同的标准为：compareTo()返回0.不再是equals().
     *     4.定制排序中，比较两个对象是否相同的标准为：compare()返回0.不再是equals().
     *
     */
    @Test
    public void test1(){
        TreeSet<User2> set = new TreeSet<>();
        set.add(new User2("Tom",1));
        set.add(new User2("Jerry",32));
        set.add(new User2("Jim",2));
        set.add(new User2("Mike",65));
        set.add(new User2("Jack",33));
        set.add(new User2("Jack",56));

        Iterator<User2> iterator = set.iterator();
        while (iterator.hasNext()){
            System.out.println(iterator.next());
        }
        System.out.println("------------");
        set.remove(new User2("Mike",65));
        set.remove(new User2("Jack",56));
        Iterator<User2> iterator1 = set.iterator();
        while(iterator1.hasNext()){
            System.out.println(iterator1.next());
        }
    }
}

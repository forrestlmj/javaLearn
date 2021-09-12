import com.sun.scenario.animation.shared.ClipEnvelope;
import org.junit.Test;

import java.util.Comparator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class TreeMapTest {
    @Test
    public void test(){
        TreeMap<User,Integer> m = new TreeMap<>();
        m.put(new User("yck",22),1212);
        m.put(new User("wsn",21),12121);
        m.put(new User("abccc",91),111);
        Set<Map.Entry<User, Integer>> entries = m.entrySet();
        for (Map.Entry<User, Integer> entry : entries) {
            System.out.println(entry);
        }
    }

    @Test
    public void test2() {
        TreeMap<User, Integer> m = new TreeMap<>(new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                if (o1.getAge() != o2.getAge()) {
                    return - Integer.compare(o1.getAge(), o2.getAge());
                } else {
                    return o1.getName().compareTo(o2.getName());
                }
            }
        });

        m.put(new User("yck", 28), 22);
        m.put(new User("abc", 29), 22);
        m.put(new User("yck1", 30), 33);
        m.put(new User("yck", 30), 33);
        for (Map.Entry<User, Integer> userIntegerEntry : m.entrySet()) {
            System.out.println(userIntegerEntry);
        }

    }
}

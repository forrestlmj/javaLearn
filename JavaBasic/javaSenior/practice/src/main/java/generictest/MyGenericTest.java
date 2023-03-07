package generictest;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class MyGenericTest {
    @Test
    public void test(){
        List<Line> l = new ArrayList<Line>(){{
            add(new Line(1));add(new Line(2));
        }};

        List<Dot> d = new ArrayList<Dot>(){{
            add(new Dot("1,1"));add(new Dot("2,2"));
        }};

        Canvas.draw(d);
        Canvas.draw(l);
    }

    @Test
    public void test2(){
        MyMap<String,Integer> m = new MyMapImpl<>();
        m.put("yck",11);
        m.put("zb",22);
        System.out.println(m.get("yck"));
        System.out.println(m);
    }
}

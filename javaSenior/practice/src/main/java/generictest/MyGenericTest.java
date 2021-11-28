package generictest;

import org.junit.Test;
import sun.security.rsa.RSAUtil;

import java.util.List;

public class MyGenericTest {
    @Test
    public void test(){

        SomeDao<Father<String>> someDao = new SomeDao<>();
        Father<String>[] fs = new Father[2];
        Son<String>[] sons = new Son[2];
        fs[0] = new Father<String>("yck");
        fs[1] = new Father<String>("yck2");

        sons[0] = new Son<String>("yck1's son");
        sons[1] = new Son<String>("yck2's son");

        List<Father<String>> fathers = someDao.toArray(fs);
        System.out.println(fathers);

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

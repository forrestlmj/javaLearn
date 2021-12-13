package enumtest;

import org.junit.Test;

public class EnumTest {
    @Test
    public void test(){
        System.out.println(Weather.AUTUMN);
    }

    @Test
    public void testThread(){
        System.out.println(Status.READY.getDesc());
        for (Status value : Status.values()) {
            System.out.println("状态可以有："+value.getName()+","+value.getDesc());
        }
    }
}

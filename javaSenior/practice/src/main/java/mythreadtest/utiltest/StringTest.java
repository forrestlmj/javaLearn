package mythreadtest.utiltest;

import org.junit.Test;

public class StringTest {
    @Test
    public void test(){
        StringBuffer sb = new StringBuffer();
        long l = System.currentTimeMillis();
        int timeR = 100000;
        for (int i = 0; i < timeR; i++) {
            sb.append("aaa");
        }
        long l2 = System.currentTimeMillis();
        System.out.println("StringBuffer耗时："+(l2-l));
        long l3 = System.currentTimeMillis();
        String a = "aaa";
        for (int i = 0; i < timeR; i++) {
            a = a + "aaa";
        }
        long l4 = System.currentTimeMillis();
        System.out.println("String耗时:"+(l4- l3));
        StringBuilder sb2 = new StringBuilder();
        long l5 = System.currentTimeMillis();
        for (int i = 0; i < timeR; i++) {
            sb2.append("aaa");
        }
        long l6 = System.currentTimeMillis();
        System.out.println("StringBuilder耗时:"+(l6- l5));

    }
}

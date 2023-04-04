package com.yck;

public class SlotTest {
    public static void main(String[] args) {
        localVar();
        localVar2();
    }
    public static void localVar(){
        int a = 1112;
        System.out.println(a);
        int b = 1123;
    }

    /**
     * 通过javap -v SlotTest.class演示：
     * 变量a的作用域在源代码19到22行，
     * 变量b的作用域在源代码24行。
     * a由于已经失效，因此b的slot索引位置与a是一样的
     * 这个就是slot的复用，可以节省空间。
     */
    public static void localVar2(){
        {
            int a = 1311;
            System.out.println(a);
        }
        int b = 1;
    }
}

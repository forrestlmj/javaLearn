package com.yck2;

/**
 *  * -Xms600m -Xmx600m
 *  *
 *  * -XX:NewRatio ： 设置新生代与老年代的比例。默认值是2.（常用）
 *
 *  * -XX:SurvivorRatio ：设置新生代中Eden区与Survivor区的比例。默认值是8（常用）
 *
 *
 *  * -XX:-UseAdaptiveSizePolicy ：关闭自适应的内存分配策略  （暂时用不到）
 *  * -Xmn:设置新生代的空间的大小。 （一般不设置）
 */
public class EdenSurvivorTest {
    public static void main(String[] args) throws InterruptedException {
        System.out.println();
        Thread.sleep(1000000);
    }
}

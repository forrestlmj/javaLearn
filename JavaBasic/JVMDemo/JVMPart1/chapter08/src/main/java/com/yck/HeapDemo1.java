package com.yck;

/**
 * -Xms20m -Xmx20m
 * 设置堆空间大小
 */
public class HeapDemo1 {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("start....");
        Thread.sleep(1000*60*60);
        System.out.println("end....");
    }
}

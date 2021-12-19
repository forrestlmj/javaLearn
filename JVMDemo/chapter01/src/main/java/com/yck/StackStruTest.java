package com.yck;

/**
 *
 *
 */
public class StackStruTest {
    public static void main(String[] args) throws InterruptedException {
        int i = 2;
        int j = 3;
        int k = i + j;

        Thread.sleep(1000);

        System.out.println(k);
    }
}

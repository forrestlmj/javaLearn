package com.yck3;

public class SynchronizedTest {
    public void f(){
        Object o = new Object();
        synchronized (o){
            System.out.println(o);
        }
    }
}

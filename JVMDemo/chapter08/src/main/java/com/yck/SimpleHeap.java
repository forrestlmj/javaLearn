package com.yck;

/**
 * -Xms20m -Xmx20m -XX:+PrintGCDetails
 */
public class SimpleHeap {
    public SimpleHeap(Integer id) {
        this.id = id;
    }

    private Integer id;
    public void show(){
        System.out.println("My id is " + id);
    }

    public static void main(String[] args) {
        SimpleHeap s1 = new SimpleHeap(1);
        SimpleHeap s2 = new SimpleHeap(2);

        int[] arr =new int[10];
        Object[] o1 = new Object[10];
    }
}

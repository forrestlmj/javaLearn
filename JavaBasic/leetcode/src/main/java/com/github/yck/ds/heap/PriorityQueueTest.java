package com.github.yck.ds.heap;

import java.util.Comparator;
import java.util.Iterator;
import java.util.PriorityQueue;

public class PriorityQueueTest {
    public static void main(String[] args) {
        PriorityQueue<String> pr = new PriorityQueue<>(new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return -o1.length()+o2.length();
            }
        });
        pr.add("sss");
        pr.add("abccc");
        pr.add("1");
        pr.add("1111111111111");
        Iterator<String> i = pr.iterator();
        while (i.hasNext()){
            System.out.println(i.next());
        }
        System.out.println(pr.peek());
    }
}

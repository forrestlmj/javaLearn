package com.atguigu;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class Main {
    public static void main(String[] args) {
        Map<String,String> t = new AbstractMap<String, String>() {
            @Override
            public Set<Entry<String, String>> entrySet() {
                return null;
            }
        };
        System.out.println("Hello world!");

        Map<String,String > tree =new TreeMap<String ,String >(
                new Comparator<String>() {
                    @Override
                    public int compare(String o1, String o2) {
                        return -o1.length()+o2.length();
                    }
                }
        );
        tree.put("ssss","sss");
        tree.put("11111111","sss");
        tree.put("122","sss");
        tree.keySet().forEach(System.out::println);
    }
    public void test1(){
        Map<String, String> m = new ConcurrentHashMap<>();

    }
}
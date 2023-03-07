package com.github.yck.pattern.creational.prototype;

import java.util.ArrayList;
import java.util.List;

/**
 * 单例模式，必须要new 出来
 */
public class Client {
    public static void main(String[] args) {
        List<Sheep> ls = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            ls.add(new Sheep("yck",1,"yellow"));
        }

        ls.forEach(t  -> {
            System.out.println("Sheep: " + t + ", hashcode: " + t.hashCode());
        });
//        System.out.println(new Sheep("yck",1,"yellow"));
//        System.out.println(new Sheep("yck",1,"yellow"));
//        System.out.println(new Sheep("yck",1,"yellow"));
//        System.out.println(new Sheep("yck",1,"yellow"));
//        System.out.println(new Sheep("yck",1,"yellow"));
    }
}

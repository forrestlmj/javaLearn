package com.github.yck.pattern.creational.prototype.improve;


import java.util.ArrayList;
import java.util.List;

/**
 * 单例模式，必须要new 出来
 */
public class Client {
    public static void main(String[] args) throws CloneNotSupportedException {
        List<Sheep> ls = new ArrayList<>();
        Sheep dolly = new Sheep("yck", 1, "yellow");
        for (int i = 0; i < 10; i++) {
            ls.add((Sheep) dolly.clone());
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

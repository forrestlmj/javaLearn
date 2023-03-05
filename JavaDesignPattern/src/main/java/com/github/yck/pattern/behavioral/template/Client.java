package com.github.yck.pattern.behavioral.template;

public class Client {
    public static void main(String[] args) {
        new BlackBeanSoyMilk().make();
        System.out.println("=-----------=");
        new ReadBeanSoyMilk().make();
        System.out.println("=-----------=");
        new PeanutSoyMilk().make();
        System.out.println("=-----------=");
    }
}

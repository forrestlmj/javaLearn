package com.github.yck.pattern.structural.structural.facade;

public class PopCorn {
    private static PopCorn p = new PopCorn();
    private PopCorn(){};
    public void On(){
        System.out.println("PopCorn is on.");
    }

    public void Off(){
        System.out.println("PopCorn is off.");
    }

    public void pop(){
        System.out.println("PopCorn is pop.");
    }
    public static PopCorn getP(){
        return p;
    }
}

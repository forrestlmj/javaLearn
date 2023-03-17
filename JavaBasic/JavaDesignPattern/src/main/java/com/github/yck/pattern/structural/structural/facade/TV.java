package com.github.yck.pattern.structural.structural.facade;

public class TV {
    private static TV t = new TV();
    private TV(){}

    public static TV getT() {
        return t;
    }

    public void On(){
        System.out.println("TV is on.");
    }

    public void Off(){
        System.out.println("TV is Off.");
    }

    public void CCTV(){
        System.out.println("TV is CCTV.");
    }
}

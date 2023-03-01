package com.github.yck.pattern.structural.decorator.colorboard;

public class Client {
    public static void main(String[] args) {

        System.out.println("  ============ ");
        new BlueLine(new BlackLine(new RedLine(new Rectangle()))).drawAll();
        System.out.println("  ============ ");
        new RedLine(new BlueLine(new BlackLine(new Triangle()))).drawAll();
        System.out.println("  ============ ");
        new Rectangle().drawAll();

    }
}

package com.github.yck.pattern.structural.decorator.colorboard2;

public class Client {
    public static void main(String[] args) {

        System.out.println("  ============ ");
        new BlackLine(new BlueLine(new Rectangle())).draw();
        System.out.println("  ============ ");
        new BlueLine(new BlackLine(new Circle())).draw();
        System.out.println("  ============ ");

    }
}

package com.github.yck.pattern.structural.decorator.colorboard;

public class Client {
    public static void main(String[] args) {
        Shape art = new Rectangle();
        art = new RedLine(art);
        art.draw();
        System.out.println("  ============ ");
        art = new BlackLine(art);
        art.draw();
    }
}

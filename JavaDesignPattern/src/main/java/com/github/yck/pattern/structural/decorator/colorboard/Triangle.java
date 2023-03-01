package com.github.yck.pattern.structural.decorator.colorboard;

public class Triangle implements Shape {
    @Override
    public void draw() {
        System.out.println("Draw a Triangle.");
    }

    @Override
    public void drawAll() {
        draw();
    }
}

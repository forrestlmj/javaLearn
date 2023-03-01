package com.github.yck.pattern.structural.decorator.colorboard;

public class Rectangle implements Shape {
    @Override
    public void draw() {
        System.out.println("Draw a Rectangle");
    }

    @Override
    public void drawAll() {
        draw();
    }
}

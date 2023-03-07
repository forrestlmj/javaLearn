package com.github.yck.pattern.structural.decorator.colorboard2;

public class BlackDot extends Decorator {
    public BlackDot(Shape s) {
        super(s);
    }

    @Override
    public void draw() {
        super.draw();
        System.out.println("Draw some black Dots");
    }
}

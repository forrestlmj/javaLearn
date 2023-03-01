package com.github.yck.pattern.structural.decorator.colorboard;

public class BlueLine extends Decorator {
    public BlueLine(Shape s) {
        super(s);
    }

    @Override
    public void draw() {
        System.out.println("Decorate with BlueLine.");
    }


}

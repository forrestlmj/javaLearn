package com.github.yck.pattern.structural.decorator.colorboard2;

public class BlueLine extends Decorator {
    public BlueLine(Shape s) {
        super(s);
    }

    @Override
    public void draw() {
        s.draw();
        System.out.println("Decorate with BlueLine.");
    }


}

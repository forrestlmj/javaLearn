package com.github.yck.pattern.structural.decorator.colorboard2;

public class RedLine extends Decorator {
    public RedLine(Shape s) {
        super(s);
    }

    @Override
    public void draw() {
        s.draw();
        System.out.println("Decorate with RedLine.");
    }


}

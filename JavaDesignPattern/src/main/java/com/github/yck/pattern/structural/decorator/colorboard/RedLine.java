package com.github.yck.pattern.structural.decorator.colorboard;

public class RedLine extends Decorator {
    public RedLine(Shape s) {
        super(s);
    }

    @Override
    public void draw() {
        super.draw();
        System.out.println("Decorate with RedLine.");
    }


}

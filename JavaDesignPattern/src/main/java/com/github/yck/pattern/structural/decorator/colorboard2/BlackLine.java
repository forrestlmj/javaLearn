package com.github.yck.pattern.structural.decorator.colorboard2;

public class BlackLine extends Decorator {
    public BlackLine(Shape s) {
        super(s);
    }

    @Override
    public void draw() {
        s.draw();
        System.out.println("Decorate with BlackLine.");
    }


}

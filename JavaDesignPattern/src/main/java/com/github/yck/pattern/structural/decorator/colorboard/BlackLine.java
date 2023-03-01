package com.github.yck.pattern.structural.decorator.colorboard;

public class BlackLine extends Decorator {
    public BlackLine(Shape s) {
        super(s);
    }

    @Override
    public void draw() {
        super.draw();

        System.out.println("Decorate with BlackLine.");
    }


}

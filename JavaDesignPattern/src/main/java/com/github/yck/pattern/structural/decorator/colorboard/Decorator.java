package com.github.yck.pattern.structural.decorator.colorboard;

public abstract class Decorator implements Shape{
    Shape s;

    public Decorator(Shape s) {
        this.s = s;
    }

    public void draw(){
        s.draw();

    }
}

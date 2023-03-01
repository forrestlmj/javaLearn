package com.github.yck.pattern.structural.decorator.colorboard2;

public abstract class Decorator implements Shape {
    Shape s;

    public Decorator(Shape s) {
        this.s = s;
    }

    /**
     * 这里递归被装饰的对象
     */

    abstract public void draw();

}

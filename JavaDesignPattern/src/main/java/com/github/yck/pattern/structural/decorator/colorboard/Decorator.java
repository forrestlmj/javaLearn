package com.github.yck.pattern.structural.decorator.colorboard;

public abstract class Decorator implements Shape{
    Shape s;

    public Decorator(Shape s) {
        this.s = s;
    }

    /**
     * 这里递归被装饰的对象
     */
    @Override
    public void drawAll() {
        s.drawAll();
        draw();
    }
    abstract public void draw();

}

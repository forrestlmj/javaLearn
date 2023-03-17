package com.github.yck.pattern.structural.decorator.colorboard2;

public abstract class Decorator implements Shape {
    Shape shape;

    public Decorator(Shape s) {
        this.shape = s;
    }

    /**
     * 这里递归被装饰的对象
     */
    public void draw(){shape.draw();};

}

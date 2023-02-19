package com.github.yck.principle.openClosed;


/**
 * 这里不满足开闭原则，增加一个图形，那么 GraphEditor （调用方）就要多一个方法，不封闭了
 */
public class OpenClosed1 {
    public static void main(String[] args) {
        GraphEditor ge = new GraphEditor();
        ge.drawCircle();
        ge.drawRectangle();
    }
}
class Shape{
    public void draw(){
        System.out.println("Draw a Shape.");
    }
}

class Circle extends Shape{
    @Override
    public void draw() {
        System.out.println("Draw a Circle");
    }
}

class Rectangle extends Shape{
    @Override
    public void draw() {
        System.out.println("Draw a Rectangle");
    }
}

class GraphEditor{
    Circle c = new Circle();
    Rectangle r = new Rectangle();
    public void drawCircle(){c.draw();}
    public void drawRectangle(){r.draw();}
}

/**
 * 此时新增一个feature，Triangle，那么GraphEditor 必须也要增加一个 drawTriangle 方法
 */
class Triangle extends Shape{
    @Override
    public void draw() {
        System.out.println("Draw a Triangle");
    }
}
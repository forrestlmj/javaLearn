package com.github.yck.principle.openClosed.improve;

public class openClosed2 {
    public static void main(String[] args) {
        GraphEditor g = new GraphEditor();
        g.drawAnythingYouWant(new Rectangle());
        g.drawAnythingYouWant(new Triangle());
        g.drawAnythingYouWant(new Circle());
    }
}
abstract class Shape{
    public void draw(){
        System.out.println("Draw something.");
    }
}
class Circle extends Shape{
    @Override
    public void draw() {
        System.out.println("Draw a Circle");
    }
}
class Triangle extends Shape{
    @Override
    public void draw() {
        System.out.println("Draw a Triangle");
    }
}
class Rectangle extends Shape{
    @Override
    public void draw() {
        System.out.println("Draw a Rectangle");
    }
}

class GraphEditor{
    public void drawAnythingYouWant(Shape s){s.draw();}
}
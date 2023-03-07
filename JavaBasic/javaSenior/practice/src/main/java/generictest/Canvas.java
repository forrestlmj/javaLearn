package generictest;

import java.util.List;

public class Canvas {
    public static void draw(List<? extends Shape> list){
//        System.out.println(list);
        for (Shape shape : list) {
            System.out.println("正在画："+shape);
        }
    }
}
class Shape{
    private String color;
}
class Dot extends Shape{
    private String xy;

    public Dot(String xy) {
        this.xy = xy;
    }

    @Override
    public String toString() {
        return "Dot{" +
                "xy='" + xy + '\'' +
                '}';
    }
}
class Line extends Shape{
    public Line(Integer length) {
        this.length = length;
    }

    private Integer length;

    @Override
    public String toString() {
        return "Line{" +
                "length=" + length +
                '}';
    }
}
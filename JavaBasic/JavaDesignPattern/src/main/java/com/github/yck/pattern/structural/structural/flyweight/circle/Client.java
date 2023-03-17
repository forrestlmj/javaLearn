package com.github.yck.pattern.structural.structural.flyweight.circle;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Client {
    public static void main(String[] args) {
        Random r = new Random();
        List<String> colors = new ArrayList<String >(5){{
            add("Red");add("Black");add("Blue");add("Yellow");add("Brown");
        }};

        for (int i = 0; i < 20; i++) {
            Circle c = CircleFactory.getCircle(colors.get(r.nextInt(colors.size()-1)));
            c.setX(r.nextInt(100));
            c.setY(r.nextInt(100));
            c.draw();
        }
    }
}

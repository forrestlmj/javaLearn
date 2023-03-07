package com.github.yck.pattern.structural.flyweight.circle;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.function.Supplier;

public class CircleFactory {
    private static Map<String, Circle> m = new HashMap<>();

    public static Circle getCircle(String color){

        return Optional.ofNullable(m.get(color))
                .orElseGet(
                        new Supplier<Circle>() {
                            @Override
                            public Circle get() {
                                Circle circle = new Circle(color);
                                m.put(color, circle);
                                return circle;                            }
                        }
                );
    }

}

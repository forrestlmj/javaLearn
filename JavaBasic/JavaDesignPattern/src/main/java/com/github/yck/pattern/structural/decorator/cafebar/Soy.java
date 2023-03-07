package com.github.yck.pattern.structural.decorator.cafebar;

public class Soy extends Decorator {

    public Soy(Drink d) {
        super(d);

        setDescription(" 加入豆浆 ");
        setPrize(5.0f);
    }
}

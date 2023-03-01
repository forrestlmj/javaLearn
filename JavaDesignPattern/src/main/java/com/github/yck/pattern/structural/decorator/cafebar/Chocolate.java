package com.github.yck.pattern.structural.decorator.cafebar;

public class Chocolate extends Decorator{
    public Chocolate(Drink d) {
        super(d);
        setDescription("加入巧克力");
        setPrize(3F);
    }
}

package com.github.yck.pattern.structural.decorator.cafebar;

public class Milk extends Decorator{
    public Milk(Drink d) {
        super(d);
        setDescription("加入牛奶");
        setPrize(2.5F);
    }
}

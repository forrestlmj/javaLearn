package com.github.yck.pattern.creational.factory.improve.simplefactory.pizzas;

public class GreekPizza extends Pizza {
    @Override
    public void prepare() {
        System.out.println("GreekPizza is prepared.");
    }
}

package com.github.yck.pattern.factory.improve.simplefactory.pizzas;

public class PepperPizza extends Pizza {
    @Override
    public void prepare() {
        System.out.println("PepperPizza is prepared.");
    }
}

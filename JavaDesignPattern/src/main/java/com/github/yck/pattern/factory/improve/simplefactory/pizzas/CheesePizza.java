package com.github.yck.pattern.factory.improve.simplefactory.pizzas;

public class CheesePizza extends Pizza {
    @Override
    public void prepare() {
        System.out.println("CheesePizza is prepared.");
    }
}

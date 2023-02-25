package com.github.yck.pattern.factory.improve.methodfactory.pizzas;

public class CheesePizza extends Pizza {
    @Override
    public void prepare() {
        System.out.println("CheesePizza is prepared.");
    }
}

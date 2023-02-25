package com.github.yck.pattern.factory.improve.methodfactory.pizzas;

public class ChickenPizza extends Pizza {
    @Override
    public void prepare() {
        System.out.println("ChickenPizza is prepared.");
    }
}

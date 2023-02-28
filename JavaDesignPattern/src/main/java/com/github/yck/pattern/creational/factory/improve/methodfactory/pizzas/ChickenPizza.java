package com.github.yck.pattern.creational.factory.improve.methodfactory.pizzas;

public class ChickenPizza extends Pizza {
    @Override
    public void prepare() {
        System.out.println("ChickenPizza is prepared.");
    }
}

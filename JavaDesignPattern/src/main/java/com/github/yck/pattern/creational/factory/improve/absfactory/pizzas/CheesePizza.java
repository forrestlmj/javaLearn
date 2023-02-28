package com.github.yck.pattern.creational.factory.improve.absfactory.pizzas;

public class CheesePizza extends Pizza {
    @Override
    public void prepare() {
        System.out.println("CheesePizza is prepared.");
    }
}

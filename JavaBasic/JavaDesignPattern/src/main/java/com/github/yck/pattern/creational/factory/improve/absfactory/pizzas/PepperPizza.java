package com.github.yck.pattern.creational.factory.improve.absfactory.pizzas;

public class PepperPizza extends Pizza {
    @Override
    public void prepare() {
        System.out.println("PepperPizza is prepared.");
    }
}

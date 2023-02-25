package com.github.yck.pattern.factory.unefficient.pizzas;

public class PepperPizza extends Pizza{
    @Override
    public void prepare() {
        System.out.println("PepperPizza is prepared.");
    }
}

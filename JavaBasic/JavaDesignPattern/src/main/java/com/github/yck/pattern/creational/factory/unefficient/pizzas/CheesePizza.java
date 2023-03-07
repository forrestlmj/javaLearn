package com.github.yck.pattern.creational.factory.unefficient.pizzas;

public class CheesePizza extends Pizza{
    @Override
    public void prepare() {
        System.out.println("CheesePizza is prepared.");
    }
}

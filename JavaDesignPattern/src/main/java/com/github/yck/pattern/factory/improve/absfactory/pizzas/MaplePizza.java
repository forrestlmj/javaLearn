package com.github.yck.pattern.factory.improve.absfactory.pizzas;

public class MaplePizza extends Pizza {
    @Override
    public void prepare() {
        System.out.println("MaplePizza is prepared.");
    }
}

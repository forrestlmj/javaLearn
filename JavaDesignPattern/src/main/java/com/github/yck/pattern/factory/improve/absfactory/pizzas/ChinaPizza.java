package com.github.yck.pattern.factory.improve.absfactory.pizzas;

public class ChinaPizza extends Pizza {
    @Override
    public void prepare() {
        System.out.println("ChinaPizza is prepared.");
    }
}

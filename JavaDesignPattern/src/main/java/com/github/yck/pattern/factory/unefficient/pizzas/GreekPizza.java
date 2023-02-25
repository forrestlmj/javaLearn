package com.github.yck.pattern.factory.unefficient.pizzas;

public class GreekPizza extends Pizza{
    @Override
    public void prepare() {
        System.out.println("GreekPizza is prepared.");
    }
}

package com.github.yck.pattern.creational.factory.unefficient.pizzas;

public class GreekPizza extends Pizza{
    @Override
    public void prepare() {
        System.out.println("GreekPizza is prepared.");
    }
}

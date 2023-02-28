package com.github.yck.pattern.creational.factory.improve.absfactory.factory;

import com.github.yck.pattern.creational.factory.improve.absfactory.pizzas.Pizza;

public interface AbstractFactory {
    public Pizza createPizza(String type);

}

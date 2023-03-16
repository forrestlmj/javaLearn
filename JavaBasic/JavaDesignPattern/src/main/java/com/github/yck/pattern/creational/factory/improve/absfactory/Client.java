package com.github.yck.pattern.creational.factory.improve.absfactory;

import com.github.yck.pattern.creational.factory.improve.absfactory.factory.AbstractFactoryImplBeijing;
import com.github.yck.pattern.creational.factory.improve.absfactory.factory.AbstractFactoryImplCanada;
import com.github.yck.pattern.creational.factory.improve.absfactory.pizzas.Pizza;

public class Client {
    public static void main(String[] args) {
        new AbstractFactoryImplBeijing().createPizza("china");
        new AbstractFactoryImplCanada().createPizza("cheese");

    }
}

package com.github.yck.pattern.creational.factory.improve.absfactory.factory;

import com.github.yck.pattern.creational.factory.improve.absfactory.pizzas.Pizza;
import com.github.yck.pattern.creational.factory.improve.absfactory.pizzas.ChinaPizza;

public class AbstractFactoryImplBeijing implements AbstractFactory {
    @Override
    public Pizza createPizza(String type) {
        Pizza p = null;
        switch (type.trim().toLowerCase()){
            case "china": p = new ChinaPizza();break;
            default:
                System.out.println("Not support " + type + " pizza in Beijing yet. ");break;
        }
        return p;
    }
}

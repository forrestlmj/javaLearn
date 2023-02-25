package com.github.yck.pattern.factory.improve.absfactory.factory;

import com.github.yck.pattern.factory.improve.absfactory.pizzas.Pizza;
import com.github.yck.pattern.factory.improve.absfactory.pizzas.CheesePizza;
import com.github.yck.pattern.factory.improve.absfactory.pizzas.ChickenPizza;
import com.github.yck.pattern.factory.improve.absfactory.pizzas.ChinaPizza;

public class AbstractFactoryImplBeijing implements AbstractFactory {
    @Override
    public Pizza createPizza(String type) {
        Pizza p = null;
        switch (type.trim().toLowerCase()){
            case "china": p = new ChinaPizza();break;
            case "chicken": p = new ChickenPizza(); break;
            case "cheese": p = new CheesePizza();break;
            default:
                System.out.println("Not support " + type + " pizza in Beijing yet. ");break;
        }
        return p;
    }
}

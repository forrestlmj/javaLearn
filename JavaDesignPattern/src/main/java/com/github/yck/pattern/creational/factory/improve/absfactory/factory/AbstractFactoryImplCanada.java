package com.github.yck.pattern.creational.factory.improve.absfactory.factory;

import com.github.yck.pattern.creational.factory.improve.absfactory.pizzas.CheesePizza;
import com.github.yck.pattern.creational.factory.improve.absfactory.pizzas.MaplePizza;
import com.github.yck.pattern.creational.factory.improve.absfactory.pizzas.PepperPizza;
import com.github.yck.pattern.creational.factory.improve.absfactory.pizzas.Pizza;
import com.github.yck.pattern.factory.improve.absfactory.pizzas.*;

public class AbstractFactoryImplCanada implements AbstractFactory {
    @Override
    public Pizza createPizza(String type) {
        Pizza p = null;
        switch (type.trim().toLowerCase()){
            case "maple": p = new MaplePizza();break;
            case "pepper": p = new PepperPizza(); break;
            case "cheese": p = new CheesePizza();break;
            default:
                System.out.println("Not support " + type + " pizza in Beijing yet. ");break;
        }
        return p;
    }
}

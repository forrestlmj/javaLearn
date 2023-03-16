package com.github.yck.pattern.creational.factory.improve.simplefactory;

import com.github.yck.pattern.creational.factory.improve.simplefactory.pizzas.*;


public class SimpleFactory {
    public static Pizza getPizza(String type){
        Pizza p = null;
        switch (type.trim().toLowerCase()){
            case "cheese": p = new CheesePizza();break;
            case "greek": p = new GreekPizza();break;
            default:
                System.out.println("Not support");break;
        }
        return p;
    }
}

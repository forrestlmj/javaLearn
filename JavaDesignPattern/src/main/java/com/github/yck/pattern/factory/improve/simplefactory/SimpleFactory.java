package com.github.yck.pattern.factory.improve.simplefactory;

import com.github.yck.pattern.factory.improve.simplefactory.pizzas.*;


public class SimpleFactory {
    public static Pizza getPizza(String type){
        Pizza p = null;
        switch (type.trim().toLowerCase()){
            case "cheese": p = new CheesePizza();break;
            case "china": p = new ChinaPizza();break;
            case "greek": p = new GreekPizza();break;
            case "pepper": p = new PepperPizza();break;
            default:
                System.out.println("Not support");break;
        }
        return p;
    }
}

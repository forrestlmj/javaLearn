package com.github.yck.pattern.factory.improve.simplefactory;

import com.github.yck.pattern.factory.cmdUtil;
import com.github.yck.pattern.factory.improve.simplefactory.pizzas.*;

/**
 * 使用方，这里有了工厂类，不用再有业务代码，设置工厂类即可。
 */
public class OrderPizza {
    public static void orderPizza(){
        Pizza p = null;
        while (true){
            String type = cmdUtil.getCmdInput("input pizza 种类:");
            p = SimpleFactory.getPizza(type);
            p.prepare();
            p.bake();
            p.cut();
            p.box();
        }
    }
    public void orderPizza2(){
        Pizza p = null;
        while (true){
            String type = cmdUtil.getCmdInput("input pizza 种类:");
            switch (type.toLowerCase().trim()){
                case "cheese": p = new CheesePizza();
                case "china": p = new ChinaPizza();
                case "greek": p = new GreekPizza();
                case "pepper": p = new PepperPizza();
                default:
                    System.out.println("Not support");break;
            }
        }
    }

}

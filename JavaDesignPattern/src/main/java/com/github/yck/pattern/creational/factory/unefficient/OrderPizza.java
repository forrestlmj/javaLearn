package com.github.yck.pattern.creational.factory.unefficient;

import com.github.yck.pattern.creational.factory.cmdUtil;
import com.github.yck.pattern.creational.factory.unefficient.pizzas.*;

/**
 * 使用方，如果增加一个新披萨类型，必须动代码
 */
public class OrderPizza {
    public static void orderPizza(){
        Pizza p = null;
        while (true){
            String type = cmdUtil.getCmdInput("input pizza 种类:");
            switch (type.trim().toLowerCase()){
                case "cheese": p = new CheesePizza();break;
                case "china": p = new ChinaPizza();break;
                case "greek": p = new GreekPizza();break;
                case "pepper": p = new PepperPizza();break;
                default:
                    System.out.println("Not support");break;
            }
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

package com.github.yck.pattern.factory.improve.methodfactory.factory;

import com.github.yck.pattern.factory.improve.methodfactory.pizzas.*;

public class MethodFactoryImplCanada extends MethodFactory {
    /**
     *
     * 根据地区自己调整生产什么 pizza
     * 这里符合了开闭原则
     * @param type
     * @return
     */
    @Override
    public Pizza createPizza(String type) {
        Pizza p = null;
        switch (type.trim().toLowerCase()) {
            case "maple":
                p = new MaplePizza();
                break;
            case "pepper":
                p = new PepperPizza();
                break;
            case "cheese":
                p = new CheesePizza();
                break;
            default:
                System.out.println("Not support " + type + " pizza in Canada yet. ");
                break;
        }
        return p;
    }
}

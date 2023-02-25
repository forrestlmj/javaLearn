package com.github.yck.pattern.factory.improve.absfactory;

import com.github.yck.pattern.factory.cmdUtil;
import com.github.yck.pattern.factory.improve.absfactory.factory.AbstractFactoryImplBeijing;
import com.github.yck.pattern.factory.improve.absfactory.factory.AbstractFactoryImplCanada;

public class PizzaStore {
    public static void main(String[] args) {
        while (true){
            String locate = cmdUtil.getCmdInput("请选择门店：Beijing/Canada");
            switch (locate.toLowerCase().trim()){
                case "beijing":
                    new OrderPizza(new AbstractFactoryImplBeijing());
                    break;
                case "canada":
                    new OrderPizza(new AbstractFactoryImplCanada());
                    break;
                default:
                    System.out.println("未知门店");
                    break;
            }

        }
    }
}

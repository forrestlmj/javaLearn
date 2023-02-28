package com.github.yck.pattern.creational.factory.improve.methodfactory;

import com.github.yck.pattern.creational.factory.cmdUtil;
import com.github.yck.pattern.creational.factory.improve.methodfactory.factory.MethodFactoryImplBeijing;
import com.github.yck.pattern.creational.factory.improve.methodfactory.factory.MethodFactory;
import com.github.yck.pattern.creational.factory.improve.methodfactory.factory.MethodFactoryImplCanada;

public class PizzaStore {

    public static void main(String[] args) {
        MethodFactory f = null;
        while (true){
            String locate = cmdUtil.getCmdInput("请选择门店：Beijing/Canada");
            switch (locate.toLowerCase().trim()){
                case "beijing": f = new MethodFactoryImplBeijing();f.orderPizzaFromCmd();
                break;
                case "canada": f = new MethodFactoryImplCanada();f.orderPizzaFromCmd();
                break;
                default:
                    System.out.println("未知门店");
                    break;
            }

        }
    }
}

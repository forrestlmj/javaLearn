package com.github.yck.pattern.creational.factory.improve.methodfactory.factory;

import com.github.yck.pattern.creational.factory.cmdUtil;
import com.github.yck.pattern.creational.factory.improve.methodfactory.pizzas.Pizza;

import java.util.Optional;

abstract public class MethodFactory {

//    public void orderPizzaFromCmd(String o){
//      orderPizza(o.trim().toLowerCase());
//    }
    /**
     * 注意是抽象方法，用于子类实现。
     * @return
     */
    abstract public Pizza createPizza(String type);
    public void orderPizza(String type){
        Pizza p = createPizza(type);
        Optional.ofNullable(p).ifPresent(
                o -> {
                    p.prepare();
                    p.bake();
//                    p.cut();
//                    p.box();
                }
        );
    }
}

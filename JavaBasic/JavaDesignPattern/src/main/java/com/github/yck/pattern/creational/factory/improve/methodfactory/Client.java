package com.github.yck.pattern.creational.factory.improve.methodfactory;

import com.github.yck.pattern.creational.factory.cmdUtil;
import com.github.yck.pattern.creational.factory.improve.methodfactory.factory.MethodFactoryImplBeijing;
import com.github.yck.pattern.creational.factory.improve.methodfactory.factory.MethodFactory;
import com.github.yck.pattern.creational.factory.improve.methodfactory.factory.MethodFactoryImplCanada;

public class Client {

    public static void main(String[] args) {
        new MethodFactoryImplBeijing().orderPizza("china");
        new MethodFactoryImplCanada().orderPizza("cheese");
//        MethodFactory f = null;

    }
}

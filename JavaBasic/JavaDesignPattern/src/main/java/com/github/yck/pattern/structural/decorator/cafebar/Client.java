package com.github.yck.pattern.structural.decorator.cafebar;

public class Client {
    public static void main(String[] args) {
        Drink order = new Milk(new LongBlack());
        System.out.println(order.getDescription()
                + order.cost());

        order = new Chocolate(order);
        System.out.println(order.getDescription()
                + order.cost());    }
}

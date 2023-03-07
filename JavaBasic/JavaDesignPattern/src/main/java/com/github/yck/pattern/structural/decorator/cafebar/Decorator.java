package com.github.yck.pattern.structural.decorator.cafebar;

public class Decorator extends Drink {

    private Drink obj;

    public Decorator(Drink d) {
        this.obj = d;
    }

    @Override
    public float cost() {
        return super.getPrize() + obj.cost();
    }

    @Override
    public float getPrize() {
        return super.getPrize();
    }

    @Override
    public String getDescription() {
        return super.getDescription() + " && " + obj.getDescription();
    }
}

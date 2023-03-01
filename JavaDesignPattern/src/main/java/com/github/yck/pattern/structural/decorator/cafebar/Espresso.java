package com.github.yck.pattern.structural.decorator.cafebar;

public class Espresso extends Drink {
    @Override
    public float cost() {
        return super.getPrize();
    }

    public Espresso() {
        setDescription(" Espresso ");
        setPrize(5.5f);
    }
}

package com.github.yck.pattern.structural.decorator.cafebar;

public class Decof extends Drink {
    @Override
    public float cost() {
        return super.getPrize();
    }

    public Decof() {
        setDescription(" Decof ");
        setPrize(5f);
    }
}

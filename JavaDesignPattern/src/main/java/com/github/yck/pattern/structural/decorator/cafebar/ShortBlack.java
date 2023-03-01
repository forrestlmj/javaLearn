package com.github.yck.pattern.structural.decorator.cafebar;

public class ShortBlack extends Drink {
    @Override
    public float cost() {
        return super.getPrize();
    }

    public ShortBlack() {
        setDescription(" ShortBlack ");
        setPrize(7.0f);
    }
}

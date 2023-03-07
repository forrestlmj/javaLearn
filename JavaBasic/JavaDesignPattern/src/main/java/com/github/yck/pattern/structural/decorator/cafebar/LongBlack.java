package com.github.yck.pattern.structural.decorator.cafebar;

public class LongBlack extends Drink {
    @Override
    public float cost() {
        return super.getPrize();
    }

    public LongBlack() {
        setDescription(" LongBlack ");
        setPrize(6.0f);
    }
}

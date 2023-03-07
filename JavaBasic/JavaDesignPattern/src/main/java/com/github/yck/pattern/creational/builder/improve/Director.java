package com.github.yck.pattern.creational.builder.improve;

public class Director {
    private AbstractHouse h;

    public Director(AbstractHouse h) {
        this.h = h;
    }

    public void setH(AbstractHouse h) {
        this.h = h;
    }

    public House construct(){
        return h.getResult();
    }
}

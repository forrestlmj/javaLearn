package com.github.yck.pattern.creational.builder.improve;

public class BuildApartment extends Build {

    @Override
    public void buildStruct(House h) {
        h.setRoof("A Apartment struct");
        System.out.println(h.getRoof() + "is built.");
    }
}

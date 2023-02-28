package com.github.yck.pattern.creational.builder.improve;

public class AbstractHouseImplHighBuilding extends AbstractHouse {
    @Override
    public void buildWall(House h) {
        h.setWall("A 3m high wall");
        System.out.println(h.getWall() + "is built.");
    }

    @Override
    public void buildRoof(House h) {
        h.setRoof("A square roof");
        System.out.println(h.getRoof() + "is built.");
    }

    @Override
    public void buildStruct(House h) {
        h.setStruct("A wood struct");
        System.out.println(h.getStruct() + "is built.");
    }
}

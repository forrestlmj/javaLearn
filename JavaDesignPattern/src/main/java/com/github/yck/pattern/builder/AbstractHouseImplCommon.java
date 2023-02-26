package com.github.yck.pattern.builder;

public class AbstractHouseImplCommon extends AbstractHouse {
    @Override
    public void buildWall(House h) {
        h.setWall("A 100m high wall");
        System.out.println(h.getWall() + "is built.");
    }

    @Override
    public void buildRoof(House h) {
        h.setRoof("A circle roof");
        System.out.println(h.getRoof() + "is built.");
    }

    @Override
    public void buildStruct(House h) {
        h.setStruct("A metal struct");
        System.out.println(h.getStruct() + "is built.");
    }
}

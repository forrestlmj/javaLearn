package com.github.yck.pattern.creational.builder;

abstract public class AbstractHouse {
    abstract public void buildWall(House h);
    abstract public void buildRoof(House h);
    abstract public void buildStruct(House h);
    public House build(){
        House house = new House();
        buildStruct(house);
        buildRoof(house);
        buildWall(house);
        return house;
    }
}

package com.github.yck.pattern.creational.builder.improve;

abstract public class Build {
    public void buildWall(House h){    h.setWall("A 3m high wall");
        System.out.println(h.getWall() + "is built.");};
    public void buildRoof(House h){  h.setRoof("A square roof");
        System.out.println(h.getRoof() + "is built.");};
    public void buildStruct(House h){        h.setStruct("A wood struct");
        System.out.println(h.getStruct() + "is built.");};
    public House getResult(){
        House house = new House();
        buildStruct(house);
        buildRoof(house);
        buildWall(house);
        return house;
    }
}

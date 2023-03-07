package com.github.yck.pattern.creational.builder;

public class House {
    private String wall;

    public House(String wall, String roof, String struct) {
        this.wall = wall;
        this.roof = roof;
        this.struct = struct;
    }

    public House() {
    }

    public String getWall() {
        return wall;
    }

    public void setWall(String wall) {
        this.wall = wall;
    }

    public String getRoof() {
        return roof;
    }

    public void setRoof(String roof) {
        this.roof = roof;
    }

    public String getStruct() {
        return struct;
    }

    public void setStruct(String struct) {
        this.struct = struct;
    }

    private String roof;
    private String struct;

    @Override
    public String toString() {
        return "House{" +
                "wall='" + wall + '\'' +
                ", roof='" + roof + '\'' +
                ", struct='" + struct + '\'' +
                '}';
    }
}

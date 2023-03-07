package com.github.yck.pattern.creational.builder;

public class Client {
    public static void main(String[] args) {
        AbstractHouseImplHighBuilding highBuilding = new AbstractHouseImplHighBuilding();
        System.out.println(highBuilding.build());

        AbstractHouseImplCommon common = new AbstractHouseImplCommon();
        System.out.println(common.build());
    }
}

package com.github.yck.pattern.builder.improve;

public class Client {
    public static void main(String[] args) {
        new Director(new AbstractHouseImplCommon()).construct();
        new Director(new AbstractHouseImplHighBuilding()).construct();
    }
}

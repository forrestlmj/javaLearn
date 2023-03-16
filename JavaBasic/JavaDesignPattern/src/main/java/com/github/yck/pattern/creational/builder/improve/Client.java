package com.github.yck.pattern.creational.builder.improve;

public class Client {
    public static void main(String[] args) {
        new Director(new BuildApartment()).construct();
        new Director(new BuildTower()).construct();
    }
}

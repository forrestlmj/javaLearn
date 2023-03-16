package com.github.yck.pattern.creational.builder.improve;

public class BuildTower extends Build {
    @Override
    public void buildRoof(House h) {
        h.setRoof("A Tower roof");
        System.out.println(h.getRoof() + "is built.");
    }

}

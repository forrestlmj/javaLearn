package com.github.yck.pattern.creational.builder.improve;

public class Director {
    private Build build;

    public Director(Build build) {
        this.build = build;
    }

    public void setBuild(Build build) {
        this.build = build;
    }

    public House construct(){
        return build.getResult();
    }
}

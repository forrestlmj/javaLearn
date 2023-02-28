package com.github.yck.pattern.creational.factory.improve.absfactory.pizzas;

public abstract class Pizza {


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String name;
    public abstract void prepare();
    public void cut(){ System.out.println("Pizza is cut. "); }
    public void bake(){ System.out.println("Pizza is baked. "); }
    public void box(){ System.out.println("Pizza is boxed. "); }
}

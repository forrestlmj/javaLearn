package com.github.yck.pattern.structural.bridge;

public abstract class Phone {
    private Brand brand;

    public Phone(Brand brand) {
        this.brand = brand;
    }

    public void open(){
        this.brand.open();
    }
    public void call(){
        this.brand.call();
    }
    public void close(){
        this.brand.close();
    }
}

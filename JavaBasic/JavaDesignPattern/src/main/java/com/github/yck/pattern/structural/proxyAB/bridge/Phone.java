package com.github.yck.pattern.structural.proxyAB.bridge;

public abstract class Phone {
    private Brand brand;

    public Phone(Brand brand) {
        this.brand = brand;
    }

    public void call(){
        this.brand.call();
    }
}

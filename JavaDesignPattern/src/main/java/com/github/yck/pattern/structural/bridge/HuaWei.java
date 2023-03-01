package com.github.yck.pattern.structural.bridge;

public class HuaWei implements Brand {
    @Override
    public void open() {
        System.out.println("HuaWei is Open");
    }

    @Override
    public void call() {
        System.out.println("HuaWei is call");

    }

    @Override
    public void close() {
        System.out.println("HuaWei is close");

    }
}

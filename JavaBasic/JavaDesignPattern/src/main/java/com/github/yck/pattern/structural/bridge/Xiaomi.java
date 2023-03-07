package com.github.yck.pattern.structural.bridge;

public class Xiaomi implements Brand {
    @Override
    public void open() {
        System.out.println("Xiaomi is Open");
    }

    @Override
    public void call() {
        System.out.println("Xiaomi is call");

    }

    @Override
    public void close() {
        System.out.println("Xiaomi is close");

    }
}

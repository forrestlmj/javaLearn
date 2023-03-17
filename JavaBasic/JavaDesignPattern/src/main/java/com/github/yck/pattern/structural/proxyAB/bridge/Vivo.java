package com.github.yck.pattern.structural.proxyAB.bridge;

public class Vivo implements Brand {
    @Override
    public void open() {
        System.out.println("Vivo is Open");
    }

    @Override
    public void call() {
        System.out.println("Vivo is call");

    }

    @Override
    public void close() {
        System.out.println("Vivo is close");

    }
}

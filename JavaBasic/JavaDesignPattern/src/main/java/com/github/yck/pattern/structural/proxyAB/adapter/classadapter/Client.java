package com.github.yck.pattern.structural.proxyAB.adapter.classadapter;

public class Client {
    public static void main(String[] args) {
        Phone phone = new Phone();
        phone.charging(new VoltageAdapter220V5V());
    }
}

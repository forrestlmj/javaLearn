package com.github.yck.pattern.structural.adapter.classadapter;

public class Client {
    public static void main(String[] args) {
        Phone phone = new Phone();
        phone.charging(new VoltageAdapter220V5V());
    }
}

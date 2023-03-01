package com.github.yck.pattern.structural.adapter.instanceadapter;

import com.github.yck.pattern.structural.adapter.classadapter.Voltage220V;

public class Client {
    public static void main(String[] args) {
        Phone phone = new Phone();
        phone.charging(new VoltageAdapter220V5V(new Voltage220V()));
    }
}

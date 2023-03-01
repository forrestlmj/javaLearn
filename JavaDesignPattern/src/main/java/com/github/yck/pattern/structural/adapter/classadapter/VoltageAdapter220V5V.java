package com.github.yck.pattern.structural.adapter.classadapter;

public class VoltageAdapter220V5V extends Voltage220V implements Voltage5V{
    @Override
    public int output5v() {
        int o;
        o = output220v() - 215;
        System.out.println("适配为" + o + "V");
        return o;
    }
}

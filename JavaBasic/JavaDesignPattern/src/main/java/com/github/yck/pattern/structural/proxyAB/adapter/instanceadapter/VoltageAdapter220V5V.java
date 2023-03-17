package com.github.yck.pattern.structural.proxyAB.adapter.instanceadapter;

import com.github.yck.pattern.structural.proxyAB.adapter.classadapter.Voltage220V;

public class VoltageAdapter220V5V implements Voltage5V {
    private Voltage220V voltage220V;

    public VoltageAdapter220V5V(Voltage220V voltage220V) {
        this.voltage220V = voltage220V;
    }


    @Override
    public int output5v() {
        int o;
        o = voltage220V.output220v() - 215;
        System.out.println("适配为" + o + "V");
        return o;
    }
}

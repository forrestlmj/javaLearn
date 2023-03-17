package com.github.yck.pattern.structural.proxyAB.adapter.instanceadapter;

public class Voltage220V {
    public int output220v(){
        int v = 220;
        System.out.println("准备 220v 电压");
        return v;
    }
}

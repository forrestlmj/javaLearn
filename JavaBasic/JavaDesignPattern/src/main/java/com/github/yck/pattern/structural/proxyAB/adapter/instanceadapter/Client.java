package com.github.yck.pattern.structural.proxyAB.adapter.instanceadapter;

import com.github.yck.pattern.structural.proxyAB.adapter.classadapter.Voltage220V;

public class Client {
    public static void main(String[] args) {
        int re = new VoltageAdapter220V5V(new Voltage220V()).output5v();
        if(re > 5){
            System.out.println("电压超出 5V，为" + re + "无法充电");
        }else System.out.println("可以充电，电压为 " + re);
    }
}

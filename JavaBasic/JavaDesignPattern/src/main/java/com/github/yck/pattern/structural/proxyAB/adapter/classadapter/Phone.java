package com.github.yck.pattern.structural.proxyAB.adapter.classadapter;

public class Phone {
    public void charging(Voltage5V v){
        int re = v.output5v();
        if(re > 5){
            System.out.println("电压超出 5V，为" + re + "无法充电");
        }else System.out.println("可以充电，电压为 " + re);
    }
}

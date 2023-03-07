package com.github.yck.pattern.behavioral.command;

public class XiaoMiTV implements TvReceiver {
    @Override
    public void turnOn() {
        System.out.println("XiaoMiTV is turnOn");

    }

    @Override
    public void CCTV() {
        System.out.println("XiaoMiTV is CCTV");

    }

    @Override
    public void turnOff() {
        System.out.println("XiaoMiTV is turnOff");

    }
}

package com.github.yck.pattern.behavioral.command;

public class HuaWeiLight implements LightReceiver {
    @Override
    public void open() {
        System.out.println("HuaWeiLight is open");
    }

    @Override
    public void plugin() {
        System.out.println("HuaWeiLight is plugin");

    }

    @Override
    public void close() {
        System.out.println("HuaWeiLight is close");

    }

    @Override
    public void plugOff() {
        System.out.println("HuaWeiLight is plugOff");

    }
}

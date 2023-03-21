package com.github.yck.pattern.behavioral.structurelike.command.tvcommand;

public class XiaoMiLight implements LightReceiver {
    @Override
    public void open() {
        System.out.println("XiaoMiLight is open");
    }

    @Override
    public void plugin() {
        System.out.println("XiaoMiLight is plugin");

    }

    @Override
    public void close() {
        System.out.println("XiaoMiLight is close");

    }

    @Override
    public void plugOff() {
        System.out.println("XiaoMiLight is plugOff");

    }
}

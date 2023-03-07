package com.github.yck.pattern.behavioral.command;

public class Client {
    private static RemoteController r = new RemoteController();
    public static void main(String[] args) {
        build();
        invoke();
    }

    private static void invoke() {
        r.pushOnButton(0);
        r.pushOnButton(1);
        r.pushOnButton(2);
        System.out.println("============---------- All turned on");
        r.pushOffButton(2);
        r.pushOffButton(0);
        r.pushOffButton(1);
        System.out.println("============---------- All turned off");
        r.undo();
        System.out.println("============---------- Only XiaoMiLight is on");
    }

    private static void build() {
        r.setCommands(0,new LightCommandOn(new HuaWeiLight()),new LightCommandOff(new HuaWeiLight()));
        r.setCommands(1,new LightCommandOn(new XiaoMiLight()),new LightCommandOff(new XiaoMiLight()));
        r.setCommands(2,new TVCommandOn(new XiaoMiTV()),new TVCommandOff(new XiaoMiTV()));

    }
}

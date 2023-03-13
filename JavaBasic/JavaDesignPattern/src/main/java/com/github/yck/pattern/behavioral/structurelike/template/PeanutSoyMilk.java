package com.github.yck.pattern.behavioral.structurelike.template;

public class PeanutSoyMilk extends SoyMilk {
    @Override
    public Boolean NeedSock() {
        return false;
    }
    @Override
    public void select() {
        System.out.println("选择花生");
    }
}

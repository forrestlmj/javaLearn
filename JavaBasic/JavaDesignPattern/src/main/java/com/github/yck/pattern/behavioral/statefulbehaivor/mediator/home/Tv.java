package com.github.yck.pattern.behavioral.statefulbehaivor.mediator.home;

public class Tv implements Thing{
    private Mediator m;
    public Tv(String tv, HomeCenter homeCenter) {
        m  =  homeCenter;
        m.register(tv, this);
    }

    @Override
    public Mediator getMediator() {
        return null;
    }

    @Override
    public void sendMessage() {

    }

    @Override
    public void execute() {
        System.out.println("TV is Opened");
    }
}

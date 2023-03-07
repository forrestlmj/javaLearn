package com.github.yck.pattern.behavioral.mediator.home;

public class Radio implements Thing{
    private Mediator m;
    public Radio(String radio, HomeCenter homeCenter) {
        m = homeCenter;
        m.register(radio,this);
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
        System.out.println("Radio is Opened");
    }
}

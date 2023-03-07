package com.github.yck.pattern.behavioral.mediator.home;

public class Coffee implements Thing {

    public void setM(Mediator m) {
        this.m = m;
    }

    private Mediator m;

    public Coffee(String name,Mediator m) {
        setM(m);
        m.register(name,this);
    }

    @Override
    public Mediator getMediator() {
        return m;
    }

    @Override
    public void sendMessage() {
        getMediator().getMessage(STATES.COFFEE_DONE);
    }

    @Override
    public void execute() {
        System.out.println("Coffee is Done.");
        sendMessage();
    }
}

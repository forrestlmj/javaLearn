package com.github.yck.pattern.behavioral.mediator.home;

public class Clock implements Thing{
    private Mediator m;
    public Clock(String clock, Mediator homeCenter) {
        m = homeCenter;
        m.register(clock,this);
    }

    @Override
    public Mediator getMediator() {
        return m;
    }

    @Override
    public void sendMessage() {
        m.getMessage(STATES.CLOCK_DONE);
    }

    @Override
    public void execute() {
        System.out.println("Clock is Ringed.");
        sendMessage();
    }
}

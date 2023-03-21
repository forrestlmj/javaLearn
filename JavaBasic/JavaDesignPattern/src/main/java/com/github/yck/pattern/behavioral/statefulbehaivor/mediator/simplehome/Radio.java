package com.github.yck.pattern.behavioral.statefulbehaivor.mediator.simplehome;

public class Radio implements Thing {
    private Mediator mediator;
    public Radio(String radio, HomeCenter homeCenter) {
        mediator = homeCenter;
        mediator.register(radio,this);
    }

    @Override
    public Mediator getMediator() {
        return mediator;
    }

    @Override
    public void sendMessage() {
        Mediator mediator = getMediator();
        mediator.getMessage(HomeCenter._RADIO);
    }

    @Override
    public void execute() {
        System.out.println("Radio is Opened");
        sendMessage();
    }
}

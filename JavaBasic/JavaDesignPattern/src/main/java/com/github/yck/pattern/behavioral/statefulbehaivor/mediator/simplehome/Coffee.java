package com.github.yck.pattern.behavioral.statefulbehaivor.mediator.simplehome;

public class Coffee implements Thing {

    public void setM(Mediator m) {
        this.mediator = mediator;
    }

    private Mediator mediator;

    public Coffee(String name, Mediator mediator) {
        setM(mediator);
        mediator.register(name,this);
    }

    @Override
    public Mediator getMediator() {
        return mediator;
    }

    @Override
    public void sendMessage() {
        Mediator mediator = getMediator();
        mediator.getMessage(HomeCenter._COFFEE);
    }

    @Override
    public void execute() {
        System.out.println("Coffee is Done.");
        sendMessage();
    }
}

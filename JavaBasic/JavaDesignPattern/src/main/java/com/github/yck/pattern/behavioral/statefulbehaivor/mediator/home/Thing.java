package com.github.yck.pattern.behavioral.statefulbehaivor.mediator.home;

public interface Thing {

    Mediator getMediator();
    void sendMessage();
    void execute();
}

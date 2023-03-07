package com.github.yck.pattern.behavioral.mediator.home;

public interface Thing {

    Mediator getMediator();
    void sendMessage();
    void execute();
}

package com.github.yck.pattern.behavioral.statefulbehaivor.mediator.simplehome;

public interface Thing {

    Mediator getMediator();
    void sendMessage();
    void execute();
}

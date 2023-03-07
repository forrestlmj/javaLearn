package com.github.yck.pattern.behavioral.mediator.home;

public interface Mediator {
    void getMessage(STATES s);
    void register(String name, Thing thing);
}

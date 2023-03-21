package com.github.yck.pattern.behavioral.statefulbehaivor.mediator.simplehome;

public interface Mediator {
    void getMessage(String s)  ;
    void process(String type);
    void register(String name, Thing thing);
}

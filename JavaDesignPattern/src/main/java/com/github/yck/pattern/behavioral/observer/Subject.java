package com.github.yck.pattern.behavioral.observer;

public interface Subject {
    void register(Observer o);
    void remove(Observer o);
    void notifyAllRegister();
}

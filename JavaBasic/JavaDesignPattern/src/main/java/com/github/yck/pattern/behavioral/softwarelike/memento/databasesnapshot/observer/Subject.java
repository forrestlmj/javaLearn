package com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.observer;

public interface Subject {
    void register(Observer m);
    void remove(Observer m);
    void notifyALl();
}

package com.github.yck.pattern.behavioral.memento.databasesnapshot.observer;

import java.util.List;

public interface Subject {
    void register(Observer m);
    void remove(Observer m);
    void notifyALl();
}

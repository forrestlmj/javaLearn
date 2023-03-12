package com.github.yck.pattern.behavioral.memento.databasesnapshot.memento;

public interface Originator {
    Memento saveMemento(String state);
    void recoveryFromMemento(Integer idx);
}

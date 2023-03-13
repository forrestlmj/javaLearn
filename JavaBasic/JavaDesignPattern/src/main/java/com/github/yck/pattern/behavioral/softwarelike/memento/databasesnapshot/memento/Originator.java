package com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.memento;

public interface Originator {
    Memento saveMemento(String state);
    void recoveryFromMemento(Integer idx);
}

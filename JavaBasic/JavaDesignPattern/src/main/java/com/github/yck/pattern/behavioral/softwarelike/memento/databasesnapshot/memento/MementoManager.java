package com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.memento;

public interface MementoManager {
    void saveToList(Memento m);
    Memento recover(Integer idx);
}

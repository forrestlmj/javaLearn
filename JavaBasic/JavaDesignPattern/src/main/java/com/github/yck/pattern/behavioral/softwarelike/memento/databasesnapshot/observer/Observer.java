package com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.observer;

import com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.memento.Memento;

public interface Observer {
    void fetch(Memento m);
}

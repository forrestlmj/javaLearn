package com.github.yck.pattern.behavioral.memento.databasesnapshot.observer;

import com.github.yck.pattern.behavioral.memento.databasesnapshot.memento.Memento;

public interface Observer {
    void fetch(Memento m);
}

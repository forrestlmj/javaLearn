package com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.snapshot;

import com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.memento.Memento;
import com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.memento.MementoManager;
import com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.observer.Observer;

import java.util.ArrayList;
import java.util.List;

public class SnapshotManager implements Observer, MementoManager {
    private List<Memento> mementos =new ArrayList<>();
    @Override
    public void saveToList(Memento m) {
        mementos.add(m);
    }

    public void print() {
        mementos.forEach(System.out::println);
    }

    @Override
    public Memento recover(Integer idx) {
        return mementos.get(idx);
    }

    @Override
    public void fetch(Memento m) {
        saveToList(m);
    }
}

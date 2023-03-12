package com.github.yck.pattern.behavioral.memento.databasesnapshot.snapshot;

import com.github.yck.pattern.behavioral.memento.databasesnapshot.memento.Memento;
import com.github.yck.pattern.behavioral.memento.databasesnapshot.memento.Originator;
import com.github.yck.pattern.behavioral.memento.databasesnapshot.observer.Observer;
import com.github.yck.pattern.behavioral.memento.databasesnapshot.observer.Subject;

import java.util.ArrayList;
import java.util.List;

public class DBFile implements Subject, Originator {
    @Override
    public String toString() {
        return "DBFile{" +
                "state='" + state + '\'' +
                '}';
    }

    public DBFile(String state) {
        this.state = state;
    }

    public DBFile() {
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
        notifyALl();
    }

    private String state;
    private List<SnapshotManager> observers = new ArrayList<>();
    @Override
    public Memento saveMemento(String state) {
        return new Snapshot(state);
    }

    @Override
    public void recoveryFromMemento(Integer idx) {
        SnapshotManager snapshotManager = observers.get(0);
        Snapshot s = (Snapshot)snapshotManager.recover(idx);
        setState(s.getState());
    }

    @Override
    public void register(Observer m) {
        observers.add((SnapshotManager) m);
    }

    @Override
    public void remove(Observer m) {
        observers.remove(m);
    }

    @Override
    public void notifyALl() {
        observers.forEach(
                o -> {

                    o.fetch(saveMemento(getState()));
                }
        );
    }
}

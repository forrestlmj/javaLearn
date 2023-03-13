package com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot;

import com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.snapshot.DBFile;
import com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot.snapshot.SnapshotManager;

public class Client {
    public static void main(String[] args) throws InterruptedException {
        DBFile dbFile = new DBFile();
        SnapshotManager snapshotManager = new SnapshotManager();

        dbFile.register(snapshotManager);
        dbFile.setState("First");
        Thread.sleep(200);
        dbFile.setState("Second");
        Thread.sleep(200);
        dbFile.setState("Third");
        System.out.println(dbFile);

        dbFile.recoveryFromMemento(1);
        Thread.sleep(200);

        System.out.println(dbFile);
        snapshotManager.print();
    }
}

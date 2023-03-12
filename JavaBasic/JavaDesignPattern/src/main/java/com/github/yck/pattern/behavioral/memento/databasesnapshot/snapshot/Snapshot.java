package com.github.yck.pattern.behavioral.memento.databasesnapshot.snapshot;

import com.github.yck.pattern.behavioral.memento.databasesnapshot.memento.Memento;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

public class Snapshot implements Memento {
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss.S");

    @Override
    public String toString() {
        return "Snapshot{" +
                "timeStamp='" + timeStamp + '\'' +
                ", state='" + state + '\'' +
                '}';
    }

    public Snapshot(String state) {

        this.state = state;
        setTimeStamp(sdf.format(new Date().getTime()));
    }

    public String getTimeStamp() {
        return timeStamp;
    }

    private void setTimeStamp(String timeStamp) {
        this.timeStamp = timeStamp;
    }

    public String getState() {
        return state;
    }


    private String timeStamp;
    String state;
}

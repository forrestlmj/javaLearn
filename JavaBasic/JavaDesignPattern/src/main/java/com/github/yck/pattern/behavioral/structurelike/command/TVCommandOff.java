package com.github.yck.pattern.behavioral.structurelike.command;

public class TVCommandOff implements Command {
    private TvReceiver tvReceiver;

    public TVCommandOff(TvReceiver tvReceiver) {
        this.tvReceiver = tvReceiver;
    }

    @Override
    public void execute() {
        tvReceiver.turnOff();
    }

    @Override
    public void undo() {
        tvReceiver.turnOn();tvReceiver.CCTV();
    }
}

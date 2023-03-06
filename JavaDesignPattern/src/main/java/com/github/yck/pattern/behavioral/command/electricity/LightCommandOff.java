package com.github.yck.pattern.behavioral.command.electricity;

public class LightCommandOff implements Command {
    private LightReceiver lightReceiver;

    public LightCommandOff(LightReceiver lightReceiver) {
        this.lightReceiver = lightReceiver;
    }

    @Override
    public void execute() {
        lightReceiver.close();lightReceiver.plugOff();
    }

    @Override
    public void undo() {
        lightReceiver.plugin();lightReceiver.open();
    }
}

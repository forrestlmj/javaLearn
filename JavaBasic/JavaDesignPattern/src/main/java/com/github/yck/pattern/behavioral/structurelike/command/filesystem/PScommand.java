package com.github.yck.pattern.behavioral.structurelike.command.filesystem;

public class PScommand implements Command {
    Receiver receiver;

    public PScommand(Receiver receiver) {
        this.receiver = receiver;
    }

    @Override
    public void execute() {
        receiver.operation();
    }
}

package com.github.yck.pattern.behavioral.structurelike.command.filesystem;

public class PSReceiverWindows implements Receiver {
    @Override
    public void operation() {
        System.out.println("Run ps on windows success");

    }
}

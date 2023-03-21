package com.github.yck.pattern.behavioral.structurelike.command.filesystem;

public class PSReceiverLinux implements Receiver {
    @Override
    public void operation() {
        System.out.println("Run ps -ef on Linux success");
    }
}

package com.github.yck.pattern.behavioral.structurelike.command.filesystem;

public class Client {
    public static void main(String[] args) {
        Invoker invoker = new Invoker(new PScommand(new PSReceiverWindows()));
        invoker.executeCommand();
    }
}

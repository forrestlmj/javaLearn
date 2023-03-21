package com.github.yck.pattern.behavioral.structurelike.command.filesystem;

public class Invoker {
    public Invoker(Command c) {
        this.c = c;
    }

    Command c;
    public void setCommand(Command c){
        c = c;
    }
    public void executeCommand(){
        c.execute();
    }
}

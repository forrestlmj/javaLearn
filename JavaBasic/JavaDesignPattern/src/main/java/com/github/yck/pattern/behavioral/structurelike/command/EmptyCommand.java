package com.github.yck.pattern.behavioral.structurelike.command;

public class EmptyCommand implements Command {
    @Override
    public void execute() {
        System.out.println("Empty Command execute");
    }

    @Override
    public void undo() {
        System.out.println("Empty Command undo");

    }
}

package com.github.yck.pattern.behavioral.command;

public class RemoteController {

    // 开 按钮的命令数组
    private Command[] onCommands = new Command[5];
    private Command[] offCommands = new Command[5];

    // 执行撤销的命令
    private Command undoCommand;


    public RemoteController() {
        for (int i = 0; i < 5; i++) {
            onCommands[i] = new EmptyCommand();
            offCommands[i] = new EmptyCommand();
        }
        undoCommand = new EmptyCommand();
    }

    public void setCommands(Integer i,Command onCommand,Command OffCommand) {
        onCommands[i] = onCommand;
        offCommands[i] = OffCommand;
    }

    public void pushOnButton(Integer i){
        onCommands[i].execute();
        undoCommand = offCommands[i];
    }
    public void pushOffButton(Integer i){
        offCommands[i].execute();
        undoCommand = onCommands[i];
    }
    public void undo(){
        undoCommand.execute();
    }

}

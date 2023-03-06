package com.github.yck.pattern.behavioral.command.electricity;

public interface LightReceiver {
    void open();
    void plugin();
    void close();
    void plugOff();
}

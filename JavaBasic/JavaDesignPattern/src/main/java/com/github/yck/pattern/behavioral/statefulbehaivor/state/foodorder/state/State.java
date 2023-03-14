package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.state;

public interface State {
    STATE_TYPE getStateType();
    Boolean deductMoney() throws InterruptedException;
    Boolean acceptOrder() throws InterruptedException;
    Boolean callDeliverMan() throws InterruptedException;
    void printMessage();
}

package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.state;

import com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.OrderContext;

abstract public class DefaultState implements State {
    private STATE_TYPE stateType;
    public DefaultState(OrderContext orderContext) {
        this.orderContext = orderContext;
    }

    OrderContext orderContext;
    @Override
    public Boolean deductMoney() throws InterruptedException {
        return null;
    }

    @Override
    public Boolean acceptOrder() throws InterruptedException {
        return null;
    }

    @Override
    public Boolean callDeliverMan() throws InterruptedException {
        return null;
    }

    public STATE_TYPE getStateType() {
        return stateType;
    }

    protected void setStateType(STATE_TYPE stateType) {
        this.stateType = stateType;
    }
    @Override
    public void printMessage() {

    }
}

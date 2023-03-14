package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.state;

import com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.OrderContext;

public class FailedState extends DefaultState{

    @Override
    public void printMessage() {
        System.out.println("订单失败！");
    }

    public FailedState(OrderContext orderContext) {
        super(orderContext);
        setStateType(STATE_TYPE.FAILED_STATE);
    }
}

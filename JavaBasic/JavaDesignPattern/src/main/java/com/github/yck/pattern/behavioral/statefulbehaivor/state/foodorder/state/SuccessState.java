package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.state;

import com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.OrderContext;

public class SuccessState extends DefaultState{
    public SuccessState(OrderContext orderContext) {
        super(orderContext);
        setStateType(STATE_TYPE.SUCCESS_STATE);
    }
    @Override
    public void printMessage() {
        System.out.println("订单已完成");
    }
}

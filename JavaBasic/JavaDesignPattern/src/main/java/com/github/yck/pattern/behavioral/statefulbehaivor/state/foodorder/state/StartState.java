package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.state;

import com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.OrderContext;

public class StartState extends DefaultState{
    public StartState(OrderContext orderContext) {
        super(orderContext);
        setStateType(STATE_TYPE.START_STATE);
    }

    @Override
    public void printMessage() {
        System.out.println("菜品已选好，准备扣费。。");
        orderContext.setState(orderContext.getBillState());

    }

}

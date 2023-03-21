package com.github.yck.pattern.behavioral.statefulbehaivor.state.simplefoodorder.state;


public class MerchantState implements State {
    private OrderContext orderContext;
    private static final String TYPE = "MerchantState";

    public MerchantState(OrderContext orderContext) {
        this.orderContext = orderContext;
    }

    @Override
    public void process() {
        System.out.println("商家处理订单完成..");
        orderContext.setState(orderContext.getDs());
    }

    @Override
    public String getStateTYPE() {
        return TYPE;
    }
}

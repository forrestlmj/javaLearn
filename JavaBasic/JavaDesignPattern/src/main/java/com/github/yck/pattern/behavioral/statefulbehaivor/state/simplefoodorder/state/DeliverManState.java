package com.github.yck.pattern.behavioral.statefulbehaivor.state.simplefoodorder.state;

public class DeliverManState implements State {
    private OrderContext orderContext;
    public DeliverManState(OrderContext orderContext) {
        this.orderContext = orderContext;
    }
    private static final String TYPE = "DeliverManState";

    @Override
    public void process() {
        System.out.println("骑手送货完成");
        orderContext.setState(orderContext.getMs());
    }

    @Override
    public String getStateTYPE() {
        return TYPE;
    }
}

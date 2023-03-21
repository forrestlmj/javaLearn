package com.github.yck.pattern.behavioral.statefulbehaivor.state.simplefoodorder.state;

public class OrderContext {
    protected State getState() {
        return state;
    }

    protected void setState(State state) {
        this.state = state;
    }

    public OrderContext() {
        ms = new MerchantState(this);
        ds = new DeliverManState(this);
        setState(ms);
    }

    private State state;

    protected DeliverManState getDs() {
        return ds;
    }

    protected MerchantState getMs() {
        return ms;
    }

    private DeliverManState ds;
    private MerchantState ms;

    public void handle() throws InterruptedException {
        while (true){
//            Thread.sleep(1000);
            state.process();
        }
    }

}

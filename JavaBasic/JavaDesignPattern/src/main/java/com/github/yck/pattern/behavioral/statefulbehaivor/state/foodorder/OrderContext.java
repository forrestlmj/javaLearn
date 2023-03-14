package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder;

import com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.state.*;

public class OrderContext {
    public void setState(State state) {
        this.state = state;
    }

    private State state;
    public void deduceMoney(Integer fee){
        setMoney(getMoney() - fee);
    }
    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    private Integer money;

    private State startState = new StartState(this)      ;
    private State billState = new BillState(this)         ;
    private State merchantState = new MerchantState(this)     ;
    private State deliverManState = new DeliverManState(this)   ;
    private State failedState = new FailedState(this)         ;

    public State getStartState() {
        return startState;
    }

    public State getBillState() {
        return billState;
    }

    public State getMerchantState() {
        return merchantState;
    }

    public State getDeliverManState() {
        return deliverManState;
    }

    public OrderContext(Integer money) {
        this.money = money;
        state = startState;
    }

    public State getFailedState() {
        return failedState;
    }

    public State getSuccessState() {
        return successState;
    }

    private State successState = new SuccessState(this)      ;

    public boolean run() throws InterruptedException {
        setState(startState);
        while (true){
            switch (state.getStateType()){
                case START_STATE:state.printMessage();break;
                case BILL_STATE:state.deductMoney();break;
                case MERCHANT_STATE:state.acceptOrder();break;
                case DELIVERMAN_STATE:state.callDeliverMan();break;

                case FAILED_STATE:state.printMessage();return false;
                case SUCCESS_STATE: state.printMessage();return true;
            }
        }
//        state.deductMoney();
//        state.acceptOrder();
//        state.callDeliverMan();
    }
}

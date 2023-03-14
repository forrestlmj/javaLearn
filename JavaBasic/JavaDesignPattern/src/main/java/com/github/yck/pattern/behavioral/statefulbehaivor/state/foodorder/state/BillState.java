package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.state;

import com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.OrderContext;

import java.util.Random;

public class BillState extends DefaultState{
    public BillState(OrderContext orderContext) {
        super(orderContext);
        setStateType(STATE_TYPE.BILL_STATE);
    }

    @Override
    public Boolean deductMoney() throws InterruptedException {
        Random r = new Random();
        int fee = r.nextInt(10) + 1;
        if (orderContext.getMoney() >= fee){
            orderContext.deduceMoney(fee);
            System.out.println("已扣费 "+fee+"元，扣分后余额："+orderContext.getMoney()+"，开始下单");
            Thread.sleep(300);
            orderContext.setState(orderContext.getMerchantState());
            return true;
        }else {
            System.out.println("余额不足"+fee+"请充值。当前余额："+orderContext.getMoney());
            Thread.sleep(300);
            orderContext.setState(orderContext.getFailedState());
            return false;
        }
    }
}

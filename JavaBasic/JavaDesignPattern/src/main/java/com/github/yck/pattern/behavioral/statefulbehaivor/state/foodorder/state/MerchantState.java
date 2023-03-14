package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.state;

import com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.OrderContext;

import java.util.Random;

public class MerchantState extends DefaultState{
    public MerchantState(OrderContext orderContext) {
        super(orderContext);
        setStateType(STATE_TYPE.MERCHANT_STATE);

    }

    @Override
    public Boolean acceptOrder() throws InterruptedException {
        Random r = new Random();
        int possibility = r.nextInt(100);
        if (possibility < 40){
            System.out.println("商家已经接单");
            Thread.sleep(1000);
            System.out.println("商家开始呼叫骑手战鹰：");
            orderContext.setState(orderContext.getDeliverManState());
            return true;
        }else {
            System.out.println("无商家接单！重新为您匹配中");
            Thread.sleep(3000);
            orderContext.setState(orderContext.getMerchantState());
            return false;
        }

    }
}

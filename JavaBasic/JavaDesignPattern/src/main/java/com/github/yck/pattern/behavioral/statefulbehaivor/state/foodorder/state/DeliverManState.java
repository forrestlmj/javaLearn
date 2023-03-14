package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.state;

import com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder.OrderContext;
import jdk.management.resource.internal.inst.ThreadRMHooks;

import java.util.Random;

public class DeliverManState extends DefaultState{
    public DeliverManState(OrderContext orderContext) {
        super(orderContext);
        setStateType(STATE_TYPE.DELIVERMAN_STATE);

    }

    @Override
    public Boolean callDeliverMan() throws InterruptedException {
        Random random = new Random();
        int possibility = random.nextInt(100);
        if (possibility < 60){
            System.out.println("骑手战鹰已经接单!");
            Thread.sleep(1000);
            System.out.println("订单已送达！");
            orderContext.setState(orderContext.getSuccessState());
            return true;
        }else {
            System.out.println("无骑手接单，正在匹配...");
            Thread.sleep(3000);
            orderContext.setState(orderContext.getDeliverManState());
            return false;
        }
    }


}

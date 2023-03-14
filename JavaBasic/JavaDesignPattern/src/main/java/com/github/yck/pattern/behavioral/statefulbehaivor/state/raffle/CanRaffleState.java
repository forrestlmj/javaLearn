package com.github.yck.pattern.behavioral.statefulbehaivor.state.raffle;

import java.util.Random;

/**
 * 可以抽奖状态
 */
public class CanRaffleState implements State {
    public CanRaffleState(RaffleActivity raffleActivity) {
        this.raffleActivity = raffleActivity;
    }

    RaffleActivity raffleActivity;
    @Override
    public boolean canDeduceMoneyOrNot() {
        System.out.println("Already Deduced");
        return false;
    }

    /**
     * 根据业务规则进行抽奖
     * @return
     */
    @Override
    public boolean canRaffleOrNot() {
        System.out.println("开始抽奖");
        Random r = new Random();
        int i = r.nextInt(10);
        if(i < 3){
            System.out.println("中奖啦!");
            raffleActivity.setState(raffleActivity.getDispenseState());
            return true;
        }else {
            System.out.println("没有中奖");
            raffleActivity.setState(raffleActivity.getNoRaffleState());
            return false;
        }

    }

    @Override
    public boolean canDispensePrizeOrNot() {
        return false;
    }
}

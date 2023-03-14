package com.github.yck.pattern.behavioral.statefulbehaivor.state.raffle;

/**
 * 不能抽奖状态
 */
public class NoRaffleState implements State {
    public NoRaffleState(RaffleActivity raffleActivity) {
        this.raffleActivity = raffleActivity;
    }

    RaffleActivity raffleActivity;

    @Override
    public boolean canDeduceMoneyOrNot() {
        System.out.println("扣除积分 50");
        raffleActivity.setState(raffleActivity.getCanRaffleState());

        return true;
    }

    @Override
    public boolean canRaffleOrNot() {
        System.out.println("还未扣除积分");
        return false;
    }

    @Override
    public boolean canDispensePrizeOrNot() {
        System.out.println("不能发送奖品！");
        return false;
    }
}

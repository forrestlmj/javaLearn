package com.github.yck.pattern.behavioral.statefulbehaivor.state.raffle;

/**
 * 发放奖品状态
 */
public class DispenseState implements State {
    public DispenseState(RaffleActivity raffleActivity) {
        this.raffleActivity = raffleActivity;
    }

    RaffleActivity raffleActivity;

    @Override
    public boolean canDeduceMoneyOrNot() {
        return false;
    }

    @Override
    public boolean canRaffleOrNot() {
        return false;
    }

    /**
     * 判断奖品够不够，如果够就发。
     * @return
     */
    @Override
    public boolean canDispensePrizeOrNot() {
        int count = raffleActivity.getCount();
        if (count>0){
            System.out.println("发放奖品！");
            raffleActivity.setState(raffleActivity.getNoRaffleState());
            raffleActivity.countMinusOne();
            return true;
        }else {
            System.out.println("没奖品啦 ");
            raffleActivity.setState(raffleActivity.getDispenseOutState());
            return false;
        }
    }
}

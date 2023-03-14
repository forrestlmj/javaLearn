package com.github.yck.pattern.behavioral.statefulbehaivor.state.raffle;

/**
 *  * 奖品发放完毕状态
 *  * 说明，当我们activity 改变成 DispenseOutState， 抽奖活动结束
 */
public class DispenseOutState implements State {
    public DispenseOutState(RaffleActivity raffleActivity) {
        this.raffleActivity = raffleActivity;
    }

    RaffleActivity raffleActivity;
    @Override
    public boolean canDeduceMoneyOrNot() {
        System.out.println("奖品发送完了，请下次再参加");

        return false;
    }

    @Override
    public boolean canRaffleOrNot() {
        System.out.println("奖品发送完了，请下次再参加");

        return false;
    }

    @Override
    public boolean canDispensePrizeOrNot() {
        System.out.println("奖品发送完了，请下次再参加");

        return false;
    }
}

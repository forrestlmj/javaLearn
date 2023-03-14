package com.github.yck.pattern.behavioral.statefulbehaivor.state.raffle;

/**
 * 状态接口
 */
public interface State {
    boolean canDeduceMoneyOrNot();
    boolean canRaffleOrNot();
    boolean canDispensePrizeOrNot();
}

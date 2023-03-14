package com.github.yck.pattern.behavioral.statefulbehaivor.state.raffle;

/**
 * 上下文类
 *  与 各个状态互相 Dependence
 *      每个状态都将同一个  RaffleActivity 聚合到自己的类变量中
 *      然后在各自实现的方法中，通过 RaffleActivity 的内部变量（状态 ）来
 *      推动整个流程。
 */
public class RaffleActivity {

    public RaffleActivity(int count) {
        this.state = noRaffleState;
        this.count = count;
    }

    /**
     * 奖品数量
     */
    private int count  =  0;
    private State state;

    public int getCount() {
        return count;
    }

    public State getNoRaffleState() {
        return noRaffleState;
    }

    public State getCanRaffleState() {
        return canRaffleState;
    }

    public State getDispenseState() {
        return dispenseState;
    }

    public State getDispenseOutState() {
        return dispenseOutState;
    }

    private State noRaffleState = new NoRaffleState(this);
    private State canRaffleState = new CanRaffleState(this);
    private State dispenseState = new DispenseState(this);
    private State dispenseOutState = new DispenseOutState(this);


    public State getState() {
        return state;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void setState(State s) {
        this.state = s;
    }


    public void countMinusOne() {
        count--;
    }

    //扣分, 调用当前状态的 deductMoney
    public void debuctMoney(){
        state.canDeduceMoneyOrNot();
    }

    //抽奖
    public void raffle(){
        // 如果当前的状态是抽奖成功
        if(state.canRaffleOrNot()){
            //领取奖品
            state.canDispensePrizeOrNot();
        }

    }
}

package com.github.yck.pattern.behavioral.statefulbehaivor.strategy.payway;

import com.github.yck.pattern.behavioral.statefulbehaivor.strategy.payway.strategy.PayStrategy;

import java.util.List;

public class Order {
    public PayStrategy getP() {
        return p;
    }
    public void provide(List<String> info){
        p.askForDetailInfo();
        p.getDetailInfo(info);
    }
    public void pay(){
        p.pay();
    }
    public void setP(PayStrategy p) {
        this.p = p;
    }

    private PayStrategy p;

    public Order(PayStrategy p) {
        this.p = p;
    }
}

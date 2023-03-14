package com.github.yck.pattern.behavioral.statefulbehaivor.strategy.payway;

import com.github.yck.pattern.behavioral.statefulbehaivor.strategy.payway.strategy.AliPay;
import com.github.yck.pattern.behavioral.statefulbehaivor.strategy.payway.strategy.WechatPay;

import java.util.ArrayList;

public class Client {
    public static void main(String[] args) {
        Order order = new Order(new AliPay());
        order.provide(new ArrayList<String>(){{
            add("LouisCk");add("LouisCkPwd");
        }});
        order.pay();

        order.setP(new WechatPay());
        order.provide(new ArrayList<String>(){{
            add("niuniu");add("niuniupwd");
        }});
        order.pay();
    }
}

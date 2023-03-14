package com.github.yck.pattern.behavioral.statefulbehaivor.strategy.payway.strategy;

import java.util.List;

public interface PayStrategy {
    void askForDetailInfo();
    void getDetailInfo(List<String> info);
    void pay();
}

package com.github.yck.pattern.behavioral.statefulbehaivor.strategy;
/**
 * 策略模式
 * 文档中给的 鸭子 例子没有策略模式的精髓
 * 因此在网上搜了一下，我觉得以下几个例子还是很直观的
 *  1. 订单的支付方式（https://refactoringguru.cn/design-patterns/strategy/java/example）
 *  2. 地图App的出行方式时间算法（https://refactoringguru.cn/design-patterns/strategy）
 *  3. 两数关系运算（https://www.runoob.com/design-pattern/strategy-pattern.html）
 *
 * 以上例子都强调不同算法簇、不同方式继承于同一个接口，在上下文类中根据调度方给出策略建议
 */
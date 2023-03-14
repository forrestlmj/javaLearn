package com.github.yck.pattern.behavioral.statefulbehaivor.strategy;
/**
 * 策略模式
 * 文档中给的 鸭子 例子没有策略模式的精髓
 *
 * 策略模式强调：
 * 1. 不同算法簇、不同方式继承于同一个接口，体现差异性。
 * 2. 在上下文类中，根据用户的需求，去调用具体算法簇。
 *
 * 因此在网上搜了一下，我觉得以下几个例子还是很直观的：
 *  1. 订单的支付方式（https://refactoringguru.cn/design-patterns/strategy/java/example）
 *    策略：
 *      支付方式接口 - 支付金额方法，输入不同验证方式
 *          微信实现类
 *          支付宝实现类
 *          信用卡实现类
 *    上下文：
 *      根据用户的需求选择不同的支付方法。
 *  2. 地图App的出行方式时间算法（https://refactoringguru.cn/design-patterns/strategy）
 *    策略：
 *      出行方式接口 - 计算耗时方法，计费方法
 *          公交车实现类
 *          共享单车实现类
 *          地铁实现类
 *    上下文 ：
 *      同时调用三种方法
 *  3. 两数关系运算（https://www.runoob.com/design-pattern/strategy-pattern.html）
 *
 * 以
 */
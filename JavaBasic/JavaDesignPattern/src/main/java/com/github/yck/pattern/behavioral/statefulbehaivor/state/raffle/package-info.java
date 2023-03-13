package com.github.yck.pattern.behavioral.statefulbehaivor.state.raffle;
/**
 * 彩票的例子：
 * 四种状态：
 * 不能抽奖、可以抽奖 、发放奖品、奖品领完
 *
 *
 * 业务例子如下：
 *          **不能抽奖**
 *           ”扣除五分“ **可以抽奖**
 *               if 10% 概率中奖：
 *                   **发放奖品**：
 *                       if 奖品数量 > 0:
 *                           goto **不能抽奖**
 *                       else:
 *                           return **奖品领完**
 *                else if 90% 概率不会中奖：
 *                   goto **不能抽奖**
 *  设计模式：
 *      1 State 接口：
 *          扣除积分方法 deduceMoney()
 *          抽奖方法 raffle()
 *          发放奖品方法 dispensePrize()
 *      2. State 实现类：
 *          不能抽奖 NoRaffleState
 *          可以抽奖 CanRaffleState
 *          发放奖品 DispenseState
 *          奖品领完 DispenseOutState
 */
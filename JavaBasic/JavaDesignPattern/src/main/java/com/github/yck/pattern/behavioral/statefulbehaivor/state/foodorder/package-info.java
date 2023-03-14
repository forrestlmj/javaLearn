package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder;
/**
 *
 * 参考链接 ：
 * https://shusheng007.top/2021/09/08/state-pattern/
 * 在网上搜索了一下，接口用单一方法 doAction 也行，不用 搞那么复杂
 *
 * 下单
 *  - 余额充足：
 *      扣款 - 20
 *          50% 商家接单
 *          50% 没有商家接单：
 *              重新下单
 *          有商家接单：
 *              商家备菜
 *              呼叫骑手：
 *                  80%概率 呼叫到 -  返回成功
 *                  20%概率 呼叫不到 - 重新呼叫
 *  - 接单余额不足：返回 失败
 */
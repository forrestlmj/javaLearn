package com.github.yck.chapter_02_lock.sync.resource.sync;

import com.github.yck.chapter_02_lock.sync.resource.Tickets;

/**
 *
 * 线程的几种状态：ready，Runable， running，block（sleep），waiting，terminated
 *
 * 不同于 sleep，sleep 只是阻塞（还有等待用户输入、join），
 * 线程之间通信，wait 与 notify 只能用在 monitor 对象上，而且是进入等待状态。
 *
 * wait 将此线程 加入等待状态
 */
public class WaitNotifyTicketsImpl implements Tickets {

    private Integer number = 100;
    /**
     * 实现一个线程一次只卖一张票
     * @return
     */
    @Override
    public boolean sale() {
        synchronized (WaitNotifyTicketsImpl.class){
            WaitNotifyTicketsImpl.class.notify();
            if(number > 0){
                number--;
                System.out.println(Thread.currentThread().getName()+"卖出一张票："+number);
                try {
                    WaitNotifyTicketsImpl.class.wait();
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                return true;
            }else return false;
        }
    }
}

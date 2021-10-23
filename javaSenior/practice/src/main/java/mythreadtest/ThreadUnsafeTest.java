package mythreadtest;

import org.junit.Test;
class ThreadUnSafe implements Runnable{
    private static Integer count = 30000000;
    private static Object o = new Object();
    @Override
    public void run() {
        while(true){
            //https://www.cnblogs.com/williamjie/p/9466941.html
            //现象是连续一个线程在十几毫秒内都是连续能抢到的,这和时间片有关,由于sleep不释放锁,所以,
            //即使是sleep,在之前时间片中抢到了就是抢到了,因此也是轮到这个线程执行.
            //这部分知识其实涉及到cpu的时间片与线程的调度算法,可参考下面两个链接.
            //"但调度一定得靠操作系统吗？也未必。其实用户态也可以调度。应用程序（或关联的运行库）自己可以实现一套策略，自己管理CPU的时间片。但由于应用程序的运行依赖操作系统，所以需要有前提，只有当应用程序被内核级调度器调度到的时候，才有可能实施自己的调度策略。应用程序自己实现的调度，就是用户级调度。"
            //https://zhuanlan.zhihu.com/p/29668105
            //因此一定是操作系统先有资格选择多线程里要运行的线程,然后多线程的线程安全(sync)/lock,
            //线程之间的通信 wait notify才能起作用.所以在多线程中,一定是一个线程在cpu时间片里面
            //连续几百微妙,小于1毫秒内连续抢占到cpu,单独运行,而后再考虑用户定义的线程安全与线程通信
            //https://www.zhihu.com/question/64723752
                if(count>0){
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println(Thread.currentThread().getName()+":"+count);
                    count --;
                }else break;
            }

    }
}

public class ThreadUnsafeTest {
    /**
     * 获取计算机的逻辑processor数量
     */
    @Test
    public void test(){
        System.out.println(Runtime.getRuntime().availableProcessors());
    }

    /**
     * 线程的五种状态
     */
    @Test
    public void test2(){
        System.out.println(Thread.State.NEW);
        System.out.println(Thread.State.WAITING);
        System.out.println(Thread.State.TIMED_WAITING);
        System.out.println(Thread.State.RUNNABLE);
        System.out.println(Thread.State.BLOCKED);
        System.out.println(Thread.State.TERMINATED);
    }
    public static void main(String[] args){
        ThreadUnSafe t = new ThreadUnSafe();
        Thread t1 = new Thread(t);
        t1.setName("线程1");
        t1.start();

        Thread t2 = new Thread(t);
        t2.setName("线程2");
        t2.start();
    }
}

package com.github.yck.pattern.behavioral.template;

abstract public class SoyMilk {
    /**
     * 钩子方法
     * @return
     */
    public Boolean NeedSock() {
        return true;
    }



    public final void make(){
        select();
        add();
        if (NeedSock())soak();
        beat();
    }
    public void select(){System.out.println("选豆子");};

    public void add(){
        System.out.println("加入豆子");
    };
    public void soak(){System.out.println("加入配料");};
    public void beat(){System.out.println("打碎");};
}

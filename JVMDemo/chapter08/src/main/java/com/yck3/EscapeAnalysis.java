package com.yck3;

/**
 * 逃逸分析
 *
 *  如何快速的判断是否发生了逃逸分析，大家就看new的对象实体是否有可能在方法外被调用。
 * @author shkstart
 * @create 2020 下午 4:00
 */
public class EscapeAnalysis {
    public EscapeAnalysis obj;

    /**
     * 方法返回 EscapeAnalysis 对象，发生逃逸
     * @return
     */
    public EscapeAnalysis getInstance(){
        return obj == null ? new EscapeAnalysis(): obj;
    }

    /**
     * 为成员属性复制，发生逃逸
     */
    public void setObj(){
        this.obj = new EscapeAnalysis();
    }

    /**
     * 引用成员变量，发生逃逸
     */
    public void useEscapeAnalysis(){
        EscapeAnalysis e = getInstance();
    }
}

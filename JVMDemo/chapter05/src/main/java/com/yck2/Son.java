package com.yck2;
/**
 * 解析调用中非虚方法、虚方法的测试
 *
 * invokestatic指令和invokespecial指令调用的方法称为非虚方法
 */
class Father{
    public Father(){
        System.out.println("Father的构造器");
    }
    public static void showStatic(String str){
        System.out.println("Father" + str);
    }
    public final void showFinal(){
        System.out.println("Father show final");
    }
    public void showCommon(){
        System.out.println("father 普通方法");
    }
}
interface MethodInterface{
    void methodA();
}

class Some implements MethodInterface{

    @Override
    public void methodA() {

    }
}
public class Son extends Father{
    public Son(){
        super();
    }

    public Son(String name){
        this();
    }

    public static void showStatic(String str){
        System.out.println("Son" + str);
    }
    private void showPrivate(String str){
        System.out.println("son private" + str);
    }

    public void info(){

    }

    /**
     *  0 ldc #11 <atguigu.com>
     *  2 invokestatic #12 <com/yck2/Son.showStatic : (Ljava/lang/String;)V>
     *  5 ldc #13 <good!>
     *  7 invokestatic #14 <com/yck2/Father.showStatic : (Ljava/lang/String;)V>
     * 10 aload_0
     * 11 ldc #15 <private>
     * 13 invokespecial #16 <com/yck2/Son.showPrivate : (Ljava/lang/String;)V>
     * 16 aload_0
     * 17 invokespecial #17 <com/yck2/Father.showCommon : ()V>
     * 20 aload_0
     * 21 invokevirtual #18 <com/yck2/Son.showCommon : ()V>
     * 24 aload_0
     * 25 invokevirtual #19 <com/yck2/Son.showFinal : ()V>
     * 28 aload_0
     * 29 invokevirtual #20 <com/yck2/Son.info : ()V>
     * 32 new #21 <com/yck2/Some>
     * 35 dup
     * 36 invokespecial #22 <com/yck2/Some.<init> : ()V>
     * 39 astore_1
     * 40 aload_1
     * 41 invokeinterface #23 <com/yck2/MethodInterface.methodA : ()V> count 1
     * 46 return
     */
    public void show(){
        // 下面四个是非虚方法，主要调度了初始方法，静态方法，final方法，私有方法，以及父方法 。
        showStatic("atguigu.com");
        super.showStatic("good!");

        showPrivate("private");
        super.showCommon();
        // 下面是虚方法：
        showCommon();
        showFinal();
        info();
        // 下面调度虚拟接口
        MethodInterface mi = new Some();
        mi.methodA();
    }

    public static void main(String[] args) {
        Son s = new Son();
        s.show();
    }

}

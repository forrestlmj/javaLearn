package com.yck.test.memoryleakcases;

//-Xmx8m -Xms8m -XX:SurvivorRatio=1 -XX:NewRatio=1 -XX:-UseAdaptiveSizePolicy -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=E://JVM//MAT//com.yck.test.memoryleakcases._2_SingletonOOM.hprof

/**
 * 饿汉模式，生命周期和JVM一样长，里面引用的对象太大，没法释放
 */
@Deprecated
public class _2_SingletonOOM {
    public static void main(String[] args) {
        System.out.println(SingletonOOMInstance.getInstance().hashCode());
        System.out.println(SingletonOOMInstance.getInstance().hashCode());
        Data data = new Data(1);
        Data data2 = new Data(1);
        Data data3 = new Data(1);
    }
}


@Deprecated
class SingletonOOMInstance{
    private SingletonOOMInstance() {

    }

    private static Data d = new Data(2);
    public static Data getInstance(){
        return d;
    }
}
class Data{
    private static final int MB = 1024 * 1024;

    public Data(int size) {
        this.size = size;
        this.data = new byte[this.size * MB];
        System.out.println("申请数据：" + this.size + "MB");
    }

    private int size;

    private byte[] data;


}

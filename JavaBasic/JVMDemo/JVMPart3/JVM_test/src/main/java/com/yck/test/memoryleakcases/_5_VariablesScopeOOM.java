package com.yck.test.memoryleakcases;

import java.util.ArrayList;
import java.util.List;
//-Xmx8m -Xms8m -XX:SurvivorRatio=1 -XX:NewRatio=1 -XX:-UseAdaptiveSizePolicy -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=E://JVM//MAT//com.yck.test.memoryleakcases._5_VariablesScopeOOM.hprof
/**
 * 实例中的实例变量无法被回收。导致内存泄露
 */
@Deprecated
public class _5_VariablesScopeOOM {
    public static void main(String[] args) throws InterruptedException {
        List<VariablesScopeOOMInstance> l =  new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            l.add(new VariablesScopeOOMInstance());
        }
        l.forEach(o->{
            o.add(1);
            o.add(1);
            o.saveData();
        });

    }

}
@Deprecated
class VariablesScopeOOMInstance{
    private static final int MB = 1024 * 1024;
    private List<byte[]> list = new ArrayList<>();
    public void add(Integer size){
        list.add(new byte[size * MB]);
        System.out.println(this.hashCode()+"添加数据："+size+"MB");
    }

    /**
     *
     */
    public void saveData(){
        System.out.println("Saveed");
    }
}

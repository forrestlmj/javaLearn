package com.yck;
/**
 * 演示栈中的异常:StackOverflowError
 * @create 2020 下午 9:08
 *
 *  默认情况下：count : 11420
 *  https://docs.oracle.com/javase/8/docs/technotes/tools/windows/java.html
 *  这种就是stackoverflow，也就是递归次数太多，单个线程的栈帧问题。
 *  设置栈的大小： -Xss256k : count : 2465
 */
public class StackErrorTest {
    public static void main(String[] args) {
        StackErrorTest st = new StackErrorTest();
        Integer add = st.add(5000);
        System.out.println(add);
    }
    public Integer add(Integer i){
//        add(i-1);
//        String[] a = new String[100000];
        if(i.equals(0)){
            return i;
        }
        return i + add(i -1);
    }
}

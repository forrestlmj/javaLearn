package com.yck2;

@FunctionalInterface
interface MyLambda{
    boolean isTrue(String s);
}
public class LambdaTest {
    /**
     * @param args
     *  0 iconst_1
     *  1 istore_1
     *  2 invokedynamic #2 <isTrue, BootstrapMethods #0>
     *  7 astore_2
     *  8 aload_2
     *  9 ldc #3 <absc>
     * 11 invokeinterface #4 <com/yck2/MyLambda.isTrue : (Ljava/lang/String;)Z> count 2
     * 16 pop
     * 17 aload_2
     * 18 ldc #5 <d>
     * 20 invokeinterface #4 <com/yck2/MyLambda.isTrue : (Ljava/lang/String;)Z> count 2
     * 25 pop
     * 26 return
     */
    public static void main(String[] args){
        int a = 1;
        // invokedynamic
        MyLambda myLambda = (String s) -> {
            return s.contains("a");
        };
        myLambda.isTrue("absc");
        myLambda.isTrue("d");



    }
}

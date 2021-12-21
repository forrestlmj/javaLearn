package com.yck2;

public class OperandStackTest {
    public static void main(String[] args) {
        testGetSum();
    }

    /**
     *
     *
     *  0 aload_0
     *  1 invokevirtual #3 <java/lang/Integer.intValue : ()I>
     *  4 aload_1
     *  5 invokevirtual #3 <java/lang/Integer.intValue : ()I>
     *  8 iadd
     *  9 invokestatic #4 <java/lang/Integer.valueOf : (I)Ljava/lang/Integer;>
     * 12 astore_2
     * 13 aload_2 //取c的值
     * 14 areturn //返回给上一步
     *
     *
     * @param a
     * @param b
     * @return
     */
    public static Integer getSum(Integer a, Integer b){
        Integer c = a + b;
        return c;
    }

    /**
     * getSum()的指令集：
     0 iconst_1
     1 invokestatic #4 <java/lang/Integer.valueOf : (I)Ljava/lang/Integer;>
     4 bipush 33
     6 invokestatic #4 <java/lang/Integer.valueOf : (I)Ljava/lang/Integer;>
     9 invokestatic #5 <com/yck2/OperandStackTest.getSum : (Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;>
     12 astore_0 //将上个步骤的结果存入到sum中
     13 return
     */
    public static void testGetSum(){
        Integer sum = getSum(1, 33);
    }
}

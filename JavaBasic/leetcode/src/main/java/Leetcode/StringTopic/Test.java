package Leetcode.StringTopic;

public interface Test {
    default void t() {
        /**
         * java 8中接口可以定义默认方法
         */
        System.out.println("this is default");
    }
    public static final int A=0;
    static void StaticMethod(){
        System.out.println("static");
    }
}

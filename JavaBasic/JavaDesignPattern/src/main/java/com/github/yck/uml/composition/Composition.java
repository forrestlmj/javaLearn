package com.github.yck.uml.composition;

public class Composition {
    public static void main(String[] args) {

    }
}
class Head{}
class Leg{}

class Person{
    // 这里如果 new Header就表示Composition，如果没有就是Aggregation
    // 就是体现在是否Person类初始化时候，Head或Leg就有
    Head h = new Head();
    Leg l = new Leg();
}

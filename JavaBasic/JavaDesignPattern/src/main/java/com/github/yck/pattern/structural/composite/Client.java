package com.github.yck.pattern.structural.composite;

import java.util.*;

public class Client {
    public static void main(String[] args) {

        University bit = new University("BIT", "985");
        bit.addChild(new College("CS","computer science"));
        bit.addChild(new College("DS","data science"));
        bit.addChild(new College("MATH","math science"));


        bit.getChild("CS").ifPresent(
                o -> {
                    o.addChild(new Department("CS1 Department",""));
                    o.addChild(new Department("CS2 department",""));
                }
        );

        bit.getChild("DS").ifPresent(
                o -> {
                    o.addChild(new Department("DS2 Department",""));
                }
        );

        Stack<OrganizationComponent> s = new Stack<>();
        s.push(bit);
        // 栈来深度优先搜索树结构
        do {
            Optional.ofNullable(
                    s.pop()).ifPresent(
                            o -> {
                                System.out.println(o);
                                if (!(o instanceof Department)) {
                                    List<OrganizationComponent> childList = o.listALlChild();
                                    for (OrganizationComponent child : childList) {
                                        s.push(child);
                                    }
                                }

                            }
            );
        }while (!s.isEmpty());
//        bit.listALlChild().forEach(
//            o -> {
//                System.out.println(o);
//                o.listALlChild().forEach(
//                        System.out::println
//                );
//            }
//        );


    }
}

package com.github.yck.pattern.behavioral.statefulbehaivor.responsibilitychain.approver;

public class Client {
    public static void main(String[] args) {
        DepartmentApprover FirstNode = new DepartmentApprover("杨班长", 10);
        FirstNode.setNextApprover(new DepartmentApprover("王班长", 20))
//                .setNextApprover(new CollegeApprover("王主任", 50))
                .setNextApprover(new SchoolMasterApprover("王校长", 100));


        System.out.println("======---------");
        FirstNode.processRequest(new SchoolRequest("书本费用——5",5));
        System.out.println("======---------");
        FirstNode.processRequest(new SchoolRequest("书本费用-19",19));
        System.out.println("======---------");
        FirstNode.processRequest(new SchoolRequest("学杂费-25",25));
        System.out.println("======---------");
        FirstNode.processRequest(new SchoolRequest("住宿费-65",65));
        System.out.println("======---------");
        FirstNode.processRequest(new SchoolRequest("学费101",101));
    }
}

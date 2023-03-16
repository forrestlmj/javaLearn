package com.github.yck.pattern.behavioral.statefulbehaivor.responsibilitychain.approver;

public class Client {
    public static void main(String[] args) {
        Approver yang = new DepartmentApprover("杨班长", 10);

        DepartmentApprover wang = new DepartmentApprover("王班长", 20);
        CollegeApprover wang2 = new CollegeApprover("王主任", 50);
        SchoolMasterApprover wang3 = new SchoolMasterApprover("王校长", 100);
        yang.setNextApprover(wang);
        wang.setNextApprover(wang2);
        wang2.setNextApprover(wang3);

        System.out.println("======---------");
        yang.processRequest(new SchoolRequest("书本费用——5",5));
        System.out.println("======---------");
        yang.processRequest(new SchoolRequest("书本费用-19",19));
        System.out.println("======---------");
        yang.processRequest(new SchoolRequest("学杂费-25",25));
        System.out.println("======---------");
        yang.processRequest(new SchoolRequest("住宿费-65",65));
        System.out.println("======---------");
        yang.processRequest(new SchoolRequest("学费101",101));
    }
}

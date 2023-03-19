package com.github.yck.pattern.behavioral.statefulbehaivor.responsibilitychain.approver;

import java.util.Optional;
import java.util.function.Supplier;

abstract public class AbstractApprover implements Approver {

    String name;

    public Integer getMaxHandleMoney() {
        return maxHandleMoney;
    }

    Integer maxHandleMoney;

    public AbstractApprover(String name, Integer maxHandleMoney) {
        this.name = name;
        this.maxHandleMoney = maxHandleMoney;
    }

    public String getName() {
        return name;
    }

    Approver nextApprover;

    @Override
    public Approver setNextApprover(Approver approver) {
        nextApprover = approver;
        return approver;
    }

    @Override
    public void processRequest(SchoolRequest schoolRequest) {
        if (schoolRequest.money < getMaxHandleMoney()){
            System.out.println(getName()+"可以完成报销，审批结束。");
        }else {
            System.out.println(
                    "申请金额 "+schoolRequest.getMoney()+
                            "元，超过最大报销金额："+getMaxHandleMoney()+
                            ",无法处理。传递给下一任审批者："+getName());
            submitToNextApprover(schoolRequest);
        }
    }

    @Override
    public void submitToNextApprover(SchoolRequest schoolRequest) {
        Optional.ofNullable(nextApprover).ifPresent(
                o ->  {
                    o.processRequest(schoolRequest);
                }
        );

    }
}

package com.github.yck.pattern.behavioral.statefulbehaivor.responsibilitychain.approver;

public interface Approver {
    void setNextApprover(Approver approver);
    void processRequest(SchoolRequest schoolRequest);
    void submitToNextApprover(SchoolRequest schoolRequest);
    String getName();
}

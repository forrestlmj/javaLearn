package com.forrestlmj.businessportraits.dao;

import lombok.Data;

import javax.persistence.*;

@Table
@Entity
@Data
public class BaseInvestment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String companyUnique;
    private String investmentUnique;
    private String investmentName;
    private String investmentPeople;
    private String registeredCapital;
    private String fundedRatio;
    private String establishmentDate;
    private String status;
    private String createdTime;

}

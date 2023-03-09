package com.forrestlmj.businessportraits.dao;

import lombok.Data;

import javax.persistence.*;

@Table
@Entity
@Data
public class BaseBusinessInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String companyUnique;
    private String searchWord;
    private String companyName;
    private String creditCode;
    private String taxpayerNumber;
    private String registrationNumber;
    private String organizationCode;
    private String legalRepresentativeUnique;
    private String legalRepresentative;
    private String registeredCapital;
    private String operatingStatus;
    private String establishmentDate;
    private String companyType;
    private String insuredPerson;
    private String personSize;
    private String operatingPeriod;
    private String registrationAuthority;
    private String paidCapital;
    private String approvedDate;
    private String englishName;
    private String District;
    private String Industry;
    private String usedName;
    private String companyAddress;
    private String businessScope;
    private String officalUrl;
    private String productUrl;
    private String createdtime;
}

package com.forrestlmj.businessportraits.dao;

import lombok.Data;

import javax.persistence.*;

@Table
@Entity
@Data
public class BaseMainStaff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String companyUnique;
    private String nameUnique;
    private String name;
    private String duty;
    private String createdTime;
}

package com.forrestlmj.businessportraits.dao;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.context.annotation.Configuration;

import javax.persistence.*;

@Entity
@Table
@ApiModel("Hello消息")
public class HelloMessage {
    @ApiModelProperty(value = "Hello消息的id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column
    @ApiModelProperty(value = "Hello信息")
    private String message;

    public HelloMessage() {
    }

    public HelloMessage(Integer id, String message, String people) {
        this.id = id;
        this.message = message;
        this.people = people;
    }

    @Override
    public String toString() {
        return "HelloMessage{" +
                "id='" + id + '\'' +
                ", message='" + message + '\'' +
                ", people='" + people + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPeople() {
        return people;
    }

    public void setPeople(String people) {
        this.people = people;
    }
    @ApiModelProperty(value = "hello的人")
    @Column
    private String people;
}

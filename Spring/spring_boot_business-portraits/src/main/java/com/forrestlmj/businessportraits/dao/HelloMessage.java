package com.forrestlmj.businessportraits.dao;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel("Hello消息")
public class HelloMessage {
    @ApiModelProperty(value = "Hello消息的id")
    private String id;
    @ApiModelProperty(value = "Hello信息")
    private String message;

    public HelloMessage(String id, String message, String people) {
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
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
    private String people;
}

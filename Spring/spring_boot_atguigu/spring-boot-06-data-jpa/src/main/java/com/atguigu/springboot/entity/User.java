package com.atguigu.springboot.entity;

import com.sun.xml.internal.ws.developer.UsesJAXBContext;

import javax.persistence.*;

@Entity
@Table(name = "tbl_user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "last_name", length = 100)
    private String LastName;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", LastName='" + LastName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) {
        LastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column()
    private String email;

}

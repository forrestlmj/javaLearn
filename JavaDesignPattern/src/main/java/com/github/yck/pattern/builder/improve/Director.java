package com.github.yck.pattern.builder.improve;

import javax.security.auth.login.CredentialException;

public class Director {
    private AbstractHouse h;

    public Director(AbstractHouse h) {
        this.h = h;
    }

    public void setH(AbstractHouse h) {
        this.h = h;
    }

    public House construct(){
        return h.getResult();
    }
}

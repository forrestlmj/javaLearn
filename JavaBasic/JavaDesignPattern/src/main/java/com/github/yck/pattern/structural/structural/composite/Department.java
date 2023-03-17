package com.github.yck.pattern.structural.structural.composite;

import java.util.List;
import java.util.Optional;

public class Department extends OrganizationComponent {
    public Department(String name, String des) {
        super(name, des);
    }


    @Override
    public void addChild(OrganizationComponent o){
        throw new UnsupportedOperationException("Can't add Child to this organization.");
    }

    @Override
    public Optional<OrganizationComponent> getChild(String name){
        throw new UnsupportedOperationException("Can't get Child from this organization.");
    }

    @Override
    public List<OrganizationComponent> listALlChild() {
        throw new UnsupportedOperationException("Can't list Child from this organization.");
    }

}

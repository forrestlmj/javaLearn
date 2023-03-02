package com.github.yck.pattern.structural.composite;

import java.util.*;

public class University extends OrganizationComponent {
    List<OrganizationComponent> child = new ArrayList<>();

    public University(String name, String des) {
        super(name, des);
    }

    @Override
    public void addChild(OrganizationComponent o) {
        child.add(o);
    }

    @Override
    public void removeChild(OrganizationComponent o) {
        child.remove(o);
    }

    @Override
    public Optional<OrganizationComponent> getChild(String name) {
        OrganizationComponent o = null;
        for (OrganizationComponent organizationComponent : child) {
            if (organizationComponent.getName().equals(name)){
                o = organizationComponent;
            }
        }
        return Optional.ofNullable(o);
    }

    @Override
    public List<OrganizationComponent> listALlChild() {
        return child;
    }
}

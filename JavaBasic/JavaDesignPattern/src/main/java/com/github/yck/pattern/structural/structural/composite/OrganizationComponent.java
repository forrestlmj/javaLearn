package com.github.yck.pattern.structural.structural.composite;

import java.util.List;
import java.util.Optional;

abstract public class OrganizationComponent {
    public String name;
    private String des;


    public OrganizationComponent(String name, String des) {
        this.name = name;
        this.des = des;
    }



    abstract public void addChild(OrganizationComponent o);


    abstract public Optional<OrganizationComponent> getChild(String name);
    abstract public List<OrganizationComponent> listALlChild();

    @Override
    public String toString() {
        return "OrganizationComponent{" +
                "name='" + name + '\'' +
                ", des='" + des + '\'' +
                ", hashCode is '" + +this.hashCode() + '\'' +
                ", CLASS is '" + this.getClass().getSimpleName() + '\'' +
                '}';
    }
}

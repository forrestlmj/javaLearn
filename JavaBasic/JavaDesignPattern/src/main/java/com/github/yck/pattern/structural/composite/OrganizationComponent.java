package com.github.yck.pattern.structural.composite;

import com.sun.org.apache.xpath.internal.operations.Or;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

abstract public class OrganizationComponent {
    private String name;
    private String des;


    public OrganizationComponent(String name, String des) {
        this.name = name;
        this.des = des;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    abstract public void addChild(OrganizationComponent o);

    abstract public void removeChild(OrganizationComponent o);

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

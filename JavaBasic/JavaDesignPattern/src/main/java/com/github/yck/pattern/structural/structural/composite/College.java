package com.github.yck.pattern.structural.structural.composite;

import java.util.*;

public class College extends OrganizationComponent {
    Map<String, OrganizationComponent> child = new HashMap<>();

    public College(String name, String des) {
        super(name, des);
    }

    @Override
    public void addChild(OrganizationComponent o) {
        child.put(o.name,o);
    }

    @Override
    public Optional<OrganizationComponent> getChild(String name) {

        return Optional.ofNullable(child.get(name));
    }

    @Override
    public List<OrganizationComponent> listALlChild() {
        List<OrganizationComponent> re = new ArrayList<>();
        re.addAll(child.values());
        return re;
    }
}

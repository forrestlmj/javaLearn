package com.github.yck.pattern.behavioral.iterator;

import java.util.Iterator;

public interface College {
    Iterator<Department> createIterator();
}

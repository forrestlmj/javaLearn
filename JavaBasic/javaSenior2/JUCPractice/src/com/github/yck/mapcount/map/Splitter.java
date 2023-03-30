package com.github.yck.mapcount.map;

import java.util.List;

public interface Splitter {
    void splitToFile(List<String> content);
    void split(String content);
//    void writeToMemory(String s);
    void checkpoint();
    Splitter setTempWorkSpace(String path);

}

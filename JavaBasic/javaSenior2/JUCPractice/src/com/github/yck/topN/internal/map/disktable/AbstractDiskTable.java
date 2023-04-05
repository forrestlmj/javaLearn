package com.github.yck.topN.internal.map.disktable;

import com.github.yck.topN.internal.map.memorytable.TableID;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

abstract public class AbstractDiskTable implements DiskTable {
    Map<TableID, File> FilePool;
    private String tmpWorkSpace;
    private static final String FILETYPE = ".txt";

    public AbstractDiskTable(String empWorkSpace) {
        FilePool  = new HashMap<>();
        initTempWorkSpace(empWorkSpace);
    }
    String getFileName(TableID tableID){
        return tmpWorkSpace+tableID.getUuid()+FILETYPE;
    }
    @Override
    public void initTempWorkSpace(String path) {
        try {
            FileUtils.deleteDirectory(new File(path));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        this.tmpWorkSpace = path;
    }
    @Override
    public void write(TableID tableId, List<String> content) {

    }

    @Override
    public void write(TableID tableID, byte[] content,int offset){};

}

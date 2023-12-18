package com.github.yck.topN.internal.map.disktable;

import com.github.yck.topN.internal.map.memorytable.TableID;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;
@Deprecated
public class StringListDiskTable extends AbstractDiskTable {

    public StringListDiskTable(String empWorkSpace) {
        super(empWorkSpace);
    }

    /**
     * TODO 瓶颈在于 StringBuilder 与 FileUtils.write 方法。
     * @param tableId
     * @param content
     */
    @Override
    public void write(TableID tableId, List<String> content) {
        File file = FilePool.getOrDefault(tableId, new File(getFileName(tableId)));
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < content.size(); i++) {
            sb.append(content.get(i));
        }
        try {
            FileUtils.write(file,sb.toString(), Charset.defaultCharset(),true);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }finally {
            sb = null;
        }
    }
}

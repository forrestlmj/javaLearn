package Leetcode.HashTableTopic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FindDuplicateFileInSystem {

    public List<List<String>> findDuplicate(final String[] paths) {
        final Map<String, List> map = new HashMap<>();
        for (final String path : paths) {
            final String[] c = path.split(" ");
            if (c.length > 1) {
                final String pwd = c[0];
                for (int i = 1; i < c.length; i++) {
                    final String file = c[i];
                    final String content = file.substring(file.indexOf("(") + 1, file.indexOf(")"));
                    final String filename = pwd + "/" + file.substring(0, file.indexOf("("));
                    if (!map.containsKey(content)) {
                        final List<String> line = new ArrayList<String>();
                        line.add(filename);
                        map.put(content, line);
                    } else {
                        final List<String> line = map.get(content);
                        line.add(filename);
                    }
                }
            } else {
                // 根目录或无文件
            }
        }
        final List<List<String>> re = new ArrayList<List<String>>();
        for (final List<String> line : map.values()) {
            if(line.size()>1){
                re.add(line);
            }
        }
        return re;
    }
}

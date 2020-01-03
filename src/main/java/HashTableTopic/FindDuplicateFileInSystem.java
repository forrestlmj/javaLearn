package HashTableTopic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FindDuplicateFileInSystem {

    public List<List<String>> findDuplicate(String[] paths) {
        Map<String,List> map = new HashMap<String, List>();
        for(String path:paths){
            String[] c = path.split(" ");
            if(c.length>1){
                String pwd = c[0];
                for(int i = 1;i<c.length;i++){
                    String file = c[i];
                    String content = file.substring(file.indexOf("(")+1,file.indexOf(")"));
                    String filename = pwd+"/"+file.substring(0,file.indexOf("("));
                    if(!map.containsKey(content)){
                        List<String> line = new ArrayList<String>();
                        line.add(filename);
                        map.put(content,line);
                    }else {
                        List<String> line = map.get(content);
                        line.add(filename);
                    }
                }
            }else {
                //根目录或无文件
            }
        }
        List<List<String>> re = new ArrayList<List<String>>();
        for(List<String> line:map.values()){
            if(line.size()>1){
                re.add(line);
            }
        }
        return re;
    }
}

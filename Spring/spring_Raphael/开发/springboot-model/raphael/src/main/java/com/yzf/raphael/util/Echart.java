package com.yzf.raphael.util;


import com.yzf.raphael.domain.Company;
import com.yzf.raphael.domain.Up;
import com.yzf.raphael.model.EData;
import com.yzf.raphael.model.ELink;
import com.yzf.raphael.model.EchartDataFormat;

import java.util.*;

public class Echart {
    private static final String TYPE = "force";
    private static final List<Map<String,Object>> categories(){
        ArrayList<Map<String,Object>> categories = new ArrayList<Map<String,Object>>();
        Map<String,Object> category = new HashMap<>();
        category.put("name","个人");
        category.put("base","个人");
        categories.add(category);
        Map<String,Object> category2 = new HashMap<>();
        category2.put("name","公司");
        category2.put("base","公司");
        categories.add(category2);
        Map<String,Object> category3 = new HashMap<>();

        category3.put("name","境外公司");
        category3.put("base","境外公司");
        categories.add(category3);

        return categories;
    }
    private static Map<String, Object> map(String key1, Object value1, String key2, Object value2,String key3, Object value3) {
        Map<String, Object> result = new HashMap<String, Object>(3);
        result.put(key1, value1);
        result.put(key2, value2);
        result.put(key3, value3);
        return result;
    }
    private static Map<String, Object> map(String key1, Object value1, String key2, Object value2,
                                           String key3, Object value3,String key4,Object value4) {
        Map<String, Object> result = new HashMap<String, Object>(3);
        result.put(key1, value1);
        result.put(key2, value2);
        result.put(key3, value3);
        result.put(key4, value4);

        return result;
    }
    private static Map<String, Object> map(String key1, Object value1) {
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put(key1, value1);
        return result;
    }
    public static int isContain(List<Map<String, Object>> nodes,Map<String, Object> in){
        for (Map<String,Object> i:nodes){
            if (in.get("qymc").toString().equals(i.get("qymc").toString())){
                return nodes.indexOf(i);
            }
        }
        return -1;
    }
    public static EchartDataFormat toEchartFormat(Collection<Company> companies){
        EchartDataFormat echartDataFormat = new EchartDataFormat();
//        Map<String, Object> node = new HashMap<>();
//        Map<String, Object> links = new HashMap<>();
        if(companies != null && !companies.isEmpty()){
            for(Company company:companies){
                echartDataFormat.getData()
                        .add(new EData(
                                company.getId().toString(),
                                company.getQyid(),
                                company.getQymc(),
                                ""
                                )
                        );

                if(company.getUps() != null && !company.getUps().isEmpty()){
                    for(Up up:company.getUps()){
                        Map<String,String> property = new HashMap<>();
                        property.put("up_amt",up.getUp_amt().toString());
                        property.put("up_fp_cnt",up.getUp_fp_cnt().toString());
                        echartDataFormat.getLinks()
                                .add(new ELink(
                                        up.getId().toString(),
                                        up.getCompanyS().getQymc(),
                                        up.getCompanyE().getQymc(),
                                        property
                                ));
                    }
                }
            }
        }

        return echartDataFormat;
    }
}

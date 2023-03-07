package com.yzf.raphael.util;

import com.yzf.raphael.dao.ReceiptAnalysisDetailDao;
import com.yzf.raphael.model.ReceiptAnalysisDetail;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * The type Padding list.
 *
 * @author ：xxx
 * @description：工具类，用于填充数据库没有返回的记录。
 * 业务逻辑：
 * 1、先将数据库返回的dbList记录转为dbMap。
 * 2、然后根据k_kjnd_start,k_kjnd_end，new 一个 12×(k_kjnd_end-k_kjnd_start+1)的数组rList，作为结果返回。
 * 3、遍历rList。如果当前月份在dbMap中，则将dbMap中的数据放入rList，如果不在，则new 一个默认的ReceiptAnalysisDetail放入rList中。
 *
 * 使用dbMap的目的是空间换时间，降低时间复杂度到O(N)
 * @date ：11/12/20 10:01 AM
 */
public class PaddingList {

    public static List<ReceiptAnalysisDetailDao> padding(BigInteger qyid, int k_kjnd_start,
                                                      int k_kjnd_end, String type, Map<String,ReceiptAnalysisDetail> dbmap){
        List<ReceiptAnalysisDetailDao> daos = new ArrayList<>();
        for(int year = k_kjnd_start;year<=k_kjnd_end;year++){
            List<ReceiptAnalysisDetail> tmpList = new ArrayList<>();

            for(int month = 1;month<=12;month++){
                if(dbmap.containsKey(String.format("%d-%d",year,month))){
                    tmpList.add( dbmap.get(String.format("%d-%d",year,month)));
                }else {
                    tmpList.add(new ReceiptAnalysisDetail(
                            year,month,qyid,"",1,0
                    ));
                }
            }
            ReceiptAnalysisDetailDao dao = new ReceiptAnalysisDetailDao(
                    String.valueOf(year),
                    tmpList
            );
            daos.add(dao);
        }
        return daos;
    }

    public static Map<String,ReceiptAnalysisDetail> mapToList(List<ReceiptAnalysisDetail> receiptAnalysisDetailList){
        Map<String, ReceiptAnalysisDetail> map = new HashMap<>();
        for(ReceiptAnalysisDetail r:receiptAnalysisDetailList){
            map.put(String.format("%d-%d", r.getK_kjnd(), r.getK_kjqj()),
                    r);
        }
        return map;
    }
}

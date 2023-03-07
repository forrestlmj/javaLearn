package com.yzf.raphael.domain;

import lombok.Data;
import org.neo4j.ogm.annotation.*;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/21/20 5:14 PM
 */
@Data
@RelationshipEntity(type = "Up")
public class Up {
    @Id
    @GeneratedValue
    private Long id;
    private Double up_amt;
    private Double up_fp_cnt;

    @Override
    public String toString() {
        return "Start"+companyS.toString()+
                "End"+companyE.toString()+
                "发票数量:" + up_fp_cnt +
                "发票金额:" + up_amt;
    }

    @StartNode
    private Company companyS;
    @EndNode
    private Company companyE;

}

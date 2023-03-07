package com.yzf.raphael.services.impl;

import com.yzf.raphael.mapper.ImpalaMapping.DwsCompanyFinTaxInfoMMapper;
import com.yzf.raphael.mapper.ImpalaMapping.DwsReportBalanceMMapper;
import com.yzf.raphael.mapper.ImpalaMapping.DwsReportCashFlowMMapper;
import com.yzf.raphael.mapper.ImpalaMapping.DwsReportProfitMMapper;
import com.yzf.raphael.model.DwsReportBalanceM;
import com.yzf.raphael.model.DwsReportCashFlowM;
import com.yzf.raphael.model.DwsReportProfitM;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.net.ssl.SSLEngineResult;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/28/20 12:05 PM
 */


enum ReportBalance{
    closing ,//1期末余额
    begin_year//2年初余额
}
enum ReportCashFlow{
    current,//1本期金额
    last,//2上期金额
    month,//3本月金额
}
enum ReportProfit{
    current,//1本期金额
    last,//2上期金额
    month,//3本月金额
}

@Component
public class DetailFinancialInfoService {
    @Resource
    private DwsReportBalanceMMapper dwsReportBalanceMMapper;
    // TODO ?List->Map?
    public Map<String,DwsReportBalanceM> getReportBalanceByqyid(BigInteger qyid, int k_kjnd, int k_kjqj){
        Map<String,DwsReportBalanceM> d = new HashMap<String,DwsReportBalanceM>(){
            {
                put(ReportBalance.closing.toString(),null);
                put(ReportBalance.begin_year.toString(),null);
            }
        };

        for(DwsReportBalanceM balanceM:dwsReportBalanceMMapper.selectByQyidKjndKjqj(qyid, k_kjnd, k_kjqj)){
            int idx = balanceM.getIndex_type();
            switch (idx){
                case 1:
                    d.put(ReportBalance.closing.toString(),balanceM);
                    System.out.println(idx);
                    break;
                case 2:
                    d.put(ReportBalance.begin_year.toString(),balanceM);
                    System.out.println(idx);
                    break;
            }
        }

        return d;
    }
    @Resource
    private DwsReportCashFlowMMapper dwsReportCashFlowMMapper;

    public Map<String,DwsReportCashFlowM> getDwsReportCashFlowMByqyid(BigInteger qyid, int k_kjnd, int k_kjqj){
        Map<String,DwsReportCashFlowM> d = new HashMap<String,DwsReportCashFlowM>(){
                {
                        put(ReportCashFlow.current.toString(),null);
                        put(ReportCashFlow.last.toString(),null);
                        put(ReportCashFlow.month.toString(),null);
                }
        };

        for(DwsReportCashFlowM cashFlowM:dwsReportCashFlowMMapper.selectByQyidKjndKjqj(qyid, k_kjnd, k_kjqj)){
            switch (cashFlowM.getIndex_type()){
                case 1:
                    d.put(ReportCashFlow.current.toString(),cashFlowM);
                    break;
                case 2:
                    d.put(ReportCashFlow.last.toString(),cashFlowM);
                    break;
                case 3:
                    d.put(ReportCashFlow.month.toString(),cashFlowM);
                    break;

            }
        }

        return d;
    }

    @Resource
    private DwsReportProfitMMapper dwsReportProfitM;

    public Map<String,DwsReportProfitM> getDwsReportProfitMByqyid(BigInteger qyid, int k_kjnd, int k_kjqj){
        // 匿名内部类初始化
        Map<String,DwsReportProfitM> d = new HashMap<String,DwsReportProfitM>(){
            {
                put(ReportProfit.current.toString(),null);
                put(ReportProfit.last.toString(),null);
                put(ReportProfit.month.toString(),null);
            }
        };


        for(DwsReportProfitM reportProfitM:dwsReportProfitM.selectByQyidKjndKjqj(qyid, k_kjnd, k_kjqj)){
            switch (reportProfitM.getIndex_type()){
                case 1:
                    d.put(ReportProfit.current.toString(),reportProfitM);
                    break;
                case 2:
                    d.put(ReportProfit.last.toString(),reportProfitM);
                    break;
                case 3:
                    d.put(ReportProfit.month.toString(),reportProfitM);
                    break;
            }
        }


        return d;
    }
    @Resource
    private DwsCompanyFinTaxInfoMMapper dwsCompanyFinTaxInfoMMapper;


}

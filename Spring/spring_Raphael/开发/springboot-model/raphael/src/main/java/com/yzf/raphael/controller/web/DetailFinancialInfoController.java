package com.yzf.raphael.controller.web;

import com.yzf.raphael.model.DwsCompanyFinTaxInfoM;
import com.yzf.raphael.model.DwsReportBalanceM;
import com.yzf.raphael.model.DwsReportCashFlowM;
import com.yzf.raphael.model.DwsReportProfitM;
import com.yzf.raphael.services.impl.*;
import com.yzf.raphael.util.Result;
import com.yzf.raphael.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/25/20 3:04 PM
 */

@RestController
@RequestMapping("/detail/financial_info")
@Api(tags = {"详情页-财务分析Tab页"})
public class DetailFinancialInfoController {
    @Resource
    private DetailFinancialInfoService detailFinancialInfoService;
    @Resource
    private DetailTaxInfoService detailTaxInfoService;
    @ApiOperation(value = "资产负债表分析",
            notes = "根据企业id、会计年度、会计期间，获得资产负债表数据。closing:期末余额,begin_year:年初余额。Map的Key一定存在。")
    @GetMapping("/balance")
    @ResponseBody
    public Result<Map<String,DwsReportBalanceM>> balance(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                  @RequestParam @ApiParam(value = "会计年度", defaultValue="2020") int k_kjnd,
                                                  @RequestParam @ApiParam(value = "会计期间，当前月份减1", defaultValue="8") int k_kjqj){
        Map<String,DwsReportBalanceM> dwsReportBalanceMList = detailFinancialInfoService.getReportBalanceByqyid(new BigInteger(qyid), k_kjnd, k_kjqj);
        return ResultGenerator.genSuccessResult(dwsReportBalanceMList);
    }

    @ApiOperation(value = "现金流量表",
            notes = "根据企业id、会计年度、会计期间，获得现金流量表数据"+
            "按照index_type字段，区分本期金额、上期金额、本月金额。current:本期金额,last:上期金额,month:本月金额。Map的Key一定存在。")
    @GetMapping("/cashflow")
    @ResponseBody
    public Result< Map<String,DwsReportCashFlowM>> cashflow(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                   @RequestParam @ApiParam(value = "会计年度", defaultValue="2020") int k_kjnd,
                                                   @RequestParam @ApiParam(value = "会计期间，当前月份减1", defaultValue="8") int k_kjqj){
        Map<String,DwsReportCashFlowM> dwsReportBalanceMList = detailFinancialInfoService.getDwsReportCashFlowMByqyid(new BigInteger(qyid), k_kjnd, k_kjqj);
        return ResultGenerator.genSuccessResult(dwsReportBalanceMList);
    }

    @ApiOperation(value = "利润表分析",
            notes = "根据企业id、会计年度、会计期间，获得利润表数据," +
                    "按照index_type字段，区分本期金额、上期金额、本月金额。current:本期金额,last:上期金额,month:本月金额。Map的Key一定存在。")
    @GetMapping("/profit")
    @ResponseBody
    public Result<Map<String,DwsReportProfitM>> profit(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                 @RequestParam @ApiParam(value = "会计年度", defaultValue="2020") int k_kjnd,
                                                 @RequestParam @ApiParam(value = "会计期间，当前月份减1", defaultValue="8") int k_kjqj){
        Map<String,DwsReportProfitM> dwsReportProfitMList = detailFinancialInfoService.getDwsReportProfitMByqyid(new BigInteger(qyid), k_kjnd, k_kjqj);
        return ResultGenerator.genSuccessResult(dwsReportProfitMList);
    }

    @ApiOperation(value = "凭证情况分析",
            notes = "根据企业id、会计年度、会计期间，获得凭证情况分析数据")
    @GetMapping("/accounting_document")
    @ResponseBody
    public Result<List<DwsCompanyFinTaxInfoM>> accounting_document(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                                   @RequestParam @ApiParam(value = "会计年度start", defaultValue="2020") int k_kjnd_start,
                                                                   @RequestParam @ApiParam(value = "会计期间start", defaultValue="1") int k_kjqj_start,
                                                                   @RequestParam @ApiParam(value = "会计年度end", defaultValue="2020") int k_kjnd_end,
                                                                   @RequestParam @ApiParam(value = "会计期间end", defaultValue="7") int k_kjqj_end)
    {
        List<DwsCompanyFinTaxInfoM> dwsReportProfitMList = detailTaxInfoService.getFinInfoM(new BigInteger(qyid),  k_kjnd_start, k_kjqj_start, k_kjnd_end, k_kjqj_end);
        return ResultGenerator.genSuccessResult(dwsReportProfitMList);
    }
}

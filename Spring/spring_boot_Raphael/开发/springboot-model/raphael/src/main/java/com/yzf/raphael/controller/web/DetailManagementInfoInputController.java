package com.yzf.raphael.controller.web;

import com.yzf.raphael.comm.FpType;
import com.yzf.raphael.dao.ReceiptAnalysisDetailDao;
import com.yzf.raphael.model.*;
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

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/27/20 1:35 PM
 */

@RestController
@RequestMapping("/detail/management_info/input")
@Api(tags = {"详情页-经营分析Tab页-进项发票相关表"})
public class DetailManagementInfoInputController {

    @Resource
    private DetailManagementInfoInputService detailManagementInfoInputService;

    @ApiOperation(value = "企业销项发票分析-年度销项发票情况汇总",
            notes = "根据企业id、统计周期、会计年度、会计期间，获得红冲、作废、专票、普票的金额、税额以及占比")
    @GetMapping("/year/summary")
    @ResponseBody
    public Result<List<DwsQyhxJxfpAnalysisM>> input_year_summary(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                                  @RequestParam @ApiParam(value = "统计周期（1，月。3,年。）", defaultValue="1") int flag,
                                                                  @RequestParam @ApiParam(value = "会计年度", defaultValue="2020") int k_kjnd,
                                                                  @RequestParam @ApiParam(value = "会计期间", defaultValue="7") int k_kjqj

    ) {
        List<DwsQyhxJxfpAnalysisM> dwsQyhxXxfpAnalysisMList = detailManagementInfoInputService.getDwsQyhxJxfpAnalysisM(new BigInteger(qyid), flag, k_kjnd, k_kjqj);
        return ResultGenerator.genSuccessResult(dwsQyhxXxfpAnalysisMList);
    }
    @ApiOperation(value = "企业进项发票分析-月度销项发票分析",
            notes = "根据企业id、会计年度区间获得销项发票情况")
    @GetMapping("/month/sum_amt")
    @ResponseBody
    public Result<List<ReceiptAnalysisDetailDao>> input_month_sum_amt(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                                    @RequestParam @ApiParam(value = "会计年度-起始", defaultValue="2018") int k_kjnd_start,
                                                                    @RequestParam @ApiParam(value = "会计年度-终止", defaultValue="2020") int k_kjnd_end
    ) {
        List<ReceiptAnalysisDetailDao> daos = detailManagementInfoInputService.getReceiptAnalysisDetail(new BigInteger(qyid),k_kjnd_start,k_kjnd_end, FpType.sum_amt.toString());
        return ResultGenerator.genSuccessResult(daos);
    }
    @ApiOperation(value = "企业进项发票分析-月度红冲发票分析",
            notes = "根据企业id、会计年度区间获得销项发票情况")
    @GetMapping("/month/red_amt")
    @ResponseBody
    public Result<List<ReceiptAnalysisDetailDao>> input_month_red_amt(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                                    @RequestParam @ApiParam(value = "会计年度-起始", defaultValue="2018") int k_kjnd_start,
                                                                    @RequestParam @ApiParam(value = "会计年度-终止", defaultValue="2020") int k_kjnd_end
    ) {
        List<ReceiptAnalysisDetailDao> daos = detailManagementInfoInputService.getReceiptAnalysisDetail(new BigInteger(qyid),k_kjnd_start,k_kjnd_end,FpType.red_amt.toString());
        return ResultGenerator.genSuccessResult(daos);
    }
    @ApiOperation(value = "企业进项发票分析-月度作废发票分析",
            notes = "根据企业id、会计年度区间获得销项发票情况")
    @GetMapping("/month/void_amt")
    @ResponseBody
    public Result<List<ReceiptAnalysisDetailDao>> input_month_void_amt(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                                     @RequestParam @ApiParam(value = "会计年度-起始", defaultValue="2018") int k_kjnd_start,
                                                                     @RequestParam @ApiParam(value = "会计年度-终止", defaultValue="2020") int k_kjnd_end
    ) {
        List<ReceiptAnalysisDetailDao> daos = detailManagementInfoInputService.getReceiptAnalysisDetail(new BigInteger(qyid),k_kjnd_start,k_kjnd_end,FpType.void_amt.toString());
        return ResultGenerator.genSuccessResult(daos);
    }

    @ApiOperation(value = "企业销项发票分析-累计开票金额 TOP10 企业汇总",
            notes = "根据企业id、会计年度、会计期间累计开票金额 TOP10 企业汇总")
    @GetMapping("/month/summary/top10")
    @ResponseBody
    public Result<List<DwsQyhxUpQyFpDetailM>> month_summary_top10(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                                  @RequestParam @ApiParam(value = "会计年度", defaultValue="2020") int k_kjnd,
                                                                  @RequestParam @ApiParam(value = "会计期间", defaultValue="7") int k_kjqj
    ) {
        List<DwsQyhxUpQyFpDetailM> dwsQyhxDownQyFpDetailMList = detailManagementInfoInputService.getDwsQyhxUpQyFpDetailMTop10(new BigInteger(qyid),k_kjnd,k_kjqj);
        return ResultGenerator.genSuccessResult(dwsQyhxDownQyFpDetailMList);
    }
    @ApiOperation(value = "企业销项发票分析-单张收票金额 TOP10 ",
            notes = "根据企业id、会计年度、会计期间单张收票金额 TOP10 ")
    @GetMapping("/month/single/top10")
    @ResponseBody
    public Result<List<DwdFactFpSpzbTyD>> month_single_top10(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                             @RequestParam @ApiParam(value = "会计年度", defaultValue="2020") int k_kjnd,
                                                             @RequestParam @ApiParam(value = "会计期间", defaultValue="7") int k_kjqj
    ) {
        List<DwdFactFpSpzbTyD> dwdFactFpSpzbTyDList = detailManagementInfoInputService.getDwdFactFpSpzbTyDTop10(new BigInteger(qyid),k_kjnd,k_kjqj);
        return ResultGenerator.genSuccessResult(dwdFactFpSpzbTyDList);
    }
}

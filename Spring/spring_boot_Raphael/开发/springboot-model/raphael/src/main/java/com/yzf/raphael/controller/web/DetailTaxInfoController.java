package com.yzf.raphael.controller.web;

import com.yzf.raphael.model.DwsCompanyFinTaxInfoM;
import com.yzf.raphael.services.impl.DetailTaxInfoService;
import com.yzf.raphael.util.Result;
import com.yzf.raphael.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/28/20 10:21 AM
 */

@RestController
@RequestMapping("/detail/tax_info")
@Api(tags = {"详情页-税务分析Tab页"})

public class DetailTaxInfoController {
    @Resource
    private DetailTaxInfoService detailTaxInfoService;
    @ApiOperation(value = "纳税额情况分析",
            notes = "根据企业id、会计年度、会计期间，获得纳税额情况表")
    @GetMapping("/tax_amount")
    @ResponseBody
    public Result<List<DwsCompanyFinTaxInfoM>> tax_amount(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid,
                                                                    @RequestParam @ApiParam(value = "会计年度start", defaultValue="2020") int k_kjnd_start,
                                                                    @RequestParam @ApiParam(value = "会计期间start", defaultValue="1") int k_kjqj_start,
                                                                    @RequestParam @ApiParam(value = "会计年度end", defaultValue="2020") int k_kjnd_end,
                                                                    @RequestParam @ApiParam(value = "会计期间end", defaultValue="7") int k_kjqj_end
                                                          )
    {
        List<DwsCompanyFinTaxInfoM> dwsReportProfitMList = detailTaxInfoService.getTaxInfoM(new BigInteger(qyid),  k_kjnd_start, k_kjqj_start, k_kjnd_end, k_kjqj_end);
        return ResultGenerator.genSuccessResult(dwsReportProfitMList);
    }
}

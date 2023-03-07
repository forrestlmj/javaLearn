package com.yzf.raphael.services.impl;

import com.yzf.raphael.mapper.ImpalaMapping.DwsCompanyFinTaxInfoMMapper;
import com.yzf.raphael.model.DwsCompanyFinTaxInfoM;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/23/20 4:15 PM
 */

@Component
public class DetailTaxInfoService {
    @Resource
    private DwsCompanyFinTaxInfoMMapper dwsCompanyFinTaxInfoMMapper;
    public List<DwsCompanyFinTaxInfoM> getFinInfoM(BigInteger qyid,  int k_kjnd_start, int k_kjqj_start,
                                                   int k_kjnd_end,int k_kjqj_end){
        return dwsCompanyFinTaxInfoMMapper.getFinInfoM(qyid, k_kjnd_start, k_kjqj_start, k_kjnd_end, k_kjqj_end);
    }

    public List<DwsCompanyFinTaxInfoM> getTaxInfoM(BigInteger qyid,  int k_kjnd_start, int k_kjqj_start,
                                                   int k_kjnd_end,int k_kjqj_end){
        return dwsCompanyFinTaxInfoMMapper.getTaxInfoM(qyid,  k_kjnd_start, k_kjqj_start, k_kjnd_end, k_kjqj_end);
    }
}

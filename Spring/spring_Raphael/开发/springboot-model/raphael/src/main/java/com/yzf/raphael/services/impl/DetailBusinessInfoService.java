package com.yzf.raphael.services.impl;

import com.yzf.raphael.mapper.ImpalaMapping.DwdCompanyBasicInfoDMapper;
import com.yzf.raphael.mapper.ImpalaMapping.EmployMapper;
import com.yzf.raphael.mapper.ImpalaMapping.ShareholderMapper;
import com.yzf.raphael.model.DwdCompanyBasicInfoD;
import com.yzf.raphael.model.Employ;
import com.yzf.raphael.model.Shareholder;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/24/20 11:54 AM
 */

@Component
public class DetailBusinessInfoService {
    @Resource
    private DwdCompanyBasicInfoDMapper ompanyBasicInfoDMapper;
    @Resource
    private EmployMapper employMapper;
    @Resource
    private ShareholderMapper shareholderMapper;

    public DwdCompanyBasicInfoD getReportBalanceByqyid(BigInteger qyid){
        return ompanyBasicInfoDMapper.selectByQyid(qyid);
    }
    public List<Employ> getEmployByQyid(BigInteger qyid){
        return employMapper.getEmployByQyid(qyid);
    }
    public List<Shareholder> getShareholderByQyid(BigInteger qyid){
        return shareholderMapper.getShareholderByQyid(qyid);
    }
}

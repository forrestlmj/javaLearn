package com.yzf.raphael.services.impl;

import com.yzf.raphael.dao.AreaNode;
import com.yzf.raphael.mapper.ImpalaMapping.DwdCompanyBasicInfoDMapper;
import com.yzf.raphael.mapper.ImpalaMapping.DwdDimCommonXzqhMMapper;
import com.yzf.raphael.mapper.ImpalaMapping.IndustryMapper;
import com.yzf.raphael.model.CompanyBriefInfo;
import com.yzf.raphael.model.DwsFintechOftenIndexM;
import com.yzf.raphael.model.Industry;
import com.yzf.raphael.util.AreaNodeFormat;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.List;
import java.util.regex.Pattern;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/24/20 7:06 PM
 */

@Component
public class SearchService {
    @Resource
    private DwdCompanyBasicInfoDMapper ompanyBasicInfoDMapper;
    @Resource
    private IndustryMapper industryMapper;
    @Resource
    private DwdDimCommonXzqhMMapper dwdDimCommonXzqhMMapper;
    public List<CompanyBriefInfo> getCompanyBriefInfoBySearchWord(String searchWord){
        if(Pattern.compile("^-?\\d+(\\.\\d+)?$").matcher(searchWord).matches()){
            return ompanyBasicInfoDMapper.getCompanyBriefInfoByQyid(new BigInteger(searchWord));
        }else {
            return ompanyBasicInfoDMapper.getCompanyBriefInfoByQymc(searchWord);
        }
    }

    public List<CompanyBriefInfo> getCompanyBriefByMultiCondition(DwsFintechOftenIndexM dwsFintechOftenIndexM){
        return ompanyBasicInfoDMapper.getCompanyBriefByMultiCondition(dwsFintechOftenIndexM);
    }

    public List<Industry> getIndustry(){
        return industryMapper.getIndustry();
    }

    public List<AreaNode> getAreaNode(){
        return AreaNodeFormat.format(dwdDimCommonXzqhMMapper.getDwdDimCommonXzqhM());
    }
}

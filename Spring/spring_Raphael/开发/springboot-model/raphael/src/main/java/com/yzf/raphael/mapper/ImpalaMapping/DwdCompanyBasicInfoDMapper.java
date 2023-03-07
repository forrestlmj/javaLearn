package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.*;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

@Repository
public interface DwdCompanyBasicInfoDMapper {
    DwdCompanyBasicInfoD selectByQyid(BigInteger qyid);
    List<CompanyBriefInfo> getCompanyBriefInfoByQymc(String qymc);
    List<CompanyBriefInfo> getCompanyBriefInfoByQyid(BigInteger qyid);
    List<CompanyBriefInfo> getCompanyBriefByMultiCondition(DwsFintechOftenIndexM dwsFintechOftenIndexM);

}

package com.yzf.raphael.services.impl;

import com.yzf.raphael.domain.Company;
import com.yzf.raphael.model.EchartDataFormat;
import com.yzf.raphael.repositories.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

import static com.yzf.raphael.util.Echart.toEchartFormat;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/20/20 8:09 PM
 */

@Service
public class UpDownService {
    @Autowired
    private CompanyRepository companyRepository;
//    @Transactional
    public EchartDataFormat getUpAndDown(String qymc){
        Collection<Company> c = companyRepository.getUpAndDown(qymc);
        return toEchartFormat(c);
    }
    public EchartDataFormat getUp(String qymc){
        Collection<Company> c = companyRepository.getUp(qymc);
        return toEchartFormat(c);
    }
    public EchartDataFormat getDown(String qymc){
        Collection<Company> c = companyRepository.getDown(qymc);
        return toEchartFormat(c);
    }
}

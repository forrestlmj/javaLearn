package com.yzf.raphael.services.impl;

import com.yzf.raphael.dao.ReceiptAnalysisDetailDao;
import com.yzf.raphael.mapper.ImpalaMapping.DwdFactFpSpzbTyDMapper;
import com.yzf.raphael.mapper.ImpalaMapping.DwsQyhxJxfpAnalysisMMapper;
import com.yzf.raphael.mapper.ImpalaMapping.DwsQyhxUpQyFpDetailMMapper;
import com.yzf.raphael.model.DwdFactFpSpzbTyD;
import com.yzf.raphael.model.DwsQyhxJxfpAnalysisM;
import com.yzf.raphael.model.DwsQyhxUpQyFpDetailM;
import com.yzf.raphael.model.ReceiptAnalysisDetail;
import com.yzf.raphael.util.PaddingList;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/28/20 1:40 PM
 */

@Component
public class DetailManagementInfoInputService {
    @Resource
    private DwsQyhxJxfpAnalysisMMapper dwsQyhxJxfpAnalysisMMapper;
    @Resource
    private DwsQyhxUpQyFpDetailMMapper dwsQyhxUpQyFpDetailMMapper;
    @Resource
    private DwdFactFpSpzbTyDMapper dwdFactFpSpzbTyDMapper;

    public List<DwsQyhxJxfpAnalysisM> getDwsQyhxJxfpAnalysisM(BigInteger qyid, int flag, int k_kjnd, int k_kjqj){
        return dwsQyhxJxfpAnalysisMMapper.getDwsQyhxJxfpAnalysisM(qyid, flag, k_kjnd, k_kjqj);
    }

    public List<ReceiptAnalysisDetailDao> getReceiptAnalysisDetail(BigInteger qyid, int k_kjnd_start, int k_kjnd_end, String type){
        Map<String, ReceiptAnalysisDetail> dbMap = PaddingList.mapToList(dwsQyhxJxfpAnalysisMMapper.getReceiptAnalysisDetail(qyid, k_kjnd_start, k_kjnd_end, type));
        return PaddingList.padding(qyid, k_kjnd_start, k_kjnd_end, type, dbMap);
    }

    public List<DwsQyhxUpQyFpDetailM> getDwsQyhxUpQyFpDetailMTop10(BigInteger qyid, int k_kjnd, int k_kjqj){
        return dwsQyhxUpQyFpDetailMMapper.getDwsQyhxUpQyFpDetailMTop10(qyid, k_kjnd, k_kjqj);
    }

    public List<DwdFactFpSpzbTyD> getDwdFactFpSpzbTyDTop10(BigInteger qyid, int k_kjnd, int k_kjqj){
        return dwdFactFpSpzbTyDMapper.getDwdFactFpSpzbTyDTop10(qyid, k_kjnd, k_kjqj);
    }


}

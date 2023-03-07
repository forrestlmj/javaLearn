package com.yzf.raphael.services.impl;

import com.yzf.raphael.dao.ReceiptAnalysisDetailDao;
import com.yzf.raphael.mapper.ImpalaMapping.DwdFactFpKpzbTyDMapper;
import com.yzf.raphael.mapper.ImpalaMapping.DwsQyhxDownQyFpDetailMMapper;
import com.yzf.raphael.mapper.ImpalaMapping.DwsQyhxXxfpAnalysisMMapper;
import com.yzf.raphael.model.DwdFactFpKpzbTyD;
import com.yzf.raphael.model.DwsQyhxDownQyFpDetailM;
import com.yzf.raphael.model.DwsQyhxXxfpAnalysisM;
import com.yzf.raphael.model.ReceiptAnalysisDetail;
import com.yzf.raphael.util.PaddingList;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/28/20 1:40 PM
 */

@Component
public class DetailManagementInfoOutputService {
    @Resource
    private DwsQyhxXxfpAnalysisMMapper dwsQyhxXxfpAnalysisMMapper;
    @Resource
    private DwsQyhxDownQyFpDetailMMapper dwsQyhxDownQyFpDetailMMapper;
    @Resource
    private DwdFactFpKpzbTyDMapper dwdFactFpKpzbTyDMapper;

    public List<DwsQyhxXxfpAnalysisM> getDwsQyhxXxfpAnalysisM(BigInteger qyid, int flag, int k_kjnd, int k_kjqj){
        return dwsQyhxXxfpAnalysisMMapper.getDwsQyhxXxfpAnalysisM(qyid, flag, k_kjnd, k_kjqj);
    }


    public List<ReceiptAnalysisDetailDao> getReceiptAnalysisDetailDao(BigInteger qyid, int k_kjnd_start, int k_kjnd_end, String type){
        Map<String, ReceiptAnalysisDetail> dbMap = PaddingList.mapToList(dwsQyhxXxfpAnalysisMMapper.getReceiptAnalysisDetail(qyid, k_kjnd_start, k_kjnd_end, type));

        return PaddingList.padding(qyid, k_kjnd_start, k_kjnd_end, type, dbMap);
    }
    public List<DwsQyhxDownQyFpDetailM> getDwsQyhxDownQyFpDetailMTop10(BigInteger qyid, int k_kjnd, int k_kjqj){
        return dwsQyhxDownQyFpDetailMMapper.getDwsQyhxDownQyFpDetailMTop10(qyid, k_kjnd, k_kjqj);
    }

    public List<DwdFactFpKpzbTyD> getDwdFactFpKpzbTyDTop10(BigInteger qyid, int k_kjnd, int k_kjqj){
        return dwdFactFpKpzbTyDMapper.getDwdFactFpKpzbTyDTop10(qyid, k_kjnd, k_kjqj);
    }
}

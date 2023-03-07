package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.DwsQyhxXxfpAnalysisM;
import com.yzf.raphael.model.ReceiptAnalysisDetail;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

@Repository
public interface DwsQyhxXxfpAnalysisMMapper {
    List<DwsQyhxXxfpAnalysisM> getDwsQyhxXxfpAnalysisM(BigInteger qyid, int flag, int k_kjnd, int k_kjqj);
    List<ReceiptAnalysisDetail> getReceiptAnalysisDetail(BigInteger qyid, int k_kjnd_start, int k_kjnd_end, String type);
}

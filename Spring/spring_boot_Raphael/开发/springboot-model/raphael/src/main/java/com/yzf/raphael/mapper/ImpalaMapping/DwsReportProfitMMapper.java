package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.DwsReportCashFlowM;
import com.yzf.raphael.model.DwsReportProfitM;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

@Repository
public interface DwsReportProfitMMapper {
    List<DwsReportProfitM> selectByQyidKjndKjqj(BigInteger qyid, int k_kjnd, int k_kjqj);
}

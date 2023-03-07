package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.DwsReportBalanceM;
import com.yzf.raphael.model.DwsReportCashFlowM;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;
@Repository
public interface DwsReportCashFlowMMapper {
    List<DwsReportCashFlowM> selectByQyidKjndKjqj(BigInteger qyid, int k_kjnd, int k_kjqj);
}

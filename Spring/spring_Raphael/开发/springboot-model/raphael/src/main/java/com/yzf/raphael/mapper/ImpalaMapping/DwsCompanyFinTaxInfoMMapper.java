package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.DwsCompanyFinTaxInfoM;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

@Repository
public interface DwsCompanyFinTaxInfoMMapper {
    List<DwsCompanyFinTaxInfoM> getFinInfoM(BigInteger qyid, int k_kjnd_start, int k_kjqj_start,
                                            int k_kjnd_end,int k_kjqj_end);
    List<DwsCompanyFinTaxInfoM> getTaxInfoM(BigInteger qyid, int k_kjnd_start, int k_kjqj_start,
                                            int k_kjnd_end,int k_kjqj_end);
}

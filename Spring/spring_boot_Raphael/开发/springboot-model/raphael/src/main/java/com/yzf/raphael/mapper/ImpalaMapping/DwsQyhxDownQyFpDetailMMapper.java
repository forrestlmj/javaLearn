package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.DwsCompanyFinTaxInfoM;
import com.yzf.raphael.model.DwsQyhxDownQyFpDetailM;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

@Repository
public interface DwsQyhxDownQyFpDetailMMapper {
    List<DwsQyhxDownQyFpDetailM> getDwsQyhxDownQyFpDetailMTop10(BigInteger qyid, int k_kjnd, int k_kjqj);
}

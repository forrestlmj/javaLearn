package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.DwsQyhxDownQyFpDetailM;
import com.yzf.raphael.model.DwsQyhxUpQyFpDetailM;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

@Repository
public interface DwsQyhxUpQyFpDetailMMapper {
    List<DwsQyhxUpQyFpDetailM> getDwsQyhxUpQyFpDetailMTop10(BigInteger qyid, int k_kjnd, int k_kjqj);
}

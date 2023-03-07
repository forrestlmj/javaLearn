package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.Shareholder;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.List;

@Repository
public interface ShareholderMapper {
    List<Shareholder> getShareholderByQyid(BigInteger qyid);

}

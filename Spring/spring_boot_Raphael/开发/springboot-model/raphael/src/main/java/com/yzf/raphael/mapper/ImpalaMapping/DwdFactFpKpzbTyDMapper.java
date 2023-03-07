package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.DwdFactFpKpzbTyD;
import com.yzf.raphael.model.DwsQyhxDownQyFpDetailM;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

/**
 * @author ：xxx
 * @description：TODO 上线前注意这个查的是Hive表，不是kudu的！
 * @date ：9/27/20 8:11 PM
 */

@Repository
public interface DwdFactFpKpzbTyDMapper {
    List<DwdFactFpKpzbTyD> getDwdFactFpKpzbTyDTop10(BigInteger qyid, int k_kjnd, int k_kjqj);

}

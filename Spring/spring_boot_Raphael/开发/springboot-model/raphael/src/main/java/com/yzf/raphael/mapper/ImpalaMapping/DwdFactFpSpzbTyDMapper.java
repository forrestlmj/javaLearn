package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.DwdFactFpKpzbTyD;
import com.yzf.raphael.model.DwdFactFpSpzbTyD;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/27/20 8:11 PM
 */

@Repository
public interface DwdFactFpSpzbTyDMapper {

    List<DwdFactFpSpzbTyD> getDwdFactFpSpzbTyDTop10(BigInteger qyid, int k_kjnd, int k_kjqj);

}

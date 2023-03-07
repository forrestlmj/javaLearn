package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.Employ;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

@Repository
public interface EmployMapper {
    List<Employ> getEmployByQyid(BigInteger qyid);

}

package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.DwsFintechOftenIndexM;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DwsFintechOftenIndexMMapper {
    List<DwsFintechOftenIndexM> getDwsFintechOftenIndexM();
}

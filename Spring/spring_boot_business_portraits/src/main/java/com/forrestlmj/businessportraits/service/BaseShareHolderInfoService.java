package com.forrestlmj.businessportraits.service;

import com.forrestlmj.businessportraits.dao.BaseShareholderInfo;

public interface BaseShareHolderInfoService {
    BaseShareholderInfo getById(Integer id);
    BaseShareholderInfo save(BaseShareholderInfo baseShareholderInfo);
    void delete(Integer id);
}

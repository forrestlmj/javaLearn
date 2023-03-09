package com.forrestlmj.businessportraits.service.impl;

import com.forrestlmj.businessportraits.dao.BaseShareholderInfo;
import com.forrestlmj.businessportraits.repository.BaseShareHolderInfoRepository;
import com.forrestlmj.businessportraits.service.BaseShareHolderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class BaseShareHolderInfoServiceImpl implements BaseShareHolderInfoService {
    @Autowired
    private BaseShareHolderInfoRepository baseShareHolderInfoRepository;


    @Override
    public BaseShareholderInfo getById(Integer id) {
        return baseShareHolderInfoRepository.findById(id).orElse(null);

    }

    @Override
    public BaseShareholderInfo save(BaseShareholderInfo baseShareholderInfo) {
        return baseShareHolderInfoRepository.save(baseShareholderInfo);
    }

    @Override
    public void delete(Integer id) {
        baseShareHolderInfoRepository.deleteById(id);
    }
}

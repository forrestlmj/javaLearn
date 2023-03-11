package com.yzf.di.service.impl;

import com.yzf.di.entity.po.FdsLogicViewInitJob;
import com.yzf.di.dao.repository.LogicViewInitJobRepository;
import com.yzf.di.service.LogicViewInitJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class LogicViewInitJobServiceImpl implements LogicViewInitJobService {
    @Autowired
    private LogicViewInitJobRepository logicViewInitJobRepository;
    @Override
    public Page<FdsLogicViewInitJob> getLogicViewInitJob(String initType, String initName, Pageable pageable) {
        return logicViewInitJobRepository.getLogicViewInitJob(initType,initName,pageable);

    }

    @Override
    public FdsLogicViewInitJob save(FdsLogicViewInitJob fdsLogicViewInitJob) {
        FdsLogicViewInitJob save = logicViewInitJobRepository.save(fdsLogicViewInitJob);
        return save;
    }
}

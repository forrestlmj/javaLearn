package com.yzf.di.service;

import com.yzf.di.entity.FdsLogicViewInitJob;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * https://thorben-janssen.com/native-queries-with-spring-data-jpa/
 */
public interface LogicViewInitJobService {
    Page<FdsLogicViewInitJob> getLogicViewInitJob(String initType, String initName, Pageable pageable);
    FdsLogicViewInitJob save(FdsLogicViewInitJob fdsLogicViewInitJob);
}

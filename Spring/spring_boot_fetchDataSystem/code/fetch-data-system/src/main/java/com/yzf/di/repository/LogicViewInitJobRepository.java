package com.yzf.di.repository;

import com.yzf.di.entity.FdsLogicViewInitJob;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface LogicViewInitJobRepository extends PagingAndSortingRepository<FdsLogicViewInitJob,Integer> {

    @Query( nativeQuery = true,
            value = "select * from fds_logic_view_init_job t where t.init_type = ?1 and t.init_name = ?2",
            countQuery = "select count(id) from fds_logic_view_init_job t where t.init_type = ?1 and t.init_name = ?2"
    )
    Page<FdsLogicViewInitJob> getLogicViewInitJob( String initType, String initName, Pageable pageable);
}

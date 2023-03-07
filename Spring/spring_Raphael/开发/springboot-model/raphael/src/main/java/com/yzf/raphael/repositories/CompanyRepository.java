package com.yzf.raphael.repositories;

import com.yzf.raphael.domain.Company;
import org.springframework.context.annotation.Bean;
import org.springframework.data.neo4j.annotation.Query;
import org.springframework.data.neo4j.repository.Neo4jRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;
//@Repository
public interface CompanyRepository extends Neo4jRepository<Company,Long> {
    @Query("MATCH (n:Company) where n.qymc = {qymc} RETURN n")
    Collection<Company> graphC(@Param("qymc") String qymc);
    // 上下2层
    @Query("MATCH p=(s)-[u:Up*0..2]-(n:Company) WHERE n.qymc = {qymc} RETURN p limit 300")
    Collection<Company> getUpAndDown(@Param("qymc") String qymc);
    // 上5层
    @Query("MATCH (s)-[u:Up*0..5]->(n:Company) WHERE n.qymc = {qymc} RETURN s,u,n limit 300")
    Collection<Company> getUp(@Param("qymc") String qymc);
    // 下5层
    @Query("MATCH (s)<-[u:Up*0..5]-(n:Company) WHERE n.qymc = {qymc} RETURN s,u,n limit 300")
    Collection<Company> getDown(@Param("qymc") String qymc);
}

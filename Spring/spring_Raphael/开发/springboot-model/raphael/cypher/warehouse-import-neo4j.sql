drop table default.tmp_20201027_01;
create table default.tmp_20201027_01
row format delimited fields terminated by ','
as 
select regexp_replace(regexp_replace(regexp_replace(regexp_replace(qymc,',',''),'"',''),'\n',''),'\r','') as qymc,qyid,'Company' as lable
from (
select t1.qymc,cast(t.qyid as string) as qyid from (
select qyid from dws.dws_qyhx_up_qy_fp_detail_m
union all
select qyid from dws.dws_qyhx_down_qy_fp_detail_m
) t
inner join yzf_biz.sys_qy t1
 on t.qyid = t1.qyid
 union all
 select k_xfdwmc as qymc,'' as qyid from dws.dws_qyhx_up_qy_fp_detail_m
 where k_xfdwmc is not null and trim(k_xfdwmc) !=''
  union all
 select k_gfdwmc as qymc,'' as qyid from dws.dws_qyhx_down_qy_fp_detail_m
  where k_gfdwmc is not null and trim(k_gfdwmc) !=''
 )  t group by qymc,t.qyid
 ;
 
 drop table default.tmp_20201027_02;
 create table default.tmp_20201027_02
row format delimited fields terminated by ','
as 
select regexp_replace(regexp_replace(regexp_replace(regexp_replace(up_qymc,',',''),'"',''),'\n',''),'\r','') as up_qymc  
      ,regexp_replace(regexp_replace(regexp_replace(regexp_replace(qymc,',',''),'"',''),'\n',''),'\r','') as  qymc,up_amt,up_fp_cnt,'Up'  as lable
  from (
   select k_xfdwmc as up_qymc,t1.qymc, up_amt ,up_fp_cnt  from dws.dws_qyhx_up_qy_fp_detail_m t
   inner join  yzf_biz.sys_qy t1
 on t.qyid = t1.qyid
 where t.k_xfdwmc is not null and trim(t.k_xfdwmc)!=''
   union all
   select  t1.qymc as up_qymc ,t.k_gfdwmc as qymc ,t.down_amt as up_amt,t.down_fp_cnt as up_fp_cnt    from dws.dws_qyhx_down_qy_fp_detail_m t
   inner join  yzf_biz.sys_qy t1
 on t.qyid = t1.qyid
 where t.k_gfdwmc is not null and trim(t.k_gfdwmc)!=''
  ) a
 group by up_qymc,qymc,up_amt,up_fp_cnt,'Up'
 ;
 
 
 
bin/neo4j-import --into ./data/databases/graph.db  \
--nodes="import/company-header.csv,import/company1.csv,import/company2.csv,import/company3.csv" \
--relationships="import/up-header.csv,import/up1.csv,import/up2.csv,import/up3.csv" \
--id-type STRING \
--bad-tolerance=10000000

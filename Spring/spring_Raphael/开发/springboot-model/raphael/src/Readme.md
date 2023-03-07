https://blog.csdn.net/weixin_42265981/article/details/103095841
一定要注意数据来源
假数据来源：
https://tieba.baidu.com/p/6597937895
swagger接口
http://localhost:8080/swagger-ui/#/

sql
-- 企业销项发票分析 单张开票金额 TOP10 记录
select * from test.dwd_fact_fp_kpzb_ty_d 
where qyid = 146621757387558 and k_kjnd = 2020 and k_kjqj = 7
order by k_jehj desc
limit 10

714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624

insert into test.dws_qyhx_jxfp_analysis_m	select * from 	dws.dws_qyhx_jxfp_analysis_m	where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);
insert into test.dws_report_balance_m	select * from 	dws.dws_report_balance_m	where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);
insert into test.dws_report_cash_flow_m	select * from 	dws.dws_report_cash_flow_m	where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);
insert into test.dws_report_profit_m	select * from 	dws.dws_report_profit_m	where where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);
insert into test.dws_qyhx_xxfp_analysis_m	select * from 	dws.dws_qyhx_xxfp_analysis_m	where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);
insert into test.dws_company_fin_tax_info_m	select * from 	dws.dws_company_fin_tax_info_m	where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);
insert into test.dws_qyhx_up_qy_fp_detail_m	select * from 	dws.dws_qyhx_up_qy_fp_detail_m	where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);
insert into test.dws_qyhx_down_qy_fp_detail_m	select * from 	dws.dws_qyhx_down_qy_fp_detail_m	where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);
insert into test.dwd_company_basic_info_d	select * from 	dwd.dwd_company_basic_info_d	where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);
insert into test.dwd_fact_fp_spzb_ty_d	select * from 	dwd.dwd_fact_fp_spzb_ty_d	where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);
insert into test.dwd_fact_fp_kpzb_ty_d	select * from 	dwd.dwd_fact_fp_kpzb_ty_d	where qyid in (714800836946362368,623169809421156352,146621757418451,146621757430454,575707443556995072,545601000376061952,576816296566939648,631074760616624128,146621757418451,616576368834842624);


test.dws_qyhx_jxfp_analysis_m

inner join test.dws_report_balance_m a on .qyid = a.qyid
inner join test.dws_report_cash_flow_m a on .qyid = a.qyid
inner join test.dws_report_profit_m a on .qyid = a.qyid
inner join test.dws_qyhx_xxfp_analysis_m a on .qyid = a.qyid
inner join test.dws_company_fin_tax_info_m a on .qyid = a.qyid
inner join test.dws_qyhx_up_qy_fp_detail_m a on .qyid = a.qyid
inner join test.dws_qyhx_down_qy_fp_detail_m a on .qyid = a.qyid
inner join test.dwd_company_basic_info_d a on .qyid = a.qyid



INSERT INTO test.dws_fintech_often_index_m (set_cd, k_kjnd, k_kjqj, qyid, qymc, gsid, gsmc, area_code, area_name, recent_oneyear_operating_income, recent_oneyear_net_profit, recent_oneyear_alm_rate, recent_oneyear_all_tax_amt, recent_oneyear_vat_amt, recent_oneyear_valid_invoice_amt, recent_oneyear_down_qy_cnt, recent_sixmonth_invoice_compare, recent_oneyear_valid_invoice_month_cnt, recent_oneyear_red_rate, recent_oneyear_valid_invoice_cnt, recent_oneyear_void_invoice_rate, qy_zcrq, industry, qy_dqbm) VALUES ('set12', null, null, 714800836946362368, '苏州金吉龙贸易有限公司', 628, '扬州金财财务有限公司', '32', '江苏省', 300, 150, 0.45, 120, 90, 75, 21, 0.9, 6, 0.45, 22.5, 0.3, '2019-11-20', null, '320571');
INSERT INTO test.dws_fintech_often_index_m (set_cd, k_kjnd, k_kjqj, qyid, qymc, gsid, gsmc, area_code, area_name, recent_oneyear_operating_income, recent_oneyear_net_profit, recent_oneyear_alm_rate, recent_oneyear_all_tax_amt, recent_oneyear_vat_amt, recent_oneyear_valid_invoice_amt, recent_oneyear_down_qy_cnt, recent_sixmonth_invoice_compare, recent_oneyear_valid_invoice_month_cnt, recent_oneyear_red_rate, recent_oneyear_valid_invoice_cnt, recent_oneyear_void_invoice_rate, qy_zcrq, industry, qy_dqbm) VALUES ('set1', null, null, 146621757388056, '成都博纳视界文化传媒有限公司', 232, '成都心意财务咨询有限公司', '51', '四川省', 300, 150, 0.45, 120, 90, 75, 21, 0.9, 6, 0.45, 22.5, 0.3, null, null, '510107');
INSERT INTO test.dws_fintech_often_index_m (set_cd, k_kjnd, k_kjqj, qyid, qymc, gsid, gsmc, area_code, area_name, recent_oneyear_operating_income, recent_oneyear_net_profit, recent_oneyear_alm_rate, recent_oneyear_all_tax_amt, recent_oneyear_vat_amt, recent_oneyear_valid_invoice_amt, recent_oneyear_down_qy_cnt, recent_sixmonth_invoice_compare, recent_oneyear_valid_invoice_month_cnt, recent_oneyear_red_rate, recent_oneyear_valid_invoice_cnt, recent_oneyear_void_invoice_rate, qy_zcrq, industry, qy_dqbm) VALUES ('set5', null, null, 575707443556995072, '河南桑锐科技有限公司', 574611263368544256, '开封市华文会计事务有限公司', '41', '河南省', 200, 100, 0.3, 80, 60, 50, 14, 0.6, 4, 0.3, 15, 0.2, '2018-12-26', '科技推广和应用服务业', '410204');
INSERT INTO test.dws_fintech_often_index_m (set_cd, k_kjnd, k_kjqj, qyid, qymc, gsid, gsmc, area_code, area_name, recent_oneyear_operating_income, recent_oneyear_net_profit, recent_oneyear_alm_rate, recent_oneyear_all_tax_amt, recent_oneyear_vat_amt, recent_oneyear_valid_invoice_amt, recent_oneyear_down_qy_cnt, recent_sixmonth_invoice_compare, recent_oneyear_valid_invoice_month_cnt, recent_oneyear_red_rate, recent_oneyear_valid_invoice_cnt, recent_oneyear_void_invoice_rate, qy_zcrq, industry, qy_dqbm) VALUES ('set10', null, null, 616576368834842624, '山东亿源金属制品有限公司', 615499436818509824, '李恒琴', '37', '山东省', 280, 140, 0.42, 112, 84, 70, 19.6, 0.84, 5.6, 0.42, 21, 0.28, null, null, '370901');
INSERT INTO test.dws_fintech_often_index_m (set_cd, k_kjnd, k_kjqj, qyid, qymc, gsid, gsmc, area_code, area_name, recent_oneyear_operating_income, recent_oneyear_net_profit, recent_oneyear_alm_rate, recent_oneyear_all_tax_amt, recent_oneyear_vat_amt, recent_oneyear_valid_invoice_amt, recent_oneyear_down_qy_cnt, recent_sixmonth_invoice_compare, recent_oneyear_valid_invoice_month_cnt, recent_oneyear_red_rate, recent_oneyear_valid_invoice_cnt, recent_oneyear_void_invoice_rate, qy_zcrq, industry, qy_dqbm) VALUES ('set10', null, null, 545601000376061952, '滨州市爱海电器有限公司', 544845129811574784, '滨州市博兴县飞皇金税通会计职业培训学校', '37', '山东省', 300, 150, 0.45, 120, 90, 75, 21, 0.9, 6, 0.45, 22.5, 0.3, '2006-05-26', '批发业', '371625');
INSERT INTO test.dws_fintech_often_index_m (set_cd, k_kjnd, k_kjqj, qyid, qymc, gsid, gsmc, area_code, area_name, recent_oneyear_operating_income, recent_oneyear_net_profit, recent_oneyear_alm_rate, recent_oneyear_all_tax_amt, recent_oneyear_vat_amt, recent_oneyear_valid_invoice_amt, recent_oneyear_down_qy_cnt, recent_sixmonth_invoice_compare, recent_oneyear_valid_invoice_month_cnt, recent_oneyear_red_rate, recent_oneyear_valid_invoice_cnt, recent_oneyear_void_invoice_rate, qy_zcrq, industry, qy_dqbm) VALUES ('set12', null, null, 631074760616624128, '徐州卓旭环保科技有限公司', 549632172601196545, '徐州卓衡财税服务有限公司', '32', '江苏省', 280, 140, 0.42, 112, 84, 70, 19.6, 0.84, 5.6, 0.42, 21, 0.28, '2019-09-20', null, '320305');
INSERT INTO test.dws_fintech_often_index_m (set_cd, k_kjnd, k_kjqj, qyid, qymc, gsid, gsmc, area_code, area_name, recent_oneyear_operating_income, recent_oneyear_net_profit, recent_oneyear_alm_rate, recent_oneyear_all_tax_amt, recent_oneyear_vat_amt, recent_oneyear_valid_invoice_amt, recent_oneyear_down_qy_cnt, recent_sixmonth_invoice_compare, recent_oneyear_valid_invoice_month_cnt, recent_oneyear_red_rate, recent_oneyear_valid_invoice_cnt, recent_oneyear_void_invoice_rate, qy_zcrq, industry, qy_dqbm) VALUES ('set12', null, null, 714800799734497280, '苏州科伟达电子材料有限公司', 628, '扬州金财财务有限公司', '32', '江苏省', 200, 100, 0.3, 80, 60, 50, 14, 0.6, 4, 0.3, 15, 0.2, '2019-08-22', null, '320571');
INSERT INTO test.dws_fintech_often_index_m (set_cd, k_kjnd, k_kjqj, qyid, qymc, gsid, gsmc, area_code, area_name, recent_oneyear_operating_income, recent_oneyear_net_profit, recent_oneyear_alm_rate, recent_oneyear_all_tax_amt, recent_oneyear_vat_amt, recent_oneyear_valid_invoice_amt, recent_oneyear_down_qy_cnt, recent_sixmonth_invoice_compare, recent_oneyear_valid_invoice_month_cnt, recent_oneyear_red_rate, recent_oneyear_valid_invoice_cnt, recent_oneyear_void_invoice_rate, qy_zcrq, industry, qy_dqbm) VALUES ('set12', null, null, 146621757430454, '常州市景渐佳防水工程有限公司', 398, '常州市中亿财务代理有限公司', '32', '江苏省', 510, 255, 0.765, 204, 153, 127.5, 35.7, 1.53, 10.2, 0.765, 38.25, 0.28, '2015-03-16', '建筑装饰、装修和其他建筑业', '320401');
INSERT INTO test.dws_fintech_often_index_m (set_cd, k_kjnd, k_kjqj, qyid, qymc, gsid, gsmc, area_code, area_name, recent_oneyear_operating_income, recent_oneyear_net_profit, recent_oneyear_alm_rate, recent_oneyear_all_tax_amt, recent_oneyear_vat_amt, recent_oneyear_valid_invoice_amt, recent_oneyear_down_qy_cnt, recent_sixmonth_invoice_compare, recent_oneyear_valid_invoice_month_cnt, recent_oneyear_red_rate, recent_oneyear_valid_invoice_cnt, recent_oneyear_void_invoice_rate, qy_zcrq, industry, qy_dqbm) VALUES ('set5', null, null, 576816296566939648, '郑州昌仁机械设备租赁有限公司', 624, '河南简创企业管理咨询有限公司', '41', '河南省', 280, 140, 0.42, 112, 84, 70, 19.6, 0.84, 5.6, 0.42, 21, 0.28, '2019-04-26', '租赁业', '410101');

----------- 以下为图数据库的测试脚本 -----------
https://zhuanlan.zhihu.com/p/88745411

上游
CREATE (n:Company {qyid:'',qymc:'上海圆迈贸易有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'安徽仁智信纸塑材料有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'安徽安庆长江公路大桥有限责任公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'安徽皖通高速公路股份有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'安徽省交通控股集团有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'昆山京东尚信贸易有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'杭州京东惠景贸易有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'江苏宁常镇溧高速公路有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'江苏宁杭高速公路有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'江苏宁沪高速公路股份有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'江苏广靖锡澄高速公路有限责任公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'江苏沿江高速公路有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'江苏溧马高速公路有限责任公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'江苏皇冠新材料科技有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'湖北富和冠电子材料有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'烟台众瀚新材料科技有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'苏州工业园区自助发票代开八'}) return n;
CREATE (n:Company {qyid:'',qymc:'苏州市华测检测技术有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'苏州市高速公路管理有限公司常昆分公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'苏州晶鸿泰电子有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'苏州曼德维拉电子材料有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'苏州绕城高速公路有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'苏州通捷祥电子材料有限公司'}) return n;

下游
CREATE (n:Company {qyid:'',qymc:'昆山优诺迪电子材料有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'昆山昊奕嘉电子材料有限公司'}) return n;
CREATE (n:Company {qyid:'',qymc:'苏州钛旺电子有限公司'}) return n;


CREATE (n:Company {qyid:'714800799734497280',qymc:'苏州科伟达电子材料有限公司'}) return n;


MATCH (a:Company {qymc:'上海圆迈贸易有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up{amt:46.02,cnt:1}]->(b);
MATCH (a:Company {qymc:'安徽仁智信纸塑材料有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:23708.85,cnt:1}]->(b);
MATCH (a:Company {qymc:'安徽安庆长江公路大桥有限责任公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:18.45,cnt:1}]->(b);
MATCH (a:Company {qymc:'安徽皖通高速公路股份有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:12.28,cnt:1}]->(b);
MATCH (a:Company {qymc:'安徽省交通控股集团有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:202.04,cnt:2}]->(b);
MATCH (a:Company {qymc:'昆山京东尚信贸易有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:4.87,cnt:1}]->(b);
MATCH (a:Company {qymc:'杭州京东惠景贸易有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:44.16,cnt:1}]->(b);
MATCH (a:Company {qymc:'江苏宁常镇溧高速公路有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:37.19,cnt:2}]->(b);
MATCH (a:Company {qymc:'江苏宁杭高速公路有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:34.5,cnt:1}]->(b);
MATCH (a:Company {qymc:'江苏宁沪高速公路股份有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:60.8,cnt:2}]->(b);
MATCH (a:Company {qymc:'江苏广靖锡澄高速公路有限责任公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:23.72,cnt:1}]->(b);
MATCH (a:Company {qymc:'江苏沿江高速公路有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:7.92,cnt:1}]->(b);
MATCH (a:Company {qymc:'江苏溧马高速公路有限责任公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:34.53,cnt:2}]->(b);
MATCH (a:Company {qymc:'江苏皇冠新材料科技有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:13168.14,cnt:1}]->(b);
MATCH (a:Company {qymc:'湖北富和冠电子材料有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:31637.17,cnt:1}]->(b);
MATCH (a:Company {qymc:'烟台众瀚新材料科技有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:54701.32,cnt:6}]->(b);
MATCH (a:Company {qymc:'苏州工业园区自助发票代开八'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:91589.12,cnt:3}]->(b);
MATCH (a:Company {qymc:'苏州市华测检测技术有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:1226.42,cnt:1}]->(b);
MATCH (a:Company {qymc:'苏州市高速公路管理有限公司常昆分公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:6.35,cnt:1}]->(b);
MATCH (a:Company {qymc:'苏州晶鸿泰电子有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:3094.5,cnt:1}]->(b);
MATCH (a:Company {qymc:'苏州曼德维拉电子材料有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:1828.8,cnt:1}]->(b);
MATCH (a:Company {qymc:'苏州绕城高速公路有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:19.87,cnt:1}]->(b);
MATCH (a:Company {qymc:'苏州通捷祥电子材料有限公司'}), (b:Company {qymc:'苏州科伟达电子材料有限公司'}) MERGE (a)-[:Up {amt:5688.94,cnt:1}]->(b);


MATCH (a:Company {qymc:'苏州科伟达电子材料有限公司'}), (b:Company {qymc:'昆山优诺迪电子材料有限公司'}) MERGE (a)-[:Up {amt:193584.07,cnt:2}]->(b);
MATCH (a:Company {qymc:'苏州科伟达电子材料有限公司'}), (b:Company {qymc:'昆山昊奕嘉电子材料有限公司'}) MERGE (a)-[:Up {amt:247019.46,cnt:3}]->(b);
MATCH (a:Company {qymc:'苏州科伟达电子材料有限公司'}), (b:Company {qymc:'苏州钛旺电子有限公司'}) MERGE (a)-[:Up {amt:47350.44,cnt:1}]->(b);
MATCH p=()-[u1:Up]->()-[u2:Up]->(n:company)-[d:Up]->() RETURN p limit 1

MATCH p=()-[:Up]-()-[:Up]-()-[:Up]-()-[:Up]-()-[:Up]->(v) RETURN p limit 100

select * from dws.dws_qyhx_up_qy_fp_detail_m where k_xfdwmc = '南京利民金嘉链条有限公司'; qyid =715209855333433344
MATCH p=()<--()-[r:Up*]->(v) WHERE v.name = {name} RETURN p limit {limit}
MATCH p=()<--()-[r:Up*]->(v) return p
MATCH p=(s)-[u:Up*0..5]->(n:Company) WHERE n.qymc = '苏州科伟达电子材料有限公司' RETURN p

广度优先 搜索上下两层：
MATCH p=(s)-[u:Up*0..2]-(n:Company) WHERE n.qymc = '苏州通捷祥电子材料有限公司' RETURN p limit 300
MATCH p=(s)-[u:Up*0..2]-(n:Company) WHERE n.qymc = '苏州通捷祥电子材料有限公司' RETURN p limit 300
深度优先搜索
MATCH p=(s)-[u:Up*0..5]->(n:Company) WHERE n.qymc = '苏州科伟达电子材料有限公司' RETURN p



CREATE (n:Company {qyid:'',qymc:'test1'}) return n;
CREATE (n:Company {qyid:'',qymc:'test2'}) return n;
MATCH (a:Company {qymc:'test2'}), (b:Company {qymc:'test1'}) MERGE (a)-[:Up {amt:19.87,cnt:1}]->(b);
MATCH (a:Company {qymc:'test1'}), (b:Company {qymc:'test2'}) MERGE (a)-[:Up {amt:5688.94,cnt:1}]->(b);


-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: 172.20.120.181    Database: fintax_account_1
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `fintax_account_1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fintax_account_1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fintax_account_1`;

--
-- Table structure for table `account_balance_histroy`
--

DROP TABLE IF EXISTS `account_balance_histroy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_balance_histroy` (
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(11) NOT NULL COMMENT '会计年度',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码',
  `JF0` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF0` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF1` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF1` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF2` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF2` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF3` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF3` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF4` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF4` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF5` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF5` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF6` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF6` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF7` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF7` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF8` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF8` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF9` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF9` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF10` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF10` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF11` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF11` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `JF12` decimal(18,2) NOT NULL COMMENT '借方金额-本位币',
  `DF12` decimal(18,2) NOT NULL COMMENT '贷方金额-本位币',
  `QSLJ_JF` decimal(18,2) NOT NULL COMMENT '起始累计借方金额',
  `QSLJ_DF` decimal(18,2) NOT NULL COMMENT '起始累计贷方金额',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATE_USER` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_USER` varchar(32) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_KMYELS_ZTDM` (`ZTDM`,`KJND`,`KMNM`)
) ENGINE=InnoDB AUTO_INCREMENT=901111082080247816 DEFAULT CHARSET=utf8 COMMENT='科目余额历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_history`
--

DROP TABLE IF EXISTS `account_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_history` (
  `id` bigint(20) NOT NULL,
  `ztdm` bigint(20) NOT NULL COMMENT '账套代码',
  `kjnd` int(11) NOT NULL COMMENT '会计年度',
  `kmbm` varchar(96) NOT NULL COMMENT '科目编码',
  `kmnm` varchar(64) NOT NULL COMMENT '科目内码',
  `kmmc` varchar(127) NOT NULL COMMENT '科目名称',
  `kmqc` varchar(255) NOT NULL COMMENT '科目全称',
  `kmfx` int(11) NOT NULL COMMENT '科目方向',
  `sjkmnm` varchar(64) DEFAULT NULL COMMENT '上级科目内码',
  `sfmj` char(1) DEFAULT NULL COMMENT '是否末级',
  `kmzt` char(3) NOT NULL COMMENT '科目状态',
  `kmsm` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `kmlx` char(1) NOT NULL COMMENT '科目类型',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_user` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kmnm` (`ztdm`,`kjnd`,`kmnm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_level_history`
--

DROP TABLE IF EXISTS `account_level_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_level_history` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KMCJ` int(11) DEFAULT NULL COMMENT '科目层级',
  `KMCD` varchar(255) DEFAULT NULL COMMENT '科目长度',
  `SJLY` varchar(64) DEFAULT NULL COMMENT '数据来源',
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `ztdm_index` (`ZTDM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='科目层级历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auto_collect_company_dzgs`
--

DROP TABLE IF EXISTS `auto_collect_company_dzgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_collect_company_dzgs` (
  `id` bigint(20) NOT NULL,
  `gs_id` bigint(20) DEFAULT NULL COMMENT '代账公司id',
  `company_id` bigint(20) DEFAULT NULL COMMENT '采集企业id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dzgs` (`gs_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auto_collect_company_version`
--

DROP TABLE IF EXISTS `auto_collect_company_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_collect_company_version` (
  `id` bigint(20) NOT NULL COMMENT '唯一标识',
  `name` varchar(100) DEFAULT NULL COMMENT '厂商名称',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `version` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '类型 1：线上 2：线下',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='厂商版本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auto_collect_customer_info`
--

DROP TABLE IF EXISTS `auto_collect_customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_collect_customer_info` (
  `id` bigint(20) NOT NULL COMMENT '唯一标识\r\n',
  `yh_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `company_id` bigint(20) DEFAULT NULL COMMENT '厂商信息ID',
  `ip` varchar(255) DEFAULT NULL COMMENT '服务器地址',
  `server_name` varchar(255) DEFAULT NULL COMMENT '服务器数据库名称',
  `port` varchar(10) DEFAULT NULL COMMENT '服务器数据库端口',
  PRIMARY KEY (`id`),
  UNIQUE KEY `auto_collect_customer_info_qy_id_uindex` (`yh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线上采集数据客户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auto_collect_data_yh_qy`
--

DROP TABLE IF EXISTS `auto_collect_data_yh_qy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_collect_data_yh_qy` (
  `id` bigint(20) NOT NULL,
  `yh_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `qy_id` bigint(20) DEFAULT NULL COMMENT '企业ID',
  `serial_id` bigint(20) DEFAULT NULL COMMENT '批次号1',
  `type` varchar(1) DEFAULT '1' COMMENT '采集类型  1：科目余额 2：凭证',
  `status` varchar(1) DEFAULT '0' COMMENT '状态 0：采集当中 1：采集完成 2：采集失败 3:下发任务失败（转日期） 4：下发任务失败  5：手工处理失败',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `auto_collect_data_yh_qy_qy_id_index` (`qy_id`),
  KEY `auto_collect_data_yh_qy_serial_id_index` (`serial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集数据用户采集企业信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auto_collect_mq_back`
--

DROP TABLE IF EXISTS `auto_collect_mq_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_collect_mq_back` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `qy_id` bigint(20) DEFAULT NULL COMMENT '企业ID',
  `serial_id` bigint(20) DEFAULT NULL COMMENT '批次ID',
  `message` varchar(2000) DEFAULT NULL COMMENT 'mq信息',
  `status` varchar(1) DEFAULT '1' COMMENT '1:处理成功 2： 处理失败 3:查询不到下发任务信息',
  `cause` varchar(255) DEFAULT NULL COMMENT '原因',
  `url` varchar(255) DEFAULT NULL COMMENT '生成ExcelURL',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_rate`
--

DROP TABLE IF EXISTS `currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_rate` (
  `ID` bigint(20) NOT NULL COMMENT '币种权限id',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套id',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `BZID` int(11) NOT NULL COMMENT '币种id',
  `BQHL` decimal(18,6) DEFAULT NULL COMMENT '本期汇率',
  `HLZD` tinyint(1) DEFAULT NULL COMMENT '汇率周期类型：0-固定汇率，1-浮动汇率',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `ZT` tinyint(1) DEFAULT '1' COMMENT '启用状态：1-启用，2-禁用',
  `BZ` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KJQJ_INDEX` (`ZTDM`,`KJND`,`KJQJ`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='币种权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_rate_user`
--

DROP TABLE IF EXISTS `currency_rate_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_rate_user` (
  `ID` bigint(20) NOT NULL COMMENT 'id',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套id',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `DAY` int(4) DEFAULT NULL COMMENT '日',
  `BZID` int(11) NOT NULL COMMENT '币种id',
  `BQHL` decimal(18,6) DEFAULT NULL COMMENT '本期汇率',
  `HLZQ` tinyint(1) DEFAULT NULL COMMENT '汇率周期类型：0-固定汇率，1-浮动汇率',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KJQJ_INDEX` (`ZTDM`,`KJND`,`KJQJ`),
  KEY `bzid` (`BZID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户调整汇率表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cwcsh_excel`
--

DROP TABLE IF EXISTS `cwcsh_excel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwcsh_excel` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `EXCEL_NAME` varchar(500) DEFAULT NULL COMMENT 'excel 名称',
  `STORAGE_PATH` varchar(500) DEFAULT NULL COMMENT '云存储路径',
  `BUSINESS_TYPE` varchar(255) DEFAULT NULL COMMENT '业务类型',
  `MODEL_TYPE` varchar(50) DEFAULT NULL COMMENT '模版类型',
  `EXCEL_TYPE` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `FILE_NAME` varchar(500) DEFAULT NULL COMMENT '文件名称',
  `EXCEL_TITLE` varchar(50) DEFAULT NULL COMMENT '文件标题',
  `PARSE_RESULT` mediumtext COMMENT '内容',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `SORT` int(100) DEFAULT NULL COMMENT '排序',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `cwcsh_excel_ZTDM_index` (`ZTDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务初始化Excel信息记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cwcsh_fzhslsb`
--

DROP TABLE IF EXISTS `cwcsh_fzhslsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwcsh_fzhslsb` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KMBM` varchar(64) DEFAULT NULL COMMENT '科目编码',
  `KMMC` varchar(255) DEFAULT NULL COMMENT '科目名称',
  `YEFX` int(1) DEFAULT NULL COMMENT '1 借  -1 贷',
  `BNJF` decimal(18,4) DEFAULT NULL COMMENT '本年借方',
  `BNDF` decimal(18,4) DEFAULT NULL COMMENT '本年贷方',
  `QMYE` decimal(18,4) DEFAULT NULL COMMENT '期末余额',
  `FZHSXM` varchar(64) DEFAULT NULL COMMENT '辅助核算项目',
  `FZHSXMBM` varchar(64) DEFAULT NULL COMMENT '辅助核算项目编码',
  `FZHSXMMC` varchar(255) DEFAULT NULL COMMENT '辅助核算项目名称',
  `ROWNUM` int(11) DEFAULT NULL,
  `LY` int(1) DEFAULT NULL COMMENT '1 excel导入 2 客户端采集',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_USER` bigint(20) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `QCYE` decimal(18,4) DEFAULT NULL COMMENT '期初余额',
  `ORIGINAL_KMMC` varchar(255) DEFAULT NULL COMMENT '原始科目名称',
  `QCFX` int(1) DEFAULT NULL COMMENT '1 借  -1 贷',
  `NCYE` decimal(18,4) DEFAULT NULL COMMENT '年初余额',
  `CSHBNJF` decimal(18,4) DEFAULT NULL COMMENT '初始化本年借方',
  `CSHBNDF` decimal(18,4) DEFAULT NULL COMMENT '初始化本年贷方',
  `NCFX` int(1) DEFAULT NULL COMMENT '1 借  -1 贷',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_IDX` (`ZTDM`),
  KEY `ZTDM_KMBM_IDX` (`ZTDM`,`KMBM`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`),
  KEY `ZTM_KJND_IDX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算初始化表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cwcsh_fzhslsb_rel`
--

DROP TABLE IF EXISTS `cwcsh_fzhslsb_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwcsh_fzhslsb_rel` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `LSB_ID` bigint(20) NOT NULL COMMENT '历史表ID',
  `FZHSXM` varchar(64) DEFAULT NULL COMMENT '辅助核算项目',
  `FZHSXMBM` varchar(64) DEFAULT NULL COMMENT '辅助核算项目编码',
  `FZHSXMMC` varchar(255) DEFAULT NULL COMMENT '辅助核算项目名称',
  `ROWNUM` int(11) DEFAULT NULL,
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_USER` bigint(20) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_IDX` (`ZTDM`),
  KEY `LSB_ID` (`LSB_ID`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`),
  KEY `ZTM_KJND_IDX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算初始化关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cwcsh_kmdz`
--

DROP TABLE IF EXISTS `cwcsh_kmdz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwcsh_kmdz` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `LSB_ID` bigint(20) DEFAULT NULL COMMENT '历史对照ID',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `MATCH_STATUS` int(2) DEFAULT NULL,
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `DISCARD_TYPE` int(2) DEFAULT NULL COMMENT '丢弃标识',
  `RULE_STATUS` int(2) DEFAULT NULL COMMENT '手动匹配到规则',
  PRIMARY KEY (`ID`),
  KEY `cwcsh_kmdz_ztdm_index` (`ZTDM`),
  KEY `LSB_ID_IDX` (`LSB_ID`),
  KEY `ZTKM_ID_IDX` (`ZTKM_ID`),
  KEY `ZTM_KJND_IDX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务初始化科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cwcsh_kmyelsb`
--

DROP TABLE IF EXISTS `cwcsh_kmyelsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwcsh_kmyelsb` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KMBM` varchar(64) DEFAULT NULL COMMENT '科目编码',
  `KMMC` varchar(255) DEFAULT NULL COMMENT '科目名称',
  `YEFX` int(1) DEFAULT NULL COMMENT '余额方向: 1-借 -1-贷',
  `BNJF` decimal(18,4) DEFAULT NULL COMMENT '本年借方',
  `BNDF` decimal(18,4) DEFAULT NULL COMMENT '本年贷方',
  `QMYE` decimal(18,4) DEFAULT NULL COMMENT '期末余额',
  `SJKMBM` varchar(64) DEFAULT NULL COMMENT '上级科目编码(校验时生成)',
  `SFFZHS` int(1) DEFAULT '0' COMMENT '是否辅助核算生成的科目: 1-是 0-不是',
  `ROWNUM` int(11) DEFAULT NULL COMMENT '行码',
  `LY` int(1) DEFAULT NULL COMMENT '来源: 1-excel导入 2-客户端采集',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `QCYE` decimal(18,4) DEFAULT NULL COMMENT '期初余额',
  `ORIGINAL_KMMC` varchar(255) DEFAULT NULL COMMENT '原始科目名称',
  `QCFX` int(1) DEFAULT NULL COMMENT '1 借  -1 贷',
  `NCYE` decimal(18,4) DEFAULT NULL COMMENT '年初余额',
  `CSHBNJF` decimal(18,4) DEFAULT NULL COMMENT '初始化本年借方',
  `CSHBNDF` decimal(18,4) DEFAULT NULL COMMENT '初始化本年贷方',
  `NCFX` int(1) DEFAULT NULL COMMENT '1 借  -1 贷',
  PRIMARY KEY (`ID`),
  KEY `index_ztdm` (`ZTDM`),
  KEY `ZTDM_KMBM_IDX` (`ZTDM`,`KMBM`),
  KEY `ZTM_KJND_IDX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务初始化科目余额历史信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cwcsh_progress`
--

DROP TABLE IF EXISTS `cwcsh_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwcsh_progress` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `STATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT '重新初始化状态: 0-默认，9-完成',
  `MODULE` varchar(6) DEFAULT NULL COMMENT '模块：发票、资金、资产、薪酬、存货',
  `TASK_ID` bigint(20) DEFAULT NULL COMMENT '任务id',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_IDX` (`ZTDM`),
  KEY `ZTDM_TASK_ID_IDX` (`ZTDM`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='重新初始化进度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cwcsh_slhslsb`
--

DROP TABLE IF EXISTS `cwcsh_slhslsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwcsh_slhslsb` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KMBM` varchar(64) DEFAULT NULL COMMENT '科目编码',
  `KMMC` varchar(100) DEFAULT NULL COMMENT '科目名称',
  `SLHSDW` varchar(32) DEFAULT NULL COMMENT '数量核算单位',
  `BNLJSLHSJF` decimal(50,8) DEFAULT NULL COMMENT '本年累计数量核算借方',
  `BNLJSLHSDF` decimal(50,8) DEFAULT NULL COMMENT '本年累计数量核算借方',
  `QMJC` decimal(50,8) DEFAULT NULL COMMENT '期末结存',
  `ROWNUM` int(11) DEFAULT NULL COMMENT '行码',
  `LY` int(1) DEFAULT NULL COMMENT '来源: 1-excel导入 2-客户端采集',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `QCJC` decimal(50,8) DEFAULT NULL COMMENT '期初结存',
  `ORIGINAL_KMMC` varchar(255) DEFAULT NULL COMMENT '原始科目名称',
  `NCJC` decimal(50,8) DEFAULT NULL COMMENT '年初结存',
  `CSHSLHSBNJF` decimal(50,8) DEFAULT NULL COMMENT '初始化本年借方',
  `CSHSLHSBNDF` decimal(50,8) DEFAULT NULL COMMENT '初始化本年贷方',
  PRIMARY KEY (`ID`),
  KEY `index_ztdm` (`ZTDM`),
  KEY `ZTDM_KMBM_IDX` (`ZTDM`,`KMBM`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`),
  KEY `ZTM_KJND_IDX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务初始化数量核算历史信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cwcsh_task`
--

DROP TABLE IF EXISTS `cwcsh_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwcsh_task` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `STATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT '重新初始化状态: 0-默认，1-进行中，2-失败，3-失效，9-完成',
  `TIME` int(1) DEFAULT NULL COMMENT '执行次数',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `NEED_INIT` tinyint(1) DEFAULT NULL COMMENT '财务初始化类型',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_IDX` (`ZTDM`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='重新初始化任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cwcsh_wbkmyelsb`
--

DROP TABLE IF EXISTS `cwcsh_wbkmyelsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwcsh_wbkmyelsb` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KMBM` varchar(64) DEFAULT NULL COMMENT '科目编码',
  `BZID` int(11) NOT NULL COMMENT '币种编码',
  `KMMC` varchar(100) DEFAULT NULL COMMENT '科目名称',
  `YEFX` int(1) DEFAULT NULL COMMENT '1 借  -1 贷',
  `BNJF` decimal(18,4) DEFAULT NULL COMMENT '本位币借方',
  `BNDF` decimal(18,4) DEFAULT NULL COMMENT '本位币贷方',
  `QMYE` decimal(18,4) DEFAULT NULL COMMENT '期末余额',
  `ROWNUM` int(11) DEFAULT NULL COMMENT '行码',
  `LY` int(1) DEFAULT NULL COMMENT '来源: 1-excel导入 2-客户端采集',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `QCYE` decimal(18,4) DEFAULT NULL COMMENT '期初余额',
  `ORIGINAL_KMMC` varchar(255) DEFAULT NULL COMMENT '原始科目名称',
  `QCFX` int(1) DEFAULT NULL COMMENT '1 借  -1 贷',
  `NCYE` decimal(18,4) DEFAULT NULL COMMENT '年初余额',
  `CSHBNJF` decimal(18,4) DEFAULT NULL COMMENT '初始化本年借方',
  `CSHBNDF` decimal(18,4) DEFAULT NULL COMMENT '初始化本年贷方',
  `NCFX` int(1) DEFAULT NULL COMMENT '1 借  -1 贷',
  PRIMARY KEY (`ID`),
  KEY `index_ztdm` (`ZTDM`),
  KEY `ZTDM_KMBM_IDX` (`ZTDM`,`KMBM`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`),
  KEY `ZTM_KJND_IDX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务初始化外币科目余额历史信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cwcsh_xjlllsb`
--

DROP TABLE IF EXISTS `cwcsh_xjlllsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwcsh_xjlllsb` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `KJQJ` int(4) DEFAULT NULL COMMENT '会计期间',
  `XMMC` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `HC` varchar(50) DEFAULT NULL COMMENT '行次',
  `BNLJJE` decimal(18,8) DEFAULT NULL COMMENT '本年累计金额',
  `ZBZ` varchar(300) DEFAULT NULL COMMENT '指标值',
  `ROWNUM` int(4) DEFAULT NULL COMMENT '行下标',
  `COLNUM` int(4) DEFAULT NULL COMMENT '列下标',
  `LY` int(1) DEFAULT NULL COMMENT '来源: 1-excel导入 2-客户端采集',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `index_ztdm` (`ZTDM`),
  KEY `ZTDM_KJND_KJQJ_IDX` (`ZTDM`,`KJND`,`KJQJ`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务初始化现金流量历史信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `final_carryover_account_config`
--

DROP TABLE IF EXISTS `final_carryover_account_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_carryover_account_config` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL,
  `fx` tinyint(2) DEFAULT NULL COMMENT '方向',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目id',
  `jz_type` varchar(50) DEFAULT NULL COMMENT '结转类型 (期末调汇，期末固定资产清理，期末结转)',
  `jlrq` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `cjr` varchar(50) DEFAULT NULL COMMENT '操作人',
  `xgsj` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `Index_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='期末结转科目配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `final_carryover_calc_record`
--

DROP TABLE IF EXISTS `final_carryover_calc_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_carryover_calc_record` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `jz_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '结转类型',
  `je` decimal(18,2) DEFAULT NULL COMMENT '测算金额',
  `cjr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `jlrq` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  `xgr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `Index_ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='期末结转测算记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `final_carryover_fzhs_config`
--

DROP TABLE IF EXISTS `final_carryover_fzhs_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_carryover_fzhs_config` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `km_config_id` bigint(20) DEFAULT NULL COMMENT '期末结转科目配置主id',
  `fzhs_id` bigint(20) DEFAULT NULL COMMENT '辅助核算id',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_user` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_ztdm_kjnd` (`ztdm`,`kjnd`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `final_carryover_merge_config`
--

DROP TABLE IF EXISTS `final_carryover_merge_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_carryover_merge_config` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `jz_type` varchar(10) DEFAULT NULL COMMENT '结转类型',
  `fs` varchar(10) DEFAULT NULL COMMENT '合并方式',
  `cjr` varchar(50) DEFAULT NULL COMMENT '创建人',
  `jlrq` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `kjnd` bigint(4) DEFAULT NULL COMMENT '会计年度',
  PRIMARY KEY (`id`),
  KEY `INDEX_ztdm_kjnd` (`ztdm`,`kjnd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='期末结转合并设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `final_carryover_record`
--

DROP TABLE IF EXISTS `final_carryover_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_carryover_record` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `jz_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '结转类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `cjr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `xgr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `njbs` tinyint(2) DEFAULT '0' COMMENT '年结标识  0非年结 1年结（暂时这玩意没啥用存一下的）',
  PRIMARY KEY (`id`),
  KEY `Index_ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='期末结转记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fzhs_chlb`
--

DROP TABLE IF EXISTS `fzhs_chlb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fzhs_chlb` (
  `ID` bigint(20) NOT NULL COMMENT '唯一ID',
  `ZTDM` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `CHLB` varchar(100) DEFAULT NULL COMMENT '存货类别',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_INDEX` (`ZTDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算存货类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fzhs_fzlx`
--

DROP TABLE IF EXISTS `fzhs_fzlx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fzhs_fzlx` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `FZLX_NAME` varchar(50) NOT NULL DEFAULT '' COMMENT '辅助核算类型名称',
  `FZLX_CODE` varchar(8) NOT NULL DEFAULT '' COMMENT '辅助核算类型',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_FZLXCODE_INDEX` (`ZTDM`,`FZLX_CODE`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算类型数据信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fzhs_ywsj`
--

DROP TABLE IF EXISTS `fzhs_ywsj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fzhs_ywsj` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `BM` varchar(50) NOT NULL COMMENT '编码',
  `MC` varchar(255) NOT NULL COMMENT '名称',
  `GGXH` varchar(100) DEFAULT NULL COMMENT '规格型号',
  `CHLX` varchar(50) DEFAULT NULL COMMENT '存货类型',
  `DW` varchar(40) DEFAULT NULL COMMENT '单位',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `FZLX_CODE` varchar(6) NOT NULL COMMENT '辅助核算类型',
  `ZT` int(11) NOT NULL DEFAULT '1' COMMENT '状态: 1-正常 2-冻结',
  `DATA_SOURCES` varchar(45) DEFAULT NULL COMMENT '数据来源',
  `SSBM` varchar(45) DEFAULT NULL COMMENT '上级（所属）部门',
  `BMID` varchar(45) DEFAULT NULL COMMENT '部门ID',
  `RYID` varchar(45) DEFAULT NULL COMMENT '人员ID',
  `COST_TYPE` varchar(45) DEFAULT NULL COMMENT '费用类型',
  `SSBMID` varchar(45) DEFAULT NULL COMMENT '上级（所属）部门ID',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `SNKJND_YWSJ_ID` bigint(20) DEFAULT NULL COMMENT '年度标签',
  `SJYWSJ_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_FZLXCODE_INDEX` (`ZTDM`,`KJND`,`FZLX_CODE`),
  KEY `BMID_INDEX` (`BMID`),
  KEY `RYID_INDEX` (`RYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算业务数据信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fzhs_ywsj_base`
--

DROP TABLE IF EXISTS `fzhs_ywsj_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fzhs_ywsj_base` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `BM` varchar(20) NOT NULL DEFAULT '' COMMENT '编码',
  `MC` varchar(300) NOT NULL DEFAULT '' COMMENT '名称',
  `FZLX_CODE` varchar(8) NOT NULL DEFAULT '' COMMENT '辅助核算类型',
  `ZT` int(11) NOT NULL DEFAULT '1' COMMENT '状态: 1-正常 2-冻结',
  `BZ` varchar(300) DEFAULT NULL COMMENT '备注',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `NDBQ` bigint(20) DEFAULT NULL COMMENT '年度标签',
  `SYS` int(1) DEFAULT '0' COMMENT '系统内置明细-1',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_FZLX_CODE_IDX` (`ZTDM`,`FZLX_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算业务数据信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fzhs_ywsj_bm`
--

DROP TABLE IF EXISTS `fzhs_ywsj_bm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fzhs_ywsj_bm` (
  `ID` bigint(20) unsigned NOT NULL,
  `YWSJID` bigint(20) NOT NULL COMMENT '业务数据ID',
  `BM` varchar(1024) DEFAULT NULL COMMENT '别名',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `YWSJID_INDEX` (`YWSJID`),
  KEY `idx_ztdm` (`ZTDM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fzhs_ywsj_ext`
--

DROP TABLE IF EXISTS `fzhs_ywsj_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fzhs_ywsj_ext` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `YWSJ_ID` bigint(20) DEFAULT NULL COMMENT '业务数据ID',
  `NSRSBH` varchar(20) DEFAULT '' COMMENT '纳税人识别号',
  `LXR` varchar(50) DEFAULT NULL COMMENT '联系人',
  `LXR_PHONE` varchar(13) DEFAULT NULL,
  `BANK` varchar(20) DEFAULT NULL COMMENT '开户银行',
  `BANK_ACCOUNT` varchar(20) DEFAULT NULL COMMENT '开户银行账号',
  `ADDRESS` varchar(300) DEFAULT NULL COMMENT '联系地址',
  `STATION` varchar(50) DEFAULT NULL COMMENT '岗位',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `DEPARTMENT` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `NUMBER_ID` varchar(30) DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`ID`),
  KEY `YWSJ_ID_INDEX` (`YWSJ_ID`),
  KEY `ZTDM_IDX` (`ZTDM`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算业务数据信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fzhs_ywsj_ztkm_rel`
--

DROP TABLE IF EXISTS `fzhs_ywsj_ztkm_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fzhs_ywsj_ztkm_rel` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `YWSJ_ID` bigint(20) DEFAULT NULL COMMENT '业务数据ID',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `DY_KMLX` varchar(20) DEFAULT NULL COMMENT '对应科目类型',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `YWSJ_ID_INDEX` (`YWSJ_ID`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算对应科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hsqj_kmyelsb`
--

DROP TABLE IF EXISTS `hsqj_kmyelsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsqj_kmyelsb` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `KJQJ` int(4) DEFAULT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '科目id',
  `KMBM` varchar(64) DEFAULT NULL COMMENT '科目编码',
  `KMNM` varchar(64) DEFAULT NULL COMMENT '科目内码(对应正式表中的科目内码)',
  `KMMC` varchar(255) DEFAULT NULL COMMENT '科目名称',
  `KMBQ` varchar(20) DEFAULT NULL COMMENT '科目标签',
  `YEFX` int(1) DEFAULT NULL COMMENT '1 借  -1 贷',
  `NCYE` decimal(18,4) DEFAULT NULL COMMENT '年初余额',
  `BNJF` decimal(18,4) DEFAULT NULL COMMENT '本年累计借方',
  `BNDF` decimal(18,4) DEFAULT NULL COMMENT '本年累计贷方',
  `QMYE` decimal(18,4) DEFAULT NULL COMMENT '期末余额',
  `LRRY` bigint(20) DEFAULT NULL COMMENT '录入人员',
  `LRSJ` int(10) DEFAULT NULL COMMENT '录入时间',
  `SJKMBM` varchar(40) DEFAULT NULL COMMENT '上级科目编码',
  `KMQC` varchar(200) DEFAULT NULL COMMENT '科目全称',
  `LY` int(1) DEFAULT NULL COMMENT '1 excel导入 2 客户端采集',
  `NCJF` decimal(18,4) DEFAULT NULL,
  `NCDF` decimal(18,4) DEFAULT NULL,
  `QMJF` decimal(18,4) DEFAULT NULL,
  `QMDF` decimal(18,4) DEFAULT NULL,
  `SFMJ` int(4) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_ztdm_kjnd` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_compare_report`
--

DROP TABLE IF EXISTS `init_compare_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_compare_report` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `ztdm` bigint(20) NOT NULL COMMENT '账套代码',
  `zt_id` bigint(20) NOT NULL COMMENT '账套id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(4) DEFAULT NULL COMMENT '会计期间',
  `init_zcfzb_qc_zc` decimal(20,2) DEFAULT '0.00' COMMENT '源软件资产负债表-期初-资产合计',
  `yzf_zcfzb_qc_zc` decimal(20,2) DEFAULT '0.00' COMMENT '云账房资产负债表-期初-资产合计',
  `init_zcfzb_qc_fz` decimal(20,2) DEFAULT '0.00' COMMENT '源软件资产负债表-期初-负债合计',
  `yzf_zcfzb_qc_fz` decimal(20,2) DEFAULT '0.00' COMMENT '云账房资产负债表-期初-负债合计',
  `init_zcfzb_qc_syzqy` decimal(20,2) DEFAULT '0.00' COMMENT '源软件资产负债表-期初-所有者权益合计',
  `yzf_zcfzb_qc_syzqy` decimal(20,2) DEFAULT '0.00' COMMENT '云账房资产负债表-期初-所有者权益合计',
  `init_zcfzb_qm_zc` decimal(20,2) DEFAULT '0.00' COMMENT '源软件资产负债表-期末-资产合计',
  `yzf_zcfzb_qm_zc` decimal(20,2) DEFAULT '0.00' COMMENT '云账房资产负债表-期末-资产合计',
  `init_zcfzb_qm_fz` decimal(20,2) DEFAULT '0.00' COMMENT '源软件资产负债表-期末-负债合计',
  `yzf_zcfzb_qm_fz` decimal(20,2) DEFAULT '0.00' COMMENT '云账房资产负债表-期末-负债合计',
  `init_zcfzb_qm_syzqy` decimal(20,2) DEFAULT '0.00' COMMENT '源软件资产负债表-期末-所有者合计',
  `yzf_zcfzb_qm_syzqy` decimal(20,2) DEFAULT '0.00' COMMENT '云账房资产负债表-期末-所有者合计',
  `init_lrb_bq` decimal(20,2) DEFAULT '0.00' COMMENT '源软件利润表-本期数-利润总额',
  `yzf_lrb_bq` decimal(20,2) DEFAULT '0.00' COMMENT '云账房利润表-本期数-利润总额',
  `init_lrb_bnlj` decimal(20,2) DEFAULT '0.00' COMMENT '源软件利润表-本年累计-利润总额',
  `yzf_lrb_bnlj` decimal(20,2) DEFAULT '0.00' COMMENT '云账房利润表-本年累计-利润总额',
  `init_ywhdb_bqlj` decimal(20,2) DEFAULT '0.00' COMMENT '源软件业务活动表-限定性净资产转为非限定性净资产-本期累计数',
  `yzf_ywhdb_bqlj` decimal(20,2) DEFAULT '0.00' COMMENT '云账房业务活动表-限定性净资产转为非限定性净资产-本期累计数',
  `init_ywgnb_bnlj` decimal(20,2) DEFAULT '0.00' COMMENT '源软件业务活动表-限定性净资产转为非限定性净资产-本期累计数',
  `yzf_ywgnb_bnlj` decimal(20,2) DEFAULT '0.00' COMMENT '云账房业务活动表-限定性净资产转为非限定性净资产-本期累计数',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表比对表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_fzhs_all`
--

DROP TABLE IF EXISTS `init_fzhs_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_fzhs_all` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `kjnd` int(10) DEFAULT NULL COMMENT '会计年度',
  `fzhslx` varchar(255) DEFAULT NULL COMMENT '辅助核算类型',
  `fzhsmc` varchar(255) DEFAULT NULL COMMENT '辅助核算名称',
  `fzhsbm` varchar(255) DEFAULT NULL COMMENT '辅助核算编码',
  `zt_id` bigint(20) DEFAULT NULL COMMENT '账套id',
  `bz` varchar(1000) DEFAULT NULL COMMENT '备注',
  `sh` varchar(255) DEFAULT NULL COMMENT '税号',
  `ssbm` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `zjhm` varchar(255) DEFAULT NULL COMMENT '证件号码',
  `ggxh` varchar(255) DEFAULT NULL COMMENT '规格型号',
  `dw` varchar(50) DEFAULT NULL COMMENT '单位',
  `chlb` varchar(50) DEFAULT NULL COMMENT '存货类别',
  `zt` int(10) DEFAULT NULL COMMENT '状态 0：未启用/1：已启用',
  PRIMARY KEY (`id`),
  KEY `Index_ztid` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_fzhs_kmye_temp`
--

DROP TABLE IF EXISTS `init_fzhs_kmye_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_fzhs_kmye_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) NOT NULL COMMENT '账套id',
  `kmid` bigint(20) DEFAULT NULL COMMENT '科目id',
  `kmmc` varchar(500) DEFAULT NULL COMMENT '科目名称',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `fzhslx` varchar(60) DEFAULT NULL COMMENT '辅助核算类型',
  `fzhsbm` varchar(60) DEFAULT NULL COMMENT '辅助核算编码',
  `oldfzhslx` varchar(255) DEFAULT NULL COMMENT '原始的辅助核算类型',
  `fzhsmc` varchar(255) DEFAULT NULL COMMENT '辅助核算名称',
  `oldfzhsmc` varchar(255) DEFAULT NULL COMMENT '原始的辅助核算名称',
  `df` decimal(32,8) DEFAULT '0.00000000' COMMENT '本期发生额贷方',
  `bndf` decimal(32,8) DEFAULT '0.00000000' COMMENT '贷方年累计发生额',
  `jf` decimal(32,8) DEFAULT '0.00000000' COMMENT '本期发生额借方',
  `bnjf` decimal(32,8) DEFAULT '0.00000000' COMMENT '借方年累计发生额',
  `qc` decimal(32,8) DEFAULT NULL COMMENT '期初余额',
  `qcfx` int(10) DEFAULT NULL COMMENT '期初方向（借/贷/平）',
  `qm` decimal(32,8) DEFAULT NULL COMMENT '期末余额',
  `qmfx` int(10) DEFAULT NULL COMMENT '期末方向（借/贷/平）',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `type` int(2) DEFAULT NULL COMMENT '0:自带 1:后补',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `kmbm` varchar(20) DEFAULT NULL COMMENT '科目编码',
  PRIMARY KEY (`id`),
  KEY `kmid` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后辅助核算数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_fzhs_temp`
--

DROP TABLE IF EXISTS `init_fzhs_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_fzhs_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) NOT NULL COMMENT '账套id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `pzx_id` bigint(20) DEFAULT NULL COMMENT '凭证细id',
  `fzhsmc` varchar(255) DEFAULT NULL COMMENT '辅助核算名称',
  `fzhslx` varchar(255) DEFAULT NULL COMMENT '辅助核算名称',
  `bm` varchar(64) DEFAULT NULL COMMENT '编码',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `sh` varchar(64) DEFAULT NULL COMMENT '税号',
  `ssbm` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `zjhm` varchar(64) DEFAULT NULL COMMENT '证照号码',
  `ggxh` varchar(64) DEFAULT NULL COMMENT '规格型号',
  `dw` varchar(64) DEFAULT NULL COMMENT '单位',
  `chlb` varchar(64) DEFAULT NULL COMMENT '存货类别',
  `zt` int(1) DEFAULT NULL COMMENT '状态（0：未启用/1：已启用）',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `Index_ztid` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后辅助核算数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_fzhs_type`
--

DROP TABLE IF EXISTS `init_fzhs_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_fzhs_type` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `fzhs_type` varchar(20) DEFAULT NULL COMMENT '辅助核算类型',
  `type` int(2) DEFAULT NULL COMMENT '类型 0:原始 1.自定义',
  `zt_id` bigint(20) DEFAULT NULL COMMENT '账套id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `Index_ztid` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_history_voucher_detail_temp`
--

DROP TABLE IF EXISTS `init_history_voucher_detail_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_history_voucher_detail_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `pzid` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `zt_id` bigint(20) NOT NULL COMMENT '账套id',
  `jf` decimal(32,8) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(32,8) DEFAULT NULL COMMENT '贷方金额',
  `kmid` bigint(20) DEFAULT NULL COMMENT '科目id',
  `kmmc` varchar(500) DEFAULT NULL COMMENT '科目名称',
  `kmbm` varchar(100) DEFAULT NULL COMMENT '科目编码',
  `zy` varchar(1024) DEFAULT NULL COMMENT '摘要（摘要和分录号对应）',
  `bzid` bigint(32) DEFAULT NULL COMMENT '币种id',
  `bzbm` varchar(100) DEFAULT NULL COMMENT '币种名称',
  `hl` decimal(32,8) DEFAULT NULL COMMENT '汇率',
  `jfyb` decimal(32,8) DEFAULT NULL COMMENT '借方原币金额',
  `dfyb` decimal(32,8) DEFAULT NULL COMMENT '贷方原币金额',
  `jfsl` decimal(32,8) DEFAULT NULL COMMENT '借方数量',
  `dfsl` decimal(32,8) DEFAULT NULL COMMENT '贷方数量',
  `dj` decimal(32,8) DEFAULT NULL COMMENT '单价',
  `slhsmc` varchar(255) DEFAULT NULL COMMENT '数量核算关联的计量单位名称',
  `fzhsid` varchar(64) DEFAULT NULL COMMENT '辅助核算id',
  `fzhs_type` varchar(20) DEFAULT NULL COMMENT '辅助核算类型',
  `fzhs_name` varchar(50) DEFAULT NULL COMMENT '辅助核算名称',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `kjnd` int(10) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(10) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `ztid_pzid` (`zt_id`,`pzid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后历史凭证明细数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_history_voucher_temp`
--

DROP TABLE IF EXISTS `init_history_voucher_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_history_voucher_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) NOT NULL COMMENT '账套id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `pzmc` varchar(255) DEFAULT NULL COMMENT '凭证名称',
  `pzrq` varchar(32) DEFAULT NULL COMMENT '凭证日期',
  `pzzh` varchar(32) DEFAULT NULL COMMENT '凭证字号（示例：记、收、付、转）',
  `pzh` varchar(32) DEFAULT NULL COMMENT '凭证号',
  `lsh` varchar(32) DEFAULT NULL COMMENT '流水号,根据凭证号拆分',
  `sfjzsy` int(1) DEFAULT NULL COMMENT '是否结转损益（1：是，0：否）',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `is_red` int(1) DEFAULT NULL COMMENT '是否红冲单',
  `shr` varchar(64) DEFAULT NULL COMMENT '审核人名称',
  `zdr` varchar(64) DEFAULT NULL COMMENT '制单人名称',
  `zt` int(4) DEFAULT NULL COMMENT '状态（0：有效凭证，1：作废凭证，2：红冲凭证）',
  `shzt` int(1) DEFAULT NULL COMMENT '审核状态（0：未审核，1：已审核）',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `kmid` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后历史凭证数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_input_file`
--

DROP TABLE IF EXISTS `init_input_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_input_file` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型 KMYE：科目余额,QC_KMYE： "期初科目余额",QC_WB_KMYE："期初外币科目余额",QC_FZHS_KMYE ："期初外币科目余额",QC_SL_KMYE： "期初数量科目余额",PZ： "凭证"',
  `file_index` int(20) DEFAULT NULL COMMENT '文件索引',
  `file_path` varchar(200) DEFAULT NULL COMMENT '文件地址',
  `bzbm` varchar(255) DEFAULT NULL COMMENT '币种',
  `csh_status` int(10) DEFAULT NULL COMMENT '是否解析状态 0：未解析 1：已解析',
  `model_name` varchar(255) DEFAULT NULL COMMENT '模版名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `index_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史账套初始化导入文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_km_bz_temp`
--

DROP TABLE IF EXISTS `init_km_bz_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_km_bz_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `zt_id` bigint(20) DEFAULT NULL COMMENT '账套id',
  `kjnd` int(10) DEFAULT NULL COMMENT '会计年度',
  `kmbm` varchar(255) DEFAULT NULL COMMENT '科目编码',
  `kmmc` varchar(255) DEFAULT NULL COMMENT '科目名称',
  `bzbm` varchar(255) DEFAULT NULL COMMENT '币种名称',
  `bz_id` bigint(20) DEFAULT NULL COMMENT '币种id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ztid` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目币种关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_km_fzhs_temp`
--

DROP TABLE IF EXISTS `init_km_fzhs_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_km_fzhs_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `zt_id` bigint(20) DEFAULT NULL COMMENT '账套id',
  `kjnd` int(10) DEFAULT NULL COMMENT '会计年度',
  `kmbm` varchar(20) DEFAULT NULL COMMENT '科目编码',
  `kmmc` varchar(255) DEFAULT NULL COMMENT '科目名称',
  `fzhs_lx` varchar(10) DEFAULT NULL COMMENT '辅助核算类型',
  `fzhs_mc` varchar(255) DEFAULT NULL COMMENT '辅助核算名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ztid` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目辅助核算关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_kmye_temp`
--

DROP TABLE IF EXISTS `init_kmye_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_kmye_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) NOT NULL COMMENT '账套id',
  `kmid` bigint(20) DEFAULT NULL COMMENT '科目id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `kmmc` varchar(500) DEFAULT NULL COMMENT '科目名称',
  `kmbm` varchar(20) DEFAULT NULL COMMENT '科目编码',
  `df` decimal(32,8) DEFAULT '0.00000000' COMMENT '本期发生额贷方',
  `bndf` decimal(32,8) DEFAULT '0.00000000' COMMENT '贷方年累计发生额',
  `jf` decimal(32,8) DEFAULT '0.00000000' COMMENT '本期发生额借方',
  `bnjf` decimal(32,8) DEFAULT '0.00000000' COMMENT '借方年累计发生额',
  `qc` decimal(32,8) DEFAULT NULL COMMENT '期初余额',
  `qcfx` int(10) DEFAULT NULL COMMENT '期初方向（借/贷/平）',
  `qm` decimal(32,8) DEFAULT NULL COMMENT '期末余额',
  `qmfx` int(10) DEFAULT NULL COMMENT '期末方向（借/贷/平）',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `type` int(2) DEFAULT NULL COMMENT '0:自带 1:后补',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ztid-kjnd` (`zt_id`,`kjnd`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后科目余额数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_qyxx_temp`
--

DROP TABLE IF EXISTS `init_qyxx_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_qyxx_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) DEFAULT NULL COMMENT '账套id',
  `gs_id` bigint(20) DEFAULT NULL COMMENT '代账公司id',
  `company_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `taxlayer_no` varchar(64) DEFAULT NULL COMMENT '纳税人识别号',
  `taxlayer_type` varchar(255) DEFAULT NULL COMMENT '纳税人资格',
  `business_scope` varchar(1000) DEFAULT NULL COMMENT '经营范围',
  `shxydm` varchar(64) DEFAULT NULL COMMENT '社会信用代码',
  `begin_date` varchar(10) DEFAULT NULL COMMENT '成立日期',
  `operation_limit` varchar(32) DEFAULT NULL COMMENT '生产经营期限',
  `person_count` varchar(64) DEFAULT NULL COMMENT '人员规模',
  `regist_capital` varchar(32) DEFAULT NULL COMMENT '注册资本',
  `company_type` varchar(64) DEFAULT NULL COMMENT '企业类型',
  `sjzb` varchar(32) DEFAULT NULL COMMENT '实缴资本',
  `hzrq` varchar(64) DEFAULT NULL COMMENT '核准日期',
  `sshy` varchar(255) DEFAULT NULL COMMENT '所属行业',
  `cbrs` int(11) DEFAULT NULL COMMENT '参保人数',
  `zzjgdm` varchar(64) DEFAULT NULL COMMENT '组织机构代码',
  `gszch` varchar(64) DEFAULT NULL COMMENT '工商注册号',
  `jckqydm` varchar(64) DEFAULT NULL COMMENT '进出口企业代码',
  `djjg` varchar(255) DEFAULT NULL COMMENT '登记机关',
  `shdq` varchar(255) DEFAULT NULL COMMENT '所属地区',
  `qydz` varchar(255) DEFAULT NULL COMMENT '企业地址',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后企业基本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_rule`
--

DROP TABLE IF EXISTS `init_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_rule` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `gs_id` bigint(20) DEFAULT NULL COMMENT '代账公司id',
  `kjhszz` int(10) DEFAULT NULL COMMENT '会计核算准则id',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否启用 0:不启用 1启用',
  `origin_kmmc` varchar(1000) DEFAULT NULL COMMENT '原始科目名称',
  `kmmc` varchar(1000) DEFAULT NULL COMMENT '当前科目名称',
  `origin_kmbm` varchar(255) DEFAULT NULL COMMENT '原始科目编码',
  `kmbm` varchar(255) DEFAULT NULL COMMENT '科目编码',
  `origin_bzmc` varchar(20) DEFAULT NULL COMMENT '原始外币名称',
  `bzmc` varchar(20) DEFAULT NULL COMMENT '当前币种名称',
  `bz_id` bigint(20) DEFAULT NULL COMMENT '币种id',
  `type` int(10) NOT NULL COMMENT '规则类型 1:科目规则 2:币种规则',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `del_flag` int(2) NOT NULL DEFAULT '0' COMMENT '删除状态 0:正常',
  `source` int(2) NOT NULL COMMENT '1:手动 2:系统',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='迁移匹配规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_rule_system_config`
--

DROP TABLE IF EXISTS `init_rule_system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_rule_system_config` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `hyid` int(11) NOT NULL COMMENT '行业id',
  `kjhszzid` int(11) NOT NULL COMMENT '会计准则',
  `kmqc` varchar(255) NOT NULL COMMENT '系统科目全称',
  `third_kmqc` varchar(255) NOT NULL COMMENT '第三科目全称',
  `rule_status` char(1) NOT NULL COMMENT '规则状态:1-有效 0-失效',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_slye_fzhs_temp`
--

DROP TABLE IF EXISTS `init_slye_fzhs_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_slye_fzhs_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) NOT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `kmid` bigint(20) DEFAULT NULL COMMENT '科目id',
  `kmbm` varchar(64) DEFAULT NULL COMMENT '科目编码',
  `kmmc` varchar(255) DEFAULT NULL COMMENT '科目名称',
  `jfsl` decimal(32,8) DEFAULT NULL COMMENT '借方发生数量',
  `jfsl_year` decimal(32,8) DEFAULT NULL COMMENT '借方年累计发生数量',
  `dfsl` decimal(32,8) DEFAULT NULL COMMENT '贷方发生数量',
  `dfsl_year` decimal(32,8) DEFAULT NULL COMMENT '贷方年累计发生数量',
  `qcsl` decimal(32,8) DEFAULT NULL COMMENT '期初数量',
  `qmsl` decimal(32,8) DEFAULT NULL COMMENT '期末数量',
  `fzhslx` varchar(64) DEFAULT NULL COMMENT '辅助核算类型',
  `fzhsbm` varchar(64) DEFAULT NULL COMMENT '辅助核算编码',
  `fzhsmc` varchar(255) DEFAULT NULL COMMENT '辅助核算名称',
  `jldwmc` varchar(255) DEFAULT NULL COMMENT '计量单位名称',
  `qcfx` int(1) DEFAULT NULL COMMENT '期初方向',
  `qmfx` int(1) DEFAULT NULL COMMENT '期末方向',
  `qc` decimal(32,8) DEFAULT NULL COMMENT '期初金额',
  `qm` decimal(32,8) DEFAULT NULL COMMENT '期末金额',
  `df` decimal(32,8) DEFAULT NULL COMMENT '贷方发生额',
  `df_year` decimal(32,8) DEFAULT NULL COMMENT '贷方年累计发生额',
  `jf` decimal(32,8) DEFAULT NULL COMMENT '借方发生额',
  `jf_year` decimal(32,8) DEFAULT NULL COMMENT '借方年累计发生额',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_ztid` (`zt_id`) USING BTREE COMMENT '账套代码索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后数量辅助核算余额数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_slye_temp`
--

DROP TABLE IF EXISTS `init_slye_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_slye_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) NOT NULL COMMENT '账套id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `kmid` bigint(20) DEFAULT NULL COMMENT '科目id',
  `kmmc` varchar(500) DEFAULT NULL COMMENT '科目名称',
  `kmbm` varchar(20) DEFAULT NULL COMMENT '科目编码',
  `jfsl` decimal(32,8) DEFAULT NULL COMMENT '借方发生数量',
  `bnjfsl` decimal(32,8) DEFAULT NULL COMMENT '借方年累计发生数量',
  `dfsl` decimal(32,8) DEFAULT NULL COMMENT '贷方发生数量',
  `bndfsl` decimal(32,8) DEFAULT NULL COMMENT '贷方年累计发生数量',
  `qcsl` decimal(32,8) DEFAULT NULL COMMENT '期初数量',
  `qmsl` decimal(32,8) DEFAULT NULL COMMENT '期末数量',
  `jldwmc` varchar(255) DEFAULT NULL COMMENT '计量单位名称',
  `qcfx` int(1) DEFAULT NULL COMMENT '期初方向',
  `qmfx` int(1) DEFAULT NULL COMMENT '期末方向',
  `qc` decimal(32,8) DEFAULT NULL COMMENT '期初金额',
  `qm` decimal(32,8) DEFAULT NULL COMMENT '期末金额',
  `df` decimal(32,8) DEFAULT NULL COMMENT '贷方发生额',
  `bndf` decimal(32,8) DEFAULT NULL COMMENT '贷方年累计发生额',
  `jf` decimal(32,8) DEFAULT NULL COMMENT '借方发生额',
  `bnjf` decimal(32,8) DEFAULT NULL COMMENT '借方年累计发生额',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `type` int(2) DEFAULT NULL COMMENT '0:自带 1:后补',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ztid` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后数量余额数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_voucher_error`
--

DROP TABLE IF EXISTS `init_voucher_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_voucher_error` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(10) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(10) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(20) DEFAULT NULL COMMENT '流水号',
  `pzz` varchar(10) DEFAULT NULL COMMENT '凭证字',
  `errorMsg` text COMMENT '错误信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证历史迁移异常';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_wb_kmye_temp`
--

DROP TABLE IF EXISTS `init_wb_kmye_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_wb_kmye_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) NOT NULL COMMENT '账套id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `kmid` bigint(20) DEFAULT NULL COMMENT '科目id',
  `kmbm` varchar(20) DEFAULT NULL COMMENT '科目编码',
  `kmmc` varchar(500) DEFAULT NULL COMMENT '科目名称',
  `bzid` bigint(20) DEFAULT NULL COMMENT '币种id',
  `bzbm` varchar(20) DEFAULT NULL COMMENT '币种名称',
  `df` decimal(32,8) DEFAULT NULL COMMENT '贷方发生额',
  `bndf` decimal(32,8) DEFAULT NULL COMMENT '贷方年累计发生额',
  `jf` decimal(32,8) DEFAULT NULL COMMENT '借方发生额',
  `bnjf` decimal(32,8) DEFAULT NULL COMMENT '借方年累计发生额',
  `qc` decimal(32,8) DEFAULT NULL COMMENT '期初余额',
  `qcfx` int(1) DEFAULT NULL COMMENT '期初方向',
  `qm` decimal(32,8) DEFAULT NULL COMMENT '期末余额',
  `qmfx` int(1) DEFAULT NULL COMMENT '期末方向',
  `bwbdf` decimal(32,8) DEFAULT NULL COMMENT '本位币贷方发生额',
  `bwbbndf` decimal(32,8) DEFAULT NULL COMMENT '本位币贷方年累计发生额',
  `bwbjf` decimal(32,8) DEFAULT NULL COMMENT '本位币借方发生额',
  `bwbbnjf` decimal(32,8) DEFAULT NULL COMMENT '本位币借方年累计发生额',
  `bwbqc` decimal(32,8) DEFAULT NULL COMMENT '本位币期初余额',
  `bwbqm` decimal(32,8) DEFAULT NULL COMMENT '本位币期末余额',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `type` int(2) DEFAULT NULL COMMENT '0:自带 1:后补',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ztid` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后外币科目余额数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_zt_cj_temp`
--

DROP TABLE IF EXISTS `init_zt_cj_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_zt_cj_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) DEFAULT NULL COMMENT '账套代码id',
  `level_index` int(11) DEFAULT NULL COMMENT '层级索引',
  `level_value` int(11) DEFAULT NULL COMMENT '层级长度',
  `origin_level_value` int(11) DEFAULT NULL COMMENT '初始层级长度',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `zt_id` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后账套层级数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_zt_qjzt_temp`
--

DROP TABLE IF EXISTS `init_zt_qjzt_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_zt_qjzt_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) DEFAULT NULL COMMENT '账套代码id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `zt` int(1) DEFAULT NULL COMMENT '状态：0-未结账，-1-未建账， 9-已结账',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `zt_id` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后账套会计期间';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_zt_temp`
--

DROP TABLE IF EXISTS `init_zt_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_zt_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '云帐房账套代码',
  `company_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `third_company_name` varchar(255) DEFAULT NULL COMMENT '第三方企业名称',
  `qy_id` bigint(20) DEFAULT NULL COMMENT '企业id',
  `zt_id` bigint(20) DEFAULT NULL COMMENT '账套代码id',
  `gs_id` bigint(20) DEFAULT NULL COMMENT '代账公司id',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '账套迁移状态 0:未迁移 1:迁移中 2:迁移失败 3:迁移完成',
  `compare_status` tinyint(2) DEFAULT '0' COMMENT '比对状态 0:未比对 1:比对中 2:比对一致 3:比对不一致',
  `node_id` tinyint(2) NOT NULL DEFAULT '0' COMMENT '迁移节点',
  `start_year` int(11) DEFAULT NULL COMMENT '企业年份',
  `start_month` int(11) DEFAULT NULL COMMENT '启用月份',
  `his_start_year` int(11) DEFAULT NULL COMMENT '历史账套启用年份',
  `his_start_month` int(11) DEFAULT NULL COMMENT '历史账套启用月份',
  `input_start_year` int(11) DEFAULT NULL COMMENT '导入文件启用年份',
  `input_start_month` int(11) DEFAULT NULL COMMENT '导入文件启用月份',
  `update_status` int(2) DEFAULT NULL COMMENT '启用账期修改状态',
  `kjzz_id` int(64) DEFAULT NULL COMMENT '会计准则',
  `sfcfl` tinyint(1) DEFAULT NULL COMMENT '是否重分类',
  `type` int(2) DEFAULT NULL COMMENT '迁移方式 1:采集 2:导入',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `kqlszq` tinyint(1) DEFAULT '0' COMMENT '是否开启历史账期标识 0:不开启 1:开启',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `error_reason` varchar(2000) DEFAULT NULL COMMENT '迁移错误原因',
  PRIMARY KEY (`id`),
  KEY `zt_id` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后账套基本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `init_ztkm_temp`
--

DROP TABLE IF EXISTS `init_ztkm_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_ztkm_temp` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `zt_id` bigint(20) DEFAULT NULL COMMENT '账套代码id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kmbm` varchar(64) DEFAULT NULL COMMENT '科目编码',
  `kmfx` int(1) DEFAULT NULL COMMENT '借贷方向',
  `kmlx` int(1) DEFAULT NULL COMMENT '科目类型',
  `kmmc` varchar(500) DEFAULT NULL COMMENT '科目名称',
  `kmzt` int(11) DEFAULT NULL COMMENT '启用状态',
  `sfmj` int(1) DEFAULT NULL COMMENT '是否末级',
  `sjkmbm` varchar(64) DEFAULT NULL COMMENT '上级科目编码',
  `sjkmmc` varchar(255) DEFAULT NULL COMMENT '上级科目名称',
  `sscj` int(11) DEFAULT NULL COMMENT '所属层级',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `fzhs` int(2) DEFAULT NULL COMMENT '是否开启辅助核算,0:否,1:是',
  `wbhs` int(2) DEFAULT NULL COMMENT '是否开启外币核算,0:否,1:是',
  `slhs` int(2) DEFAULT NULL COMMENT '是否开启数量核算,0:否,1:是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ztid` (`zt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗后科目数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jz_cs`
--

DROP TABLE IF EXISTS `jz_cs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jz_cs` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `ZTKM_DZ_ID` bigint(20) DEFAULT NULL COMMENT '账套科目对照ID',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `TYPE` varchar(20) NOT NULL COMMENT '类型（QMTH ：期末调汇   jzgdzcql: 结转固定资产清理  jzsy:结转损益）',
  `SFZC` int(11) DEFAULT NULL COMMENT '结账损益下特殊含义字段 1 ： 资产  2：成本',
  `XDX_TYPE` int(11) DEFAULT NULL COMMENT ' 1    2',
  `DEL_FLAG` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KJQJ_INDEX` (`ZTDM`,`KJND`,`KJQJ`),
  KEY `ZTKM_ID` (`ZTKM_ID`),
  KEY `ZTKM_DZ_ID` (`ZTKM_DZ_ID`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结账测算数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jz_cs_xq`
--

DROP TABLE IF EXISTS `jz_cs_xq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jz_cs_xq` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `JZ_CS_ID` bigint(20) NOT NULL COMMENT '结转测算数据ID',
  `BWJF` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '借方发生额（人民币）',
  `JF` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '借方发生额（原币）',
  `BWDF` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '贷方发生额（人民币）',
  `DF` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '贷方发生额（原币）',
  `BWYE` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '期末余额（人民币）',
  `YE` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '期末余额',
  `BZID` int(20) DEFAULT NULL COMMENT '币种ID',
  `QMHL` decimal(20,2) DEFAULT '0.00' COMMENT '期末汇率',
  `DEL_FLAG` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `JZ_CS_ID_INDEX` (`JZ_CS_ID`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`),
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结账测算详情数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jz_qmhl`
--

DROP TABLE IF EXISTS `jz_qmhl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jz_qmhl` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(2) NOT NULL COMMENT '会计期间',
  `BZID` int(11) NOT NULL COMMENT '币种ID',
  `QMHL` decimal(20,8) DEFAULT NULL COMMENT '期末汇率',
  `DEL_FLAG` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KJQJ_INDEX` (`ZTDM`,`KJND`,`KJQJ`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结账期末汇率';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pz_move_dz_id`
--

DROP TABLE IF EXISTS `pz_move_dz_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pz_move_dz_id` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `old_pz_id` varchar(40) DEFAULT NULL COMMENT '老凭证',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `new_pz_id` bigint(20) DEFAULT NULL COMMENT '新凭证id',
  PRIMARY KEY (`id`),
  KEY `ztdm-oldid-newid` (`ztdm`,`old_pz_id`,`new_pz_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证新老对照';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pz_move_dz_id_20201210`
--

DROP TABLE IF EXISTS `pz_move_dz_id_20201210`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pz_move_dz_id_20201210` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `old_pz_id` varchar(40) DEFAULT NULL COMMENT '老凭证',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `new_pz_id` bigint(20) DEFAULT NULL COMMENT '新凭证id',
  PRIMARY KEY (`id`),
  KEY `ztdm-oldid-newid` (`ztdm`,`old_pz_id`,`new_pz_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证新老对照';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pz_move_nokmid`
--

DROP TABLE IF EXISTS `pz_move_nokmid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pz_move_nokmid` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(10) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(10) DEFAULT NULL COMMENT '会计期间',
  `kmnm` varchar(20) DEFAULT NULL COMMENT '科目内码',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `km_id` bigint(20) DEFAULT NULL COMMENT '顶替的科目id',
  `status` int(2) DEFAULT NULL COMMENT '是否已经同步科目余额 0:否 1:是',
  PRIMARY KEY (`id`),
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于保存迁移后kmid找不到的顶替数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_auto_addztkm`
--

DROP TABLE IF EXISTS `sys_auto_addztkm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_auto_addztkm` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `HYID` int(11) NOT NULL COMMENT '经营行业ID',
  `NSRZGDM` varchar(5) NOT NULL COMMENT '纳税人资格代码',
  `KJHSZZ` int(11) NOT NULL COMMENT '会计准则ID',
  `KMNM` varchar(64) DEFAULT NULL COMMENT '科目内码',
  `SYMK` int(1) NOT NULL COMMENT '使用模块：1：财务初始化，2：创建账套但不进行财务初始化，3：财务初始化和创建账套时都使用',
  `STATUS` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1-开启 2-禁用',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `KJHSZZ_HYID_INDEX` (`KJHSZZ`,`HYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_fzhs_config`
--

DROP TABLE IF EXISTS `sys_fzhs_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fzhs_config` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `KJHSZZ` int(11) DEFAULT NULL,
  `KMBM` varchar(64) DEFAULT NULL COMMENT '科目编码',
  `FZLX_CODE` varchar(50) DEFAULT NULL COMMENT '辅助类型编码',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `STATUS` int(1) NOT NULL DEFAULT '1' COMMENT '状态: 1-正常 2-禁用',
  `FZHS_OPEN_LIMIT` int(1) DEFAULT NULL COMMENT '辅助核算开启限制 0:所有层级均可开启 1:只有顶级可开启',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `KJHSZZ_IDX` (`KJHSZZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_fzhs_fwpz`
--

DROP TABLE IF EXISTS `sys_fzhs_fwpz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fzhs_fwpz` (
  `ID` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `KJHSZZ` int(11) NOT NULL COMMENT '会计制度准则',
  `KMBM` varchar(32) NOT NULL COMMENT '科目编码',
  `FZHSLX` varchar(128) NOT NULL COMMENT '辅助核算项目类型，以逗号隔开',
  `STATUS` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1-开启 2-禁用',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `KJHSZZ_INDEX` (`KJHSZZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_hykm`
--

DROP TABLE IF EXISTS `sys_hykm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_hykm` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `HYID` int(11) NOT NULL COMMENT '行业编码',
  `KJHSZZ` int(11) NOT NULL COMMENT '会计核算准则ID',
  `KMBM` varchar(100) DEFAULT '' COMMENT '科目编码',
  `KMNM` varchar(100) DEFAULT '' COMMENT '科目内码',
  `SJKMNM` varchar(100) DEFAULT NULL COMMENT '上级科目内码',
  `KMMC` varchar(255) DEFAULT NULL COMMENT '科目名称',
  `KMQC` varchar(255) DEFAULT NULL COMMENT '科目全称',
  `KMFX` int(11) DEFAULT NULL COMMENT '科目方向 1 借方  -1 贷方',
  `SFBXKM` tinyint(1) DEFAULT NULL COMMENT '是否必选科目:1-必选科目 0-可选用科目',
  `KMLX` varchar(6) DEFAULT '' COMMENT '科目类型：字典表',
  `KMCJ` int(11) DEFAULT NULL COMMENT '科目层级',
  `KMBQ` varchar(6) DEFAULT NULL COMMENT '科目标签',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `STATUS` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1-开启 2-禁用',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `KJHSZZ_YHID_INDEX` (`KJHSZZ`,`HYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统行业科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_hykmdz`
--

DROP TABLE IF EXISTS `sys_hykmdz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_hykmdz` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `HYID` int(11) NOT NULL COMMENT '行业编码;对应公司的行业类型编码',
  `KJHSZZ` int(11) NOT NULL COMMENT '会计准则',
  `KMQC` varchar(255) NOT NULL DEFAULT '' COMMENT '科目全称',
  `THIRD_KMQC` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方科目全称',
  `STATUS` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1-开启 2-禁用',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `HYID_KJHSZZ_KMQC_THIRD` (`HYID`,`KJHSZZ`,`KMQC`,`THIRD_KMQC`),
  KEY `KJHSZZ_HYID_INDEX` (`KJHSZZ`,`HYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统行业科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_km_bqdz`
--

DROP TABLE IF EXISTS `sys_km_bqdz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_km_bqdz` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `KJHSZZ` int(11) DEFAULT NULL COMMENT '会计核算准则',
  `KMBM` varchar(100) DEFAULT NULL COMMENT '科目编码',
  `BQDM` varchar(6) DEFAULT NULL COMMENT '标签代码 sys_dz',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `KJHSZZ_INDEX` (`KJHSZZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目标签对照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_km_pz`
--

DROP TABLE IF EXISTS `sys_km_pz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_km_pz` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `KJHSZZ` int(11) DEFAULT NULL COMMENT '会计核算准则',
  `KMBM` varchar(64) DEFAULT NULL COMMENT '科目编码',
  `KMMC` varchar(255) DEFAULT NULL COMMENT '科目名称 ',
  `YWLX` varchar(20) DEFAULT NULL COMMENT '业务类型',
  `BZ` varchar(200) DEFAULT NULL COMMENT '备注描述',
  `STATUS` int(1) NOT NULL DEFAULT '1' COMMENT '状态: 1-正常 2-禁用',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `KJHSZZ_INDEX` (`KJHSZZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_kmbq`
--

DROP TABLE IF EXISTS `sys_kmbq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_kmbq` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `CODE` varchar(6) NOT NULL COMMENT '标签代码',
  `NAME` varchar(50) NOT NULL COMMENT '标签名称',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '状态 1-开启 2-禁用',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_kmcjbq`
--

DROP TABLE IF EXISTS `sys_kmcjbq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_kmcjbq` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `KJHSZZ` int(11) NOT NULL COMMENT '会计核算准则',
  `KMBM` varchar(255) DEFAULT NULL COMMENT '科目编码',
  `KMBQ` varchar(6) NOT NULL DEFAULT '' COMMENT '推荐标签',
  `KMCJ` varchar(255) DEFAULT NULL COMMENT '科目层级',
  `STATUS` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1-开启 2-禁用',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `SJKMBQ` varchar(255) DEFAULT NULL COMMENT '上级科目标签',
  PRIMARY KEY (`ID`),
  KEY `KJHSZZ_INDEX` (`KJHSZZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签对应科目级次表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_kmtjbq`
--

DROP TABLE IF EXISTS `sys_kmtjbq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_kmtjbq` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `KJHSZZ` int(11) NOT NULL COMMENT '会计核算准则',
  `KMQC` varchar(255) DEFAULT NULL COMMENT '科目全称',
  `KMBQ` varchar(6) NOT NULL DEFAULT '' COMMENT '推荐标签',
  `KMBM` varchar(64) DEFAULT NULL COMMENT '科目编码',
  `STATUS` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1-开启 2-禁用',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `KJHSZZ_INDEX` (`KJHSZZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签推荐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_supply_code`
--

DROP TABLE IF EXISTS `sys_supply_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_supply_code` (
  `id` bigint(20) unsigned NOT NULL,
  `supply_code` varchar(10) DEFAULT NULL COMMENT '编码 ,唯一',
  `supply_type` char(2) DEFAULT NULL COMMENT '补充数据类型 1-数量  2-外币 3-汇兑顺益  10-匹配度',
  `supply_mark` varchar(20) DEFAULT NULL COMMENT '注释',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_CODE` (`supply_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='补充字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_zd`
--

DROP TABLE IF EXISTS `sys_zd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_zd` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `CODE` varchar(6) NOT NULL COMMENT '编码',
  `NAME` varchar(20) NOT NULL COMMENT '名称',
  `TYPE` varchar(20) NOT NULL COMMENT '类型',
  `DESCRIPTION` varchar(100) NOT NULL COMMENT '描述信息',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `STATUS` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态: 1-开启 2-禁用',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `TYPE_IDX` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_0`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_1`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_10`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_11`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_12`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_13`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_14`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_15`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_2`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_3`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_4`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_5`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_6`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_7`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_8`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_9`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_check_list_relate_back`
--

DROP TABLE IF EXISTS `voucher_check_list_relate_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_check_list_relate_back` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT '清单id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '清单类型',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` tinyint(2) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_zn_pz_id` (`pz_id`),
  KEY `pz_zn_qd_id` (`qd_id`),
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证和清单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_copy_record`
--

DROP TABLE IF EXISTS `voucher_copy_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_copy_record` (
  `id` bigint(20) NOT NULL,
  `originId` bigint(20) NOT NULL,
  `newId` bigint(20) NOT NULL,
  `kjnd` int(11) NOT NULL,
  `kjqj` int(11) NOT NULL,
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `operator` varchar(32) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `newId_id` (`newId`,`originId`) USING BTREE,
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证复制记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_del_record`
--

DROP TABLE IF EXISTS `voucher_del_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_del_record` (
  `id` bigint(20) unsigned NOT NULL,
  `ztdm` bigint(20) NOT NULL COMMENT '账套代码',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(11) NOT NULL COMMENT '会计期间',
  `business_type` tinyint(1) NOT NULL COMMENT '业务类型 1-凭证主数据 2-凭证明细数据',
  `parent_business_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '关联上级id',
  `business_id` bigint(20) NOT NULL COMMENT '业务id',
  `business_data` blob COMMENT '业务数据',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_0`
--

DROP TABLE IF EXISTS `voucher_detail_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_1`
--

DROP TABLE IF EXISTS `voucher_detail_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_10`
--

DROP TABLE IF EXISTS `voucher_detail_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_11`
--

DROP TABLE IF EXISTS `voucher_detail_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_12`
--

DROP TABLE IF EXISTS `voucher_detail_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_13`
--

DROP TABLE IF EXISTS `voucher_detail_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_14`
--

DROP TABLE IF EXISTS `voucher_detail_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_15`
--

DROP TABLE IF EXISTS `voucher_detail_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_16`
--

DROP TABLE IF EXISTS `voucher_detail_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_16` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_17`
--

DROP TABLE IF EXISTS `voucher_detail_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_17` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_18`
--

DROP TABLE IF EXISTS `voucher_detail_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_18` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_19`
--

DROP TABLE IF EXISTS `voucher_detail_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_19` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_2`
--

DROP TABLE IF EXISTS `voucher_detail_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_20`
--

DROP TABLE IF EXISTS `voucher_detail_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_20` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_21`
--

DROP TABLE IF EXISTS `voucher_detail_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_21` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_22`
--

DROP TABLE IF EXISTS `voucher_detail_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_22` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_23`
--

DROP TABLE IF EXISTS `voucher_detail_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_23` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_24`
--

DROP TABLE IF EXISTS `voucher_detail_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_24` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_25`
--

DROP TABLE IF EXISTS `voucher_detail_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_25` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_26`
--

DROP TABLE IF EXISTS `voucher_detail_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_26` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_27`
--

DROP TABLE IF EXISTS `voucher_detail_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_27` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_28`
--

DROP TABLE IF EXISTS `voucher_detail_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_28` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_29`
--

DROP TABLE IF EXISTS `voucher_detail_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_29` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_3`
--

DROP TABLE IF EXISTS `voucher_detail_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_30`
--

DROP TABLE IF EXISTS `voucher_detail_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_30` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_31`
--

DROP TABLE IF EXISTS `voucher_detail_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_31` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_4`
--

DROP TABLE IF EXISTS `voucher_detail_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_5`
--

DROP TABLE IF EXISTS `voucher_detail_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_6`
--

DROP TABLE IF EXISTS `voucher_detail_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_7`
--

DROP TABLE IF EXISTS `voucher_detail_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_8`
--

DROP TABLE IF EXISTS `voucher_detail_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_9`
--

DROP TABLE IF EXISTS `voucher_detail_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,2) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_back`
--

DROP TABLE IF EXISTS `voucher_detail_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_back` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `row` int(11) DEFAULT NULL COMMENT '行号',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `jfdfsum` decimal(20,0) DEFAULT NULL COMMENT '借方+贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(11) DEFAULT NULL COMMENT '会计期间',
  PRIMARY KEY (`id`),
  KEY `pz_mx_pzid` (`pz_id`),
  KEY `IX_ZTDM` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_count`
--

DROP TABLE IF EXISTS `voucher_detail_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_count` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pzmx_id` bigint(20) DEFAULT NULL COMMENT '凭证明细id',
  `dj` decimal(20,8) DEFAULT NULL COMMENT '单价',
  `jf` decimal(20,8) DEFAULT NULL COMMENT '借方数量',
  `df` decimal(20,8) DEFAULT NULL COMMENT '贷方数量',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  PRIMARY KEY (`id`),
  KEY `index_pzmx_sl_pzmx_id` (`pzmx_id`),
  KEY `pz_sl_pzmxid` (`pzmx_id`),
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证明细数量(数量核算使用)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_exchange`
--

DROP TABLE IF EXISTS `voucher_detail_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_exchange` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pzmx_id` bigint(20) DEFAULT NULL COMMENT '凭证细id',
  `hd_bz_id` int(10) DEFAULT NULL COMMENT '调汇币种id',
  `hd_qm_hl` decimal(20,8) DEFAULT NULL COMMENT '调汇期末汇率',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  PRIMARY KEY (`id`),
  KEY `pz_hdsy_pzmxid` (`pzmx_id`),
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证明细汇兑损益';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_foreign`
--

DROP TABLE IF EXISTS `voucher_detail_foreign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_foreign` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pzmx_id` bigint(20) DEFAULT NULL COMMENT '凭证明细id',
  `bz_id` int(10) DEFAULT NULL COMMENT '币种id',
  `hl` decimal(18,8) DEFAULT NULL COMMENT '汇率',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  PRIMARY KEY (`id`),
  KEY `index_pzmx_wb_pzmx_id` (`pzmx_id`),
  KEY `pz_wb_pzmxid` (`pzmx_id`),
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证明细外币数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_fzhs`
--

DROP TABLE IF EXISTS `voucher_detail_fzhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_fzhs` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pzx_id` bigint(20) DEFAULT NULL COMMENT '凭证细id',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(10) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(10) DEFAULT NULL COMMENT '会计期间',
  `fzhs_id` bigint(20) DEFAULT NULL COMMENT '辅助核算项id',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目id',
  `jf` decimal(20,2) DEFAULT NULL COMMENT '借方',
  `df` decimal(20,2) DEFAULT NULL COMMENT '贷方',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjqj_kmid_fzhsid` (`ztdm`,`kjqj`,`km_id`,`fzhs_id`) USING BTREE,
  KEY `Index_pzxid` (`pzx_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅助核算明细项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_history`
--

DROP TABLE IF EXISTS `voucher_detail_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_history` (
  `id` bigint(50) NOT NULL COMMENT '历史凭证细ID',
  `pz_id` bigint(50) NOT NULL COMMENT '凭证ID',
  `zy` varchar(255) NOT NULL COMMENT '摘要',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额-本位币',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额-本位币',
  `kmbm` varchar(64) DEFAULT NULL,
  `kmmc` varchar(100) DEFAULT NULL COMMENT '科目名称',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `jfdfsum` decimal(18,0) DEFAULT NULL COMMENT '借方和贷方之和',
  PRIMARY KEY (`id`),
  KEY `IDX_PZID` (`pz_id`),
  KEY `Index_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_history_foreign`
--

DROP TABLE IF EXISTS `voucher_detail_history_foreign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_history_foreign` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pzmx_id` bigint(20) DEFAULT NULL COMMENT '凭证明细id',
  `bz_id` int(10) DEFAULT NULL COMMENT '币种id',
  `hl` decimal(18,2) DEFAULT NULL COMMENT '汇率',
  `jf` decimal(18,2) DEFAULT NULL COMMENT '借方金额',
  `df` decimal(18,2) DEFAULT NULL COMMENT '贷方金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_pzmx_wb_pzmx_id` (`pzmx_id`) USING BTREE,
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_match`
--

DROP TABLE IF EXISTS `voucher_detail_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_match` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pzmx_id` bigint(20) DEFAULT NULL COMMENT '凭证细id',
  `ppd` decimal(3,2) DEFAULT NULL COMMENT '匹配度',
  PRIMARY KEY (`id`),
  KEY `pz_ppd_pzmxid` (`pzmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证明细匹配度';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_detail_supply`
--

DROP TABLE IF EXISTS `voucher_detail_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_detail_supply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `voucher_detail_id` bigint(20) DEFAULT NULL COMMENT '凭证明细id',
  `supply_type` char(2) DEFAULT NULL COMMENT '补充数据类型 1-数量  2-外币 3-汇兑顺益  10-匹配度',
  `supply_code` varchar(10) DEFAULT NULL COMMENT '码',
  `supply_value` varchar(20) DEFAULT NULL COMMENT '值',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证明细补充表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_habit_config`
--

DROP TABLE IF EXISTS `voucher_habit_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_habit_config` (
  `id` bigint(20) NOT NULL,
  `ztdm` bigint(20) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `habit` varchar(20) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_history`
--

DROP TABLE IF EXISTS `voucher_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_history` (
  `id` bigint(20) NOT NULL COMMENT '临时凭证id',
  `ztdm` bigint(20) NOT NULL COMMENT '账套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(11) NOT NULL COMMENT '会计年度',
  `kjqj` int(11) NOT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `pzz` varchar(20) NOT NULL COMMENT '凭证字',
  `cjrq` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `fhr` varchar(32) DEFAULT NULL COMMENT '复核人',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `zzr` varchar(32) DEFAULT NULL COMMENT '制证人',
  `total` decimal(20,2) DEFAULT NULL COMMENT '凭证明细总金额',
  PRIMARY KEY (`id`),
  KEY `index_1` (`ztdm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史凭证主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_0`
--

DROP TABLE IF EXISTS `voucher_info_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_1`
--

DROP TABLE IF EXISTS `voucher_info_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_10`
--

DROP TABLE IF EXISTS `voucher_info_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_11`
--

DROP TABLE IF EXISTS `voucher_info_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_12`
--

DROP TABLE IF EXISTS `voucher_info_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_13`
--

DROP TABLE IF EXISTS `voucher_info_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_14`
--

DROP TABLE IF EXISTS `voucher_info_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_15`
--

DROP TABLE IF EXISTS `voucher_info_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_2`
--

DROP TABLE IF EXISTS `voucher_info_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_3`
--

DROP TABLE IF EXISTS `voucher_info_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_4`
--

DROP TABLE IF EXISTS `voucher_info_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_5`
--

DROP TABLE IF EXISTS `voucher_info_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_6`
--

DROP TABLE IF EXISTS `voucher_info_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_7`
--

DROP TABLE IF EXISTS `voucher_info_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_8`
--

DROP TABLE IF EXISTS `voucher_info_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_9`
--

DROP TABLE IF EXISTS `voucher_info_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_info_back`
--

DROP TABLE IF EXISTS `voucher_info_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_info_back` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '帐套代码',
  `zzrq` timestamp NULL DEFAULT NULL COMMENT '制证日期',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `lsh` int(11) DEFAULT NULL COMMENT '流水号',
  `zt` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `zje` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `fjs` int(11) DEFAULT NULL COMMENT '附件数',
  `pzz` int(1) DEFAULT NULL COMMENT '凭证字',
  `ly` varchar(10) DEFAULT NULL COMMENT '来源',
  `bbh` bigint(20) DEFAULT NULL COMMENT '版本号',
  `zzr` varchar(50) DEFAULT NULL COMMENT '制证人',
  `jlrq` timestamp NULL DEFAULT NULL COMMENT '记录日期',
  `xgr` varchar(50) DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `fhr` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhrq` timestamp NULL DEFAULT NULL COMMENT '复核日期',
  `kprq` timestamp NULL DEFAULT NULL COMMENT '开票日期',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证主表数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_merge_qddz_his`
--

DROP TABLE IF EXISTS `voucher_merge_qddz_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_merge_qddz_his` (
  `id` bigint(20) NOT NULL,
  `pz_id` bigint(20) DEFAULT NULL COMMENT 'id',
  `old_pz_id` bigint(11) DEFAULT NULL COMMENT 'id',
  `qd_id` bigint(20) DEFAULT NULL COMMENT 'id',
  `qd_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ztdm` bigint(20) DEFAULT NULL,
  `kjnd` int(4) DEFAULT NULL,
  `kjqj` tinyint(2) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` bigint(20) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pz_zn_pz_id` (`pz_id`) USING BTREE,
  KEY `pz_zn_qd_id` (`qd_id`) USING BTREE,
  KEY `pz_zn_ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_merge_record`
--

DROP TABLE IF EXISTS `voucher_merge_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_merge_record` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `origin_id` bigint(20) DEFAULT NULL,
  `merge_id` bigint(20) DEFAULT NULL,
  `ztdm` bigint(20) DEFAULT NULL,
  `kjnd` int(11) DEFAULT NULL,
  `kjqj` tinyint(4) DEFAULT NULL,
  `ly` varchar(20) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_times` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ztdm_merge_id_originid` (`ztdm`,`merge_id`,`origin_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合并凭证记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_model`
--

DROP TABLE IF EXISTS `voucher_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_model` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `type_id` bigint(20) DEFAULT NULL COMMENT '模板类型id',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(11) DEFAULT NULL COMMENT '会计年度',
  `model_name` varchar(128) DEFAULT NULL COMMENT '模板名称',
  `model_zt` int(11) DEFAULT NULL COMMENT '模板状态 0:停用 1:正常',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '删除标志',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_user` varchar(128) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(128) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `pz_model_ztdm_kjnd_typeid` (`ztdm`,`kjnd`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_model_split_record`
--

DROP TABLE IF EXISTS `voucher_model_split_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_model_split_record` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `model_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `zy` varchar(500) DEFAULT NULL COMMENT '摘要',
  `km_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`),
  KEY `pz_model_modelid` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证模板分录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_model_type`
--

DROP TABLE IF EXISTS `voucher_model_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_model_type` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) NOT NULL COMMENT '账套代码',
  `type_name` varchar(128) DEFAULT NULL COMMENT '分类名称',
  `type_sx` int(11) DEFAULT NULL COMMENT '分类属性 0:系统 1:自定义',
  `type_hylx` int(11) DEFAULT NULL COMMENT '行业类型 预留',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '删除标志',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pz_model_type_ztdm` (`ztdm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证模板类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_red_rush`
--

DROP TABLE IF EXISTS `voucher_red_rush`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_red_rush` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `hc_pz_id` bigint(20) DEFAULT NULL COMMENT '红冲凭证id',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `czr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `czsj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `xgr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `xgsj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `pz_id` (`pz_id`) USING BTREE,
  KEY `hc_pz_id` (`hc_pz_id`) USING BTREE,
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证红冲表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_xjll_fp`
--

DROP TABLE IF EXISTS `voucher_xjll_fp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_xjll_fp` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证id',
  `pzx_id` bigint(20) DEFAULT NULL COMMENT '凭证细id',
  `xjlxm` varchar(255) DEFAULT NULL COMMENT '现金流项目',
  `lx` tinyint(2) DEFAULT NULL COMMENT '流向  1:流入 -1：流出',
  `fpje` decimal(18,2) DEFAULT NULL COMMENT '分配金额',
  `ztdm` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `kjnd` int(10) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(10) DEFAULT NULL COMMENT '会计期间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `ztdm_kjnd_kjqj` (`ztdm`,`kjnd`,`kjqj`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='凭证现金流量配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xjlxm_km_pz`
--

DROP TABLE IF EXISTS `xjlxm_km_pz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xjlxm_km_pz` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `kjhszz` int(10) DEFAULT NULL COMMENT '会计核算准则',
  `kmnm` varchar(64) DEFAULT NULL COMMENT '科目内码',
  `kmmc` varchar(255) DEFAULT NULL COMMENT '科目名称',
  `kmfx` tinyint(10) DEFAULT NULL COMMENT '借贷方向 1:借方 -1贷方',
  `xjlxm` varchar(255) DEFAULT NULL COMMENT '现金流项目',
  `xjlfx` tinyint(10) DEFAULT NULL COMMENT '现金流方向 1:流入 -1 流出',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='现金流项目与会计科目对照配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ywsj_id_type_mapping`
--

DROP TABLE IF EXISTS `ywsj_id_type_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ywsj_id_type_mapping` (
  `ID` bigint(20) NOT NULL,
  `NEW_YWSJ_ID` bigint(20) DEFAULT NULL,
  `OLD_YWSJ_ID` bigint(20) DEFAULT NULL,
  `YWSJTYPE` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `ZTDM` bigint(20) DEFAULT NULL,
  `KJND` int(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ztdm_kjnd` (`ZTDM`,`KJND`),
  KEY `old_ywsj_id_index` (`OLD_YWSJ_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zt_cj`
--

DROP TABLE IF EXISTS `zt_cj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_cj` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `ZT_LEVEL_INDEX` int(11) NOT NULL COMMENT '层级索引',
  `ZT_LEVEL_VALUE` int(11) NOT NULL COMMENT '层级长度',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `zt_cj_ZTDM_index` (`ZTDM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套层级信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zt_his_ext_xx`
--

DROP TABLE IF EXISTS `zt_his_ext_xx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_his_ext_xx` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ztdm` bigint(20) NOT NULL COMMENT '账套代码',
  `his_kjnd` int(11) NOT NULL COMMENT '历史启用年度',
  `his_kjqj` int(11) NOT NULL COMMENT '历史启用期间',
  `lszq_flag` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用历史期间 0不启用 1启用 默认0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`id`),
  KEY `ztdm` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zt_qjzt`
--

DROP TABLE IF EXISTS `zt_qjzt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_qjzt` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZT` int(1) NOT NULL COMMENT '期间状态: 0-未启用 1-已开启 9已结账',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `NDJZ` int(1) DEFAULT NULL COMMENT '年度结转中-1，已结账-9',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KJQJ_INDEX` (`ZTDM`,`KJND`,`KJQJ`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套期间状态信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zt_xx`
--

DROP TABLE IF EXISTS `zt_xx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_xx` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `QYID` bigint(20) NOT NULL COMMENT '企业ID',
  `NAME` varchar(127) DEFAULT NULL COMMENT '账套名称',
  `KJHSZZ` int(11) DEFAULT NULL COMMENT '会计核算准则',
  `ZT_START_YEAR` int(4) DEFAULT NULL COMMENT '账套启用年度',
  `ZT_START_MONTH` int(2) DEFAULT NULL COMMENT '账套启用月份',
  `BZID` int(11) DEFAULT NULL COMMENT '币种ID',
  `SYS_START_YEAR` int(4) DEFAULT NULL COMMENT '系统启用年度',
  `SYS_START_MONTH` int(2) DEFAULT NULL COMMENT '系统启用月份',
  `SFCFL` int(1) NOT NULL DEFAULT '1' COMMENT '是否重分类: 0-不重分类 1-全部重分类 2-部分重分类',
  `HYID` int(11) DEFAULT NULL COMMENT '行业编码;对应公司的行业类型编码',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `STATUS` tinyint(1) DEFAULT NULL COMMENT '账套代码状态 0-未启用 1-启用',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `zt_xx_ZTDM_uindex` (`ZTDM`),
  KEY `zt_xx_QYID_uindex` (`QYID`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zt_zt`
--

DROP TABLE IF EXISTS `zt_zt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_zt` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `INIT_STATUS` tinyint(4) NOT NULL DEFAULT '0' COMMENT '初始化状态: 0-未初始化 1-科目初始化 2-确认数据 9-财务初始化完成',
  `NEED_INIT_FLAG` tinyint(4) NOT NULL DEFAULT '1' COMMENT '无需初始化状态: 0-无需初始化 1-需要初始化',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNI_ZTDM` (`ZTDM`),
  KEY `ZTDM_INDEX` (`ZTDM`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套状态信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_diff`
--

DROP TABLE IF EXISTS `ztkm_diff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_diff` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `SFMJ` int(11) DEFAULT NULL COMMENT '是否末级: 1-是 0-否',
  `GNID` varchar(244) DEFAULT NULL COMMENT '功能ID',
  `TYPE` int(2) NOT NULL COMMENT '匹配类型',
  `ye` decimal(20,8) DEFAULT NULL,
  `BWBYE` decimal(18,2) DEFAULT '0.00' COMMENT '本位币余额',
  `YEFX` int(2) DEFAULT NULL COMMENT '余额方向',
  `NEXT_ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `NEXT_TYPE` int(2) DEFAULT NULL COMMENT '匹配类型',
  `NEXT_GNID` varchar(244) DEFAULT NULL COMMENT '功能ID',
  `STATUS` int(2) NOT NULL COMMENT '匹配类型',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `REL_STATUS` int(2) DEFAULT NULL COMMENT '匹配类型',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目差异表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_0`
--

DROP TABLE IF EXISTS `ztkm_dz_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_0` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_1`
--

DROP TABLE IF EXISTS `ztkm_dz_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_1` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_10`
--

DROP TABLE IF EXISTS `ztkm_dz_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_10` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_11`
--

DROP TABLE IF EXISTS `ztkm_dz_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_11` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_12`
--

DROP TABLE IF EXISTS `ztkm_dz_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_12` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_13`
--

DROP TABLE IF EXISTS `ztkm_dz_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_13` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_14`
--

DROP TABLE IF EXISTS `ztkm_dz_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_14` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_15`
--

DROP TABLE IF EXISTS `ztkm_dz_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_15` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_2`
--

DROP TABLE IF EXISTS `ztkm_dz_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_2` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_3`
--

DROP TABLE IF EXISTS `ztkm_dz_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_3` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_4`
--

DROP TABLE IF EXISTS `ztkm_dz_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_4` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_5`
--

DROP TABLE IF EXISTS `ztkm_dz_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_5` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_6`
--

DROP TABLE IF EXISTS `ztkm_dz_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_6` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_7`
--

DROP TABLE IF EXISTS `ztkm_dz_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_7` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_8`
--

DROP TABLE IF EXISTS `ztkm_dz_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_8` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_9`
--

DROP TABLE IF EXISTS `ztkm_dz_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_9` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_bak`
--

DROP TABLE IF EXISTS `ztkm_dz_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_bak` (
  `ID` bigint(20) NOT NULL COMMENT '对照ID(供其他模块使用)',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `XSZ` varchar(255) DEFAULT NULL COMMENT '显示值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `MXKM` int(1) DEFAULT NULL COMMENT '是否明细科目 0；否，1：是',
  PRIMARY KEY (`ID`),
  KEY `ztkm_dz_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目对照信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_dz_rel`
--

DROP TABLE IF EXISTS `ztkm_dz_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_dz_rel` (
  `ID` bigint(20) NOT NULL COMMENT '唯一ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `REL_ID` bigint(20) DEFAULT NULL COMMENT '关联ID',
  `ZTKM_DZ_ID` bigint(20) DEFAULT NULL COMMENT '对照ID',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `REL_ID_INDEX` (`REL_ID`),
  KEY `ZTKM_DZ_ID_INDEX` (`ZTKM_DZ_ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目对照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_fzhs`
--

DROP TABLE IF EXISTS `ztkm_fzhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_fzhs` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `ZTKM_DZ_ID` bigint(20) DEFAULT NULL COMMENT '科目对照ID',
  `FZLX_CODE` varchar(6) DEFAULT NULL COMMENT '辅助类型',
  `REFERENCE_ID` bigint(20) DEFAULT NULL COMMENT '辅助项关联ID',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_fzhs_REFERENCE_ID_index` (`REFERENCE_ID`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `ZTKM_DZ_ID_INDEX` (`ZTKM_DZ_ID`),
  KEY `ZTDM_KJND_FZLX_CODE` (`ZTDM`,`KJND`,`FZLX_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目辅助核算信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_fzhs_rel`
--

DROP TABLE IF EXISTS `ztkm_fzhs_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_fzhs_rel` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `YWSJ_ID` bigint(20) DEFAULT NULL COMMENT '业务数据ID',
  `FZLX_CODE` varchar(8) DEFAULT NULL COMMENT '辅助类型',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `CSH_BNLJ_JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '初始化本年累计借方',
  `CSH_BNLJ_DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '初始化本年累计贷方',
  `NC_JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '年初借方',
  `NC_DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '年初借方',
  `CSH_SL_BNLJ_JF` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `CSH_SL_BNLJ_DF` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `nc_sl_jf` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `nc_sl_df` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `MC` varchar(255) DEFAULT NULL COMMENT '名称',
  `rel_id` bigint(20) DEFAULT NULL COMMENT '组合辅助核算类型id',
  PRIMARY KEY (`ID`),
  KEY `YWSJ_ID_INDEX` (`YWSJ_ID`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `ZTDM_KJND_FZLX_CODE_INDEX` (`ZTDM`,`KJND`,`FZLX_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目辅助核算关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_fzhs_wb_rel`
--

DROP TABLE IF EXISTS `ztkm_fzhs_wb_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_fzhs_wb_rel` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目ID',
  `YWSJ_ID` bigint(20) DEFAULT NULL COMMENT '业务数据ID',
  `REL_ID` bigint(20) DEFAULT NULL COMMENT '组合辅助核算类型id',
  `MC` varchar(255) DEFAULT NULL COMMENT '名称',
  `FZLX_CODE` varchar(8) DEFAULT NULL COMMENT '辅助类型',
  `BZID` int(11) DEFAULT NULL COMMENT '币种',
  `CSH_BNLJ_JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '初始化本年累计借方-综合本位币',
  `CSH_BNLJ_DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '初始化本年累计贷方-综合本位币',
  `NC_JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '年初借方-综合本位币',
  `NC_DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '年初借方-综合本位币',
  `CSH_BNLJ_JF_WB` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '初始化本年累计借方-外币',
  `CSH_BNLJ_DF_WB` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '初始化本年累计贷方-外币',
  `NC_JF_WB` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '年初借方-外币',
  `NC_DF_WB` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '年初借方-外币',
  `CSH_SL_BNLJ_JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '初始化本年数量累计借方',
  `CSH_SL_BNLJ_DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '初始化本年数量累计贷方',
  `NC_SL_JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '数量年初借方',
  `NC_SL_DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '数量年初借方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_YWSJ_ID_INDEX` (`ZTDM`,`YWSJ_ID`),
  KEY `ZTDM_ZTKM_ID_INDEX` (`ZTDM`,`ZTKM_ID`),
  KEY `ZTDM_KJND_FZLX_CODE_INDEX` (`ZTDM`,`KJND`,`FZLX_CODE`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目辅助核算外币关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_fzhslx`
--

DROP TABLE IF EXISTS `ztkm_fzhslx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_fzhslx` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) DEFAULT NULL COMMENT '账套科目id',
  `FZLX_CODE` varchar(8) DEFAULT NULL COMMENT '辅助类型',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目启用辅助核算类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_0`
--

DROP TABLE IF EXISTS `ztkm_gn_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_0` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_1`
--

DROP TABLE IF EXISTS `ztkm_gn_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_1` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_10`
--

DROP TABLE IF EXISTS `ztkm_gn_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_10` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_11`
--

DROP TABLE IF EXISTS `ztkm_gn_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_11` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_12`
--

DROP TABLE IF EXISTS `ztkm_gn_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_12` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_13`
--

DROP TABLE IF EXISTS `ztkm_gn_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_13` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_14`
--

DROP TABLE IF EXISTS `ztkm_gn_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_14` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_15`
--

DROP TABLE IF EXISTS `ztkm_gn_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_15` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_16`
--

DROP TABLE IF EXISTS `ztkm_gn_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_16` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_17`
--

DROP TABLE IF EXISTS `ztkm_gn_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_17` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_18`
--

DROP TABLE IF EXISTS `ztkm_gn_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_18` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_19`
--

DROP TABLE IF EXISTS `ztkm_gn_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_19` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_2`
--

DROP TABLE IF EXISTS `ztkm_gn_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_2` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_20`
--

DROP TABLE IF EXISTS `ztkm_gn_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_20` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_21`
--

DROP TABLE IF EXISTS `ztkm_gn_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_21` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_22`
--

DROP TABLE IF EXISTS `ztkm_gn_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_22` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_23`
--

DROP TABLE IF EXISTS `ztkm_gn_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_23` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_24`
--

DROP TABLE IF EXISTS `ztkm_gn_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_24` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_25`
--

DROP TABLE IF EXISTS `ztkm_gn_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_25` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_26`
--

DROP TABLE IF EXISTS `ztkm_gn_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_26` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_27`
--

DROP TABLE IF EXISTS `ztkm_gn_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_27` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_28`
--

DROP TABLE IF EXISTS `ztkm_gn_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_28` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_29`
--

DROP TABLE IF EXISTS `ztkm_gn_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_29` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_3`
--

DROP TABLE IF EXISTS `ztkm_gn_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_3` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_30`
--

DROP TABLE IF EXISTS `ztkm_gn_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_30` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_31`
--

DROP TABLE IF EXISTS `ztkm_gn_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_31` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_4`
--

DROP TABLE IF EXISTS `ztkm_gn_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_4` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_5`
--

DROP TABLE IF EXISTS `ztkm_gn_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_5` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_6`
--

DROP TABLE IF EXISTS `ztkm_gn_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_6` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_7`
--

DROP TABLE IF EXISTS `ztkm_gn_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_7` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_8`
--

DROP TABLE IF EXISTS `ztkm_gn_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_8` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_gn_9`
--

DROP TABLE IF EXISTS `ztkm_gn_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_gn_9` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMYE` int(2) DEFAULT '1' COMMENT '科目余额状态: 1-开启 0-关闭',
  `SLHS` int(2) DEFAULT '0' COMMENT '数量核算状态: 1-开启 0-关闭',
  `WBHS` int(2) DEFAULT '0' COMMENT '外币核算状态: 1-开启 0-关闭',
  `QMTH` int(2) DEFAULT '0' COMMENT '期末调汇状态: 1-开启 0-关闭',
  `FZHS` int(2) DEFAULT '0' COMMENT '辅助核算状态: 1-开启 0-关闭',
  `CHHS` int(2) DEFAULT '0' COMMENT '存货核算状态: 1-开启 0-关闭',
  `YWGN1` int(2) DEFAULT '0' COMMENT '扩展1状态: 1-开启 0-关闭',
  `YWGN2` int(2) DEFAULT '0' COMMENT '扩展2状态: 1-开启 0-关闭',
  `YWGN3` int(2) DEFAULT '0' COMMENT '扩展3状态: 1-开启 0-关闭',
  `YWGN4` int(2) DEFAULT '0' COMMENT '扩展4状态: 1-开启 0-关闭',
  `YWGN5` int(2) DEFAULT '0' COMMENT '扩展5状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目业务功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_0`
--

DROP TABLE IF EXISTS `ztkm_kmye_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_0` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_1`
--

DROP TABLE IF EXISTS `ztkm_kmye_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_1` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_10`
--

DROP TABLE IF EXISTS `ztkm_kmye_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_10` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_11`
--

DROP TABLE IF EXISTS `ztkm_kmye_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_11` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_12`
--

DROP TABLE IF EXISTS `ztkm_kmye_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_12` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_13`
--

DROP TABLE IF EXISTS `ztkm_kmye_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_13` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_14`
--

DROP TABLE IF EXISTS `ztkm_kmye_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_14` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_15`
--

DROP TABLE IF EXISTS `ztkm_kmye_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_15` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_16`
--

DROP TABLE IF EXISTS `ztkm_kmye_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_16` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_17`
--

DROP TABLE IF EXISTS `ztkm_kmye_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_17` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_18`
--

DROP TABLE IF EXISTS `ztkm_kmye_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_18` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_19`
--

DROP TABLE IF EXISTS `ztkm_kmye_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_19` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_2`
--

DROP TABLE IF EXISTS `ztkm_kmye_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_2` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_20`
--

DROP TABLE IF EXISTS `ztkm_kmye_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_20` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_21`
--

DROP TABLE IF EXISTS `ztkm_kmye_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_21` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_22`
--

DROP TABLE IF EXISTS `ztkm_kmye_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_22` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_23`
--

DROP TABLE IF EXISTS `ztkm_kmye_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_23` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_24`
--

DROP TABLE IF EXISTS `ztkm_kmye_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_24` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_25`
--

DROP TABLE IF EXISTS `ztkm_kmye_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_25` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_26`
--

DROP TABLE IF EXISTS `ztkm_kmye_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_26` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_27`
--

DROP TABLE IF EXISTS `ztkm_kmye_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_27` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_28`
--

DROP TABLE IF EXISTS `ztkm_kmye_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_28` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_29`
--

DROP TABLE IF EXISTS `ztkm_kmye_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_29` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_3`
--

DROP TABLE IF EXISTS `ztkm_kmye_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_3` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_30`
--

DROP TABLE IF EXISTS `ztkm_kmye_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_30` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_31`
--

DROP TABLE IF EXISTS `ztkm_kmye_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_31` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_32`
--

DROP TABLE IF EXISTS `ztkm_kmye_32`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_32` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_33`
--

DROP TABLE IF EXISTS `ztkm_kmye_33`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_33` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_34`
--

DROP TABLE IF EXISTS `ztkm_kmye_34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_34` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_35`
--

DROP TABLE IF EXISTS `ztkm_kmye_35`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_35` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_36`
--

DROP TABLE IF EXISTS `ztkm_kmye_36`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_36` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_37`
--

DROP TABLE IF EXISTS `ztkm_kmye_37`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_37` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_38`
--

DROP TABLE IF EXISTS `ztkm_kmye_38`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_38` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_39`
--

DROP TABLE IF EXISTS `ztkm_kmye_39`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_39` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_4`
--

DROP TABLE IF EXISTS `ztkm_kmye_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_4` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_40`
--

DROP TABLE IF EXISTS `ztkm_kmye_40`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_40` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_41`
--

DROP TABLE IF EXISTS `ztkm_kmye_41`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_41` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_42`
--

DROP TABLE IF EXISTS `ztkm_kmye_42`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_42` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_43`
--

DROP TABLE IF EXISTS `ztkm_kmye_43`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_43` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_44`
--

DROP TABLE IF EXISTS `ztkm_kmye_44`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_44` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_45`
--

DROP TABLE IF EXISTS `ztkm_kmye_45`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_45` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_46`
--

DROP TABLE IF EXISTS `ztkm_kmye_46`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_46` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_47`
--

DROP TABLE IF EXISTS `ztkm_kmye_47`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_47` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_48`
--

DROP TABLE IF EXISTS `ztkm_kmye_48`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_48` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_49`
--

DROP TABLE IF EXISTS `ztkm_kmye_49`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_49` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_5`
--

DROP TABLE IF EXISTS `ztkm_kmye_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_5` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_50`
--

DROP TABLE IF EXISTS `ztkm_kmye_50`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_50` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_51`
--

DROP TABLE IF EXISTS `ztkm_kmye_51`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_51` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_52`
--

DROP TABLE IF EXISTS `ztkm_kmye_52`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_52` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_53`
--

DROP TABLE IF EXISTS `ztkm_kmye_53`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_53` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_54`
--

DROP TABLE IF EXISTS `ztkm_kmye_54`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_54` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_55`
--

DROP TABLE IF EXISTS `ztkm_kmye_55`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_55` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_56`
--

DROP TABLE IF EXISTS `ztkm_kmye_56`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_56` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_57`
--

DROP TABLE IF EXISTS `ztkm_kmye_57`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_57` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_58`
--

DROP TABLE IF EXISTS `ztkm_kmye_58`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_58` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_59`
--

DROP TABLE IF EXISTS `ztkm_kmye_59`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_59` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_6`
--

DROP TABLE IF EXISTS `ztkm_kmye_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_6` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_60`
--

DROP TABLE IF EXISTS `ztkm_kmye_60`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_60` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_61`
--

DROP TABLE IF EXISTS `ztkm_kmye_61`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_61` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_62`
--

DROP TABLE IF EXISTS `ztkm_kmye_62`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_62` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_63`
--

DROP TABLE IF EXISTS `ztkm_kmye_63`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_63` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_7`
--

DROP TABLE IF EXISTS `ztkm_kmye_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_7` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_8`
--

DROP TABLE IF EXISTS `ztkm_kmye_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_8` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_9`
--

DROP TABLE IF EXISTS `ztkm_kmye_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_9` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_kmye_bak`
--

DROP TABLE IF EXISTS `ztkm_kmye_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_kmye_bak` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_kmye_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_kmye_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_0`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_0` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_1`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_1` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_10`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_10` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_11`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_11` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_12`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_12` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_13`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_13` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_14`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_14` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_15`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_15` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_2`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_2` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_3`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_3` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_4`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_4` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_5`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_5` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_6`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_6` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_7`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_7` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_8`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_8` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_9`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_9` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_nm_bq_rel_bak`
--

DROP TABLE IF EXISTS `ztkm_nm_bq_rel_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_nm_bq_rel_bak` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `KMNM` varchar(64) NOT NULL COMMENT '科目内码，上级科目内码和本级科目内码拼接而成',
  `KMNM_BASE` varchar(64) NOT NULL COMMENT '本级科目内码, 例如当前科目层级为2，科目内码为 10010003，本级内码为0003',
  `KMBQ` varchar(10) DEFAULT NULL COMMENT '科目标签',
  `KMBQPPD` decimal(6,4) DEFAULT NULL COMMENT '科目标签匹配度',
  `KMNDBQ` varchar(244) DEFAULT NULL COMMENT '科目年度标签：如果是年结过来的科目为，上一年度kmid',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `KMBQ_STATUS` tinyint(1) DEFAULT '0' COMMENT '科目标签匹配状态：0-默认，1-匹配，2-未匹配，3-忽略',
  `DEL_FLAG` tinyint(1) DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_INDEX` (`ZTDM`,`KJND`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `KMNM_IDX` (`KMNM`),
  KEY `KMBQ_IDX` (`KMBQ`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目编码和内码关系映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_slhs`
--

DROP TABLE IF EXISTS `ztkm_slhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_slhs` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `SLHSDW` varchar(50) DEFAULT NULL COMMENT '数量核算单位',
  `JF` decimal(50,8) DEFAULT NULL COMMENT '借方',
  `DF` decimal(50,8) DEFAULT NULL COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_slhs_ZTDM_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_slhs_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目数量核算信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_wbkmye`
--

DROP TABLE IF EXISTS `ztkm_wbkmye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_wbkmye` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(4) NOT NULL COMMENT '会计期间',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `BZID` int(11) DEFAULT NULL COMMENT '币种',
  `BWBJF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '本位币借方',
  `BWBDF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '本位币贷方',
  `JF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '借方',
  `DF` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '贷方',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ztkm_wbkmye_ZTDM_KJND_ZTKM_ID_KJQJ_index` (`ZTDM`,`KJND`,`ZTKM_ID`,`KJQJ`),
  KEY `ztkm_wbkmye_ZTKM_ID_index` (`ZTKM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目外币科目余额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_wbqy`
--

DROP TABLE IF EXISTS `ztkm_wbqy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_wbqy` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `BZID` int(11) DEFAULT NULL COMMENT '币种ID',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`DEL_FLAG`),
  KEY `ZTKM_ID_INDEX` (`ZTKM_ID`),
  KEY `ZTDM_KJND_ZTKM_ID_IDX` (`ZTDM`,`KJND`,`ZTKM_ID`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目外币启用信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xjllcsz`
--

DROP TABLE IF EXISTS `ztkm_xjllcsz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xjllcsz` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `KJQJ` int(4) DEFAULT NULL COMMENT '会计期间',
  `WZBM` varchar(100) DEFAULT NULL COMMENT '位置编码',
  `HC` varchar(20) DEFAULT NULL COMMENT '行次',
  `ROW` int(4) DEFAULT NULL COMMENT '行下标',
  `COL` int(4) DEFAULT NULL COMMENT '列下标',
  `VALUE` decimal(18,8) DEFAULT NULL COMMENT '值',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_INDEX` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目现金流量初始值信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_0`
--

DROP TABLE IF EXISTS `ztkm_xx_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_0` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_1`
--

DROP TABLE IF EXISTS `ztkm_xx_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_1` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_10`
--

DROP TABLE IF EXISTS `ztkm_xx_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_10` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_11`
--

DROP TABLE IF EXISTS `ztkm_xx_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_11` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_12`
--

DROP TABLE IF EXISTS `ztkm_xx_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_12` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_13`
--

DROP TABLE IF EXISTS `ztkm_xx_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_13` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_14`
--

DROP TABLE IF EXISTS `ztkm_xx_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_14` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_15`
--

DROP TABLE IF EXISTS `ztkm_xx_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_15` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_2`
--

DROP TABLE IF EXISTS `ztkm_xx_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_2` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_3`
--

DROP TABLE IF EXISTS `ztkm_xx_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_3` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_4`
--

DROP TABLE IF EXISTS `ztkm_xx_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_4` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_5`
--

DROP TABLE IF EXISTS `ztkm_xx_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_5` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_6`
--

DROP TABLE IF EXISTS `ztkm_xx_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_6` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_7`
--

DROP TABLE IF EXISTS `ztkm_xx_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_7` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_8`
--

DROP TABLE IF EXISTS `ztkm_xx_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_8` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_9`
--

DROP TABLE IF EXISTS `ztkm_xx_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_9` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_xx_bak`
--

DROP TABLE IF EXISTS `ztkm_xx_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_xx_bak` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KMBM` varchar(100) NOT NULL COMMENT '科目编码',
  `SJKMBM` varchar(100) DEFAULT NULL COMMENT '上级科目编码',
  `KMMC` varchar(255) NOT NULL COMMENT '科目名称',
  `KMQC` varchar(255) NOT NULL COMMENT '科目全称',
  `KMFX` int(11) NOT NULL COMMENT '科目方向: 1-借 -1-贷',
  `KMCJ` int(11) DEFAULT '1' COMMENT '科目层级',
  `SFMJ` int(11) DEFAULT '1' COMMENT '是否末级: 1-是 0-否',
  `KMZT` int(11) DEFAULT '1' COMMENT '科目状态: 1-正常 2-冻结 3-删除',
  `KMLX` char(1) DEFAULT NULL COMMENT '科目类型',
  `SFFZHS` int(11) NOT NULL DEFAULT '0' COMMENT '是否辅助核算生成的科目',
  `SFSGPZKSY` char(1) DEFAULT NULL COMMENT '是否手工凭证可使用科目: 1-是 2-否',
  `KMSM` varchar(1024) DEFAULT NULL COMMENT '科目说明',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `ZTDM_KJND_KMBM_DEL_FLAG_INDEX` (`ZTDM`,`KJND`,`KMBM`,`DEL_FLAG`),
  KEY `ZTDM_KJND_KMQC_IDX` (`ZTDM`,`KJND`,`KMQC`),
  KEY `ZTDM_KJND_SJKMBM_IDX` (`ZTDM`,`KJND`,`SJKMBM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_0`
--

DROP TABLE IF EXISTS `ztkm_ywgn_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_0` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_1`
--

DROP TABLE IF EXISTS `ztkm_ywgn_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_1` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_10`
--

DROP TABLE IF EXISTS `ztkm_ywgn_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_10` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_11`
--

DROP TABLE IF EXISTS `ztkm_ywgn_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_11` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_12`
--

DROP TABLE IF EXISTS `ztkm_ywgn_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_12` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_13`
--

DROP TABLE IF EXISTS `ztkm_ywgn_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_13` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_14`
--

DROP TABLE IF EXISTS `ztkm_ywgn_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_14` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_15`
--

DROP TABLE IF EXISTS `ztkm_ywgn_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_15` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_16`
--

DROP TABLE IF EXISTS `ztkm_ywgn_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_16` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_17`
--

DROP TABLE IF EXISTS `ztkm_ywgn_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_17` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_18`
--

DROP TABLE IF EXISTS `ztkm_ywgn_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_18` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_19`
--

DROP TABLE IF EXISTS `ztkm_ywgn_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_19` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_2`
--

DROP TABLE IF EXISTS `ztkm_ywgn_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_2` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_20`
--

DROP TABLE IF EXISTS `ztkm_ywgn_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_20` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_21`
--

DROP TABLE IF EXISTS `ztkm_ywgn_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_21` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_22`
--

DROP TABLE IF EXISTS `ztkm_ywgn_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_22` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_23`
--

DROP TABLE IF EXISTS `ztkm_ywgn_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_23` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_24`
--

DROP TABLE IF EXISTS `ztkm_ywgn_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_24` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_25`
--

DROP TABLE IF EXISTS `ztkm_ywgn_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_25` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_26`
--

DROP TABLE IF EXISTS `ztkm_ywgn_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_26` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_27`
--

DROP TABLE IF EXISTS `ztkm_ywgn_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_27` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_28`
--

DROP TABLE IF EXISTS `ztkm_ywgn_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_28` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_29`
--

DROP TABLE IF EXISTS `ztkm_ywgn_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_29` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_3`
--

DROP TABLE IF EXISTS `ztkm_ywgn_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_3` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_30`
--

DROP TABLE IF EXISTS `ztkm_ywgn_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_30` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_31`
--

DROP TABLE IF EXISTS `ztkm_ywgn_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_31` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_4`
--

DROP TABLE IF EXISTS `ztkm_ywgn_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_4` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_5`
--

DROP TABLE IF EXISTS `ztkm_ywgn_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_5` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_6`
--

DROP TABLE IF EXISTS `ztkm_ywgn_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_6` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_7`
--

DROP TABLE IF EXISTS `ztkm_ywgn_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_7` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_8`
--

DROP TABLE IF EXISTS `ztkm_ywgn_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_8` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_9`
--

DROP TABLE IF EXISTS `ztkm_ywgn_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_9` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_bak`
--

DROP TABLE IF EXISTS `ztkm_ywgn_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_bak` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_0`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_0` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_1`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_1` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_10`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_10` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_11`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_11` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_12`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_12` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_13`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_13` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_14`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_14` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_15`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_15` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_16`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_16` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_17`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_17` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_18`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_18` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_19`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_19` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_2`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_2` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_20`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_20` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_21`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_21` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_22`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_22` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_23`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_23` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_24`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_24` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_25`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_25` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_26`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_26` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_27`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_27` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_28`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_28` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_29`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_29` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_3`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_3` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_30`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_30` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_31`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_31` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_4`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_4` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_5`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_5` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_6`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_6` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_7`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_7` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_8`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_8` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ztkm_ywgn_log_9`
--

DROP TABLE IF EXISTS `ztkm_ywgn_log_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztkm_ywgn_log_9` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `ZTKM_ID` bigint(20) NOT NULL COMMENT '账套科目ID',
  `GNLX` varchar(20) NOT NULL COMMENT '功能类型',
  `GNZT` int(11) NOT NULL COMMENT '功能状态: 1-开启 0-关闭',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记: 1-删除 0-正常',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ztkm_ywgn_ZTKM_ID_GNLX_DEL_FLAG_uindex` (`ZTKM_ID`,`GNLX`,`DEL_FLAG`),
  KEY `ztkm_ywgn_ZTKM_ID_index` (`ZTKM_ID`),
  KEY `ztkm_ywgn_ZTDM_ID_index` (`ZTDM`),
  KEY `ZTDM_KJND_IDX` (`ZTDM`,`KJND`),
  KEY `idx_del_update` (`DEL_FLAG`,`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目业务功能信息';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-22 15:21:27

-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: 172.20.120.24    Database: fintax_asset
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
-- Current Database: `fintax_asset`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fintax_asset` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fintax_asset`;

--
-- Table structure for table `asset_accrual`
--

DROP TABLE IF EXISTS `asset_accrual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_accrual` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `zcid` bigint(20) NOT NULL COMMENT '对应资产id',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `jtje` decimal(18,2) DEFAULT NULL COMMENT '本月摊销额',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标记',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `zcid_index` (`zcid`) USING BTREE,
  KEY `idx_qyid` (`qyid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产计提数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_attach`
--

DROP TABLE IF EXISTS `asset_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_attach` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `zcid` bigint(20) NOT NULL COMMENT '资产id',
  `filename` varchar(200) DEFAULT NULL COMMENT '附件名称',
  `filepath` varchar(2000) DEFAULT NULL COMMENT '附件路径',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除表记',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_base_info`
--

DROP TABLE IF EXISTS `asset_base_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_base_info` (
  `id` bigint(20) NOT NULL COMMENT 'id标识',
  `iid` bigint(20) DEFAULT NULL COMMENT '资产id唯一标识',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(4) DEFAULT NULL COMMENT '会计期间',
  `name` varchar(255) DEFAULT NULL COMMENT '资产名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '资产类型(0:固定资产1:无形资产,2:长摊资产)',
  `sfid` int(3) DEFAULT NULL COMMENT '算法id',
  `zclb` int(3) DEFAULT NULL COMMENT '资产类别id',
  `remark` varchar(500) DEFAULT NULL,
  `yzje` decimal(18,2) DEFAULT NULL COMMENT '月折旧额/摊销额',
  `qcje` decimal(18,2) DEFAULT '0.00' COMMENT '期初累计折旧/摊销',
  `yz` decimal(18,2) DEFAULT NULL COMMENT '原值',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:初始化,1:正常,2:暂停,3:资产变更,4:完成)',
  `source` int(3) DEFAULT NULL COMMENT '资产来源id',
  `rzrq` date DEFAULT NULL COMMENT '入账日期',
  `yjsyyf` int(11) DEFAULT NULL COMMENT '预计使用月份',
  `ysyyf` int(11) DEFAULT '0' COMMENT '已使用月份',
  `bmid` bigint(20) DEFAULT NULL COMMENT '部门id',
  `xmgs` varchar(32) DEFAULT NULL COMMENT '项目归属',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yxqq` date DEFAULT NULL COMMENT '有效期起',
  `yxqz` date DEFAULT NULL COMMENT '有效期止',
  `htje` decimal(18,2) DEFAULT NULL COMMENT '合同金额',
  `byzje` decimal(18,2) DEFAULT NULL COMMENT '本月折旧额（新增资产当月折旧额）',
  `sfbt` tinyint(4) DEFAULT '0' COMMENT '是否补提入账日期到会计期间内的金额',
  `sfhtzc` tinyint(4) DEFAULT '0' COMMENT '是否合同资产 1：是 0：否',
  `sflszc` tinyint(4) DEFAULT '0' COMMENT '是否临时资产 1:是 0:否',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `iid` (`iid`,`yxqq`,`yxqz`),
  KEY `idx_qyid` (`qyid`) USING BTREE,
  KEY `idx_iid` (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产基础信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_change_info`
--

DROP TABLE IF EXISTS `asset_change_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_change_info` (
  `id` bigint(20) NOT NULL COMMENT '资产变动id',
  `qyid` bigint(20) DEFAULT NULL COMMENT '企业id',
  `type` int(2) NOT NULL COMMENT '资产类型(0:固定资产1:无形资产,2:长摊资产)',
  `zcid` bigint(20) NOT NULL COMMENT '变动的资产id(或科目变动的计提数据)',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(4) NOT NULL COMMENT '会计期间',
  `bdlx` tinyint(4) NOT NULL COMMENT '变动类型(0:购买,1:出售,2:毁损,3:报废)',
  `bdrq` date DEFAULT NULL COMMENT '变动日期',
  `bdfpsr` decimal(11,2) DEFAULT '0.00' COMMENT '变动发票收入',
  `bdqtsr` decimal(11,2) DEFAULT '0.00' COMMENT '变动其他收入',
  `bdsrjs` tinyint(4) DEFAULT NULL COMMENT '变动其他收入结算方式(0:现金,1:银行,2:往来)',
  `bdsrjs_sub` bigint(20) DEFAULT NULL COMMENT '收入往来结算方式科目',
  `bdsrjs_bank` varchar(255) DEFAULT NULL COMMENT '收入银行结算方式信息',
  `bdsr_remark` varchar(255) DEFAULT NULL COMMENT '变动支出备注',
  `bdfpzc` decimal(11,2) DEFAULT '0.00' COMMENT '变动发票支出',
  `bdqtzc` decimal(11,2) DEFAULT '0.00' COMMENT '变动其他支出',
  `bdzcjs` tinyint(4) DEFAULT NULL COMMENT '变动支出结算方式(0:现金,1:银行,2:往来)',
  `bdzcjs_sub` bigint(20) DEFAULT NULL COMMENT '支出往来结算方式科目',
  `bdzcjs_bank` varchar(255) DEFAULT NULL COMMENT '支出银行结算方式信息',
  `bdzc_remark` varchar(255) DEFAULT NULL COMMENT '变动支出备注',
  `jsy` decimal(11,2) DEFAULT NULL COMMENT '净损益',
  `old_value` varchar(240) DEFAULT NULL COMMENT '历史值',
  `current_value` varchar(240) DEFAULT NULL COMMENT '新值',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标记',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `bdxlx` tinyint(4) DEFAULT NULL COMMENT '变动项类型(0:购入-原值,1:出售-原值,2:出售-收入合计,3:出售-支出合计,4:报废-原值,5:报废-支出合计,6:毁损-原值,7:毁损-支出合计,8:原值变更-原值,9:原值变更-历史导入原值,10:会记估值变更-预计使用月份/摊销月份,11:会计估计变更-残值率 ,12:资产信息变更-资产名称,13:资产信息变更-数量,14:资产信息变更-资产类别,15:资产信息变更-入账日期,16:资产信息变更-折旧方法,17:资产信息变更-本月折旧额/本月摊销额,18:资产信息变更-一次性加入当前成本费用 ,19:资产信息变更-原值科目,20:资产信息变更-累计折旧科目,21:资产信息变更-成本费用科目,22:资产信息变更-历史导入累计折旧,23:资产信息变更-历史导入预计使用月份,24:资产信息变更-历史导入残值率)',
  `pzno` varchar(20) DEFAULT NULL COMMENT '凭证号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_qyid` (`qyid`) USING BTREE,
  KEY `idx_zcid` (`zcid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产变动记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_ext`
--

DROP TABLE IF EXISTS `asset_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_ext` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `base_id` bigint(20) DEFAULT NULL COMMENT '资产基础表主键',
  `code` varchar(64) DEFAULT NULL COMMENT '资产编码',
  `ggxh` varchar(64) DEFAULT NULL COMMENT '规格型号',
  `num` decimal(11,2) DEFAULT NULL COMMENT '数量',
  `ksrq` date DEFAULT NULL COMMENT '开始使用日期',
  `qcjz` decimal(18,2) DEFAULT NULL COMMENT '期初净值',
  `czl` decimal(18,8) DEFAULT NULL COMMENT '残值率',
  `jcz` decimal(18,2) DEFAULT NULL COMMENT '净残值',
  `yjjcz` decimal(18,2) DEFAULT NULL COMMENT '预计净残值',
  `jzzb` decimal(18,2) DEFAULT '0.00' COMMENT '减值准备',
  `sfyckc` tinyint(4) DEFAULT NULL COMMENT '是否一次性扣除当做成本费用 0:否 1:是',
  `sfxytx` tinyint(4) DEFAULT NULL COMMENT '是否下月开始摊销,0:否,1:是',
  `dr_yz` decimal(24,8) DEFAULT NULL,
  `dr_qcje` decimal(24,8) DEFAULT NULL,
  `dr_yjsyyf` int(11) DEFAULT '0' COMMENT '导入的预计使用月份',
  `dr_czl` decimal(18,8) DEFAULT NULL COMMENT '导入的残值率',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_base_id` (`base_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产信息扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_info_operate`
--

DROP TABLE IF EXISTS `asset_info_operate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_info_operate` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qyid` bigint(20) DEFAULT NULL COMMENT '企业id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(12) DEFAULT NULL COMMENT '会计期间',
  `zcid` bigint(20) DEFAULT NULL COMMENT '资产id',
  `type` tinyint(4) DEFAULT NULL COMMENT '变更类型(0:字段修改,1:会计估值变更-使用月份,2:会计固执变更-残值率)',
  `field` varchar(255) DEFAULT NULL COMMENT '变更的字段',
  `old_value` varchar(255) DEFAULT NULL COMMENT '原始值',
  `new_value` varchar(255) DEFAULT NULL COMMENT '修改后的值',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_km`
--

DROP TABLE IF EXISTS `asset_km`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_km` (
  `id` bigint(20) NOT NULL,
  `zcid` bigint(20) DEFAULT NULL COMMENT '资产ID',
  `qyid` bigint(20) DEFAULT NULL COMMENT '企业id',
  `kjnd` int(11) NOT NULL COMMENT '会计年度',
  `yzkm_id` bigint(20) DEFAULT NULL COMMENT '原值科目对照',
  `ljzjkm_id` bigint(20) DEFAULT NULL COMMENT '累记折旧科目对照id',
  `cbfykm_id` bigint(20) DEFAULT NULL COMMENT '成本费用科目对照ID',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_qyid` (`qyid`) USING BTREE,
  KEY `idx_zcid` (`zcid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产计提与科目关系对应表,';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_km_fzhs`
--

DROP TABLE IF EXISTS `asset_km_fzhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_km_fzhs` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `type` tinyint(4) NOT NULL COMMENT '科目类型(0:成本费用)',
  `kjnd` int(12) DEFAULT NULL COMMENT '会计年度',
  `zcid` bigint(20) DEFAULT NULL COMMENT '资产id',
  `kmdz_id` bigint(20) DEFAULT NULL COMMENT '科目对照id',
  `fzhs_id` bigint(20) DEFAULT NULL COMMENT '辅助核算id',
  `fzhs_lx` varchar(255) DEFAULT NULL COMMENT '辅助核算类型值',
  `qyid` bigint(20) DEFAULT NULL COMMENT '企业id',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_qyid` (`qyid`) USING BTREE,
  KEY `idx_zcid` (`zcid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产科目辅助核算id关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_relate`
--

DROP TABLE IF EXISTS `asset_relate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_relate` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `zcid` bigint(20) NOT NULL COMMENT '资产id',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(4) DEFAULT NULL COMMENT '会计期间',
  `mxid` bigint(20) NOT NULL COMMENT '明细id',
  `type` tinyint(4) NOT NULL COMMENT '关联业务类型(0:资产新增发票,1:资产变动收入发票,2:资产变动支出发票)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `fk_zc_fp_zc_gl` (`zcid`),
  KEY `index_zcid_qyid` (`qyid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产关联业务关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_zjzt`
--

DROP TABLE IF EXISTS `asset_zjzt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_zjzt` (
  `id` bigint(20) NOT NULL COMMENT '主键标识',
  `zcid` bigint(20) NOT NULL COMMENT '资产id',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `begin_date` date DEFAULT NULL COMMENT '暂停折旧开始时间',
  `end_date` date DEFAULT NULL COMMENT '暂停折旧结束时间',
  `reason` varchar(300) DEFAULT NULL COMMENT '暂停原因',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_zcid` (`zcid`),
  KEY `idx_qyid` (`qyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='折旧暂停记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `id_mapper`
--

DROP TABLE IF EXISTS `id_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `id_mapper` (
  `old_id` varchar(32) NOT NULL COMMENT '老代账系统id',
  `new_id` bigint(20) NOT NULL COMMENT '新代账系统id',
  `type` tinyint(4) NOT NULL COMMENT 'id业务类型(0:资产)',
  KEY `old_id_index` (`old_id`) USING BTREE,
  KEY `new_id_index` (`new_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新老系统id映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `id_mapper_2021_07_16`
--

DROP TABLE IF EXISTS `id_mapper_2021_07_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `id_mapper_2021_07_16` (
  `old_id` varchar(32) NOT NULL COMMENT '老代账系统id',
  `new_id` bigint(20) NOT NULL COMMENT '新代账系统id',
  `type` tinyint(4) NOT NULL COMMENT 'id业务类型(0:资产)',
  KEY `old_id_index` (`old_id`) USING BTREE,
  KEY `new_id_index` (`new_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新老系统id映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zc_bd`
--

DROP TABLE IF EXISTS `zc_bd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_bd` (
  `id` bigint(20) NOT NULL COMMENT '资产变动id',
  `qyid` bigint(20) DEFAULT NULL COMMENT '企业id',
  `zclx` int(2) NOT NULL COMMENT '资产类型',
  `zcid` bigint(20) NOT NULL COMMENT '变动的资产id(或科目变动的计提数据)',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(4) NOT NULL COMMENT '会计期间',
  `bdlx` int(10) NOT NULL COMMENT '变动类型',
  `old_value` varchar(240) DEFAULT NULL,
  `current_value` varchar(240) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `deleted` tinyint(4) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` varchar(20) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产变动记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zc_bm`
--

DROP TABLE IF EXISTS `zc_bm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_bm` (
  `id` bigint(20) NOT NULL COMMENT '主键标识',
  `zc_id` bigint(20) NOT NULL COMMENT '资产ID',
  `bmid` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '删除标识',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产部门对应关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zc_fp`
--

DROP TABLE IF EXISTS `zc_fp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_fp` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `zcid` bigint(20) NOT NULL COMMENT '资产id',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(4) DEFAULT NULL COMMENT '会计期间',
  `mxid` bigint(20) NOT NULL COMMENT '明细id',
  `fphm` varchar(8) NOT NULL COMMENT '发票号码',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` int(11) DEFAULT NULL COMMENT '创建人',
  `deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_zc_fp_zc_gl` (`zcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产发票关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zc_gl`
--

DROP TABLE IF EXISTS `zc_gl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_gl` (
  `id` bigint(20) NOT NULL COMMENT 'id标识',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(4) DEFAULT NULL COMMENT '会计期间',
  `zclx` int(4) DEFAULT NULL COMMENT '资产类型',
  `sfid` int(3) DEFAULT NULL COMMENT '算法id',
  `ly` int(3) DEFAULT NULL COMMENT '资产来源id',
  `zclb` int(3) DEFAULT NULL COMMENT '资产类别id',
  `je` decimal(18,2) DEFAULT NULL COMMENT '原值',
  `code` varchar(24) DEFAULT NULL,
  `ggxh` varchar(64) DEFAULT NULL COMMENT '规格型号',
  `sl` decimal(18,8) DEFAULT NULL COMMENT '数量',
  `rzrq` date DEFAULT NULL COMMENT '入账日期',
  `ksrq` date DEFAULT NULL COMMENT '开始使用日期',
  `yjsyyf` int(11) DEFAULT NULL COMMENT '预计使用月份',
  `xmgs` varchar(32) DEFAULT NULL COMMENT '项目归属',
  `ysyyf` int(11) DEFAULT NULL COMMENT '已使用月份',
  `yzje` decimal(18,2) DEFAULT NULL COMMENT '月折旧额/摊销额',
  `qcje` decimal(18,2) DEFAULT NULL COMMENT '期初累计折旧/摊销',
  `qcjz` decimal(18,2) DEFAULT NULL COMMENT '期初净值',
  `czl` decimal(11,2) DEFAULT NULL COMMENT '残值率',
  `yjjcz` decimal(18,2) DEFAULT NULL COMMENT '预计净残值',
  `jzzb` decimal(18,2) DEFAULT NULL COMMENT '减值准备',
  `jcz` decimal(18,2) DEFAULT NULL COMMENT '净残值',
  `bz` varchar(240) DEFAULT NULL COMMENT '备注',
  `tyzt` int(2) DEFAULT NULL COMMENT '停用状态',
  `tyyy` int(4) DEFAULT NULL COMMENT '停用原因',
  `tyrq` date DEFAULT NULL COMMENT '停用日期',
  `qyrq` date DEFAULT NULL COMMENT '启用日期',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '删除标识',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL,
  `sfyckc` int(11) DEFAULT NULL COMMENT '是否一次性扣除当做成本费用 0:否 1:是',
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='固定资产,无形资产信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zc_jt`
--

DROP TABLE IF EXISTS `zc_jt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_jt` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `zcid` bigint(20) NOT NULL COMMENT '对应资产id',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `jtje` decimal(18,2) DEFAULT NULL COMMENT '本月摊销额',
  `deleted` tinyint(4) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `create_user` varchar(24) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(24) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产计提数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zc_km`
--

DROP TABLE IF EXISTS `zc_km`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_km` (
  `id` bigint(20) NOT NULL,
  `zc_id` bigint(20) DEFAULT NULL COMMENT '资产ID',
  `kjnd` int(11) NOT NULL,
  `yzkm_id` bigint(20) DEFAULT NULL COMMENT '原值科目对照',
  `ljzjkm_id` bigint(20) DEFAULT NULL COMMENT '累记折旧科目对照id',
  `cbfykm_id` bigint(20) DEFAULT NULL COMMENT '成本费用科目对照ID',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '删除标识',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产计提与科目关系对应表,';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zc_lsb`
--

DROP TABLE IF EXISTS `zc_lsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_lsb` (
  `id` bigint(20) NOT NULL COMMENT 'id标识',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `zclbid` int(3) DEFAULT NULL COMMENT '资产类别id',
  `zcbh` varchar(20) DEFAULT NULL COMMENT '资产编号',
  `sfid` int(3) DEFAULT NULL COMMENT '算法id',
  `name` varchar(50) DEFAULT NULL COMMENT '资产名称',
  `zclx` int(4) DEFAULT NULL COMMENT '资产类型',
  `ggxh` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `zcsl` decimal(18,2) DEFAULT NULL COMMENT '数量',
  `rzrq` date DEFAULT NULL COMMENT '入账日期',
  `begin_date` date DEFAULT NULL COMMENT '摊销开始日期',
  `end_date` date DEFAULT NULL COMMENT '摊销结束日期',
  `bmid` bigint(20) DEFAULT NULL COMMENT '部门id',
  `je` decimal(18,2) DEFAULT NULL COMMENT '原值/费用金额',
  `syyf` int(11) DEFAULT NULL COMMENT '已使用月份',
  `qcljzj` decimal(18,2) DEFAULT NULL COMMENT '期初累计折旧/摊销',
  `sytxje` decimal(18,2) DEFAULT NULL COMMENT '剩余摊销金额',
  `czl` decimal(18,2) DEFAULT NULL COMMENT '残值率',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_USER` varchar(32) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_zc_lsb_qyid` (`qyid`,`zclx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产初始化数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zc_pz`
--

DROP TABLE IF EXISTS `zc_pz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_pz` (
  `id` bigint(20) NOT NULL COMMENT '主键标识',
  `zc_id` bigint(20) DEFAULT NULL COMMENT '资产id',
  `qyid` bigint(20) DEFAULT NULL COMMENT '企业id',
  `zcjt_id` bigint(20) DEFAULT NULL COMMENT '资产计提数据id',
  `pz_id` bigint(20) DEFAULT NULL COMMENT '凭证ID',
  `ly` int(11) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL COMMENT '删除标识',
  `ext1` varchar(32) DEFAULT NULL COMMENT '扩展字段1',
  `ext2` varchar(32) DEFAULT NULL COMMENT '扩展字段2',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产计提与凭证关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zc_tx`
--

DROP TABLE IF EXISTS `zc_tx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_tx` (
  `id` bigint(20) NOT NULL COMMENT 'id标识',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `kjnd` int(4) DEFAULT NULL COMMENT '会计年度',
  `kjqj` int(2) DEFAULT NULL COMMENT '会计期间',
  `zclx` int(11) NOT NULL COMMENT '资产类型',
  `name` varchar(64) NOT NULL,
  `sfid` int(3) DEFAULT NULL COMMENT '算法id',
  `ly` int(11) NOT NULL COMMENT '来源',
  `zclb` int(11) DEFAULT NULL COMMENT '资产类别',
  `je` decimal(18,2) NOT NULL COMMENT '费用金额',
  `begin_date` date NOT NULL COMMENT '摊销开始日期',
  `end_date` date NOT NULL COMMENT '摊销结束日期',
  `yjtje` decimal(18,2) DEFAULT NULL COMMENT '月计提金额',
  `xmgs` varchar(32) DEFAULT NULL,
  `qcje` decimal(18,2) DEFAULT NULL COMMENT '期初累计摊销金额',
  `bz` varchar(240) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `create_user` varchar(24) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` varchar(24) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sfyckc` int(11) DEFAULT NULL COMMENT '是否一次性扣除作为成本费用',
  PRIMARY KEY (`id`),
  KEY `INDEX_QYID_KJND_KJQJ` (`qyid`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='长期待摊费用,待摊费用管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zc_zjzt_jl`
--

DROP TABLE IF EXISTS `zc_zjzt_jl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_zjzt_jl` (
  `id` bigint(20) NOT NULL COMMENT '主键标识',
  `zcid` bigint(20) NOT NULL COMMENT '资产id',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `begin_date` date DEFAULT NULL COMMENT '暂停折旧开始时间',
  `end_date` date DEFAULT NULL COMMENT '暂停折旧结束时间',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '删除标识',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='折旧暂停记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `fintax-application`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fintax-application` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fintax-application`;

--
-- Table structure for table `audit_task_info`
--

DROP TABLE IF EXISTS `audit_task_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_task_info` (
  `audit_id` bigint(20) NOT NULL COMMENT '审计文件Id',
  `batch_code` bigint(20) NOT NULL DEFAULT '0' COMMENT '批量任务批次号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '任务状态 0失败 1进行中 2 成功 ',
  `qy_id` bigint(20) NOT NULL COMMENT '企业id',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审计文件类型 0 txt 1 xml',
  `result_size` varchar(64) NOT NULL DEFAULT '' COMMENT '审计文件大小',
  `result_name` varchar(128) NOT NULL DEFAULT '' COMMENT '审计文件名称',
  `result_url` varchar(2048) NOT NULL DEFAULT '' COMMENT '审计文件链接',
  `error_msg` varchar(512) NOT NULL DEFAULT '' COMMENT '异常信息',
  `operator` varchar(64) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_dept_manager`
--

DROP TABLE IF EXISTS `auth_dept_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_dept_manager` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `USER_ID` bigint(20) NOT NULL COMMENT '用户id',
  `DEPARTMENT_ID` bigint(20) NOT NULL COMMENT '部门id',
  `IS_MANAGER` int(2) unsigned DEFAULT '0' COMMENT '是否主管(0:否,1:是)',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPADTE_BY` varchar(64) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=901125561852895233 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门主管信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_company`
--

DROP TABLE IF EXISTS `auth_user_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_company` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `company_id` bigint(20) NOT NULL COMMENT '企业id',
  `type` tinyint(4) DEFAULT NULL COMMENT '绑定业务类型(0:客户授权,1:service账号)',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除(0:是,1:否)',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户企业绑定关系记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branch_tran`
--

DROP TABLE IF EXISTS `branch_tran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_tran` (
  `tran_id` bigint(20) NOT NULL COMMENT '事务id',
  `g_tran_id` bigint(20) NOT NULL COMMENT '全局事务id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `param` varchar(300) DEFAULT NULL COMMENT '参数内容',
  `tran_type` char(1) DEFAULT NULL COMMENT '事务类型: 1企业创建',
  `src_srv_id` varchar(50) DEFAULT NULL COMMENT '来源服务id',
  `dest_srv_id` varchar(50) DEFAULT NULL COMMENT '目标服务id',
  `tran_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '事务状态:0进行中 1成功 2失败',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`tran_id`),
  KEY `idx_gTranId` (`g_tran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charge_bank`
--

DROP TABLE IF EXISTS `charge_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_bank` (
  `bank_code` varchar(30) NOT NULL COMMENT '银行编码',
  `bank_name` varchar(40) DEFAULT NULL COMMENT '银行名称',
  `bank_simple_name` varchar(30) DEFAULT NULL COMMENT '银行简称',
  PRIMARY KEY (`bank_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charge_detail`
--

DROP TABLE IF EXISTS `charge_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_detail` (
  `charge_detial_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收费明细id',
  `charge_id` bigint(20) NOT NULL COMMENT '记录id',
  `ksqj` int(10) DEFAULT NULL COMMENT '开始期间',
  `jsqj` int(10) DEFAULT NULL COMMENT '结束期间',
  `ysje` decimal(11,2) DEFAULT NULL COMMENT '应收金额',
  `bcyh` decimal(11,2) DEFAULT NULL COMMENT '本次优惠',
  `sjsf` decimal(11,2) DEFAULT NULL COMMENT '实际收费',
  `charge_iteam` bigint(20) DEFAULT NULL COMMENT '收费项目',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`charge_detial_id`) USING BTREE,
  KEY `chargeTypeIteam` (`charge_iteam`) USING BTREE,
  KEY `index_charge_id` (`charge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=901127975356022785 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charge_pay`
--

DROP TABLE IF EXISTS `charge_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_pay` (
  `pay_id` bigint(20) NOT NULL COMMENT '流水id',
  `charge_id` bigint(20) NOT NULL COMMENT '记录id',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '账单类型:0-收款,1-退款',
  `pay_status` tinyint(1) NOT NULL COMMENT '账单状态:0-进行中,1-已完成,2-已关闭',
  `pay_money` decimal(11,2) NOT NULL COMMENT '支付金额',
  `pay_mode` tinyint(1) NOT NULL COMMENT '支付方式:2-微信,3-支付宝',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `origin_pay_id` bigint(20) DEFAULT NULL COMMENT '退款账单对应的原账单id',
  `pay_person` varchar(20) NOT NULL COMMENT '操作人',
  `pay_user_id` bigint(20) NOT NULL COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除:0正常, 1删除',
  `audit_status` tinyint(1) DEFAULT '0' COMMENT '审核状态:0未审核, 1已审核',
  `yeepay_order_id` varchar(100) DEFAULT NULL COMMENT '易宝商户收款请求号',
  `yeepay_uni_order_no` varchar(50) DEFAULT NULL COMMENT '易宝收款订单号',
  `yeepay_bank_order_id` varchar(50) DEFAULT NULL COMMENT '易宝支付机构在微信侧的外部商户订单号',
  `yeepay_pre_pay_tn` varchar(300) DEFAULT NULL COMMENT '易宝预支付标识信息',
  `yeepay_order_status` varchar(20) DEFAULT NULL COMMENT '易宝钉单状态:PROCESSING-订单待支付 SUCCESS-订单支付成功 TIME_OUT-订单已过期 FAIL-订单支付失败 CLOSE-订单关闭',
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `uni_charge_id` (`charge_id`),
  UNIQUE KEY `uni_order_no` (`yeepay_uni_order_no`),
  KEY `idx_org_pay_id` (`origin_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charge_qr_code`
--

DROP TABLE IF EXISTS `charge_qr_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_qr_code` (
  `gsid` bigint(20) NOT NULL COMMENT '公司id',
  `alipay_status` tinyint(1) DEFAULT NULL COMMENT '支付宝状态:0未开通 1已开通',
  `alipay_qr_url` varchar(300) DEFAULT NULL COMMENT '支付宝二维码url',
  `wechat_status` tinyint(1) DEFAULT NULL COMMENT '微信状态:0未开通 1已开通',
  `wechat_qr_url` varchar(300) DEFAULT NULL COMMENT '微信二维码url',
  `bank_pub_status` tinyint(1) DEFAULT NULL COMMENT '银行公户状态:0未开通 1已开通',
  `bank_pub_qr_url` varchar(300) DEFAULT NULL COMMENT '银行公户二维码url',
  `bank_pri_status` tinyint(1) DEFAULT NULL COMMENT '银行私户状态:0未开通 1已开通',
  `bank_pri_qr_url` varchar(300) DEFAULT NULL COMMENT '银行私户二维码url',
  `cash_status` tinyint(1) DEFAULT NULL COMMENT '现金状态:0未开通 1已开通',
  `cash_qr_url` varchar(300) DEFAULT NULL COMMENT '现金二维码url',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`gsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收款二维码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charge_record`
--

DROP TABLE IF EXISTS `charge_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_record` (
  `charge_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `charge_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '收费日期',
  `charge_iteam_nme` varchar(100) DEFAULT NULL COMMENT '收费项目名称',
  `chargeTp` varchar(100) NOT NULL COMMENT '收费类型',
  `skhj` decimal(11,2) NOT NULL COMMENT '收款合计',
  `syzhye` decimal(11,2) DEFAULT NULL COMMENT '使用账户余额',
  `bcssje` decimal(11,2) NOT NULL COMMENT '本次实收金额',
  `charge_date` datetime DEFAULT NULL COMMENT '收费日期',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `isDel` int(1) DEFAULT '1' COMMENT '是否删除',
  `charge_desc` varchar(350) DEFAULT NULL,
  `charge_person` varchar(20) DEFAULT NULL COMMENT '收费人',
  `charge_fs` varchar(20) DEFAULT NULL COMMENT '收费方式',
  `charge_bh` varchar(20) DEFAULT NULL COMMENT '收费编号',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `audit_status` varchar(10) DEFAULT '0' COMMENT '审核状态 默认为空 0 未审核 1 已审核',
  `charge_status` tinyint(1) DEFAULT '0' COMMENT '记录状态:0-正常,1-退款,2-未完成,3-已关闭',
  `source` char(1) DEFAULT '0' COMMENT '来源:0收费登记 1在线收款',
  PRIMARY KEY (`charge_id`) USING BTREE,
  KEY `index_qyid` (`qyid`)
) ENGINE=InnoDB AUTO_INCREMENT=901127975351828482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charge_sync_record`
--

DROP TABLE IF EXISTS `charge_sync_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_sync_record` (
  `id` bigint(20) NOT NULL,
  `gsid` bigint(20) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `code` int(16) DEFAULT NULL,
  `msg` varchar(256) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  UNIQUE KEY `charge_sync_record_gsid_IDX` (`gsid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charge_type`
--

DROP TABLE IF EXISTS `charge_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_type` (
  `charge_typeid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收费类型id',
  `charge_tname` varchar(20) NOT NULL COMMENT '收费类型名称',
  `qyid` bigint(20) DEFAULT NULL COMMENT '企业id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`charge_typeid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=878701003504914810 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collect_trigger_cfg`
--

DROP TABLE IF EXISTS `collect_trigger_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collect_trigger_cfg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gsid` bigint(20) DEFAULT NULL COMMENT '公司id',
  `collect_task_name` varchar(50) DEFAULT NULL COMMENT '采集任务名称',
  `trigger_mode` tinyint(1) DEFAULT NULL COMMENT '触发方式: 0手动 1自动',
  `trigger_day` tinyint(2) DEFAULT NULL COMMENT '每月几号自动触发',
  `start_hour_minute` char(5) DEFAULT NULL COMMENT '开始时分,格式 01:01',
  `end_hour_minute` char(5) DEFAULT NULL COMMENT '结束时分,格式 01:01',
  `extra_cfg` varchar(128) DEFAULT NULL COMMENT '额外配置,json格式',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1736 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_manager`
--

DROP TABLE IF EXISTS `company_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_manager` (
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `managerid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收费管理主键id',
  `sffs` int(1) DEFAULT NULL COMMENT '收费方式',
  `jzf_month` decimal(11,2) DEFAULT NULL COMMENT '记账费金额',
  `jzf_startzq` int(10) DEFAULT NULL COMMENT '记账费开始期间',
  `jzf_lastzq` int(10) DEFAULT NULL COMMENT '记账费结束期间',
  `zbf_ci` decimal(11,2) DEFAULT NULL COMMENT '账本费金额',
  `zbf_lastzq` int(10) DEFAULT NULL COMMENT '账本费结束期间',
  `zhye` decimal(11,2) DEFAULT NULL COMMENT '账户余额',
  `update_time` datetime DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `audit_status` varchar(10) DEFAULT '' COMMENT '审核状态 默认为空 0 未审核 1 已审核',
  `notes` varchar(350) DEFAULT NULL COMMENT '备注',
  `yjsfrq` datetime DEFAULT NULL COMMENT '预计收费日期',
  PRIMARY KEY (`managerid`) USING BTREE,
  UNIQUE KEY `comny_qyid` (`qyid`) USING BTREE,
  KEY `idx_qyid` (`qyid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=901127869228294146 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_company_print`
--

DROP TABLE IF EXISTS `custom_company_print`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_company_print` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `company_id` bigint(20) NOT NULL COMMENT '企业id',
  `config_id` bigint(20) NOT NULL COMMENT '配置id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_userid_qyid` (`user_id`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_last_config`
--

DROP TABLE IF EXISTS `custom_last_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_last_config` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `module_id` tinyint(4) NOT NULL COMMENT 'module',
  `module_config` varchar(500) DEFAULT NULL COMMENT '打印配置',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `index_userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_print_config`
--

DROP TABLE IF EXISTS `custom_print_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_print_config` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `module_id` tinyint(4) NOT NULL COMMENT 'module',
  `module_config` varchar(500) DEFAULT NULL COMMENT '打印配置',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eb_download_task_basic_info`
--

DROP TABLE IF EXISTS `eb_download_task_basic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eb_download_task_basic_info` (
  `id` bigint(20) NOT NULL COMMENT 'DZZP_PLDC+id 是缓存数据key',
  `task_status` char(1) DEFAULT NULL COMMENT '0 生成中 1 成功 2 失败',
  `company_id` bigint(20) DEFAULT NULL,
  `download_url` varchar(1024) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user_name` bigint(100) DEFAULT NULL,
  `unique_batch_code` bigint(20) DEFAULT NULL,
  `qyid` bigint(20) DEFAULT NULL COMMENT '生成失败就添加qyid',
  PRIMARY KEY (`id`),
  KEY `eb_download_task_basic_info_unique_batch_code_IDX` (`unique_batch_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导出任务记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eb_file_item_config`
--

DROP TABLE IF EXISTS `eb_file_item_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eb_file_item_config` (
  `ID` bigint(20) NOT NULL,
  `type` varchar(16) DEFAULT 'FILE' COMMENT 'CLASS:分类,FILE:具体文件',
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `model_type` varchar(255) DEFAULT '' COMMENT '模块类别',
  `report_type` varchar(255) DEFAULT '' COMMENT '报表类别',
  `sort` int(11) DEFAULT '0' COMMENT '显示顺序',
  `status` varchar(2) DEFAULT '00' COMMENT '状态 00 启用  01 禁用',
  `preview` tinyint(4) DEFAULT '0' COMMENT '预览操作权限(false:无权限,true:有权限)',
  `excel_download` tinyint(4) DEFAULT '0' COMMENT 'excel下载操作(false:无权限,true:有权限)',
  `pdf_download` tinyint(4) DEFAULT '0' COMMENT 'pdf下载权限(false:无权限,true:有权限)',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '上级id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='电子账簿文件项配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eb_print_assets_config`
--

DROP TABLE IF EXISTS `eb_print_assets_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eb_print_assets_config` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `file_type` varchar(32) DEFAULT NULL,
  `mode_type` varchar(256) DEFAULT NULL,
  `report_type` varchar(256) DEFAULT NULL,
  `personality` varchar(2048) DEFAULT NULL COMMENT '打印配置',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user_name` varchar(32) DEFAULT NULL COMMENT '更新人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电子账簿读取资产打印配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eb_print_kjbb_config`
--

DROP TABLE IF EXISTS `eb_print_kjbb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eb_print_kjbb_config` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `all_print` tinyint(4) DEFAULT '0',
  `balance_sheet` tinyint(4) DEFAULT '0',
  `income_statement` tinyint(4) DEFAULT '0',
  `cash_flow_statement` tinyint(4) DEFAULT '0',
  `profit_statement` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电子账簿-会计报表-配置信息记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eb_print_task_basic_info`
--

DROP TABLE IF EXISTS `eb_print_task_basic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eb_print_task_basic_info` (
  `id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司id',
  `batch_code` varchar(64) NOT NULL DEFAULT '' COMMENT '批次号',
  `task_status` char(2) DEFAULT '00' COMMENT '任务状态(00-未开始,01-正在生成,02-生成成功,03-生成失败,04-已删除,05-已打印)',
  `prompt_message` varchar(512) DEFAULT '' COMMENT '任务提示消息',
  `create_user_name` varchar(128) DEFAULT 'sys' COMMENT '创建用户名称',
  `default_print_type` char(2) DEFAULT '01' COMMENT '打印类型: 00 不打印非空 , 01打印非空',
  `all_task_file_path` varchar(1024) DEFAULT '' COMMENT 'pdf打印文件地址',
  `task_file_path` varchar(1024) DEFAULT '' COMMENT 'pdf打印文件地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `double_print` int(2) DEFAULT '1' COMMENT '是否双面打印 1是 0 不是',
  `all_not_double_path` varchar(1024) DEFAULT '' COMMENT 'pdf打印文件地址(含空文件，非双面打印)',
  `not_double_path` varchar(1024) DEFAULT '' COMMENT 'pdf打印文件地址(不含空文件，非双面打印)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_eptbi_batch_code` (`batch_code`) USING BTREE,
  KEY `index_eptbi_company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打印任务记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eb_print_task_date_info`
--

DROP TABLE IF EXISTS `eb_print_task_date_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eb_print_task_date_info` (
  `print_date_id` bigint(20) NOT NULL,
  `print_task_id` bigint(20) NOT NULL COMMENT '打印任务id',
  `print_year` int(11) NOT NULL COMMENT '年份',
  `print_month` int(11) NOT NULL COMMENT '月份',
  PRIMARY KEY (`print_date_id`),
  KEY `index_eptdi` (`print_task_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打印任务日期表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eb_print_task_enterprise_info`
--

DROP TABLE IF EXISTS `eb_print_task_enterprise_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eb_print_task_enterprise_info` (
  `print_enterprise_id` bigint(20) NOT NULL,
  `print_task_id` bigint(20) NOT NULL COMMENT '打印任务id',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业id',
  `ztdm` varchar(64) NOT NULL COMMENT '账套代码',
  `enterprise_name` varchar(64) NOT NULL COMMENT '企业名称',
  PRIMARY KEY (`print_enterprise_id`),
  KEY `index_eptei_print_task_id` (`print_task_id`) USING BTREE,
  KEY `index_eptei_enterprise_id` (`enterprise_id`) USING BTREE,
  KEY `index_eptei_enterprise_name` (`ztdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打印任务企业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eb_print_task_file_info`
--

DROP TABLE IF EXISTS `eb_print_task_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eb_print_task_file_info` (
  `print_file_id` bigint(20) NOT NULL COMMENT '打印文件id',
  `print_task_id` bigint(20) DEFAULT NULL COMMENT '打印任务id',
  `file_name` varchar(64) DEFAULT NULL COMMENT '文件名称',
  `model_type` varchar(255) DEFAULT '' COMMENT '模块类别',
  `report_type` varchar(255) DEFAULT '' COMMENT '报表类别',
  `extent_param` varchar(1024) DEFAULT '' COMMENT '拓展参数',
  PRIMARY KEY (`print_file_id`),
  KEY `index_eptfi_print_task_id` (`print_task_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打印任务文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eb_print_task_result_file_info`
--

DROP TABLE IF EXISTS `eb_print_task_result_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eb_print_task_result_file_info` (
  `id` bigint(20) NOT NULL,
  `print_task_id` bigint(20) NOT NULL COMMENT '打印任务id',
  `print_enterprise_id` bigint(20) NOT NULL COMMENT '任务企业id',
  `print_date_id` bigint(20) NOT NULL COMMENT '打印任务日期选择表id',
  `print_file_id` bigint(20) NOT NULL COMMENT '打印文件id',
  `file_name` varchar(255) DEFAULT '' COMMENT '文件名称',
  `file_path` varchar(2048) DEFAULT '' COMMENT '文件地址',
  `exist_business_date` tinyint(4) DEFAULT '0' COMMENT '是否存在业务数据',
  `error_message` varchar(255) DEFAULT '' COMMENT '文件生成错误消息',
  PRIMARY KEY (`id`),
  KEY `index_eptrfi_print_task_id` (`print_task_id`) USING BTREE,
  KEY `index_eptrfi_print_enterprise_id` (`print_enterprise_id`) USING BTREE,
  KEY `index_eptrfi_print_date_id` (`print_date_id`) USING BTREE,
  KEY `index_eptrfi_print_file_id` (`print_file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打印任务返回结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` bigint(20) NOT NULL,
  `gsid` bigint(20) DEFAULT NULL COMMENT '代账公司id',
  `gsmc` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `yhid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `yhmc` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `feedback` varchar(500) DEFAULT NULL COMMENT '反馈信息',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `nickname` varchar(255) DEFAULT NULL COMMENT '称谓',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `global_tran`
--

DROP TABLE IF EXISTS `global_tran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_tran` (
  `g_tran_id` bigint(20) NOT NULL COMMENT '全局事务id',
  `qyid` bigint(20) DEFAULT NULL COMMENT '企业id',
  `tran_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '事务状态:0进行中 1成功 2失败',
  `tran_type` char(1) DEFAULT NULL COMMENT '事务类型: 1企业创建',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`g_tran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gsnb_gs_use`
--

DROP TABLE IF EXISTS `gsnb_gs_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsnb_gs_use` (
  `ID` bigint(20) NOT NULL,
  `GSID` bigint(20) DEFAULT NULL COMMENT '公司id',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `IS_OPEN` int(4) DEFAULT NULL COMMENT '是否开通',
  `OPEN_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开通时间',
  `USE_NUM` int(10) DEFAULT NULL COMMENT '使用数目',
  `OPEN_NUM` int(10) DEFAULT NULL COMMENT '开通数目',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATED_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `order_id` varchar(128) DEFAULT NULL,
  `test_num` int(10) DEFAULT NULL,
  `formal_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `uni_gsid_kjnd` (`GSID`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公司是否使用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gsnb_qy_use`
--

DROP TABLE IF EXISTS `gsnb_qy_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsnb_qy_use` (
  `ID` bigint(20) NOT NULL,
  `QYID` bigint(20) DEFAULT NULL COMMENT '企业id',
  `GSID` bigint(20) DEFAULT NULL COMMENT '公司id',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `IS_USE` int(4) DEFAULT NULL COMMENT '是否使用',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATED_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `uni_index_qyid_kjnd` (`QYID`,`KJND`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业是否使用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hsqj_gs_use`
--

DROP TABLE IF EXISTS `hsqj_gs_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsqj_gs_use` (
  `ID` bigint(20) NOT NULL,
  `GSID` bigint(20) DEFAULT NULL COMMENT '公司id',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `IS_OPEN` int(4) DEFAULT NULL COMMENT '是否开通',
  `OPEN_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开通时间',
  `USE_NUM` int(10) DEFAULT NULL COMMENT '使用数目',
  `OPEN_NUM` int(10) DEFAULT NULL COMMENT '开通数目',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATED_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `order_id` varchar(128) DEFAULT NULL,
  `test_num` int(10) DEFAULT NULL,
  `formal_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `uni_gsid_kjnd` (`GSID`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公司是否使用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hsqj_qy_use`
--

DROP TABLE IF EXISTS `hsqj_qy_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsqj_qy_use` (
  `ID` bigint(20) NOT NULL,
  `QYID` bigint(20) DEFAULT NULL COMMENT '企业id',
  `GSID` bigint(20) DEFAULT NULL COMMENT '公司id',
  `KJND` int(4) DEFAULT NULL COMMENT '会计年度',
  `IS_USE` int(4) DEFAULT NULL COMMENT '是否使用',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATED_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `uni_index_qyid_kjnd` (`QYID`,`KJND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业是否使用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_km_tax`
--

DROP TABLE IF EXISTS `invoice_km_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_km_tax` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `ztdm` bigint(20) NOT NULL COMMENT '账套代码',
  `kjnd` int(11) NOT NULL COMMENT '会计年度',
  `kmlx` tinyint(4) NOT NULL COMMENT '科目类型 8-未认证进项税 9-进项税额转出',
  `kmqc` varchar(255) NOT NULL COMMENT '科目全称',
  `km_dzid` bigint(20) DEFAULT NULL COMMENT '科目对照ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qyid_ztdm_kjnd_index` (`qyid`,`ztdm`,`kjnd`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='发票-科目-未认证进项科目用户设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qy_lsb_cw_log`
--

DROP TABLE IF EXISTS `qy_lsb_cw_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qy_lsb_cw_log` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `ztdm` bigint(20) NOT NULL COMMENT '账套代码',
  `kjnd` int(11) NOT NULL COMMENT '会计年度',
  `kjqj` int(11) NOT NULL COMMENT '会计期间',
  `type` int(11) NOT NULL COMMENT '处理类型 1:清单凭证 2:期末结转 3:资产负债',
  `desc` varchar(512) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `qy_lsb_cw_log_qyid_kjnd_kjqj_type_uindex` (`qyid`,`kjnd`,`kjqj`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业零申报财务处理异常表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `share_login`
--

DROP TABLE IF EXISTS `share_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `yhid` bigint(20) DEFAULT NULL,
  `gsid` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `effect_time` int(11) DEFAULT NULL COMMENT '有效期/小时',
  `code` varchar(255) DEFAULT NULL COMMENT '分享编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=901128014720618497 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_fp_srdyb`
--

DROP TABLE IF EXISTS `sys_fp_srdyb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fp_srdyb` (
  `ID` bigint(20) NOT NULL COMMENT '收入对应表ID(主键)',
  `ZTDM` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `KJND` int(11) DEFAULT NULL COMMENT '会计年度',
  `KJQJ` int(11) DEFAULT NULL COMMENT '会计期间',
  `FPDYND` int(11) DEFAULT NULL COMMENT '发票对应会计年度',
  `FPDYYF` int(11) DEFAULT NULL COMMENT '发票对应会计期间',
  `SRHJ` decimal(18,2) DEFAULT NULL COMMENT '收入合计',
  `HYLXID` int(4) DEFAULT '1' COMMENT '行业类型id',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `ZTDM_INDEX` (`ZTDM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='发票收入对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_help_resource`
--

DROP TABLE IF EXISTS `sys_help_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_help_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `address_url` varchar(100) DEFAULT NULL COMMENT '资源地址',
  `type` varchar(1) DEFAULT NULL COMMENT '1：视频 2：图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_help_resource_assess`
--

DROP TABLE IF EXISTS `sys_help_resource_assess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_help_resource_assess` (
  `id` bigint(20) NOT NULL,
  `yh_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '帮助资源ID',
  `status` varchar(2) DEFAULT NULL COMMENT '01 :有用 02：无用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sys_help_resource_assess_yh_id_index` (`yh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_jzjy_gs`
--

DROP TABLE IF EXISTS `sys_jzjy_gs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_jzjy_gs` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `KJHSZZID` int(11) NOT NULL COMMENT '会计核算准则',
  `MBMC` varchar(30) DEFAULT NULL COMMENT '模板名称',
  `MBID` varchar(30) DEFAULT NULL COMMENT '模板ID',
  `GS` text COMMENT '取数公式',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_jzjy_msg`
--

DROP TABLE IF EXISTS `sys_jzjy_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_jzjy_msg` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(2) NOT NULL COMMENT '会计期间',
  `MSG_TYPE` varchar(20) NOT NULL COMMENT '校验消息类型',
  `MSG_SUCCESS` int(1) NOT NULL COMMENT '校验消息成功状态 1：成功  0 :失败',
  `MSG_CONTENT` varchar(255) NOT NULL COMMENT '校验消息内容',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `index_3` (`ZTDM`,`KJND`,`KJQJ`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_jzjy_yssdl`
--

DROP TABLE IF EXISTS `sys_jzjy_yssdl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_jzjy_yssdl` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(4) NOT NULL COMMENT '会计年度',
  `KJQJ` int(2) NOT NULL COMMENT '会计期间',
  `YSSDL` decimal(8,4) NOT NULL COMMENT '企业应税所得率',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `ZTDM_INDEX` (`ZTDM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_kfan_department`
--

DROP TABLE IF EXISTS `sys_kfan_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_kfan_department` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEPARTMENT` varchar(20) DEFAULT NULL COMMENT '分公司名称',
  `ENABLE_FLAG` varchar(2) DEFAULT NULL COMMENT '开通状态 0-关闭 1-开通',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_kfan_gspz`
--

DROP TABLE IF EXISTS `sys_kfan_gspz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_kfan_gspz` (
  `GSID` bigint(20) NOT NULL COMMENT '公司ID',
  `GSMC` varchar(256) NOT NULL COMMENT '公司名称',
  `ZT` char(1) NOT NULL COMMENT '状态',
  `UPDATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`GSID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_note_auto_config`
--

DROP TABLE IF EXISTS `sys_note_auto_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_note_auto_config` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `config` int(1) NOT NULL DEFAULT '0' COMMENT '是否开启 0是 1否',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `copy_config` int(1) DEFAULT NULL COMMENT '自动复制配置，0：每月最后一天，1：所有地区申报期最后一天，2：自定义',
  `copy_day` int(2) DEFAULT NULL COMMENT '每月第几天',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qyid` (`qyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_notes`
--

DROP TABLE IF EXISTS `sys_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notes` (
  `id` bigint(20) NOT NULL,
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `kjnd` int(11) DEFAULT NULL,
  `kjqj` int(11) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL COMMENT '内容',
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新用户ID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `todo` tinyint(4) DEFAULT NULL COMMENT '待办状态，0：不是待办，1：未完成，2：已完成',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `qyid` (`qyid`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统笔记';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_notes_log`
--

DROP TABLE IF EXISTS `sys_notes_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notes_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `kjnd` int(11) DEFAULT NULL,
  `kjqj` int(11) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL COMMENT '内容',
  `todo` tinyint(4) DEFAULT NULL COMMENT '待办状态，0：不是待办，1：未完成，2：已完成',
  `copy_bz` tinyint(4) DEFAULT NULL COMMENT '复制标识，0：无，1：手动复制，2：自动复制',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_qyid` (`qyid`,`kjnd`,`kjqj`)
) ENGINE=InnoDB AUTO_INCREMENT=901128009352384514 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统笔记日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_sflfw`
--

DROP TABLE IF EXISTS `sys_sflfw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sflfw` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `SWID` varchar(11) DEFAULT NULL COMMENT '税务模块，ZCFZ:表示资产负债，ZZS:表示增值税负债率，SDS：表示所得税负债率，MLL:毛利率',
  `MAX` decimal(10,4) DEFAULT NULL,
  `MIX` decimal(10,4) DEFAULT NULL,
  `ZT` int(11) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(500) DEFAULT NULL COMMENT '备注',
  `SFSZ` int(1) DEFAULT '0' COMMENT '是否设置，1：设置过，2：未设置',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `ZTDM_INDEX` (`ZTDM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='税负范围';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_user_qy_top`
--

DROP TABLE IF EXISTS `sys_user_qy_top`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_qy_top` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `qyid` bigint(20) NOT NULL COMMENT '企业id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_suet_qyid` (`qyid`) USING BTREE,
  KEY `id_suet_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_yjz`
--

DROP TABLE IF EXISTS `sys_yjz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_yjz` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) DEFAULT NULL COMMENT '账套代码',
  `YJZL` varchar(11) DEFAULT NULL COMMENT '预警种类 YINGSZK:应收账款期末余额  YUSZK:预收账款期末余额',
  `YJZ` decimal(10,4) DEFAULT NULL COMMENT '预警值',
  `SFSZ` int(1) DEFAULT NULL COMMENT '是否设置，1：设置过，0：未设置',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `idx_sys_yjz` (`ZTDM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='应收/预收 账款占比预警值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_zt_jkd`
--

DROP TABLE IF EXISTS `sys_zt_jkd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_zt_jkd` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL,
  `KJND` int(4) NOT NULL,
  `KJQJ` int(2) NOT NULL,
  `JKD` varchar(10) DEFAULT NULL COMMENT '健康度',
  `ZHJSSJ` datetime NOT NULL COMMENT '最后计算时间',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `index_2` (`ZTDM`,`KJND`,`KJQJ`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `url_auth_config`
--

DROP TABLE IF EXISTS `url_auth_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_auth_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `req_type` varchar(10) DEFAULT NULL COMMENT '请求参数方式：GET FORM JSON  HEAD',
  `single_field_name` varchar(30) DEFAULT NULL COMMENT '单参数时参数名，如果是标准传参，这里可以为空',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_url` (`url`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校验权限url配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_qy_app`
--

DROP TABLE IF EXISTS `user_qy_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_qy_app` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `route` varchar(512) DEFAULT NULL COMMENT '前端路由 可以为空',
  `rows` int(11) DEFAULT NULL COMMENT '序号 可为空',
  `create_time` timestamp NULL DEFAULT NULL,
  `code` varchar(32) NOT NULL COMMENT '前端code 前端根据code获取对应路由',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_qy_app_user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户常用功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `validate_code_record`
--

DROP TABLE IF EXISTS `validate_code_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `validate_code_record` (
  `ID` bigint(20) NOT NULL COMMENT 'ID',
  `GSID` bigint(20) DEFAULT NULL COMMENT '公司ID',
  `TASK_ID` varchar(300) DEFAULT NULL COMMENT '任务ID',
  `QYID` bigint(20) DEFAULT NULL COMMENT '企业ID',
  `NSRSBH` varchar(20) DEFAULT NULL COMMENT '纳税人识别号',
  `PHONE` varchar(11) DEFAULT NULL COMMENT '手机号',
  `VC_SEND_TIME` datetime DEFAULT NULL COMMENT '短信验证码发送时间',
  `VALIDATE_CODE` varchar(10) DEFAULT NULL COMMENT '短信验证码',
  `VC_FILL_TIME` datetime DEFAULT NULL COMMENT '短信验证码填写时间',
  `VC_FILL_USER` varchar(20) DEFAULT NULL COMMENT '短信验证码填写人',
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` varchar(20) DEFAULT NULL COMMENT '更新人',
  `DELETE_FLAG` varchar(2) DEFAULT '0' COMMENT '删除标识 0-未删除 1-已删除',
  `CANCEL_FLAG` varchar(2) DEFAULT '0' COMMENT '前端取消标识 0-未取消 1-已取消',
  `EXPIRE_FLAG` varchar(23) DEFAULT '0' COMMENT '自动处理超时消息标识 0-未超时 1-已超时',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `ids_index` (`QYID`,`PHONE`) USING BTREE,
  KEY `phone_index` (`PHONE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_record_cancel_log`
--

DROP TABLE IF EXISTS `vc_record_cancel_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vc_record_cancel_log` (
  `ID` bigint(20) NOT NULL COMMENT 'ID',
  `VC_RECORD_ID` bigint(20) DEFAULT NULL COMMENT 'validate_code_record主键ID',
  `CANCEL_USERID` bigint(20) DEFAULT NULL COMMENT '取消用户ID',
  `CANCEL_TIME` datetime DEFAULT NULL COMMENT '取消时间',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `vc_record_id_idx` (`VC_RECORD_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `fintax_stock`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fintax_stock` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fintax_stock`;

--
-- Table structure for table `ch_bdhz`
--

DROP TABLE IF EXISTS `ch_bdhz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_bdhz` (
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_KJND` int(11) NOT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) NOT NULL COMMENT '会计期间',
  `K_CKID` bigint(20) NOT NULL COMMENT '仓库编号',
  `K_CHID` bigint(20) NOT NULL COMMENT '存货编号',
  `K_CGRKSL` decimal(20,8) DEFAULT NULL,
  `K_CGRKJE` decimal(18,2) NOT NULL COMMENT '采购入库金额',
  `K_SCRKSL` decimal(20,8) DEFAULT NULL,
  `K_SCRKJE` decimal(18,2) NOT NULL COMMENT '生产入库金额',
  `K_QTRKSL` decimal(20,8) DEFAULT NULL,
  `K_QTRKJE` decimal(18,2) NOT NULL COMMENT '其他入库金额',
  `K_ZGRKSL` decimal(20,8) DEFAULT NULL,
  `K_ZGRKJE` decimal(18,2) NOT NULL COMMENT '暂估入库金额',
  `K_CHZGSL` decimal(20,8) DEFAULT NULL,
  `K_CHZGJE` decimal(18,2) NOT NULL COMMENT '冲回暂估金额',
  `K_XSCKSL` decimal(20,8) DEFAULT NULL,
  `K_XSCKJE` decimal(18,2) NOT NULL COMMENT '销售出库金额',
  `K_SCCKSL` decimal(20,8) DEFAULT NULL,
  `K_SCCKJE` decimal(18,2) NOT NULL COMMENT '生产出库金额',
  `K_QTCKSL` decimal(20,8) DEFAULT NULL,
  `K_QTCKJE` decimal(18,2) NOT NULL COMMENT '其他出库金额',
  PRIMARY KEY (`K_ZTDM`,`K_KJND`,`K_KJQJ`,`K_CKID`,`K_CHID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='库存汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_bom`
--

DROP TABLE IF EXISTS `ch_bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_bom` (
  `K_BOMID` bigint(20) NOT NULL COMMENT '主键',
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_BOMBH` varchar(32) NOT NULL COMMENT 'BOM单编号',
  `K_CHID` bigint(20) NOT NULL COMMENT '完工产品ID',
  `K_BOMLY` tinyint(3) DEFAULT NULL COMMENT 'BOM单来源',
  `K_BOMZT` tinyint(1) NOT NULL COMMENT 'BOM单状态（0-停用，1-正常）',
  `K_CJR` varchar(32) DEFAULT NULL COMMENT '操作人',
  `K_CJRQ` datetime DEFAULT NULL COMMENT '创建/更新时间',
  `K_GXRQ` datetime DEFAULT NULL COMMENT '更新时间',
  `K_BZ` varchar(256) DEFAULT NULL COMMENT '备注',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`K_BOMID`) USING BTREE,
  KEY `index_ztdm` (`K_ZTDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='bom单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_bommx`
--

DROP TABLE IF EXISTS `ch_bommx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_bommx` (
  `K_BOMMXID` bigint(20) NOT NULL COMMENT '主键',
  `K_BOMID` bigint(20) NOT NULL COMMENT 'BOM单id',
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_XH` int(11) DEFAULT NULL COMMENT '在BOM单中的序号',
  `K_CHID` bigint(20) NOT NULL COMMENT '原材料存货ID',
  `K_SY` decimal(20,8) DEFAULT NULL COMMENT '数量',
  `K_SFZL` tinyint(1) NOT NULL COMMENT '是否主料（0-否，1-是）',
  `K_CJRQ` datetime DEFAULT NULL,
  PRIMARY KEY (`K_BOMMXID`) USING BTREE,
  UNIQUE KEY `bommx_unique` (`K_BOMID`,`K_ZTDM`,`K_CHID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='bom单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_cbjzb`
--

DROP TABLE IF EXISTS `ch_cbjzb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_cbjzb` (
  `K_CBJZID` bigint(20) NOT NULL COMMENT '主键',
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_KJND` int(11) NOT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) NOT NULL COMMENT '会计期间',
  `K_CHID` bigint(20) NOT NULL COMMENT '存货编号',
  `K_SL` decimal(20,8) DEFAULT NULL,
  `K_DJ` decimal(20,8) DEFAULT NULL,
  `K_JE` decimal(20,8) DEFAULT NULL,
  `K_XSSRJE` decimal(18,2) DEFAULT NULL COMMENT '销售收入金额',
  `K_CBJZBL` decimal(5,4) DEFAULT NULL COMMENT '成本结转比例',
  `K_DJLY` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`K_CBJZID`) USING BTREE,
  KEY `cbjzb_index` (`K_CHID`) USING BTREE,
  KEY `index_ztdm` (`K_ZTDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='成本结转表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_cgjh`
--

DROP TABLE IF EXISTS `ch_cgjh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_cgjh` (
  `K_CGJHID` varchar(50) NOT NULL,
  `K_SCID` varchar(50) DEFAULT NULL,
  `K_CHID` bigint(20) NOT NULL COMMENT '存货编号',
  `K_LLJHZB` decimal(8,6) DEFAULT NULL,
  `K_LLJHJE` decimal(18,2) DEFAULT NULL,
  `K_LLJHDJ` decimal(20,8) DEFAULT NULL,
  `K_LLJHSL` decimal(20,8) DEFAULT NULL,
  `K_CGJHJE` decimal(18,2) DEFAULT NULL,
  `K_CGJHDJ` decimal(20,8) DEFAULT NULL,
  `K_CGJHSL` decimal(20,8) DEFAULT NULL,
  `K_SJKCJE` decimal(18,2) DEFAULT NULL,
  `K_SJKCSL` decimal(20,8) DEFAULT NULL,
  `K_CZR` varchar(32) DEFAULT NULL,
  `K_CZSJ` datetime DEFAULT NULL,
  PRIMARY KEY (`K_CGJHID`) USING BTREE,
  KEY `chcgjh_scid_index` (`K_SCID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='采购计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_ch`
--

DROP TABLE IF EXISTS `ch_ch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_ch` (
  `K_CHID` bigint(20) NOT NULL COMMENT '存货ID',
  `K_CHBH` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '存货编号(用户自定义)',
  `K_CHMC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '存货名称',
  `K_GGXH` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格型号',
  `K_JLDW` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `K_CHLBID` bigint(20) NOT NULL COMMENT '存货类别',
  `K_DZID` bigint(20) DEFAULT NULL,
  `K_CHZT` char(3) NOT NULL COMMENT '存货状态:0-删除 1-正常',
  `K_CJR` varchar(32) DEFAULT NULL COMMENT '创建人',
  `K_CJRQ` datetime NOT NULL COMMENT '创建日期',
  `K_BZ` varchar(256) DEFAULT NULL COMMENT '备注',
  `K_ZTDM` bigint(32) NOT NULL,
  `K_JZBL` decimal(5,4) DEFAULT NULL,
  `K_KJND` int(11) DEFAULT NULL COMMENT '会计年度',
  `K_GLBOMID` bigint(20) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `SALES_FLAG` int(1) DEFAULT '0' COMMENT '销售标志 内销-0 外销-1',
  PRIMARY KEY (`K_CHID`) USING BTREE,
  KEY `glbom_index` (`K_GLBOMID`) USING BTREE,
  KEY `ch_index` (`K_ZTDM`,`K_CHMC`,`K_GGXH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存货表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_chbd`
--

DROP TABLE IF EXISTS `ch_chbd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_chbd` (
  `K_CHBDID` bigint(20) NOT NULL COMMENT '存货变动ID',
  `K_CHID` bigint(20) DEFAULT NULL COMMENT '存货ID',
  `K_KJND` int(11) DEFAULT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) DEFAULT NULL COMMENT '会计期间',
  `K_CHLBID` bigint(20) DEFAULT NULL COMMENT '存货类别',
  `K_DZID` bigint(20) DEFAULT NULL,
  `K_CZR` varchar(32) DEFAULT NULL COMMENT '操作人',
  `K_CZSJ` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`K_CHBDID`) USING BTREE,
  KEY `chid_index` (`K_CHID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存货变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_chkm`
--

DROP TABLE IF EXISTS `ch_chkm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_chkm` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `KJND` int(12) NOT NULL COMMENT '会计年度',
  `CHID` bigint(20) NOT NULL COMMENT '存货ID',
  `DZID` bigint(20) NOT NULL COMMENT '对照ID',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_index_ztdm_kjnd_chid` (`ZTDM`,`KJND`,`CHID`),
  KEY `index_dzid` (`DZID`) USING BTREE,
  KEY `index_chid` (`CHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_chkm_fzhs`
--

DROP TABLE IF EXISTS `ch_chkm_fzhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_chkm_fzhs` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `KJND` int(11) NOT NULL COMMENT '会计年度',
  `CHKMPZID` bigint(20) NOT NULL COMMENT '账套业务类型ID',
  `DZID` bigint(20) NOT NULL COMMENT '对照ID',
  `FZHS_ID` bigint(20) NOT NULL COMMENT '辅助核算ID',
  `FZHS_TYPE` varchar(12) NOT NULL COMMENT '辅助核算类型',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_ck`
--

DROP TABLE IF EXISTS `ch_ck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_ck` (
  `K_CKID` bigint(20) NOT NULL COMMENT '仓库编号',
  `K_CHJJFFID` int(11) DEFAULT NULL COMMENT '存货计价方法:1-月末一次加权平均法\n                        2-移动加权平均法\n                        3-先进先出法\n                        4-后进先出法\n                        5-个别计价法\n                        6-计划成本法\n                        7-毛利率法和零售价法',
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_CKMC` varchar(100) DEFAULT NULL COMMENT '仓库名称',
  `K_SJCKID` bigint(20) DEFAULT NULL COMMENT '上级仓库编号',
  `K_BZ` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`K_CKID`) USING BTREE,
  KEY `idx_ch_ck` (`K_ZTDM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='仓库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_cshlsb`
--

DROP TABLE IF EXISTS `ch_cshlsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_cshlsb` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ZTDM` varchar(50) DEFAULT NULL COMMENT '账套代码',
  `KJND` int(10) DEFAULT NULL COMMENT '会计年度',
  `KJQJ` int(10) DEFAULT NULL COMMENT '会计期间',
  `CHMC` varchar(255) DEFAULT NULL COMMENT '存货名称',
  `GGXH` varchar(255) DEFAULT NULL COMMENT '规格型号',
  `CHLBMC` varchar(255) DEFAULT NULL COMMENT '存货类别名称',
  `JLDW` varchar(255) DEFAULT NULL COMMENT '计量单位',
  `QCSL` varchar(50) DEFAULT NULL COMMENT '期初数量',
  `QCJE` varchar(50) DEFAULT NULL COMMENT '期初金额',
  `ZGSL` varchar(50) DEFAULT NULL COMMENT '暂估数量',
  `ZGJE` varchar(50) DEFAULT NULL COMMENT '暂估金额',
  `KMBM` varchar(50) DEFAULT NULL COMMENT '核算科目编码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `ztdm_index` (`ZTDM`,`KJND`,`KJQJ`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_cxdjmx`
--

DROP TABLE IF EXISTS `ch_cxdjmx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_cxdjmx` (
  `K_ID` bigint(20) NOT NULL COMMENT 'id',
  `K_CXDJID` bigint(20) DEFAULT NULL COMMENT '冲销单据id',
  `K_GLDJMXID` bigint(20) DEFAULT NULL COMMENT '关联单据明细id',
  `K_GLDJID` bigint(20) DEFAULT NULL COMMENT '关联单据id',
  `K_CHID` bigint(20) DEFAULT NULL COMMENT '存货id',
  `K_SL` decimal(20,8) DEFAULT NULL COMMENT '数量',
  `K_JE` decimal(20,8) DEFAULT NULL COMMENT '金额',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`K_ID`),
  KEY `djid__index` (`K_CXDJID`,`K_GLDJID`,`K_GLDJMXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存货冲销单据明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_dj`
--

DROP TABLE IF EXISTS `ch_dj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_dj` (
  `K_DJID` bigint(20) NOT NULL COMMENT 'sequence',
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_KJND` int(11) NOT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) NOT NULL COMMENT '会计期间',
  `K_DJLX` char(3) NOT NULL,
  `K_DJBM` varchar(32) DEFAULT NULL COMMENT '单据编号：用户自定义',
  `K_ZDRQ` datetime NOT NULL COMMENT '制单日期',
  `K_DJLY` varchar(3) NOT NULL COMMENT '单据来源：0-自动;1-手动',
  `K_CJR` varchar(32) DEFAULT NULL COMMENT '创建人',
  `K_CJRQ` datetime NOT NULL COMMENT '创建日期',
  `K_GLDJID` bigint(20) DEFAULT NULL COMMENT '关联单据ID\n            单据类型为调拨单货属性变更单时，系统自动建立两张单据：\n            501-调拨单-出库\n            502-调拨单-入库\n            901-属性变更单-出库\n            902-属性变革单-入库\n            \n            出信息记入501/901\n            入信息记入502/902\n            两张单据互为关联单据\n            \n            关联的调拨单总行数、行顺序、每行的数量/金额必须一致',
  `K_DFDWSJLXID` varchar(10) DEFAULT NULL COMMENT '对方单位数据类型ID',
  `K_DFDWSJNRID` bigint(20) DEFAULT NULL,
  `K_SCID` varchar(32) DEFAULT NULL,
  `K_ZTYWLWLXID` bigint(20) DEFAULT NULL,
  `K_CXZT` char(1) DEFAULT NULL COMMENT '冲销状态(0-未冲销, 1-已冲销)',
  `K_GLCXID` bigint(20) DEFAULT NULL COMMENT '关联冲销单据id',
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`K_DJID`) USING BTREE,
  KEY `ztdm_index` (`K_ZTDM`,`K_KJND`,`K_KJQJ`) USING BTREE,
  KEY `scid_index` (`K_SCID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_djmx`
--

DROP TABLE IF EXISTS `ch_djmx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_djmx` (
  `K_DJMXID` bigint(20) NOT NULL COMMENT '库存明细ID：sequence',
  `K_DJID` bigint(20) DEFAULT NULL COMMENT 'sequence',
  `K_HH` int(11) DEFAULT NULL,
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_KJND` int(11) NOT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) NOT NULL COMMENT '会计期间',
  `K_ZTYWLWLXID` bigint(20) DEFAULT NULL COMMENT '账套业务类型ID：sequence',
  `K_CKID` bigint(20) DEFAULT NULL COMMENT '仓库编号',
  `K_CHID` bigint(20) DEFAULT NULL COMMENT '存货ID',
  `K_CHBDID` bigint(20) DEFAULT NULL COMMENT '存货变动ID',
  `K_SL` decimal(20,8) DEFAULT NULL,
  `K_DJ` decimal(20,8) DEFAULT NULL,
  `K_JE` decimal(20,8) DEFAULT NULL,
  PRIMARY KEY (`K_DJMXID`) USING BTREE,
  KEY `idx_ch_djmx_full` (`K_ZTDM`,`K_KJND`,`K_KJQJ`,`K_DJID`) USING BTREE,
  KEY `djmx_index` (`K_DJID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_export_cbjzb`
--

DROP TABLE IF EXISTS `ch_export_cbjzb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_export_cbjzb` (
  `K_CBJZID` bigint(20) NOT NULL COMMENT '主键',
  `K_ZTDM` varchar(32) NOT NULL COMMENT '账套代码',
  `K_KJND` int(11) NOT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) NOT NULL COMMENT '会计期间',
  `K_CHID` bigint(20) NOT NULL COMMENT '存货编号',
  `K_SL` decimal(20,8) DEFAULT NULL COMMENT '数量',
  `K_DJ` decimal(20,8) DEFAULT NULL COMMENT '单价',
  `K_JE` decimal(18,2) DEFAULT NULL COMMENT '金额',
  `K_TSCE` decimal(18,2) DEFAULT '0.00' COMMENT '退税差额',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`K_CBJZID`),
  KEY `cbjzb_index` (`K_ZTDM`,`K_KJND`,`K_KJQJ`,`K_CHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外销存货成本结转表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_export_config`
--

DROP TABLE IF EXISTS `ch_export_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_export_config` (
  `GSID` bigint(20) NOT NULL COMMENT '公司id',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`GSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存货外销核算配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_export_split_detail`
--

DROP TABLE IF EXISTS `ch_export_split_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_export_split_detail` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `SCID` varchar(50) DEFAULT NULL COMMENT '生产id',
  `CHID` bigint(20) DEFAULT NULL COMMENT '存货id',
  `TYPE` varchar(10) DEFAULT NULL COMMENT '类型 QC-期初 RK-入库',
  `MXID` varchar(20) DEFAULT NULL COMMENT '发票存货对照明细id',
  `SL` decimal(20,8) DEFAULT '0.00000000' COMMENT '数量',
  `JE` decimal(18,2) DEFAULT '0.00' COMMENT '金额',
  `CFSL` decimal(20,8) DEFAULT '0.00000000' COMMENT '拆分数量',
  `CFJE` decimal(18,2) DEFAULT '0.00' COMMENT '拆分金额',
  `ACCOUNTING_FLAG` int(2) DEFAULT '0' COMMENT '核算标记 0-未核算 1-已核算',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `detail_index` (`SCID`,`CHID`,`TYPE`,`MXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存货外销拆分明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_fdw`
--

DROP TABLE IF EXISTS `ch_fdw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_fdw` (
  `K_FDWID` bigint(20) NOT NULL COMMENT '主键',
  `K_FDWMC` varchar(32) NOT NULL COMMENT '副单位名称',
  `K_DWID` bigint(20) NOT NULL COMMENT '基本单位id',
  `K_HSGX` decimal(20,8) NOT NULL COMMENT '换算关系，一个副单位对应基本单位的数量',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` varchar(32) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`K_FDWID`) USING BTREE,
  KEY `jbdw_index` (`K_DWID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='副单位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_hssz`
--

DROP TABLE IF EXISTS `ch_hssz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_hssz` (
  `K_HSSZID` bigint(20) NOT NULL COMMENT '核算方法id',
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_KJND` int(11) NOT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) NOT NULL COMMENT '会计期间',
  `K_CBJZFFID` int(11) DEFAULT NULL COMMENT '成本结转方法id',
  `K_JZBL` decimal(5,4) DEFAULT NULL COMMENT '结转比例',
  `K_CHJJFFID` int(11) DEFAULT NULL COMMENT '存货计价方法id',
  `K_CHSCFFID` int(11) DEFAULT NULL COMMENT '存货生产方法id:1-传统生产 2-以销定产',
  `K_CHSCHSID` int(11) DEFAULT NULL COMMENT '存货生产核算方法id:1-按比例核算 2-按增值税税负率核算',
  `K_CHHSFFID` int(11) DEFAULT NULL COMMENT '存货核算方法id:1-生产核算 2-销售核算',
  `K_CZR` varchar(32) DEFAULT NULL COMMENT '操作人',
  `K_CZSJ` datetime DEFAULT NULL COMMENT '操作时间',
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `SALES_FLAG` int(1) DEFAULT '0' COMMENT '销售标志 内销-0 外销-1',
  PRIMARY KEY (`K_HSSZID`) USING BTREE,
  KEY `ztdm_index` (`K_ZTDM`,`K_KJND`,`K_KJQJ`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存货核算设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_hz`
--

DROP TABLE IF EXISTS `ch_hz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_hz` (
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_KJND` int(11) NOT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) NOT NULL COMMENT '会计期间',
  `K_CKID` bigint(20) NOT NULL COMMENT '仓库编号',
  `K_CHID` bigint(20) NOT NULL COMMENT '存货编号',
  `K_QCJCSL` decimal(20,8) DEFAULT '0.00000000',
  `K_QCJCJE` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '期初结存金额',
  `K_BQRKSL` decimal(20,8) DEFAULT '0.00000000',
  `K_BQRKJE` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '本期入库金额',
  `K_BQCKSL` decimal(20,8) DEFAULT '0.00000000',
  `K_BQCKJE` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '本期出库金额',
  `K_QMJCSL` decimal(20,8) DEFAULT '0.00000000',
  `K_QMJCJE` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '期末结存金额',
  `K_ZGRKSL` decimal(20,8) DEFAULT '0.00000000' COMMENT '暂估入库数量',
  `K_ZGRKJE` decimal(18,2) DEFAULT NULL COMMENT '暂估入库金额',
  PRIMARY KEY (`K_ZTDM`,`K_KJND`,`K_KJQJ`,`K_CKID`,`K_CHID`) USING BTREE,
  KEY `index_chid` (`K_CHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='库存汇总';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_jldw`
--

DROP TABLE IF EXISTS `ch_jldw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_jldw` (
  `K_DWID` bigint(20) NOT NULL COMMENT '主键',
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_DWMC` varchar(32) NOT NULL COMMENT '基本单位名称',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` varchar(32) DEFAULT NULL COMMENT '更新人',
  `K_BZ` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`K_DWID`) USING BTREE,
  KEY `ztdm_index` (`K_ZTDM`) USING BTREE,
  KEY `dwmc_index` (`K_DWMC`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='计量单位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_llsc`
--

DROP TABLE IF EXISTS `ch_llsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_llsc` (
  `K_LLSCID` varchar(50) NOT NULL,
  `K_SCID` varchar(50) DEFAULT NULL,
  `K_CHID` bigint(20) NOT NULL COMMENT '存货编号',
  `K_SL` decimal(20,8) DEFAULT NULL,
  `K_JE` decimal(18,2) DEFAULT NULL,
  `K_CZR` varchar(32) DEFAULT NULL,
  `K_CZSJ` datetime DEFAULT NULL,
  `K_SJLY` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`K_LLSCID`) USING BTREE,
  KEY `chllsc_scid_index` (`K_SCID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='领料生产表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_operate_record`
--

DROP TABLE IF EXISTS `ch_operate_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_operate_record` (
  `id` bigint(20) unsigned NOT NULL,
  `ztdm` bigint(20) NOT NULL COMMENT '账套代码',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(11) NOT NULL COMMENT '会计期间',
  `chid` bigint(20) NOT NULL,
  `business_type` tinyint(1) NOT NULL COMMENT '业务类型 1-修改 2-删除',
  `business_data` blob COMMENT '业务数据',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_scyc`
--

DROP TABLE IF EXISTS `ch_scyc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_scyc` (
  `K_SCYCID` varchar(50) NOT NULL,
  `K_SCID` varchar(50) DEFAULT NULL,
  `K_CHID` bigint(20) NOT NULL COMMENT '存货编号',
  `K_YJSCCBJE` decimal(18,2) DEFAULT NULL COMMENT '预计销售成本金额',
  `K_YJSCCBSL` decimal(20,8) DEFAULT NULL COMMENT '预计销售成本数量',
  `K_SJKCJE` decimal(18,2) DEFAULT NULL COMMENT '实际库存金额',
  `K_SJKCSL` decimal(20,8) DEFAULT NULL COMMENT '实际库存数量',
  `K_SCJHJE` decimal(18,2) DEFAULT NULL COMMENT '生产计划金额',
  `K_SCJHSL` decimal(20,8) DEFAULT NULL COMMENT '生产计划数量',
  `K_CZR` varchar(32) DEFAULT NULL COMMENT '操作人',
  `K_CZSJ` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`K_SCYCID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='生产预测表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_sczb`
--

DROP TABLE IF EXISTS `ch_sczb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_sczb` (
  `K_SCID` varchar(50) NOT NULL,
  `K_ZTDM` bigint(32) NOT NULL,
  `K_KJND` int(11) NOT NULL,
  `K_KJQJ` int(11) DEFAULT NULL,
  `K_SCRQ` datetime DEFAULT NULL,
  `K_CBJLBM` varchar(32) DEFAULT NULL,
  `K_SCFFID` int(11) DEFAULT NULL,
  `K_SCZT` int(11) DEFAULT NULL,
  `K_CZR` varchar(32) DEFAULT NULL,
  `K_CZSJ` datetime DEFAULT NULL,
  `K_CBHSID` char(1) DEFAULT NULL COMMENT '成本核算类型:1-生产成本核算 2-销售成本核算',
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`K_SCID`) USING BTREE,
  KEY `ztdm_index` (`K_ZTDM`,`K_KJND`,`K_KJQJ`,`K_CBHSID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存货生产主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_sys_chjjff`
--

DROP TABLE IF EXISTS `ch_sys_chjjff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_sys_chjjff` (
  `K_CHJJFFID` int(11) NOT NULL COMMENT '存货计价方法:1-月末一次加权平均法\n                        2-移动加权平均法\n                        3-先进先出法\n                        4-后进先出法\n                        5-个别计价法\n                        6-计划成本法\n                        7-毛利率法和零售价法',
  `K_FFMC` varchar(128) DEFAULT NULL COMMENT '方法名称',
  `K_SFQY` char(1) NOT NULL COMMENT '是否启用:0-不启用1-启用',
  `K_BZ` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`K_CHJJFFID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存货计价方法表\n            1-月末一次加权平均法\n            2-移动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_sys_chlb`
--

DROP TABLE IF EXISTS `ch_sys_chlb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_sys_chlb` (
  `K_XTCHLBID` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统存货类别ID',
  `K_CHLBMC` varchar(128) NOT NULL COMMENT '存货类别名称',
  `K_HYID` int(11) NOT NULL COMMENT '行业编码',
  `K_KJHSZZID` int(11) NOT NULL COMMENT '会计核算准则',
  `K_KMNM` varchar(64) NOT NULL,
  `K_BZ` varchar(256) DEFAULT NULL COMMENT '备注',
  `K_SFCG` char(1) NOT NULL DEFAULT '1' COMMENT '是否采购\r\n“0”为否 “1”为是',
  `K_SFSCLY` char(1) NOT NULL DEFAULT '0' COMMENT '是否生产领用\r\n“0”为否 “1”为是',
  `K_SFSCCC` char(1) NOT NULL DEFAULT '0' COMMENT '是否生产产出\r\n“0”为否 “1”为是',
  `K_SFXS` char(1) NOT NULL DEFAULT '0' COMMENT '是否销售\r\n“0”为否 “1”为是',
  `K_SFTX` char(1) NOT NULL DEFAULT '0' COMMENT '是否摊销\r\n“0”为否 “1”为是',
  PRIMARY KEY (`K_XTCHLBID`,`K_HYID`,`K_KJHSZZID`,`K_KMNM`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存货类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_sys_djlx`
--

DROP TABLE IF EXISTS `ch_sys_djlx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_sys_djlx` (
  `K_DJLX` char(3) NOT NULL COMMENT '业务类型ID：sequence',
  `k_djlxmc` varchar(64) NOT NULL COMMENT '业务类型名称',
  `K_SFKX` varchar(3) DEFAULT NULL COMMENT '是否可选',
  `K_BZ` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`K_DJLX`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据类型：\n001-出库单\n101-入库单\n501-调拨单-出库\n                                -';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_sys_jldw`
--

DROP TABLE IF EXISTS `ch_sys_jldw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_sys_jldw` (
  `K_JLDWID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `K_JLDWMC` varchar(32) NOT NULL COMMENT '基本单位名称',
  `K_FDWMC` varchar(32) NOT NULL COMMENT '副单位名称',
  `K_HSGX` decimal(20,8) NOT NULL COMMENT '换算关系，一个副单位对应基本单位的数量',
  PRIMARY KEY (`K_JLDWID`) USING BTREE,
  UNIQUE KEY `dwmc_index` (`K_JLDWMC`,`K_FDWMC`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统计量单位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_sys_scff`
--

DROP TABLE IF EXISTS `ch_sys_scff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_sys_scff` (
  `K_SCFFID` int(11) NOT NULL,
  `K_SCFF` varchar(32) NOT NULL,
  `K_SCFFZT` char(2) NOT NULL,
  PRIMARY KEY (`K_SCFFID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='生产方法表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_sys_ywlx`
--

DROP TABLE IF EXISTS `ch_sys_ywlx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_sys_ywlx` (
  `K_YWLXID` int(11) NOT NULL COMMENT '业务类型ID',
  `K_YWLXMC` varchar(64) NOT NULL COMMENT '业务类型名称',
  `K_DJLX` char(3) NOT NULL COMMENT '单据类型：\n            1-入库单\n            2-出库单',
  `K_HYID` int(11) NOT NULL COMMENT '行业编码',
  `K_KJHSZZID` int(11) NOT NULL COMMENT '会计核算准则',
  `K_KMNM` varchar(64) DEFAULT NULL,
  `K_YWLXZT` char(3) NOT NULL COMMENT '业务类型状态\n            0-不启用\n            1-正常',
  `K_BZ` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`K_YWLXID`,`K_KJHSZZID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='入库单  采购入库\r\n入库单  生产入库\r\n入库单  暂估入库\r\n入库单  盘盈入库\r\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_wgcpcbjs`
--

DROP TABLE IF EXISTS `ch_wgcpcbjs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_wgcpcbjs` (
  `K_CPCBJSID` varchar(50) NOT NULL,
  `K_SCID` varchar(50) DEFAULT NULL,
  `K_XM` varchar(32) NOT NULL,
  `K_CLCB` decimal(18,2) DEFAULT NULL,
  `K_ZJRG` decimal(18,2) DEFAULT NULL,
  `K_ZZFY` decimal(18,2) DEFAULT NULL,
  `K_QTFY` decimal(18,2) DEFAULT NULL,
  `K_HJ` decimal(18,2) DEFAULT NULL,
  `K_CZR` varchar(32) DEFAULT NULL,
  `K_CZSJ` datetime DEFAULT NULL,
  PRIMARY KEY (`K_CPCBJSID`) USING BTREE,
  KEY `chwgcpcbjs_scid_index` (`K_SCID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='完工产品成本计算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_wgcpmx`
--

DROP TABLE IF EXISTS `ch_wgcpmx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_wgcpmx` (
  `K_WGCPMXID` varchar(50) NOT NULL,
  `K_SCID` varchar(50) DEFAULT NULL,
  `K_CHID` bigint(20) NOT NULL COMMENT '存货编号',
  `K_CPCBJSID` varchar(50) DEFAULT NULL,
  `K_FTL` decimal(10,8) DEFAULT NULL,
  `K_SL` decimal(20,8) DEFAULT NULL,
  `K_DJ` decimal(20,8) DEFAULT NULL,
  `K_JE` decimal(20,2) DEFAULT NULL,
  `K_CZR` varchar(32) DEFAULT NULL,
  `K_CZSJ` datetime DEFAULT NULL,
  PRIMARY KEY (`K_WGCPMXID`) USING BTREE,
  KEY `chwgcpmx_scid_index` (`K_SCID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='完工产品明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_xsdd`
--

DROP TABLE IF EXISTS `ch_xsdd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_xsdd` (
  `K_XSDDID` varchar(50) NOT NULL,
  `K_SCID` varchar(50) DEFAULT NULL,
  `K_CHID` bigint(20) NOT NULL COMMENT '存货编号',
  `K_ZB` decimal(8,6) DEFAULT NULL,
  `K_YJXSSRJE` decimal(18,2) DEFAULT NULL,
  `K_CBJZBL` decimal(8,6) DEFAULT NULL,
  `K_YJXSCBJE` decimal(18,2) DEFAULT NULL,
  `K_YJXSCBDJ` decimal(20,8) DEFAULT NULL,
  `K_YJXSCBSL` decimal(20,8) DEFAULT NULL,
  `K_CZR` varchar(32) DEFAULT NULL,
  `K_CZSJ` datetime DEFAULT NULL,
  `K_SCJHJE` decimal(18,6) DEFAULT NULL COMMENT '生产计划金额',
  `K_SCJHSL` decimal(20,8) DEFAULT NULL COMMENT '生产计划数量',
  `K_CLCB` decimal(18,6) DEFAULT NULL COMMENT '材料成本',
  `K_ZJRG` decimal(18,6) DEFAULT NULL COMMENT '直接人工',
  `K_ZZFY` decimal(18,6) DEFAULT NULL COMMENT '制造费用',
  `K_QTFY` decimal(18,6) DEFAULT NULL COMMENT '其他费用',
  `K_HJ` decimal(18,6) DEFAULT NULL COMMENT '合计',
  `K_WGCBSL` decimal(20,8) DEFAULT NULL COMMENT '完工成本数量',
  `K_WGCBDJ` decimal(20,8) DEFAULT NULL COMMENT '完工成本单价',
  PRIMARY KEY (`K_XSDDID`) USING BTREE,
  KEY `chxsdd_scid_index` (`K_SCID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='销售订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_ztchlb`
--

DROP TABLE IF EXISTS `ch_ztchlb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_ztchlb` (
  `K_CHLBID` bigint(20) NOT NULL COMMENT '存货类别ID',
  `K_CHLBMC` varchar(128) NOT NULL COMMENT '存货类别名称',
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_KMNM` varchar(64) DEFAULT NULL,
  `K_SJCHLBID` bigint(20) NOT NULL COMMENT '上级存货类别',
  `K_CHLBZT` char(3) DEFAULT NULL COMMENT '存货类别状态:0-删除 1-正常 2-冻结',
  `K_SFMJ` char(1) NOT NULL COMMENT '是否末级：1-是；0-否',
  `K_BZ` varchar(256) DEFAULT NULL COMMENT '备注',
  `K_JLDW` varchar(20) NOT NULL COMMENT '计量单位',
  `K_KJND` int(11) DEFAULT NULL COMMENT '会计年度',
  `K_XTCHLBID` int(11) DEFAULT NULL COMMENT '系统存货类别ID',
  `K_SFCG` char(1) DEFAULT '1' COMMENT '是否采购\r\n“0”为否 “1”为是',
  `K_SFSCLY` char(1) DEFAULT '0' COMMENT '是否生产领用\r\n“0”为否 “1”为是',
  `K_SFSCCC` char(1) DEFAULT '0' COMMENT '是否生产产出\r\n“0”为否 “1”为是',
  `K_SFXS` char(1) DEFAULT '0' COMMENT '是否销售\r\n“0”为否 “1”为是',
  `K_SFTX` char(1) DEFAULT '0' COMMENT '是否摊销\r\n“0”为否 “1”为是',
  PRIMARY KEY (`K_CHLBID`) USING BTREE,
  KEY `idx_ch_ztchlb` (`K_ZTDM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='账套存货类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_ztqyzt`
--

DROP TABLE IF EXISTS `ch_ztqyzt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_ztqyzt` (
  `ID` bigint(20) NOT NULL COMMENT '主键ID',
  `ZTDM` bigint(20) NOT NULL COMMENT '账套代码',
  `ZT` int(1) NOT NULL COMMENT '状态: 1-执行成功',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `index_ztdm` (`ZTDM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账套迁移状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_ztywlx`
--

DROP TABLE IF EXISTS `ch_ztywlx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_ztywlx` (
  `K_ZTYWLWLXID` bigint(20) NOT NULL COMMENT '账套业务类型ID：sequence',
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_KJND` int(11) DEFAULT NULL COMMENT '会计年度',
  `K_YWLXMC` varchar(64) NOT NULL COMMENT '业务类型名称',
  `K_DJLX` char(3) NOT NULL COMMENT '单据类型：\n            001-出库单\n            101-入库单\n            \n            \n            501-调拨单-出库\n            502-调拨单-入库\n            \n            \n            901-属性变更单-出库\n            902-属性变革单-入库        ',
  `K_KMNM` varchar(64) DEFAULT NULL,
  `K_YWLXID` int(11) DEFAULT NULL,
  `K_YWLXZT` char(3) NOT NULL COMMENT '业务类型状态\n            0-不启用\n            1-启用',
  `K_BZ` varchar(256) DEFAULT NULL COMMENT '备注',
  `K_DZID` bigint(20) DEFAULT NULL COMMENT '对照ID',
  PRIMARY KEY (`K_ZTYWLWLXID`) USING BTREE,
  KEY `index_ztdm_kjnd_ywlxid` (`K_ZTDM`,`K_KJND`,`K_YWLXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='账套存货业务类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_ztywlx_copy`
--

DROP TABLE IF EXISTS `ch_ztywlx_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_ztywlx_copy` (
  `K_ZTYWLWLXID` bigint(20) NOT NULL COMMENT '账套业务类型ID：sequence',
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_KJND` int(11) DEFAULT NULL COMMENT '会计年度',
  `K_YWLXMC` varchar(64) NOT NULL COMMENT '业务类型名称',
  `K_DJLX` char(3) NOT NULL COMMENT '单据类型：\n            001-出库单\n            101-入库单\n            \n            \n            501-调拨单-出库\n            502-调拨单-入库\n            \n            \n            901-属性变更单-出库\n            902-属性变革单-入库        ',
  `K_KMNM` varchar(64) DEFAULT NULL,
  `K_YWLXID` int(11) DEFAULT NULL,
  `K_YWLXZT` char(3) NOT NULL COMMENT '业务类型状态\n            0-不启用\n            1-启用',
  `K_BZ` varchar(256) DEFAULT NULL COMMENT '备注',
  `K_DZID` bigint(20) DEFAULT NULL COMMENT '对照ID',
  PRIMARY KEY (`K_ZTYWLWLXID`) USING BTREE,
  KEY `index_ztdm_kjnd` (`K_ZTDM`,`K_KJND`),
  KEY `index_ztdm_kjnd_ywlxid` (`K_ZTDM`,`K_KJND`,`K_YWLXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='账套存货业务类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_ztywlx_fzhs`
--

DROP TABLE IF EXISTS `ch_ztywlx_fzhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_ztywlx_fzhs` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `KJND` int(11) NOT NULL COMMENT '会计年度',
  `ZTYWLWLXID` bigint(20) NOT NULL COMMENT '账套业务类型ID',
  `DZID` bigint(20) NOT NULL COMMENT '对照ID',
  `FZHS_ID` bigint(20) NOT NULL COMMENT '辅助核算ID',
  `FZHS_TYPE` varchar(12) NOT NULL COMMENT '辅助核算类型',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ztdm_kjnd` (`ZTDM`,`KJND`),
  KEY `index_ztywlxid` (`ZTYWLWLXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_ztywlxpz`
--

DROP TABLE IF EXISTS `ch_ztywlxpz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_ztywlxpz` (
  `K_YWLXPZID` bigint(20) NOT NULL COMMENT '业务类型配置ID',
  `K_YWLXPZMC` varchar(64) NOT NULL,
  `K_YWLXID` bigint(20) NOT NULL,
  `K_HYID` int(11) NOT NULL,
  `K_KJHSZZID` int(11) NOT NULL,
  `K_KMNM` varchar(64) DEFAULT NULL,
  `K_YWLXZT` char(3) NOT NULL DEFAULT '1',
  `K_ZTDM` bigint(32) NOT NULL,
  `K_DZID` bigint(20) DEFAULT NULL COMMENT '对照ID',
  `K_KJND` int(11) DEFAULT NULL COMMENT '会计年度',
  PRIMARY KEY (`K_YWLXPZID`) USING BTREE,
  KEY `index_ztdm_kjnd_ywlxid` (`K_ZTDM`,`K_KJND`,`K_YWLXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='账套业务类型配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_ztywlxpz_copy`
--

DROP TABLE IF EXISTS `ch_ztywlxpz_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_ztywlxpz_copy` (
  `K_YWLXPZID` bigint(20) NOT NULL COMMENT '业务类型配置ID',
  `K_YWLXPZMC` varchar(64) NOT NULL,
  `K_YWLXID` bigint(20) NOT NULL,
  `K_HYID` int(11) NOT NULL,
  `K_KJHSZZID` int(11) NOT NULL,
  `K_KMNM` varchar(64) DEFAULT NULL,
  `K_YWLXZT` char(3) NOT NULL DEFAULT '1',
  `K_ZTDM` bigint(32) NOT NULL,
  PRIMARY KEY (`K_YWLXPZID`) USING BTREE,
  KEY `index_ztdm_kjnd` (`K_ZTDM`),
  KEY `index_ztdm_kjnd_ywlxid` (`K_ZTDM`,`K_YWLXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='账套业务类型配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ch_ztywlxpz_fzhs`
--

DROP TABLE IF EXISTS `ch_ztywlxpz_fzhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_ztywlxpz_fzhs` (
  `ID` bigint(20) NOT NULL,
  `ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `KJND` int(11) NOT NULL COMMENT '会计年度',
  `YWLXPZID` bigint(20) NOT NULL COMMENT '账套业务类型配置ID',
  `DZID` bigint(20) NOT NULL COMMENT '对照ID',
  `FZHS_ID` bigint(20) NOT NULL COMMENT '辅助核算ID',
  `FZHS_TYPE` varchar(12) NOT NULL COMMENT '辅助核算类型',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ztdm_kjnd` (`ZTDM`,`KJND`),
  KEY `index_ywlxpzid` (`YWLXPZID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fp_ch_fpmxdzb`
--

DROP TABLE IF EXISTS `fp_ch_fpmxdzb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_ch_fpmxdzb` (
  `ID` bigint(32) NOT NULL,
  `K_ZTDM` bigint(32) NOT NULL COMMENT ' 账套代码',
  `K_KJND` int(11) NOT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) NOT NULL COMMENT '会计期间',
  `K_ZBID` bigint(20) NOT NULL COMMENT '主表ID',
  `K_FPID` bigint(20) NOT NULL COMMENT '发票ID',
  `K_FPMXID` bigint(20) NOT NULL COMMENT '发票明细ID',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `index_ztdm` (`K_ZTDM`) USING BTREE,
  KEY `index_zbid` (`K_ZBID`) USING BTREE,
  KEY `index_fpmxid` (`K_FPMXID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票明细存货关系对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fp_ch_gxdzmxb`
--

DROP TABLE IF EXISTS `fp_ch_gxdzmxb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_ch_gxdzmxb` (
  `ID` bigint(50) NOT NULL,
  `K_ZBID` bigint(50) DEFAULT NULL COMMENT '主表ID',
  `K_RKRQ` date DEFAULT NULL COMMENT '入库日期',
  `K_CHID` bigint(20) DEFAULT NULL COMMENT '存货编号',
  `K_CHMC` varchar(128) DEFAULT NULL COMMENT '存货名称',
  `K_GGXH` varchar(128) DEFAULT NULL COMMENT '规格型号',
  `K_DW` varchar(32) DEFAULT NULL COMMENT '单位',
  `K_SL` decimal(20,8) DEFAULT NULL COMMENT '数量',
  `K_JE` decimal(18,2) DEFAULT NULL COMMENT '金额',
  `K_CZSJ` datetime DEFAULT NULL,
  `K_CZR` varchar(50) DEFAULT NULL COMMENT '操作人',
  `CREATE_USER` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `K_ZTDM` bigint(32) NOT NULL COMMENT '账套代码',
  `K_KJND` int(11) NOT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) NOT NULL COMMENT '会计期间',
  PRIMARY KEY (`ID`),
  KEY `index_zbid` (`K_ZBID`),
  KEY `chid_index` (`K_CHID`),
  KEY `index_ztdm_kjnd_kjqj` (`K_ZTDM`,`K_KJND`,`K_KJQJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票存货关系对应明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fp_ch_gxdzzb`
--

DROP TABLE IF EXISTS `fp_ch_gxdzzb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_ch_gxdzzb` (
  `ID` bigint(50) NOT NULL,
  `K_ZTDM` bigint(32) NOT NULL COMMENT ' 账套代码',
  `K_KJND` int(11) NOT NULL COMMENT '会计年度',
  `K_KJQJ` int(11) NOT NULL COMMENT '会计期间',
  `K_FPID` bigint(20) NOT NULL COMMENT '发票ID',
  `K_FPLX` char(3) NOT NULL COMMENT '发票类型（001 开票(销)-通用,101 收票（进）-通用)',
  `K_KPRQ` date DEFAULT NULL COMMENT '开票日期',
  `K_FPHM` varchar(50) DEFAULT NULL COMMENT '发票号码',
  `K_KPXM` varchar(500) DEFAULT NULL COMMENT '开票项目',
  `K_GGXH` varchar(128) DEFAULT NULL COMMENT '规格型号',
  `K_DW` varchar(32) DEFAULT NULL COMMENT '单位',
  `K_SL` decimal(20,8) DEFAULT NULL COMMENT '数量',
  `K_JE` decimal(18,2) NOT NULL COMMENT '金额',
  `IGNORE_ACCOUNTING` tinyint(4) DEFAULT '0' COMMENT '忽略核算标识 (0:忽略 1:不忽略)',
  `K_CZSJ` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `K_CZR` varchar(50) DEFAULT NULL,
  `CREATE_USER` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SALES_FLAG` int(1) DEFAULT '0' COMMENT '销售标志 内销-0 外销-1',
  `CUSTOMS_DECLARATION_NUMBER` varchar(64) DEFAULT NULL COMMENT '报关单号',
  PRIMARY KEY (`ID`),
  KEY `index` (`K_ZTDM`,`K_KJND`,`K_KJQJ`,`K_FPLX`) USING BTREE,
  KEY `index_fpid` (`K_ZTDM`,`K_KJND`,`K_KJQJ`,`K_FPLX`,`K_FPID`),
  KEY `index_fpmxid` (`K_ZTDM`,`K_KJND`,`K_KJQJ`,`K_FPLX`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票存货关系对应主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_behavior_record`
--

DROP TABLE IF EXISTS `user_behavior_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_behavior_record` (
  `k_ztdm` varchar(32) NOT NULL COMMENT '账套代码',
  `k_kjnd` int(11) NOT NULL COMMENT '会计年度',
  `k_kjqj` int(11) NOT NULL COMMENT '会计期间',
  `userid` bigint(32) NOT NULL COMMENT '用户ID',
  `module` varchar(32) NOT NULL COMMENT '模块',
  `func` varchar(100) NOT NULL COMMENT '功能',
  `behavior` varchar(32) NOT NULL COMMENT '行为',
  PRIMARY KEY (`k_ztdm`,`k_kjnd`,`k_kjqj`,`userid`,`module`,`func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-22 15:21:01

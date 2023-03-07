-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: 172.16.120.182    Database: fintax_task_0
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
-- Current Database: `fintax_task_0`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fintax_task_0` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fintax_task_0`;

--
-- Table structure for table `task_active_group`
--

DROP TABLE IF EXISTS `task_active_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_active_group` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `area_code` char(4) NOT NULL COMMENT '地区编码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_areaCode` (`area_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务信息记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_batch`
--

DROP TABLE IF EXISTS `task_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_batch` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `serial_no` bigint(20) NOT NULL COMMENT '批次号',
  `request_ip` char(15) NOT NULL COMMENT '请求IP',
  `client_id` varchar(100) DEFAULT NULL,
  `client_version` varchar(100) DEFAULT NULL,
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `login_name` varchar(100) NOT NULL COMMENT '用户登录名',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_serialNo` (`serial_no`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务批次信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_batch_detail`
--

DROP TABLE IF EXISTS `task_batch_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_batch_detail` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `serial_no` bigint(20) NOT NULL COMMENT '批次号',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务批次状态',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_serialNo` (`serial_no`),
  KEY `idx_taskId` (`task_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务批次关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_client_heartbeat`
--

DROP TABLE IF EXISTS `task_client_heartbeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_client_heartbeat` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `area_code` char(4) NOT NULL COMMENT '地区编码',
  `gs_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `login_name` varchar(100) DEFAULT NULL COMMENT '登录名',
  `request_ip` char(15) DEFAULT NULL COMMENT '请求IP地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_gsId_loginName` (`gs_id`,`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端心跳';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_black_list`
--

DROP TABLE IF EXISTS `task_config_black_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_black_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_template` varchar(50) DEFAULT NULL,
  `protocol` varchar(10) NOT NULL DEFAULT 'json',
  `area_code` char(4) NOT NULL DEFAULT '0',
  `gs_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '公司id',
  `qy_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '企业id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务类型',
  `sub_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '子任务类型',
  `report_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '报表id',
  `task_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '任务id',
  `client_version` varchar(100) DEFAULT NULL COMMENT '客户端版本号',
  `action_code` bigint(20) NOT NULL DEFAULT '1',
  `action_value` varchar(999) DEFAULT NULL,
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3845 DEFAULT CHARSET=utf8 COMMENT='任务黑名配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_control`
--

DROP TABLE IF EXISTS `task_config_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `area_code` char(4) NOT NULL COMMENT '地区编码',
  `control_code` varchar(50) NOT NULL COMMENT '控制内容编码',
  `type` int(11) NOT NULL COMMENT '控制类型',
  `value` varchar(99) NOT NULL COMMENT '控制值',
  `flag_control` tinyint(4) NOT NULL DEFAULT '0' COMMENT '控制标志 0 不控制 1 控制',
  `remark` varchar(999) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用标志',
  PRIMARY KEY (`id`),
  KEY `idx_areaCode_type_value` (`area_code`,`type`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='任务控制配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_login_type_mapping`
--

DROP TABLE IF EXISTS `task_config_login_type_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_login_type_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dlfs` varchar(5) NOT NULL,
  `gdsbz` varchar(2) NOT NULL,
  `bwz` varchar(20) NOT NULL,
  `fsz` varchar(20) NOT NULL,
  `is_enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_queue`
--

DROP TABLE IF EXISTS `task_config_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `area_code` char(4) NOT NULL COMMENT '地区编码',
  `priority` tinyint(4) NOT NULL DEFAULT '1',
  `action_code` int(11) NOT NULL,
  `action_type` tinyint(4) NOT NULL,
  `restrict_value` int(11) NOT NULL DEFAULT '-1',
  `reset_time` int(11) NOT NULL DEFAULT '-1',
  `action_expression` varchar(100) DEFAULT NULL,
  `action_desc` varchar(100) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='任务队列配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_report_personal_tax`
--

DROP TABLE IF EXISTS `task_config_report_personal_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_report_personal_tax` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '启用标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8 COMMENT='个税配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_report_template`
--

DROP TABLE IF EXISTS `task_config_report_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_report_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `flag_collect` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否采集标志 1 采集 0 不采集',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '启用标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集报表模板配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_source`
--

DROP TABLE IF EXISTS `task_config_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `area_code` char(4) NOT NULL COMMENT '地区编码',
  `source` varchar(20) NOT NULL COMMENT '源',
  `type` tinyint(4) NOT NULL COMMENT '源类型 1 地区 2 公司 3 企业 4 任务类型 5 税表 6 任务',
  `value` bigint(20) DEFAULT NULL COMMENT '源值',
  `queue` bigint(20) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_a_s_t_v` (`area_code`,`source`,`type`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=1481679342604910715 DEFAULT CHARSET=utf8 COMMENT='任务控制配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_submit`
--

DROP TABLE IF EXISTS `task_config_submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_submit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gs_id` bigint(20) NOT NULL COMMENT '代账公司ID',
  `flag_submit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提交标志 0 否 1 是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `flag_payment` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_gsId` (`gs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1481679345549312217 DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_submit2`
--

DROP TABLE IF EXISTS `task_config_submit2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_submit2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gs_id` bigint(20) NOT NULL COMMENT '代账公司ID',
  `flag_submit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提交标志 0 否 1 是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `flag_payment` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6872 DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_tpl`
--

DROP TABLE IF EXISTS `task_config_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_tpl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tpl_code` varchar(50) NOT NULL,
  `tpl_value` varchar(20000) NOT NULL,
  `is_enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_tpl_code` (`tpl_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_config_tpl_relate_rwlx`
--

DROP TABLE IF EXISTS `task_config_tpl_relate_rwlx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_config_tpl_relate_rwlx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rwlx` varchar(50) NOT NULL,
  `xzqh_code` varchar(5) DEFAULT NULL,
  `tpl_code` varchar(50) NOT NULL,
  `is_enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_0`
--

DROP TABLE IF EXISTS `task_data_extra_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_1`
--

DROP TABLE IF EXISTS `task_data_extra_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_10`
--

DROP TABLE IF EXISTS `task_data_extra_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_11`
--

DROP TABLE IF EXISTS `task_data_extra_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_12`
--

DROP TABLE IF EXISTS `task_data_extra_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_13`
--

DROP TABLE IF EXISTS `task_data_extra_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_14`
--

DROP TABLE IF EXISTS `task_data_extra_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_15`
--

DROP TABLE IF EXISTS `task_data_extra_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_2`
--

DROP TABLE IF EXISTS `task_data_extra_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_3`
--

DROP TABLE IF EXISTS `task_data_extra_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_4`
--

DROP TABLE IF EXISTS `task_data_extra_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_5`
--

DROP TABLE IF EXISTS `task_data_extra_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_6`
--

DROP TABLE IF EXISTS `task_data_extra_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_7`
--

DROP TABLE IF EXISTS `task_data_extra_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_8`
--

DROP TABLE IF EXISTS `task_data_extra_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_9`
--

DROP TABLE IF EXISTS `task_data_extra_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_dict_status_desc`
--

DROP TABLE IF EXISTS `task_dict_status_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_dict_status_desc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` char(6) NOT NULL COMMENT '状态码',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `remark` varchar(100) NOT NULL COMMENT '备注',
  `short_desc` varchar(50) NOT NULL COMMENT '简述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COMMENT='任务状态码描述字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_0`
--

DROP TABLE IF EXISTS `task_image_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_1`
--

DROP TABLE IF EXISTS `task_image_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_10`
--

DROP TABLE IF EXISTS `task_image_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_11`
--

DROP TABLE IF EXISTS `task_image_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_12`
--

DROP TABLE IF EXISTS `task_image_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_13`
--

DROP TABLE IF EXISTS `task_image_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_14`
--

DROP TABLE IF EXISTS `task_image_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_15`
--

DROP TABLE IF EXISTS `task_image_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_2`
--

DROP TABLE IF EXISTS `task_image_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_3`
--

DROP TABLE IF EXISTS `task_image_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_4`
--

DROP TABLE IF EXISTS `task_image_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_5`
--

DROP TABLE IF EXISTS `task_image_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_6`
--

DROP TABLE IF EXISTS `task_image_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_7`
--

DROP TABLE IF EXISTS `task_image_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_8`
--

DROP TABLE IF EXISTS `task_image_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_9`
--

DROP TABLE IF EXISTS `task_image_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_log`
--

DROP TABLE IF EXISTS `task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_log` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `serial_no` bigint(20) DEFAULT NULL COMMENT '任务批次号',
  `in_time` timestamp NULL DEFAULT NULL COMMENT '任务入栈时间',
  `out_time` timestamp NULL DEFAULT NULL COMMENT '任务出栈时间',
  `in_file_path` varchar(99) DEFAULT NULL COMMENT '入栈报文路径',
  `out_file_path` varchar(99) DEFAULT NULL COMMENT '出栈报文路径',
  `login_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `status` tinyint(4) DEFAULT NULL COMMENT '接口调用状态',
  `in_ex_desc` varchar(999) DEFAULT NULL COMMENT '入栈异常信息描述',
  `out_ex_desc` varchar(999) DEFAULT NULL COMMENT '出栈异常信息描述',
  `interface_name` varchar(40) DEFAULT NULL COMMENT '调用接口名称',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_serialNo` (`serial_no`),
  KEY `idx_outTime` (`out_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_0`
--

DROP TABLE IF EXISTS `task_master_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_0` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_1`
--

DROP TABLE IF EXISTS `task_master_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_1` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_10`
--

DROP TABLE IF EXISTS `task_master_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_10` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_11`
--

DROP TABLE IF EXISTS `task_master_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_11` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_12`
--

DROP TABLE IF EXISTS `task_master_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_12` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_13`
--

DROP TABLE IF EXISTS `task_master_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_13` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_14`
--

DROP TABLE IF EXISTS `task_master_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_14` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_15`
--

DROP TABLE IF EXISTS `task_master_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_15` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_2`
--

DROP TABLE IF EXISTS `task_master_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_2` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_3`
--

DROP TABLE IF EXISTS `task_master_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_3` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_4`
--

DROP TABLE IF EXISTS `task_master_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_4` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_5`
--

DROP TABLE IF EXISTS `task_master_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_5` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_6`
--

DROP TABLE IF EXISTS `task_master_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_6` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_7`
--

DROP TABLE IF EXISTS `task_master_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_7` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_8`
--

DROP TABLE IF EXISTS `task_master_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_8` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_9`
--

DROP TABLE IF EXISTS `task_master_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_9` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_queue`
--

DROP TABLE IF EXISTS `task_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_queue` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `config_id` bigint(20) NOT NULL,
  `qy_id` bigint(20) NOT NULL,
  `task_id` bigint(20) NOT NULL,
  `action_value` varchar(100) DEFAULT NULL,
  `status_code` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用标志',
  PRIMARY KEY (`id`),
  KEY `idx_taskId` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务队列';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_record`
--

DROP TABLE IF EXISTS `task_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_record` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `client_version` varchar(100) DEFAULT NULL COMMENT '版本号',
  `protocol_text` mediumtext COMMENT '任务报文',
  `source` varchar(20) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_taskId` (`task_id`),
  KEY `idx_createTime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务信息记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_schedule`
--

DROP TABLE IF EXISTS `task_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_schedule` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '租户ID',
  `binding_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '绑定ID',
  `qy_id` bigint(20) NOT NULL,
  `gs_id` bigint(20) NOT NULL COMMENT '代账公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '报表ID',
  `area_code` char(4) NOT NULL COMMENT '地区编码',
  `task_id` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '子任务类型',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务权重值',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  `source` varchar(50) DEFAULT NULL COMMENT '任务源',
  `target_id` varchar(50) NOT NULL DEFAULT '-1' COMMENT '目标ID',
  `serial_no` bigint(20) NOT NULL DEFAULT '-1' COMMENT '批次号',
  `login_type` varchar(20) NOT NULL DEFAULT '' COMMENT '登录类型',
  `login_name` varchar(50) NOT NULL DEFAULT '' COMMENT '登录名',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '1',
  `task_status` char(10) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_g_a_q_w` (`gs_id`,`area_code`,`queue`,`weight`),
  KEY `idx_q_l_a_s` (`queue`,`login_name`,`area_code`,`status_code`),
  KEY `idx_taskId` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_0`
--

DROP TABLE IF EXISTS `task_url_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_1`
--

DROP TABLE IF EXISTS `task_url_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_10`
--

DROP TABLE IF EXISTS `task_url_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_11`
--

DROP TABLE IF EXISTS `task_url_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_12`
--

DROP TABLE IF EXISTS `task_url_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_13`
--

DROP TABLE IF EXISTS `task_url_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_14`
--

DROP TABLE IF EXISTS `task_url_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_15`
--

DROP TABLE IF EXISTS `task_url_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_2`
--

DROP TABLE IF EXISTS `task_url_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_3`
--

DROP TABLE IF EXISTS `task_url_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_4`
--

DROP TABLE IF EXISTS `task_url_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_5`
--

DROP TABLE IF EXISTS `task_url_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_6`
--

DROP TABLE IF EXISTS `task_url_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_7`
--

DROP TABLE IF EXISTS `task_url_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_8`
--

DROP TABLE IF EXISTS `task_url_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_9`
--

DROP TABLE IF EXISTS `task_url_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `fintax_task_1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fintax_task_1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fintax_task_1`;

--
-- Table structure for table `task_data_extra_0`
--

DROP TABLE IF EXISTS `task_data_extra_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_1`
--

DROP TABLE IF EXISTS `task_data_extra_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_10`
--

DROP TABLE IF EXISTS `task_data_extra_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_11`
--

DROP TABLE IF EXISTS `task_data_extra_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_12`
--

DROP TABLE IF EXISTS `task_data_extra_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_13`
--

DROP TABLE IF EXISTS `task_data_extra_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_14`
--

DROP TABLE IF EXISTS `task_data_extra_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_15`
--

DROP TABLE IF EXISTS `task_data_extra_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_2`
--

DROP TABLE IF EXISTS `task_data_extra_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_3`
--

DROP TABLE IF EXISTS `task_data_extra_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_4`
--

DROP TABLE IF EXISTS `task_data_extra_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_5`
--

DROP TABLE IF EXISTS `task_data_extra_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_6`
--

DROP TABLE IF EXISTS `task_data_extra_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_7`
--

DROP TABLE IF EXISTS `task_data_extra_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_8`
--

DROP TABLE IF EXISTS `task_data_extra_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_9`
--

DROP TABLE IF EXISTS `task_data_extra_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_0`
--

DROP TABLE IF EXISTS `task_image_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_1`
--

DROP TABLE IF EXISTS `task_image_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_10`
--

DROP TABLE IF EXISTS `task_image_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_11`
--

DROP TABLE IF EXISTS `task_image_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_12`
--

DROP TABLE IF EXISTS `task_image_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_13`
--

DROP TABLE IF EXISTS `task_image_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_14`
--

DROP TABLE IF EXISTS `task_image_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_15`
--

DROP TABLE IF EXISTS `task_image_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_2`
--

DROP TABLE IF EXISTS `task_image_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_3`
--

DROP TABLE IF EXISTS `task_image_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_4`
--

DROP TABLE IF EXISTS `task_image_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_5`
--

DROP TABLE IF EXISTS `task_image_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_6`
--

DROP TABLE IF EXISTS `task_image_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_7`
--

DROP TABLE IF EXISTS `task_image_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_8`
--

DROP TABLE IF EXISTS `task_image_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_9`
--

DROP TABLE IF EXISTS `task_image_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_0`
--

DROP TABLE IF EXISTS `task_master_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_0` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_1`
--

DROP TABLE IF EXISTS `task_master_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_1` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_10`
--

DROP TABLE IF EXISTS `task_master_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_10` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_11`
--

DROP TABLE IF EXISTS `task_master_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_11` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_12`
--

DROP TABLE IF EXISTS `task_master_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_12` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_13`
--

DROP TABLE IF EXISTS `task_master_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_13` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_14`
--

DROP TABLE IF EXISTS `task_master_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_14` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_15`
--

DROP TABLE IF EXISTS `task_master_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_15` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_2`
--

DROP TABLE IF EXISTS `task_master_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_2` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_3`
--

DROP TABLE IF EXISTS `task_master_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_3` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_4`
--

DROP TABLE IF EXISTS `task_master_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_4` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_5`
--

DROP TABLE IF EXISTS `task_master_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_5` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_6`
--

DROP TABLE IF EXISTS `task_master_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_6` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_7`
--

DROP TABLE IF EXISTS `task_master_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_7` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_8`
--

DROP TABLE IF EXISTS `task_master_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_8` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_9`
--

DROP TABLE IF EXISTS `task_master_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_9` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `ext_11` tinyint(4) DEFAULT NULL COMMENT '扩展字段11',
  `ext_12` tinyint(4) DEFAULT NULL COMMENT '扩展字段12',
  `ext_13` bigint(20) DEFAULT NULL COMMENT '扩展字段13',
  `ext_14` bigint(20) DEFAULT NULL COMMENT '扩展字段14',
  `ext_15` varchar(100) DEFAULT NULL COMMENT '扩展字段15',
  `ext_16` varchar(100) DEFAULT NULL COMMENT '扩展字段16',
  `ext_17` varchar(100) DEFAULT NULL COMMENT '扩展字段17',
  `ext_18` varchar(100) DEFAULT NULL COMMENT '扩展字段18',
  `ext_19` varchar(200) DEFAULT NULL COMMENT '扩展字段19',
  `ext_20` varchar(200) DEFAULT NULL COMMENT '扩展字段20',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_0`
--

DROP TABLE IF EXISTS `task_url_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_1`
--

DROP TABLE IF EXISTS `task_url_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_10`
--

DROP TABLE IF EXISTS `task_url_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_11`
--

DROP TABLE IF EXISTS `task_url_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_12`
--

DROP TABLE IF EXISTS `task_url_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_13`
--

DROP TABLE IF EXISTS `task_url_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_14`
--

DROP TABLE IF EXISTS `task_url_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_15`
--

DROP TABLE IF EXISTS `task_url_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_2`
--

DROP TABLE IF EXISTS `task_url_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_3`
--

DROP TABLE IF EXISTS `task_url_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_4`
--

DROP TABLE IF EXISTS `task_url_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_5`
--

DROP TABLE IF EXISTS `task_url_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_6`
--

DROP TABLE IF EXISTS `task_url_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_7`
--

DROP TABLE IF EXISTS `task_url_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_8`
--

DROP TABLE IF EXISTS `task_url_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_9`
--

DROP TABLE IF EXISTS `task_url_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `fintax_task_2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fintax_task_2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fintax_task_2`;

--
-- Table structure for table `task_data_extra_0`
--

DROP TABLE IF EXISTS `task_data_extra_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_1`
--

DROP TABLE IF EXISTS `task_data_extra_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_10`
--

DROP TABLE IF EXISTS `task_data_extra_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_11`
--

DROP TABLE IF EXISTS `task_data_extra_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_12`
--

DROP TABLE IF EXISTS `task_data_extra_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_13`
--

DROP TABLE IF EXISTS `task_data_extra_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_14`
--

DROP TABLE IF EXISTS `task_data_extra_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_15`
--

DROP TABLE IF EXISTS `task_data_extra_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_2`
--

DROP TABLE IF EXISTS `task_data_extra_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_3`
--

DROP TABLE IF EXISTS `task_data_extra_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_4`
--

DROP TABLE IF EXISTS `task_data_extra_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_5`
--

DROP TABLE IF EXISTS `task_data_extra_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_6`
--

DROP TABLE IF EXISTS `task_data_extra_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_7`
--

DROP TABLE IF EXISTS `task_data_extra_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_8`
--

DROP TABLE IF EXISTS `task_data_extra_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_9`
--

DROP TABLE IF EXISTS `task_data_extra_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_0`
--

DROP TABLE IF EXISTS `task_image_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_1`
--

DROP TABLE IF EXISTS `task_image_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_10`
--

DROP TABLE IF EXISTS `task_image_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_11`
--

DROP TABLE IF EXISTS `task_image_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_12`
--

DROP TABLE IF EXISTS `task_image_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_13`
--

DROP TABLE IF EXISTS `task_image_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_14`
--

DROP TABLE IF EXISTS `task_image_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_15`
--

DROP TABLE IF EXISTS `task_image_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_2`
--

DROP TABLE IF EXISTS `task_image_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_3`
--

DROP TABLE IF EXISTS `task_image_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_4`
--

DROP TABLE IF EXISTS `task_image_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_5`
--

DROP TABLE IF EXISTS `task_image_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_6`
--

DROP TABLE IF EXISTS `task_image_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_7`
--

DROP TABLE IF EXISTS `task_image_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_8`
--

DROP TABLE IF EXISTS `task_image_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_9`
--

DROP TABLE IF EXISTS `task_image_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_0`
--

DROP TABLE IF EXISTS `task_master_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_0` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_1`
--

DROP TABLE IF EXISTS `task_master_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_1` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_10`
--

DROP TABLE IF EXISTS `task_master_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_10` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_11`
--

DROP TABLE IF EXISTS `task_master_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_11` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_12`
--

DROP TABLE IF EXISTS `task_master_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_12` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_13`
--

DROP TABLE IF EXISTS `task_master_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_13` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_14`
--

DROP TABLE IF EXISTS `task_master_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_14` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_15`
--

DROP TABLE IF EXISTS `task_master_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_15` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_2`
--

DROP TABLE IF EXISTS `task_master_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_2` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_3`
--

DROP TABLE IF EXISTS `task_master_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_3` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_4`
--

DROP TABLE IF EXISTS `task_master_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_4` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_5`
--

DROP TABLE IF EXISTS `task_master_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_5` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_6`
--

DROP TABLE IF EXISTS `task_master_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_6` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_7`
--

DROP TABLE IF EXISTS `task_master_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_7` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_8`
--

DROP TABLE IF EXISTS `task_master_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_8` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_9`
--

DROP TABLE IF EXISTS `task_master_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_9` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_0`
--

DROP TABLE IF EXISTS `task_url_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_1`
--

DROP TABLE IF EXISTS `task_url_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_10`
--

DROP TABLE IF EXISTS `task_url_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_11`
--

DROP TABLE IF EXISTS `task_url_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_12`
--

DROP TABLE IF EXISTS `task_url_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_13`
--

DROP TABLE IF EXISTS `task_url_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_14`
--

DROP TABLE IF EXISTS `task_url_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_15`
--

DROP TABLE IF EXISTS `task_url_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_2`
--

DROP TABLE IF EXISTS `task_url_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_3`
--

DROP TABLE IF EXISTS `task_url_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_4`
--

DROP TABLE IF EXISTS `task_url_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_5`
--

DROP TABLE IF EXISTS `task_url_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_6`
--

DROP TABLE IF EXISTS `task_url_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_7`
--

DROP TABLE IF EXISTS `task_url_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_8`
--

DROP TABLE IF EXISTS `task_url_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_9`
--

DROP TABLE IF EXISTS `task_url_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `fintax_task_3`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fintax_task_3` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fintax_task_3`;

--
-- Table structure for table `task_data_extra_0`
--

DROP TABLE IF EXISTS `task_data_extra_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_1`
--

DROP TABLE IF EXISTS `task_data_extra_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_10`
--

DROP TABLE IF EXISTS `task_data_extra_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_11`
--

DROP TABLE IF EXISTS `task_data_extra_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_12`
--

DROP TABLE IF EXISTS `task_data_extra_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_13`
--

DROP TABLE IF EXISTS `task_data_extra_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_14`
--

DROP TABLE IF EXISTS `task_data_extra_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_15`
--

DROP TABLE IF EXISTS `task_data_extra_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_2`
--

DROP TABLE IF EXISTS `task_data_extra_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_3`
--

DROP TABLE IF EXISTS `task_data_extra_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_4`
--

DROP TABLE IF EXISTS `task_data_extra_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_5`
--

DROP TABLE IF EXISTS `task_data_extra_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_6`
--

DROP TABLE IF EXISTS `task_data_extra_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_7`
--

DROP TABLE IF EXISTS `task_data_extra_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_8`
--

DROP TABLE IF EXISTS `task_data_extra_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_data_extra_9`
--

DROP TABLE IF EXISTS `task_data_extra_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_data_extra_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `data` mediumtext COMMENT '外部数据文本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId_taskId` (`qy_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_0`
--

DROP TABLE IF EXISTS `task_image_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_1`
--

DROP TABLE IF EXISTS `task_image_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_10`
--

DROP TABLE IF EXISTS `task_image_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_11`
--

DROP TABLE IF EXISTS `task_image_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_12`
--

DROP TABLE IF EXISTS `task_image_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_13`
--

DROP TABLE IF EXISTS `task_image_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_14`
--

DROP TABLE IF EXISTS `task_image_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_15`
--

DROP TABLE IF EXISTS `task_image_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_2`
--

DROP TABLE IF EXISTS `task_image_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_3`
--

DROP TABLE IF EXISTS `task_image_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_4`
--

DROP TABLE IF EXISTS `task_image_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_5`
--

DROP TABLE IF EXISTS `task_image_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_6`
--

DROP TABLE IF EXISTS `task_image_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_7`
--

DROP TABLE IF EXISTS `task_image_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_8`
--

DROP TABLE IF EXISTS `task_image_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_image_9`
--

DROP TABLE IF EXISTS `task_image_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_image_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `image_type` varchar(20) DEFAULT 'URL' COMMENT '图片存储类型 默认远程地址',
  `image` varchar(999) DEFAULT '' COMMENT '图片内容',
  `result_type` varchar(100) DEFAULT NULL COMMENT '结果类型',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截图事件',
  `remark` varchar(999) DEFAULT '' COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_taskId_image` (`task_id`,`image`),
  KEY `idx_qyId_kjnd_kjqj` (`qy_id`,`kjnd`,`kjqj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务截图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_0`
--

DROP TABLE IF EXISTS `task_master_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_0` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_1`
--

DROP TABLE IF EXISTS `task_master_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_1` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_10`
--

DROP TABLE IF EXISTS `task_master_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_10` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_11`
--

DROP TABLE IF EXISTS `task_master_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_11` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_12`
--

DROP TABLE IF EXISTS `task_master_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_12` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_13`
--

DROP TABLE IF EXISTS `task_master_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_13` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_14`
--

DROP TABLE IF EXISTS `task_master_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_14` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_15`
--

DROP TABLE IF EXISTS `task_master_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_15` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_2`
--

DROP TABLE IF EXISTS `task_master_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_2` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_3`
--

DROP TABLE IF EXISTS `task_master_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_3` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_4`
--

DROP TABLE IF EXISTS `task_master_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_4` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_5`
--

DROP TABLE IF EXISTS `task_master_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_5` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_6`
--

DROP TABLE IF EXISTS `task_master_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_6` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_7`
--

DROP TABLE IF EXISTS `task_master_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_7` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_8`
--

DROP TABLE IF EXISTS `task_master_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_8` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master_9`
--

DROP TABLE IF EXISTS `task_master_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master_9` (
  `id` bigint(20) NOT NULL COMMENT '主键 ',
  `type` tinyint(4) NOT NULL COMMENT '任务类型',
  `sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务状态更新时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '任务下发时间',
  `source` varchar(50) NOT NULL COMMENT '任务来源',
  `target` varchar(100) DEFAULT NULL COMMENT '执行任务目标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `queue` bigint(20) NOT NULL DEFAULT '0' COMMENT '队列 默认0 未分配队列',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行权值',
  `protocol_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报文组装状态',
  `protocol_time` timestamp NULL DEFAULT NULL COMMENT '报文修改时间',
  `schedule_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注',
  `user_remark` varchar(999) DEFAULT NULL COMMENT '用户备注信息',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext_1` tinyint(4) DEFAULT NULL COMMENT '扩展字段1',
  `ext_2` tinyint(4) DEFAULT NULL COMMENT '扩展字段2',
  `ext_3` bigint(20) DEFAULT NULL COMMENT '扩展字段3',
  `ext_4` bigint(20) DEFAULT NULL COMMENT '扩展字段4',
  `ext_5` varchar(100) DEFAULT NULL COMMENT '扩展字段5',
  `ext_6` varchar(100) DEFAULT NULL COMMENT '扩展字段6',
  `ext_7` varchar(100) DEFAULT NULL COMMENT '扩展字段7',
  `ext_8` varchar(100) DEFAULT NULL COMMENT '扩展字段8',
  `ext_9` varchar(200) DEFAULT NULL COMMENT '扩展字段9',
  `ext_10` varchar(200) DEFAULT NULL COMMENT '扩展字段10',
  `group_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `idx_gsId` (`gs_id`),
  KEY `idx_parentId` (`parent_id`),
  KEY `idx_q_k_k_r` (`qy_id`,`kjnd`,`kjqj`,`report_id`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_0`
--

DROP TABLE IF EXISTS `task_url_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_0` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_1`
--

DROP TABLE IF EXISTS `task_url_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_1` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_10`
--

DROP TABLE IF EXISTS `task_url_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_10` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_11`
--

DROP TABLE IF EXISTS `task_url_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_11` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_12`
--

DROP TABLE IF EXISTS `task_url_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_12` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_13`
--

DROP TABLE IF EXISTS `task_url_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_13` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_14`
--

DROP TABLE IF EXISTS `task_url_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_14` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_15`
--

DROP TABLE IF EXISTS `task_url_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_15` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_2`
--

DROP TABLE IF EXISTS `task_url_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_2` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_3`
--

DROP TABLE IF EXISTS `task_url_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_3` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_4`
--

DROP TABLE IF EXISTS `task_url_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_4` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_5`
--

DROP TABLE IF EXISTS `task_url_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_5` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_6`
--

DROP TABLE IF EXISTS `task_url_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_6` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_7`
--

DROP TABLE IF EXISTS `task_url_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_7` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_8`
--

DROP TABLE IF EXISTS `task_url_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_8` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_url_9`
--

DROP TABLE IF EXISTS `task_url_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_url_9` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `qy_id` bigint(20) NOT NULL COMMENT '企业ID',
  `gs_id` bigint(20) NOT NULL COMMENT '公司ID',
  `kjnd` int(4) NOT NULL COMMENT '会计年度',
  `kjqj` int(2) NOT NULL COMMENT '会计期间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `report_id` bigint(20) DEFAULT NULL COMMENT '报表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `area_code` char(4) NOT NULL COMMENT '行政区划编码',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型',
  `task_sub_type` tinyint(4) DEFAULT NULL COMMENT '任务子类型',
  `status_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态码',
  `task_status` char(10) NOT NULL DEFAULT '0' COMMENT '任务返回码',
  `name` varchar(999) DEFAULT NULL COMMENT 'url名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'url类型码',
  `type_desc` varchar(20) DEFAULT 'URL' COMMENT 'url类型描述',
  `url` varchar(999) DEFAULT NULL COMMENT '图片内容',
  `generate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'url时间',
  `remark` varchar(999) DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_qyId` (`qy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务url记录';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-22 15:21:52

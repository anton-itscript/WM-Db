/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50544
Source Host           : localhost:3306
Source Database       : wm

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2015-11-10 11:28:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for access_global
-- ----------------------------
DROP TABLE IF EXISTS `access_global`;
CREATE TABLE `access_global` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enable` enum('0','1') NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_action_controller` (`controller`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='Global access, seting onli SuperAdmin';

-- ----------------------------
-- Records of access_global
-- ----------------------------
INSERT INTO `access_global` VALUES ('1', 'Site', 'Index', '1', null);
INSERT INTO `access_global` VALUES ('2', 'Site', 'AwsPanel', '1', '');
INSERT INTO `access_global` VALUES ('3', 'Site', 'AwsSingle', '1', null);
INSERT INTO `access_global` VALUES ('4', 'Site', 'AwsGraph', '1', null);
INSERT INTO `access_global` VALUES ('5', 'Site', 'AwsTable', '1', null);
INSERT INTO `access_global` VALUES ('6', 'Site', 'RgPanel', '1', '');
INSERT INTO `access_global` VALUES ('7', 'Site', 'RgTable', '1', '');
INSERT INTO `access_global` VALUES ('8', 'Site', 'RgGraph', '1', '');
INSERT INTO `access_global` VALUES ('9', 'Site', 'MsgHistory', '1', null);
INSERT INTO `access_global` VALUES ('10', 'Site', 'Export', '1', null);
INSERT INTO `access_global` VALUES ('11', 'Site', 'Schedule', '1', null);
INSERT INTO `access_global` VALUES ('12', 'Site', 'Schedulehistory', '1', null);
INSERT INTO `access_global` VALUES ('13', 'Site', 'ScheduleDownload', '1', null);
INSERT INTO `access_global` VALUES ('14', 'Site', 'Login', '1', 'Login page.');
INSERT INTO `access_global` VALUES ('15', 'Site', 'Logout', '1', null);
INSERT INTO `access_global` VALUES ('16', 'Admin', 'Index', '1', null);
INSERT INTO `access_global` VALUES ('17', 'Admin', 'Stations', '1', null);
INSERT INTO `access_global` VALUES ('18', 'Admin', 'StationSave', '1', null);
INSERT INTO `access_global` VALUES ('19', 'Admin', 'StationDelete', '1', null);
INSERT INTO `access_global` VALUES ('20', 'Admin', 'Sensors', '1', null);
INSERT INTO `access_global` VALUES ('21', 'Admin', 'CalculationSave', '1', null);
INSERT INTO `access_global` VALUES ('22', 'Admin', 'CalculationDelete', '1', null);
INSERT INTO `access_global` VALUES ('23', 'Admin', 'DeleteSensor', '1', null);
INSERT INTO `access_global` VALUES ('24', 'Admin', 'Sensor', '1', null);
INSERT INTO `access_global` VALUES ('25', 'Admin', 'Connections', '1', null);
INSERT INTO `access_global` VALUES ('26', 'Admin', 'ConnectionsLog', '1', null);
INSERT INTO `access_global` VALUES ('27', 'Admin', 'Xmllog', '1', null);
INSERT INTO `access_global` VALUES ('28', 'Admin', 'StartListening', '1', null);
INSERT INTO `access_global` VALUES ('29', 'Admin', 'StopListening', '1', null);
INSERT INTO `access_global` VALUES ('30', 'Admin', 'GetStatus', '1', null);
INSERT INTO `access_global` VALUES ('31', 'Admin', 'Setup', '1', null);
INSERT INTO `access_global` VALUES ('32', 'Admin', 'SetupOther', '1', null);
INSERT INTO `access_global` VALUES ('33', 'Admin', 'Dbsetup', '1', null);
INSERT INTO `access_global` VALUES ('34', 'Admin', 'SetupSensors', '1', null);
INSERT INTO `access_global` VALUES ('35', 'Admin', 'SetupSensor', '1', '');
INSERT INTO `access_global` VALUES ('36', 'Admin', 'Mailsetup', '1', null);
INSERT INTO `access_global` VALUES ('37', 'Admin', 'Importmsg', '1', null);
INSERT INTO `access_global` VALUES ('38', 'Admin', 'Importxml', '1', null);
INSERT INTO `access_global` VALUES ('39', 'Admin', 'MsgGeneration', '1', null);
INSERT INTO `access_global` VALUES ('40', 'Admin', 'AwsFiltered', '1', '');
INSERT INTO `access_global` VALUES ('41', 'Admin', 'DeleteForwardInfo', '1', null);
INSERT INTO `access_global` VALUES ('42', 'Admin', 'Users', '1', null);
INSERT INTO `access_global` VALUES ('43', 'Admin', 'User', '1', null);
INSERT INTO `access_global` VALUES ('44', 'Admin', 'UserDelete', '1', null);
INSERT INTO `access_global` VALUES ('45', 'Admin', 'UserAccessChange', '1', null);
INSERT INTO `access_global` VALUES ('46', 'Admin', 'ForwardList', '1', null);
INSERT INTO `access_global` VALUES ('48', 'Admin', 'StationGroups', '1', '');
INSERT INTO `access_global` VALUES ('49', 'Admin', 'HeartbeatReports', '1', 'Heartbeat Reports List');
INSERT INTO `access_global` VALUES ('50', 'Admin', 'HeartbeatReport', '1', 'View Heartbeat Report');
INSERT INTO `access_global` VALUES ('51', 'Admin', 'Coefficients', '1', 'Setting Coefficients for Calculation');
INSERT INTO `access_global` VALUES ('52', 'Admin', 'EditSensor', '1', 'Edit Station Sensor');
INSERT INTO `access_global` VALUES ('53', 'Admin', 'ExportAdminsSettings', '1', 'Export Admins Settings');
INSERT INTO `access_global` VALUES ('54', 'Site', 'ScheduleStationHistory', '1', '');
INSERT INTO `access_global` VALUES ('55', 'Site', 'StationTypeDataExport', '1', '');
INSERT INTO `access_global` VALUES ('56', 'Site', 'StationTypeDataHistory', '1', '');
INSERT INTO `access_global` VALUES ('57', 'Site', 'ScheduleTypeDownload', '1', '');
INSERT INTO `access_global` VALUES ('58', 'Admin', 'SendSmsCommand', '1', '');
INSERT INTO `access_global` VALUES ('59', 'Admin', 'SmsCommandSetup', '1', '');
INSERT INTO `access_global` VALUES ('60', 'Admin', 'GenerateSmsCommand', '1', '');

-- ----------------------------
-- Table structure for access_user
-- ----------------------------
DROP TABLE IF EXISTS `access_user`;
CREATE TABLE `access_user` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action_id` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_action_user` (`user_id`,`action_id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `access_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `access_user_ibfk_2` FOREIGN KEY (`action_id`) REFERENCES `access_global` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Access user, seting Admin, SuperAdmin';

-- ----------------------------
-- Records of access_user
-- ----------------------------

-- ----------------------------
-- Table structure for backup_old_data
-- ----------------------------
DROP TABLE IF EXISTS `backup_old_data`;
CREATE TABLE `backup_old_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backup_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_timestamp_limit` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completed` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backup_old_data
-- ----------------------------

-- ----------------------------
-- Table structure for backup_old_data_log
-- ----------------------------
DROP TABLE IF EXISTS `backup_old_data_log`;
CREATE TABLE `backup_old_data_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `backup_id` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `backup_id` (`backup_id`),
  CONSTRAINT `backup_old_data_log_fk` FOREIGN KEY (`backup_id`) REFERENCES `backup_old_data` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backup_old_data_log
-- ----------------------------

-- ----------------------------
-- Table structure for calculation_handler
-- ----------------------------
DROP TABLE IF EXISTS `calculation_handler`;
CREATE TABLE `calculation_handler` (
  `handler_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `handler_id_code` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `metric_id` tinyint(4) NOT NULL,
  `default_prefix` varchar(2) NOT NULL,
  `aws_panel_display_position` tinyint(4) NOT NULL DEFAULT '0',
  `aws_panel_show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`handler_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calculation_handler
-- ----------------------------
INSERT INTO `calculation_handler` VALUES ('1', 'DewPoint', 'Dew Point', '2', 'DP', '0', '1');
INSERT INTO `calculation_handler` VALUES ('2', 'PressureSeaLevel', 'Pressure MSL', '20', 'PS', '0', '1');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `config_id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `value` text,
  `default` text NOT NULL,
  `type` varchar(128) NOT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'HEARTBEAT_REPORT_STATUS', 'status', '0', '0', 'bool');
INSERT INTO `config` VALUES ('2', 'HEARTBEAT_REPORT_PERIOD', 'period', 'T', 'd', 'char');
INSERT INTO `config` VALUES ('3', 'HEARTBEAT_REPORT_EMAIL', 'report to', 'alexandr.vysotsky@itscript.com', '', 'array');
INSERT INTO `config` VALUES ('4', 'HEARTBEAT_REPORT_CLIENT_NAME', 'client name', 'Vas9', 'CLIENT', 'string');
INSERT INTO `config` VALUES ('5', 'SITE_AWSGRAPH_GAPSIZE', 'Site AWSGraph gapSize', '3000', '5', 'integer');
INSERT INTO `config` VALUES ('6', 'SYNC_SERVER_IP', 'IP address', '192.168.1.1', '10.10.10.10', 'string');
INSERT INTO `config` VALUES ('7', 'SYNC_SERVER_PORT', 'Port', '4523', '80', 'int');
INSERT INTO `config` VALUES ('8', 'SYNC_REMOTE_SERVER_IP', 'Remote server IP address', '192.168.1.1', '10.10.10.10', 'string');
INSERT INTO `config` VALUES ('9', 'SYNC_REMOTE_SERVER_PORT', 'Remote server Port', '4523', '80', 'int');
INSERT INTO `config` VALUES ('10', 'SYNC_SWITCH_VARIANT', 'Switch variant', '1', '1', 'int');
INSERT INTO `config` VALUES ('11', 'SYNC_FLEXIBILITY_ROLE', 'Sync flexibility role', '2', '1', 'int');
INSERT INTO `config` VALUES ('12', 'SYNC_PROCESS_STATUS', 'Process status', '0', '1', 'int');
INSERT INTO `config` VALUES ('13', 'SYNC_MAIN_ROLE', 'Main role', '1', '1', 'int');
INSERT INTO `config` VALUES ('14', 'SYNC_FOR_COMES_FORWARDING_MESSAGES_IP', 'Receiving messages IP', '0', '192.168.101.212', 'string');
INSERT INTO `config` VALUES ('15', 'SYNC_FOR_COMES_FORWARDING_MESSAGES_PORT', 'Receiving messages  PORT', '0', '5910', 'string');
INSERT INTO `config` VALUES ('16', 'SYNC_FOR_SEND_MESSAGES_TO_IP', 'Send messages IP', '0', '5910', 'string');
INSERT INTO `config` VALUES ('17', 'SYNC_FOR_SEND_MESSAGES_PORT', 'Send messages  PORT', '0', '5910', 'string');
INSERT INTO `config` VALUES ('18', 'AWS_FORMAT', 'AWS Format', '1', '1', 'int');
INSERT INTO `config` VALUES ('19', 'HEARTBEAT_REPORT_FTP', 'Report to FTP', '', '', 'string');
INSERT INTO `config` VALUES ('20', 'HEARTBEAT_REPORT_FTP_PORT', 'FTP Port', '', '', 'string');
INSERT INTO `config` VALUES ('21', 'HEARTBEAT_REPORT_FTP_DIR', 'FTP folder', '', '', 'string');
INSERT INTO `config` VALUES ('22', 'HEARTBEAT_REPORT_FTP_USER', 'FTP user', '', '', 'string');
INSERT INTO `config` VALUES ('23', 'HEARTBEAT_REPORT_FTP_PASSWORD', 'FTP password', '', '', 'string');

-- ----------------------------
-- Table structure for ex_schedule_report
-- ----------------------------
DROP TABLE IF EXISTS `ex_schedule_report`;
CREATE TABLE `ex_schedule_report` (
  `ex_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_type` varchar(255) NOT NULL,
  `report_type` varchar(50) NOT NULL DEFAULT 'synop' COMMENT 'synop, bufr',
  `period` smallint(6) NOT NULL DEFAULT '60' COMMENT 'in minutes',
  `report_format` varchar(20) NOT NULL DEFAULT 'csv' COMMENT 'txt, csv',
  `start_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `next_run_planned` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `ex_schedule_ident` varchar(255) DEFAULT NULL,
  `generation_delay` int(11) DEFAULT '0',
  `aging_time_delay` int(11) DEFAULT '10',
  `active` int(1) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ex_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_schedule_report
-- ----------------------------

-- ----------------------------
-- Table structure for ex_schedule_report_destination
-- ----------------------------
DROP TABLE IF EXISTS `ex_schedule_report_destination`;
CREATE TABLE `ex_schedule_report_destination` (
  `ex_schedule_destination_id` int(11) NOT NULL AUTO_INCREMENT,
  `ex_schedule_id` int(11) NOT NULL,
  `method` varchar(20) NOT NULL DEFAULT 'mail',
  `destination_email` varchar(255) NOT NULL,
  `destination_local_folder` varchar(255) NOT NULL,
  `destination_ip` varchar(15) NOT NULL,
  `destination_ip_port` smallint(5) NOT NULL DEFAULT '21',
  `destination_ip_folder` varchar(255) NOT NULL DEFAULT '',
  `destination_ip_user` varchar(255) NOT NULL,
  `destination_ip_password` varchar(255) NOT NULL,
  PRIMARY KEY (`ex_schedule_destination_id`),
  KEY `ex_schedule_id` (`ex_schedule_id`) USING BTREE,
  CONSTRAINT `ex_schedule_report_destination_fk` FOREIGN KEY (`ex_schedule_id`) REFERENCES `ex_schedule_report` (`ex_schedule_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_schedule_report_destination
-- ----------------------------

-- ----------------------------
-- Table structure for ex_schedule_report_processed
-- ----------------------------
DROP TABLE IF EXISTS `ex_schedule_report_processed`;
CREATE TABLE `ex_schedule_report_processed` (
  `ex_schedule_processed_id` int(11) NOT NULL AUTO_INCREMENT,
  `ex_schedule_id` int(11) NOT NULL,
  `is_synchronized` int(1) DEFAULT '0',
  `aging_time` int(50) DEFAULT NULL,
  `current_role` varchar(255) NOT NULL DEFAULT 'none',
  `check_period_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `check_period_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ex_schedule_processed_id`),
  KEY `sch_rep_processed__created` (`created`),
  KEY `schedule_report_processed_sr_fk` (`ex_schedule_id`),
  CONSTRAINT `proc_ex_schedule_id` FOREIGN KEY (`ex_schedule_id`) REFERENCES `ex_schedule_report` (`ex_schedule_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_schedule_report_processed
-- ----------------------------

-- ----------------------------
-- Table structure for ex_schedule_send_log
-- ----------------------------
DROP TABLE IF EXISTS `ex_schedule_send_log`;
CREATE TABLE `ex_schedule_send_log` (
  `ex_schedulte_send_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `ex_schedule_processed_id` int(11) NOT NULL,
  `ex_schedule_destination_id` int(11) NOT NULL,
  `sent` int(1) DEFAULT '0',
  `send_logs` longblob,
  `updated` timestamp NULL DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ex_schedulte_send_log_id`),
  KEY `log_ex_schedule_processed_id` (`ex_schedule_processed_id`),
  KEY `log_ex_schedule_destination_id` (`ex_schedule_destination_id`),
  CONSTRAINT `log_ex_schedule_destination_id` FOREIGN KEY (`ex_schedule_destination_id`) REFERENCES `ex_schedule_report_destination` (`ex_schedule_destination_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `log_ex_schedule_processed_id` FOREIGN KEY (`ex_schedule_processed_id`) REFERENCES `ex_schedule_report_processed` (`ex_schedule_processed_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_schedule_send_log
-- ----------------------------

-- ----------------------------
-- Table structure for heartbeat_report
-- ----------------------------
DROP TABLE IF EXISTS `heartbeat_report`;
CREATE TABLE `heartbeat_report` (
  `report_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  `period` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ftp_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of heartbeat_report
-- ----------------------------

-- ----------------------------
-- Table structure for heartbeat_report_data
-- ----------------------------
DROP TABLE IF EXISTS `heartbeat_report_data`;
CREATE TABLE `heartbeat_report_data` (
  `report_data_id` int(13) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(11) unsigned NOT NULL,
  `handler` varchar(255) NOT NULL,
  `keys` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`report_data_id`),
  KEY `report_fk` (`report_id`),
  CONSTRAINT `report_fk` FOREIGN KEY (`report_id`) REFERENCES `heartbeat_report` (`report_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of heartbeat_report_data
-- ----------------------------

-- ----------------------------
-- Table structure for listener
-- ----------------------------
DROP TABLE IF EXISTS `listener`;
CREATE TABLE `listener` (
  `listener_id` int(11) NOT NULL AUTO_INCREMENT,
  `process_pid` mediumint(9) unsigned NOT NULL,
  `source` varchar(50) NOT NULL,
  `started` int(11) NOT NULL,
  `stopped` int(11) NOT NULL,
  `connection_result_code` varchar(20) NOT NULL,
  `connection_result_description` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `additional_param` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`listener_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listener
-- ----------------------------

-- ----------------------------
-- Table structure for listener_log
-- ----------------------------
DROP TABLE IF EXISTS `listener_log`;
CREATE TABLE `listener_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `listener_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `station_type` varchar(10) DEFAULT NULL,
  `station_id` smallint(6) NOT NULL DEFAULT '0',
  `measuring_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `is_processing` tinyint(1) NOT NULL DEFAULT '0',
  `is_last` tinyint(1) NOT NULL DEFAULT '0',
  `is_actual` tinyint(1) NOT NULL DEFAULT '0',
  `rewrite_prev_values` tinyint(1) NOT NULL DEFAULT '0',
  `source` varchar(15) NOT NULL DEFAULT '',
  `source_info` varchar(30) DEFAULT '',
  `failed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - failed',
  `fail_description` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `listener_id` (`listener_id`),
  KEY `listener_log__last_station_failed` (`is_last`,`station_id`,`failed`),
  KEY `listener_log__measuring_timestamp` (`measuring_timestamp`),
  KEY `listener_log__is_indexes` (`is_actual`,`is_last`,`is_processed`,`is_processing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listener_log
-- ----------------------------

-- ----------------------------
-- Table structure for listener_log_process_error
-- ----------------------------
DROP TABLE IF EXISTS `listener_log_process_error`;
CREATE TABLE `listener_log_process_error` (
  `process_error_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL,
  `type` enum('error','warning') NOT NULL DEFAULT 'error',
  `code` varchar(255) NOT NULL,
  `description` text,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`process_error_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listener_log_process_error
-- ----------------------------

-- ----------------------------
-- Table structure for listener_log_temp
-- ----------------------------
DROP TABLE IF EXISTS `listener_log_temp`;
CREATE TABLE `listener_log_temp` (
  `temp_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `listener_id` int(11) NOT NULL,
  `station_id_code` varchar(255) DEFAULT '0',
  `message` text NOT NULL,
  `measuring_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_processed` int(1) DEFAULT '0',
  `is_processing` int(1) DEFAULT '0',
  `source` varchar(15) NOT NULL DEFAULT '',
  `source_info` varchar(30) DEFAULT '',
  `from_master` int(1) DEFAULT '0',
  `synchronization_mode` enum('slave','none','master') DEFAULT 'none',
  `rewrite_prev_values` tinyint(1) DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`temp_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listener_log_temp
-- ----------------------------

-- ----------------------------
-- Table structure for listener_process
-- ----------------------------
DROP TABLE IF EXISTS `listener_process`;
CREATE TABLE `listener_process` (
  `listener_process_id` int(11) NOT NULL AUTO_INCREMENT,
  `listener_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`listener_process_id`),
  KEY `listener_id` (`listener_id`),
  CONSTRAINT `listener_process_fk` FOREIGN KEY (`listener_id`) REFERENCES `listener` (`listener_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listener_process
-- ----------------------------

-- ----------------------------
-- Table structure for refbook_measurement_type
-- ----------------------------
DROP TABLE IF EXISTS `refbook_measurement_type`;
CREATE TABLE `refbook_measurement_type` (
  `measurement_type_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `ord` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`measurement_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of refbook_measurement_type
-- ----------------------------
INSERT INTO `refbook_measurement_type` VALUES ('1', 'Temperature', 'temperature', '1');
INSERT INTO `refbook_measurement_type` VALUES ('2', 'Rain fall', 'rain', '2');
INSERT INTO `refbook_measurement_type` VALUES ('3', 'Humidity', 'humidity', '4');
INSERT INTO `refbook_measurement_type` VALUES ('4', 'Wind Speed', 'wind_speed', '5');
INSERT INTO `refbook_measurement_type` VALUES ('5', 'Wind Direction', 'wind_direction', '6');
INSERT INTO `refbook_measurement_type` VALUES ('6', 'Pressure', 'pressure', '7');
INSERT INTO `refbook_measurement_type` VALUES ('8', 'Sea Level', 'sea_level', '8');
INSERT INTO `refbook_measurement_type` VALUES ('9', 'Solar Radiation', 'solar_radiation', '9');
INSERT INTO `refbook_measurement_type` VALUES ('10', 'Sunshine duration', 'sun_duration', '10');
INSERT INTO `refbook_measurement_type` VALUES ('11', 'Visibility', 'visibility', '11');
INSERT INTO `refbook_measurement_type` VALUES ('12', 'Battery Voltage', 'battery_voltage', '0');
INSERT INTO `refbook_measurement_type` VALUES ('13', 'Depth', 'depth', '12');
INSERT INTO `refbook_measurement_type` VALUES ('14', 'Rain Gauge Bucket Size', 'bucket_size', '3');
INSERT INTO `refbook_measurement_type` VALUES ('15', 'Height', 'height', '13');
INSERT INTO `refbook_measurement_type` VALUES ('16', 'Cloud Vertical Visibility', 'cloud_vertical_visibility', '14');
INSERT INTO `refbook_measurement_type` VALUES ('17', 'Cloud Height', 'cloud_height', '15');
INSERT INTO `refbook_measurement_type` VALUES ('18', 'Sea Level (Mean, Sigma)', 'sea_level', '16');
INSERT INTO `refbook_measurement_type` VALUES ('19', 'Treshold Period', 'treshold_period', '0');
INSERT INTO `refbook_measurement_type` VALUES ('20', 'Sea Level (Wave Height)', 'sea_level_wave_height', '17');
INSERT INTO `refbook_measurement_type` VALUES ('21', 'Cloud Measuring Range', 'cloud_measuring_range', '18');
INSERT INTO `refbook_measurement_type` VALUES ('22', 'Snow Depth', 'snow_depth', '19');
INSERT INTO `refbook_measurement_type` VALUES ('23', 'Water Level', 'water_level', '20');
INSERT INTO `refbook_measurement_type` VALUES ('24', 'Water Level Offset', 'level_offset', '21');

-- ----------------------------
-- Table structure for refbook_measurement_type_metric
-- ----------------------------
DROP TABLE IF EXISTS `refbook_measurement_type_metric`;
CREATE TABLE `refbook_measurement_type_metric` (
  `measurement_type_metric_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `measurement_type_id` tinyint(4) NOT NULL,
  `metric_id` tinyint(4) NOT NULL,
  `is_main` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`measurement_type_metric_id`),
  KEY `measurement_type_id` (`measurement_type_id`),
  KEY `metric_id` (`metric_id`),
  CONSTRAINT `refbook_measurement_type_metric_fk` FOREIGN KEY (`measurement_type_id`) REFERENCES `refbook_measurement_type` (`measurement_type_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `refbook_measurement_type_metric_fk1` FOREIGN KEY (`metric_id`) REFERENCES `refbook_metric` (`metric_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of refbook_measurement_type_metric
-- ----------------------------
INSERT INTO `refbook_measurement_type_metric` VALUES ('1', '12', '1', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('2', '1', '2', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('3', '1', '3', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('4', '2', '15', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('6', '2', '4', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('7', '3', '7', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('8', '4', '8', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('9', '4', '9', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('10', '5', '14', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('11', '6', '10', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('12', '8', '11', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('13', '9', '12', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('14', '10', '13', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('16', '13', '5', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('17', '1', '16', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('18', '4', '17', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('19', '4', '18', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('21', '15', '11', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('22', '6', '20', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('23', '9', '21', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('24', '16', '22', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('25', '16', '11', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('26', '17', '22', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('27', '17', '11', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('28', '11', '11', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('29', '18', '11', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('30', '19', '13', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('31', '20', '5', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('32', '21', '11', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('33', '21', '22', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('34', '22', '11', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('35', '14', '4', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('36', '14', '4', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('37', '23', '4', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('38', '23', '5', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('39', '23', '11', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('40', '24', '4', '0');
INSERT INTO `refbook_measurement_type_metric` VALUES ('41', '24', '5', '1');
INSERT INTO `refbook_measurement_type_metric` VALUES ('42', '24', '11', '0');

-- ----------------------------
-- Table structure for refbook_metric
-- ----------------------------
DROP TABLE IF EXISTS `refbook_metric`;
CREATE TABLE `refbook_metric` (
  `metric_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `html_code` varchar(50) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `code` varchar(30) NOT NULL,
  PRIMARY KEY (`metric_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of refbook_metric
-- ----------------------------
INSERT INTO `refbook_metric` VALUES ('1', 'V', 'V', 'Volt', 'volt');
INSERT INTO `refbook_metric` VALUES ('2', '&deg;C', ' C degree', 'Celsius degree', 'celsius');
INSERT INTO `refbook_metric` VALUES ('3', 'F', 'F', 'Fahrenheit', 'farenheit');
INSERT INTO `refbook_metric` VALUES ('4', 'mm', 'mm', 'Milimeter', 'millimeter');
INSERT INTO `refbook_metric` VALUES ('5', 'cm', 'cm', 'Centimeter', 'centimeter');
INSERT INTO `refbook_metric` VALUES ('6', 'G', 'G', 'Gallon', 'gallon');
INSERT INTO `refbook_metric` VALUES ('7', '%', '%', 'Percent', 'percent');
INSERT INTO `refbook_metric` VALUES ('8', 'Knot', 'Knot', 'Knot', 'knot');
INSERT INTO `refbook_metric` VALUES ('9', 'm/s', 'm/s', 'Meter per second', 'meter_per_second');
INSERT INTO `refbook_metric` VALUES ('10', 'Pa', 'Pa', 'Pascal', 'pascal');
INSERT INTO `refbook_metric` VALUES ('11', 'm', 'm', 'Meter', 'meter');
INSERT INTO `refbook_metric` VALUES ('12', 'J/sq.m', 'J/sq.m', 'Joule per square meter', 'joule_per_sq_meter');
INSERT INTO `refbook_metric` VALUES ('13', 'min', 'min', 'Minute', 'minute');
INSERT INTO `refbook_metric` VALUES ('14', '&deg;', 'degree', 'Degree', 'degree');
INSERT INTO `refbook_metric` VALUES ('15', 'inch', 'inch', 'Inch', 'inch');
INSERT INTO `refbook_metric` VALUES ('16', 'K', 'K', 'Kelvin', 'kelvin');
INSERT INTO `refbook_metric` VALUES ('17', 'mph', 'mph', 'Miles per hour', 'miles_per_hour');
INSERT INTO `refbook_metric` VALUES ('18', 'km/h', 'km/h', 'Kilometers per hour', 'kilometers_per_hour');
INSERT INTO `refbook_metric` VALUES ('20', 'hPa', 'hPa', '100 Pascal', 'hpascal');
INSERT INTO `refbook_metric` VALUES ('21', 'kJ/sq.m', 'kJ/sq.m', 'Kilo Joule per square meter', 'kjoule_per_sq_meter');
INSERT INTO `refbook_metric` VALUES ('22', 'ft', 'ft', 'Feet', 'feet');
INSERT INTO `refbook_metric` VALUES ('23', 'km', 'km', 'Kilometer', 'kilometer');
INSERT INTO `refbook_metric` VALUES ('24', 'inHg', 'inHg', 'inHg', 'inHg');

-- ----------------------------
-- Table structure for schedule_report
-- ----------------------------
DROP TABLE IF EXISTS `schedule_report`;
CREATE TABLE `schedule_report` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` varchar(50) NOT NULL DEFAULT 'synop' COMMENT 'synop, bufr',
  `station_id` smallint(6) NOT NULL,
  `period` smallint(6) NOT NULL DEFAULT '60' COMMENT 'in minutes',
  `report_format` varchar(20) NOT NULL DEFAULT 'csv' COMMENT 'txt, csv',
  `last_scheduled_run_fact` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_scheduled_run_planned` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `send_like_attach` int(1) DEFAULT '1',
  `send_email_together` int(1) DEFAULT '0',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_report
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_report_destination
-- ----------------------------
DROP TABLE IF EXISTS `schedule_report_destination`;
CREATE TABLE `schedule_report_destination` (
  `schedule_destination_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `method` varchar(20) NOT NULL DEFAULT 'mail',
  `destination_email` varchar(255) NOT NULL,
  `destination_local_folder` varchar(255) NOT NULL,
  `destination_ip` varchar(15) NOT NULL,
  `destination_ip_port` smallint(5) NOT NULL DEFAULT '21',
  `destination_ip_folder` varchar(255) NOT NULL DEFAULT '/',
  `destination_ip_user` varchar(255) NOT NULL,
  `destination_ip_password` varchar(255) NOT NULL,
  PRIMARY KEY (`schedule_destination_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `schedule_report_destination_fk` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_report` (`schedule_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_report_destination
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_report_processed
-- ----------------------------
DROP TABLE IF EXISTS `schedule_report_processed`;
CREATE TABLE `schedule_report_processed` (
  `schedule_processed_id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_to_s_id` int(11) NOT NULL,
  `check_period_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `check_period_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `listener_log_id` int(11) NOT NULL,
  `listener_log_ids` text NOT NULL,
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `serialized_report_errors` text NOT NULL,
  `serialized_report_explanations` text NOT NULL,
  `is_last` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`schedule_processed_id`),
  KEY `listener_log_id` (`listener_log_id`),
  KEY `sch_rep_processed__is_indexes` (`is_last`,`is_processed`),
  KEY `sch_rep_processed__created` (`created`),
  KEY `schedule_report_processed_sr_fk` (`sr_to_s_id`),
  CONSTRAINT `schedule_report_processed_sr_fk` FOREIGN KEY (`sr_to_s_id`) REFERENCES `schedule_report_to_station` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_report_processed
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_report_to_station
-- ----------------------------
DROP TABLE IF EXISTS `schedule_report_to_station`;
CREATE TABLE `schedule_report_to_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `station_id` smallint(7) NOT NULL,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `schedule_report_fk` (`schedule_id`),
  KEY `id` (`id`,`station_id`),
  KEY `station_id` (`station_id`,`id`),
  KEY `station_id_2` (`station_id`),
  CONSTRAINT `schedule_report_fk` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_report` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `station_schedule_report_fk` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_report_to_station
-- ----------------------------

-- ----------------------------
-- Table structure for sensor_data
-- ----------------------------
DROP TABLE IF EXISTS `sensor_data`;
CREATE TABLE `sensor_data` (
  `sensor_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` smallint(6) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `sensor_feature_id` int(11) NOT NULL,
  `sensor_feature_value` tinytext NOT NULL,
  `is_m` enum('1','0') NOT NULL DEFAULT '0',
  `metric_id` tinyint(4) NOT NULL,
  `sensor_feature_normalized_value` decimal(15,4) NOT NULL,
  `sensor_feature_exp_value` smallint(6) NOT NULL DEFAULT '0',
  `period` smallint(6) NOT NULL COMMENT 'in minutes',
  `listener_log_id` int(11) NOT NULL,
  `measuring_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sensor_data_id`),
  KEY `sensor_feature_id` (`sensor_feature_id`),
  KEY `listener_log_id` (`listener_log_id`),
  KEY `sensor_data_sensor_id_index` (`sensor_id`),
  KEY `sensor_data_station_id_index` (`station_id`),
  KEY `sensor_data__feature_measuuring_index` (`sensor_feature_id`,`measuring_timestamp`,`is_m`),
  KEY `sensor_data__log_feature_index` (`listener_log_id`,`sensor_feature_id`,`measuring_timestamp`),
  KEY `sensor_data__measuring_timestamp` (`measuring_timestamp`),
  CONSTRAINT `sensor_data_fk` FOREIGN KEY (`sensor_feature_id`) REFERENCES `station_sensor_feature` (`sensor_feature_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sensor_data_fk1` FOREIGN KEY (`listener_log_id`) REFERENCES `listener_log` (`log_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sensor_data
-- ----------------------------

-- ----------------------------
-- Table structure for sensor_data_minute
-- ----------------------------
DROP TABLE IF EXISTS `sensor_data_minute`;
CREATE TABLE `sensor_data_minute` (
  `sensor_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `station_id` smallint(6) NOT NULL,
  `sensor_value` smallint(6) NOT NULL DEFAULT '0',
  `metric_id` tinyint(4) NOT NULL,
  `sensor_feature_normalized_value` int(11) NOT NULL,
  `5min_sum` smallint(6) NOT NULL DEFAULT '0',
  `10min_sum` smallint(6) NOT NULL DEFAULT '0',
  `20min_sum` smallint(6) NOT NULL DEFAULT '0',
  `30min_sum` smallint(6) NOT NULL DEFAULT '0',
  `60min_sum` smallint(6) NOT NULL DEFAULT '0',
  `1day_sum` mediumint(9) NOT NULL DEFAULT '0',
  `bucket_size` decimal(11,2) NOT NULL DEFAULT '0.00',
  `listener_log_id` int(11) NOT NULL COMMENT 'id of message received',
  `measuring_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `battery_voltage` decimal(11,2) NOT NULL DEFAULT '0.00',
  `is_tmp` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sensor_data_id`),
  KEY `listener_log_id` (`listener_log_id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `sensor_data_minute_fk` FOREIGN KEY (`listener_log_id`) REFERENCES `listener_log` (`log_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sensor_data_minute_fk1` FOREIGN KEY (`sensor_id`) REFERENCES `station_sensor` (`station_sensor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sensor_data_minute
-- ----------------------------

-- ----------------------------
-- Table structure for sensor_handler
-- ----------------------------
DROP TABLE IF EXISTS `sensor_handler`;
CREATE TABLE `sensor_handler` (
  `handler_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `handler_id_code` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `handler_default_display_name` varchar(255) DEFAULT NULL,
  `default_prefix` varchar(2) NOT NULL,
  `aws_panel_display_position` tinyint(4) NOT NULL,
  `aws_panel_show` tinyint(1) NOT NULL DEFAULT '0',
  `aws_single_display_position` tinyint(4) NOT NULL DEFAULT '0',
  `aws_single_group` varchar(255) NOT NULL,
  `aws_station_uses` tinyint(1) NOT NULL DEFAULT '0',
  `rain_station_uses` tinyint(1) NOT NULL DEFAULT '0',
  `awa_station_uses` tinyint(1) NOT NULL DEFAULT '0',
  `flags` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Bit flags',
  `start_time` tinyint(2) NOT NULL DEFAULT '-1',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`handler_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sensor_handler
-- ----------------------------
INSERT INTO `sensor_handler` VALUES ('1', 'BatteryVoltage', 'Battery Voltage', 'Battery Voltage', 'BV', '0', '1', '0', 'battery_voltage', '1', '0', '0', '25', '-1', '0000-00-00 00:00:00', '2015-03-13 21:37:08');
INSERT INTO `sensor_handler` VALUES ('2', 'Humidity', 'Humidity', 'Humidity', 'HU', '0', '1', '2', 'temperature_and_humidity', '1', '0', '0', '25', '7', '0000-00-00 00:00:00', '2015-03-13 21:35:07');
INSERT INTO `sensor_handler` VALUES ('3', 'Pressure', 'Pressure', 'Pressure', 'PR', '0', '1', '3', 'pressure', '1', '0', '0', '25', '3', '0000-00-00 00:00:00', '2015-02-19 22:43:51');
INSERT INTO `sensor_handler` VALUES ('4', 'RainAws', 'Rain AWS', 'Rain AWS', 'RN', '0', '1', '4', 'rain', '1', '0', '0', '25', '9', '0000-00-00 00:00:00', '2015-03-16 16:31:51');
INSERT INTO `sensor_handler` VALUES ('5', 'RainRg', 'Rain RG', 'Rain RG', 'RN', '0', '1', '0', '', '0', '1', '0', '26', '7', '0000-00-00 00:00:00', '2014-10-22 16:38:43');
INSERT INTO `sensor_handler` VALUES ('6', 'SolarRadiation', 'Solar Radiation', 'Solar Radiation', 'SR', '0', '1', '8', 'sun', '1', '0', '0', '25', '4', '0000-00-00 00:00:00', '2015-02-08 21:36:53');
INSERT INTO `sensor_handler` VALUES ('7', 'SunshineDuration', 'Sunshine Duration', 'Sunshine Duration', 'SD', '0', '1', '8', 'sun', '1', '0', '0', '25', '4', '0000-00-00 00:00:00', '2015-01-25 19:11:41');
INSERT INTO `sensor_handler` VALUES ('8', 'Temperature', 'Temperature', 'Temperature', 'TA', '0', '1', '2', 'temperature_and_humidity', '1', '0', '0', '25', '10', '0000-00-00 00:00:00', '2015-03-16 16:36:15');
INSERT INTO `sensor_handler` VALUES ('9', 'TemperatureSoil', 'Temperature Soil', 'Temperature Soil', 'TS', '0', '1', '5', 'temperature_soil', '1', '0', '0', '25', '12', '0000-00-00 00:00:00', '2015-03-02 19:57:36');
INSERT INTO `sensor_handler` VALUES ('10', 'WindDirection', 'Wind Direction', 'Wind Direction', 'WD', '0', '1', '1', 'wind', '1', '0', '0', '25', '0', '0000-00-00 00:00:00', '2015-03-16 16:36:04');
INSERT INTO `sensor_handler` VALUES ('11', 'WindSpeed', 'Wind Speed', 'Wind Speedy', 'WS', '0', '1', '1', 'wind', '1', '0', '0', '25', '0', '0000-00-00 00:00:00', '2015-03-17 15:40:47');
INSERT INTO `sensor_handler` VALUES ('12', 'DewPoint', 'Dew Point', 'Dew Point', '', '0', '1', '2', 'temperature_and_humidity', '0', '0', '0', '24', '-1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `sensor_handler` VALUES ('13', 'SeaLevelAWS', 'Sea Level and Tide Data', 'Sea Level and Tide Data', 'SL', '0', '0', '6', 'sea_level', '1', '0', '0', '25', '-1', '0000-00-00 00:00:00', '2014-10-24 22:30:02');
INSERT INTO `sensor_handler` VALUES ('14', 'VisibilityAWS', 'Visibility without Extinction', 'Visibility without Extinction', 'VI', '0', '0', '7', 'visibility', '1', '0', '0', '25', '-1', '0000-00-00 00:00:00', '2014-10-24 22:29:12');
INSERT INTO `sensor_handler` VALUES ('15', 'CloudHeightAWS', 'Cloud Depth', 'Cloud Depth', 'CH', '0', '0', '9', 'clouds', '1', '0', '0', '25', '-1', '0000-00-00 00:00:00', '2014-10-24 22:29:12');
INSERT INTO `sensor_handler` VALUES ('16', 'TemperatureWater', 'Temperature Water', 'Temperature Water', 'TW', '0', '1', '5', 'temperature_soil', '1', '0', '0', '25', '0', '0000-00-00 00:00:00', '2014-10-23 23:43:08');
INSERT INTO `sensor_handler` VALUES ('17', 'VisibilityAwsDlm13m', 'Visibility with Extinction', 'Visibility with Extinction', 'VI', '0', '0', '7', 'visibility', '1', '0', '0', '17', '-1', '0000-00-00 00:00:00', '2014-10-24 22:29:12');
INSERT INTO `sensor_handler` VALUES ('18', 'CloudHeightAwsDlm13m', 'Cloud Amount', 'Cloud Amount', 'CH', '0', '1', '9', 'clouds', '1', '0', '0', '17', '-1', '0000-00-00 00:00:00', '2014-10-29 10:09:01');
INSERT INTO `sensor_handler` VALUES ('19', 'SnowDepthAwsDlm13m', 'Snow Depth', 'Snow Depth', 'SN', '0', '0', '9', 'snow_depth', '1', '0', '0', '17', '0', '0000-00-00 00:00:00', '2015-02-08 22:05:48');
INSERT INTO `sensor_handler` VALUES ('20', 'WaterLevel', 'Water Level', 'Water Level', 'WL', '0', '1', '1', 'water', '1', '0', '0', '25', '-1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for sensor_handler_default_feature
-- ----------------------------
DROP TABLE IF EXISTS `sensor_handler_default_feature`;
CREATE TABLE `sensor_handler_default_feature` (
  `handler_feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `handler_id` tinyint(4) NOT NULL,
  `feature_code` varchar(50) NOT NULL,
  `aws_panel_show` tinyint(1) NOT NULL DEFAULT '0',
  `feature_constant_value` decimal(11,3) NOT NULL,
  `metric_id` tinyint(4) NOT NULL,
  `filter_max` decimal(11,2) NOT NULL,
  `filter_min` decimal(11,2) NOT NULL,
  `filter_diff` decimal(11,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`handler_feature_id`),
  KEY `handler_id` (`handler_id`),
  CONSTRAINT `sensor_handler_default_feature_fk` FOREIGN KEY (`handler_id`) REFERENCES `sensor_handler` (`handler_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sensor_handler_default_feature
-- ----------------------------
INSERT INTO `sensor_handler_default_feature` VALUES ('84', '1', 'battery_voltage', '1', '0.000', '1', '14.00', '10.00', '0.00', '2014-10-17 15:26:35', '2014-10-23 18:07:50');
INSERT INTO `sensor_handler_default_feature` VALUES ('85', '18', 'cloud_vertical_visibility', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:05');
INSERT INTO `sensor_handler_default_feature` VALUES ('86', '18', 'cloud_measuring_range', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:05');
INSERT INTO `sensor_handler_default_feature` VALUES ('87', '18', 'cloud_height_height_1', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('88', '18', 'cloud_height_depth_1', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('89', '18', 'cloud_height_height_2', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('90', '18', 'cloud_height_depth_2', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('91', '18', 'cloud_height_height_3', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('92', '18', 'cloud_height_depth_3', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('93', '18', 'status', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('94', '18', 'cloud_amount_amount_1', '1', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('95', '18', 'cloud_amount_height_1', '1', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('96', '18', 'cloud_amount_amount_2', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('97', '18', 'cloud_amount_height_2', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('98', '18', 'cloud_amount_amount_3', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('99', '18', 'cloud_amount_height_3', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('100', '18', 'cloud_amount_amount_4', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('101', '18', 'cloud_amount_height_4', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('102', '18', 'cloud_amount_amount_total', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:26:52', '2014-10-24 09:35:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('103', '15', 'cloud_vertical_visibility', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:27:03', '2014-10-24 09:37:30');
INSERT INTO `sensor_handler_default_feature` VALUES ('104', '15', 'cloud_measuring_range', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:27:03', '2014-10-24 09:37:30');
INSERT INTO `sensor_handler_default_feature` VALUES ('105', '15', 'cloud_height_height_1', '1', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:27:03', '2014-10-24 09:37:30');
INSERT INTO `sensor_handler_default_feature` VALUES ('106', '15', 'cloud_height_depth_1', '1', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:27:03', '2014-10-24 09:37:30');
INSERT INTO `sensor_handler_default_feature` VALUES ('107', '15', 'cloud_height_height_2', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:27:03', '2014-10-24 09:37:30');
INSERT INTO `sensor_handler_default_feature` VALUES ('108', '15', 'cloud_height_depth_2', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:27:03', '2014-10-24 09:37:30');
INSERT INTO `sensor_handler_default_feature` VALUES ('109', '15', 'cloud_height_height_3', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:27:03', '2014-10-24 09:37:30');
INSERT INTO `sensor_handler_default_feature` VALUES ('110', '15', 'cloud_height_depth_3', '0', '0.000', '22', '0.00', '0.00', '0.00', '2014-10-17 15:27:03', '2014-10-24 09:37:30');
INSERT INTO `sensor_handler_default_feature` VALUES ('111', '2', 'humidity', '1', '0.000', '7', '80.00', '0.00', '0.00', '2014-10-17 15:27:46', '2014-10-17 16:38:44');
INSERT INTO `sensor_handler_default_feature` VALUES ('112', '3', 'pressure', '1', '0.000', '20', '0.00', '0.00', '0.00', '2014-10-17 15:27:51', '2014-10-21 12:55:16');
INSERT INTO `sensor_handler_default_feature` VALUES ('113', '3', 'height', '0', '0.000', '11', '0.00', '0.00', '0.00', '2014-10-17 15:27:51', '2014-10-21 12:55:16');
INSERT INTO `sensor_handler_default_feature` VALUES ('114', '4', 'rain_in_period', '1', '0.000', '15', '0.00', '0.00', '0.00', '2014-10-17 15:27:55', '2014-10-20 15:27:23');
INSERT INTO `sensor_handler_default_feature` VALUES ('115', '4', 'rain_in_day', '0', '0.000', '15', '0.00', '0.00', '0.00', '2014-10-17 15:27:55', '2014-10-20 15:27:23');
INSERT INTO `sensor_handler_default_feature` VALUES ('116', '5', 'rain', '0', '0.000', '15', '2.00', '0.00', '2.00', '2014-10-17 15:27:58', '2014-10-20 13:22:54');
INSERT INTO `sensor_handler_default_feature` VALUES ('117', '5', 'bucket_size', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:27:58', '2014-10-20 13:22:54');
INSERT INTO `sensor_handler_default_feature` VALUES ('118', '13', 'sea_level_mean', '1', '0.000', '11', '0.00', '0.00', '0.00', '2014-10-17 15:28:01', '2014-10-17 15:28:01');
INSERT INTO `sensor_handler_default_feature` VALUES ('119', '13', 'sea_level_sigma', '0', '0.000', '11', '0.00', '0.00', '0.00', '2014-10-17 15:28:01', '2014-10-17 15:28:01');
INSERT INTO `sensor_handler_default_feature` VALUES ('120', '13', 'sea_level_wave_height', '0', '0.000', '5', '0.00', '0.00', '0.00', '2014-10-17 15:28:01', '2014-10-17 15:28:01');
INSERT INTO `sensor_handler_default_feature` VALUES ('121', '13', 'sl_baseline', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:28:01', '2014-10-17 15:28:01');
INSERT INTO `sensor_handler_default_feature` VALUES ('122', '13', 'sl_trend_treshold', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:28:01', '2014-10-17 15:28:01');
INSERT INTO `sensor_handler_default_feature` VALUES ('123', '13', 'sl_trend_avg_calculate_period', '0', '30.000', '13', '0.00', '0.00', '0.00', '2014-10-17 15:28:01', '2014-10-17 15:28:01');
INSERT INTO `sensor_handler_default_feature` VALUES ('124', '19', 'snow_depth', '1', '0.000', '11', '0.00', '0.00', '0.00', '2014-10-17 15:28:06', '2014-10-17 15:28:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('125', '19', 'error_code', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:28:06', '2014-10-17 15:28:06');
INSERT INTO `sensor_handler_default_feature` VALUES ('126', '6', 'solar_radiation_in_period', '1', '0.000', '12', '0.00', '0.00', '0.00', '2014-10-17 15:28:12', '2014-10-17 15:28:12');
INSERT INTO `sensor_handler_default_feature` VALUES ('127', '6', 'solar_radiation_in_day', '0', '0.000', '12', '0.00', '0.00', '0.00', '2014-10-17 15:28:12', '2014-10-17 15:28:12');
INSERT INTO `sensor_handler_default_feature` VALUES ('128', '7', 'sun_duration_in_period', '1', '0.000', '13', '0.00', '0.00', '0.00', '2014-10-17 15:28:16', '2014-10-24 13:15:40');
INSERT INTO `sensor_handler_default_feature` VALUES ('129', '7', 'sun_duration_in_day', '0', '0.000', '13', '0.00', '0.00', '0.00', '2014-10-17 15:28:16', '2014-10-24 13:15:40');
INSERT INTO `sensor_handler_default_feature` VALUES ('130', '8', 'temperature', '1', '0.000', '2', '0.00', '0.00', '0.00', '2014-10-17 15:28:20', '2014-10-17 15:28:45');
INSERT INTO `sensor_handler_default_feature` VALUES ('131', '9', 'temperature', '1', '0.000', '2', '0.00', '0.00', '0.00', '2014-10-17 15:28:24', '2014-10-17 16:31:30');
INSERT INTO `sensor_handler_default_feature` VALUES ('132', '9', 'depth', '0', '0.000', '5', '0.00', '0.00', '0.00', '2014-10-17 15:28:24', '2014-10-17 16:31:30');
INSERT INTO `sensor_handler_default_feature` VALUES ('133', '16', 'temperature', '1', '0.000', '2', '0.00', '0.00', '0.00', '2014-10-17 15:28:33', '2014-10-17 15:28:33');
INSERT INTO `sensor_handler_default_feature` VALUES ('134', '16', 'depth', '0', '0.000', '5', '0.00', '0.00', '0.00', '2014-10-17 15:28:33', '2014-10-17 15:28:33');
INSERT INTO `sensor_handler_default_feature` VALUES ('135', '17', 'visibility_1', '1', '0.000', '11', '0.00', '0.00', '0.00', '2014-10-17 15:29:07', '2014-10-17 15:29:07');
INSERT INTO `sensor_handler_default_feature` VALUES ('136', '17', 'visibility_10', '0', '0.000', '11', '0.00', '0.00', '0.00', '2014-10-17 15:29:07', '2014-10-17 15:29:07');
INSERT INTO `sensor_handler_default_feature` VALUES ('137', '17', 'extinction', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:29:07', '2014-10-17 15:29:07');
INSERT INTO `sensor_handler_default_feature` VALUES ('138', '17', 'status', '0', '0.000', '0', '0.00', '0.00', '0.00', '2014-10-17 15:29:07', '2014-10-17 15:29:07');
INSERT INTO `sensor_handler_default_feature` VALUES ('139', '14', 'visibility_1', '1', '0.000', '11', '0.00', '0.00', '0.00', '2014-10-17 15:29:11', '2014-10-17 15:29:11');
INSERT INTO `sensor_handler_default_feature` VALUES ('140', '14', 'visibility_10', '0', '0.000', '11', '0.00', '0.00', '0.00', '2014-10-17 15:29:11', '2014-10-17 15:29:11');
INSERT INTO `sensor_handler_default_feature` VALUES ('141', '10', 'wind_direction_1', '1', '0.000', '14', '303.00', '0.00', '300.00', '2014-10-17 15:29:13', '2014-10-20 11:26:18');
INSERT INTO `sensor_handler_default_feature` VALUES ('142', '10', 'wind_direction_2', '0', '0.000', '14', '300.00', '0.00', '300.00', '2014-10-17 15:29:13', '2014-10-20 11:26:18');
INSERT INTO `sensor_handler_default_feature` VALUES ('143', '10', 'wind_direction_10', '0', '0.000', '14', '300.00', '0.00', '300.00', '2014-10-17 15:29:13', '2014-10-20 11:26:18');
INSERT INTO `sensor_handler_default_feature` VALUES ('144', '11', 'wind_speed_1', '1', '0.000', '18', '0.00', '0.00', '1.00', '2014-10-17 15:29:16', '2014-10-21 12:33:02');
INSERT INTO `sensor_handler_default_feature` VALUES ('145', '11', 'wind_speed_2', '0', '0.000', '18', '0.00', '0.00', '1.00', '2014-10-17 15:29:16', '2014-10-21 12:33:02');
INSERT INTO `sensor_handler_default_feature` VALUES ('146', '11', 'wind_speed_10', '0', '0.000', '18', '0.00', '0.00', '1.00', '2014-10-17 15:29:16', '2014-10-21 12:33:02');
INSERT INTO `sensor_handler_default_feature` VALUES ('147', '20', 'water_level', '1', '0.000', '11', '0.00', '0.00', '0.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `sensor_handler_default_feature` VALUES ('148', '20', 'level_offset', '0', '0.000', '11', '0.00', '0.00', '0.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for sensor_sea_level_trend
-- ----------------------------
DROP TABLE IF EXISTS `sensor_sea_level_trend`;
CREATE TABLE `sensor_sea_level_trend` (
  `trend_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `trend` varchar(20) NOT NULL COMMENT 'up / down / no_change / unknown',
  `is_significant` enum('0','1') NOT NULL DEFAULT '0',
  `last_high` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `last_high_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_low` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `last_low_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `measuring_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`trend_id`),
  KEY `sensor_sea_level_trend_fk` (`log_id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `sensor_sea_level_trend_fk` FOREIGN KEY (`log_id`) REFERENCES `listener_log` (`log_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sensor_sea_level_trend_fk1` FOREIGN KEY (`sensor_id`) REFERENCES `station_sensor` (`station_sensor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sensor_sea_level_trend
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `database_version` varchar(10) NOT NULL DEFAULT '0.4.27',
  `overwrite_data_on_import` tinyint(1) NOT NULL DEFAULT '1',
  `overwrite_data_on_listening` tinyint(1) NOT NULL DEFAULT '0',
  `process_message_pid` int(11) NOT NULL,
  `current_company_name` varchar(255) DEFAULT NULL,
  `scheduled_reports_path` varchar(255) NOT NULL DEFAULT 'C:\\weather_monitor_reports',
  `xml_messages_path` varchar(255) NOT NULL DEFAULT 'C:\\ftp\\xml_messages',
  `xml_check_frequency` tinyint(2) NOT NULL DEFAULT '15',
  `mail__use_fake_sendmail` tinyint(1) NOT NULL DEFAULT '1',
  `mail__sender_address` varchar(255) NOT NULL DEFAULT 'delairco@gmail.com',
  `mail__sender_name` varchar(255) NOT NULL DEFAULT 'Delairco',
  `mail__sender_password` varchar(255) NOT NULL DEFAULT 'delaircoweathermonitor',
  `mail__smtp_server` varchar(255) NOT NULL DEFAULT 'smtp.gmail.com',
  `mail__smtp_port` mediumint(9) NOT NULL DEFAULT '587',
  `mail__smtps_support` enum('auto','ssl','tls','none') NOT NULL DEFAULT 'tls',
  `local_timezone_id` varchar(100) NOT NULL DEFAULT 'UTC',
  `local_timezone_offset` varchar(20) NOT NULL DEFAULT '+00:00',
  `db_exp_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `db_exp_period` enum('1','10','30','60','90') NOT NULL DEFAULT '90',
  `db_exp_frequency` enum('1','5','10','30') NOT NULL DEFAULT '30',
  `db_exp_sql_host` varchar(255) NOT NULL,
  `db_exp_sql_port` smallint(5) unsigned NOT NULL DEFAULT '3306',
  `db_exp_sql_dbname` varchar(255) NOT NULL,
  `db_exp_sql_login` varchar(255) NOT NULL,
  `db_exp_sql_password` varchar(255) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', '0.06.00', '1', '0', '0', 'Your company name', '/usr/share/nginx/html/www/files/weather_monitor_reports', '/usr/share/nginx/html/www/files/xml_messages', '5', '0', 'delairco@gmail.com', 'Delairco', 'delaircoweathermonitor', 'smtp.gmail.com', '587', 'tls', 'UTC', '+00:00', '0', '10', '1', 'localhost', '3306', '', '', '');

-- ----------------------------
-- Table structure for sms_command
-- ----------------------------
DROP TABLE IF EXISTS `sms_command`;
CREATE TABLE `sms_command` (
  `sms_command_id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_command_status` enum('new','sent','processed') NOT NULL DEFAULT 'new',
  `station_id` smallint(6) NOT NULL,
  `sms_command_code` varchar(255) NOT NULL,
  `sms_command_message` varchar(255) NOT NULL,
  `sms_command_response` varchar(255) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sms_command_id`),
  KEY `fk_station` (`station_id`),
  CONSTRAINT `fk_station` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_command
-- ----------------------------

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `station_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) NOT NULL,
  `station_id_code` varchar(5) NOT NULL,
  `station_number` varchar(3) NOT NULL,
  `station_type` enum('rain','aws','awos') NOT NULL DEFAULT 'rain',
  `logger_type` enum('DLM11','DLM13M') NOT NULL DEFAULT 'DLM11' COMMENT 'Data logger type',
  `communication_type` enum('direct','sms','tcpip','gprs','server') NOT NULL DEFAULT 'direct',
  `communication_port` varchar(5) NOT NULL,
  `communication_esp_ip` varchar(15) NOT NULL DEFAULT '',
  `communication_esp_port` int(11) NOT NULL DEFAULT '0',
  `details` text,
  `status_message_period` smallint(6) NOT NULL DEFAULT '60' COMMENT 'minutes',
  `event_message_period` smallint(6) NOT NULL DEFAULT '10' COMMENT 'minutes',
  `timezone_id` varchar(255) NOT NULL DEFAULT 'UTC',
  `timezone_offset` varchar(20) NOT NULL,
  `wmo_block_number` varchar(3) DEFAULT NULL,
  `wmo_member_state_id` varchar(3) DEFAULT NULL,
  `wmo_station_number` int(11) NOT NULL DEFAULT '0',
  `wmo_originating_centre` int(11) NOT NULL DEFAULT '202',
  `national_aws_number` int(11) DEFAULT '0',
  `lat` decimal(20,10) NOT NULL DEFAULT '0.0000000000',
  `lng` decimal(20,10) NOT NULL DEFAULT '0.0000000000',
  `altitude` int(9) NOT NULL DEFAULT '0',
  `magnetic_north_offset` tinyint(3) NOT NULL DEFAULT '0',
  `country_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `awos_msg_source_folder` text CHARACTER SET ucs2 NOT NULL,
  `icao_code` varchar(4) DEFAULT NULL COMMENT 'ICAO code. Station name for METAR/SPECI reports.',
  `phone_number` tinytext COMMENT 'Phone number of modem for reset by SMS',
  `sms_message` tinytext COMMENT 'Reset message for modem',
  `station_gravity` decimal(20,10) DEFAULT '0.0000000000',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`station_id`),
  KEY `i_station__type` (`station_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station
-- ----------------------------

-- ----------------------------
-- Table structure for station_calculation
-- ----------------------------
DROP TABLE IF EXISTS `station_calculation`;
CREATE TABLE `station_calculation` (
  `calculation_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` smallint(6) NOT NULL,
  `handler_id` tinyint(4) NOT NULL,
  `formula` varchar(20) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`calculation_id`),
  KEY `station_id` (`station_id`),
  KEY `handler_id` (`handler_id`),
  CONSTRAINT `station_calculation_fk` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `station_calculation_fk1` FOREIGN KEY (`handler_id`) REFERENCES `calculation_handler` (`handler_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_calculation
-- ----------------------------

-- ----------------------------
-- Table structure for station_calculation_data
-- ----------------------------
DROP TABLE IF EXISTS `station_calculation_data`;
CREATE TABLE `station_calculation_data` (
  `calculation_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `calculation_id` int(11) NOT NULL,
  `listener_log_id` int(11) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`calculation_data_id`),
  KEY `calculation_id` (`calculation_id`),
  KEY `listener_log_id` (`listener_log_id`),
  CONSTRAINT `station_calculation_data_fk` FOREIGN KEY (`calculation_id`) REFERENCES `station_calculation` (`calculation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `station_calculation_data_fk1` FOREIGN KEY (`listener_log_id`) REFERENCES `listener_log` (`log_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_calculation_data
-- ----------------------------

-- ----------------------------
-- Table structure for station_calculation_variable
-- ----------------------------
DROP TABLE IF EXISTS `station_calculation_variable`;
CREATE TABLE `station_calculation_variable` (
  `calculation_variable_id` int(11) NOT NULL AUTO_INCREMENT,
  `calculation_id` int(11) NOT NULL,
  `variable_name` varchar(20) NOT NULL,
  `sensor_feature_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`calculation_variable_id`),
  KEY `calculation_id` (`calculation_id`),
  KEY `fk_station_cal_var__sensor_feature_id` (`sensor_feature_id`),
  CONSTRAINT `fk_station_cal_var__sensor_feature_id` FOREIGN KEY (`sensor_feature_id`) REFERENCES `station_sensor_feature` (`sensor_feature_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `station_calculation_variable_fk` FOREIGN KEY (`calculation_id`) REFERENCES `station_calculation` (`calculation_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_calculation_variable
-- ----------------------------

-- ----------------------------
-- Table structure for station_group
-- ----------------------------
DROP TABLE IF EXISTS `station_group`;
CREATE TABLE `station_group` (
  `group_id` smallint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_group
-- ----------------------------

-- ----------------------------
-- Table structure for station_group_destination
-- ----------------------------
DROP TABLE IF EXISTS `station_group_destination`;
CREATE TABLE `station_group_destination` (
  `group_destination_id` smallint(8) NOT NULL AUTO_INCREMENT,
  `group_id` smallint(2) NOT NULL,
  `station_id` smallint(6) NOT NULL,
  PRIMARY KEY (`group_destination_id`),
  KEY `station_group_fk` (`group_id`),
  KEY `station_fk` (`station_id`),
  CONSTRAINT `station_fk` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `station_group_fk` FOREIGN KEY (`group_id`) REFERENCES `station_group` (`group_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_group_destination
-- ----------------------------

-- ----------------------------
-- Table structure for station_sensor
-- ----------------------------
DROP TABLE IF EXISTS `station_sensor`;
CREATE TABLE `station_sensor` (
  `station_sensor_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` smallint(6) NOT NULL,
  `sensor_id_code` varchar(3) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `handler_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`station_sensor_id`),
  KEY `station_id` (`station_id`),
  KEY `handler_id` (`handler_id`),
  CONSTRAINT `station_sensor_fk` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_sensor
-- ----------------------------

-- ----------------------------
-- Table structure for station_sensor_feature
-- ----------------------------
DROP TABLE IF EXISTS `station_sensor_feature`;
CREATE TABLE `station_sensor_feature` (
  `sensor_feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `feature_code` varchar(50) NOT NULL,
  `feature_display_name` varchar(255) NOT NULL,
  `feature_constant_value` decimal(11,3) NOT NULL DEFAULT '0.000',
  `measurement_type_code` varchar(50) NOT NULL,
  `metric_id` tinyint(4) NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  `filter_max` decimal(11,2) NOT NULL DEFAULT '0.00',
  `filter_min` decimal(11,2) NOT NULL DEFAULT '0.00',
  `filter_diff` decimal(11,2) NOT NULL DEFAULT '0.00',
  `has_filters` tinyint(1) NOT NULL DEFAULT '0',
  `has_filter_min` tinyint(1) NOT NULL DEFAULT '0',
  `has_filter_max` tinyint(1) NOT NULL DEFAULT '0',
  `has_filter_diff` tinyint(1) NOT NULL DEFAULT '0',
  `is_constant` tinyint(1) NOT NULL DEFAULT '0',
  `is_cumulative` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sensor_feature_id`),
  KEY `sensor_id` (`sensor_id`),
  KEY `metric_id` (`metric_id`),
  KEY `sensor_feature__id_code_index` (`sensor_id`,`feature_code`),
  CONSTRAINT `station_sensor_feature_fk` FOREIGN KEY (`sensor_id`) REFERENCES `station_sensor` (`station_sensor_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_sensor_feature
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_forwarded_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_forwarded_message`;
CREATE TABLE `tbl_forwarded_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL COMMENT 'Id of message in listener_log',
  `client_id` int(10) unsigned NOT NULL COMMENT 'Id of message forwarding info',
  `status` enum('new','sent') NOT NULL DEFAULT 'new',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `i_forwarded_message__status` (`status`),
  KEY `fk_forwarded_message__log_id` (`message_id`),
  KEY `fk_forwarded_message__client_id` (`client_id`),
  CONSTRAINT `fk_forwarded_message__client_id` FOREIGN KEY (`client_id`) REFERENCES `tbl_message_forwarding_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_forwarded_message__log_id` FOREIGN KEY (`message_id`) REFERENCES `listener_log` (`log_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table with info about forwarded messages';

-- ----------------------------
-- Records of tbl_forwarded_message
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_forwarded_slave
-- ----------------------------
DROP TABLE IF EXISTS `tbl_forwarded_slave`;
CREATE TABLE `tbl_forwarded_slave` (
  `forwarded_slave_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `forwarded_slave_message_id` int(11) NOT NULL,
  `forwarded_slave_status` enum('sent','new') NOT NULL DEFAULT 'new',
  `forwarded_slave_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `forwarded_slave_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`forwarded_slave_id`),
  KEY `fk_forwarded_slave_message__log_id` (`forwarded_slave_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_forwarded_slave
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_message_forwarding_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_forwarding_info`;
CREATE TABLE `tbl_message_forwarding_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` text NOT NULL COMMENT 'Connection source string',
  `description` text COMMENT 'Description of forward info',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Provides info about WMs for message forwarding.';

-- ----------------------------
-- Records of tbl_message_forwarding_info
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_migration
-- ----------------------------
DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_migration
-- ----------------------------
INSERT INTO `tbl_migration` VALUES ('m150327_063204_sync_settings', '1447132297');
INSERT INTO `tbl_migration` VALUES ('m150413_091034_add_new_action_exp_imp', '1447132297');
INSERT INTO `tbl_migration` VALUES ('m150423_101101_ws7_8_reports_multiple', '1447132300');
INSERT INTO `tbl_migration` VALUES ('m150512_061911_master_slave_db', '1447132300');
INSERT INTO `tbl_migration` VALUES ('m150709_092613_aws_format', '1447132300');
INSERT INTO `tbl_migration` VALUES ('m150817_075236_shedule_history_action', '1447132300');
INSERT INTO `tbl_migration` VALUES ('m150818_072745_ODSS_reports', '1447132301');
INSERT INTO `tbl_migration` VALUES ('m150820_110723_WL_sensor', '1447132301');
INSERT INTO `tbl_migration` VALUES ('m150820_160653_WL_sensor_long_db', '1447132301');
INSERT INTO `tbl_migration` VALUES ('m150907_094330_ODSS_part2', '1447132302');
INSERT INTO `tbl_migration` VALUES ('m150923_091233_listener_additional_params', '1447132303');
INSERT INTO `tbl_migration` VALUES ('m150923_091233_listener_additional_params_long_db', '1447132303');
INSERT INTO `tbl_migration` VALUES ('m151005_095245_ftp_config_for_heartBeat', '1447132303');
INSERT INTO `tbl_migration` VALUES ('m151014_045857_add_color_column', '1447132303');
INSERT INTO `tbl_migration` VALUES ('m151016_052341_add_color_column_long_db', '1447132303');
INSERT INTO `tbl_migration` VALUES ('m151105_054503_defaultMailSettings', '1447132304');
INSERT INTO `tbl_migration` VALUES ('m151105_064906_defaultMails', '1447132304');
INSERT INTO `tbl_migration` VALUES ('m151105_113200_PathesForDockerVolumes', '1447132304');
INSERT INTO `tbl_migration` VALUES ('m151109_063217_AddSMSAccesActions', '1447132304');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin','superadmin') NOT NULL DEFAULT 'user',
  `timezone_id` varchar(255) NOT NULL DEFAULT 'UTC',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'hello@itscript.com', 'admin', '$2a$13$ewquN3ejT47STTvC4khIr.wave5vQF1mlIDXqteLQLt/LgymOs3uG', 'admin', 'UTC', '0000-00-00 00:00:00', '2014-09-15 16:59:18');
INSERT INTO `user` VALUES ('2', 'hello@itscript.com', 'superadmin', '$2a$13$ewquN3ejT47STTvC4khIr.wave5vQF1mlIDXqteLQLt/LgymOs3uG', 'superadmin', 'UTC', '0000-00-00 00:00:00', '2014-09-12 16:28:27');

-- ----------------------------
-- Table structure for xml_process_log
-- ----------------------------
DROP TABLE IF EXISTS `xml_process_log`;
CREATE TABLE `xml_process_log` (
  `xml_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`xml_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xml_process_log
-- ----------------------------
INSERT INTO `xml_process_log` VALUES ('1', 'Folder doesn\'t exists: C:\\weather_monitor_ftp\\xml_messages', '2015-11-10 11:11:01', '2015-11-10 11:11:01');
INSERT INTO `xml_process_log` VALUES ('2', 'Folder doesn\'t exists: /usr/share/nginx/html/www/files/xml_messages', '2015-11-10 11:16:02', '2015-11-10 11:16:02');
INSERT INTO `xml_process_log` VALUES ('3', 'Folder doesn\'t exists: /usr/share/nginx/html/www/files/xml_messages', '2015-11-10 11:21:01', '2015-11-10 11:21:01');
INSERT INTO `xml_process_log` VALUES ('4', 'Folder doesn\'t exists: /usr/share/nginx/html/www/files/xml_messages', '2015-11-10 11:26:01', '2015-11-10 11:26:01');

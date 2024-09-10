-- Adminer 4.8.1 MySQL 8.0.36 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `call_data`;
CREATE TABLE `call_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `signal_id` int NOT NULL,
  `event_id` int DEFAULT NULL,
  `signal_type` int DEFAULT NULL,
  `signal_landing_time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `event_maintype` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `event_subtype` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `voip_extn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `agent_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `addl_signal_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `voice_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `call_pick_duration_millis` text,
  `call_duration_millis` text,
  `event_registration_time` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `agent_full_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `priority` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `district_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `victim_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `victim_age` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `victim_gender` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `victim_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `near_ps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `addl_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `signal_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `review_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Pending',
  `is_active` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Y',
  `is_qa_active` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NOT NULL DEFAULT '2024-08-06 22:07:04' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '2024-08-06 22:07:04',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `co_qa_data`;
CREATE TABLE `co_qa_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `signal_id` bigint NOT NULL,
  `sco_qa_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sop_score` int NOT NULL,
  `active_listening_score` int NOT NULL,
  `relevent_detail_score` int DEFAULT NULL,
  `address_tagging_score` int DEFAULT NULL,
  `call_handled_time_score` int DEFAULT NULL,
  `sco_employee_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sco_remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `is_active` char(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cron_job_logs`;
CREATE TABLE `cron_job_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_details` json NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `master_signal_status`;
CREATE TABLE `master_signal_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `signal_status_id` int DEFAULT NULL,
  `signal_status` text,
  `master_signal_type_id` int DEFAULT NULL,
  `is_active` varchar(2) DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `master_signal_type_id` (`master_signal_type_id`),
  CONSTRAINT `master_signal_status_ibfk_1` FOREIGN KEY (`master_signal_type_id`) REFERENCES `master_signal_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `master_signal_status` (`id`, `signal_status_id`, `signal_status`, `master_signal_type_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1,	0,	'UNANSWERED_CALL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(2,	1,	'MISSED_CALL',	3,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(3,	2,	'REJECTED_CALL',	3,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(4,	3,	'PENDING_SIGNAL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(5,	4,	'PENDING_ACTION_SIGNAL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(6,	5,	'ACTION_SIGNAL',	1,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(7,	6,	'REVIEWED_MISSED_CALL',	3,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(8,	7,	'REPLY_FOR_ADDL_INFO',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(9,	8,	'INSUFFICIENT_INFO',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(10,	9,	'ENQUIRY_SIGNAL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(11,	10,	'INFORMATION_SIGNAL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(12,	11,	'PRANK_SIGNAL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(13,	12,	'ABUSIVE_SIGNAL',	2,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(14,	13,	'IRRELEVANT_SIGNAL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(15,	14,	'FORWARDED_SIGNAL',	1,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(16,	15,	'OUTBOUND_SIGNAL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(17,	16,	'OUTBOUND_SIGNAL_COMPLETE',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(18,	17,	'REVIEWED_UNANSWERED_CALL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(19,	18,	'REVIEWED_REJECTED_CALL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(20,	19,	'NUISANCE_CALL',	2,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(21,	20,	'WRONG_CALL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(22,	21,	'NO_RESPONSE_CALL',	5,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(23,	22,	'SILENT_CALL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(24,	23,	'APPRECIATION_OF_SERVICE_CALL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(25,	24,	'SERVICE_PROVIDED',	1,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(26,	25,	'REPEATED_SIGNAL',	NULL,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24'),
(27,	26,	'SAFE_JOURNEY_REQUEST',	6,	'Y',	'2024-08-30 06:50:52',	'2024-09-09 10:26:24');

DROP TABLE IF EXISTS `master_signal_type`;
CREATE TABLE `master_signal_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `signal_type_id` int NOT NULL,
  `signal_type` text NOT NULL,
  `percentage_of_calls_qa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `maximum_limit` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` varchar(2) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `master_signal_type` (`id`, `signal_type_id`, `signal_type`, `percentage_of_calls_qa`, `maximum_limit`, `is_active`, `created_at`, `updated_at`) VALUES
(1,	1,	'Actionable Calls',	'100',	'500',	'Y',	'2024-09-09 11:11:45',	'2024-08-20 06:10:02'),
(2,	2,	'Abusive Calls',	'100',	'500',	'Y',	'2024-09-09 11:11:57',	'2024-08-20 06:10:02'),
(3,	3,	'Missed Calls',	'100',	'500',	'Y',	'2024-09-09 11:12:08',	'2024-08-20 06:10:02'),
(4,	4,	'Non Voice Signal',	'100',	'100',	'Y',	'2024-09-09 11:12:16',	'2024-08-20 06:10:02'),
(5,	5,	'No Response Calls',	'100',	'100',	'Y',	'2024-09-09 11:12:22',	'2024-08-20 06:10:02'),
(6,	6,	'Trip Monitoring Calls',	'100',	'100',	'Y',	'2024-08-27 09:27:26',	'2024-08-20 06:10:02'),
(7,	7,	'Feedback Calls',	'100',	'100',	'Y',	'2024-09-09 11:12:28',	'2024-08-20 06:10:02');

-- 2024-09-10 08:50:42

-- Adminer 4.8.1 MySQL 9.0.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `call_data`;
CREATE TABLE `call_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `signal_id` int NOT NULL,
  `event_id` int NOT NULL,
  `signal_type` int NOT NULL,
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
  `call_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `review_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Pending',
  `is_active` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT '2024-08-06 22:07:04' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '2024-08-06 22:07:04',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `call_data` (`id`, `signal_id`, `event_id`, `signal_type`, `signal_landing_time`, `event_maintype`, `event_subtype`, `voip_extn`, `agent_name`, `addl_signal_info`, `voice_path`, `call_pick_duration_millis`, `call_duration_millis`, `event_registration_time`, `agent_full_name`, `priority`, `district_code`, `victim_name`, `victim_age`, `victim_gender`, `victim_address`, `near_ps`, `addl_info`, `call_type`, `review_status`, `is_active`, `created_at`, `updated_at`) VALUES
(1,	37610725,	6144298,	1,	'31-07-2024 23:59',	'CRIME AGAINST WOMEN',	'DOMESTIC VIOLENCE',	'101003',	'CO3341',	'EVENT ID-6144381',	'https://www2.cs.uic.edu/~i101/SoundFiles/BabyElephantWalk60.wav',	'2606',	'196934',	'1/8/2024 0:02',	'Riya sharma',	'HIGH',	'Jind',	'SULEKHA W/O MAHENDAR',	'NULL',	'M',	'NULL',	'JIND SADAR',	'CALLER NE KAHA HAI KI BHEN KE SAATH PATI MARPIIT KAR RAHA HAI UNKA',	'',	'Completed',	'Y',	'2024-08-21 08:17:26',	'2024-08-10 23:58:10'),
(2,	37610722,	6144273,	1,	'31-07-2024 23:59',	'TRAFFIC JAM',	'NULL',	'101044',	'CO3341',	'',	'https://www2.cs.uic.edu/~i101/SoundFiles/CantinaBand3.wav',	'1501',	'104014',	'1/8/2024 0:00',	'Riya sharma',	'HIGH',	'Gurugram',	'JYOT SANA',	'NULL',	'F',	'SEC 34 GURUGRAM \r\n NEAR HERO HONDA CHOWK',	'GURGAON SADAR',	'CALLER SAID KI JAAM LAGA HAI',	'',	'Completed',	'Y',	'2024-08-21 10:13:20',	'2024-08-10 23:58:10'),
(3,	37610694,	6144262,	1,	'31-07-2024 23:58',	'NULL',	'NULL',	'101009',	'CO3378',	'',	'https://www2.cs.uic.edu/~i101/SoundFiles/CantinaBand60.wav',	'1409',	'56805',	'31-07-2024 23:59',	'Diksha Bhardwaj',	'NULL',	'NULL',	'swati',	'NULL',	'F',	'singhuwala, ambala',	'NULL',	'caller ne btaya ki ghar se koi bag chori hua hai father caller ko preshan kar rahe hai us par illjam lga rahe hai \r\n caller ne proper info. nahi di , caller ab call pick nahi kar rahi hai , do dcr ambala me caller ki info. note krai hai',	'',	'Completed',	'Y',	'2024-08-21 10:13:28',	'2024-08-10 23:58:10'),
(4,	37610687,	6144261,	1,	'31-07-2024 23:58',	'PREGNANT WOMEN',	'ANTENATAL CARE',	'101046',	'CO3378',	'',	'https://www2.cs.uic.edu/~i101/SoundFiles/Fanfare60.wav',	'1507',	'166223',	'31-07-2024 23:59',	'Diksha Bhardwaj',	'HIGH',	'Yamunanagar',	'POOJA DEVI W/O DHRAMVEER',	'NULL',	'F',	'DRAJPUR, YAMUANNAGAR \r\n  NEAR BY ,RAVIDAS MANDIR',	'CHHAPAR',	'CALLER NE BATAYA KI DELIVERY CASE HAI ..',	'',	'Completed',	'Y',	'2024-08-21 10:13:37',	'2024-08-10 23:58:10'),
(5,	37610682,	6143550,	1,	'31-07-2024 23:58',	'CRIME AGAINST WOMEN',	'MOLESTATION',	'101032',	'CO3401',	'EVENT ID 6143550\r\n ALL READY CASE DISPATCH',	'https://www2.cs.uic.edu/~i101/SoundFiles/gettysburg10.wav',	'1402',	'50643',	'NULL',	'Renuka',	'EMERGENCY',	'Rewari',	'anu d/o harfoul',	'19',	'F',	'goll chakar rewari \r\n  civil hospital , sanik school',	'REWARI CITY',	'caller said makan malik ka ladka drink ker ke \r\n ghar me ghuss gya hai ..nand or bhabi ko \r\n  galat tarike se touch kiya hai ..\r\n  moke per hai ..',	'',	'Completed',	'Y',	'2024-08-21 10:14:28',	'2024-08-10 23:58:10'),
(6,	37610681,	6141393,	1,	'31-07-2024 23:58',	'TRAFFIC JAM',	'NULL',	'101022',	'CO3339',	'E.ID:- 6141393',	'https://www2.cs.uic.edu/~i101/SoundFiles/gettysburg.wav',	'2708',	'75908',	'NULL',	'Anu Devi',	'HIGH',	'Gurugram',	'vipin',	'NULL',	'M',	'sector 55 gurugram \r\n gata chowk',	'DLF PHASE-1',	'caller said jam laga hai ..\r\n  1 ganta ho gya hai ..',	'',	'Pending',	'Y',	'2024-08-12 10:51:21',	'2024-08-10 23:58:10'),
(7,	37610680,	6144246,	1,	'31-07-2024 23:58',	'ACCIDENT',	'NULL',	'101053',	'CO3650',	'',	'https://www2.cs.uic.edu/~i101/SoundFiles/ImperialMarch60.wav',	'2320',	'98407',	'31-07-2024 23:58',	'POONAM',	'HIGH',	'Gurugram',	'SURENDER',	'NULL',	'M',	'SECTOR 48 GURUGARM',	'GURGAON SADAR',	'CALLER SAID KE UNKI CAR BHICH MEIN BAND HO GYI HAI ..OR BHICH MEIN SE TUT GYI HAI \r\n OR NEED HELP',	'',	'Pending',	'Y',	'2024-08-12 10:51:21',	'2024-08-10 23:58:10'),
(8,	37610678,	6144248,	1,	'31-07-2024 23:58',	'SUICIDE',	'SUICIDE BY POISON',	'101016',	'CO3648',	'',	'https://www2.cs.uic.edu/~i101/SoundFiles/PinkPanther30.wav',	'2008',	'212837',	'31-07-2024 23:58',	'Anshu',	'HIGH',	'Gurugram',	'anurag',	'NULL',	'M',	'imt manesar , sector 6 naharpur kasan , gurugram',	'MANESAR',	'caller ne bola ki ek dost hai unka or room par rehta tha vo caller ke sath mein ...\r\n sucide kiya hai 6 bhje subah ajj ..poison kha liya hai uske dost ne ..\r\n  ladai jagda bhi nahi tha ....police wali team subah le ja chuki hai unke dost ko ....need police help...',	'',	'Pending',	'Y',	'2024-08-12 10:51:21',	'2024-08-10 23:58:10'),
(9,	37610673,	6144245,	1,	'31-07-2024 23:57',	'ACCIDENT',	'ROAD ACCIDENT',	'101039',	'CO3622',	'',	'https://www2.cs.uic.edu/~i101/SoundFiles/PinkPanther60.wav',	'1707',	'115513',	'31-07-2024 23:58',	'Anchal Thakur 3622',	'HIGH',	'Palwal',	'RINKU',	'NULL',	'M',	'CHANDHAT , PALWAL ROAD ,PALWAL , NEAR KRISHNA HOTEL',	'CHAND HUT',	'CALLER SAID PICKUP NE TRUCK MEIN HIT KIYA HAI , GAADI PALAT GAYI HAI , SAB SAFE HAI NO INJURY , MOKE SE TRUCK DRIVER BHAAG GAYA HAI',	'',	'Pending',	'Y',	'2024-08-12 10:51:21',	'2024-08-10 23:58:10'),
(10,	37610672,	6144250,	2,	'31-07-2024 23:57',	'NULL',	'NULL',	'101052',	'CO3355',	'',	'https://www2.cs.uic.edu/~i101/SoundFiles/preamble10.wav',	'3098',	'32799',	'31-07-2024 23:58',	'Neha Tiwari',	'NULL',	'Jind',	'AJAY .',	'NULL',	'M',	'KOYAL -JIND,126116',	'GARHI',	'MALE CALLER SAID POLICE CHAHIYE \r\n FIR LADY NE PHONE LIYA USNE BOLA POLICE NAHI CHAHIYE , DARU PI RAKHI HAI\r\n AGER DIKAT HUI TO WO CALL KAR DENGE',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(11,	37610670,	6144243,	2,	'31-07-2024 23:57',	'ACCIDENT',	'ROAD ACCIDENT',	'101042',	'CO3615',	'',	'/data/spool/asterisk/monitor/20240731/8920566276_101042_1722450460.113064038_20240731_235758.wav',	'2496',	'129827',	'31-07-2024 23:58',	'Anamika',	'HIGH',	'Palwal',	'amir',	'NULL',	'M',	'GADHPURI PALWAL',	'GADPURI',	'CALLER SAID TRUCK OR CAR KA ACCIDENT HUA HAI \n NO INJURY \n MOKE PAR HAI',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(12,	37610658,	6144244,	2,	'31-07-2024 23:57',	'HURT',	'NULL',	'101010',	'CO3360',	'',	'/data/spool/asterisk/monitor/20240731/9667257481_101010_1722450457.113063982_20240731_235747.wav',	'1400',	'84109',	'31-07-2024 23:58',	'Rajni Saini',	'HIGH',	'Gurugram',	'SARITA D/O VINOD',	'NULL',	'M',	'SHEETLA COLONY, GURUGRAM',	'NULL',	'CALLER NE BTAYA KI UNKA HUSBAND UNKE GHAR WALO KE SATH MAAR PEET KAR RAHA HAI',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(13,	37610657,	6144247,	2,	'31-07-2024 23:57',	'TRAFFIC JAM',	'NULL',	'101023',	'CO3406',	'event id- 6141492',	'/data/spool/asterisk/monitor/20240731/8377868088_101023_1722450448.113063832_20240731_235743.wav',	'1808',	'40202',	'31-07-2024 23:58',	'Sunita DEVI',	'NULL',	'Gurugram',	'kiran',	'NULL',	'F',	'NULL',	'GURGAON SADAR',	'event id- 6141492',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(14,	37610653,	6144242,	2,	'31-07-2024 23:57',	'NULL',	'NULL',	'102003',	'CO3456',	'CALLER NE DISTT NAHI BATAYA \n LBS BHI NAHI AA RAHI HAI CALLER KI\n CALL BACK KI CALLER CALLS CUT KAR RAHA HAI',	'/data/spool/asterisk/monitor/20240731/7397287383_102003_1722450445.113063784_20240731_235734.wav',	'2505',	'148324',	'31-07-2024 23:58',	'Sakshi Malik',	'NULL',	'NULL',	'SHUBHAM VERMA',	'NULL',	'M',	'BUS STAND DEV NAGAR',	'NULL',	'CALLER SAID VO HOTEL ME RUKA HUA THA \n HOTEL VALO NE BATMIJI KI HAI ,HATHAPAI BHI KI HAI \n SAMAN UNHONE APNE PAS RAKH LIYA HAI \n NO NEED MED',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(15,	37610638,	6144231,	2,	'31-07-2024 23:56',	'OTHERS',	'OTHERS',	'101009',	'CO3378',	'',	'/data/spool/asterisk/monitor/20240731/8708713941_101009_1722450401.113063027_20240731_235652.wav',	'1803',	'61409',	'31-07-2024 23:57',	'Diksha Bhardwaj',	'LOW',	'Nuh',	'Anil Kumar',	'NULL',	'M',	'kmp highway, nuh',	'ROZKA MEO',	'caller ki gaddi khrab ho gyi hai highway par',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(16,	37610637,	6143995,	2,	'31-07-2024 23:56',	'ACCIDENT',	'HEAVY VEHICLE',	'101002',	'CO3362',	'event id 6143995',	'/data/spool/asterisk/monitor/20240731/6001359196_101002_1722450392.113062855_20240731_235647.wav',	'2205',	'28402',	'NULL',	'Rita Devi (3362)',	'HIGH',	'Gurugram',	'HARVINDER SINGH',	'NULL',	'M',	'BADSHAHPUR GURUGRAM \n NEAR CHOWK',	'SECTOR-65',	'CALLER NE KAHA HAI KI ACCIDENT HUA HAI CAR AUR TRUCK\n KA\n NO INJURY \n DONO MOKE PAR HAI',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(17,	37610619,	6144218,	2,	'31-07-2024 23:56',	'ACCIDENT',	'ROAD ACCIDENT',	'101033',	'CO3350',	'CALLER KO LOCATION NHI PTA HAI',	'/data/spool/asterisk/monitor/20240731/9467494246_101033_1722450350.113062127_20240731_235604.wav',	'1618',	'81694',	'31-07-2024 23:56',	'Mamta_',	'HIGH',	'Karnal',	'SUNIL .',	'NULL',	'M',	'KARNAL BYPASS KARNAL',	'RAM NAGAR KARNAL',	'CALLER SAID ACCIDENT HUA HAI\n  BIKE OR TRUCK KA HUA HAI \n  MOKE PAR HAI \n INJURY HAI',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(18,	37610601,	6144217,	2,	'31-07-2024 23:55',	'ACCIDENT',	'ROAD ACCIDENT',	'101032',	'CO3401',	'',	'/data/spool/asterisk/monitor/20240731/9050132176_101032_1722450329.113061775_20240731_235541.wav',	'1503',	'74812',	'31-07-2024 23:55',	'Renuka',	'HIGH',	'Palwal',	'KARAN SINGH',	'NULL',	'M',	'GADPURI TOLL PLAZA PALWAL',	'GADPURI',	'CALLER NE BGTAYA KI ACIDENT HUA HAI GADI OR TRACK ACCIDENT HAI DONO MOKE PER HAI , NO INJURY',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(19,	37610597,	6144206,	2,	'31-07-2024 23:55',	'TRAFFIC JAM',	'NULL',	'102003',	'CO3456',	'',	'/data/spool/asterisk/monitor/20240731/8929059031_102003_1722450326.113061718_20240731_235539.wav',	'3209',	'64508',	'31-07-2024 23:55',	'Sakshi Malik',	'HIGH',	'Gurugram',	'JAIVEER',	'NULL',	'M',	'SUBASH CHOWK GURUGRAM',	'GURGAON SADAR',	'CALLER SAID TRAFFIC JAAM LAGA HUA HAI',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(20,	37610596,	6144219,	2,	'31-07-2024 23:55',	'TRAFFIC JAM',	'NULL',	'101044',	'CO3593',	'',	'/data/spool/asterisk/monitor/20240731/9818031743_101044_1722450316.113061546_20240731_235532.wav',	'1715',	'90105',	'31-07-2024 23:56',	'Kirna Devi',	'HIGH',	'Rewari',	'NARESH KUMAR',	'NULL',	'M',	'DHARUHERA REWARI',	'DHARUHERA',	'CALLER SAID KI JAAM LAGA HAI',	'',	'Pending',	'Y',	'2024-08-13 11:43:48',	'2024-08-10 23:58:10'),
(21,	37610595,	6144230,	3,	'31-07-2024 23:55',	'QUARELLING',	'OTHERS',	'102005',	'CO3414',	'CALLER NE BATAYA KI KIRAYEDAAR LADAI KAR RHA HAI . GAALI DE RHA HAI .',	'/data/spool/asterisk/monitor/20240731/7828143304_102005_1722450307.113061360_20240731_235519.wav',	'1202',	'144115',	'31-07-2024 23:57',	'AKANSHA PAWAR',	'MEDIUM',	'Gurugram',	'RATIRAM',	'NULL',	'M',	'NEAR VYAPAR KENDRA , PALAM VIHAR , GURGAON',	'BAJGHERA',	'CALLER NE BATAYA KI KIRAYEDAAR LADAI KAR RHA HAI . GAALI DE RHA HAI . NO INJURY .',	'',	'Pending',	'Y',	'2024-08-13 11:45:21',	'2024-08-10 23:58:10'),
(22,	37610594,	6143909,	3,	'31-07-2024 23:55',	'HAZARDOUS CONDITION INCIDENTS',	'NULL',	'102007',	'CO3452',	'EVENT ID = 6143909',	'/data/spool/asterisk/monitor/20240731/7027333946_102007_1722450303.113061299_20240731_235517.wav',	'1913',	'37797',	'NULL',	'Mamta Saharan',	'HIGH',	'Karnal',	'SOMPAL',	'NULL',	'M',	'chirao, Karnal,\n near kali mata mandir',	'NULL',	'caller told that ek tree gira huya hai\n uski wajah se accident ho rahe hain',	'',	'Pending',	'Y',	'2024-08-13 11:45:21',	'2024-08-10 23:58:10'),
(23,	37610593,	6144205,	3,	'31-07-2024 23:55',	'MISSING INFORMATION',	'MALE',	'102006',	'CO3449',	'',	'/data/spool/asterisk/monitor/20240731/8448161085_102006_1722450301.113061256_20240731_235513.wav',	'2097',	'249126',	'31-07-2024 23:55',	'Manisha Vashishta',	'HIGH',	'Gurugram',	'RAM KISHAN',	'33',	'M',	'H.NO 78 ,GALI B6,ASHOK VIHAR PHASE 3,GURUGRAM',	'SECTOR 5 GURUGRAM',	'CALLER SAID KI HUSBAND GHAR NHI AAYE HAI ABHI TAK \n NAME -RAM KISHAN\n AGE-33\n HEIGHT-5.10FT\n COLOUR -GORA \n WEAR -SHIRT AND PANT\n MOBILE NO -8859197992',	'',	'Pending',	'Y',	'2024-08-13 11:45:21',	'2024-08-10 23:58:10'),
(24,	37610576,	6144193,	3,	'31-07-2024 23:54',	'ACCIDENT',	'TWO WHEELER ACCIDENT',	'101038',	'CO3604',	'',	'/data/spool/asterisk/monitor/20240731/7082569502_101038_1722450270.113060698_20240731_235444.wav',	'2008',	'122412',	'31-07-2024 23:54',	'Sonia Devi',	'HIGH',	'Rohtak',	'KULDEEP',	'NULL',	'M',	'SONIPAT ROAD PAKSMA ROHTAK',	'SAMPLA',	'CALLER SAID THAT RASTE ME SAFEDA GIRA HUA HAI \n CHOT AAYI HAI UNKO \n BIKE KA ACCIDENT HUA HAI \n INJURY HAI UNKO',	'',	'Pending',	'Y',	'2024-08-13 11:45:21',	'2024-08-10 23:58:10'),
(25,	37610573,	6144192,	3,	'31-07-2024 23:54',	'ACCIDENT',	'ROAD ACCIDENT',	'101009',	'CO3378',	'',	'/data/spool/asterisk/monitor/20240731/9466442109_101009_1722450263.113060576_20240731_235435.wav',	'1421',	'72796',	'31-07-2024 23:54',	'Diksha Bhardwaj',	'HIGH',	'Palwal',	'sailesh',	'NULL',	'M',	'gadpuri toll, palwal',	'GADPURI',	'accident hua hai gaddi ro truck ka no injury moke par hai dono',	'',	'Pending',	'Y',	'2024-08-13 11:45:21',	'2024-08-10 23:58:10'),
(26,	37610571,	6144204,	3,	'31-07-2024 23:54',	'ACCIDENT',	'ROAD ACCIDENT',	'101010',	'CO3360',	'',	'/data/spool/asterisk/monitor/20240731/9813198831_101010_1722450259.113060493_20240731_235431.wav',	'2103',	'77616',	'31-07-2024 23:55',	'Rajni Saini',	'HIGH',	'Palwal',	'Shiv Kumar',	'NULL',	'M',	'PREET HOSPITAL, NEETU DHABA,, PALWAL',	'HODAL',	'CALLER NE BTAYA KI UNKE ROAD KE UPER EK ACCIDENT HUA BHI HAI \n PERSON KI DEATH HO GAYI HAI MOKE PAR HAI \n NO MORE INFORMATION, ,',	'',	'Pending',	'Y',	'2024-08-13 11:45:21',	'2024-08-10 23:58:10'),
(27,	37610569,	6144095,	3,	'31-07-2024 23:54',	'ACCIDENT',	'ROAD ACCIDENT',	'101057',	'CO3634',	'EVENT ID - 6144095',	'/data/spool/asterisk/monitor/20240731/8059891235_101057_1722450258.113060474_20240731_235428.wav',	'1511',	'36818',	'NULL',	'kajal Dhiman',	'HIGH',	'Palwal',	'RAMBEER',	'NULL',	'M',	'BABRI MOD , HODAL,PALWAL',	'HODAL',	'CALLER SAID BIKE KA CAR KE SATH ACCIDENT HUA HAI \n INJURY NHI HAI \n DONO MOKE PAR HAI',	'',	'Pending',	'Y',	'2024-08-13 11:45:21',	'2024-08-10 23:58:10'),
(28,	37610564,	6144165,	3,	'31-07-2024 23:54',	'QUARELLING',	'NULL',	'101046',	'CO3592',	'EVENT ID = 6144165',	'/data/spool/asterisk/monitor/20240731/7082096825_101046_1722450251.113060355_20240731_235413.wav',	'1804',	'72706',	'NULL',	'Suman Kashyap',	'HIGH',	'Panipat',	'VEEM ADHIKARI',	'NULL',	'F',	'sec-13/17 ,panipat',	'SECTOR 13/17 PANIPAT',	'CALLER SAID KI LADAI JHGDA HO RHA HAI FACTORY MEIN 10 -12 LOG HAI \n MOKKE PAR HI HAI',	'',	'Pending',	'Y',	'2024-08-13 11:45:21',	'2024-08-10 23:58:10'),
(29,	37610562,	6144191,	3,	'31-07-2024 23:54',	'ACCIDENT',	'ROAD ACCIDENT',	'101001',	'CO3519',	'',	'/data/spool/asterisk/monitor/20240731/8920566276_101001_1722450243.113060227_20240731_235412.wav',	'1408',	'51616',	'31-07-2024 23:54',	'HEENA SAIN',	'HIGH',	'Palwal',	'amir',	'NULL',	'M',	'gadpuri toll , palwal',	'GADPURI',	'caller ne kaha ki unki gaddi mein truck vale ne hit kiya hai\n no injry',	'',	'Pending',	'Y',	'2024-08-13 11:45:21',	'2024-08-10 23:58:10'),
(30,	37610534,	6144190,	3,	'31-07-2024 23:53',	'OTHERS',	'OTHERS',	'101022',	'CO3339',	'',	'/data/spool/asterisk/monitor/20240731/9811739007_101022_1722450195.113059321_20240731_235331.wav',	'2106',	'113442',	'31-07-2024 23:54',	'Anu Devi',	'HIGH',	'Gurugram',	'SAVESH SINGH',	'NULL',	'F',	'SECTOR-88A , GURUGRAM',	'SECTOR-10',	'CALLER NE BTAYA KI UNKA PHONE CAB MAI REH GAYA HAI...CAB DRIVER PHONE NAHI PICK KAR RAHA HAI...UP 86 AT 0621 HONDA AMGE BALCK',	'',	'Pending',	'Y',	'2024-08-13 11:45:21',	'2024-08-10 23:58:10'),
(31,	37610529,	6144396,	4,	'31-07-2024 23:53',	'CYBER CRIMES',	'ILLEGAL MONEY TRANSFER FROM BANK',	'191008',	'1C2L85',	'financial fraud-',	'/data/spool/asterisk/monitor/20240731/8368138716_101032_1722450189.113059179_20240731_235314.wav',	'3003',	'970412',	'1/8/2024 0:09',	'Renuka',	'HIGH',	'Panchkula',	'rohit kumar',	'NULL',	'M',	'panchkula,133004',	'CHANDIMANDIR',	'Grievance submitted successfully, with Acknowledgement No. 31307240041698.',	'',	'Pending',	'Y',	'2024-08-13 11:45:32',	'2024-08-10 23:58:10'),
(32,	37610513,	6143867,	4,	'31-07-2024 23:52',	'ACCIDENT',	'ROAD ACCIDENT',	'102007',	'CO3452',	'EVENT ID = 6143867',	'/data/spool/asterisk/monitor/20240731/9810456604_102007_1722450173.113058886_20240731_235255.wav',	'1925',	'17563',	'NULL',	'Mamta Saharan',	'HIGH',	'Gurugram',	'SORABH SHARMA',	'NULL',	'M',	'PARK HOSPITAL,SECTOR 50 , GURUGRAM',	'SECTOR - 50',	'CALLER NE BTAYA KI USKI BIKE KO GADDI NE HIT KIYA HAI...MOKE PAR HAI...\n MINOR INJURY \n NEED ERV ONLY',	'',	'Pending',	'Y',	'2024-08-13 11:45:32',	'2024-08-10 23:58:10'),
(33,	37610510,	6144178,	4,	'31-07-2024 23:52',	'TRAFFIC JAM',	'NULL',	'101024',	'CO3334',	'',	'/data/spool/asterisk/monitor/20240731/9910383512_101024_1722450157.113058589_20240731_235251.wav',	'3909',	'39860',	'31-07-2024 23:53',	'Sapna',	'HIGH',	'Faridabad',	'ANIL',	'NULL',	'M',	'BADKAL PULL , FARIDABAD',	'SECTOR-17',	'CALLER NE BTAYA KI JAAM LAGA HUA HAI 30 MINUTES SE',	'',	'Pending',	'Y',	'2024-08-13 11:45:32',	'2024-08-10 23:58:10'),
(34,	37610506,	6144179,	4,	'31-07-2024 23:52',	'OTHERS',	'OTHERS',	'101002',	'CO3362',	'caller told that gaadi khrab ho gayi hai',	'/data/spool/asterisk/monitor/20240731/9588103214_101002_1722450147.113058408_20240731_235239.wav',	'1603',	'159985',	'31-07-2024 23:53',	'Rita Devi (3362)',	'HIGH',	'Rewari',	'rizwan',	'NULL',	'M',	'kapriwas, rewari',	'SEC-6, DHARUHERA',	'caller told that gaadi khrab ho gayi hai\n truck hai\n akele hain caller',	'',	'Pending',	'Y',	'2024-08-13 11:45:32',	'2024-08-10 23:58:10'),
(35,	37610497,	6144165,	4,	'31-07-2024 23:52',	'QUARELLING',	'NULL',	'101001',	'CO3519',	'',	'/data/spool/asterisk/monitor/20240731/7082096825_101001_1722450135.113058176_20240731_235217.wav',	'1908',	'64172',	'31-07-2024 23:52',	'HEENA SAIN',	'HIGH',	'Panipat',	'VEEM ADHIKARI',	'NULL',	'F',	'sec-13/17 ,panipat',	'SECTOR 13/17 PANIPAT',	'CALLER SAID KI LADAI JHGDA HO RHA HAI FACTORY MEIN 10 -12 LOG HAI \n MOKKE PAR HI HAI',	'',	'Pending',	'Y',	'2024-08-13 11:45:32',	'2024-08-10 23:58:10'),
(36,	37610496,	6144166,	4,	'31-07-2024 23:52',	'DISPUTE',	'DRUNKEN PERSON (ALCOHOLIC)',	'101030',	'CO3543',	'',	'/data/spool/asterisk/monitor/20240731/7206828009_101030_1722450122.113057917_20240731_235216.wav',	'1706',	'59464',	'31-07-2024 23:52',	'NIRMLA DHIMAN',	'HIGH',	'Karnal',	'RAJ KUMAR',	'53',	'M',	'RAVIDASS MANDIR SADAR BAZAR KARNAL',	'KARNAL CITY',	'CALLER NE KHA KI UNKA BHATIJA DRINK KAR KE GALI DETA HAI',	'',	'Pending',	'Y',	'2024-08-13 11:45:32',	'2024-08-10 23:58:10'),
(37,	37610476,	6144167,	4,	'31-07-2024 23:51',	'ACCIDENT',	'CAR ACCIDENT',	'102003',	'CO3456',	'',	'/data/spool/asterisk/monitor/20240731/9057237653_102003_1722450095.113057377_20240731_235145.wav',	'2771',	'190785',	'31-07-2024 23:52',	'Sakshi Malik',	'LOW',	'Rewari',	'SABIR KHAN',	'NULL',	'M',	'BAWAL CHOWK REWARI',	'KASOLA',	'CALLER SAID ACCIDENT HOGYA HAI \n HIT HOGYI HAI \n NO INJURY \n MOKE PAR HAI',	'',	'Pending',	'Y',	'2024-08-13 11:45:32',	'2024-08-10 23:58:10'),
(38,	37610469,	6143629,	4,	'31-07-2024 23:51',	'HURT',	'NULL',	'102005',	'CO3414',	'EVENT ID - 6143629',	'/data/spool/asterisk/monitor/20240731/8530576028_102005_1722450073.113056941_20240731_235127.wav',	'2192',	'46040',	'NULL',	'AKANSHA PAWAR',	'EMERGENCY',	'Sonipat',	'SURYA KANT',	'NULL',	'M',	'RATHDHANA , SONIPAT \n SEC 42',	'SONIPAT',	'CALLER SAID KI UNKE SATH MAR PIT KI HAI , JANTA HAI CALLER USKO , \n MEDICAL BHI CHAHIYE UNKO \n CALLER SAHI SE ADDRESS NAHI BBATA RAHE HAI \n LBS PAR BHEJI HAI',	'',	'Pending',	'Y',	'2024-08-13 11:45:32',	'2024-08-10 23:58:10'),
(39,	37610465,	6144154,	4,	'31-07-2024 23:51',	'NULL',	'NULL',	'101045',	'CO3611',	'CALLER SAID BIKE CHORI HOGI ABHI MIL GAI HAI ABHI NAHI KOI HELP CHAHIYE',	'/data/spool/asterisk/monitor/20240731/7496028170_101045_1722450062.113056714_20240731_235120.wav',	'1400',	'25897',	'31-07-2024 23:51',	'SHRDHA DEVI',	'NULL',	'NULL',	'NULL',	'NULL',	'NULL',	'NULL',	'NULL',	'CALLER SAID BIKE CHORI HOGI ABHI MIL GAI HAI ABHI NAHI KOI HELP CHAHIYE',	'',	'Pending',	'Y',	'2024-08-13 11:45:32',	'2024-08-10 23:58:10'),
(40,	37610461,	6143867,	4,	'31-07-2024 23:51',	'ACCIDENT',	'ROAD ACCIDENT',	'102007',	'CO3452',	'EVENT ID = 6143867',	'/data/spool/asterisk/monitor/20240731/9810456604_102007_1722450062.113056706_20240731_235113.wav',	'1904',	'28894',	'NULL',	'Mamta Saharan',	'HIGH',	'Gurugram',	'SORABH SHARMA',	'NULL',	'M',	'PARK HOSPITAL,SECTOR 50 , GURUGRAM',	'SECTOR - 50',	'CALLER NE BTAYA KI USKI BIKE KO GADDI NE HIT KIYA HAI...MOKE PAR HAI...\n MINOR INJURY \n NEED ERV ONLY',	'',	'Pending',	'Y',	'2024-08-13 11:45:32',	'2024-08-10 23:58:10'),
(41,	37610446,	6144153,	5,	'31-07-2024 23:50',	'QUARELLING',	'NULL',	'102006',	'CO3449',	'CALLER NE ADDRESS NHI BTAYA CALL CUT KARDI BACK CALL KARNE PAR CALL NHI LAGI NO. PAR',	'/data/spool/asterisk/monitor/20240731/7082096825_102006_1722450043.113056316_20240731_235055.wav',	'2308',	'62769',	'31-07-2024 23:51',	'Manisha Vashishta',	'NULL',	'NULL',	'NULL',	'NULL',	'NULL',	'NULL',	'NULL',	'CALLER SAID KI LADAI JHGDA HO RHA HAI FACTORY MEIN 10 -12 LOG HAI \n MOKKE PAR HI HAI',	'',	'Pending',	'Y',	'2024-08-13 11:45:44',	'2024-08-10 23:58:10'),
(42,	37610442,	6144249,	5,	'31-07-2024 23:50',	'CRIME AGAINST WOMEN',	'MISBEHAVE',	'101023',	'CO3406',	'system hang hone ke karan case late hua hai ..',	'/data/spool/asterisk/monitor/20240731/8468000088_101023_1722450038.113056216_20240731_235056.wav',	'5701',	'126591',	'31-07-2024 23:58',	'Sunita DEVI',	'HIGH',	'Ambala',	'moni',	'NULL',	'F',	'manav chowk , ambala',	'AMBALA CITY',	'caller said 3-4 ladke usko pareshan kar rahe hai wo log gadi mein hai ..\n white , balero gadi hai ..\n gadi no. pb035678 ..\n wo ladke moke par hai ya nhi caller ko nhi pta hai ..',	'',	'Pending',	'Y',	'2024-08-13 11:45:44',	'2024-08-10 23:58:10'),
(43,	37610426,	6144038,	5,	'31-07-2024 23:50',	'OTHERS',	'OTHERS',	'101038',	'CO3604',	'EVENT ID- 6144038',	'/data/spool/asterisk/monitor/20240731/9289392345_101038_1722450006.113055583_20240731_235016.wav',	'1614',	'66146',	'NULL',	'Sonia Devi',	'HIGH',	'Gurugram',	'ASI MUKESH KUMAR',	'NULL',	'M',	'NEAR LEISURE VALLEY PARK, SECTOR 29 GURUGRAM',	'DLF',	'CALLER SAID GADI PANI ME DUB GYA HAI \n GADI START NHI HO RHI HAI \n NEED HELP',	'',	'Pending',	'Y',	'2024-08-13 11:45:44',	'2024-08-10 23:58:10'),
(44,	37610416,	6144139,	5,	'31-07-2024 23:50',	'CRIME AGAINST WOMEN',	'DOMESTIC VIOLENCE',	'101057',	'CO3634',	'',	'/data/spool/asterisk/monitor/20240731/7404193984_101057_1722449994.113055302_20240731_235004.wav',	'1512',	'129835',	'31-07-2024 23:50',	'kajal Dhiman',	'HIGH',	'Hansi',	'RENU W.O SONU S.O DHARAM VEER',	'NULL',	'F',	'SISAI, HISAR \n NEAR BY PANA',	'HANSI SADAR',	'CALLER NE BTAYA KI SISTER KE SATH JIJE NE MAAR PIT KI HAI DRINK KAR KE \n NO NEED AMBU',	'',	'Pending',	'Y',	'2024-08-13 11:45:44',	'2024-08-10 23:58:10'),
(45,	37610413,	6144140,	5,	'31-07-2024 23:50',	'REFER FROM ONE FACILITY TO OTHER',	'OTHERS',	'101021',	'CO3342',	'',	'/data/spool/asterisk/monitor/20240731/9306311527_101021_1722449993.113055293_20240731_235007.wav',	'6196',	'43064',	'31-07-2024 23:50',	'Baljinder Kaur',	'EMERGENCY',	'Panchkula',	'AARIYAN',	'NULL',	'M',	'SECTOR 6 CIVIL HOSPITAL PANCHKULA',	'PS 5',	'REFER CASE HAI \n PGI CHANDIGARH JANA HAI',	'',	'Pending',	'Y',	'2024-08-13 11:45:44',	'2024-08-10 23:58:10'),
(46,	37610411,	6144142,	5,	'31-07-2024 23:50',	'MISSING INFORMATION',	'MALE',	'101032',	'CO3401',	'',	'/data/spool/asterisk/monitor/20240731/7015199851_101032_1722449991.113055252_20240731_235001.wav',	'1405',	'157137',	'31-07-2024 23:50',	'Renuka',	'HIGH',	'Bhiwani',	'ATAR SINGH',	'50',	'M',	'Kitlana CHARKHI DADRI',	'BHIWANI SADAR',	'CALLER NE BTAYA KI USKE SASUR 6 BJE SE MISSING HAI , \n NAAM ATAR SINGH \n AGE 50 \n HEIGHT 5.7 \n RANG SAWLA \n KAPADE GREEN TSHARI BLACK LOWER \n PH NO 9050230341',	'',	'Pending',	'Y',	'2024-08-13 11:45:44',	'2024-08-10 23:58:10'),
(47,	37610396,	6144138,	5,	'31-07-2024 23:49',	'ACCIDENT',	'CAR ACCIDENT',	'101024',	'CO3334',	'',	'/data/spool/asterisk/monitor/20240731/8287856409_101024_1722449975.113054937_20240731_234949.wav',	'1607',	'96944',	'31-07-2024 23:49',	'Sapna',	'HIGH',	'Gurugram',	'VIJAY',	'NULL',	'M',	'HONDA CITY METRO , AUDI SHOWROOM, SECTOR 29 , GURUGRAM',	'DLF',	'CALLER NE BTAYA KI UNKI GADI MEIN DUSRI GADI NE HIT KIYA HAI DONO CAR HAI\n DUSRI PARTY NE DRINK KAR RAKHI HAI \n JISNE HIT KIYA HAI UNKE EK BACHE KO CHOT AYI HAI USE LE GAYE HAI HOSPITAL',	'',	'Pending',	'Y',	'2024-08-13 11:45:44',	'2024-08-10 23:58:10'),
(48,	37610393,	6144141,	5,	'31-07-2024 23:49',	'TRAFFIC JAM',	'NULL',	'101016',	'CO3648',	'',	'/data/spool/asterisk/monitor/20240731/9810508311_101016_1722449975.113054919_20240731_234944.wav',	'1393',	'104728',	'31-07-2024 23:50',	'Anshu',	'HIGH',	'Gurugram',	'SUNITA GUPta',	'NULL',	'F',	'rajiv chowk ,GURUGRAM',	'GURGAON SADAR',	'caller ne bola ki traffic jaam laga hai bhut der se vha par....reason nahi pta hai ....',	'',	'Pending',	'Y',	'2024-08-13 11:45:44',	'2024-08-10 23:58:10'),
(49,	37610384,	6144127,	5,	'31-07-2024 23:49',	'CRIME AGAINST WOMEN',	'DOMESTIC VIOLENCE',	'101011',	'CO3368',	'',	'/data/spool/asterisk/monitor/20240731/9266101633_101011_1722449947.113054403_20240731_234919.wav',	'2009',	'66376',	'31-07-2024 23:49',	'Sheetal RAJPUT',	'HIGH',	'Sonipat',	'ANJU W/O ANOOP YADAV',	'NULL',	'F',	'PIYAU MANIYARI SONIPAT \n MARKET GALI NO. 4',	'NULL',	'CALLER NE BTAYA KI USKA HUSBAND USKE SATH MAAR PIT KAR RAHA HAI',	'',	'Pending',	'Y',	'2024-08-13 11:45:44',	'2024-08-10 23:58:10'),
(50,	37610381,	6144125,	5,	'31-07-2024 23:49',	'DISPUTE',	'NULL',	'101001',	'CO3519',	'',	'/data/spool/asterisk/monitor/20240731/8222002073_101001_1722449938.113054236_20240731_234909.wav',	'1298',	'67860',	'31-07-2024 23:49',	'HEENA SAIN',	'HIGH',	'Jind',	'SANDEEP s/o amar nath',	'NULL',	'M',	'JAJWAN JIND\n near chopal',	'JIND SADAR',	'caller ne kaha ki unka bhai jhagda kar rha hai',	'',	'Pending',	'Y',	'2024-08-13 11:45:44',	'2024-08-10 23:58:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `co_qa_data` (`id`, `signal_id`, `sco_qa_time`, `sop_score`, `active_listening_score`, `relevent_detail_score`, `address_tagging_score`, `call_handled_time_score`, `sco_employee_code`, `sco_remarks`, `is_active`, `created_at`, `updated_at`) VALUES
(49,	37610722,	'12323312',	1,	2,	3,	2,	1,	'ABC1',	'test data',	'Y',	'2024-08-13 10:11:31',	'2024-08-13 10:11:31'),
(50,	37610725,	'12323312',	1,	2,	3,	2,	1,	'ABC1',	'test data',	'Y',	'2024-08-13 10:55:44',	'2024-08-13 10:55:44'),
(51,	37610694,	'12323312',	1,	3,	2,	2,	3,	'ABC2',	'gf',	'Y',	'2024-08-13 10:55:52',	'2024-08-13 10:55:52'),
(52,	37610694,	'12323312',	1,	3,	1,	2,	1,	'ABC2',	'ghnmghjmn',	'Y',	'2024-08-13 10:56:23',	'2024-08-13 10:56:23'),
(53,	37610687,	'12323312',	1,	2,	1,	2,	1,	'rohit',	'Testing',	'Y',	'2024-08-14 08:08:45',	'2024-08-14 08:08:45'),
(54,	37610682,	'12323312',	1,	2,	2,	3,	3,	'rohit',	'test data',	'Y',	'2024-08-14 08:36:58',	'2024-08-14 08:36:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `master_signal_type` (`id`, `signal_type_id`, `signal_type`, `percentage_of_calls_qa`, `maximum_limit`, `is_active`, `created_at`, `updated_at`) VALUES
(1,	1,	'Actionable Calls',	'5',	'500',	'Y',	'2024-08-20 06:15:24',	'2024-08-20 06:10:02'),
(2,	2,	'Abusive Calls',	'2',	'100',	'Y',	'2024-08-20 06:15:34',	'2024-08-20 06:10:02'),
(3,	3,	'Missed Calls',	'2',	'100',	'Y',	'2024-08-20 06:15:44',	'2024-08-20 06:10:02'),
(4,	4,	'Non Voice Signal',	'2',	'100',	'Y',	'2024-08-20 06:15:53',	'2024-08-20 06:10:02'),
(5,	5,	'No Response calls',	'2',	'100',	'Y',	'2024-08-20 06:16:00',	'2024-08-20 06:10:02'),
(6,	6,	'Trip Monitoring calls',	'100',	'100',	'Y',	'2024-08-20 06:16:10',	'2024-08-20 06:10:02'),
(7,	7,	'Feedback calls',	'1',	'100',	'Y',	'2024-08-20 06:16:21',	'2024-08-20 06:10:02');

DROP TABLE IF EXISTS `signal_type_all`;
CREATE TABLE `signal_type_all` (
  `id` int NOT NULL AUTO_INCREMENT,
  `signal_type_id` int DEFAULT NULL,
  `signal_type` text,
  `is_active` varchar(2) DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `signal_type_all` (`id`, `signal_type_id`, `signal_type`, `is_active`, `created_at`, `updated_at`) VALUES
(1,	0,	'UNANSWERED CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(2,	1,	'MISSED CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(3,	2,	'REJECTED CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(4,	3,	'PENDING SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(5,	4,	'PENDING ACTION SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(6,	5,	'ACTION SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(7,	6,	'REVIEWED MISSED CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(8,	7,	'REPLY FOR ADDL INFO',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(9,	8,	'INSUFFICIENT INFO',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(10,	9,	'ENQUIRY SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(11,	10,	'INFORMATION SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(12,	11,	'PRANK SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(13,	12,	'ABUSIVE SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(14,	13,	'IRRELEVANT SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(15,	14,	'FORWARDED SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(16,	15,	'OUTBOUND SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(17,	16,	'OUTBOUND SIGNAL COMPLETE',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(18,	17,	'REVIEWED UNANSWERED CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(19,	18,	'REVIEWED REJECTED CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(20,	19,	'NUISANCE CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(21,	20,	'WRONG CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(22,	21,	'NO RESPONSE CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(23,	22,	'SILENT CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(24,	23,	'APPRECIATION OF SERVICE CALL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(25,	24,	'SERVICE PROVIDED',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(26,	25,	'REPEATED SIGNAL',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06'),
(27,	26,	'SAFE JOURNEY REQUEST',	'Y',	'2024-08-21 07:10:06',	'2024-08-21 07:10:06');

-- 2024-08-21 11:45:16

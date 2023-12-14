CREATE EXTERNAL TABLE IF NOT EXISTS `stedi2`.`customer_landing1` (
  `customerName` string,
  `email` varchar(5000),
  `phone` bigint,
  `birthDay` varchar(5000),
  `serialNumber` varchar(5000),
  `registrationDate` bigint,
  `lastUpdateDate` bigint,
  `shareWithFriendsAsOfDate` bigint
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'ignore.malformed.json' = 'FALSE',
  'dots.in.keys' = 'FALSE',
  'case.insensitive' = 'TRUE',
  'mapping' = 'TRUE'
)
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://stedi-lake-house/customer/landing1/'
TBLPROPERTIES ('classification' = 'json');
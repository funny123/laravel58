CREATE TABLE `indexs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键索引',
  `unique_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '唯一索引',
  `normal_index` int(11) NOT NULL DEFAULT '0' COMMENT '普通索引',
  `union_index_a` int(11) NOT NULL DEFAULT '0' COMMENT '联合索引a',
  `union_index_b` int(11) NOT NULL DEFAULT '0' COMMENT '联合索引b',
  `union_index_c` int(11) NOT NULL DEFAULT '0' COMMENT '联合索引c',
  `prefix_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '前缀索引',
  `fulltext_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '全文索引',
  `geo_index` geometry NOT NULL COMMENT '空间索引',
--   `func_index` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '函数索引',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`unique_index`),
  KEY `normal_index` (`normal_index`),
  KEY `prefix_index` (`prefix_index`(10)),
  SPATIAL KEY `geo_index` (`geo_index`),
  KEY `union_index_abc_desc` (`union_index_a`,`union_index_b`,`union_index_c` DESC),
--   KEY `func_index` ((month(`func_index`))),
  FULLTEXT KEY `fulltext_index` (`fulltext_index`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- // 批量插入1000万数据
SET GLOBAL log_bin_trust_function_creators = 1;
SET autocommit = 1;

DELIMITER $$
DROP FUNCTION IF EXISTS `rand_string` $$
CREATE FUNCTION `rand_string` (n INT) RETURNS VARCHAR(255) CHARSET 'utf8'
BEGIN 
    DECLARE char_str varchar(100) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    DECLARE return_str varchar(255) DEFAULT '';
    DECLARE i INT DEFAULT 0;
    WHILE i < n DO
        SET return_str = concat(return_str, substring(char_str, FLOOR(1 + RAND()*62), 1));
        SET i = i + 1;
    END WHILE;
    RETURN return_str;
END $$
CREATE FUNCTION `rand_num` () RETURNS INT(11)
BEGIN 
    DECLARE i INT DEFAULT 0;
    SET i = FLOOR(RAND() * 10000000);
    RETURN i;
END $$
DROP FUNCTION IF EXISTS `batch_insert` $$
CREATE FUNCTION `batch_insert` (n INT) RETURNS VARCHAR(255) CHARSET 'utf8'
BEGIN  
    DECLARE i INT DEFAULT 0;
    WHILE i < n DO
	insert into indexs (unique_index, normal_index, union_index_a, union_index_b, union_index_c, prefix_index, fulltext_index, geo_index) value(uuid(), rand_num(), rand_num(), rand_num(), rand_num(), rand_string(100), rand_string(200), ST_GeometryFromText('POINT(39.8885917679 116.6576038966)'));
        SET i = i + 1;
    END WHILE;
    RETURN 'SUCCESS';
END $$
DELIMITER ;

select batch_insert(10000000);

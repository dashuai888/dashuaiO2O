################
# author: dashuai
#################

CREATE TABLE IF NOT EXISTS `area_tbl`(
    `area_id` INT(10) NOT NULL AUTO_INCREMENT,
    `area_name` VARCHAR(32) NOT NULL,
    `priority` INT(2) NOT NULL DEFAULT 0 COMMENT '排序权重，越大越前',
    `create_time` DATETIME DEFAULT NULL,
    `update_time` DATETIME DEFAULT NULL,
    PRIMARY KEY(`area_id`),
    UNIQUE KEY `uk_area_name` (`area_name`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS `person_info_tbl`(
    `user_id`  INT(10) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `profile_img` VARCHAR(1024)  DEFAULT NULL,
    `email` VARCHAR(100) DEFAULT NULL,
    `gender` VARCHAR(2) DEFAULT NULL,
    `enable_status` INT(2) NOT NULL DEFAULT 0 COMMENT '0 封禁，1 允许',
    `user_type`  INT(2) NOT NULL DEFAULT 1 COMMENT '1 顾客， 2 商家， 3 管理员',
    `create_time` DATETIME DEFAULT NULL,
    `update_time` DATETIME DEFAULT NULL,
    PRIMARY KEY(`user_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS `wechat_auth_tbl`(
    `wechat_auth_id`  INT(10) NOT NULL AUTO_INCREMENT,
    `user_id` INT (10) NOT NULL,
    `open_id` VARCHAR(128)  DEFAULT NULL,
    `create_time` DATETIME DEFAULT NULL,
    PRIMARY KEY(`wechat_auth_id`),
    UNIQUE KEY `uk_wechat_openid`(`open_id`),
    CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY(`user_id`) REFERENCES `person_info_tbl`(`user_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS `local_auth_tbl`(
    `local_auth_id`  INT(10) NOT NULL AUTO_INCREMENT,
    `user_id` INT (10) NOT NULL,
    `username` VARCHAR(128) NOT NULL,
    `password` VARCHAR(128)  NOT NULL,
    `create_time` DATETIME DEFAULT NULL,
    `update_time` DATETIME DEFAULT NULL,
    PRIMARY KEY(`local_auth_id`),
    UNIQUE KEY `uk_local_username`(`username`),
    CONSTRAINT `fk_localauth_profile` FOREIGN KEY (`user_id`) REFERENCES `person_info_tbl`(`user_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS `head_line_tbl`(
    `line_id`  INT(10) NOT NULL AUTO_INCREMENT,
    `line_name` VARCHAR (1024) DEFAULT NULL,
    `line_link` VARCHAR(2048) NOT NULL,
    `line_img` VARCHAR(2048)  NOT NULL,
    `priority` INT(1)  DEFAULT NULL,
    `enable_status` INT(1)  NOT NULL DEFAULT 0 COMMENT '0 可用，1 不可用',
    `create_time` DATETIME DEFAULT NULL,
    `update_time` DATETIME DEFAULT NULL,
    PRIMARY KEY(`line_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS `shop_category_tbl`(
    `shop_category_id`  INT(10) NOT NULL AUTO_INCREMENT,
    `shop_category_name` VARCHAR (100) NOT NULL DEFAULT '',
    `shop_category_desc` VARCHAR(1024) DEFAULT '',
    `shop_category_img` VARCHAR(2048)  DEFAULT NULL,
    `priority` INT(1) NOT NULL DEFAULT 0,
    `parent_id` INT(10) DEFAULT NULL,
    `create_time` DATETIME DEFAULT NULL,
    `update_time` DATETIME DEFAULT NULL,
    PRIMARY KEY(`shop_category_id`),
    CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `shop_category_tbl`(`shop_category_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS `shop_tbl`(
    `shop_id` INT(10) NOT NULL AUTO_INCREMENT,
    `shop_name` VARCHAR(100) NOT NULL,
    `shop_desc` VARCHAR(1024) DEFAULT NULL,
    `shop_addr` VARCHAR(200) DEFAULT NULL,
    `phone` VARCHAR(32) DEFAULT NULL,
    `shop_img` VARCHAR(1024) DEFAULT NULL,
    `priority` INT(1) DEFAULT '0',
    `enable_status` INT(1) NOT NULL DEFAULT '0' COMMENT '-1 不可用，0 审核中，1 可用',
    `advice` VARCHAR(256) DEFAULT NULL,
    `owner_id` INT(10) NOT NULL,
    `area_id` INT(10) DEFAULT NULL,
    `shop_category_id` INT(10) DEFAULT NULL,
    `create_time` DATETIME DEFAULT NULL,
    `update_time` DATETIME DEFAULT NULL,
    PRIMARY KEY(`shop_id`),
    KEY `key_shop_areaid` (`area_id`),
    KEY `key_shop_ownerid` (`owner_id`),
    KEY `key_shop_shopcategory` (`shop_category_id`),
    CONSTRAINT `fk_shop_areaid` FOREIGN KEY (`area_id`) REFERENCES `area_tbl` (`area_id`),
    CONSTRAINT `fk_shop_ownerid` FOREIGN KEY (`owner_id`) REFERENCES `person_info_tbl` (`user_id`),
    CONSTRAINT `fk_shop_shopcategory` FOREIGN KEY (`shop_category_id`) REFERENCES `shop_category_tbl` (`shop_category_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS `product_tbl`(
    `product_id` INT(10) NOT NULL AUTO_INCREMENT,
    `product_name` VARCHAR(100) NOT NULL,
    `product_desc` VARCHAR(1024) DEFAULT NULL,
    `img_addr` VARCHAR(1024) DEFAULT '',
    `normal_price` VARCHAR(10) DEFAULT NULL,
    `promotion_price` VARCHAR(10) DEFAULT NULL,
    `priority` INT(1) NOT NULL DEFAULT 0,
    `enable_status` INT(1) NOT NULL DEFAULT 0,
    `product_category_id` INT(10) DEFAULT NULL,
    `shop_id` INT(10) NOT NULL DEFAULT 0,
    `create_time` DATETIME DEFAULT NULL,
    `update_time` DATETIME DEFAULT NULL,
    PRIMARY KEY (`product_id`),
    KEY `key_product_productcategoryid` (`product_category_id`),
    KEY `key_product_shopid` (`shop_id`),
    CONSTRAINT `fk_product_productcategoryid` FOREIGN KEY (`product_category_id`) REFERENCES `product_category_tbl` (`product_category_id`),
    CONSTRAINT `fk_product_shopid` FOREIGN KEY (`shop_id`) REFERENCES `shop_tbl` (`shop_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS `product_img_tbl`(
    `product_img_id` INT(10) NOT NULL AUTO_INCREMENT,
    `product_id` INT(10) DEFAULT NULL,
    `img_addr` VARCHAR(1024) NOT NULL,
    `img_desc` VARCHAR(1024) DEFAULT NULL,
    `priority` INT(1) DEFAULT 0,
    `create_time` DATETIME DEFAULT NULL,
    PRIMARY KEY (`product_img_id`),
    KEY `key_productimg_productid` (`product_id`),
    CONSTRAINT `fk_productimg_productid` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`product_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS `product_category_tbl`(
    `product_category_id` INT(10) NOT NULL AUTO_INCREMENT,
    `product_category_name` VARCHAR(100) NOT NULL,
    `priority` INT(1) DEFAULT 0,
    `shop_id` INT(10) NOT NULL DEFAULT 0,
    `create_time` DATETIME DEFAULT NULL,
    PRIMARY KEY (`product_category_id`),
    KEY `key_productcategory_shopid` (`shop_id`),
    CONSTRAINT `fk_productcategory_shopid` FOREIGN KEY (`shop_id`) REFERENCES `shop_tbl` (`shop_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
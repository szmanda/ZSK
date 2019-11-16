CREATE DATABASE Techspeak
  CHARACTER SET utf8
  COLLATE utf8_general_ci;

USE Techspeak;

CREATE TABLE userStatus (
  id_status INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  status_name VARCHAR(25) NULL,
  PRIMARY KEY (id_status)
)ENGINE=INNODB;

CREATE TABLE userRank (
  id_rank INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  rank_name VARCHAR(25) NULL,
  icon_path VARCHAR(100) NULL,
  PRIMARY KEY (id_rank)
)ENGINE=INNODB;

-- needs a table UserRank containing rank names
-- needs a table UserStatus containing statuses of the users (eg. active, deleted)
CREATE TABLE stdUser (
  id_user INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  login VARCHAR(25) NOT NULL UNIQUE,
  password VARCHAR(25) NOT NULL,
  email VARCHAR(100) NOT NULL,
  nick VARCHAR(25) NULL,
  points INT(10) UNSIGNED NULL DEFAULT 0,
  id_rank INT(10) UNSIGNED NULL,
  id_status INT(10) UNSIGNED NULL,
  PRIMARY KEY (id_user),
  FOREIGN KEY (id_rank) REFERENCES userRank(id_rank)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (id_status) REFERENCES userStatus(id_status)
  ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE=INNODB;

CREATE TABLE lang(
  id_lang INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  lang_name VARCHAR(25) NOT NULL,
  icon_path VARCHAR(100) NULL,
  description VARCHAR(250) NULL,
  PRIMARY KEY (id_lang)
)ENGINE=INNODB;

CREATE TABLE wordCategory(
  id_category INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  category_name VARCHAR(25) NOT NULL,
  PRIMARY KEY (id_category)
)ENGINE=INNODB;

-- needs a table lang and table wordCategory
CREATE TABLE word (
  id_word INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  word VARCHAR(50) NULL,
  definition VARCHAR(255) NULL,
  id_translation INT(10) UNSIGNED NULL,
  id_lang INT(10) UNSIGNED NULL,
  id_category INT(10) UNSIGNED NULL,
  PRIMARY KEY (id_word),
  FOREIGN KEY (id_lang) REFERENCES lang(id_lang)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (id_category) REFERENCES wordCategory(id_category)
  ON UPDATE CASCADE ON DELETE SET NULL
)ENGINE=INNODB;

CREATE INDEX Translation_idex ON word(id_translation);

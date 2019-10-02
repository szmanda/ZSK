CREATE DATABASE Techspeak;

USE Techspeak;

CREATE TABLE userStatus (
  id_status INT(10) UNSIGNED NOT NULL,
  status_name VARCHAR(25) NULL,
  PRIMARY KEY (id_status)
)ENGINE=INNODB;

CREATE TABLE userRank (
  id_rank INT(10) UNSIGNED NOT NULL,
  rank_name VARCHAR(25) NULL,
  icon_path VARCHAR(100) NULL,
  PRIMARY KEY (id_rank)
)ENGINE=INNODB;

-- needs a table UserRank containing rank names
-- needs a table UserStatus containing statuses of the users (eg. active, deleted)
CREATE TABLE stdUser (
  id_user INT(10) UNSIGNED NOT NULL,
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


--needs a table lang and table wordCategory
CREATE TABLE word (
  id_word INT(10) UNSIGNED NOT NULL,
  word VARCHAR(50) NULL,
  definition VARCHAR(255) NULL,
  id_translation INT(10) UNSIGNED NULL,
  id_lang INT(10) UNSIGNED NULL,
  id_category INT(10) UNSIGNED NULL,
  PRIMARY KEY (id_word)
)ENGINE=INNODB;

CREATE DATABASE Techspeak;

USE Techspeak;


-- needs a table UserRank containing rank names
-- needs a table UserStatus containing statuses of the users (eg. active, deleted)
CREATE TABLE stdUser (
  id_user INT(10) UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
  login VARCHAR(25) NOT NULL UNIQUE,
  password VARCHAR(25) NOT NULL,
  email VARCHAR(100) NOT NULL,
  nick VARCHAR(25) NULL,
  points INT(10) UNSIGNED NULL DEFAULT 0,
  id_rank INT(10) UNSIGNED NULL,
  id_status INT(10) UNSIGNED NULL,
  PRIMARY KEY (id_user)
)

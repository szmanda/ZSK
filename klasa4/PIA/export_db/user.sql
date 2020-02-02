CREATE USER `user`@`localhost` IDENTIFIED BY `zaq1@WSX`;
GRANT SELECT ON `komis`.`user` TO `user`@`localhost`;
FLUSH PRIVILEGES;

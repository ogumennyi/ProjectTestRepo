CREATE TABLE  employee (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `username` (`username`)
);
CREATE TABLE  roles (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `role` (`role`)
);
DROP TABLE IF EXISTS `moysport`.`employee_roles`;
CREATE TABLE  `moysport`.`employee_roles` (
  `employee_Id` bigint(20) NOT NULL,
  `roles_Id` bigint(20) NOT NULL,
  PRIMARY KEY (`employee_Id`,`roles_Id`),
  KEY `fk_r_id` (`roles_Id`),
  KEY `fk_e_id` (`employee_Id`),
  CONSTRAINT `fk_e_id` FOREIGN KEY (`employee_Id`) REFERENCES `employee` (`Id`),
  CONSTRAINT `fk_r_id` FOREIGN KEY (`roles_Id`) REFERENCES `roles` (`Id`)
);
insert into employee values (1,"hardik","hardik");
insert into employee values (2,"vihan","vihan");

insert into roles values(1,"ROLE_USER");
insert into roles values(2,"ROLE_ADMIN");

insert into employee_roles values (1,1);
insert into employee_roles values (1,2);
insert into employee_roles values (2,1);
commit;



DROP DATABASE IF EXISTS web;
CREATE DATABASE web
CHARACTER SET utf8
DEFAULT CHARACTER SET utf8
COLLATE utf8_general_ci
DEFAULT COLLATE utf8_general_ci;
use web;
CREATE TABLE profesores (id int(11) NOT NULL auto_increment,nombre char(50) default NULL,apellidos char(75) default NULL,telefono char(15) default NULL,mail char(100) default NULL,piso int(2) default NULL,despacho char(10) default NULL, vinculo_tutorias char(150) default 'tutorias.php',vinculo_investigacion char(150) default NULL,sexo char(1) default NULL,nombre_investigacion char(50) default NULL,vinculo_curriculum char(150) default NULL,PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES profesores WRITE;
INSERT INTO profesores VALUES (1,'Amaia','Agirregoitia Martínez','94.601.44.71','amaia.aguirregoitia@ehu.es',12,'13A4','tutorias.php',NULL,'M',NULL,'amaia'),(2,'Aitziber','Atutxa Salazar','94.601.44.67','jibatsaa@si.ehu.e',12,'13A7','tutorias.php','http://ixa.si.ehu.es/Ixa','M','IXA','aitziber'),(3,'Begoña','Ferrero Martín','94.601.43.23','jibfemab@si.ehu.es',12,'13A7','tutorias.php',NULL,'M',NULL,NULL),(4,'Jose','Gaintzarain Ibarmia','94.601.43.98','jose.gaintzarain@ehu.es',12,'13A9','tutorias.php',NULL,'H',NULL,'jose'),(5,'Koldo','Gojenola Galletebeitia','94.601.44.01','jipgogak@si.ehu.es',12,'13A8','tutorias.php','http://ixa.si.ehu.es/Ixa','H','IXA','koldo'),(6,'Kepa','Bengoetxea Kortazar','94.601.43.99','kepa.bengoetxea@ehu.es',12,'13A8','tutorias.php','http://ixa.si.ehu.es/Ixa','H','IXA','kepa'),(7,'Javier','López Cuadrado','94.601.44.68','javilo@ehu.es',12,'13A5','tutorias.php','http://www.sc.ehu.es/jiwlocuj/txuri/principal_txuri.htm','H','GHyM','javier'),(8,'Conchi','Presedo García','94.601.44.00','mapprgac@lg.ehu.es',12,'13A9','tutorias.php',NULL,'M',NULL,'conchi'),(9,'Mikel','Villamañe Gironés','94.601.44.89','mikel.v@ehu.es',12,'13A5','tutorias.php',NULL,'H',NULL,NULL),(10,'Begoña','Blanco','94.601.44.92','begona.blanco@ehu.es',12,'13A3','tutorias.php','http://det.bi.ehu.es/NQAS/','M','NQaS',NULL);
UNLOCK TABLES;
show databases;


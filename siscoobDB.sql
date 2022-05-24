-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for siscoob
DROP DATABASE IF EXISTS `siscoob`;
CREATE DATABASE IF NOT EXISTS `siscoob` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `siscoob`;

-- Dumping structure for table siscoob.candidates
DROP TABLE IF EXISTS `candidates`;
CREATE TABLE IF NOT EXISTS `candidates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) DEFAULT NULL,
  `last_name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.candidates: ~2 rows (approximately)
DELETE FROM `candidates`;
INSERT INTO `candidates` (`id`, `first_name`, `last_name`) VALUES
	(1, 'Alejandro', 'Toledo'),
	(2, 'Pedro Pablo', 'Kuczynski');

-- Dumping structure for table siscoob.candidate_skills
DROP TABLE IF EXISTS `candidate_skills`;
CREATE TABLE IF NOT EXISTS `candidate_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `skill_id` (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.candidate_skills: ~5 rows (approximately)
DELETE FROM `candidate_skills`;
INSERT INTO `candidate_skills` (`id`, `candidate_id`, `skill_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 2, 1),
	(5, 2, 2),
	(6, 2, 3);

-- Dumping structure for procedure siscoob.get_candidate_skill
DROP PROCEDURE IF EXISTS `get_candidate_skill`;
DELIMITER //
CREATE PROCEDURE `get_candidate_skill`(IN candidate_id INT)
BEGIN
	SELECT candidates.id, first_name,last_name, skills.name AS skill 
	FROM candidates
	INNER JOIN candidate_skills ON candidates.id = candidate_skills.candidate_id
	INNER JOIN skills ON skills.id = candidate_skills.skill_id
	WHERE candidates.id = candidate_id;
    END//
DELIMITER ;

-- Dumping structure for table siscoob.skills
DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.skills: ~3 rows (approximately)
DELETE FROM `skills`;
INSERT INTO `skills` (`id`, `name`) VALUES
	(1, 'corrupto'),
	(2, 'ladrón'),
	(3, 'vende patria');

-- Dumping structure for table siscoob.tblequipos
DROP TABLE IF EXISTS `tblequipos`;
CREATE TABLE IF NOT EXISTS `tblequipos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `codigo_patrimonio` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `orden_compra` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `serie_numero` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_bien` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `marca` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `idestado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Dumping data for table siscoob.tblequipos: ~10 rows (approximately)
DELETE FROM `tblequipos`;
INSERT INTO `tblequipos` (`id`, `codigo_patrimonio`, `orden_compra`, `serie_numero`, `nombre_bien`, `marca`, `idestado`) VALUES
	(1, 'NT', 'NT', 'CL6RC42', 'SERVIDOR', 'DELL', 4),
	(2, 'NT', 'NT', 'BH2RD42', 'SERVIDOR', 'DELL', 4),
	(3, '740892000336', '466-2010', 'DFXNJN1', 'SERVIDOR', 'DELL', 4),
	(4, '740892000351', '466-2010', '16GNJN1', 'SERVIDOR', 'DELL', 4),
	(5, '740892000370', '504-2010', 'JKLNQN1', 'SERVIDOR', 'DELL', 2),
	(6, '740892000244', '466-2010', 'BFMGJN1', 'SERVIDOR', 'DELL', 3),
	(7, '740892000311', '466-2010', 'CRMNJN1', 'SERVIDOR', 'DELL', 3),
	(15, '740892000271', '466-2010', '9GXNJN1', 'SERVIDOR', 'DELL', 2),
	(16, '740892000324', '466-2010', '8NTGJN1', 'SERVIDOR', 'DELL', 2),
	(17, '740892000262', '466-2010', '2HXNJN1', 'SERVIDOR', 'DELL', 2);

-- Dumping structure for table siscoob.tblequipos_old
DROP TABLE IF EXISTS `tblequipos_old`;
CREATE TABLE IF NOT EXISTS `tblequipos_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_patrimonio` varchar(15) NOT NULL,
  `orden_compra` varchar(25) CHARACTER SET utf8 NOT NULL,
  `serie_numero` varchar(30) CHARACTER SET utf8 NOT NULL,
  `nombre_bien` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `marca` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idestado` int(11) DEFAULT 5,
  `fecha_registro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.tblequipos_old: ~12 rows (approximately)
DELETE FROM `tblequipos_old`;
INSERT INTO `tblequipos_old` (`id`, `codigo_patrimonio`, `orden_compra`, `serie_numero`, `nombre_bien`, `marca`, `idestado`, `fecha_registro`) VALUES
	(1, '', '', '', 'Printer', '', 5, 2021),
	(2, '', '', '', 'Laptop', '', 1, 2015),
	(3, '', '', '', 'Monitor', '', 1, 2000),
	(4, '', '', '', 'PC', '', 1, 2016),
	(5, '', '', '', 'Impresora', '', 4, 2019),
	(6, '', '', '', 'Escanner', '', 4, 2002),
	(7, '', '', '', 'Monitor', '', 4, 2004),
	(8, '', '', '', 'Laptop', '', 4, 2020),
	(9, '', '', '', 'Laptop', '', 3, 1996),
	(10, '', '', '', 'Servidor', '', 5, NULL),
	(11, 'E010', '455-2021', '897612', 'Laptop', 'Dell', 5, NULL),
	(12, 'E011', '466-2021', 'ABC987', 'Celular', 'Sony', 5, NULL);

-- Dumping structure for table siscoob.tblestado
DROP TABLE IF EXISTS `tblestado`;
CREATE TABLE IF NOT EXISTS `tblestado` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.tblestado: ~5 rows (approximately)
DELETE FROM `tblestado`;
INSERT INTO `tblestado` (`idestado`, `estado`) VALUES
	(1, 'Inoperativo mantenimiento correctivo'),
	(2, 'Inoperativo obsolescencia tecnica'),
	(3, 'Operativo obsolescencia tecnica'),
	(4, 'Operativo sin observaciones'),
	(5, 'Sin Revisar');

-- Dumping structure for table siscoob.tblfuncion
DROP TABLE IF EXISTS `tblfuncion`;
CREATE TABLE IF NOT EXISTS `tblfuncion` (
  `idfuncion` int(11) NOT NULL AUTO_INCREMENT,
  `funcion` varchar(25) NOT NULL,
  PRIMARY KEY (`idfuncion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.tblfuncion: ~2 rows (approximately)
DELETE FROM `tblfuncion`;
INSERT INTO `tblfuncion` (`idfuncion`, `funcion`) VALUES
	(1, 'EN USO'),
	(2, 'EN ALMACEN');

-- Dumping structure for table siscoob.tblinventario
DROP TABLE IF EXISTS `tblinventario`;
CREATE TABLE IF NOT EXISTS `tblinventario` (
  `idinventario` int(11) NOT NULL AUTO_INCREMENT,
  `patrimonio` varchar(25) DEFAULT NULL,
  `informatico` varchar(25) DEFAULT NULL,
  `periodo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idinventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.tblinventario: ~0 rows (approximately)
DELETE FROM `tblinventario`;

-- Dumping structure for table siscoob.tblpersona
DROP TABLE IF EXISTS `tblpersona`;
CREATE TABLE IF NOT EXISTS `tblpersona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `idrol` int(11) NOT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.tblpersona: ~2 rows (approximately)
DELETE FROM `tblpersona`;
INSERT INTO `tblpersona` (`idpersona`, `nombre`, `apellido`, `idrol`) VALUES
	(1, 'Julio', 'Cervera', 1),
	(2, 'Karen', 'Obregon', 2);

-- Dumping structure for table siscoob.tblrol
DROP TABLE IF EXISTS `tblrol`;
CREATE TABLE IF NOT EXISTS `tblrol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.tblrol: ~2 rows (approximately)
DELETE FROM `tblrol`;
INSERT INTO `tblrol` (`idrol`, `rol`) VALUES
	(1, 'admin'),
	(2, 'vendedor');

-- Dumping structure for table siscoob.tbluser
DROP TABLE IF EXISTS `tbluser`;
CREATE TABLE IF NOT EXISTS `tbluser` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `idpersona` int(11) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.tbluser: ~2 rows (approximately)
DELETE FROM `tbluser`;
INSERT INTO `tbluser` (`iduser`, `usuario`, `pass`, `idpersona`) VALUES
	(1, 'admin', 'admin', 1),
	(2, 'karito', 'karito', 2);

-- Dumping structure for table siscoob.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `last_session` datetime DEFAULT '1970-01-02 00:00:00',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.usuarios: ~2 rows (approximately)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`idusuario`, `username`, `password`, `tipo`, `last_session`, `fecha_creacion`) VALUES
	(1, 'soporte', '63F5A3F6CF9822AFB4B0E515D4AA0FF660498061561E8184C89F40D5540A651F', 1, '2022-05-07 10:56:24', '2022-05-07 10:56:24'),
	(2, 'admin', '008FEEC4C7FE315BFCE5470DBC72DA74C8FFE58B4100AA6D1EC7C952D5CECA8B', 2, '2022-05-07 10:56:15', '2022-05-07 10:56:15'),
	(7, 'csanchez', 'FFA2ECB6916CDD1603B280AE32F44AF33BEF462BF853A484D8554E3341D5D81B', 1, '2022-05-07 15:47:06', '2022-05-07 15:47:06');

-- Dumping structure for procedure siscoob.usuarios_get
DROP PROCEDURE IF EXISTS `usuarios_get`;
DELIMITER //
CREATE PROCEDURE `usuarios_get`()
BEGIN
SELECT * FROM usuarios;
END//
DELIMITER ;

-- Dumping structure for table siscoob.usuarios_info
DROP TABLE IF EXISTS `usuarios_info`;
CREATE TABLE IF NOT EXISTS `usuarios_info` (
  `idusuarios_info` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idusuarios_info`),
  KEY `usri_ibfk_1` (`idusuario`),
  CONSTRAINT `usri_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.usuarios_info: ~2 rows (approximately)
DELETE FROM `usuarios_info`;
INSERT INTO `usuarios_info` (`idusuarios_info`, `nombre`, `apellido`, `idusuario`) VALUES
	(1, 'Julio', 'Cervera', 1),
	(2, 'Administrador', 'Admin', 2);

-- Dumping structure for procedure siscoob.usuario_del
DROP PROCEDURE IF EXISTS `usuario_del`;
DELIMITER //
CREATE PROCEDURE `usuario_del`(
	IN `usuario_id` INT
)
BEGIN
delete from usuarios WHERE idusuario=usuario_id;
END//
DELIMITER ;

-- Dumping structure for procedure siscoob.usuario_get
DROP PROCEDURE IF EXISTS `usuario_get`;
DELIMITER //
CREATE PROCEDURE `usuario_get`(
	IN `usuario_id` INT
)
BEGIN
select * from usuarios WHERE idusuario=usuario_id;
END//
DELIMITER ;

-- Dumping structure for procedure siscoob.usuario_new
DROP PROCEDURE IF EXISTS `usuario_new`;
DELIMITER //
CREATE PROCEDURE `usuario_new`(
	IN `p1` INT,
	IN `p2` TEXT,
	IN `p3` TEXT,
	IN `p4` INT,
	IN `p5` TIMESTAMP,
	IN `p6` TIMESTAMP
)
BEGIN
INSERT INTO usuarios VALUES(p1,p2,p3,p4,p5,p6);
END//
DELIMITER ;

-- Dumping structure for procedure siscoob.usuario_upd
DROP PROCEDURE IF EXISTS `usuario_upd`;
DELIMITER //
CREATE PROCEDURE `usuario_upd`(
	IN `p1` TEXT,
	IN `p2` INT,
	IN `p3` TIMESTAMP,
	IN `p4` TIMESTAMP,
	IN `usuario_id` INT
)
BEGIN
UPDATE usuarios SET PASSWORD=p1,tipo=p2,last_session=p3,fecha_creacion=p4 WHERE idusuario=usuario_id;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

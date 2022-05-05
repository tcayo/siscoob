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
  `usuario` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
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
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `last_session` datetime DEFAULT '1970-01-02 00:00:00',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table siscoob.usuarios: ~2 rows (approximately)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`idusuario`, `username`, `password`, `tipo`, `last_session`, `fecha_creacion`) VALUES
	(1, 'soporte', 'soporte', 1, '2022-05-05 17:30:35', '2022-05-05 17:30:35'),
	(2, 'admin', 'admin', 2, '2021-10-11 21:56:25', '2021-07-21 18:48:08'),
	(4, 'tcayo', '123', 4, '2022-05-05 16:19:57', '2022-05-05 16:19:57');

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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

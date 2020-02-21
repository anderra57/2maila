-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2017 a las 07:16:54
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `enpresa`
--
CREATE DATABASE IF NOT EXISTS `enpresa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `enpresa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familiartekoa`
--

CREATE TABLE `familiartekoa` (
  `LGSZ` char(9) NOT NULL,
  `Fizena` varchar(20) NOT NULL,
  `Sexua` char(1) DEFAULT NULL,
  `JaiotzeData` date DEFAULT NULL,
  `Ahaidetasun` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `familiartekoa`
--

INSERT INTO `familiartekoa` (`LGSZ`, `Fizena`, `Sexua`, `JaiotzeData`, `Ahaidetasun`) VALUES
('123456789', 'Alaine', 'E', '1988-12-30', 'Alaba'),
('123456789', 'Eneritz', 'E', '1968-05-12', 'Emaztea'),
('123456789', 'Mikel', 'G', '1988-01-04', 'Semea'),
('333445555', 'Aiora', 'E', '1986-04-05', 'Alaba'),
('333445555', 'Leire', 'E', '1958-05-03', 'Emaztea'),
('333445555', 'Telmo', 'G', '1983-10-25', 'Semea'),
('987654321', 'Asier', 'G', '1942-02-28', 'Senarra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lanegitendu`
--

CREATE TABLE `lanegitendu` (
  `Pzenb` int(11) NOT NULL,
  `LGSZ` char(9) NOT NULL,
  `Orduak` decimal(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lanegitendu`
--

INSERT INTO `lanegitendu` (`Pzenb`, `LGSZ`, `Orduak`) VALUES
(1, '123456789', '32.5'),
(1, '453453453', '20.0'),
(2, '123456789', '7.5'),
(2, '333445555', '10.0'),
(2, '453453453', '20.0'),
(3, '333445555', '10.0'),
(3, '666884444', '40.0'),
(10, '333445555', '10.0'),
(10, '987987987', '35.0'),
(10, '999887777', '10.0'),
(20, '333445555', '10.0'),
(20, '888665555', '0.0'),
(20, '987654321', '15.0'),
(30, '987654321', '20.0'),
(30, '987987987', '5.0'),
(30, '999887777', '30.0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `langilea`
--

CREATE TABLE `langilea` (
  `GSZ` char(9) NOT NULL,
  `Izena` varchar(20) NOT NULL,
  `Abizena` varchar(20) NOT NULL,
  `JaiotzeData` date DEFAULT NULL,
  `Helbidea` varchar(30) DEFAULT NULL,
  `Sexua` char(1) DEFAULT NULL,
  `Soldata` decimal(10,2) DEFAULT NULL,
  `GainbeGSZ` char(9) DEFAULT NULL,
  `SZ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `langilea`
--

INSERT INTO `langilea` (`GSZ`, `Izena`, `Abizena`, `JaiotzeData`, `Helbidea`, `Sexua`, `Soldata`, `GainbeGSZ`, `SZ`) VALUES
('123456789', 'Julen', 'Perez', '1965-09-01', 'Errekalde 7, Barakaldo', 'G', '30000.00', '333445555', 5),
('333445555', 'Aitor', 'Campos', '1955-12-08', 'Ibaieta 9, Donostia', 'G', '40000.00', '888665555', 5),
('453453453', 'Ainara', 'Olaetxe', '1972-07-31', 'Antonegi 6, Tolosa', 'E', '25000.00', '333445555', 5),
('666884444', 'Fernando', 'Olaetxe', '1962-09-15', 'Portillo, 10, Tolosa', 'G', '38000.00', '333445555', 5),
('888665555', 'Eneko', 'Otxoa', '1937-11-10', 'Las Penas, 1, Donostia', 'G', '55000.00', NULL, 1),
('987654321', 'Jaione', 'Salaberria', '1941-06-20', 'Aranberri 89, Bilbo', 'E', '43000.00', '333445555', 3),
('987987987', 'Luis', 'Morera', '1969-03-29', 'Haritza 4, Irun', 'G', '25000.00', '987654321', 3),
('999887777', 'Alizia', 'Iriarte', '1968-05-12', 'Gran Via, 38, Bilbo', 'E', '25000.00', '987654321', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proiektua`
--

CREATE TABLE `proiektua` (
  `Pzenbakia` int(11) NOT NULL,
  `Pizena` varchar(15) NOT NULL,
  `Ptokia` varchar(15) DEFAULT NULL,
  `Szenbakia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proiektua`
--

INSERT INTO `proiektua` (`Pzenbakia`, `Pizena`, `Ptokia`, `Szenbakia`) VALUES
(1, 'Xproiektua', 'Bilbo', 5),
(2, 'Yproiektua', 'Gasteiz', 5),
(3, 'Zproiektua', 'Madril', 5),
(10, 'Konputazioa', 'Gijon', 3),
(20, 'Antolakuntza', 'Madril', 1),
(30, 'Komunikazioak', 'Gijon', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saila`
--

CREATE TABLE `saila` (
  `Sizena` varchar(15) NOT NULL,
  `Szenbakia` int(11) NOT NULL,
  `BuruGSZ` char(9) NOT NULL,
  `BuruHasData` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saila`
--

INSERT INTO `saila` (`Sizena`, `Szenbakia`, `BuruGSZ`, `BuruHasData`) VALUES
('Zentrala', 1, '888665555', '1981-06-19'),
('Administrazioa', 3, '987654321', '1995-01-01'),
('Ikerkuntza', 5, '333445555', '1988-05-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sailen_tokiak`
--

CREATE TABLE `sailen_tokiak` (
  `SailZbkia` int(11) NOT NULL,
  `Stokia` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sailen_tokiak`
--

INSERT INTO `sailen_tokiak` (`SailZbkia`, `Stokia`) VALUES
(1, 'Madril'),
(3, 'Gijon'),
(5, 'Bilbo'),
(5, 'Gasteiz'),
(5, 'Madril');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `familiartekoa`
--
ALTER TABLE `familiartekoa`
  ADD PRIMARY KEY (`LGSZ`,`Fizena`);

--
-- Indices de la tabla `lanegitendu`
--
ALTER TABLE `lanegitendu`
  ADD PRIMARY KEY (`Pzenb`,`LGSZ`),
  ADD KEY `LGSZ` (`LGSZ`);

--
-- Indices de la tabla `langilea`
--
ALTER TABLE `langilea`
  ADD PRIMARY KEY (`GSZ`),
  ADD KEY `GainbeGSZ` (`GainbeGSZ`),
  ADD KEY `SZ` (`SZ`);

--
-- Indices de la tabla `proiektua`
--
ALTER TABLE `proiektua`
  ADD PRIMARY KEY (`Pzenbakia`),
  ADD UNIQUE KEY `Pizena` (`Pizena`),
  ADD KEY `Szenbakia` (`Szenbakia`);

--
-- Indices de la tabla `saila`
--
ALTER TABLE `saila`
  ADD PRIMARY KEY (`Szenbakia`),
  ADD UNIQUE KEY `SIzena` (`Sizena`);

--
-- Indices de la tabla `sailen_tokiak`
--
ALTER TABLE `sailen_tokiak`
  ADD PRIMARY KEY (`SailZbkia`,`Stokia`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `familiartekoa`
--
ALTER TABLE `familiartekoa`
  ADD CONSTRAINT `familiartekoa_ibfk_1` FOREIGN KEY (`LGSZ`) REFERENCES `langilea` (`GSZ`);

--
-- Filtros para la tabla `lanegitendu`
--
ALTER TABLE `lanegitendu`
  ADD CONSTRAINT `lanegitendu_ibfk_1` FOREIGN KEY (`Pzenb`) REFERENCES `proiektua` (`Pzenbakia`),
  ADD CONSTRAINT `lanegitendu_ibfk_2` FOREIGN KEY (`LGSZ`) REFERENCES `langilea` (`GSZ`);

--
-- Filtros para la tabla `langilea`
--
ALTER TABLE `langilea`
  ADD CONSTRAINT `langilea_ibfk_1` FOREIGN KEY (`GainbeGSZ`) REFERENCES `langilea` (`GSZ`),
  ADD CONSTRAINT `langilea_ibfk_2` FOREIGN KEY (`SZ`) REFERENCES `saila` (`SZenbakia`);

--
-- Filtros para la tabla `proiektua`
--
ALTER TABLE `proiektua`
  ADD CONSTRAINT `proiektua_ibfk_1` FOREIGN KEY (`Szenbakia`) REFERENCES `saila` (`SZenbakia`);

--
-- Filtros para la tabla `sailen_tokiak`
--
ALTER TABLE `sailen_tokiak`
  ADD CONSTRAINT `sailen_tokiak_ibfk_1` FOREIGN KEY (`SailZbkia`) REFERENCES `saila` (`SZenbakia`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-03-2020 a las 00:19:46
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jokoa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jokalaria`
--

CREATE TABLE `jokalaria` (
  `NAN` varchar(9) NOT NULL,
  `IZENA` varchar(10) DEFAULT NULL,
  `ABIZENA` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jokalaria`
--

INSERT INTO `jokalaria` (`NAN`, `IZENA`, `ABIZENA`) VALUES
('12345678A', 'Ander', 'Guapo'),
('12345679A', 'Adei', 'Torre'),
('47261712Q', 'Jon', 'Barbero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

CREATE TABLE `partida` (
  `KODEA` int(11) NOT NULL,
  `EGUNA` date DEFAULT NULL,
  `IRAUPENA` int(11) DEFAULT NULL,
  `JOKALARIPUNTUAK` int(11) DEFAULT NULL,
  `ORDENAGAILUPUNTUAK` int(11) DEFAULT NULL,
  `JOKNAN` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `partida`
--

INSERT INTO `partida` (`KODEA`, `EGUNA`, `IRAUPENA`, `JOKALARIPUNTUAK`, `ORDENAGAILUPUNTUAK`, `JOKNAN`) VALUES
(1, '2020-02-17', 77, 150, -6, '12345679A'),
(1420508134, '2020-02-17', 5632, 190000, 0, '47261712Q');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `jokalaria`
--
ALTER TABLE `jokalaria`
  ADD PRIMARY KEY (`NAN`);

--
-- Indices de la tabla `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`KODEA`),
  ADD KEY `JOKNAN` (`JOKNAN`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `partida_ibfk_1` FOREIGN KEY (`JOKNAN`) REFERENCES `jokalaria` (`NAN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

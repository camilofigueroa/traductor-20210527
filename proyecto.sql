-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2021 a las 19:53:50
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `disponibilidad` (IN `fecha` DATETIME)  BEGIN 

SELECT * FROM prestamo_ambientes, ambientes WHERE fecha NOT between fecha_prestamo AND fecha_devolucion;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambientes`
--

CREATE TABLE `ambientes` (
  `no` int(20) NOT NULL,
  `cede` varchar(50) NOT NULL,
  `nom_aula` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ambientes`
--

INSERT INTO `ambientes` (`no`, `cede`, `nom_aula`) VALUES
(0, '', ''),
(55, 'modelo', 'aula5');

--
-- Disparadores `ambientes`
--
DELIMITER $$
CREATE TRIGGER `drop_ambientes` AFTER DELETE ON `ambientes` FOR EACH ROW INSERT INTO re_drop( id, descripcion, fecha_registro ) VALUES( null, 'Se borró un registro de ambientes', NOW() )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

CREATE TABLE `instructores` (
  `No_documento` int(15) NOT NULL,
  `nom_instructor` varchar(35) NOT NULL,
  `no` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `instructores`
--

INSERT INTO `instructores` (`No_documento`, `nom_instructor`, `no`) VALUES
(1007293903, 'diego', 0);

--
-- Disparadores `instructores`
--
DELIMITER $$
CREATE TRIGGER `DROP_instructores` AFTER DELETE ON `instructores` FOR EACH ROW INSERT INTO re_drop ( id, descripcion, fecha_registro ) VALUES( null, 'Se borró un registro de instructores', NOW() )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_ambientes`
--

CREATE TABLE `prestamo_ambientes` (
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hora_ingreso` time NOT NULL,
  `hora_salida` time NOT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `no` int(20) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `fecha_prestamo` datetime DEFAULT NULL,
  `fecha_devolucion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prestamo_ambientes`
--

INSERT INTO `prestamo_ambientes` (`fecha_registro`, `hora_ingreso`, `hora_salida`, `observaciones`, `no`, `id`, `fecha_prestamo`, `fecha_devolucion`) VALUES
('2021-05-13 15:44:54', '00:00:00', '00:00:00', NULL, NULL, NULL, NULL, '2021-05-18 00:00:00'),
('2021-05-13 16:02:28', '00:10:00', '00:00:00', NULL, NULL, NULL, NULL, '2021-05-18 00:00:00'),
('2021-05-13 16:04:03', '23:02:02', '00:10:21', NULL, 0, 1, '2021-05-11 00:00:00', NULL),
('2021-05-13 16:04:47', '10:21:20', '28:02:02', 'ewjfroi fjWHIivf', 0, 3, '2021-05-06 00:00:00', '2050-05-18 00:00:00'),
('2021-05-14 15:56:31', '510:10:10', '10:10:11', 'dsdsdc', NULL, NULL, '2021-05-11 00:00:00', '0000-00-00 00:00:00');

--
-- Disparadores `prestamo_ambientes`
--
DELIMITER $$
CREATE TRIGGER `eliminar` AFTER DELETE ON `prestamo_ambientes` FOR EACH ROW INSERT INTO re_drop ( id, descripcion, fecha_registro ) VALUES( null, 'Se borró un registro de prestamo', NOW() )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `ficha` int(15) NOT NULL,
  `nom_programa` varchar(50) NOT NULL,
  `No_documento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`ficha`, `nom_programa`, `No_documento`) VALUES
(1234, 'noe', NULL),
(12345, 'noe', 1007293903);

--
-- Disparadores `programas`
--
DELIMITER $$
CREATE TRIGGER `drop_programas` AFTER DELETE ON `programas` FOR EACH ROW INSERT INTO re_drop ( id, descripcion, fecha_registro ) VALUES( null, 'Se borró un registro de programas', NOW() )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `re_drop`
--

CREATE TABLE `re_drop` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `re_drop`
--

INSERT INTO `re_drop` (`id`, `descripcion`, `fecha_registro`) VALUES
(1, 'Se borró un registro de prestamo', '2021-05-06 08:27:21'),
(2, 'Se borró un registro de ambientes', '2021-05-06 08:29:13'),
(3, 'Se borró un registro de instructores', '2021-05-06 08:31:58'),
(4, 'Se borró un registro de programas', '2021-05-11 11:56:28'),
(5, 'Se borró un registro de programas', '2021-05-11 12:05:02'),
(6, 'Se borró un registro de ambientes', '2021-05-13 10:21:38'),
(7, 'Se borró un registro de ambientes', '2021-05-13 10:21:39'),
(8, 'Se borró un registro de ambientes', '2021-05-13 10:21:41'),
(9, 'Se borró un registro de ambientes', '2021-05-13 10:21:42'),
(10, 'Se borró un registro de ambientes', '2021-05-13 10:21:43'),
(11, 'Se borró un registro de ambientes', '2021-05-13 10:21:43'),
(12, 'Se borró un registro de ambientes', '2021-05-13 10:21:44'),
(13, 'Se borró un registro de ambientes', '2021-05-13 10:21:45'),
(14, 'Se borró un registro de ambientes', '2021-05-13 10:21:45'),
(15, 'Se borró un registro de ambientes', '2021-05-13 10:21:46'),
(16, 'Se borró un registro de ambientes', '2021-05-13 10:21:47'),
(17, 'Se borró un registro de ambientes', '2021-05-13 10:21:48'),
(18, 'Se borró un registro de ambientes', '2021-05-13 10:21:48'),
(19, 'Se borró un registro de ambientes', '2021-05-13 10:21:48'),
(20, 'Se borró un registro de ambientes', '2021-05-13 10:21:49'),
(21, 'Se borró un registro de ambientes', '2021-05-13 10:21:50'),
(22, 'Se borró un registro de ambientes', '2021-05-25 12:09:02'),
(23, 'Se borró un registro de ambientes', '2021-05-25 12:09:03'),
(24, 'Se borró un registro de ambientes', '2021-05-25 12:09:04'),
(25, 'Se borró un registro de ambientes', '2021-05-25 12:09:05'),
(26, 'Se borró un registro de ambientes', '2021-05-25 12:09:05'),
(27, 'Se borró un registro de ambientes', '2021-05-25 12:09:06'),
(28, 'Se borró un registro de ambientes', '2021-05-25 12:09:07'),
(29, 'Se borró un registro de ambientes', '2021-05-25 12:09:07'),
(30, 'Se borró un registro de ambientes', '2021-05-25 12:09:08'),
(31, 'Se borró un registro de ambientes', '2021-05-25 12:09:08'),
(32, 'Se borró un registro de ambientes', '2021-05-25 12:09:09'),
(33, 'Se borró un registro de ambientes', '2021-05-25 12:09:09'),
(34, 'Se borró un registro de ambientes', '2021-05-25 12:09:10'),
(35, 'Se borró un registro de ambientes', '2021-05-25 12:09:45'),
(36, 'Se borró un registro de ambientes', '2021-05-25 12:09:46'),
(37, 'Se borró un registro de ambientes', '2021-05-25 12:09:47'),
(38, 'Se borró un registro de ambientes', '2021-05-25 12:09:48'),
(39, 'Se borró un registro de ambientes', '2021-05-25 12:09:48'),
(40, 'Se borró un registro de ambientes', '2021-05-25 12:09:49'),
(41, 'Se borró un registro de ambientes', '2021-05-25 12:09:50'),
(42, 'Se borró un registro de ambientes', '2021-05-25 12:09:50'),
(43, 'Se borró un registro de ambientes', '2021-05-25 12:09:54'),
(44, 'Se borró un registro de ambientes', '2021-05-25 12:09:59'),
(45, 'Se borró un registro de ambientes', '2021-05-25 12:10:01'),
(46, 'Se borró un registro de ambientes', '2021-05-25 12:10:03'),
(47, 'Se borró un registro de ambientes', '2021-05-25 12:10:03'),
(48, 'Se borró un registro de ambientes', '2021-05-25 12:10:04'),
(49, 'Se borró un registro de ambientes', '2021-05-25 12:10:05'),
(50, 'Se borró un registro de ambientes', '2021-05-25 12:10:06'),
(51, 'Se borró un registro de ambientes', '2021-05-25 12:10:07'),
(52, 'Se borró un registro de ambientes', '2021-05-25 12:10:08'),
(53, 'Se borró un registro de ambientes', '2021-05-25 12:10:08'),
(54, 'Se borró un registro de ambientes', '2021-05-25 12:10:09'),
(55, 'Se borró un registro de ambientes', '2021-05-25 12:23:17'),
(56, 'Se borró un registro de ambientes', '2021-05-25 12:28:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `clave` varchar(10) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `fecha`, `clave`, `correo`, `nombre_usuario`) VALUES
(1, '2021-04-07 08:19:13', '12345', 'DAMH1006@GMAIL.COM', 'PEPE'),
(2, '2021-04-13 09:02:02', '213d d87gd', 'correo1@gmail.com', 'tre'),
(3, '2021-04-14 08:06:56', '123', 'uno12@gmail.com', 'uno'),
(4, '2021-04-14 08:06:56', '123', 'uno12@gmail.com', 'uno'),
(5, '2021-04-14 08:06:56', '123', 'uno12@gmail.com', 'uno');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  ADD PRIMARY KEY (`no`);

--
-- Indices de la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD PRIMARY KEY (`No_documento`),
  ADD KEY `no` (`no`);

--
-- Indices de la tabla `prestamo_ambientes`
--
ALTER TABLE `prestamo_ambientes`
  ADD PRIMARY KEY (`fecha_registro`),
  ADD KEY `no` (`no`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`ficha`),
  ADD KEY `No_documento` (`No_documento`);

--
-- Indices de la tabla `re_drop`
--
ALTER TABLE `re_drop`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  MODIFY `no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `re_drop`
--
ALTER TABLE `re_drop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD CONSTRAINT `instructores_ibfk_1` FOREIGN KEY (`no`) REFERENCES `ambientes` (`no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamo_ambientes`
--
ALTER TABLE `prestamo_ambientes`
  ADD CONSTRAINT `prestamo_ambientes_ibfk_1` FOREIGN KEY (`no`) REFERENCES `ambientes` (`no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prestamo_ambientes_ibfk_2` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `programas`
--
ALTER TABLE `programas`
  ADD CONSTRAINT `programas_ibfk_1` FOREIGN KEY (`No_documento`) REFERENCES `instructores` (`No_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

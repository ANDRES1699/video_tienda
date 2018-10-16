-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2018 a las 02:10:57
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `foparra`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id_alquiler` int(11) NOT NULL,
  `fecha_inicio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_fin` date DEFAULT NULL,
  `usuario_vendedor` int(11) NOT NULL,
  `estado_idestado` int(11) NOT NULL,
  `usuario_idcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`id_alquiler`, `fecha_inicio`, `fecha_fin`, `usuario_vendedor`, `estado_idestado`, `usuario_idcliente`) VALUES
(1, '2018-10-15 23:36:00', '2018-10-19', 1, 1, 3),
(2, '2018-10-15 23:37:14', '2018-10-19', 1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler_has_pelicula`
--

CREATE TABLE `alquiler_has_pelicula` (
  `alquiler_id_alquiler` int(11) NOT NULL,
  `pelicula_cod_pelicula` int(11) NOT NULL,
  `cantidad_entregadas` varchar(45) DEFAULT NULL,
  `cantidad_recibidas` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiler_has_pelicula`
--

INSERT INTO `alquiler_has_pelicula` (`alquiler_id_alquiler`, `pelicula_cod_pelicula`, `cantidad_entregadas`, `cantidad_recibidas`) VALUES
(2, 1, NULL, NULL),
(2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat`
--

CREATE TABLE `cat` (
  `idcat` int(11) NOT NULL,
  `nom_cat` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cat`
--

INSERT INTO `cat` (`idcat`, `nom_cat`) VALUES
(1, 'acción'),
(2, 'aventura'),
(3, 'ficción'),
(4, 'amor'),
(5, 'lujuria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL,
  `nombre_estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `nombre_estado`) VALUES
(1, 'activo'),
(2, 'inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `cod_pelicula` int(11) NOT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `actorPrincipal` varchar(45) DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `estado_idestado` int(11) NOT NULL,
  `cat_idcat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`cod_pelicula`, `imagen`, `nombre`, `actorPrincipal`, `duracion`, `precio`, `cantidad`, `estado_idestado`, `cat_idcat`) VALUES
(1, 'peli1.jpg', 'Viejo Oeste', 'Monica Montes', '2 horas', '7000', '10', 1, 2),
(2, 'peli2.jpg', 'Una Ilusión', 'Lucas Garzon', '90 minutos', '9000', '20', 1, 2),
(3, 'peli3.jpg', 'La Vida Sublime', 'Catalina Santana', '3 horas', '15000', '30', 1, 4),
(4, 'peli4.jpg', 'La Chispa', 'Sofia Garcia', '125 minutos', '10000', '9', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `nombre_rol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombre_rol`) VALUES
(1, 'cliente'),
(2, 'vendedor'),
(3, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `idtipo_documento` int(11) NOT NULL,
  `nombre_tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`idtipo_documento`, `nombre_tipo`) VALUES
(1, 'cédula'),
(2, 'tarjeta_identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `contrasenia` varchar(45) DEFAULT NULL,
  `_token` varchar(100) DEFAULT NULL,
  `rol_idrol` int(11) NOT NULL,
  `tipo_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `dni`, `fecha_nacimiento`, `nombre`, `apellido`, `direccion`, `telefono`, `correo`, `contrasenia`, `_token`, `rol_idrol`, `tipo_documento`) VALUES
(1, '1023', '1999-10-11', 'Juan', 'Garzon', 'CLL 49', '5678060', 'Juan@email.com', '202cb962ac59075b964b07152d234b70', '735b90b4568125ed6c3f678819b6e058', 2, 1),
(2, '1503', '1999-10-11', 'Camila', 'Colsin', 'CLL 40', '1567965', 'camila@email.com', '81dc9bdb52d04dc20036dbd8313ed055', '3c59dc048e8850243be8079a5c74d079', 3, 1),
(3, '9999', '1992-01-12', 'Francisco', 'Nariño', 'Calle 23 #13', '3138783521', 'dnariño@email.com', NULL, NULL, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id_alquiler`,`estado_idestado`,`usuario_idcliente`),
  ADD KEY `fk_alquiler_usuario1_idx` (`usuario_vendedor`),
  ADD KEY `fk_alquiler_estado1_idx` (`estado_idestado`),
  ADD KEY `fk_alquiler_usuario2_idx` (`usuario_idcliente`);

--
-- Indices de la tabla `alquiler_has_pelicula`
--
ALTER TABLE `alquiler_has_pelicula`
  ADD PRIMARY KEY (`alquiler_id_alquiler`,`pelicula_cod_pelicula`),
  ADD KEY `fk_alquiler_has_pelicula_pelicula1_idx` (`pelicula_cod_pelicula`),
  ADD KEY `fk_alquiler_has_pelicula_alquiler1_idx` (`alquiler_id_alquiler`);

--
-- Indices de la tabla `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`idcat`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`cod_pelicula`,`estado_idestado`,`cat_idcat`),
  ADD KEY `fk_pelicula_estado1_idx` (`estado_idestado`),
  ADD KEY `fk_pelicula_cat1_idx` (`cat_idcat`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`idtipo_documento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_usuario_rol_idx` (`rol_idrol`),
  ADD KEY `fk_usuario_tipo_documento1_idx` (`tipo_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id_alquiler` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cat`
--
ALTER TABLE `cat`
  MODIFY `idcat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `cod_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `idtipo_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `fk_alquiler_estado1` FOREIGN KEY (`estado_idestado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alquiler_usuario1` FOREIGN KEY (`usuario_vendedor`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alquiler_usuario2` FOREIGN KEY (`usuario_idcliente`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alquiler_has_pelicula`
--
ALTER TABLE `alquiler_has_pelicula`
  ADD CONSTRAINT `fk_alquiler_has_pelicula_alquiler1` FOREIGN KEY (`alquiler_id_alquiler`) REFERENCES `alquiler` (`id_alquiler`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alquiler_has_pelicula_pelicula1` FOREIGN KEY (`pelicula_cod_pelicula`) REFERENCES `pelicula` (`cod_pelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `fk_pelicula_cat1` FOREIGN KEY (`cat_idcat`) REFERENCES `cat` (`idcat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pelicula_estado1` FOREIGN KEY (`estado_idestado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_tipo_documento1` FOREIGN KEY (`tipo_documento`) REFERENCES `tipo_documento` (`idtipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2019 a las 21:12:41
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coreservicesbd`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUsuario` (IN `id` INT(11), IN `nom` VARCHAR(120), IN `email` VARCHAR(40), IN `dir` VARCHAR(40), IN `tel` VARCHAR(40), IN `clav` VARCHAR(40), IN `rol` INT)  UPDATE usuario SET nombreUsuario = nom , emailUsuario = email , direccionUsuario = dir , telefono= tel, claveUsuario= clav, idRol= rol WHERE idUsuario = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarUsuarioID` (IN `id` INT)  NO SQL
SELECT * FROM usuario WHERE idUsuario = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMesa` (IN `Mesa` INT(11))  UPDATE mesa set estadoMesa = 'deshabilitada', descripcionMesa = 'La mesa no esta disponible',capacidadMesa = capacidadMesa WHERE idMesa = Mesa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarMesa` (IN `idMesa` INT(4), IN `capacidadMesa` INT(11), IN `descripcionMesa` VARCHAR(60))  Insert into mesa (idMesa , capacidadMesa, estadoMesa, descripcionMesa) Values (idMesa , capacidadMesa, "vacia", descripcionMesa)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `OcupadaMesa` (IN `Mesa` INT(11))  UPDATE mesa set estadoMesa = 'ocupada', descripcionMesa = 'La mesa esta ocupada',capacidadMesa = capacidadMesa WHERE idMesa = Mesa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarProducto` (IN `idproducto` INT, IN `nombreProducto` VARCHAR(20), IN `precioProducto` DOUBLE, IN `tipoProducto` ENUM('Plato','Bebida','Adicional'), IN `estadoProducto` ENUM('Activo','Agotado'))  INSERT into producto (idProducto, nombreProducto, precioProducto, tipoProducto, estadoProducto)values(idproducto, nombreProducto, precioProducto, tipoProducto, estadoProducto)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarUsuario` (IN `identificacionUsu` INT, IN `nombreUsu` VARCHAR(120), IN `emailUsu` VARCHAR(40), IN `direccionUsu` VARCHAR(40), IN `telefonoUsu` VARCHAR(20), IN `claveUsu` VARCHAR(20), IN `rolId` ENUM('Administrador','Mesero','Cocinero','Recepcionista'))  INSERT into usuario (idUsuario, nombreUsuario, emailUsuario, direccionUsuario, telefono, claveUsuario, idRol )values(identificacionUsu, nombreUsu, emailUsu, direccionUsu, telefonoUsu, claveUsu, rolId)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarPedido` (`idPedido` INT(11), `idUsuario` INT(11), `idMesa` INT(11), `estadoPedido` ENUM('Espera','Preparando','Entregado'), `observacionPedido` VARCHAR(80))  UPDATE pedido SET estadoPedido = estadoPedido , observacionPedido = observacionPedido , idMesa = idMesa , idUsuario= idUsuario  WHERE idPedido =  idPedido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarProducto` (IN `idpro` INT(11), IN `nombre` VARCHAR(20), IN `precio` DOUBLE, IN `tipo` ENUM('Plato','Bebida','Adicional'), IN `estado` ENUM('Activo','Agotado'))  UPDATE producto SET nombreProducto = nombre , precioProducto = precio , tipoProducto = tipo , estadoProducto= estado WHERE idproducto = idpro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spCambiarEstado_Ocu` (`Mesa` INT)  UPDATE mesa set estadoMesa = 'ocupada' WHERE idMesa = Mesa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spCambiarEstado_Vac` (`Mesa` INT)  UPDATE mesa set estadoMesa = 'vacia' WHERE idMesa = Mesa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPCartas` (`Cartaid` INT)  select * from consultarcartas where idcarta = Cartaid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultaEdetalleP` (IN `Pedido` INT(11))  NO SQL
select * from detallepedido WHERE idPedido = Pedido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultaEpedido` (`pedido` INT)  SELECT * from pedido where idPedido = pedido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spEliminarProDet` (IN `id` INT, IN `idpro` INT)  NO SQL
DELETE FROM detallecarta WHERE idCarta = id && idProducto = idpro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spEliminarProductoDet` (IN `Producto` INT(11), IN `Pedido` INT)  NO SQL
delete from detallepedido WHERE idProducto = Producto and idPedido = Pedido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spEntregarPedido` (IN `pedido` INT)  UPDATE pedido SET estadoPedido = 'Entregado' WHERE idPedido = pedido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPestadoMesa_Reg` (IN `Mesa` INT(11))  UPDATE mesa set estadoMesa = 'ocupada' WHERE idMesa = Mesa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spFinalizarPedidos` (IN `pedido` INT)  BEGIN
UPDATE pedido SET estadoPedido = 'Finalizado' WHERE idPedido = pedido;
UPDATE mesa set estadoMesa = 'vacia' where idMesa = (SELECT idMesa from pedido where idPedido = pedido);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spGuardar` (IN `IDpedido` INT, IN `observacion` VARCHAR(250))  NO SQL
update pedido set observacionPedido = observacion where idPedido = IDpedido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spPrepararPedido` (`pedido` INT)  UPDATE pedido SET estadoPedido = 'Preparando' WHERE idPedido = pedido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spRegistrarCarta` (IN `id` VARCHAR(10), IN `dicarta` VARCHAR(11))  NO SQL
INSERT INTO carta (idCarta,diaCarta) VALUES (id,dicarta)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spRegistrarDetalleCarta` (IN `id` INT, IN `idPro` INT)  NO SQL
INSERT into detallecarta (idCarta, idProducto) VALUES (id,idPro)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spRegistrarDetalleP` (IN `Producto` INT(11), IN `Pedido` INT(11), IN `Cantidad` INT(250))  NO SQL
INSERT into detallepedido (idProducto,idPedido, Cantidad) VALUES (Producto, Pedido,Cantidad)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spRegistrarPedido` (IN `idPedido` INT(11), IN `idUsuario` INT(11), IN `idMesa` INT(11))  BEGIN
INSERT into pedido (idPedido, idUsuario, idMesa, estadoPedido) VALUES (idPedido, idUsuario, idMesa, "Espera");
call spCambiarEstado_Ocu(idMesa);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spSesion` (`email` VARCHAR(40))  SELECT * from usuario WHERE emailUsuario = email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spValidarUsuario` (IN `emailUsu` VARCHAR(40), IN `claveUsu` VARCHAR(20))  SELECT * FROM usuario
WHERE emailUsuario = emailUsu AND claveUsuario = claveUsu$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VaciaMesa` (IN `Mesa` INT(11))  UPDATE mesa set estadoMesa = 'vacia', descripcionMesa = 'La mesa esta vacia y disponible para usar',capacidadMesa = capacidadMesa WHERE idMesa = Mesa$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carta`
--

CREATE TABLE `carta` (
  `idCarta` int(11) NOT NULL,
  `diaCarta` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carta`
--

INSERT INTO `carta` (`idCarta`, `diaCarta`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Martes'),
(6, 'Sabado'),
(7, 'Domingo');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consultarcartas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `consultarcartas` (
`idProducto` int(11)
,`producto` varchar(20)
,`precio` double
,`tipo` enum('Plato','Bebida','Adicional')
,`idcarta` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecarta`
--

CREATE TABLE `detallecarta` (
  `idCarta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallecarta`
--

INSERT INTO `detallecarta` (`idCarta`, `idProducto`) VALUES
(2, 2),
(2, 23),
(2, 23),
(3, 2),
(3, 23),
(2, 1),
(3, 3242),
(4, 1),
(4, 3242),
(6, 2),
(6, 3242),
(7, 2),
(7, 4),
(1, 2),
(1, 23),
(1, 3242);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idProducto` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `cantidad` int(250) NOT NULL,
  `idDetallePedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`idProducto`, `idPedido`, `cantidad`, `idDetallePedido`) VALUES
(2, 1, 1, NULL),
(1, 1, 4, NULL),
(2, 1, 1, NULL),
(1, 1, 4, NULL),
(1, 2, 1, NULL),
(2, 2, 1, NULL),
(23, 2, 1, NULL),
(1, 3, 1, NULL),
(23, 3, 1, NULL),
(3242, 3, 1, NULL),
(-9, 3, 1, NULL),
(4, 3, 1, NULL),
(4, 3, 1, NULL),
(23, 3, 2, NULL),
(2, 4, 1, NULL),
(1, 4, 1, NULL),
(1, 4, 1, NULL),
(4, 4, 1, NULL),
(-9, 5, 1, NULL),
(1, 5, 1, NULL),
(1, 6, 1, NULL),
(2, 6, 1, NULL),
(4, 6, 1, NULL),
(-9, 7, 1, NULL),
(-9, 7, 1, NULL),
(1, 7, 1, NULL),
(2, 7, 1, NULL),
(4, 7, 1, NULL),
(2, 7, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `idMesa` int(4) NOT NULL,
  `capacidadMesa` int(2) NOT NULL,
  `estadoMesa` enum('ocupada','vacia') NOT NULL,
  `descripcionMesa` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`idMesa`, `capacidadMesa`, `estadoMesa`, `descripcionMesa`) VALUES
(1, 0, 'ocupada', 'La mesa esta ocupada'),
(2, 2, 'ocupada', 'capacidad de dos personas'),
(4, 4, 'vacia', 'vacia'),
(7, 2, '', 'La mesa no esta disponible'),
(8, 8, 'ocupada', 'vacia'),
(9, 1, 'ocupada', 'vacia'),
(10, 5, 'vacia', 'vacia'),
(21, 6, 'ocupada', 'La mesa esta vacia y disponible para usar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `estadoPedido` enum('Espera','Preparando','Entregado','Finalizado') NOT NULL,
  `idMesa` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Subtotal` int(11) NOT NULL,
  `observacionPedido` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `estadoPedido`, `idMesa`, `idUsuario`, `Subtotal`, `observacionPedido`) VALUES
(1, 'Finalizado', 1, 1000858534, 0, 'Sin Observacion'),
(2, 'Finalizado', 1, 12332, 0, 'Sin Observacion'),
(3, 'Entregado', 9, 12332, 0, 'Sin Observacion'),
(4, 'Entregado', 8, 12332, 0, 'Sin Observacion'),
(5, 'Preparando', 21, 12332, 0, 'Sin Observacion'),
(6, 'Entregado', 2, 12332, 0, 'Sin Observacion'),
(7, 'Finalizado', 4, 12332, 0, 'Sin Observacion');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pedidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pedidos` (
`IdDetalle` int(11)
,`IdProducto` int(11)
,`IdPedido` int(11)
,`Observacion` varchar(250)
,`producto` varchar(20)
,`Subtotal` double
,`Mesa` int(11)
,`Precio` double
,`Cantidad` int(250)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(20) NOT NULL,
  `precioProducto` double NOT NULL,
  `tipoProducto` enum('Plato','Bebida','Adicional') NOT NULL,
  `estadoProducto` enum('Activo','Agotado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `precioProducto`, `tipoProducto`, `estadoProducto`) VALUES
(-9, 'ensalada', -0, 'Plato', 'Agotado'),
(1, 'Pasta', 2322, 'Plato', 'Agotado'),
(2, 'Carne', 5000, 'Plato', 'Activo'),
(4, 'maracuya', 5000, 'Bebida', 'Activo'),
(23, 'pollo', -0, 'Bebida', 'Activo'),
(3242, 'Limonada', 5000, 'Bebida', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `nombreRol`) VALUES
(1, 'administrador'),
(2, 'cocinero'),
(3, 'mesero'),
(4, 'recepcionista');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `totalpedido`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `totalpedido` (
`Idpedido` int(11)
,`Total` double
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(120) NOT NULL,
  `emailUsuario` varchar(40) NOT NULL,
  `direccionUsuario` varchar(40) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `claveUsuario` varchar(20) NOT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombreUsuario`, `emailUsuario`, `direccionUsuario`, `telefono`, `claveUsuario`, `idRol`) VALUES
(1, 'julio', 'julio@gmail.com', 'calle 34', '3215478744', '123', 1),
(12332, 'Andres', 'andres@gmail.com', 'calle 32', '2234243', '123', 3),
(10000000, 'MARIO', 'mario@gmail.com', 'calle 34', '321', '123456', 1),
(10312901, 'Juan Jose ca', 'lemus090601@gmail.com', 'cll 31 c bis', '2342123', '345', 2),
(552364572, 'Julian Cortes', 'julianC@gmail.com', 'Direccion12', '172122', '123', 1),
(1000858534, 'Omar Andres Moreno Asprilla', 'oamoreno@gmail.com', 'calle 34', '123123123', '123', 2),
(1000987654, 'Julian Camargo', 'julian@gmail.com', 'Direccion', '123123123', '1231', 3),
(1222364572, 'Maria Luisa', 'Luisa@gmail.com', 'Direccion1', '1222122', '123', 3),
(1234567891, 'Juan Lemus', 'jdlemus@gmail.com', 'calle 34', '3124578475', '123', 4);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwmesa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwmesa` (
`mesa` int(4)
,`pedido` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `consultarcartas`
--
DROP TABLE IF EXISTS `consultarcartas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consultarcartas`  AS  select `producto`.`idProducto` AS `idProducto`,`producto`.`nombreProducto` AS `producto`,`producto`.`precioProducto` AS `precio`,`producto`.`tipoProducto` AS `tipo`,`detallecarta`.`idCarta` AS `idcarta` from ((`carta` join `detallecarta` on((`carta`.`idCarta` = `detallecarta`.`idCarta`))) join `producto` on((`detallecarta`.`idProducto` = `producto`.`idProducto`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pedidos`
--
DROP TABLE IF EXISTS `pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pedidos`  AS  select `detallepedido`.`idDetallePedido` AS `IdDetalle`,`detallepedido`.`idProducto` AS `IdProducto`,`detallepedido`.`idPedido` AS `IdPedido`,`pedido`.`observacionPedido` AS `Observacion`,`producto`.`nombreProducto` AS `producto`,(`producto`.`precioProducto` * `detallepedido`.`cantidad`) AS `Subtotal`,`pedido`.`idMesa` AS `Mesa`,`producto`.`precioProducto` AS `Precio`,`detallepedido`.`cantidad` AS `Cantidad` from ((`pedido` join `detallepedido` on((`pedido`.`idPedido` = `detallepedido`.`idPedido`))) join `producto` on((`detallepedido`.`idProducto` = `producto`.`idProducto`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `totalpedido`
--
DROP TABLE IF EXISTS `totalpedido`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `totalpedido`  AS  select `pedidos`.`IdPedido` AS `Idpedido`,sum(`pedidos`.`Subtotal`) AS `Total` from `pedidos` group by `pedidos`.`IdPedido` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwmesa`
--
DROP TABLE IF EXISTS `vwmesa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwmesa`  AS  select `m`.`idMesa` AS `mesa`,`p`.`idPedido` AS `pedido` from (`pedido` `p` join `mesa` `m` on((`p`.`idMesa` = `m`.`idMesa`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carta`
--
ALTER TABLE `carta`
  ADD PRIMARY KEY (`idCarta`);

--
-- Indices de la tabla `detallecarta`
--
ALTER TABLE `detallecarta`
  ADD KEY `idCarta` (`idCarta`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`idMesa`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idMesa` (`idMesa`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `emailUsuario` (`emailUsuario`),
  ADD UNIQUE KEY `emailUsuario_2` (`emailUsuario`),
  ADD KEY `idRol` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carta`
--
ALTER TABLE `carta`
  MODIFY `idCarta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallecarta`
--
ALTER TABLE `detallecarta`
  ADD CONSTRAINT `detallecarta_ibfk_1` FOREIGN KEY (`idCarta`) REFERENCES `carta` (`idCarta`),
  ADD CONSTRAINT `detallecarta_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`idMesa`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2019 a las 03:39:40
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.1.27

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUsuario` (IN `id` INT(11), IN `nom` VARCHAR(120), IN `email` VARCHAR(40), IN `dir` VARCHAR(40), IN `tel` VARCHAR(40), IN `clav` VARCHAR(40), IN `rol` INT)  UPDATE usuario SET nombreUsuario = nom , emailUsuario = email , direccionUsuario = dir , telefono= tel, claveUsuario= AES_ENCRYPT(clav, 'con'), idRol= rol WHERE idUsuario = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarUsuarioID` (IN `id` INT)  NO SQL
SELECT * FROM usuario WHERE idUsuario = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `desencriptar` (IN `email` VARCHAR(30))  NO SQL
SELECT `idUsuario`, `nombreUsuario`, `emailUsuario`, `direccionUsuario`, `telefono`, AES_DECRYPT (claveUsuario,'con'), `idRol` FROM `usuario` WHERE emailUsuario = email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMesa` (IN `Mesa` INT(11))  UPDATE mesa set estadoMesa = 'deshabilitada', descripcionMesa = 'La mesa no esta disponible',capacidadMesa = capacidadMesa WHERE idMesa = Mesa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarMesa` (IN `idMesa` INT(4), IN `capacidadMesa` INT(11), IN `descripcionMesa` VARCHAR(60))  Insert into mesa (idMesa , capacidadMesa, estadoMesa, descripcionMesa) Values (idMesa , capacidadMesa, "vacia", descripcionMesa)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `OcupadaMesa` (IN `Mesa` INT(11))  UPDATE mesa set estadoMesa = 'Sin Pedido', descripcionMesa = 'La mesa esta sin pedido',capacidadMesa = capacidadMesa WHERE idMesa = Mesa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RecuperarContraseña` (IN `emailUsu` VARCHAR(40), IN `claveUsu` VARCHAR(20))  NO SQL
UPDATE usuario SET  claveUsuario= AES_ENCRYPT(claveUsu, 'con') WHERE emailUsuario = emailUsu$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarProducto` (IN `idproducto` INT, IN `nombreProducto` VARCHAR(20), IN `precioProducto` DOUBLE, IN `tipoProducto` ENUM('Plato','Bebida','Adicional'), IN `estadoProducto` ENUM('Activo','Agotado'))  INSERT into producto (idProducto, nombreProducto, precioProducto, tipoProducto, estadoProducto)values(idproducto, nombreProducto, precioProducto, tipoProducto, estadoProducto)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarUsuario` (IN `identificacionUsu` INT, IN `nombreUsu` VARCHAR(120), IN `emailUsu` VARCHAR(40), IN `direccionUsu` VARCHAR(40), IN `telefonoUsu` VARCHAR(20), IN `claveUsu` VARCHAR(20), IN `rolId` ENUM('Administrador','Mesero','Cocinero','Recepcionista'))  INSERT into usuario (idUsuario, nombreUsuario, emailUsuario, direccionUsuario, telefono, claveUsuario, idRol )values(identificacionUsu, nombreUsu, emailUsu, direccionUsu, telefonoUsu,AES_ENCRYPT(claveUsu, 'con') , rolId)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarPedido` (`idPedido` INT(11), `idUsuario` INT(11), `idMesa` INT(11), `estadoPedido` ENUM('Espera','Preparando','Entregado'), `observacionPedido` VARCHAR(80))  UPDATE pedido SET estadoPedido = estadoPedido , observacionPedido = observacionPedido , idMesa = idMesa , idUsuario= idUsuario  WHERE idPedido =  idPedido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarProducto` (IN `idpro` INT(11), IN `nombre` VARCHAR(20), IN `precio` DOUBLE, IN `tipo` ENUM('Plato','Bebida','Adicional'), IN `estado` ENUM('Activo','Agotado'))  UPDATE producto SET nombreProducto = nombre , precioProducto = precio , tipoProducto = tipo , estadoProducto= estado WHERE idproducto = idpro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spCambiarEstado_Ocu` (`Mesa` INT)  UPDATE mesa set estadoMesa = 'ocupada' WHERE idMesa = Mesa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spCambiarEstado_Vac` (`Mesa` INT)  UPDATE mesa set estadoMesa = 'vacia' WHERE idMesa = Mesa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPCartas` (`Cartaid` INT)  select * from consultarcartas where idcarta = Cartaid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultaEdetalleP` (IN `Pedido` INT(11))  NO SQL
SELECT p.idProducto, p.nombreProducto, dp.idPedido, SUM(dp.cantidad), dp.idDetallePedido
from detallepedido dp INNER join producto p on dp.idProducto = p.idProducto
where dp.idPedido = Pedido
GROUP by p.nombreProducto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultaEpedido` (`pedido` INT)  SELECT * from pedido where idPedido = pedido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spDisminuirCantidad` (IN `Pedido` INT, IN `Producto` INT)  NO SQL
DELETE FROM detallepedido WHERE idProducto = Producto AND idPedido = Pedido LIMIT 1$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spGuardar` (IN `Numpedido` INT, IN `observacion` VARCHAR(250))  NO SQL
update pedido set observacionPedido = observacion where idPedido = Numpedido$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spValidarUsuario` (IN `emailUsu` VARCHAR(40), IN `claveUsu` VARCHAR(20))  SELECT idUsuario, nombreUsuario, emailUsuario, direccionUsuario,telefono,AES_DECRYPT(claveUsuario,'con'),idRol FROM usuario
WHERE emailUsuario = emailUsu AND AES_DECRYPT(claveUsuario,'con') = claveUsu$$

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
(1, 'Lunes');

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
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idProducto` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `cantidad` int(250) NOT NULL,
  `idDetallePedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`idProducto`, `idPedido`, `cantidad`, `idDetallePedido`) VALUES
(1, 1, 1, 2),
(1, 2, 15, 16),
(1, 3, 5, 19),
(4, 4, 1, 20),
(3, 4, 1, 21),
(2, 4, 1, 22),
(4, 5, 1, 23),
(3, 5, 1, 24),
(4, 5, 5, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `idMesa` int(4) NOT NULL,
  `capacidadMesa` int(2) NOT NULL,
  `estadoMesa` enum('ocupada','vacia','Sin Pedido') NOT NULL,
  `descripcionMesa` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`idMesa`, `capacidadMesa`, `estadoMesa`, `descripcionMesa`) VALUES
(1, 12, 'Sin Pedido', 'La mesa esta sin pedido'),
(2, 3, 'ocupada', 'La mesa esta sin pedido'),
(3, 4, 'ocupada', 'La mesa esta sin pedido'),
(4, 5, 'Sin Pedido', 'La mesa esta sin pedido');

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
(1, 'Espera', 1, 100098778, 0, 'Sin arroz'),
(2, 'Finalizado', 3, 100098778, 0, 'Sin ensalada y sin papa'),
(3, 'Finalizado', 4, 100098778, 0, 'Sin ensalada y sin papa'),
(4, 'Espera', 2, 100098778, 0, 'Sin ensalada '),
(5, 'Espera', 3, 100098778, 0, 'Sin ensalada y sin papa');

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
(1, 'Pollo', 20000, 'Plato', 'Activo'),
(2, 'Carne en Salsa', 5000, 'Plato', 'Activo'),
(3, 'Carne en guiso', 2500, 'Plato', 'Activo'),
(4, 'Gaseosa Manzana 2.5', 2500, 'Bebida', 'Activo'),
(5, 'Papas Fritas Porcion', 1000, 'Adicional', 'Activo');

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
(100098778, 'Julian Farmin', 'mesero@gmail.com', 'calle 32 # 43 A sur', '3224546758', '??µÿL{ƒˆ}«JzO', 3),
(100987756, 'Sara Martin', 'cocinero@gmail.com', 'calle 12 # 43 - 65', '3224545644', '??µÿL{ƒˆ}«JzO', 2),
(1000858513, 'Omar Moreno', 'administrador@mealvice.com', 'calle 34 # 45', '3209876654', '??µÿL{ƒˆ}«JzO', 1),
(1002756473, 'Carla Martinez', 'recepcionista@gmail.com', 'Kr 22 # 69 - 45', '3214554344', '??µÿL{ƒˆ}«JzO', 4);

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
  ADD PRIMARY KEY (`idCarta`),
  ADD UNIQUE KEY `diaCarta` (`diaCarta`);

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
  ADD UNIQUE KEY `idDetallePedido` (`idDetallePedido`),
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
  MODIFY `idCarta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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

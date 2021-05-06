-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2021 a las 16:24:03
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_sisventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `nombre`, `descripcion`, `estado`, `fecha_creacion`) VALUES
(1, 'Abarrotes', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(2, 'Desayunos y Dulces', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(3, 'Frutas y Verduras', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(4, 'Lacteos y Huevos', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(5, 'Quesos y Fiambres', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(6, 'Carnes, Pollos y Pescados', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(7, 'Cuidado Personal y Belleza', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(8, 'Limpieza', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(9, 'Cerveza, Vinos y Bebidas', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(10, 'Panaderia y Pasteleria', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(11, 'Congelados y Helados', 'Sin descripcion', 1, '2021-05-05 22:53:51'),
(12, 'Mascotas', 'Sin descripcion', 1, '2021-05-05 22:53:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `n_documento` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `razon_social` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `compra_id` int(11) NOT NULL,
  `documento_id` int(11) NOT NULL,
  `num_documento` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `total` decimal(20,2) NOT NULL,
  `impuesto` decimal(20,2) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `detalle_id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio_compra` decimal(20,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `detalle_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio_venta` decimal(20,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `n_documento` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `razon_social` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `localidad` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `impuesto` decimal(10,2) NOT NULL,
  `logo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `codigo_barras` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'CODIGO DE BARRAS O CODIGO SKU',
  `nombre` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  `subcategoria_id` int(11) NOT NULL,
  `unidad_id` int(11) NOT NULL,
  `precio_compra` decimal(20,2) NOT NULL,
  `precio_venta` decimal(20,2) NOT NULL,
  `lleva_impuesto` tinyint(4) DEFAULT 1 COMMENT '1 =  lleva impuesto , 0 = no lleva',
  `estado` tinyint(4) DEFAULT 1,
  `imagen` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `stock_min` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `proveedor_id` int(11) NOT NULL,
  `n_documento` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `razon_social` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `representante` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `subcategoria_id` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE `tipo_documentos` (
  `documento_id` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_de_medida`
--

CREATE TABLE `unidad_de_medida` (
  `unidad_id` int(11) NOT NULL,
  `codigo_abrev` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `n_documento` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `n_documento`, `nombre`, `apellidos`, `correo`, `clave`, `estado`, `fecha_creacion`) VALUES
(1, '45285767', 'Cristhian', 'Pasache Rivas', 'cristpasache@gmail.com', '$2y$10$L7GoPbUMPoo32UUgAutTdeaKOpgRB/oEGTAJvRFpj1tofG7x5TJnO', 1, '2021-05-03 20:50:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `venta_id` int(11) NOT NULL,
  `documento_id` int(11) NOT NULL,
  `num_documento` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `total` decimal(20,2) NOT NULL,
  `impuesto` decimal(20,2) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`compra_id`),
  ADD UNIQUE KEY `num_documento` (`num_documento`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `proveedor_id` (`proveedor_id`),
  ADD KEY `documento_id` (`documento_id`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `compra_id` (`compra_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `venta_id` (`venta_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `subcategoria_id` (`subcategoria_id`),
  ADD KEY `unidad_id` (`unidad_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`proveedor_id`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`subcategoria_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`documento_id`);

--
-- Indices de la tabla `unidad_de_medida`
--
ALTER TABLE `unidad_de_medida`
  ADD PRIMARY KEY (`unidad_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`venta_id`),
  ADD UNIQUE KEY `num_documento` (`num_documento`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `documento_id` (`documento_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `compra_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `proveedor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  MODIFY `subcategoria_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `documento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidad_de_medida`
--
ALTER TABLE `unidad_de_medida`
  MODIFY `unidad_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `venta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`documento_id`) REFERENCES `tipo_documentos` (`documento_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`compra_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`venta_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`subcategoria_id`) REFERENCES `subcategoria` (`subcategoria_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`unidad_id`) REFERENCES `unidad_de_medida` (`unidad_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `subcategoria_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`documento_id`) REFERENCES `tipo_documentos` (`documento_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

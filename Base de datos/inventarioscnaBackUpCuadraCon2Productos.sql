-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-08-2021 a las 19:44:10
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventarioscna`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `id_asistencia` int(10) NOT NULL,
  `unico` varchar(25) NOT NULL,
  `user_id` int(10) NOT NULL,
  `hora_entrada` time NOT NULL,
  `fecha_entrada` date NOT NULL,
  `hora_base` time NOT NULL,
  `hora_salida` time NOT NULL,
  `fecha_salida` date NOT NULL,
  `min_tardanza` time NOT NULL,
  `asistencia` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`id_asistencia`, `unico`, `user_id`, `hora_entrada`, `fecha_entrada`, `hora_base`, `hora_salida`, `fecha_salida`, `min_tardanza`, `asistencia`) VALUES
(1, '3-00:00:00-2021-05-20', 3, '12:52:25', '2021-05-20', '00:00:00', '00:00:00', '2021-05-20', '13:52:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `baja_sunat`
--

CREATE TABLE `baja_sunat` (
  `id_baja` int(10) NOT NULL,
  `id_doc1` int(10) NOT NULL,
  `numero` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `aceptado_baja` varchar(100) NOT NULL,
  `xml` varchar(30) NOT NULL,
  `ticket` varchar(20) NOT NULL,
  `has_cpe` varchar(100) NOT NULL,
  `cod_sunat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_caja` int(10) NOT NULL,
  `usuario_inicio` int(3) NOT NULL,
  `fec_reg` datetime NOT NULL,
  `fecha` date NOT NULL,
  `inicio` decimal(10,2) NOT NULL,
  `cierre` decimal(10,2) NOT NULL,
  `tienda` int(2) NOT NULL,
  `usuario_cierre` int(3) NOT NULL,
  `faltante` decimal(10,2) NOT NULL,
  `fecha_cierre` datetime NOT NULL,
  `entrada` decimal(10,2) NOT NULL,
  `salida` decimal(10,2) NOT NULL,
  `turno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambio`
--

CREATE TABLE `cambio` (
  `id_cambio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `venta` decimal(5,2) NOT NULL,
  `compra` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(10) UNSIGNED NOT NULL,
  `clave` varchar(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(10) NOT NULL,
  `nom_cat` varchar(50) CHARACTER SET utf8 NOT NULL,
  `des_cat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nom_cat`, `des_cat`) VALUES
(23, 'Grupo 300', 'categoria 1'),
(24, 'Grupo 200', 'Grupo 200 del consejo nacional de adopciones.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_online` int(12) NOT NULL,
  `cliente` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `telefono_cliente` char(30) NOT NULL,
  `email_cliente` varchar(64) NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `status_cliente` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `doc` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dni` varchar(14) NOT NULL,
  `vendedor` varchar(100) NOT NULL,
  `pais` text NOT NULL,
  `departamento` text NOT NULL,
  `provincia` text NOT NULL,
  `distrito` text NOT NULL,
  `cuenta` text NOT NULL,
  `tipo1` int(2) NOT NULL,
  `tienda` int(10) NOT NULL,
  `users` int(5) NOT NULL,
  `deuda` decimal(8,2) NOT NULL,
  `debe` decimal(8,2) NOT NULL,
  `documento` varchar(14) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `telefono_cliente`, `email_cliente`, `direccion_cliente`, `status_cliente`, `date_added`, `doc`, `dni`, `vendedor`, `pais`, `departamento`, `provincia`, `distrito`, `cuenta`, `tipo1`, `tienda`, `users`, `deuda`, `debe`, `documento`) VALUES
(1, 'CLIENTES VARIOS', '', 'undefined', '', 0, '0000-00-00 00:00:00', '0', '11111111', '', '', '', '', '', '', 0, 1, 0, '0.00', '0.00', '11111111'),
(2, 'Lucrecia Monterroso', '200', 'undefined', 'Unidad De RRHH', 1, '0000-00-00 00:00:00', '0', '1485789540901', '', 'Guatemala', 'Guatemala', 'Ciudad De Guatemala', '', '', 1, 1, 0, '0.00', '0.00', '14857890901'),
(284, 'Data Flex S.A.', '', '', 'AV. PASEO DE LA REPUBLICA NRO. 291 INT. 903 (PLAZA GRAU) LIMA - LIMA - LIMA', 1, '2020-12-19 00:41:47', '20549500553', '0', '', 'Peru', '', '', '', '', 2, 1, 0, '0.00', '0.00', '20549500553'),
(288, 'Hugo Marco Vasquez', '145', '1500', 'Unidad de Registro', 1, '2021-03-30 11:45:25', '2126145170901', '0', '', 'Peru', '', '', '', '', 1, 1, 0, '0.00', '0.00', '72943246'),
(290, 'Byron Castillo Casasola', '135', '12345', 'Unidad de Recursos Humanos', 1, '2021-03-30 14:20:18', '14514787885', '0', '', 'Peru', '', '', '', '', 1, 1, 0, '0.00', '0.00', '14514787885'),
(291, 'Omar Reyes', '140', '555', 'Servicios Generales y Trasporte', 1, '2021-03-30 15:48:59', '3131254717', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '3131254717'),
(292, 'Karin Benzema', '200', '241524', 'Unidad de registro ', 1, '2021-04-06 00:00:00', '', '', '', 'Guatemala', 'Guatemala', 'Guatemala', '', '', 2, 1, 0, '0.00', '0.00', ''),
(293, 'Dollar City', '55220909', 'dollar@gmail.com', 'zona 1 Cdad. Guatemala', 1, '0000-00-00 00:00:00', '', '', '', 'Guatemala', 'Guatemala', 'Guatemala', 'Guatemala', '', 2, 1, 0, '0.00', '0.00', ''),
(294, 'LIBRERIA E IMPRENTA VIVIAN , S.A.', '2415-0000', 'libreria@vivian.com', 'zona 1 Cdad. Guatemala', 1, '2021-04-20 08:56:17', '147', '0', '', 'Guatemala', 'Guatemala', 'Guatemala', 'Guatemala', '7845451212-7', 2, 1, 0, '0.00', '0.00', '147'),
(295, 'OFFIMARKET, S.A.', '21261418', 'empresa@offimarket.com', 'Empresa Guatemalteca', 1, '2021-04-21 15:20:34', '45', '0', '', 'Guatemala', 'Guatemala', 'Guatemala', 'Guatemala', '7845457788-8', 2, 1, 0, '0.00', '0.00', '45'),
(296, 'Hugo Marco Vasquez', '145', '1500', 'Unidad de Registro', 1, '2021-04-27 08:29:38', '72943246', '0', 'Juan Perez', 'Guatemala', 'Guatemala', 'Guatemala', '', '7}2454124755', 2, 1, 0, '0.00', '0.00', '72943246'),
(297, 'Justo Rufino Perez Lux', '', '', '', 1, '2021-04-27 09:44:00', '25631918', '0', '', 'Guatemala', '', '', '', '', 2, 1, 0, '0.00', '0.00', '25631918'),
(298, 'Amanda Debora', '100', '78954', 'Unidad financiera', 1, '2021-05-10 10:27:09', '2123878', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '2123878'),
(299, 'Pedro Perez', '200', '3914', 'UACHPOI', 1, '2021-05-13 15:11:22', '111111', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '111111'),
(300, 'Maria Gonzalez', '201', '3919', 'Unidad de atencion al niÃ±o ', 1, '2021-05-13 15:18:16', '22222', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '22222'),
(301, 'Maria Gonzalez', '205', '3918', 'Unidad de planificacion', 1, '2021-05-13 15:22:56', '0000', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '0000'),
(302, 'Maylin Vasquez', '203', '3922', 'Unidad de administraciÃ³n financiera', 1, '2021-05-13 15:29:46', '00000', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '00000'),
(303, 'Andres Lopez', '206', '3911', 'Unidad de asesorÃ­a Juridica', 1, '2021-05-13 15:38:48', '7777777', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '7777777'),
(304, 'Justo Rufino Perez Lux', '206', '3914', 'Unidad de planificacion', 1, '2021-05-13 15:47:16', '22222222', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '22222222'),
(305, 'Jorge Barrientos', '207', '3920', 'Unidad equipo multidiciplinario', 1, '2021-05-13 15:48:33', '88888888', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '88888888'),
(306, 'Juan Hernandez', '208', '3911', 'Unidad de asesoria juridica', 1, '2021-05-13 15:50:11', '666666666666666', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '66666666666666'),
(307, 'Erick Cardenas', '209', '3924', 'Direccion General', 1, '2021-05-13 15:51:39', '10', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '10'),
(308, 'Carlos Ruiz', '2010', '3915', 'UACHPOI', 1, '2021-05-13 15:56:03', '11', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '11'),
(309, 'amner mejia', '212', '3919', 'Unidad de atencion al niÃ±o', 1, '2021-05-13 15:58:43', '12', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '12'),
(310, 'Linely Roblero', '214', '3920', 'Equipo multidiciplinario', 1, '2021-05-13 15:59:58', '13', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '13'),
(311, 'Karla Mejia', '216', '3922', 'unidad financiera ', 1, '2021-05-13 16:09:27', '15', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '15'),
(312, 'andrea urrutia', '217', '3911', 'asesoria juridica', 1, '2021-05-13 18:33:43', '14', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '14'),
(313, 'Gladis Barrios', '219', '3918', 'Unidad de planificaciÃ³n ', 1, '2021-05-13 18:47:27', '16', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '16'),
(314, 'Stefanya Umaña', '219', '3921', 'subdireccion general ', 1, '2021-05-13 18:55:33', '17', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '17'),
(315, 'Grecia Lopez', '220', '3916', 'Unidad de atencion al niÃ±o y familia biologica', 1, '2021-05-13 19:26:06', '18', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '18'),
(316, 'Luis Ovalle', '222', '3914', 'UACHPOI', 1, '2021-05-13 20:18:11', '20', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '20'),
(317, 'Consuelo Porras', '205', '10', 'uan', 1, '2021-05-20 15:47:45', '', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', ''),
(318, 'Consuelo Porras', '205', '98', 'uan', 1, '2021-05-20 15:48:45', '', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', ''),
(319, 'Karin Benzema', '205', '10', 'unidad de planificacion', 1, '2021-05-20 15:47:45', '', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', ''),
(320, 'Juan Perez', '100', '200', 'Unidad financiera', 1, '2021-05-23 21:35:07', '151515', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '151515'),
(321, 'Amanda debora', '50', '200', 'unidad financiera', 1, '2021-05-24 13:34:46', '20202020', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '20202020'),
(322, 'Karen Abigail Santizo Ramirez ', '200', '10', 'Unidad de asesorÃ­a JurÃ­dica ', 1, '2021-05-24 13:47:02', '10101010', '72943246', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '10101010'),
(323, 'Feliciano Merlos Sanchez', '200', '100', 'Servicios Generales y Trasporte', 1, '2021-05-25 15:57:58', '1953353250206', '0', '', 'Guatemala', '', '', '', '74943444', 1, 1, 0, '0.00', '0.00', '1953353250206'),
(324, 'Omar Reyes', '140', '5', 'Unidad de administracion financiera', 1, '2021-05-27 09:16:28', '33225222', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '33225222'),
(325, 'Feliciano Merlos Sanchez', '200', '100', 'Servicios Generales y Trasporte', 1, '2021-05-27 12:50:17', '45665456', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '1953353250206'),
(326, 'Feliciano Merlos Sanchez', '200', '100', 'Servicios Generales y Trasporte', 1, '2021-05-27 12:56:26', ' 1953353250206', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', ' 1953353250206'),
(327, 'Keylor Navas ', '200', '0618', 'Unidad de administracion financiera', 1, '2021-05-28 08:23:43', '151520', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '151520'),
(328, 'Genesis Rodriguez Altan', '100', '0618', 'Unidad De Administracion Financiera ', 1, '2021-05-28 10:04:18', '74853246', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '74853246'),
(329, 'Libreria Maravilla S.A.', '22151478', 'algo@libreria.com', 'Libreria articulos varios', 1, '2021-06-03 12:52:53', '45789654', '0', 'Juan Henandez', 'Guatemala', 'Guatemala ', 'Guatemala', '', '547862365', 2, 1, 0, '0.00', '0.00', '45789654');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `comentario` text NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante_pago`
--

CREATE TABLE `comprobante_pago` (
  `id_comprobante` int(2) NOT NULL,
  `cod_comprobante` varchar(3) NOT NULL,
  `des_comprobante` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comprobante_pago`
--

INSERT INTO `comprobante_pago` (`id_comprobante`, `cod_comprobante`, `des_comprobante`) VALUES
(1, '01', 'Factura'),
(2, '03', 'Boleta de Venta'),
(3, '100', 'Guia'),
(4, '02', 'Recibo por Honorarios'),
(5, '00', 'Otros (especificar)'),
(6, '05', 'Boleto de compa&ntilde;a de aviaci&oacute;n comercial por el servicio de transporte a&eacute;reo de pasajeros'),
(7, '16', 'Boleto de viaje emitido por las empresas de transporte p&uacute;blico interprovincial de pasajeros dentro del pa&sacute;s'),
(8, '15', 'Boleto emitido por las empresas de transporte p&uacute;blico urbano de pasajeros'),
(9, '19', 'Boleto o entrada por atracciones y espect&aacute;culos p&uacute;blicos'),
(10, '06', 'Carta de porte a&eacute;reo por el servicio de transporte de carga a&eacute;rea'),
(11, '24', 'Certificado de pago de regal&iacute;as emitidas por PERUPETRO S.A'),
(12, '91', 'Comprobante de No Domiciliado                                                 '),
(13, '20', 'Comprobante de Retenci&oacute;n'),
(14, '22', 'Comprobante por Operaciones No Habituales'),
(15, '21', 'Conocimiento de embarque por el servicio de transporte de carga mar&iacute;tima'),
(16, '53', 'Declaraci&oacute;n de Mensajer&iacute;a o Courier                                         '),
(17, '50', 'Declaraci&oacute;n &uacute;nica de Aduanas - Importaci&oacute;n definitiva                 '),
(18, '52', 'Despacho Simplificado - Importaci&oacute;n Simplificada                        '),
(19, '25', 'Documento de Atribuci&oacute;n (Ley del Impuesto General a las Ventas e Impuesto Selectivo al Consumo, Art. 19, &uacute;ltimo p?rrafo, R.S. Nro 022-98-SUNAT).'),
(20, '34', 'Documento del Operador'),
(21, '35', 'Documento del Part&iacute;cipe'),
(22, '13', 'Documento emitido por bancos, instituciones financieras, crediticias y de seguros que se encuentren bajo el control de la Superintendencia de Banca y Seguros'),
(23, '17', 'Documento emitido por la Iglesia Cat&oacute;lica por el arrendamiento de bienes inmuebles'),
(24, '18', 'Documento emitido por las Administradoras Privadas de Fondo de Pensiones que se encuentran bajo la supervisi&oacute;n de la Superintendencia de Administradoras Privadas de Fondos de Pensiones'),
(25, '29', 'Documentos emitidos por la COFOPRI en calidad de oferta de venta de terrenos, los correspondientes a las subastas p&uacute;blicas y a la retribuci&oacute;n de los servicios que presta'),
(26, '30', 'Documentos emitidos por las empresas que desempe&ntilde;an el rol adquirente en los sistemas de pago mediante tarjetas de cr&eacute;dito y d&eacute;bito'),
(27, '32', 'Documentos emitidos por las empresas recaudadoras de la denominada Garant&iacute;a de Red Principal a la que hace referencia el numeral 7.6 del art&iacute;culo 7 de la Ley Nro 27133 ? Ley de Promoci&oacute;n del Desarrollo de la Industria del Gas Natural'),
(28, '37', 'Documentos que emitan los concesionarios del servicio de revisiones t&eacute;cnicas vehiculares, por la prestaci&oacute;n de dicho servicio'),
(29, '96', 'Exceso de cr&eacute;dito fiscal por retiro de bienes                           '),
(30, '09', 'Gu?a de remisi&oacute;n - Remitente'),
(31, '31', 'Gu&iacute;a de Remisi&oacute;n - Transportista'),
(32, '54', 'Liquidaci&oacute;n de Cobranza                                                     '),
(33, '04', 'Liquidaci&oacute;n de compra'),
(34, '07', 'Nota de cr&eacute;dito'),
(35, '97', 'Nota de Cr&eacute;dito - No Domiciliado'),
(36, '87', 'Nota de Cr&eacute;dito Especial'),
(37, '08', 'Nota de d&eacute;bito'),
(38, '98', 'Nota de D&eacute;bito - No Domiciliado'),
(39, '88', 'Nota de D&eacute;bito Especial'),
(40, '99', 'Otros -Consolidado de Boletas de Venta'),
(41, '11', 'P&oacute;liza emitida por las Bolsas de Valores, Bolsas de Productos o Agentes de Intermediaci&oacute;n por operaciones realizadas en las Bolsas de Valores o Productos o fuera de las mismas, autorizadas por CONASEV'),
(42, '23', 'P&oacute;lizas de Adjudicaci&oacute;n emitidas con ocasi&oacute;n del remate o adjudicaci&oacute;n de bienes por venta forzada, por los martilleros o las entidades que rematen o subasten bienes por cuenta de terceros'),
(43, '36', 'Recibo de Distribuci&oacute;n de Gas Natural'),
(44, '10', 'Recibo por Arrendamiento'),
(45, '26', 'Recibo por el Pago de la Tarifa por Uso de Agua Superficial con fines agrarios y por el pago de la Cuota para la ejecuci&oacute;n de una determinada obra o actividad acordada por la Asamblea General de la Comisi&oacute;n de Regantes o Resoluci&oacute;n expedida por el Jefe de la Unidad de Aguas y de Riego (Decreto Supremo Nro 003-90-AG, Arts. 28 y 48)'),
(46, '14', 'Recibo por servicios p&uacute;blicos de suministro de energ&iacute;a el&eacute;ctrica, agua, tel&eacute;fono, telex y telegr&aacute;ficos y otros servicios complementarios que se incluyan en el recibo de servicio p&uacute;blico.'),
(47, '27', 'Seguro Complementario de Trabajo de Riesgo'),
(48, '28', 'Tarifa Unificada de Uso de Aeropuerto'),
(49, '12', 'Ticket o cinta emitido por m&aacute;quina registradora');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` int(10) NOT NULL,
  `tipo` int(2) NOT NULL,
  `a1` text NOT NULL,
  `a2` text NOT NULL,
  `a3` text NOT NULL,
  `a4` text NOT NULL,
  `a5` text NOT NULL,
  `a6` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id`, `tipo`, `a1`, `a2`, `a3`, `a4`, `a5`, `a6`) VALUES
(2962, 100, '1', '2020-12-31', '2021-01-31', '1', '', 'Agua Pura ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id_contacto` int(10) UNSIGNED NOT NULL,
  `nom_cont` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `tema` varchar(100) NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `cod_cue` int(4) NOT NULL,
  `nom_cue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosempresa`
--

CREATE TABLE `datosempresa` (
  `nom_emp` varchar(200) NOT NULL,
  `id_emp` int(2) NOT NULL,
  `tienda` int(10) NOT NULL,
  `des_emp` text NOT NULL,
  `mis_emp` text NOT NULL,
  `vis_emp` text NOT NULL,
  `tel_emp` varchar(200) NOT NULL,
  `dir_emp` varchar(300) NOT NULL,
  `email_emp` text NOT NULL,
  `face_emp` varchar(200) NOT NULL,
  `tiwter_emp` text NOT NULL,
  `youtube_emp` text NOT NULL,
  `linkedin_emp` text NOT NULL,
  `wasap_emp` varchar(30) NOT NULL,
  `compra_dolar` decimal(5,2) NOT NULL,
  `venta_dolar` decimal(5,2) NOT NULL,
  `alerta` double NOT NULL,
  `logo` varchar(20) NOT NULL,
  `fotovision` varchar(20) NOT NULL,
  `fotomision` varchar(20) NOT NULL,
  `slider1` varchar(20) NOT NULL,
  `slider2` varchar(20) NOT NULL,
  `slider3` varchar(20) NOT NULL,
  `slider4` varchar(20) NOT NULL,
  `slider5` varchar(20) NOT NULL,
  `comentario1` text NOT NULL,
  `comentario2` text NOT NULL,
  `comentario3` text NOT NULL,
  `comentario4` text NOT NULL,
  `comentario5` text NOT NULL,
  `precio2` decimal(7,2) NOT NULL,
  `precio3` decimal(7,2) NOT NULL,
  `fac_ele` int(2) NOT NULL,
  `usuariosol` varchar(30) NOT NULL,
  `clavesol` varchar(30) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `dolar` decimal(5,2) NOT NULL,
  `moneda` int(2) NOT NULL,
  `google_maps` text NOT NULL,
  `color` varchar(30) NOT NULL,
  `enviar` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `datosempresa`
--

INSERT INTO `datosempresa` (`nom_emp`, `id_emp`, `tienda`, `des_emp`, `mis_emp`, `vis_emp`, `tel_emp`, `dir_emp`, `email_emp`, `face_emp`, `tiwter_emp`, `youtube_emp`, `linkedin_emp`, `wasap_emp`, `compra_dolar`, `venta_dolar`, `alerta`, `logo`, `fotovision`, `fotomision`, `slider1`, `slider2`, `slider3`, `slider4`, `slider5`, `comentario1`, `comentario2`, `comentario3`, `comentario4`, `comentario5`, `precio2`, `precio3`, `fac_ele`, `usuariosol`, `clavesol`, `clave`, `dolar`, `moneda`, `google_maps`, `color`, `enviar`) VALUES
('Consejo Nacional De Adopciones.', 1, 1, 'empresa ad as dasd a as as das da das da sas dasd as das da as das asd a das das a das da a sdas as a sd ', 'mision1', 'vision1', 'telefonos1', 'direccion1', 'correo1', 'facebook1', 'twitter1', 'youtube1', 'linkedin1', '51976248185', '3.20', '3.40', 10, 'logo.jpg', 'vision.jpg', 'mision.jpg', 'fotoPr8dJmY0.jpg', 'fotoWNO7xmCv.jpg', 'foto5iToLOEW.jpg', '', '', 'comentario11', 'comentario21', 'comentario31', 'comentario41', 'comentario516', '10.00', '20.00', 3, 'MODDATOS', 'moddatos', '9rGvmKq7WyFyA4H', '3.40', 0, '-11.8975999,-77.034237', 'dark-red-theme', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `id_factura` int(12) NOT NULL,
  `detalle1` text NOT NULL,
  `detalle2` text NOT NULL,
  `detalle3` text NOT NULL,
  `detalle4` text NOT NULL,
  `detalle5` text NOT NULL,
  `detalle6` text NOT NULL,
  `fecha_factura` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`id_factura`, `detalle1`, `detalle2`, `detalle3`, `detalle4`, `detalle5`, `detalle6`, `fecha_factura`) VALUES
(1, '', '', '', 'CARGA INICIAL ARCHIVADORES TAMAÃ‘O OFICIO', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(2, '', '', '', 'carga inicial de varios productos ', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(3, 'ab200', '', '', 'primer ingreso producto agua pura ', 'Ubicacion 1', 'caja chica', '0000-00-00 00:00:00'),
(4, 'ab125', '', '', 'carga de 2 productos', 'Ubicacion 1', '500', '0000-00-00 00:00:00'),
(5, '', '', '', 'ingreso de lapiceros', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(58, 'ab201', '', '', 'ingreso de producto', 'Ubicacion 1', 'caja chica', '0000-00-00 00:00:00'),
(59, 'ab203', '', '', 'ingreso de 3 productos', 'Ubicacion 1', '74', '0000-00-00 00:00:00'),
(62, 'ab3333', '', '', 'ingreso producto agua pura', 'Ubicacion 1', '456', '0000-00-00 00:00:00'),
(77, '241524ab', '', '', 'ingreso de 3 productos mes de enero', 'Ubicacion 1', '532653', '0000-00-00 00:00:00'),
(80, '102', '', '', 'para uso del cna', 'Ubicacion 1', '1001', '0000-00-00 00:00:00'),
(82, '123456ab', '', '', 'para uso del cna.', 'Ubicacion 1', 'caja chica', '0000-00-00 00:00:00'),
(84, 'ab235223', '65', '', 'para uso de registro', 'Ubicacion 1', '232323', '0000-00-00 00:00:00'),
(88, 'ab54', '', '', 'ingreso de 2 productos', 'Ubicacion 1', '23', '0000-00-00 00:00:00'),
(89, 'ab108584', '', '', 'ingreso de 4 productos.', 'Ubicacion 1', '101052', '0000-00-00 00:00:00'),
(91, 'ab500', '', '', 'ingreso de productos ', 'Ubicacion 1', '6000', '0000-00-00 00:00:00'),
(92, '', '', '', 'CARGA INICIAL DE MESAS', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(93, '', '', '', 'crga inicial ', 'Ubicacion 1', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_tarjeta`
--

CREATE TABLE `detalle_tarjeta` (
  `id_factura` int(11) NOT NULL,
  `numero_factura` varchar(30) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `cod_hash` varchar(40) NOT NULL,
  `doc_mod` varchar(20) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `baja` varchar(30) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` int(1) NOT NULL,
  `total_venta` decimal(10,4) NOT NULL,
  `deuda_total` decimal(10,2) NOT NULL,
  `estado_factura` text NOT NULL,
  `tienda` int(2) NOT NULL,
  `ven_com` int(2) NOT NULL,
  `activo` int(2) NOT NULL,
  `servicio` int(2) NOT NULL,
  `moneda` double NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `obs` varchar(200) NOT NULL,
  `cuenta1` decimal(10,2) NOT NULL,
  `fec_eli` datetime NOT NULL,
  `dias` int(3) NOT NULL,
  `folio` varchar(5) NOT NULL,
  `des` int(2) NOT NULL,
  `aceptado` varchar(100) NOT NULL,
  `resumen` int(2) NOT NULL,
  `motivo` varchar(15) NOT NULL,
  `tipo` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_tarjeta`
--

INSERT INTO `detalle_tarjeta` (`id_factura`, `numero_factura`, `fecha_factura`, `cod_hash`, `doc_mod`, `id_cliente`, `baja`, `id_vendedor`, `condiciones`, `total_venta`, `deuda_total`, `estado_factura`, `tienda`, `ven_com`, `activo`, `servicio`, `moneda`, `nombre`, `obs`, `cuenta1`, `fec_eli`, `dias`, `folio`, `des`, `aceptado`, `resumen`, `motivo`, `tipo`) VALUES
(1, '147', '2021-06-02 15:11:27', '0', 'undefined', 296, '0', 6, 1, '845.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'carga de 2 bienes a Hugo Marco Unidad de registro', '0.00', '2020-12-01 00:00:00', 0, '100', 1, '', 0, 'undefined', 0),
(2, '147', '2021-06-02 15:23:11', '0', 'undefined', 296, '0', 6, 1, '12950.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'carga de bien ', '0.00', '2020-12-28 00:00:00', 0, '100', 1, '', 0, 'undefined', 0),
(3, '147', '2021-06-02 15:51:02', '0', 'undefined', 296, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'fasd', '0.00', '2021-02-01 00:00:00', 0, '100', 1, '', 0, 'undefined', 0),
(4, '147', '2021-06-02 16:02:21', '0', 'undefined', 296, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'fdsa', '0.00', '2021-06-01 00:00:00', 0, '100', 1, '', 0, 'undefined', 0),
(5, '147', '2021-06-02 16:03:48', '0', 'undefined', 296, '0', 6, 1, '86.8900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'fdsafas', '0.00', '2021-06-03 00:00:00', 0, '100', 1, '', 0, 'undefined', 0),
(6, '147', '2021-06-03 09:40:29', '0', 'undefined', 328, '0', 6, 1, '14.2500', '0.00', '1', 1, 1, 1, 1, 1, '1', 'asiganacion de 1 bien ', '0.00', '2021-02-01 00:00:00', 0, '0618', 1, '', 0, 'undefined', 0),
(7, '147', '2021-06-18 11:01:54', '0', 'undefined', 296, '0', 6, 1, '845.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', '', '0.00', '2021-06-18 00:00:00', 0, '1500', 1, '', 0, 'undefined', 0),
(8, '147', '2021-06-18 11:42:13', '0', 'undefined', 296, '0', 6, 1, '86.8900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'descarga de bien', '0.00', '2021-06-17 00:00:00', 0, '1500', 1, '', 0, 'undefined', 0),
(9, '148', '2021-06-18 11:53:26', '0', 'undefined', 322, '0', 6, 1, '44.1800', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de karen', '0.00', '2021-06-01 00:00:00', 0, '10', 1, '', 0, 'undefined', 0),
(10, '148', '2021-06-25 12:48:32', '0', 'undefined', 290, '0', 6, 1, '22.2500', '0.00', '1', 1, 1, 1, 1, 1, '1', 'asiganacion de bien ', '0.00', '2021-06-01 00:00:00', 0, '55555', 1, '', 0, 'undefined', 0),
(11, '148', '2021-06-25 13:23:17', '0', 'undefined', 290, '0', 6, 1, '18.5000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'desasignacion', '0.00', '2021-06-25 00:00:00', 0, '55555', 1, '', 0, 'undefined', 0),
(12, '148', '2021-07-01 14:41:12', '0', 'undefined', 291, '0', 6, 1, '8.0800', '0.00', '1', 1, 1, 1, 1, 1, '1', 'asigancion de bien ', '0.00', '2021-02-01 00:00:00', 0, '555', 1, '', 0, 'undefined', 0),
(13, '148', '2021-07-01 14:45:08', '0', 'undefined', 291, '0', 6, 1, '8400.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'fdsadfa', '0.00', '2021-04-30 00:00:00', 0, '555', 1, '', 0, 'undefined', 0),
(14, '148', '2021-07-01 14:53:58', '0', 'undefined', 291, '0', 6, 1, '8400.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'fdasfds', '0.00', '2021-07-01 00:00:00', 0, '555', 1, '', 0, 'undefined', 0),
(15, '148', '2021-07-02 10:55:58', '0', 'undefined', 291, '0', 6, 1, '105.3900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'FASDFAFA', '0.00', '2021-07-01 00:00:00', 0, '555', 1, '', 0, 'undefined', 0),
(16, '149', '2021-07-02 11:20:41', '0', 'undefined', 291, '0', 6, 1, '15.0100', '0.00', '1', 1, 1, 1, 1, 1, '1', 'fdsa', '0.00', '2021-07-02 00:00:00', 0, '555', 1, '', 0, 'undefined', 0),
(17, '148', '2021-08-03 12:23:39', '0', 'undefined', 296, '0', 6, 1, '13.4300', '0.00', '1', 1, 1, 1, 1, 1, '1', 'carga bien', '0.00', '2021-08-01 00:00:00', 0, '1500', 1, '', 0, 'undefined', 0),
(18, '148', '2021-08-03 12:43:22', '0', 'undefined', 296, '0', 6, 1, '24.4600', '0.00', '1', 1, 1, 1, 1, 1, '1', 'carga 1 bien ', '0.00', '2021-08-03 00:00:00', 0, '1500', 1, '', 0, 'undefined', 0),
(19, '148', '2021-08-03 12:57:14', '0', 'undefined', 296, '0', 6, 1, '37.8900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'dar de baja dos articulos ', '0.00', '2021-08-03 00:00:00', 0, '1500', 1, '', 0, 'undefined', 0),
(20, '148', '2021-08-03 13:07:33', '0', 'undefined', 290, '0', 6, 1, '37.8900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'carga de productos', '0.00', '2021-08-02 00:00:00', 0, '12345', 1, '', 0, 'undefined', 0),
(21, '148', '2021-08-03 14:41:04', '0', 'undefined', 290, '0', 6, 1, '1.2500', '0.00', '1', 1, 1, 1, 1, 1, '1', 'asignacion de un bien ', '0.00', '2021-08-10 00:00:00', 0, '12345', 1, '', 0, 'undefined', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id_documento` int(2) NOT NULL,
  `tipo` varchar(12) NOT NULL,
  `numero` int(20) NOT NULL,
  `tienda1` varchar(10) NOT NULL,
  `tienda2` varchar(10) NOT NULL,
  `tienda3` varchar(10) NOT NULL,
  `tienda4` varchar(10) NOT NULL,
  `tienda5` varchar(10) NOT NULL,
  `tienda6` varchar(10) NOT NULL,
  `folio1` varchar(10) NOT NULL,
  `folio2` varchar(10) NOT NULL,
  `folio3` varchar(10) NOT NULL,
  `folio4` varchar(10) NOT NULL,
  `folio5` varchar(5) NOT NULL,
  `folio6` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id_documento`, `tipo`, `numero`, `tienda1`, `tienda2`, `tienda3`, `tienda4`, `tienda5`, `tienda6`, `folio1`, `folio2`, `folio3`, `folio4`, `folio5`, `folio6`) VALUES
(1, 'factura', 0, '147', '0', '0', '0', '0', '0', 'F001', 'F002', 'F003', 'F004', 'F005', 'F006'),
(2, 'boleta', 0, '0', '0', '0', '0', '0', '0', 'B001', 'B002', 'B003', 'B004', 'B005', 'B006'),
(3, 'guia', 0, '0', '0', '0', '0', '0', '0', 'T001', 'T002', 'T003', 'T004', 'T005', 'T006'),
(4, 'remision', 0, '1', '0', '0', '0', '0', '0', 'T001', 'T002', 'T003', 'T004', 'T005', 'T006'),
(5, 'nota_debito', 0, '0', '0', '0', '0', '0', '0', 'F001', 'F002', 'F003', 'F004', 'F005', 'F006'),
(6, 'nota_credito', 0, '0', '0', '0', '0', '0', '0', 'F001', 'F002', 'F003', 'F004', 'F005', 'F006'),
(7, 'Resumen', 0, '0', '0', '0', '0', '0', '0', 'F001', 'F002', 'F003', 'F004', 'F005', 'F006'),
(8, 'cotizacion', 0, '8', '0', '0', '0', '0', '0', 'C001', 'C002', 'C003', 'C004', 'C005', 'C006'),
(9, 'nota_debito1', 0, '0', '0', '0', '0', '0', '0', 'B001', 'B002', 'B003', 'B004', 'B005', 'B006'),
(10, 'nota_credito', 0, '0', '0', '0', '0', '0', '0', 'B001', 'B002', 'B003', 'B004', 'B005', 'B006'),
(11, 'reqerimiento', 0, '0', '0', '0', '0', '0', '0', 'R001', 'R002', 'R003', 'R004', 'R005', 'R006');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_electronicos`
--

CREATE TABLE `documentos_electronicos` (
  `id_doc` int(10) NOT NULL,
  `ruc` int(11) NOT NULL,
  `obs` text,
  `url_xml` text NOT NULL,
  `hash_cpe` text NOT NULL,
  `hash_cdr` text NOT NULL,
  `msj_sunat` text NOT NULL,
  `ruta_cdr` text NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `doc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `numero_factura` varchar(30) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `cod_hash` varchar(40) NOT NULL,
  `doc_mod` varchar(20) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `baja` varchar(30) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` int(1) NOT NULL,
  `total_venta` decimal(10,4) NOT NULL,
  `deuda_total` decimal(10,2) NOT NULL,
  `estado_factura` text NOT NULL,
  `tienda` int(2) NOT NULL,
  `ven_com` int(2) NOT NULL,
  `activo` int(2) NOT NULL,
  `servicio` int(2) NOT NULL,
  `moneda` double NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `obs` varchar(200) NOT NULL,
  `cuenta1` decimal(10,2) NOT NULL,
  `fec_eli` datetime NOT NULL,
  `dias` int(3) NOT NULL,
  `folio` varchar(5) NOT NULL,
  `des` int(2) NOT NULL,
  `aceptado` varchar(100) NOT NULL,
  `resumen` int(2) NOT NULL,
  `motivo` varchar(15) NOT NULL,
  `tipo` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `numero_factura`, `fecha_factura`, `cod_hash`, `doc_mod`, `id_cliente`, `baja`, `id_vendedor`, `condiciones`, `total_venta`, `deuda_total`, `estado_factura`, `tienda`, `ven_com`, `activo`, `servicio`, `moneda`, `nombre`, `obs`, `cuenta1`, `fec_eli`, `dias`, `folio`, `des`, `aceptado`, `resumen`, `motivo`, `tipo`) VALUES
(1, '0', '2021-01-01 08:46:36', '0', '', 0, '0', 6, 1, '4712.5000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 08:46:36', 0, '', 2, '', 0, '', 0),
(2, '123', '2021-01-01 09:18:10', '0', '', 293, '0', 6, 1, '135.3000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-01-01 09:18:10', 0, '00123', 2, '', 0, '', 0),
(3, '124', '2021-01-03 09:55:28', '0', '', 329, '0', 6, 1, '568.7500', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-08-09 09:55:28', 0, '00124', 2, '', 0, '', 0),
(4, '125', '2021-01-10 10:00:54', '0', '', 293, '0', 6, 1, '207.5000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-01-06 10:00:54', 0, '00125', 2, '', 0, '', 0),
(5, '0', '2021-01-11 14:40:28', '0', '', 0, '0', 6, 1, '500.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 14:40:28', 0, '', 2, '', 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_carrito`
--

CREATE TABLE `factura_carrito` (
  `id_factura1` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `documento` varchar(11) NOT NULL,
  `observacion` text NOT NULL,
  `codigo` varchar(11) NOT NULL,
  `nro_guia` int(11) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `activo` int(11) NOT NULL,
  `fecha1` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE `fotos` (
  `id_foto` int(10) NOT NULL,
  `nom_foto` varchar(30) NOT NULL,
  `archivo` text NOT NULL,
  `largo` varchar(10) NOT NULL,
  `ancho` varchar(10) NOT NULL,
  `ubi_pag` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fotos`
--

INSERT INTO `fotos` (`id_foto`, `nom_foto`, `archivo`, `largo`, `ancho`, `ubi_pag`) VALUES
(38, 'slider1', 'fotoPr8dJmY0.jpg', '620', '356', 'slider1'),
(39, 'slider2', 'fotoWNO7xmCv.jpg', '1300', '866', 'slider2'),
(40, 'slider3', 'foto5iToLOEW.jpg', '870', '424', 'slider3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos1`
--

CREATE TABLE `fotos1` (
  `id_foto` int(11) NOT NULL,
  `nom_foto` varchar(30) NOT NULL,
  `archivo` text NOT NULL,
  `largo` varchar(10) NOT NULL,
  `ancho` varchar(10) NOT NULL,
  `ubi_pag` varchar(30) NOT NULL,
  `a1` varchar(30) NOT NULL,
  `a2` varchar(30) NOT NULL,
  `a3` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fotos1`
--

INSERT INTO `fotos1` (`id_foto`, `nom_foto`, `archivo`, `largo`, `ancho`, `ubi_pag`, `a1`, `a2`, `a3`) VALUES
(14, 'slider3', 'si1.jpg', '187', '442', 'Inicio', '', '', ''),
(15, 'slider4', 'si5.jpg', '256', '355', 'Inicio', '', '', ''),
(16, 'banner1', 'banner1.jpg', '653', '288', 'Inicio', '', '', ''),
(17, 'banner2', 'banner2.jpg', '460', '289', 'Inicio', '', '', ''),
(18, 'banner3', 'banner3.jpg', '1142', '196', 'Inicio', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `globales`
--

CREATE TABLE `globales` (
  `id_global` int(3) NOT NULL,
  `nombre` text NOT NULL,
  `med` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `globales`
--

INSERT INTO `globales` (`id_global`, `nombre`, `med`) VALUES
(1, 'COLOR', '#E0E6F8'),
(2, 'COLOR1', '#D8D8D8'),
(3, 'COLOR2', '#58FAAC'),
(4, 'COLOR3', '#F3F781'),
(5, 'iva', '0.18'),
(6, 'nom_iva', 'IGV'),
(7, 'doc', 'Nota de Venta'),
(8, 'moneda', 'Q.'),
(9, 'videos', '0'),
(10, 'des1', 'Modelo'),
(11, 'des2', 'Color'),
(12, 'des3', 'Marca'),
(13, 'D.N.I ', '8'),
(14, 'R.U.C ', '11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia`
--

CREATE TABLE `guia` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_doc` int(10) NOT NULL,
  `serie` varchar(4) NOT NULL,
  `guia` int(8) NOT NULL,
  `dir_par` varchar(100) NOT NULL,
  `dom_lleg` text NOT NULL,
  `cont_lleg` text NOT NULL,
  `tel_lleg` text NOT NULL,
  `fecha_lleg` date NOT NULL,
  `vehiculo` text NOT NULL,
  `inscripcion` text NOT NULL,
  `lic` text NOT NULL,
  `fecha` date NOT NULL,
  `CODMOTIVO_TRASLADO` varchar(2) NOT NULL,
  `MOTIVO_TRASLADO` varchar(10) NOT NULL,
  `PESO` decimal(10,3) NOT NULL,
  `NUMERO_PAQUETES` int(5) NOT NULL,
  `UBIGEO_DESTINO` varchar(10) NOT NULL,
  `UBIGEO_PARTIDA` varchar(10) NOT NULL,
  `NRO_DOCUMENTO_TRANSPORTE` varchar(11) NOT NULL,
  `RAZON_SOCIAL_TRANSPORTE` varchar(150) NOT NULL,
  `CODTIPO_TRANSPORTISTA` varchar(2) NOT NULL,
  `hash_cpe` varchar(100) NOT NULL,
  `cod_sunat` varchar(100) NOT NULL,
  `aceptado_guia` varchar(100) NOT NULL,
  `doc_guia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresosegresos`
--

CREATE TABLE `ingresosegresos` (
  `id_detalle` int(11) NOT NULL,
  `id_cliente` int(10) NOT NULL,
  `id_vendedor` int(10) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `ot` varchar(20) NOT NULL,
  `id_producto` varchar(100) NOT NULL,
  `cantidad` decimal(10,0) NOT NULL,
  `cantidadIngreso` int(100) NOT NULL,
  `cantidadEgreso` int(100) NOT NULL,
  `precio_venta` decimal(10,4) NOT NULL,
  `tienda` int(2) NOT NULL,
  `activo` int(1) NOT NULL,
  `ven_com` int(2) NOT NULL,
  `fecha` datetime NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `tipo_doc` int(2) NOT NULL,
  `inv_ini` decimal(10,2) NOT NULL,
  `moneda` decimal(4,2) NOT NULL,
  `folio` varchar(5) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `Renglon` varchar(100) DEFAULT NULL,
  `Lote` varchar(100) NOT NULL,
  `Orden` varchar(100) NOT NULL,
  `Serie_fac` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `ingresosegresos`
--

INSERT INTO `ingresosegresos` (`id_detalle`, `id_cliente`, `id_vendedor`, `numero_factura`, `ot`, `id_producto`, `cantidad`, `cantidadIngreso`, `cantidadEgreso`, `precio_venta`, `tienda`, `activo`, `ven_com`, `fecha`, `precio_compra`, `tipo_doc`, `inv_ini`, `moneda`, `folio`, `nome`, `Renglon`, `Lote`, `Orden`, `Serie_fac`) VALUES
(1, 0, 6, 0, '2', '2', '150', 150, 0, '24.7500', 1, 1, 2, '2020-12-31 08:46:36', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(2, 0, 6, 0, '2', '1', '80', 80, 0, '12.5000', 1, 1, 2, '2020-12-31 08:46:36', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(3, 293, 6, 123, '2', '1', '10', 10, 0, '13.5300', 1, 1, 2, '2021-01-01 09:18:10', '0.00', 1, '80.00', '1.00', '00123', '', '320', '', '500', 'ab123'),
(4, 329, 6, 124, '2', '2', '25', 25, 0, '22.7500', 1, 1, 2, '2021-01-03 09:55:28', '0.00', 1, '150.00', '1.00', '00124', '', '320', '', '501', 'ab124'),
(5, 293, 6, 125, '2', '1', '10', 10, 0, '20.7500', 1, 1, 2, '2021-01-10 10:00:54', '0.00', 1, '90.00', '1.00', '00125', '', '320', '', '500', 'ab125'),
(6, 0, 6, 0, '2', '3', '400', 400, 0, '1.2500', 1, 1, 2, '2021-01-11 14:40:28', '0.00', 1, '0.00', '1.00', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `usuario` int(4) NOT NULL,
  `fecha` datetime NOT NULL,
  `inventario` decimal(12,2) NOT NULL,
  `inv_ini` decimal(12,2) NOT NULL,
  `tienda` int(2) NOT NULL,
  `motivo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laborales`
--

CREATE TABLE `laborales` (
  `id_laboral` int(10) NOT NULL,
  `cod_var` varchar(10) NOT NULL,
  `variables` text NOT NULL,
  `des_var` text NOT NULL,
  `col_var` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pack`
--

CREATE TABLE `pack` (
  `id_pack` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `id_producto1` int(10) NOT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  `tipo` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(10) NOT NULL,
  `id_pago` int(10) NOT NULL,
  `id_factura` int(10) NOT NULL,
  `pago` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `id` int(15) NOT NULL,
  `id_producto` int(12) NOT NULL,
  `id_cliente` int(12) NOT NULL,
  `activo` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_producto` int(11) NOT NULL,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` text NOT NULL,
  `status_producto` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` decimal(10,4) NOT NULL,
  `costo_producto` decimal(10,4) NOT NULL,
  `mon_costo` decimal(4,2) NOT NULL,
  `mon_venta` int(2) NOT NULL,
  `max` varchar(50) NOT NULL,
  `desc_corta` varchar(50) NOT NULL,
  `color` varchar(1000) NOT NULL,
  `b1` decimal(10,2) NOT NULL,
  `b2` decimal(10,2) NOT NULL,
  `b3` decimal(10,2) NOT NULL,
  `b4` decimal(10,2) NOT NULL,
  `b5` decimal(10,2) NOT NULL,
  `b6` decimal(10,2) NOT NULL,
  `cat_pro` int(2) NOT NULL,
  `pro_ser` int(2) NOT NULL,
  `foto1` varchar(100) NOT NULL,
  `foto2` varchar(100) NOT NULL,
  `foto3` varchar(100) NOT NULL,
  `foto4` varchar(100) NOT NULL,
  `fecha_caducidad` date NOT NULL,
  `pre_web` decimal(10,2) NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion1` text NOT NULL,
  `megusta` int(10) NOT NULL,
  `nomegusta` int(10) NOT NULL,
  `precio2` decimal(10,4) NOT NULL,
  `precio3` decimal(10,2) NOT NULL,
  `und_pro` int(3) NOT NULL,
  `barras` varchar(20) NOT NULL,
  `dcto` decimal(4,2) NOT NULL,
  `min` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `status_producto`, `date_added`, `precio_producto`, `costo_producto`, `mon_costo`, `mon_venta`, `max`, `desc_corta`, `color`, `b1`, `b2`, `b3`, `b4`, `b5`, `b6`, `cat_pro`, `pro_ser`, `foto1`, `foto2`, `foto3`, `foto4`, `fecha_caducidad`, `pre_web`, `descripcion`, `descripcion1`, `megusta`, `nomegusta`, `precio2`, `precio3`, `und_pro`, `barras`, `dcto`, `min`) VALUES
(1, 'ag-001', 'Agua Pura ', 1, '2021-08-03 08:45:02', '20.7500', '13.4280', '1.00', 1, '100', 'Agua Pura GarrafÃ³n ', 'Agua pura garrafÃ³n ', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '13.4280', '0.00', 1, '', '0.00', '50.00'),
(2, 'hjs-002', 'Hojas TamaÃ±o Carta', 1, '2021-08-03 08:46:10', '22.7500', '24.4643', '1.00', 1, '200', 'Hojas TamaÃ±o carta 80 grm marca Tucan', 'Hojas TamaÃ±o carta 80 grm marca Tucan', '175.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '24.4643', '0.00', 1, '', '0.00', '100.00'),
(3, 'ab-003', 'Lapiceros', 1, '2021-08-03 14:37:52', '1.2500', '1.2500', '1.00', 1, '500', 'lapiceros bic color negro ', 'lapiceros bic color negro ', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '1.2500', '0.00', 1, '', '0.00', '200.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_facturas`
--

CREATE TABLE `programas_facturas` (
  `id_Programa_Factura` int(15) NOT NULL,
  `id_factura` int(10) DEFAULT '1641',
  `Nom_Programa` varchar(250) NOT NULL,
  `numero_factura` int(15) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `programas_facturas`
--

INSERT INTO `programas_facturas` (`id_Programa_Factura`, `id_factura`, `Nom_Programa`, `numero_factura`, `fecha`) VALUES
(1, 4, 'ASESORIA A MADRES Y/O PADRES BIOLOGICOS EN CONFLICTO CON SU PARENTALIDAD', 125, '2021-08-03 15:01:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `id_puesto` int(10) NOT NULL,
  `nombre_puesto` varchar(100) NOT NULL,
  `estado` int(1) NOT NULL,
  `acronimo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`id_puesto`, `nombre_puesto`, `estado`, `acronimo`) VALUES
(2, 'Analista Programador', 1, 'UR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumen_documentos`
--

CREATE TABLE `resumen_documentos` (
  `id_resumen` int(10) NOT NULL,
  `numero` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `aceptado_resumen` varchar(100) NOT NULL,
  `xml` varchar(30) NOT NULL,
  `ticket` varchar(20) NOT NULL,
  `hash_cpe` varchar(100) NOT NULL,
  `cod_sunat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldos`
--

CREATE TABLE `saldos` (
  `id_saldo` int(10) NOT NULL,
  `saldo` decimal(10,4) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `fecha_final` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saldos`
--

INSERT INTO `saldos` (`id_saldo`, `saldo`, `fecha_inicial`, `fecha_final`) VALUES
(1, '4712.5000', '2020-12-01', '2020-12-31'),
(2, '4712.5000', '2021-01-01', '2021-08-31'),
(3, '4712.5000', '2021-01-01', '2021-01-31'),
(4, '4712.5000', '2021-01-01', '2021-01-31'),
(5, '4847.7960', '2021-01-01', '2021-01-31'),
(6, '5624.0525', '2021-01-01', '2021-01-31'),
(7, '5624.0525', '2021-01-01', '2021-01-31'),
(8, '5624.0525', '2021-01-01', '2021-01-31'),
(9, '5624.0525', '2021-01-01', '2021-01-31'),
(10, '6124.0525', '2021-01-01', '2021-01-31'),
(11, '6124.0525', '2021-01-01', '2021-01-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(10) NOT NULL,
  `id_cliente` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `doc_servicio` varchar(30) NOT NULL,
  `tienda` int(2) NOT NULL,
  `nom_ser` varchar(100) NOT NULL,
  `tipo` int(2) NOT NULL,
  `pre_ser` decimal(5,2) NOT NULL,
  `ade_ser` decimal(5,2) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `des_ser` text NOT NULL,
  `car1` varchar(200) NOT NULL,
  `car2` varchar(200) NOT NULL,
  `car3` varchar(200) NOT NULL,
  `car4` varchar(200) NOT NULL,
  `car5` varchar(200) NOT NULL,
  `car6` varchar(200) NOT NULL,
  `com_ser` text NOT NULL,
  `ter_ser` int(2) NOT NULL,
  `cancelado` int(2) NOT NULL,
  `telefono1` varchar(100) NOT NULL,
  `guia` varchar(100) NOT NULL,
  `tip_doc` int(2) NOT NULL,
  `activo` int(2) NOT NULL,
  `detalle` int(10) NOT NULL,
  `fecha_emision` datetime NOT NULL,
  `fecha_reparado` datetime NOT NULL,
  `saliente` datetime NOT NULL,
  `desechado` datetime NOT NULL,
  `aceptar_guia` int(2) NOT NULL,
  `reparado` int(2) NOT NULL,
  `entregado` int(10) NOT NULL,
  `id_reparado` int(10) NOT NULL,
  `id_entregado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nom_servicio` text NOT NULL,
  `cod_servicio` varchar(10) NOT NULL,
  `pre_servicio` decimal(10,2) NOT NULL,
  `tipo` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id_subcategorias` int(10) NOT NULL,
  `categoria` int(10) NOT NULL,
  `nom_sub` text NOT NULL,
  `des_sub` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_tipo`
--

CREATE TABLE `sub_tipo` (
  `id_sub_tipo` int(2) NOT NULL,
  `id_tipo` int(2) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `sub_tipo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sub_tipo`
--

INSERT INTO `sub_tipo` (`id_sub_tipo`, `id_tipo`, `nombre`, `sub_tipo`) VALUES
(1, 1, 'Laptop', 'Marca'),
(2, 1, 'Laptop', 'Modelo'),
(3, 1, 'Laptop', 'Nro Serie'),
(4, 1, 'Laptop', 'Procesador'),
(5, 1, 'Laptop', 'Memoria Ram'),
(6, 1, 'Laptop', 'Disco Duro'),
(7, 2, 'Computadora', 'Marca'),
(8, 2, 'Computadora', 'Modelo'),
(9, 2, 'Computadora', 'Placa'),
(10, 2, 'Computadora', 'Procesador'),
(11, 2, 'Computadora', 'Memoria Ram'),
(12, 2, 'Computadora', 'Disco Duro'),
(13, 3, 'Impresora', 'Tipo'),
(14, 3, 'Impresora', 'Marca'),
(15, 3, 'Impresora', 'Modelo'),
(16, 3, 'Impresora', 'Nro Serie'),
(17, 4, 'Monitor', 'Marca'),
(18, 4, 'Monitor', 'Modelo'),
(19, 4, 'Monitor', 'Nro Serie'),
(20, 4, 'Monitor', 'Tamaño de Pantalla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(10) NOT NULL,
  `tienda` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  `direccion` text NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `ubigeo` varchar(10) NOT NULL,
  `caja` int(2) NOT NULL,
  `dep_suc` varchar(100) NOT NULL,
  `pro_suc` varchar(100) NOT NULL,
  `dis_suc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `tienda`, `nombre`, `ruc`, `direccion`, `correo`, `telefono`, `foto`, `ubigeo`, `caja`, `dep_suc`, `pro_suc`, `dis_suc`) VALUES
(1, 1, 'Consejo Nacional de Adopciones ', '2415 1600', '7A Avenida 6-68, Cdad. de Guatemala', 'CORREO', '', 'sucursal1.jpg', '1233', 1, 'Guatemala', 'Guatemala', 'Guatemala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta_responsabilidad`
--

CREATE TABLE `tarjeta_responsabilidad` (
  `id_detalle` int(11) NOT NULL,
  `id_cliente` int(10) NOT NULL,
  `id_vendedor` int(10) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `ot` varchar(20) NOT NULL,
  `id_producto` varchar(100) NOT NULL,
  `cantidad` decimal(10,0) NOT NULL,
  `cantidadIngreso` int(100) NOT NULL,
  `cantidadEgreso` int(100) NOT NULL,
  `precio_venta` decimal(10,4) NOT NULL,
  `tienda` int(2) NOT NULL,
  `activo` int(1) NOT NULL,
  `ven_com` int(2) NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `tipo_doc` int(2) NOT NULL,
  `inv_ini` decimal(10,2) NOT NULL,
  `moneda` decimal(4,2) NOT NULL,
  `folio` varchar(5) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `Renglon` varchar(100) DEFAULT NULL,
  `Lote` varchar(100) NOT NULL,
  `Orden` varchar(100) NOT NULL,
  `Serie_fac` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tarjeta_responsabilidad`
--

INSERT INTO `tarjeta_responsabilidad` (`id_detalle`, `id_cliente`, `id_vendedor`, `numero_factura`, `ot`, `id_producto`, `cantidad`, `cantidadIngreso`, `cantidadEgreso`, `precio_venta`, `tienda`, `activo`, `ven_com`, `fecha`, `fecha_baja`, `precio_compra`, `tipo_doc`, `inv_ini`, `moneda`, `folio`, `nome`, `Renglon`, `Lote`, `Orden`, `Serie_fac`) VALUES
(1, 296, 6, 148, '1', '1', '1', 0, 1, '13.4280', 1, 1, 1, '2021-08-01 00:00:00', '2021-08-03', '13.43', 1, '100.00', '1.00', '1500', '', '', '', 'undefined', ''),
(2, 296, 6, 148, '1', '2', '1', 0, 1, '24.4643', 1, 1, 1, '2021-08-03 00:00:00', '2021-08-03', '24.46', 1, '175.00', '1.00', '1500', '', '', '', 'undefined', ''),
(3, 290, 6, 148, '1', '1', '1', 0, 1, '13.4280', 1, 1, 1, '2021-08-02 00:00:00', '0000-00-00', '13.43', 1, '100.00', '1.00', '12345', '', '', '', 'undefined', ''),
(4, 290, 6, 148, '1', '2', '1', 0, 1, '24.4643', 1, 1, 1, '2021-08-02 00:00:00', '0000-00-00', '24.46', 1, '175.00', '1.00', '12345', '', '', '', 'undefined', ''),
(5, 290, 6, 148, '1', '3', '1', 0, 1, '1.2500', 1, 1, 1, '2021-08-10 00:00:00', '0000-00-00', '1.25', 1, '400.00', '1.00', '12345', '', '', '', 'undefined', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(2) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `tipo`) VALUES
(1, 'Laptops'),
(2, 'Computadoras'),
(3, 'Impresoras'),
(4, 'Monitores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp`
--

CREATE TABLE `tmp` (
  `id_tmp` int(11) NOT NULL,
  `id_producto` varchar(100) NOT NULL,
  `cantidad_tmp` decimal(10,2) NOT NULL,
  `precio_tmp` decimal(10,4) DEFAULT NULL,
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tienda` decimal(10,2) NOT NULL,
  `cod` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Renglon_Presupuestario` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tmp`
--

INSERT INTO `tmp` (`id_tmp`, `id_producto`, `cantidad_tmp`, `precio_tmp`, `session_id`, `tienda`, `cod`, `Renglon_Presupuestario`) VALUES
(13, '3', '1.00', '1.2500', 'fu0dhm8a7p80gum8r16re13k2d', '400.00', '', 'ALMACENADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp1`
--

CREATE TABLE `tmp1` (
  `id_tmp` int(12) NOT NULL,
  `id_producto` int(12) NOT NULL,
  `cantidad_tmp` decimal(12,2) NOT NULL,
  `precio_tmp` decimal(12,2) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `tienda` int(4) NOT NULL,
  `cod` varchar(100) DEFAULT NULL,
  `Renglon_Presupuestario` varchar(100) DEFAULT NULL,
  `Serie` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp_descarga_tarjeta`
--

CREATE TABLE `tmp_descarga_tarjeta` (
  `id_tmp` int(11) NOT NULL,
  `id_producto` varchar(100) NOT NULL,
  `cantidad_tmp` decimal(10,2) NOT NULL,
  `precio_tmp` decimal(10,4) DEFAULT NULL,
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tienda` decimal(10,2) NOT NULL,
  `cod` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Renglon_Presupuestario` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `profesional` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tmp_descarga_tarjeta`
--

INSERT INTO `tmp_descarga_tarjeta` (`id_tmp`, `id_producto`, `cantidad_tmp`, `precio_tmp`, `session_id`, `tienda`, `cod`, `Renglon_Presupuestario`, `profesional`) VALUES
(1, '1', '1.00', '13.4280', 'fu0dhm8a7p80gum8r16re13k2d', '100.00', '', 'ASIGNADO', 'Hugo Marco Vasquez'),
(2, '2', '1.00', '24.4643', 'fu0dhm8a7p80gum8r16re13k2d', '175.00', '', 'ASIGNADO', 'Hugo Marco Vasquez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `und`
--

CREATE TABLE `und` (
  `id_und` int(2) NOT NULL,
  `nom_und` varchar(100) NOT NULL,
  `cod_und` varchar(4) NOT NULL,
  `xml_und` varchar(4) NOT NULL,
  `etiqueta` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `und`
--

INSERT INTO `und` (`id_und`, `nom_und`, `cod_und`, `xml_und`, `etiqueta`) VALUES
(1, 'Unidad', '01', 'und', 'und'),
(2, 'Cajas', '02', 'cjs', 'cjs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `id_unidad` int(10) NOT NULL,
  `acronimo` varchar(250) NOT NULL,
  `nombreUnidad` varchar(250) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id_unidad`, `acronimo`, `nombreUnidad`, `estado`) VALUES
(1, 'UR', 'Unidad de Registro', 1),
(2, 'CRH', 'Unidad de Recursos Humanos', 1),
(3, 'UDAF', 'Unidad De Administración Financiera', 1),
(4, 'SG', 'Secretaria General', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `nombres` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `clave` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `nit` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hora` time NOT NULL,
  `user_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL,
  `accesos` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dni` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `domicilio` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telefono` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sucursal` int(2) NOT NULL,
  `foto` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_unidad` int(10) DEFAULT NULL,
  `id_puesto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data' ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `nombres`, `clave`, `user_name`, `nit`, `hora`, `user_email`, `date_added`, `accesos`, `dni`, `domicilio`, `telefono`, `sucursal`, `foto`, `id_unidad`, `id_puesto`) VALUES
(2, 'Carlos Pacheco', '123456', 'usuario', '', '00:00:00', '', '2019-07-21 03:24:30', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1..1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '211415121415\r\n', '', '', 1, 'user.png', 3, 1),
(3, 'Hugo Marco Vasquez', 'Hz08*cna', 'hvasquez', '72943246', '00:00:00', 'hvasquezg2@miumg.edu.gt', '2021-03-18 15:11:06', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '2126145170901', 'Guatemala', '145', 1, 'usuario3.jpg', 1, 2),
(4, 'Byron Castillo Casasola', 'Bcastillo08*cna', 'bcastillo', '14514787885', '00:00:00', 'bcastillo@cna.gob.gt', '2021-03-18 15:39:53', '......1................1....1.1..1..............1.......', '14514787885', 'Guatemala ', '135', 1, 'usuario4.jpg', 2, 2),
(5, 'Omar Reyes', 'Or08*cna', 'Oreyes', '3131254717', '00:00:00', 'oreyes@cna.gob.gt', '2021-03-30 15:39:05', '......1................1....1.1..1..............1.......', '33225222', 'Guatemala', '140', 1, 'user.png', 3, 2),
(6, 'Feliciano Merlos Sanchez', 'fs07*cna', 'fmerlos', '1953353250206', '00:00:00', 'fmerlos@cna.gob.gt', '2021-05-10 09:37:54', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '1953353250206', 'Guatemala', '200', 1, 'user.png', 3, 1),
(7, 'Keylor Navas', 'kn05*cna', 'knavas', '\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?', '00:00:00', 'fmerlos@cna.gob.gt', '2021-05-10 09:37:54', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '151520', 'Guatemala', '200', 1, 'user.png', 3, 1),
(8, 'Genesis Rodriguez Altan', 'gz09*cna', 'grodriguez', '74853246', '00:00:00', 'grodriguez@cna.gob.gt', '2021-05-10 09:37:54', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '2227155280901', 'Guatemala', '200', 1, 'user.png', 3, 1),
(9, 'Karen Abigail Santizo Ramirez ', 'Ko08*cna', 'ksantizo', '10101010', '00:00:00', 'ksantizo@hotmail.com', '0000-00-00 00:00:00', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '2122155280901', 'Guatemala', '74858956', 1, '', 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `documento` varchar(11) NOT NULL,
  `direccion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `id_video` int(12) NOT NULL,
  `menu` text NOT NULL,
  `submenu` text NOT NULL,
  `descripcion` text NOT NULL,
  `video` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD UNIQUE KEY `unico` (`unico`);

--
-- Indices de la tabla `baja_sunat`
--
ALTER TABLE `baja_sunat`
  ADD PRIMARY KEY (`id_baja`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_caja`);

--
-- Indices de la tabla `cambio`
--
ALTER TABLE `cambio`
  ADD PRIMARY KEY (`id_cambio`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nom_cat` (`nom_cat`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_online`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`);

--
-- Indices de la tabla `comprobante_pago`
--
ALTER TABLE `comprobante_pago`
  ADD PRIMARY KEY (`id_comprobante`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datosempresa`
--
ALTER TABLE `datosempresa`
  ADD PRIMARY KEY (`id_emp`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `detalle_tarjeta`
--
ALTER TABLE `detalle_tarjeta`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `documentos_electronicos`
--
ALTER TABLE `documentos_electronicos`
  ADD PRIMARY KEY (`id_doc`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `factura_carrito`
--
ALTER TABLE `factura_carrito`
  ADD PRIMARY KEY (`id_factura1`);

--
-- Indices de la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indices de la tabla `fotos1`
--
ALTER TABLE `fotos1`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indices de la tabla `globales`
--
ALTER TABLE `globales`
  ADD PRIMARY KEY (`id_global`);

--
-- Indices de la tabla `guia`
--
ALTER TABLE `guia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingresosegresos`
--
ALTER TABLE `ingresosegresos`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`);

--
-- Indices de la tabla `laborales`
--
ALTER TABLE `laborales`
  ADD PRIMARY KEY (`id_laboral`);

--
-- Indices de la tabla `pack`
--
ALTER TABLE `pack`
  ADD PRIMARY KEY (`id_pack`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `programas_facturas`
--
ALTER TABLE `programas_facturas`
  ADD PRIMARY KEY (`id_Programa_Factura`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`id_puesto`);

--
-- Indices de la tabla `resumen_documentos`
--
ALTER TABLE `resumen_documentos`
  ADD PRIMARY KEY (`id_resumen`);

--
-- Indices de la tabla `saldos`
--
ALTER TABLE `saldos`
  ADD PRIMARY KEY (`id_saldo`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD UNIQUE KEY `cod` (`cod_servicio`),
  ADD UNIQUE KEY `nom` (`nom_servicio`(10));

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id_subcategorias`);

--
-- Indices de la tabla `sub_tipo`
--
ALTER TABLE `sub_tipo`
  ADD PRIMARY KEY (`id_sub_tipo`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `tarjeta_responsabilidad`
--
ALTER TABLE `tarjeta_responsabilidad`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `tmp`
--
ALTER TABLE `tmp`
  ADD PRIMARY KEY (`id_tmp`);

--
-- Indices de la tabla `tmp1`
--
ALTER TABLE `tmp1`
  ADD PRIMARY KEY (`id_tmp`);

--
-- Indices de la tabla `tmp_descarga_tarjeta`
--
ALTER TABLE `tmp_descarga_tarjeta`
  ADD PRIMARY KEY (`id_tmp`);

--
-- Indices de la tabla `und`
--
ALTER TABLE `und`
  ADD PRIMARY KEY (`id_und`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id_asistencia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `baja_sunat`
--
ALTER TABLE `baja_sunat`
  MODIFY `id_baja` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_caja` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cambio`
--
ALTER TABLE `cambio`
  MODIFY `id_cambio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;
--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2963;
--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `id_factura` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT de la tabla `detalle_tarjeta`
--
ALTER TABLE `detalle_tarjeta`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id_documento` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `documentos_electronicos`
--
ALTER TABLE `documentos_electronicos`
  MODIFY `id_doc` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `factura_carrito`
--
ALTER TABLE `factura_carrito`
  MODIFY `id_factura1` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id_foto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `fotos1`
--
ALTER TABLE `fotos1`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `globales`
--
ALTER TABLE `globales`
  MODIFY `id_global` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `guia`
--
ALTER TABLE `guia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ingresosegresos`
--
ALTER TABLE `ingresosegresos`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `laborales`
--
ALTER TABLE `laborales`
  MODIFY `id_laboral` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pack`
--
ALTER TABLE `pack`
  MODIFY `id_pack` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `programas_facturas`
--
ALTER TABLE `programas_facturas`
  MODIFY `id_Programa_Factura` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `id_puesto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `resumen_documentos`
--
ALTER TABLE `resumen_documentos`
  MODIFY `id_resumen` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `saldos`
--
ALTER TABLE `saldos`
  MODIFY `id_saldo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id_subcategorias` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sub_tipo`
--
ALTER TABLE `sub_tipo`
  MODIFY `id_sub_tipo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tarjeta_responsabilidad`
--
ALTER TABLE `tarjeta_responsabilidad`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `tmp1`
--
ALTER TABLE `tmp1`
  MODIFY `id_tmp` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tmp_descarga_tarjeta`
--
ALTER TABLE `tmp_descarga_tarjeta`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `und`
--
ALTER TABLE `und`
  MODIFY `id_und` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `id_unidad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int(12) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

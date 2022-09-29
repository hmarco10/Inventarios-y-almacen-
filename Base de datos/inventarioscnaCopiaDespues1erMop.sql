-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-08-2021 a las 19:31:46
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
(290, 'Byron Castillo Casasola', '135', '55555', 'Unidad de Recursos Humanos', 1, '2021-03-30 14:20:18', '14514787885', '0', '', 'Peru', '', '', '', '', 1, 1, 0, '0.00', '0.00', '14514787885'),
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
(2980, 100, '102', '2020-12-31', '2021-01-31', '1', '', 'AMBIENTAL EN SPRAY');

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
(1, '', '', '', '', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(2, '', '', '', '', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(3, '', '', '', '', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(4, '', '', '', '', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(5, '', '', '', '', 'Ubicacion 1', '', '0000-00-00 00:00:00');

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
(1, '0', '2020-12-31 00:00:00', '0', '', 0, '0', 6, 1, '800.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 14:17:06', 0, '', 2, '', 0, '', 0),
(2, '0', '2020-12-31 00:00:00', '0', '', 0, '0', 6, 1, '1840.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 15:23:48', 0, '', 2, '', 0, '', 0),
(3, '0', '2020-12-31 00:00:00', '0', '', 0, '0', 6, 1, '181.5000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 15:26:21', 0, '', 2, '', 0, '', 0),
(4, '0', '2020-12-31 00:00:00', '0', '', 0, '0', 6, 1, '544.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 15:29:26', 0, '', 2, '', 0, '', 0),
(5, '0', '2020-12-31 00:00:00', '0', '', 0, '0', 6, 1, '995.0200', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 15:32:32', 0, '', 2, '', 0, '', 0);

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
(1, 0, 6, 0, '2', '214', '2000', 0, 0, '0.4000', 1, 1, 2, '2020-12-31 00:00:00', '0.00', 1, '0.00', '1.00', '', 'ALA-002', '122', '', '', ''),
(2, 0, 6, 0, '2', '215', '2000', 0, 0, '0.9200', 1, 1, 2, '2020-12-31 00:00:00', '0.00', 1, '0.00', '1.00', '', 'AMC-002', '122', '', '', ''),
(3, 0, 6, 0, '2', '103', '66', 0, 0, '2.7500', 1, 1, 2, '2020-12-31 00:00:00', '0.00', 1, '0.00', '1.00', '', 'API-002', '292', '', '', ''),
(4, 0, 6, 0, '2', '102', '32', 0, 0, '17.0000', 1, 1, 2, '2020-12-31 00:00:00', '0.00', 1, '0.00', '1.00', '', 'AS-002', '292', '', '', ''),
(5, 0, 6, 0, '2', '216', '89', 0, 0, '11.1800', 1, 1, 2, '2020-12-31 00:00:00', '0.00', 1, '0.00', '1.00', '', 'ATC-002', '244', '', '', '');

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
(1, 'AP-002', 'AGUA PURIFICADA', 1, '2021-05-11 10:07:58', '0.0000', '0.0000', '1.00', 1, '80', 'AGUA PURIFICADA EN GARRAFÃ“N ', 'AGUA PURIFICADA EN PRESENTACION DE GARRAFO DE 18.9 (ENVASE EN CALIDAD DE PRESTAMO)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(2, 'TPVC-002', 'TARJETAS PVC TERMICAS', 1, '2021-05-11 10:19:32', '0.0000', '0.0000', '1.00', 1, '300', 'TARJETAS PVC TERMICAS COLOR BLANCO', 'TARJETAS PVC TERMICAS COLOR BLANCO', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(3, 'KITR-002', 'KIT DE REPUESTOS TONER', 1, '2021-05-11 10:29:18', '0.0000', '0.0000', '1.00', 1, '2', 'KIT DE REPUESTOS TONER (RIBBON YMCKO DE 250 IMÃGE', 'KIT DE REPUESTOS TONER (RIBBON YMCKO DE 250 IMÃGENES)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(4, 'FGH-002', 'FUNDAS PARA GAFETES HORIZONTALES', 1, '2021-05-11 10:34:59', '0.0000', '0.0000', '1.00', 1, '250', 'FUNDAS PARA GAFETES HORIZONTALES', 'FUNDAS PARA GAFETES HORIZONTALES', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(5, 'SHBA-002', 'SELLO DE HULE CON BASE AUTOMÃTICA', 1, '2021-05-11 10:36:24', '0.0000', '0.0000', '1.00', 1, '10', 'SELLO DE HULE CON BASE AUTOMÃTICA', 'SELLO DE HULE CON BASE AUTOMÃTICA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(6, 'BL-002', 'BOMBILLA LED', 1, '2021-05-11 10:41:43', '0.0000', '0.0000', '1.00', 1, '5', 'BOMBILLA LED CLASICA 15W', 'BOMBILLA LED CLASICA 15W', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(7, 'EMB-002', 'EXTENSION MULTIPLE DE BARRA', 1, '2021-05-11 10:44:38', '0.0000', '0.0000', '1.00', 1, '5', 'EXTENSION MULTIPLE DE BARRA', 'EXTENSION MULTIPLE DE BARRA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(8, 'BA-002', 'BOTE DE ACEITE', 1, '2021-05-12 08:35:43', '0.0000', '0.0000', '1.00', 1, '5', 'BOTE DE ACEITE DE USOS MULTIPES', 'BOTE DE ACEITE DE USOS MULTIPES 3 EN 1, 5.5 ONZAS', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(9, 'JD-002', 'JUEGO DE DESTORNILLADORES', 1, '2021-05-12 08:38:28', '0.0000', '0.0000', '1.00', 1, '5', 'JUEGO DE DESTORNILLADORES', 'JUEGO DE DESTORNILLADORES', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(10, 'BG-002', 'BOTE DE GRASA', 1, '2021-05-12 08:39:20', '0.0000', '0.0000', '1.00', 1, '5', 'BOTE DE GRASA', 'BOTE DE GRASA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(11, 'CCR-002', 'CAJA DE CARTON REFORZADA', 1, '2021-05-12 08:55:31', '0.0000', '0.0000', '1.00', 1, '40', 'CAJA DE CARTON REFORZADAS ESPECIALES PARA ARCHIVO.', 'CAJA DE CARTON REFORZADA ESPECIAL PARA ARCHIVO, CON TAPADERA INDEPENDIENTE. MEDIDAS: LARGO 42.5 CMS, ANCHO 33.5 CMS, ALTO 26.5 CMS', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(12, 'RPBO-002', 'RESMA DE PAPEL BOND TAMAÃ‘O OFICIO', 1, '2021-05-12 09:00:36', '0.0000', '0.0000', '1.00', 1, '300', 'RESMA DE PAPEL BOND 75 GRAMOS TAMAÃ‘O OFICIO', 'RESMA DE PAPEL BOND 75 GRAMOS TAMAÃ‘O OFICIO', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '80.00'),
(13, 'GAE-002', 'GALON DE ALCOHOL ETILICO ', 1, '2021-05-12 09:18:52', '0.0000', '0.0000', '1.00', 1, '40', 'GALON DE ALCOHOL ETILICO AL 95%', 'GALON DE ALCOHOL ETILICO AL 95%', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(14, 'RPH-002', 'ROLLO DE PAPEL HIGIENICO', 1, '2021-05-12 09:36:07', '0.0000', '0.0000', '1.00', 1, '200', 'ROLLO PAPEL HIGIENICO INSTITUCIONAL DE 9cm X 500mt', 'ROLLO DE PAPEL HIGIENICO INSTITUCIONAL DE 9 CM. X 500 MTS.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '60.00'),
(15, 'TCK-002', 'TEA CUIDA KIT 25 CORRECCIONES (PIN, HR)', 1, '2021-05-12 09:52:00', '0.0000', '0.0000', '1.00', 1, '10', 'TEA CUIDA KIT 25 CORRECCIONES (PIN, HR)', 'TEA CUIDA KIT 25 CORRECCIONES (PIN, HR)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(16, 'GAC-002', 'GALON DE AMONIO', 1, '2021-05-12 09:55:11', '0.0000', '0.0000', '1.00', 1, '40', 'GALON DE AMONIO CUATERNARIO 5TA. GENERACION', 'GALON DE AMONIO CUATERNARIO 5TA. GENERACION', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(17, 'RTS-002', 'ROLLO DE TOALLA SECAMANO', 1, '2021-05-12 10:03:34', '0.0000', '0.0000', '1.00', 1, '250', 'ROLLO DE TOALLA SECAMANO', 'ROLLO DE TOALLA SECAMANO DE 240 METROS', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '60.00'),
(18, 'TN-002', 'TIMBRES NOTARIALES', 1, '2021-05-12 10:11:20', '0.0000', '0.0000', '1.00', 1, '100', 'TIMBRES NOTARIALES DE Q10.00', 'TIMBRES NOTARIALES DE Q10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(19, 'TF-002', 'TIMBRES FISCALES', 1, '2021-05-12 10:12:53', '0.0000', '0.0000', '1.00', 1, '100', 'TIMBRES FISCALES DE Q5.00', 'TIMBRES FISCALES DE Q5.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(20, 'FA-002', 'FOLIADORA AUTOMATICA', 1, '2021-05-12 10:20:38', '0.0000', '0.0000', '1.00', 1, '10', 'FOLIADORA (NUMERADORA) AUTOMATICA DE 6 DIGITOS', 'FOLIADORA (NUMERADORA) AUTOMATICA DE 6 DIGITOS', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(21, 'HTON-002', 'HOJAS TAMAÃ‘O OFICIO COLOR NARANJA', 1, '2021-05-12 10:22:28', '0.0000', '0.0000', '1.00', 1, '300', 'HOJAS TAMAÃ‘O OFICIO COLOR NARANJA', 'HOJAS TAMAÃ‘O OFICIO COLOR NARANJA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(22, 'HTOA-002', 'HOJAS TAMAÃ‘O OFICIO COLOR AMARILLO', 1, '2021-05-12 10:25:08', '0.0000', '0.0000', '1.00', 1, '300', 'HOJAS TAMAÃ‘O OFICIO COLOR AMARILLO', 'HOJAS TAMAÃ‘O OFICIO COLOR AMARILLO', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(23, 'CAP-002', 'CAJA DE ALFILER PARA PIZARRA', 1, '2021-05-12 10:27:24', '0.0000', '0.0000', '1.00', 1, '10', 'CAJA DE ALFILER PARA PIZARRA (100 U.)', 'CAJA DE ALFILER PARA PIZARRA (100 U.)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(24, 'FPTO-002', 'FUNDAS PLASTICAS TAMAÃ‘O OFICIO', 1, '2021-05-12 10:38:16', '0.0000', '0.0000', '1.00', 1, '200', 'FUNDAS PLASTICAS TAMAÃ‘O OFICIO (BOLSA)', 'FUNDAS PLASTICAS TAMAÃ‘O OFICIO (BOLSA)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(25, 'EP-002', 'ESPIRALES PLASTICOS DE 3/8\"', 1, '2021-05-14 09:29:10', '0.0000', '0.0000', '1.00', 1, '20', 'ESPIRALES PLASTICOS DE 3/8\"', 'ESPIRALES PLASTICOS DE 3/8\"', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(26, 'CE505-002', 'TONER HP CE505A NEGRO', 1, '2021-05-14 09:34:17', '0.0000', '0.0000', '1.00', 1, '3', 'TONER HP CE505A NEGRO', 'TONER HP CE505A NEGRO', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(27, 'EPR-002', 'EXTENSION POLARIZADA', 1, '2021-05-14 11:19:52', '0.0000', '0.0000', '1.00', 1, '5', 'EXTENSION POLARIZADA DE USO RUDO 15 M.', 'EXTENSION POLARIZADA DE USO RUDO 15 M.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(28, 'C8X4K-002', 'CAJA KRAFT 8 X 4 ', 1, '2021-05-14 11:23:34', '0.0000', '0.0000', '1.00', 1, '150', 'CAJA KRAFT 8 X 4 ', 'CAJA KRAFT 8 X 4 ', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(29, 'HOTC-002', 'HOJAS OPALINA TAMAÃ‘O CARTA', 1, '2021-05-14 11:32:59', '0.0000', '0.0000', '1.00', 1, '150', 'HOJAS OPALINA TAMAÃ‘O CARTA', 'HOJAS OPALINA TAMAÃ‘O CARTA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(30, 'MPG-002', 'MOLDURAS PARA GRADAS', 1, '2021-05-14 11:42:22', '0.0000', '0.0000', '1.00', 1, '5', 'MOLDURAS PARA GRADAS', 'MOLDURAS PARA GRADAS', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(31, 'PP-002', 'PELOTA PLASTICA', 1, '2021-05-14 11:45:54', '0.0000', '0.0000', '1.00', 1, '150', 'PELOTAS PLASTICAS (JUGUETES EN GENERAL)', 'PELOTAS PLASTICAS (JUGUETES EN GENERAL)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(32, 'BTG-002', 'BOLIGRAFO DE TINTA GEL', 1, '2021-05-14 11:49:07', '0.0000', '0.0000', '1.00', 1, '5', 'BOLIGRAFO DE TINTA GEL', 'BOLIGRAFO DE TINTA GEL', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(33, 'BLTH-002', 'BATERIA LTH DE 19 PLACAS', 1, '2021-05-14 11:52:05', '0.0000', '0.0000', '1.00', 1, '5', 'BATERIA LTH DE 19 PLACAS, PARA VEHICULO DE GASOLIN', 'BATERIA LTH DE 19 PLACAS, LIBRE DE MANTENIMIENTO, PARA VEHICULO DE GASOLINA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(34, 'CM-002', 'CAFÃ‰ MOLIDO', 1, '2021-05-18 08:30:10', '0.0000', '0.0000', '1.00', 1, '200', 'BOLSA DE CAFÃ‰ MOLIDO POR LIBRA 454 GRS.', 'BOLSA DE CAFÃ‰ MOLIDO POR LIBRA 454 GRS.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '30.00'),
(35, 'CR-002', 'CAJA DE RECINA EPÃ“XICA', 1, '2021-05-18 08:33:07', '0.0000', '0.0000', '1.00', 1, '5', 'CAJA DE RECINA EPÃ“XICA', 'CAJA DE RECINA EPÃ“XICA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(36, 'BT-002', 'BOLSA DE TORNILLOS', 1, '2021-05-18 08:35:02', '0.0000', '0.0000', '1.00', 1, '5', 'BOLSA DE TORNILLOS (50 UN.)', 'BOLSA DE TORNILLOS (50 UN.)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(37, 'PD-022', 'PLANTAS DECORATIVAS', 1, '2021-05-18 08:36:50', '0.0000', '0.0000', '1.00', 1, '100', 'PLANTAS DECORATIVAS PEQUEÃ‘AS', 'PLANTAS DECORATIVAS PEQUEÃ‘AS', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(38, 'BP-002', 'BATERIA Probook 450 G3', 1, '2021-05-18 08:39:14', '0.0000', '0.0000', '1.00', 1, '10', 'BATERIA DE Li-ion marca HP, Probook 450 G3', 'BATERIA DE Li-ion marca HP, Probook 450 G3', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(39, 'BDL-002', 'BATERIA HP, 250 G1', 1, '2021-05-18 08:50:50', '0.0000', '0.0000', '1.00', 1, '5', 'BATERIA DE Li-ion marca HP, 250 G1', 'BATERIA DE Li-ion marca HP, 250 G1', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(40, 'RE-002', 'REGLETA ELECTRICA', 1, '2021-05-19 15:18:36', '0.0000', '0.0000', '1.00', 1, '5', 'REGLETA ELECTRICA', 'REGLETA ELECTRICA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 2, '', '0.00', '1.00'),
(41, 'SPI-002', 'SAPO PARA INODORO', 1, '2021-05-19 15:20:20', '0.0000', '0.0000', '1.00', 1, '5', 'SAPO PARA INODORO', 'SAPO PARA INODORO', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(42, 'ML-002', 'MEZCLADORA PARA LAVAMANOS', 1, '2021-05-19 15:22:18', '0.0000', '0.0000', '1.00', 1, '5', 'MEZCLADORA PARA LAVAMANOS', 'MEZCLADORA PARA LAVAMANOS', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(43, 'LRL-002', 'LLAVE LAVAMANOS', 1, '2021-05-19 15:24:13', '0.0000', '0.0000', '1.00', 1, '5', 'LLAVE DE ROSCA PARA LAVAMANOS', 'LLAVE DE ROSCA PARA LAVAMANOS', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(44, 'TI-002', 'TAPADERA DE INODORO', 1, '2021-05-24 14:27:42', '0.0000', '0.0000', '1.00', 1, '1', 'TAPADERA DE INODORO', 'TAPADERA DE INODORO', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(45, 'CP-002', 'CHAPA PARA PUERTA', 1, '2021-05-24 14:31:15', '0.0000', '0.0000', '1.00', 1, '5', 'CHAPA PARA PUERTA', 'CHAPA PARA PUERTA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(46, 'KCTI-002', 'KIT COMPLETO PARA TANQUE DE INODORO', 1, '2021-05-24 14:44:28', '0.0000', '0.0000', '1.00', 1, '5', 'KIT COMPLETO PARA TANQUE DE INODORO', 'KIT COMPLETO PARA TANQUE DE INODORO', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(47, 'MP-002', 'MARCO PLASTICO', 1, '2021-05-24 14:45:24', '0.0000', '0.0000', '1.00', 1, '5', 'MARCO PLASTICO', 'MARCO PLASTICO', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(48, 'CCB-002', 'CAJA DE MASCARILLAS', 1, '2021-05-24 15:10:29', '0.0000', '0.0000', '1.00', 1, '5', 'Caja de cubre bocas (mascarillas) 50un', 'Caja de cubre bocas (mascarillas) 50un', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(49, 'ML-001', 'MEMORIA DE LABORES CNA 2020', 1, '2021-05-24 15:38:09', '0.0000', '0.0000', '1.00', 1, '5', 'MEMORIA DE LABORES CNA 2020', 'servicio de impresiÃ³n litogrÃ¡fica de ejemplares del documento memoria de labores CNA 2020 del consejo nacional de adopciones, tamaÃ±o carta, portada full color, tiro y tiro, papel couche 100 laminado en frio, 60 pÃ¡ginas interiores en papel couche 80 brillante (tiro y retiro), aplicaciÃ³n de barniz UV brillante, lomo cuadrado', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(50, 'EF-002', 'ESPUMA PARA FLORES NATURALES (OASIS)', 1, '2021-05-24 15:41:33', '0.0000', '0.0000', '1.00', 1, '10', 'ESPUMA PARA FLORES NATURALES (OASIS)', 'Espuma para flores naturales (oasis)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(51, 'RA-002', 'ROLLO DE ALAMBRE', 1, '2021-05-24 15:46:33', '0.0000', '0.0000', '1.00', 1, '5', 'ROLLO DE ALAMBRE', 'Rollo de alambre', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(52, 'PPK-002', 'PLIEGO PAPEL KRAFT GRUESO', 1, '2021-05-24 15:52:38', '0.0000', '0.0000', '1.00', 1, '20', 'PLIEGO PAPEL KRAFT GRUESO', 'Pliego papel kraft grueso', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(53, 'GR-002', 'GOMA RESISTOL (1/8 GALON)', 1, '2021-05-24 15:56:24', '0.0000', '0.0000', '1.00', 1, '5', 'GOMA RESISTOL (1/8 GALON)', 'Goma resistol (1/8 galon)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(54, 'CT-002', 'CAJA DE TEMPERAS DE 6 COLORES C/U', 1, '2021-05-24 16:00:01', '0.0000', '0.0000', '1.00', 1, '5', 'CAJA DE TEMPERAS DE 6 COLORES C/U', 'Caja de temperas de 6 colores c/u', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(55, 'P-002', 'PINCEL No. 3', 1, '2021-05-24 16:02:22', '0.0000', '0.0000', '1.00', 1, '5', 'PINCEL No. 3', 'Pincel no. 3', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(56, 'V-002', 'VELADORA', 1, '2021-05-24 16:03:44', '0.0000', '0.0000', '1.00', 1, '10', 'VELADORA', 'Veladora', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(57, 'A-002', 'ATOMIZADOR', 1, '2021-05-24 16:07:27', '0.0000', '0.0000', '1.00', 1, '10', 'ATOMIZADOR', 'Atomizador', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(58, 'ATO-002', 'ARCHIVADORES TAMAÃ‘O OFICIO', 1, '2021-05-25 08:28:48', '0.0000', '0.0000', '1.00', 1, '250', 'ARCHIVADORES TAMAÃ‘O OFICIO', 'Archivadores tamaÃ±o oficio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(59, 'BPD-002', 'BANDERITAS P/SEÃ‘ALAR DOCUMENTOS', 1, '2021-05-25 09:51:34', '0.0000', '0.0000', '1.00', 1, '150', 'BANDERITAS P/SEÃ‘ALAR DOCUMENTOS', 'Banderitas p/seÃ±alar documentos', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '40.00'),
(60, 'BPG-002', 'BARRAS PEQUEÃ‘AS GOMA PRITT', 1, '2021-05-27 17:04:29', '0.0000', '0.0000', '1.00', 1, '50', 'BARRAS PEQUEÃ‘AS GOMA PRITT', 'Barras pequeÃ±as goma pritt', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(61, 'B-002', 'BORRADOR', 1, '2021-07-02 11:12:17', '0.0000', '0.0000', '1.00', 1, '40', 'Borrador ', 'Borrador', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(62, 'CCJ-002', 'CAJA DE CLIPS JUMBO', 1, '2021-07-02 11:16:33', '0.0000', '0.0000', '1.00', 1, '40', 'Caja de clips jumbo', 'Caja de clips jumbo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 2, '', '0.00', '5.00'),
(63, 'CCS-002', 'CAJA DE CLIPS STANDARD', 1, '2021-07-02 11:37:30', '0.0000', '0.0000', '1.00', 1, '40', 'Caja de clips standard', 'Caja de clips standard', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 2, '', '0.00', '5.00'),
(64, 'CGS-002', 'CAJA DE GRAPAS STANDARD', 1, '2021-07-02 11:39:08', '0.0000', '0.0000', '1.00', 1, '40', 'Caja de grapas standard', 'Caja de grapas standard', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 2, '', '0.00', '5.00'),
(65, 'CAT2-002', 'CINTA ADHESIVA TRANSPARENTE 2\"', 1, '2021-07-02 11:45:32', '0.0000', '0.0000', '1.00', 1, '10', 'Cinta adhesiva transparente 2\"', 'Cinta adhesiva transparente 2\"', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(66, 'CAT3-002', 'CINTA ADHESIVA TRANSPARENTE 3\"', 1, '2021-07-02 11:48:32', '0.0000', '0.0000', '1.00', 1, '10', 'Cinta adhesiva transparente 3\"', 'Cinta adhesiva transparente 3\"', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(67, 'CE1-002', 'CUADERNO EMPASTADO 100 hjs.', 1, '2021-07-02 12:02:53', '0.0000', '0.0000', '1.00', 1, '20', 'Cuaderno empastado 100 hjs.', 'Cuaderno empastado 100 hjs.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(68, 'CE2-002', 'CUADERNO EMPASTADO 200 hjs.', 1, '2021-07-02 12:03:53', '0.0000', '0.0000', '1.00', 1, '20', 'Cuaderno empastado 200 hjs.', 'Cuaderno empastado 200 hjs.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(69, 'CU-002', 'CUADERNO UNIVERSITARIO (100 hojas)', 1, '2021-07-02 12:15:19', '0.0000', '0.0000', '1.00', 1, '20', 'Cuaderno Universitario (100 Hojas)', 'Cuaderno Universitario (100 Hojas)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(70, 'CFG-002', 'CUENTAFACIL GLICERINA', 1, '2021-07-02 12:17:40', '0.0000', '0.0000', '1.00', 1, '20', 'Cuentafacil glicerina', 'Cuentafacil glicerina', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(71, 'C-002', 'CUCHILLAS', 1, '2021-07-02 12:19:25', '0.0000', '0.0000', '1.00', 1, '20', 'Cuchilla', 'Cuchilla', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(72, 'EN-002', 'ENGRAPADORA', 1, '2021-07-02 12:20:55', '0.0000', '0.0000', '1.00', 1, '20', 'Engrapadora', 'Engrapadora', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(73, 'FP-002', 'FASTENER PLASTICOS COLORES', 1, '2021-07-02 12:31:04', '0.0000', '0.0000', '1.00', 1, '60', 'Fastenes PlÃ¡sticos colores (PresentaciÃ³n Cja 1X5', 'Fastenes PlÃ¡sticos colores (PresentaciÃ³n Cja 1X50 un.)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 2, '', '0.00', '5.00'),
(74, 'FCO-002', 'FOLDER COLGANTE TAMAÃ‘O OFICIO', 1, '2021-07-02 12:33:47', '0.0000', '0.0000', '1.00', 1, '500', 'Folder colgante tamaÃ±o oficio (caja 1x50 un.)', 'Folder colgante tamaÃ±o oficio (caja 1x50 un.)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(75, 'FMO-002', 'FOLDER MANILA TAMAÃ‘O OFICIO', 1, '2021-07-02 12:37:20', '0.0000', '0.0000', '1.00', 1, '1500', 'Folder manila tamaÃ±o oficio', 'Folder manila tamaÃ±o oficio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '40.00'),
(76, 'FMC-002', 'FOLDER MANILA TAMAÃ‘O CARTA', 1, '2021-07-02 12:39:04', '0.0000', '0.0000', '1.00', 1, '800', 'Folder manila tamaÃ±o carta', 'Folder manila tamaÃ±o carta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(77, 'LA-002', 'LAPIZ', 1, '2021-07-02 12:41:00', '0.0000', '0.0000', '1.00', 1, '200', 'LÃ¡piz', 'LÃ¡piz', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(78, 'LCA-002', 'LAPICERO TINTA COLOR AZUL', 1, '2021-07-02 12:48:03', '0.0000', '0.0000', '1.00', 1, '200', 'Lapicero tinta color azul', 'Lapicero tinta color azul', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(79, 'LT-002', 'LIBRETA DE TAQUIGRAFIA', 1, '2021-07-02 12:50:01', '0.0000', '0.0000', '1.00', 1, '30', 'Libreta de taquigrafÃ­a', 'Libreta de taquigrafÃ­a', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(80, 'MTR11/2', 'MASKING TAPE POR ROLLO 1 1/2\"', 1, '2021-07-02 12:53:04', '0.0000', '0.0000', '1.00', 1, '10', 'Masking tape por rollo 1 1/2\"', 'Masking tape por rollo 1 1/2\"', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(81, 'MTR2-002', 'MASKING TAPE POR ROLLO 2\"', 1, '2021-07-02 12:55:04', '0.0000', '0.0000', '1.00', 1, '10', 'Masking tape por rollo 2\"', 'Masking tape por rollo 2\"', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(82, 'MTR3-002', 'MASKING TAPE POR ROLLO 3', 1, '2021-07-02 12:56:37', '0.0000', '0.0000', '1.00', 1, '10', 'Masking tape por rollo 3', 'Masking tape por rollo 3', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(83, 'NAG-002', 'NOTAS ADHESIVAS GRANDES (3x5', 1, '2021-07-02 13:00:54', '0.0000', '0.0000', '1.00', 1, '40', 'Block de notas adhesivas grandes (3x5', 'Block de notas adhesivas grandes (3x5', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(84, 'NAM-002', 'NOTAS ADHESIVAS MEDIANAS (3X3\")', 1, '2021-07-02 13:05:23', '0.0000', '0.0000', '1.00', 1, '40', 'Block de notas adhesivas medianas (3x3\")', 'Block de notas adhesivas medianas (3x3\")', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(85, 'NAP-002', 'NOTAS ADHESIVAS PEQUEÃ‘AS (1.5X2\")', 1, '2021-07-02 13:07:50', '0.0000', '0.0000', '1.00', 1, '40', 'Block de notas adhesivas pequeÃ±as (1.5x2\")', 'Block de notas adhesivas pequeÃ±as (1.5x2\")', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(86, 'PE-002', 'PERFORADOR ESTÃNDAR', 1, '2021-07-02 13:22:24', '0.0000', '0.0000', '1.00', 1, '10', 'Perforador estÃ¡ndar', 'Perforador estÃ¡ndar', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(87, 'RES-002', 'RESALTADORES', 1, '2021-07-02 13:23:55', '0.0000', '0.0000', '1.00', 1, '60', 'Resaltadores', 'Resaltadores', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(88, 'RP-002', 'REGLA PLASTICA DE 30 CMS.', 1, '2021-07-02 13:25:31', '0.0000', '0.0000', '1.00', 1, '10', 'Regla plÃ¡stica de 30 cms.', 'Regla plÃ¡stica de 30 cms.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(89, 'SAC-002', 'SACAPUNTAS', 1, '2021-07-02 13:28:09', '0.0000', '0.0000', '1.00', 1, '30', 'Sacapuntas', 'Sacapuntas', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(90, 'SG-002', 'SACAGRAPAS', 1, '2021-07-02 15:11:04', '0.0000', '0.0000', '1.00', 1, '10', 'Sacagrapas', 'Sacagrapas', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(91, 'SCC-002', 'SEPARADORES CARTA PQ.5 UN.', 1, '2021-07-02 15:16:14', '0.0000', '0.0000', '1.00', 1, '60', 'Separadores cartapacio carta pq.5 un.', 'Separadores cartapacio carta pq.5 un.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(92, 'SCO-002', 'SEPARADORES OFICIO PQ.5 UN.', 1, '2021-07-02 15:19:02', '0.0000', '0.0000', '1.00', 1, '80', 'Separadores cartapacio oficio pq.5 un.', 'Separadores cartapacio oficio pq.5 un.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(93, 'SMO-002', 'SOBRE MANILA OFICIO', 1, '2021-07-02 15:20:23', '0.0000', '0.0000', '1.00', 1, '500', 'Sobre manila tamaÃ±o oficio', 'Sobre manila tamaÃ±o oficio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(95, 'SP1-002', 'SUJETAPAPEL 1\"', 1, '2021-07-02 15:25:37', '0.0000', '0.0000', '1.00', 1, '80', 'Sujetapapel 1\"', 'Sujetapapel 1\"', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(96, 'SP2-002', 'SUJETAPAPEL 2\"', 1, '2021-07-02 15:29:05', '0.0000', '0.0000', '1.00', 1, '80', 'Sujetapapel 2\"', 'Sujetapapel 2\"', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(97, 'TMR-002', 'TAPE MAGICO', 1, '2021-07-02 15:31:31', '0.0000', '0.0000', '1.00', 1, '80', 'Tape mÃ¡gico por rollo (18 mm x 25 m)', 'Tape mÃ¡gico por rollo (18 mm x 25 m)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(98, 'PM-002', 'PAPELERA METALICA', 1, '2021-07-02 15:33:38', '0.0000', '0.0000', '1.00', 1, '5', 'Papelera metÃ¡lica 3 niveles', 'Papelera metÃ¡lica 3 niveles', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(99, 'TRS-002', 'TINTA COLOR ROJA PARA SELLOS', 1, '2021-07-08 08:52:05', '0.0000', '0.0000', '1.00', 1, '10', 'TINTA COLOR ROJA PARA SELLOS', 'Tinta color roja para sellos', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '3.00'),
(100, 'TNS-002', 'TINTA COLOR NEGRA PARA SELLOS', 1, '2021-07-08 08:54:57', '0.0000', '0.0000', '1.00', 1, '10', 'TINTA COLOR NEGRA PARA SELLOS', 'Tinta color negra para sellos', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '3.00'),
(101, 'MPP-002', 'MARCADOR TINTA COLOR NEGRO PARA PIZARRA', 1, '2021-07-08 08:55:37', '0.0000', '0.0000', '1.00', 1, '10', 'MARCADOR TINTA COLOR NEGRO PARA PIZARRA', 'Marcador tinta color negro para pizarra', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '073717622888', '0.00', '3.00'),
(102, 'AS-002', 'AMBIENTAL EN SPRAY', 1, '2021-07-08 08:57:40', '0.0000', '17.0000', '1.00', 1, '60', 'AMBIENTAL EN SPRAY', 'Ambiental en spray', '32.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(103, 'API-002', 'AMBIENTAL PASTILLA PARA INODORO', 1, '2021-07-08 09:01:12', '0.0000', '2.7500', '1.00', 1, '60', 'AMBIENTAL PASTILLA PARA INODORO', 'Ambiental pastilla para inodoro', '66.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '12.00'),
(104, 'AM-002', 'AZUCAR Morena (Bolsa de 2000 grs.)', 1, '2021-07-20 08:40:22', '0.0000', '0.0000', '1.00', 1, '70', 'AzÃºcar morena (bolsa de 2000 grs.)', 'AzÃºcar morena (bolsa de 2000 grs.)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '15.00'),
(105, 'BEB-002', 'BOLSA EXTRA GRANDE PARA BASURA PAQ.1X10 UN.', 1, '2021-07-20 08:42:16', '0.0000', '0.0000', '1.00', 1, '70', 'Bolsa extra grande para basura paq.1x10 un.', 'Bolsa extra grande para basura paq.1x10 un.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(106, 'BGB-002', 'BOLSA GRANDE PARA BASURA PAQ.1X10 UN.', 1, '2021-07-20 08:43:43', '0.0000', '0.0000', '1.00', 1, '70', 'Bolsa grande para basura paq.1x10 un.', 'Bolsa grande para basura paq.1x10 un.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '15.00'),
(107, 'BPB-002', 'BOLSA PEQUEÃ‘A PARA BASURA PAQ. 1X10 UN.', 1, '2021-07-20 08:45:03', '0.0000', '0.0000', '1.00', 1, '70', 'Bolsa pequeÃ±a para basura paq. 1x10 un.', 'Bolsa pequeÃ±a para basura paq. 1x10 un.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '15.00'),
(108, 'BLP-002', 'BOTE DE LIMPIADOR EN POLVO DE 600 gramos', 1, '2021-07-20 08:47:10', '0.0000', '0.0000', '1.00', 1, '40', 'Bote de limpiador en polvo de 600 gramos (tipo aja', 'Bote de limpiador en polvo de 600 gramos (tipo ajax)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(109, 'CF-002', 'CREMORA EN FRASCO DE 23 ONZ.', 1, '2021-07-20 08:51:41', '0.0000', '0.0000', '1.00', 1, '5', 'Cremora en frasco de 23 onz.', 'Cremora en frasco de 23 onz.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2022-07-22', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(110, 'BD-002', 'BOLSA DETERGENTE 1000 GRS.', 1, '2021-07-20 09:08:12', '0.0000', '0.0000', '1.00', 1, '60', 'Bolsa detergente 1000 grs.', 'Bolsa detergente 1000 grs.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(111, 'CTE-002', 'CAJA DE TE', 1, '2021-07-20 09:16:15', '0.0000', '0.0000', '1.00', 1, '20', 'Caja de te', 'Caja de te', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-11-29', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '3.00'),
(112, 'CPI-002', 'CEPILLO PARA INODORO', 1, '2021-07-20 09:17:59', '0.0000', '0.0000', '1.00', 1, '10', 'Cepillo para inodoro', 'Cepillo para inodoro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(113, 'ELT-002', 'ESPONJA VERDE LAVATRASTOS', 1, '2021-07-20 09:26:52', '0.0000', '0.0000', '1.00', 1, '10', 'Esponja verde lavatrastos', 'Esponja verde lavatrastos', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(114, 'GC-002', 'GALON DE CLORO', 1, '2021-07-20 09:28:32', '0.0000', '0.0000', '1.00', 1, '30', 'GalÃ³n de cloro', 'GalÃ³n de cloro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(115, 'GD-002', 'GALON DE DESINFECTANTE', 1, '2021-07-20 09:31:09', '0.0000', '0.0000', '1.00', 1, '30', 'GalÃ³n de desinfectante', 'GalÃ³n de desinfectante', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-10-21', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(116, 'LM-002', 'LIMPIADOR DE MICROFIBRA', 1, '2021-07-20 09:32:39', '0.0000', '0.0000', '1.00', 1, '30', 'Limpiador de microfibra', 'Limpiador de microfibra', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(117, 'PCP-002', 'PAQUETE DE CUCHARITAS PLASTICAS', 1, '2021-07-20 09:38:06', '0.0000', '0.0000', '1.00', 1, '60', 'Paquete de cucharitas plÃ¡sticas de 25 un.', 'Paquete de cucharitas plÃ¡sticas de 25 un.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(118, 'PVD-002', 'PAQUETE VASOS DESECHABLES', 1, '2021-07-20 09:42:08', '0.0000', '0.0000', '1.00', 1, '70', 'Paquete vasos desechables (1x25 un.)', 'Paquete vasos desechables (1x25 un.)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(119, 'PPD-002', 'PAQUETE PLATO DESECHABLE', 1, '2021-07-20 09:43:52', '0.0000', '0.0000', '1.00', 1, '70', 'Paquete plato desechable paq.de 25 un.', 'Paquete plato desechable paq.de 25 un.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(120, 'PTP', 'PAQUETE TENEDORES PLÃSTICOS', 1, '2021-07-20 09:45:36', '0.0000', '0.0000', '1.00', 1, '70', 'Paquete tenedores plÃ¡sticos de (1x25)', 'Paquete tenedores plÃ¡sticos de (1x25)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(121, 'PS-002', 'PAQUETE DE SERVILLETAS', 1, '2021-07-20 09:53:28', '0.0000', '0.0000', '1.00', 1, '80', 'Paquete de servilletas', 'Paquete de servilletas', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(122, 'LGT-002', 'LIMPIADOR GRANDE DE TELA ', 1, '2021-07-20 09:55:53', '0.0000', '0.0000', '1.00', 1, '30', 'Limpiador grande de tela', 'Limpiador grande de tela', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(123, 'TJL-002', 'TARRO JABON LAVATRASTOS', 1, '2021-07-20 10:00:47', '0.0000', '0.0000', '1.00', 1, '30', 'Tarro jabon lavatrastos (450 gramos)', 'Tarro jabon lavatrastos (450 gramos)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-12-12', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(124, 'TPT-002', 'TOALLA PARA TRAPEAR', 1, '2021-07-20 10:03:53', '0.0000', '0.0000', '1.00', 1, '25', 'Toalla para trapear', 'Toalla para trapear', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(125, 'ESP-002', 'ESCOBA PLÃSTICA', 1, '2021-07-20 10:07:58', '0.0000', '0.0000', '1.00', 1, '10', 'Escoba plÃ¡stica', 'Escoba plÃ¡stica', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '3.00'),
(126, 'JPD-002', 'JABON PARA DISPENSADOR EN CAJITA', 1, '2021-07-20 10:10:11', '0.0000', '0.0000', '1.00', 1, '90', 'JabÃ³n para dispensador en cajita', 'JabÃ³n para dispensador en cajita', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '12.00'),
(127, 'GGR-002', 'GALON DE GASOLINA REGULAR', 1, '2021-07-20 10:12:30', '0.0000', '0.0000', '1.00', 1, '5', 'GalÃ³n de gasolina regular s-c', 'GalÃ³n de gasolina regular s-c', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(128, 'LAA-002', 'LITRO DE ACEITE P/AUTOLUBE', 1, '2021-07-20 10:16:06', '0.0000', '0.0000', '1.00', 1, '5', 'Litro de aceite p/autolube', 'Litro de aceite p/autolube', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(129, 'BMG-002', 'BUCK, MANUAL HTP Y GUIA DE INTERPRETACION', 1, '2021-07-20 10:23:10', '0.0000', '0.0000', '1.00', 1, '5', 'Buck, manual HTP y guÃ­a de interpretaciÃ³n de la ', 'Buck, manual HTP y guÃ­a de interpretaciÃ³n de la tÃ©cnica de dibujo proyectivo (prueba completa con archivo electrÃ³nico de protocolo)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(130, 'FAA-002', 'FRASCO DE ALCOHOL EN AEROSOL', 1, '2021-07-20 10:30:02', '0.0000', '0.0000', '1.00', 1, '10', 'Frasco de 300ml de alcohol en aerosol', 'Frasco de 300ml de alcohol en aerosol', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '3.00'),
(131, 'PTD-002', 'PAQUETE DE TOALLAS DESINFECTANTES', 1, '2021-07-20 10:32:28', '0.0000', '0.0000', '1.00', 1, '10', 'Paquete de toallas desinfectantes (toallas hÃºmeda', 'Paquete de toallas desinfectantes (toallas hÃºmedas)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(132, 'TCF0-002', 'TONER HP CF500A NEGRO', 1, '2021-07-20 10:44:29', '0.0000', '0.0000', '1.00', 1, '15', 'Toner Hp CF500A Negro', 'Toner Hp CF500A Negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(133, 'TCF1-002', 'TONER HP CF501A CYAN', 1, '2021-07-20 10:46:19', '0.0000', '0.0000', '1.00', 1, '10', 'Toner HP CF501A cyan', 'Toner HP CF501A cyan', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(134, 'TCF2-002', 'TONER HP CF502A AMARILLO', 1, '2021-07-20 10:47:55', '0.0000', '0.0000', '1.00', 1, '10', 'Toner HP CF502A amarillo', 'Toner HP CF502A amarillo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(135, 'TCF3-002', 'TONER HP CF503A MAGENTA', 1, '2021-07-20 11:00:20', '0.0000', '0.0000', '1.00', 1, '10', 'Toner HP CF503A magenta', 'Toner HP CF503A magenta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '3.00'),
(136, 'CE41-002', 'CARTUCHO EPSON T6641 NEGRO', 1, '2021-07-20 11:03:00', '0.0000', '0.0000', '1.00', 1, '16', 'Cartucho Epson T6641 negro', 'Cartucho Epson T6641 negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(137, 'CE42-002', 'CARTUCHO EPSON T6642 CYAN', 1, '2021-07-20 11:04:55', '0.0000', '0.0000', '1.00', 1, '10', 'Cartucho Epson T6642 cyan', 'Cartucho Epson T6642 cyan', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '3.00'),
(138, 'CE43-002', 'CARTUCHO EPSON T6643 MAGENTA', 1, '2021-07-20 11:08:55', '0.0000', '0.0000', '1.00', 1, '10', 'Cartucho Epson T6643 magenta', 'Cartucho Epson T6643 magenta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '3.00');
INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `status_producto`, `date_added`, `precio_producto`, `costo_producto`, `mon_costo`, `mon_venta`, `max`, `desc_corta`, `color`, `b1`, `b2`, `b3`, `b4`, `b5`, `b6`, `cat_pro`, `pro_ser`, `foto1`, `foto2`, `foto3`, `foto4`, `fecha_caducidad`, `pre_web`, `descripcion`, `descripcion1`, `megusta`, `nomegusta`, `precio2`, `precio3`, `und_pro`, `barras`, `dcto`, `min`) VALUES
(139, 'CE44-002', 'CARTUCHO EPSON T6644 AMARILLO', 1, '2021-07-20 11:10:05', '0.0000', '0.0000', '1.00', 1, '10', 'Cartucho Epson T6644 amarillo', 'Cartucho Epson T6644 amarillo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '3.00'),
(140, 'TCF00-002', 'TONER HP CF400A negro', 1, '2021-07-20 11:16:46', '0.0000', '0.0000', '1.00', 1, '5', 'Toner HP CF400A negro', 'Toner HP CF400A negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(141, 'TCF02-002', 'TONER HP CF402A AMARILLO', 1, '2021-07-20 11:22:35', '0.0000', '0.0000', '1.00', 1, '5', 'Toner HP CF402A amarillo', 'Toner HP CF402A amarillo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(142, 'LID-002', 'LIBRETA DIDEX 96H', 1, '2021-07-20 11:26:59', '0.0000', '0.0000', '1.00', 1, '10', 'Libreta Didex 96h', 'Libreta Didex 96h', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(143, 'SSC-002', 'SOBRE CON SEMILLA DE CRISANTEMO', 1, '2021-07-20 11:28:45', '0.0000', '0.0000', '1.00', 1, '10', 'Sobre con semilla de crisantemo', 'Sobre con semilla de crisantemo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(144, 'SSCC-002', 'SOBRE CON SEMILLA DE CLAVEL CHINO', 1, '2021-07-20 11:30:56', '0.0000', '0.0000', '1.00', 1, '10', 'Sobre con semilla de clavel chino', 'Sobre con semilla de clavel chino', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(145, 'SSCA', 'SOBRE CON SEMILLA DE CALENDULA', 1, '2021-07-20 11:32:34', '0.0000', '0.0000', '1.00', 1, '10', 'Sobre con semilla de calendula', 'Sobre con semilla de calendula', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(146, 'SSD-002', 'SOBRE CON SEMILLA DE DAMASQUINA', 1, '2021-07-20 11:35:21', '0.0000', '0.0000', '1.00', 1, '10', 'Sobre con semilla de damasquina', 'Sobre con semilla de damasquina', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(147, 'MI-002', 'MANTEL IMPERMEABLE', 1, '2021-07-20 11:51:32', '0.0000', '0.0000', '1.00', 1, '5', 'Mantel impermeable', 'Mantel impermeable', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(148, 'DMC-002', 'DIPLOMAS MADRES EN CONFLICTO', 1, '2021-07-20 12:07:14', '0.0000', '0.0000', '1.00', 1, '1500', 'ImpresiÃ³n de diplomas para talleres del programa ', 'ImpresiÃ³n de diplomas para talleres del programa madres y/o padre biolÃ³gicos en conflicto con su parentalidad', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(149, 'FNO-002', 'FOLDER \"SOY NIÃ‘O', 1, '2021-07-20 12:10:30', '0.0000', '0.0000', '1.00', 1, '200', 'ImpresiÃ³n de folder \"soy niÃ±o\", tamaÃ±o oficio c', 'ImpresiÃ³n de folder \"soy niÃ±o\", tamaÃ±o oficio con solapa doble, con braniz UV brillante, full color ', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(150, 'FNA-002', 'FOLDER \"SOY NIÃ‘A', 1, '2021-07-20 12:13:38', '0.0000', '0.0000', '1.00', 1, '200', 'ImpresiÃ³n de folder \"Soy NiÃ±a\", tamaÃ±o oficio c', 'ImpresiÃ³n de folder \"Soy NiÃ±a\", tamaÃ±o oficio con solapa doble, con braniz UV brillante, full color', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(151, 'HPI-002', 'HOJAS DE PAPEL IRIS', 1, '2021-07-20 12:17:59', '0.0000', '0.0000', '1.00', 1, '100', 'Hojas de papel iris color verde hierba, tamaÃ±o of', 'Hojas de papel iris color verde hierba, tamaÃ±o oficio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(152, 'BDP-002', 'BASURERO DE PLASTICO', 1, '2021-07-20 12:19:32', '0.0000', '0.0000', '1.00', 1, '5', 'Basurero de plastico', 'Basurero de plastico', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(153, 'DVP-002', 'DELINEADOR VIAL PORTÃTIL CON BASE', 1, '2021-07-20 12:46:15', '0.0000', '0.0000', '1.00', 1, '5', 'Delineador vial portÃ¡til con base', 'Delineador vial portÃ¡til con base', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(154, 'FVO-002', 'FOLDER VERDE, TAMAÃ‘O OFICIO', 1, '2021-07-20 12:49:21', '0.0000', '0.0000', '1.00', 1, '20', 'Folder verde, tamaÃ±o oficio', 'Folder verde, tamaÃ±o oficio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(155, 'GBR-002', 'GOMA BLANCA (TIPO RESISTOL)', 1, '2021-07-20 12:50:57', '0.0000', '0.0000', '1.00', 1, '10', 'Goma blanca de 8 onz.', 'Goma blanca de 8 onz.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(156, 'MPN-002', 'MARCADOR PERMANENTE NEGRO', 1, '2021-07-20 12:55:33', '0.0000', '0.0000', '1.00', 1, '5', 'Marcador permanente negro', 'Marcador permanente negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(157, 'PDP-002', 'PESTAÃ‘AS DE PLÃSTICO', 1, '2021-07-20 13:15:44', '0.0000', '0.0000', '1.00', 1, '30', 'PestaÃ±as de plÃ¡stico para identificar folder col', 'PestaÃ±as de plÃ¡stico para identificar folder colgante', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(158, 'PFC-002', 'PIZARRÃ“N DE FORMICA Y CORCHO', 1, '2021-07-20 13:18:03', '0.0000', '0.0000', '1.00', 1, '5', 'PizarrÃ³n de formica y corcho 1.20 x 0.60mts', 'PizarrÃ³n de formica y corcho 1.20 x 0.60mts', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(160, 'TAS-002', 'TINTA COLOR AZUL PARA SELLOS', 1, '2021-07-20 13:24:22', '0.0000', '0.0000', '1.00', 1, '10', 'Tinta color azul para sellos', 'Tinta color azul para sellos', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(161, 'APS-002', 'ALMOHADILLA PARA SELLO', 1, '2021-07-20 13:26:55', '0.0000', '0.0000', '1.00', 1, '10', 'Almohadilla para sello ', 'Almohadilla para sello ', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(162, 'RL-002', 'ROTULACIONES LAMINADAS DE PVC', 1, '2021-07-20 13:29:04', '0.0000', '0.0000', '1.00', 1, '10', 'Rotulaciones laminadas de PVC', 'Rotulaciones laminadas de PVC', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(163, 'CH-002', 'CANDADO HIERRO 50MM ', 1, '2021-07-21 08:35:09', '0.0000', '0.0000', '1.00', 1, '5', 'Candado hierro 50mm blister', 'Candado hierro 50mm blister', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(164, 'CPC-002', 'CANDADO PARA CORTINA', 1, '2021-07-21 08:37:24', '0.0000', '0.0000', '1.00', 1, '5', 'Candado para cortina de hierro', 'Candado para cortina de hierro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(165, 'CL-002', 'CORRECTOR LIQUIDO TIPO LAPICERO', 1, '2021-07-21 08:43:04', '0.0000', '0.0000', '1.00', 1, '10', 'Corrector liquido tipo lapicero', 'Corrector liquido tipo lapicero', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '3.00'),
(166, 'FDP-002', 'FUENTE DE PODER DE 600WATTS', 1, '2021-07-21 08:46:12', '0.0000', '0.0000', '1.00', 1, '5', 'Fuente de poder de 600WATTS 20+4 pines S-ATA', 'Fuente de poder de 600WATTS 20+4 pines S-ATA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(167, 'BR-002', 'BROCA 7/32', 1, '2021-07-21 08:56:47', '0.0000', '0.0000', '1.00', 1, '5', 'Broca 7/32', 'Broca 7/32', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(168, 'BRO-002', 'BROCA 15/64', 1, '2021-07-21 08:57:53', '0.0000', '0.0000', '1.00', 1, '5', 'Broca 15/64', 'Broca 15/64', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(169, 'T10X1-002', 'BOLSA DE TORNILLO 10X1', 1, '2021-07-21 09:01:39', '0.0000', '0.0000', '1.00', 1, '5', 'Bolsa de tornillo 10x1', 'Bolsa de tornillo 10x1', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(170, 'T10X2', 'BOLSA DE TORNILLO 10X2', 1, '2021-07-21 09:03:05', '0.0000', '0.0000', '1.00', 1, '5', 'Bolsa de tornillo 10x2', 'Bolsa de tornillo 10x2', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(171, 'T12X3/4-002', 'BOLSA DE TORNILLO 12X3/4', 1, '2021-07-21 09:04:44', '0.0000', '0.0000', '1.00', 1, '5', 'Bolsa de tornillo 12x3/4', 'Bolsa de tornillo 12x3/4', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(172, 'T14X2-002', 'BOLSA DE TORNILLO 14X2', 1, '2021-07-21 09:06:12', '0.0000', '0.0000', '1.00', 1, '5', 'Bolsa de tornillo 14x2', 'Bolsa de tornillo 14x2', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(173, 'TP-002', 'TARUGOS PLASTICOS 12un', 1, '2021-07-21 09:08:01', '0.0000', '0.0000', '1.00', 1, '10', 'Tarugos plasticos 12un', 'Tarugos plasticos 12un', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(174, 'TCP-002', 'TECLADO PARA COMPUTADORA PORTATIL LENOVO', 1, '2021-07-27 15:28:26', '0.0000', '0.0000', '1.00', 1, '5', 'Teclado para computadora portatil LENOVO  ', 'Teclado en espaÃ±ol, serie c27c03w21 para computadora portÃ¡til Lenovo, modelo e570  ', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(175, 'RIV-002', 'RECIBO DE INGRESOS VARIOS FORMA 63-A2', 1, '2021-07-27 15:38:22', '0.0000', '0.0000', '1.00', 1, '200', 'Recibo de Ingresos Varios Forma 63-A2', 'Recibo de ingresos varios forma 63-a2, serie AG (en duplicado) del no. 123951 al 124150', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(176, 'GDA-002', 'GALÃ“N DE ACEITE 20W50', 1, '2021-07-27 16:19:12', '0.0000', '0.0000', '1.00', 1, '5', 'GalÃ³n de aceite 20w50', 'GalÃ³n de aceite 20w50', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(177, 'MPE-002', 'MARCADOR PERMANENTE EDDING 780 DORADO', 1, '2021-07-27 16:21:54', '0.0000', '0.0000', '1.00', 1, '10', 'Marcador permanente Edding 780 dorado', 'Marcador permanente Edding 780 dorado', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(178, 'MPEB-002', 'MARCADOR PERMANENTE EDDING 791 BLANCO', 1, '2021-07-27 16:23:45', '0.0000', '0.0000', '1.00', 1, '5', 'Marcador permanente edding 791 blanco', 'Marcador permanente edding 791 blanco', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(179, 'MPB-002', 'MARCADOR PERMANENTE EDDING 792 BLANCO', 1, '2021-07-27 16:26:32', '0.0000', '0.0000', '1.00', 1, '5', 'Marcador permanente edding 792 blanco', 'Marcador permanente edding 792 blanco', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(180, 'CDB-002', 'CALCULADORA DE BOLSILLO', 1, '2021-07-27 16:28:19', '0.0000', '0.0000', '1.00', 1, '5', 'Calculadora de bolsillo', 'Calculadora de bolsillo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(181, 'CBL-002', 'CAJA DE BAJALENGUAS 100UN.', 1, '2021-07-27 16:30:07', '0.0000', '0.0000', '1.00', 1, '10', 'Caja de bajalenguas 100un.', 'Caja de bajalenguas 100un.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(182, 'CGD-002', 'CAJA DE GUANTES DESCARTABLES DE LATEX 100UN.', 1, '2021-07-27 16:31:36', '0.0000', '0.0000', '1.00', 1, '10', 'Caja de guantes descartables de latex 100un.', 'Caja de guantes descartables de latex 100un.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(183, 'FDA-002', 'FORMULARIO DE DESPACHO DE ALMACEN', 1, '2021-07-27 16:57:00', '0.0000', '0.0000', '1.00', 1, '500', 'Formulario de despacho de almacÃ©n', 'Formulario de despacho de almacÃ©n, en duplicado (original blanco, copia rosada), papel sensibilizado, tamaÃ±o carta, numerados con el correlativo 4101 al 4600', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(184, 'EDMI-002', 'EXTENSOR HDMI Y CONTROL REMOTO CAT6', 1, '2021-07-27 17:04:02', '0.0000', '0.0000', '1.00', 1, '5', 'Extensor HDMI y control remoto cat6', 'Extensor HDMI y control remoto cat6', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(185, 'CCC2-002', 'CUPON CANJEABLE POR COMBUSTIBLE DE Q.20.00', 1, '2021-07-27 17:11:49', '0.0000', '0.0000', '1.00', 1, '300', 'Cupon canjeable por combustible de q.20.00', 'Cupon canjeable por combustible de q.20.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(186, 'CCC5-002', 'CUPON CANJEABLE POR COMBUSTIBLE DE Q.50.00', 1, '2021-07-27 17:13:38', '0.0000', '0.0000', '1.00', 1, '300', 'Cupon canjeable por combustible de q.50.00', 'Cupon canjeable por combustible de q.50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(187, 'CCC1-002', 'CUPON CANJEABLE POR COMBUSTIBLE DE Q.100.00', 1, '2021-07-27 17:14:36', '0.0000', '0.0000', '1.00', 1, '300', 'Cupon canjeable por combustible de q.100.00', 'Cupon canjeable por combustible de q.100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(188, 'FAE-002', 'FOCO AHORRADOR ESPIRAL DE 65 WTTS', 1, '2021-07-28 08:26:25', '0.0000', '0.0000', '1.00', 1, '5', 'Foco ahorrador espiral de 65 wtts', 'Foco ahorrador espiral de 65 wtts', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(189, 'MPS-002', 'MANECILLA PARA SANITARIO', 1, '2021-07-28 08:28:08', '0.0000', '0.0000', '1.00', 1, '5', 'Manecilla para sanitario', 'Manecilla para sanitario', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(190, 'EPUR-002', 'EXTENSION POLARIZADA USO RUDO 8 M', 1, '2021-07-28 08:36:49', '0.0000', '0.0000', '1.00', 1, '5', 'ExtensiÃ³n polarizada uso rudo 8 m', 'ExtensiÃ³n polarizada uso rudo 8 m', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(191, 'BL9W-002', 'BOMBILLA LED 9W', 1, '2021-07-28 09:00:59', '0.0000', '0.0000', '1.00', 1, '5', 'Bombilla led 9w', 'Bombilla led 9w', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(192, 'TCD-002', 'TOMACORRIENTE DOBLE DOMINIO SENCILLA', 1, '2021-07-28 09:12:21', '0.0000', '0.0000', '1.00', 1, '5', 'Tomacorriente doble dominio sencilla', 'Tomacorriente doble dominio sencilla', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(193, 'BDTG-002', 'BOTE DE 300 ML. DE TAPA GOTERAS', 1, '2021-07-28 09:17:10', '0.0000', '0.0000', '1.00', 1, '5', 'Bote de 300 ml. de tapagoteras', 'Bote de 300 ml. de tapagoteras', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(194, 'JDA-002', 'JALADOR DE AGUA DE 40 CM.', 1, '2021-07-28 09:19:02', '0.0000', '0.0000', '1.00', 1, '5', 'Jalador de agua de 40 cm.', 'Jalador de agua de 40 cm.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(195, 'BAS-002', 'BOTE DE 800 ML. DE ALCOHOL SANITIZANTE', 1, '2021-07-28 09:30:29', '0.0000', '0.0000', '1.00', 1, '10', 'Bote de 800 ml. de alcohol sanitizante', 'Bote de 800 ml. de alcohol sanitizante', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(196, 'PPT-002', 'PLACA PARA TOMACORRIENTE', 1, '2021-07-28 09:33:00', '0.0000', '0.0000', '1.00', 1, '5', 'Placa para tomacorriente', 'Placa para tomacorriente', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(197, 'PBH-002', 'PAR DE BOTAS DE HULE', 1, '2021-07-28 09:42:17', '0.0000', '0.0000', '1.00', 1, '5', 'Par de botas de hule', 'Par de botas de hule', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(198, 'CIM-002', 'CHUMPA IMPERMEABLE PARA MOTORISTA', 1, '2021-07-28 09:44:32', '0.0000', '0.0000', '1.00', 1, '5', 'Chumpa impermeable para motorista', 'Chumpa impermeable para motorista', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(199, 'PIM-002', 'PANTALON IMPERMEABLE MOTORISTA', 1, '2021-07-28 09:46:09', '0.0000', '0.0000', '1.00', 1, '5', 'PantalÃ³n impermeable motorista', 'PantalÃ³n impermeable motorista', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(200, 'HPS-002', 'HULE PARA SELLO', 1, '2021-07-28 10:20:32', '0.0000', '0.0000', '1.00', 1, '10', 'Hule para sello de base automÃ¡tica', 'Hule para sello de base automÃ¡tica', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(201, 'RPM-002', 'ROLLOS PAPEL MAYORDOMO', 1, '2021-07-28 10:35:22', '0.0000', '0.0000', '1.00', 1, '50', 'Rollos papel mayordomo', 'Rollos papel mayordomo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(202, 'RPBC-002', 'RESMA PAPEL BOND T/CARTA 75 GRAMOS', 1, '2021-07-28 10:42:09', '0.0000', '0.0000', '1.00', 1, '250', 'Resma papel bond t/carta 75 gramos', 'Resma papel bond t/carta 75 gramos', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '40.00'),
(203, 'BLC-002', 'BOTE DE LUBRICANTE DE 100ml. PARA CADENA', 1, '2021-07-28 11:03:01', '0.0000', '0.0000', '1.00', 1, '5', 'Bote de lubricante de 100ml. para cadena', 'Bote de lubricante de 100ml. para cadena', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(204, 'FOA-002', 'FOLDER TAMAÃ‘O OFICIO COLOR ANARANJADO', 1, '2021-07-28 14:59:26', '0.0000', '0.0000', '1.00', 1, '200', 'Folder tamaÃ±o oficio color anaranjado', 'Folder tamaÃ±o oficio color anaranjado', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(205, 'PPC-002', 'PASTAS PLASTICAS T.CARTA', 1, '2021-07-28 15:03:21', '0.0000', '0.0000', '1.00', 1, '100', 'Pastas plÃ¡sticas tamaÃ±o carta', 'Pastas plÃ¡sticas tamaÃ±o carta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(206, 'PPO-002', 'PASTAS PLASTICAS TAMAÃ‘O OFICIO', 1, '2021-07-28 15:17:51', '0.0000', '0.0000', '1.00', 1, '100', 'Pastas plÃ¡sticas tamaÃ±o oficio', 'Pastas plÃ¡sticas tamaÃ±o oficio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(207, 'SP11/4-002', 'SUJETAPAPEL 1 1/4\"', 1, '2021-07-28 15:21:12', '0.0000', '0.0000', '1.00', 1, '100', 'Sujetapapel 1 1/4\"', 'Sujetapapel 1 1/4\"', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(208, 'RM-002', 'REGLA METALICA DE 30 CMS.', 1, '2021-07-28 15:24:25', '0.0000', '0.0000', '1.00', 1, '10', 'Regla metÃ¡lica de 30 cms.', 'Regla metÃ¡lica de 30 cms.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(209, 'DVD-002', 'DVD`S', 1, '2021-07-28 15:26:28', '0.0000', '0.0000', '1.00', 1, '100', 'DVD`S', 'DVD`S', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(210, 'MPA-002', 'MARCADOR TINTA COLOR AZUL PARA PIZARRA', 1, '2021-07-28 15:47:35', '0.0000', '0.0000', '1.00', 1, '10', 'Marcador tinta color azul para pizarra', 'Marcador tinta color azul para pizarra', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(211, 'MPR-002', 'MARCADOR TINTA COLOR ROJO PARA PIZARRA', 1, '2021-07-28 15:49:16', '0.0000', '0.0000', '1.00', 1, '10', 'Marcador tinta color rojo para pizarra', 'Marcador tinta color rojo para pizarra', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(212, 'TJ-002', 'TIJERA', 1, '2021-07-28 16:12:11', '0.0000', '0.0000', '1.00', 1, '10', 'Tijera', 'Tijera', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(213, 'CCC-002', 'CAJA DE CRAYON DE CERA', 1, '2021-07-28 16:32:27', '0.0000', '0.0000', '1.00', 1, '5', 'Caja de crayon de cera', 'Caja de crayon de cera', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(214, 'ALA-002', 'AFICHES LA ADOPCION', 1, '2021-07-29 12:03:07', '0.0000', '0.4000', '1.00', 1, '2000', 'Afiches la adopciÃ³n', 'Afiches la adopciÃ³n', '2000.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '100.00'),
(215, 'AMC-002', 'AFICHES MADRES EN CONFLICTO CON SU MATERNIDAD', 1, '2021-07-29 13:11:58', '0.0000', '0.9200', '1.00', 1, '5000', 'Afiches Madres en conflicto, de 18 pulgadas de anc', 'Afiches Madres en conflicto, de 18 pulgadas de ancho por 24 pulgadas de alto', '2000.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '100.00'),
(216, 'ATC-002', 'ARCHIVADORES TAMAÃ‘O CARTA ', 1, '2021-07-29 13:18:50', '0.0000', '11.1800', '1.00', 1, '100', 'Archivadores tamaÃ±o carta', 'Archivadores tamaÃ±o carta', '89.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(217, 'BNA-002', 'BLOCK (CUBO) NOTAS ADHE DE COLORES', 1, '2021-07-29 14:33:49', '0.0000', '0.0000', '1.00', 1, '10', 'Block (cubo) de notas adhesivas de colores neÃ³n v', 'Block (cubo) de notas adhesivas de colores neÃ³n variados', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(218, 'BPCNA-002', 'BOLIGRAFO PROMOCIONAL CNA', 1, '2021-07-29 14:36:19', '0.0000', '0.0000', '1.00', 1, '1000', 'BolÃ­grafo promocional CNA', 'BolÃ­grafo promocional CNA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(219, 'CPTF-002', 'CONSTANCIA DE PARTICIPACIÃ“N TALLER FORMATIVO', 1, '2021-07-29 14:44:35', '0.0000', '0.0000', '1.00', 1, '5000', 'Constancia de participaciÃ³n taller formativo', 'Constancia de participaciÃ³n taller formativo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(220, 'CPTI-002', 'CONSTANCIA DE PARTICIPACIÃ“N TALLER INFORMATIVO', 1, '2021-07-29 14:46:06', '0.0000', '0.0000', '1.00', 1, '5000', 'Constancia de participaciÃ³n taller informativo', 'Constancia de participaciÃ³n taller informativo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '100.00'),
(221, 'CG3/8-002', 'CAJA GRAPAS 3/8\" No.23/10 (10 mm)', 1, '2021-07-29 14:47:55', '0.0000', '0.0000', '1.00', 1, '5', 'CAJA GRAPAS 3/8\" No.23/10 (10 mm)', 'CAJA GRAPAS 3/8\" No.23/10 (10 mm)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(222, 'CSB-002', 'CAJA SOBRES BLANCOS T/OFICIO (1X100 UN.)', 1, '2021-07-29 14:50:31', '0.0000', '0.0000', '1.00', 1, '10', 'Caja sobres blancos t/oficio (1x100 un.)', 'Caja sobres blancos t/oficio (1x100 un.)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(223, 'CRH-002', 'CAJA REFUERZOS PARA HOJAS', 1, '2021-07-29 14:53:24', '0.0000', '0.0000', '1.00', 1, '20', 'Caja refuerzos para hojas', 'Caja refuerzos para hojas', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(224, 'CHP02-002', 'CARTUCHO HP C4902A NEGRO', 1, '2021-07-29 14:55:49', '0.0000', '0.0000', '1.00', 1, '10', 'CARTUCHO HP C4902A NEGRO', 'Cartucho HP C4902a negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(225, 'CHP03-002', 'CARTUCHO HP C4903A CYAN', 1, '2021-07-29 14:57:03', '0.0000', '0.0000', '1.00', 1, '10', 'CARTUCHO HP C4903A CYAN', 'CARTUCHO HP C4903A CYAN', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(226, 'CHP04-002', 'CARTUCHO HP C4904A MAGENTA', 1, '2021-07-29 14:58:23', '0.0000', '0.0000', '1.00', 1, '10', 'CARTUCHO HP C4904A MAGENTA', 'Cartucho HP C4904A Magenta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(227, 'CHP05-002', 'CARTUCHO HP C4905A Yellow', 1, '2021-07-29 14:59:34', '0.0000', '0.0000', '1.00', 1, '10', 'CARTUCHO HP C4905A Yellow', 'Cartucho HP C4905A Yellow', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(228, 'CHP85-002', 'CARTUCHO HP C9385A NEGRO', 1, '2021-07-29 15:00:55', '0.0000', '0.0000', '1.00', 1, '10', 'CARTUCHO HP C9385A NEGRO', 'Cartucho HP C9385A Negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(229, 'CHP86-002', 'CARTUCHO HP C9386A CIAN', 1, '2021-07-29 15:02:11', '0.0000', '0.0000', '1.00', 1, '10', 'CARTUCHO HP C9386A CIAN', 'Cartucho HP C9386A Cyan', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(230, 'CHP87-002', 'CARTUCHO HP C9387A MAGENTA', 1, '2021-07-29 15:03:11', '0.0000', '0.0000', '1.00', 1, '10', 'CARTUCHO HP C9387A MAGENTA', 'Cartucho HP C9387A Magenta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(231, 'CHP88-002', 'CARTUCHO HP C9388A AMARILLO', 1, '2021-07-29 15:13:42', '0.0000', '0.0000', '1.00', 1, '10', 'CARTUCHO HP C9388A AMARILLO', 'Cartucho HP C9388A Amarillo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(232, 'CD-002', 'CD`S', 1, '2021-07-29 15:25:00', '0.0000', '0.0000', '1.00', 1, '100', 'CD`S', 'CD`S', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(233, 'CLR-002', 'CEPILLO PLASTICO PARA LAVAR ROPA', 1, '2021-07-29 15:27:23', '0.0000', '0.0000', '1.00', 1, '10', 'CEPILLO PLASTICO PARA LAVAR ROPA', 'Cepillo plÃ¡stico para lavar ropa', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(234, 'RCTA-002', 'ROLLO DE CINTA TESTIGO PARA AUTOCLAVES', 1, '2021-07-29 15:29:21', '0.0000', '0.0000', '1.00', 1, '10', 'Rollo de cinta testigo para autoclaves', 'Rollo de cinta testigo para autoclaves', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(235, 'DT-002', 'DISPENSADOR DE TAPE ESTANDAR', 1, '2021-07-29 15:32:49', '0.0000', '0.0000', '1.00', 1, '10', 'Dispensador de tape estandar', 'Dispensador de tape estandar', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '2.00'),
(236, 'EL-002', 'ETIQUETAS LASER CD-DVD PQ. 1X25 UN.', 1, '2021-07-29 15:34:22', '0.0000', '0.0000', '1.00', 1, '5', 'Etiquetas laser cd-dvd pq. 1x25 un.', 'Etiquetas laser cd-dvd pq. 1x25 un.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(237, 'FM-002', 'FASTENER DE METAL POR CAJA DE 50 UNID.', 1, '2021-07-29 15:35:42', '0.0000', '0.0000', '1.00', 1, '30', 'Fastener de metal por caja de 50 unid.', 'Fastener de metal por caja de 50 unid.', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(238, 'FICNA-002', 'FOLDER INSTITUCIONAL CNA', 1, '2021-07-29 15:44:44', '0.0000', '0.0000', '1.00', 1, '1000', 'Folder institucional CNA', 'Folder institucional CNA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(239, 'FIOA-002', 'FOLDER INTERIOR OFICIO AMARILLO', 1, '2021-07-29 15:46:53', '0.0000', '0.0000', '1.00', 1, '200', 'Folder interior oficio amarillo', 'Folder interior oficio amarillo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(240, 'FIOR-002', 'FOLDER INTERIOR OFICIO ROSADO', 1, '2021-07-29 15:47:53', '0.0000', '0.0000', '1.00', 1, '200', 'Folder interior oficio rosado', 'Folder interior oficio rosado', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(241, 'FIOAN-002', 'FOLDER INTERIOR OFICIO AZUL NAVY', 1, '2021-07-29 15:50:40', '0.0000', '0.0000', '1.00', 1, '200', 'Folder interior oficio azul Navy', 'Folder interior oficio azul Navy', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(242, 'FLFCNA-002', 'FOLLETO \"EL LIBRO DE LA FAMILIA CNA\"', 1, '2021-07-29 15:53:12', '0.0000', '0.0000', '1.00', 1, '300', 'FOLLETO \"EL LIBRO DE LA FAMILIA CNA\"', 'FOLLETO \"EL LIBRO DE LA FAMILIA CNA\"', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(243, 'FACD-002', 'FUNDAS PARA ALMACENAR CD/DVD', 1, '2021-07-29 15:55:33', '0.0000', '0.0000', '1.00', 1, '200', 'Fundas para almacenar CD/DVD', 'Fundas para almacenar CD/DVD', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(244, 'GLV-002', 'GALÃ“N DE LIMPIAVIDRIOS (3,785ml)', 1, '2021-07-29 16:08:10', '0.0000', '0.0000', '1.00', 1, '5', 'GALÃ“N DE LIMPIAVIDRIOS (3,785ml)', 'GalÃ³n de limpiavidrios (3,785ml)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(245, 'GDH-002', 'GUANTES DE HULE (PAR)', 1, '2021-07-29 16:14:04', '0.0000', '0.0000', '1.00', 1, '10', 'GUANTES DE HULE (PAR)', 'Guantes de hule (par)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(246, 'GIP-002', 'GUIA INFORMATIVA PARA PADRES', 1, '2021-07-29 16:16:37', '0.0000', '0.0000', '1.00', 1, '1000', 'GUIA INFORMATIVA PARA PADRES POSTULANTES A LA ADOP', 'GuÃ­a informativa para padres postulantes a la adopciÃ³n', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '10.00'),
(247, 'HCLC-002', 'HOJAS DE CARTULINA LINO CARTA', 1, '2021-07-29 16:17:58', '0.0000', '0.0000', '1.00', 1, '200', 'HOJAS DE CARTULINA LINO CARTA', 'Hojas de cartulina lino carta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(248, 'HMCNA-002', 'HOJAS MEMBRETADAS CNA T/CARTA', 1, '2021-07-29 16:19:12', '0.0000', '0.0000', '1.00', 1, '2000', 'HOJAS MEMBRETADAS CNA T/CARTA', 'Hojas membretadas CNA t/carta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(249, 'HMCNAO-002', 'HOJAS MEMBRETADAS CNA T/OFICIO', 1, '2021-07-29 16:28:17', '0.0000', '0.0000', '1.00', 1, '5000', 'HOJAS MEMBRETADAS CNA T/OFICIO', 'Hojas membretadas CNA t/oficio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '100.00'),
(250, 'JRS-002', 'JUEGOS DE RODILLOS PARA SCANER HP SCANJET PRO 3000 S3', 1, '2021-07-29 16:30:40', '0.0000', '0.0000', '1.00', 1, '5', 'JUEGOS DE RODILLOS PARA SCANER HP SCANJET PRO 3000', 'Juegos de rodillos para scaner HP Scanjet pro 3000 s3', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(251, 'LCN-002', 'LAPICEROS COLOR NEGRO', 1, '2021-07-29 16:33:13', '0.0000', '0.0000', '1.00', 1, '200', 'LAPICEROS COLOR NEGRO', 'Lapiceros color negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(252, 'LCR-002', 'LAPICEROS COLOR ROJO', 1, '2021-07-29 16:34:19', '0.0000', '0.0000', '1.00', 1, '200', 'LAPICEROS COLOR ROJO', 'Lapiceros color rojo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(253, 'LAR-002', 'LEY DE ADOPCIONES CON SU REGLAMENTO', 1, '2021-07-29 16:35:50', '0.0000', '0.0000', '1.00', 1, '500', 'LEY DE ADOPCIONES CON SU REGLAMENTO', 'Ley de Adopciones con su reglamento', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '20.00'),
(254, 'LNCNA-002', 'LIBRETA DE NOTAS CNA', 1, '2021-07-29 16:37:20', '0.0000', '0.0000', '1.00', 1, '5000', 'LIBRETA DE NOTAS CNA', 'Libreta de notas CNA', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(255, 'LMM-002', 'LIMPIADOR PARA MUEBLES DE MADERA', 1, '2021-07-29 16:38:24', '0.0000', '0.0000', '1.00', 1, '10', 'LIMPIADOR PARA MUEBLES DE MADERA', 'Limpiador para muebles de madera', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(256, 'LTP-002', 'LIMPIADOR DE TELA PEQUEÃ‘O', 1, '2021-07-29 16:39:29', '0.0000', '0.0000', '1.00', 1, '40', 'LIMPIADOR DE TELA PEQUEÃ‘O', 'Limpiador de tela pequeÃ±o', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '5.00'),
(257, 'MPCR-002', 'MARCADOR PERMANENTE COLOR ROJO', 1, '2021-07-29 16:41:52', '0.0000', '0.0000', '1.00', 1, '10', 'MARCADOR PERMANENTE ROJO', 'Marcador permanente color rojo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(258, 'PV-002', 'PIZARRÃ“N DE VIDRIO', 1, '2021-07-29 16:43:04', '0.0000', '0.0000', '1.00', 1, '10', 'PIZARRÃ“N DE VIDRIO', 'PizarrÃ³n de vidrio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(259, 'PSFTAM-002', 'PAQUETE DE SOBRES FTA MINICARD', 1, '2021-07-29 16:46:26', '0.0000', '0.0000', '1.00', 1, '10', 'PAQUETE DE SOBRES FTA MINICARD, SMALL (PQ.1X100 UN', 'Paquete de sobres FTA minicard, Small (pq.1x100 un.)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(260, 'RLNA-002', 'RECOPILACIÃ“N DE LEYES S/NIÃ‘EZ Y ADOLESCENCIA', 1, '2021-07-29 16:48:58', '0.0000', '0.0000', '1.00', 1, '1000', 'RECOPILACIÃ“N DE LEYES S/NIÃ‘EZ Y ADOLESCENCIA', 'RecopilaciÃ³n de leyes s/niÃ±ez y adolescencia', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(261, 'SCB-002', 'SOBRE CUADRADO BLANCO 80 GRS. (5 3/4 x  7/8)', 1, '2021-07-29 16:55:04', '0.0000', '0.0000', '1.00', 1, '10', 'SOBRE CUADRADO BLANCO 80 GRS. (5 3/4 x  7/8)', 'Sobre cuadrado blanco 80 grs. (5 3/4 x  7/8)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(262, 'SMC-002', 'SOBRE MANILA CARTA', 1, '2021-07-29 16:56:41', '0.0000', '0.0000', '1.00', 1, '500', 'SOBRE MANILA CARTA', 'Sobre manila carta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(263, 'SMEO-002', 'SOBRE MANILA EXTRA OFICIO', 1, '2021-07-29 16:57:42', '0.0000', '0.0000', '1.00', 1, '500', 'SOBRE MANILA EXTRA OFICIO', 'Sobre manila extra oficio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(264, 'SMMC-002', 'SOBRE MANILA MEDIA CARTA', 1, '2021-07-29 16:58:47', '0.0000', '0.0000', '1.00', 1, '500', 'SOBRE MANILA MEDIA CARTA', 'Sobre manila media carta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(265, 'SMCNA-002', 'SOBRE MEMBRETADO CNA T/OFICIO', 1, '2021-07-29 17:02:15', '0.0000', '0.0000', '1.00', 1, '500', 'SOBRE MEMBRETADO CNA T/OFICIO', 'Sobre membretado cna t/oficio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(266, 'TSC-002', 'TABLA SHANNON CON CLIP T/CARTA', 1, '2021-07-29 17:04:07', '0.0000', '0.0000', '1.00', 1, '10', 'TABLA SHANNON CON CLIP T/CARTA', 'Tabla shannon con clip t/carta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(267, 'TSO-002', 'TABLA SHANNON ACRILICA CON CLIP T/OFICIO', 1, '2021-07-29 17:04:59', '0.0000', '0.0000', '1.00', 1, '10', 'TABLA SHANNON ACRILICA CON CLIP T/OFICIO', 'Tabla shannon acrilica con clip t/oficio', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(268, 'TFO-002', 'TIMBRES FORENSES', 1, '2021-07-29 17:06:34', '0.0000', '0.0000', '1.00', 1, '1000', 'TIMBRES FORENSES', 'Timbres forenses', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '50.00'),
(269, 'TAF-002', 'TINTA COLOR AZUL PARA FOLIADORA', 1, '2021-07-29 17:17:16', '0.0000', '0.0000', '1.00', 1, '10', 'TINTA COLOR AZUL PARA FOLIADORA', 'Tinta color azul para foliadora', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(270, 'TNF-002', 'TINTA COLOR NEGRA PARA FOLIADORA', 1, '2021-07-29 17:18:55', '0.0000', '0.0000', '1.00', 1, '10', 'TINTA COLOR NEGRA PARA FOLIADORA', 'Tinta color negra para foliadora', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(271, 'TRF-002', 'TINTA COLOR ROJA PARA FOLIADORA', 1, '2021-07-29 17:20:00', '0.0000', '0.0000', '1.00', 1, '10', 'TINTA COLOR ROJA PARA FOLIADORA', 'Tinta color roja para foliadora', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(272, 'TMP-002', 'TINTA PARA MARCADOR PIZARRA', 1, '2021-07-29 17:21:07', '0.0000', '0.0000', '1.00', 1, '5', 'TINTA PARA MARCADOR PIZARRA', 'Tinta para marcador pizarra', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(273, 'TSM-002', 'TONER SAMSUNG MULTIFUNCIONAL MOD.SCX6322DN', 1, '2021-07-29 17:22:27', '0.0000', '0.0000', '1.00', 1, '5', 'TONER SAMSUNG MULTIFUNCIONAL MOD.SCX6322DN', 'Toner samsung multifuncional MOD.SCX6322DN', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00');
INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `status_producto`, `date_added`, `precio_producto`, `costo_producto`, `mon_costo`, `mon_venta`, `max`, `desc_corta`, `color`, `b1`, `b2`, `b3`, `b4`, `b5`, `b6`, `cat_pro`, `pro_ser`, `foto1`, `foto2`, `foto3`, `foto4`, `fecha_caducidad`, `pre_web`, `descripcion`, `descripcion1`, `megusta`, `nomegusta`, `precio2`, `precio3`, `und_pro`, `barras`, `dcto`, `min`) VALUES
(274, 'THP15-002', 'TONER HP 15A', 1, '2021-07-29 17:24:06', '0.0000', '0.0000', '1.00', 1, '10', 'TONER HP 15A', 'Toner HP 15A ', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(275, 'THP41-002', 'TONER HP CB541A AZUL', 1, '2021-07-29 17:25:21', '0.0000', '0.0000', '1.00', 1, '10', 'TONER HP CB541A AZUL', 'Toner HP CB541A azul', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(276, 'THP42-002', 'TONER HP CB542A AMARILLO', 1, '2021-07-29 17:26:29', '0.0000', '0.0000', '1.00', 1, '10', 'TONER HP CB542A AMARILLO', 'Toner HP CB542A amarillo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(277, 'THP26-002', 'TONER HP CF226X NEGRO', 1, '2021-07-29 17:27:56', '0.0000', '0.0000', '1.00', 1, '10', 'TONER HP CF226X NEGRO', 'Toner HP CF226X negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(278, 'THP30-002', 'TONER HP CF230X NEGRO', 1, '2021-07-29 17:34:15', '0.0000', '0.0000', '1.00', 1, '10', 'TONER HP CF230X NEGRO', 'Toner HP CF230X negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(279, 'THP80-002', 'TONER HP CF280X', 1, '2021-07-29 17:35:36', '0.0000', '0.0000', '1.00', 1, '5', 'TONER HP CF280X', 'Toner HP CF280X ', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(280, 'THP10-002', 'TONER HP CF410A NEGRO', 1, '2021-07-29 17:39:01', '0.0000', '0.0000', '1.00', 1, '10', 'TONER HP CF410A NEGRO', 'Toner HP CF410A negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(281, 'THP11-002', 'TONER HP CF411A CYAN', 1, '2021-07-29 17:40:31', '0.0000', '0.0000', '1.00', 1, '10', 'TONER HP CF411A CYAN', 'Toner HP CF411A cyan', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(282, 'THP12-002', 'TONER HP CF412A AMARILLO', 1, '2021-07-29 17:41:55', '0.0000', '0.0000', '1.00', 1, '10', 'TONER HP CF412A AMARILLO', 'Toner HP CF412A amarillo', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(283, 'THP13-002', 'TONER HP CF413A MAGENTA', 1, '2021-07-29 17:43:13', '0.0000', '0.0000', '1.00', 1, '10', 'TONER HP CF413A MAGENTA', 'Toner HP CF413A magenta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(284, 'TSC407', 'TONER SAMSUNG CLT-C407 Cian', 1, '2021-07-29 17:45:24', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG CLT-C407 Cian', 'TONER SAMSUNG CLT-C407 Cian', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(285, 'TSC409', 'TONER SAMSUNG CLT-C409S Cian', 1, '2021-07-29 17:46:20', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG CLT-C409S Cian', 'TONER SAMSUNG CLT-C409S Cian', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(286, 'TSK407-002', 'TONER SAMSUNG CLT-K407 Black', 1, '2021-07-29 17:47:15', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG CLT-K407 Black', 'TONER SAMSUNG CLT-K407 Black', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(287, 'TSK409-002', 'TONER SAMSUNG CLT-K409S Black', 1, '2021-07-29 17:48:00', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG CLT-K409S Black', 'TONER SAMSUNG CLT-K409S Black', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(288, 'TSM407-002', 'TONER SAMSUNG CLT-M407 Magenta', 1, '2021-07-29 17:48:51', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG CLT-M407 Magenta', 'TONER SAMSUNG CLT-M407 Magenta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(289, 'TSM409-002', 'TONER SAMSUNG CLT-M409S Magenta', 1, '2021-07-29 17:49:38', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG CLT-M409S Magenta', 'TONER SAMSUNG CLT-M409S Magenta', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(290, 'TSY407-002', 'TONER SAMSUNG CLT-Y407 Yellow', 1, '2021-07-29 17:50:34', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG CLT-Y407 Yellow', 'TONER SAMSUNG CLT-Y407 Yellow', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(291, 'TSY409-002', 'TONER SAMSUNG CLT-Y409S Yellow', 1, '2021-07-29 17:51:27', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG CLT-Y409S Yellow', 'TONER SAMSUNG CLT-Y409S Yellow', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(292, 'TS1610-002', 'TONER SAMSUNG ML 1610', 1, '2021-07-29 17:52:21', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG ML 1610', 'TONER SAMSUNG ML 1610', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(293, 'TS2010-002', 'TONER SAMSUNG ML 2010', 1, '2021-07-29 17:53:09', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG ML 2010', 'TONER SAMSUNG ML 2010', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(294, 'TS2240-002', 'TONER SAMSUNG MLT-108-2240 ', 1, '2021-07-29 17:53:53', '0.0000', '0.0000', '1.00', 1, '10', 'TONER SAMSUNG MLT-108-2240 ', 'TONER SAMSUNG MLT-108-2240 ', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(295, 'MI-003', 'MICROFONO INALAMBRICO, WIRELESS 2.4G', 1, '2021-07-30 09:05:04', '0.0000', '0.0000', '1.00', 1, '5', 'MICROFONO INALAMBRICO, WIRELESS 2.4G', 'Microfono Lavalier inalÃ¡mbrico, Wireless 2.4G, marca Kimafun, sin modelo, sin nÃºmero de serie, Caracteristicas: TransmisiÃ³n inalambrica, Internacional de 2.4Ghz. Coincidencia continua de frecuencia, rango de distancia de 50 pies', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(296, 'EEL-003', 'ESCRITORIO EN L MARCA CONTINENTAL', 1, '2021-07-30 09:08:41', '0.0000', '0.0000', '1.00', 1, '10', 'ESCRITORIO EN L MARCA CONTINENTAL, con pedestal de', 'Escritorio en L Marca Continental, con pedestal de 3 gavetas, con llave general, top de melamina color cherry , medidas de 1.60 X 1.60 X 0.78', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(297, 'SSG-003', 'SILLA SECRETARIAL, GIRATORIA', 1, '2021-07-30 09:27:55', '0.0000', '0.0000', '1.00', 1, '10', 'SILLA EJECUTIVA/SECRETARIAL, giratoria, color negr', 'Silla ejecutiva/secretarial, giratoria, color negro, con apoya brazos, con asiento acolchonado, respaldo con tela ventilada (malla), ergonÃ³mica, resistente base metalizada de 5 rodos dobles, que soporta hasta 350 libras de peso, sistema de elevaciÃ³n ajustable por medio de shock', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(298, 'SEC-003', 'SILLA EJECUTIVA, COLOR NEGRO, TAPICERÃA EN CUERO PU', 1, '2021-07-30 09:34:56', '0.0000', '0.0000', '1.00', 1, '10', 'SILLA EJECUTIVA, color negro, tapicerÃ­a en cuero ', 'Silla Ejecutiva color negro, tapicerÃ­a en cuero PU de primera calidad, araÃ±a de metal cromado', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(299, 'AV4-003', 'ARCHIVO VERTICAL 4 GAVETAS', 1, '2021-07-30 09:41:30', '0.0000', '0.0000', '1.00', 1, '10', 'ARCHIVO VERTICAL 4 GAVETAS, de metal, medidas 69cm', 'Archivo vertical color negro de 4 gavetas de metal marca Continental, pintado y esmaltado al horno bajo proceso epoxi en polvo, secado al horno. Gavetas suficientemente amplias con guÃ­as o marcos simples de canal incorporado, sistema de llave general, rieles y cojinetes metÃ¡licos, color negro. Las medidas son 69 cm. de fondo X 46.3 cm. de ancho X 132 cm. de alto, de acero reforzado', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(300, 'CPHP-003', 'COMPUTADORA PORTATIL HP, modelo ProBook 450G7', 1, '2021-07-30 09:46:00', '0.0000', '0.0000', '1.00', 1, '10', 'COMPUTADORA PORTATIL HP, modelo ProBook 450G7', 'Computadora portÃ¡til Marca HP, Modelo ProBook 450 G7, Serie 5CD0371TBZ, Procesador Intel i5-10210U (1.60GHz hasta 4.20, 6M cache), Memoria 4GB (1X4GB) 2133MHz DDR4, Disco duro de estado sÃ³lido de 256GB, unidad Ã³ptica externa, Marca LG, Modelo GP65NB60 Serie B0HUHL3007128, grÃ¡ficos integrated HD pantalla 39.6cm (15.6\") FHD (1920X1080), con cÃ¡mara web y micrÃ³fono, WWAN, teclado en espaÃ±ol con apartado numÃ©rico, intel dual band wireless 8260 (802.11ac) W/Bluetooth, baterÃ­a de ion de litio de 3-cell 62w/hr, Puertos (1) USB 3.1 Gen1 Tipo-C; TM (soporta entrega de carga y video) (2) USB 3.1 Gen1 (1) USB 2.0 (de carga) 1 x HDMI, conector de red (RJ-45), lector de tarjeta de memoria SD, entrada combinada para auriculares y micrÃ³fono, peso: 3.68 libras, Sistema operativo: Windows 10 Pro 64 bits, mouse conexiÃ³n USB, marca HP, Modelo M260, serie G1M260191201922 y mochila', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(301, 'ESC-003', 'ESCANER, MARCA KODAK ALARIS, MODELO E1035', 1, '2021-07-30 10:00:59', '0.0000', '0.0000', '1.00', 1, '10', 'ESCANER, MARCA KODAK ALARIS, MODELO E1035', 'Escaner de documentos Marca Kodak Alaris, Modelo E1035, Serie 65744667, alimentaciÃ³n vertical automÃ¡tico de 50 hojas, duplex a color, resoluciÃ³n Ã³ptica 600 dpi, velocidad de escaneo 35 ppm/70 imp, conectividad estandar USB 3.0 de alta velocidad, ciclo diario de trabajo hasta 4,000 hojas', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(302, 'EM5-003', 'ESTANTERIA DE METAL DE CINCO ENTREPAÃ‘OS', 1, '2021-07-30 10:05:19', '0.0000', '0.0000', '1.00', 1, '10', 'Estanteria de metal de color negro, con cinco entr', 'Estanteria de metal de color negro, con cinco entrepaÃ±os de 35cms de alto x 40 cms de fondo x 127 cms de ancho, en lamina 0.70 milimetros de grosor y refuerzos en angulos de esquinas laterales, marca Baysix, s/m, s/s', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(303, 'SAT-003', 'SOPLADORA/ASPIRADORA TRITURADORA', 1, '2021-07-30 10:08:13', '0.0000', '0.0000', '1.00', 1, '10', 'Sopladora/aspiradora trituradora, Marca: Truper, m', 'Sopladora/aspiradora trituradora, Marca: Truper, modelo:Sopla-26T, Serie No. 1909002046, con motor a gasolina', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(304, 'ADM-003', 'ARMARIO DE METAL DE CINCO ENTREPAÃ‘OS', 1, '2021-07-30 10:46:43', '0.0000', '0.0000', '1.00', 1, '10', 'ARMARIO DE CINCO ENTREPAÃ‘OS, de metal, medidas 1.', 'Armario de metal para oficina con puertas estilo persiana, color negro, con medidas de 1.20 metros de ancho X 1.98 metros de alto X 0.45 metros de fondo, con cinco entrepaÃ±os internos, color negro, Marca Continental, s/s, s/m', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(305, 'IMPE-003', 'IMPRESORA EPSON , MODELO L3110', 1, '2021-07-30 11:05:01', '0.0000', '0.0000', '1.00', 1, '10', 'IMPRESORA EPSON , MODELO L3110', 'Impresora marca Epson, Modelo L3110, Serie X644681987, de inyecciÃ³n de tinta continua de 4 colores (negro, Cyan, Magenta y Amarillo); sistemas de operaciÃ³n: Windows Vista/ Windows, 7/Windows, 8/8.1/Windows, 10 (32BIT/64BIT); Sistema de tanque de tinta de alta capacidad y economÃ­a - ImpresiÃ³n minimo de 7,000 paginas a color y 4,500 paginas en negro', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(306, 'ESCE-003', 'ESCANER MARCA EPSON, MODELO DS-770', 1, '2021-07-30 11:42:22', '0.0000', '0.0000', '1.00', 1, '10', 'ESCANER MARCA EPSON, MODELO DS-770', 'Escaner de documentos, Marca Epson, Modelo DS-770, Serie X3FX008959, de rendimiento medio, con escaneo a doble cara, alimentador de documentos ADF, escaneo de 100 hojas de forma desasistida, resoluciÃ³n Ã³ptica de 600 DPI profundidad de 30 Bits y velocidad de 45 pÃ¡ginas por minuto', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(307, 'TIA-003', 'TELÃ‰FONO INALÃMBRICO, MARCA ALCATEL, MODELO S250', 1, '2021-07-30 11:48:42', '0.0000', '0.0000', '1.00', 1, '5', 'TELÃ‰FONO INALÃMBRICO, MARCA ALCATEL, MODELO S250', 'TelÃ©fono inalÃ¡mbrico, Marca Alcatel, Modelo S250 LA, Serie No. LA-0004220, color negro, con identificador de llamadas, pantalla LCD, tecnologÃ­a DECT, directorio telefÃ³nico, bloqueo de llamadas, modelo ecolÃ³gico inteligente, libre de interferencias', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(308, 'EPP-003', 'EXTINTOR PORTATIL DE POLVO QUIMICO SECO', 1, '2021-07-30 11:58:23', '0.0000', '0.0000', '1.00', 1, '10', 'EXTINTOR PORTATIL DE POLVO QUIMICO SECO', 'Extintor portÃ¡til de polvo quÃ­mico seco, tipo ABC/PQS de 10 libras', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(309, 'PAI-003', 'PODIUM EN ACRILICO CON LOGO INSTITUCIONAL', 1, '2021-07-30 12:08:04', '0.0000', '0.0000', '1.00', 1, '5', 'PODIUM ELABORADO EN ACRILICO CON LOGO INSTITUCIONA', 'PÃ³dium elaborado en acrÃ­lico de 10mm resistente, alto frontal de 1 m con 24.5 cm, alto posterior de 1m con 6.5cm, base inferior ancho 50.5cm y 36cm fondo, base superior ancho 60cm y 45cm fondo, con un entrepaÃ±o, incluye logotipo institucional', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00'),
(310, 'UPSC-003', 'UPS MARCA CDP, MODELO R-UPR758', 1, '2021-07-30 12:11:13', '0.0000', '0.0000', '1.00', 1, '5', 'UPS MARCA CDP, MODELO R-UPR758', 'Equipo de protecciÃ³n elÃ©ctrica, UPS marca CDP, modelo R-UPR758 serie 210205-3072392 con capacidad de 700VA / A350W, protecciÃ³n de sobretensiÃ³n y regulador de voltaje, respaldo de baterÃ­a de 10 minutos', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.0000', '0.00', 1, '', '0.00', '1.00');

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
(1, '4360.5200', '2021-01-01', '2021-01-31'),
(2, '4360.5200', '2021-01-01', '2021-01-31');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2981;
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
  MODIFY `id_factura` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `detalle_tarjeta`
--
ALTER TABLE `detalle_tarjeta`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;
--
-- AUTO_INCREMENT de la tabla `programas_facturas`
--
ALTER TABLE `programas_facturas`
  MODIFY `id_Programa_Factura` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `id_puesto` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `resumen_documentos`
--
ALTER TABLE `resumen_documentos`
  MODIFY `id_resumen` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `saldos`
--
ALTER TABLE `saldos`
  MODIFY `id_saldo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tmp1`
--
ALTER TABLE `tmp1`
  MODIFY `id_tmp` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tmp_descarga_tarjeta`
--
ALTER TABLE `tmp_descarga_tarjeta`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT;
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

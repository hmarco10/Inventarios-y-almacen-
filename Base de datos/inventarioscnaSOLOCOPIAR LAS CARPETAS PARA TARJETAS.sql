-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2021 a las 15:47:36
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
(288, 'Hugo Marco Vasquez', '145', '1500', 'Unidad de Registro', 1, '2021-03-30 11:45:25', '2126145170901', '0', '', 'Peru', '', '', '', '', 1, 1, 0, '0.00', '0.00', '2126145170901'),
(290, 'Byron Castillo Casasola', '135', '55555', 'Unidad de Recursos Humanos', 1, '2021-03-30 14:20:18', '14514787885', '0', '', 'Peru', '', '', '', '', 1, 1, 0, '0.00', '0.00', '14514787885'),
(291, 'Omar Reyes', '140', '5', 'Servicios Generales y Trasporte', 1, '2021-03-30 15:48:59', '3131254717', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '3131254717'),
(292, 'Karin Benzema', '200', '241524', 'Unidad de registro ', 1, '2021-04-06 00:00:00', '', '', '', 'Guatemala', 'Guatemala', 'Guatemala', '', '', 2, 1, 0, '0.00', '0.00', ''),
(293, 'Dollar City', '55220909', 'dollar@gmail.com', 'zona 1 Cdad. Guatemala', 1, '0000-00-00 00:00:00', '', '', '', 'Guatemala', 'Guatemala', 'Guatemala', 'Guatemala', '', 2, 1, 0, '0.00', '0.00', ''),
(294, 'LIBRERIA E IMPRENTA VIVIAN , S.A.', '2415-0000', 'libreria@vivian.com', 'zona 1 Cdad. Guatemala', 1, '2021-04-20 08:56:17', '147', '0', '', 'Guatemala', 'Guatemala', 'Guatemala', 'Guatemala', '7845451212-7', 2, 1, 0, '0.00', '0.00', '147'),
(295, 'OFFIMARKET, S.A.', '21261418', 'empresa@offimarket.com', 'Empresa Guatemalteca', 1, '2021-04-21 15:20:34', '45', '0', '', 'Guatemala', 'Guatemala', 'Guatemala', 'Guatemala', '7845457788-8', 2, 1, 0, '0.00', '0.00', '45'),
(296, 'CompuFacil S.A.', '22141516', 'compufacil@gmail.com', '1ra avenida zona 1 Guatemala, Guatemala', 1, '2021-04-27 08:29:38', '72943246', '0', 'Juan Perez', 'Guatemala', 'Guatemala', 'Guatemala', '', '7}2454124755', 2, 1, 0, '0.00', '0.00', '72943246'),
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
(322, 'Karen Abigail Santizo Ramirez \r\n', '200', '10', 'Unidad de asesorÃ­a JurÃ­dica ', 1, '2021-05-24 13:47:02', '10101010', '72943246', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '10101010'),
(323, 'Feliciano Merlos Sanchez', '200', '100', 'Servicios Generales y Trasporte', 1, '2021-05-25 15:57:58', '1953353250206', '0', '', 'Guatemala', '', '', '', '74943444', 1, 1, 0, '0.00', '0.00', '1953353250206'),
(324, 'Omar Reyes', '140', '5', 'Unidad de administracion financiera', 1, '2021-05-27 09:16:28', '33225222', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '33225222'),
(325, 'Feliciano Merlos Sanchez', '200', '100', 'Servicios Generales y Trasporte', 1, '2021-05-27 12:50:17', '45665456', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '1953353250206'),
(326, 'Feliciano Merlos Sanchez', '200', '100', 'Servicios Generales y Trasporte', 1, '2021-05-27 12:56:26', ' 1953353250206', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', ' 1953353250206'),
(327, 'Keylor Navas ', '200', '0618', 'Unidad de administracion financiera', 1, '2021-05-28 08:23:43', '151520', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '151520'),
(328, 'Genesis Rodriguez Altan', '100', '0618', 'Unidad De Administracion Financiera ', 1, '2021-05-28 10:04:18', '74853246', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '74853246');

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
(0, 'ab4545', '', '', 'ingreso de 3 productos', 'Ubicacion 1', '7489', '0000-00-00 00:00:00'),
(1, '', '', '', 'CARGA INICIAL ARCHIVADORES TAMAÃ‘O OFICIO', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(2, '', '', '', 'carga inicial de varios productos ', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(3, 'ab200', '', '', 'primer ingreso producto agua pura ', 'Ubicacion 1', 'caja chica', '0000-00-00 00:00:00'),
(58, 'ab201', '', '', 'ingreso de producto', 'Ubicacion 1', 'caja chica', '0000-00-00 00:00:00'),
(59, 'ab203', '', '', 'ingreso de 3 productos', 'Ubicacion 1', '74', '0000-00-00 00:00:00'),
(62, 'ab3333', '', '', 'ingreso producto agua pura', 'Ubicacion 1', '456', '0000-00-00 00:00:00'),
(77, '241524ab', '', '', 'ingreso de 3 productos mes de enero', 'Ubicacion 1', '532653', '0000-00-00 00:00:00'),
(80, '102', '', '', 'para uso del cna', 'Ubicacion 1', '1001', '0000-00-00 00:00:00'),
(82, '123456ab', '', '', 'para uso del cna.', 'Ubicacion 1', 'caja chica', '0000-00-00 00:00:00'),
(84, 'ab235223', '65', '', 'para uso de registro', 'Ubicacion 1', '232323', '0000-00-00 00:00:00'),
(88, 'ab1000', '', '', 'fdsafsaf', 'Ubicacion 1', '200', '0000-00-00 00:00:00');

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
(1, '147', '2021-05-28 10:01:09', '0', 'undefined', 328, '0', 6, 1, '845.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de udaf', '0.00', '2020-12-01 00:00:00', 0, '0618', 1, '', 0, 'undefined', 0),
(2, '147', '2021-05-28 10:14:11', '0', 'undefined', 328, '0', 6, 1, '12950.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de udaf', '0.00', '2020-12-28 00:00:00', 0, '0618', 1, '', 0, 'undefined', 0),
(3, '148', '2021-05-30 22:06:33', '0', 'undefined', 291, '0', 6, 1, '169.8900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de omar', '0.00', '2021-05-01 00:00:00', 0, '5', 1, '', 0, 'undefined', 0);

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
(1, '0', '2020-12-31 12:17:07', '0', '', 0, '0', 6, 1, '1689.8800', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 12:17:07', 0, '', 2, '', 0, '', 0),
(2, '0', '2021-01-02 12:27:29', '0', '', 0, '0', 6, 1, '10000.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 12:27:29', 0, '', 2, '', 0, '', 0),
(3, '200', '2021-01-01 12:56:46', '0', '', 293, '0', 6, 1, '924.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-01-01 12:56:46', 0, '100', 2, '', 0, '', 0),
(4, '71', '2021-05-13 12:58:31', '0', 'undefined', 290, '0', 6, 1, '924.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'primer despacho producrto agua pura ', '0.00', '2021-01-01 00:00:00', 0, '50', 1, '', 0, 'caja chica', 0),
(5, '72', '2021-05-13 13:00:46', '0', 'undefined', 290, '0', 6, 1, '266.8236', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de RRHH', '0.00', '2021-01-15 00:00:00', 0, '51', 1, '', 0, '51', 0),
(6, '73', '2021-05-13 14:19:32', '0', 'undefined', 288, '0', 6, 1, '111.2000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'PARA USO DE REGISTRO', '0.00', '2021-01-15 00:00:00', 0, '3918', 1, '', 0, '7045', 0),
(7, '74', '2021-05-13 14:44:12', '0', 'undefined', 288, '0', 6, 1, '133.4400', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de registro', '0.00', '2021-01-15 00:00:00', 0, '3917', 1, '', 0, '7049', 0),
(8, '75', '2021-05-13 15:07:51', '0', 'undefined', 299, '0', 6, 1, '133.4400', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de unidad  de atencion ', '0.00', '2021-01-15 00:00:00', 0, '3914', 1, '', 0, '7050', 0),
(9, '76', '2021-05-13 15:17:15', '0', 'undefined', 300, '0', 6, 1, '55.6000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de unidad de atencion', '0.00', '2021-01-15 00:00:00', 0, '3919', 1, '', 0, '7066', 0),
(10, '77', '2021-05-13 15:21:34', '0', 'undefined', 301, '0', 6, 1, '133.4400', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso DG', '0.00', '2021-01-15 00:00:00', 0, '3924', 1, '', 0, '7075', 0),
(11, '78', '2021-05-13 15:28:28', '0', 'undefined', 302, '0', 6, 1, '102.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de udaf', '0.00', '2021-01-15 00:00:00', 0, '3922', 1, '', 0, '7057', 0),
(12, '79', '2021-05-13 15:30:48', '0', 'undefined', 290, '0', 6, 1, '37.5000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso rrhh', '0.00', '2021-01-15 00:00:00', 0, '3915', 1, '', 0, '7041', 0),
(13, '80', '2021-05-13 15:32:16', '0', 'undefined', 301, '0', 6, 1, '11.2500', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de unidad de planificacion', '0.00', '2021-01-15 00:00:00', 0, '3918', 1, '', 0, '7045', 0),
(14, '81', '2021-05-13 15:33:35', '0', 'undefined', 303, '0', 6, 1, '30.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de aj', '0.00', '2021-01-15 00:00:00', 0, '3911', 1, '', 0, '7044', 0),
(15, '82', '2021-05-13 15:38:48', '0', 'undefined', 288, '0', 6, 1, '7.5000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de ur', '0.00', '2021-05-15 00:00:00', 0, '3917', 1, '', 0, '7049', 0),
(16, '83', '2021-05-13 15:40:14', '0', 'undefined', 304, '0', 6, 1, '22.5000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para plani', '0.00', '2021-01-15 00:00:00', 0, '3914', 1, '', 0, '7050', 0),
(17, '84', '2021-05-13 15:47:17', '0', 'undefined', 305, '0', 6, 1, '11.2500', '0.00', '1', 1, 1, 1, 1, 1, '1', 'em', '0.00', '2021-01-15 00:00:00', 0, '3920', 1, '', 0, '7070', 0),
(18, '85', '2021-05-13 15:49:19', '0', 'undefined', 0, '0', 6, 1, '45.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'aj', '0.00', '2021-01-15 00:00:00', 0, '3911', 1, '', 0, '7044', 0),
(19, '86', '2021-05-13 15:50:11', '0', 'undefined', 307, '0', 6, 1, '7.5000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de dg', '0.00', '2021-01-15 00:00:00', 0, '3924', 1, '', 0, '7075', 0),
(20, '87', '2021-05-13 15:52:24', '0', 'undefined', 290, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de rrh', '0.00', '2021-01-15 00:00:00', 0, '3915', 1, '', 0, '7041', 0),
(21, '88', '2021-05-13 15:53:06', '0', 'undefined', 308, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'PARA UACHPOI', '0.00', '2021-01-15 00:00:00', 0, '3914', 1, '', 0, '7050', 0),
(22, '89', '2021-05-13 15:56:04', '0', 'undefined', 309, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uan', '0.00', '2021-01-15 00:00:00', 0, '3919', 1, '', 0, '3920', 0),
(23, '90', '2021-05-13 15:58:43', '0', 'undefined', 310, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'em', '0.00', '2021-01-15 00:00:00', 0, '3920', 1, '', 0, '7070', 0),
(24, '91', '2021-05-13 15:59:58', '0', 'undefined', 290, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para rrhh', '0.00', '2021-01-15 00:00:00', 0, '3915', 1, '', 0, '7041', 0),
(25, '92', '2021-05-13 16:02:14', '0', 'undefined', 308, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de uachpoi', '0.00', '2021-01-15 00:00:00', 0, '3914', 1, '', 0, '7050', 0),
(26, '93', '2021-05-13 16:03:37', '0', 'undefined', 290, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de rrhh', '0.00', '2021-01-15 00:00:00', 0, '3915', 1, '', 0, '7041', 0),
(27, '94', '2021-05-13 16:04:47', '0', 'undefined', 308, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de uachpoi', '0.00', '2021-01-15 00:00:00', 0, '3914', 1, '', 0, '7050', 0),
(28, '95', '2021-05-13 16:06:00', '0', 'undefined', 308, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de UACHPOI', '0.00', '2021-01-15 00:00:00', 0, '3915', 1, '', 0, '7041', 0),
(29, '96', '2021-05-13 16:07:15', '0', 'undefined', 290, '0', 6, 1, '83.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de rrhh', '0.00', '2021-01-15 00:00:00', 0, '3915', 1, '', 0, '7041', 0),
(30, '97', '2021-05-13 16:08:04', '0', 'undefined', 311, '0', 6, 1, '370.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de udaf', '0.00', '2021-01-15 00:00:00', 0, '3922', 1, '', 0, '7057', 0),
(31, '98', '2021-05-13 16:09:27', '0', 'undefined', 311, '0', 6, 1, '18.7800', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de udaf', '0.00', '2021-01-15 00:00:00', 0, '3922', 1, '', 0, '7057', 0),
(32, '99', '2021-05-13 16:11:19', '0', 'undefined', 311, '0', 6, 1, '33.4300', '0.00', '1', 1, 1, 1, 1, 1, '1', '', '0.00', '2021-01-15 00:00:00', 0, '3922', 1, '', 0, '7057', 0),
(33, '100', '2021-05-13 16:13:17', '0', 'undefined', 312, '0', 6, 1, '20.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de aj', '0.00', '2021-01-15 00:00:00', 0, '3911', 1, '', 0, '7044', 0),
(34, '101', '2021-05-13 18:33:44', '0', 'undefined', 288, '0', 6, 1, '4.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de rh', '0.00', '2021-01-15 00:00:00', 0, '3917', 1, '', 0, '7049', 0),
(35, '102', '2021-05-13 18:35:37', '0', 'undefined', 309, '0', 6, 1, '24.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de uan', '0.00', '2021-01-15 00:00:00', 0, '3919', 1, '', 0, '7066', 0),
(36, '103', '2021-05-13 18:38:59', '0', 'undefined', 290, '0', 6, 1, '113.9200', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de rrhh', '0.00', '2021-01-15 00:00:00', 0, '3915', 1, '', 0, '7141', 0),
(37, '104', '2021-05-13 18:41:01', '0', 'undefined', 313, '0', 6, 1, '113.9200', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de planificacion', '0.00', '2021-01-15 00:00:00', 0, '3911', 1, '', 0, '7044', 0),
(38, '105', '2021-05-13 18:48:38', '0', 'undefined', 312, '0', 6, 1, '68.3500', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de aj', '0.00', '2021-01-15 00:00:00', 0, '3911', 1, '', 0, '7044', 0),
(39, '106', '2021-05-13 18:50:40', '0', 'undefined', 288, '0', 6, 1, '182.2700', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de ur', '0.00', '2021-01-15 00:00:00', 0, '3913', 1, '', 0, '7047', 0),
(40, '107', '2021-05-13 18:52:53', '0', 'undefined', 314, '0', 6, 1, '227.8400', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de sdg', '0.00', '2021-01-15 00:00:00', 0, '3921', 1, '', 0, '7067', 0),
(41, '108', '2021-05-13 18:55:33', '0', 'undefined', 310, '0', 6, 1, '159.4900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de em', '0.00', '2021-01-15 00:00:00', 0, '3920', 1, '', 0, '7070', 0),
(42, '109', '2021-05-13 19:10:01', '0', 'undefined', 307, '0', 6, 1, '113.9200', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de dg', '0.00', '2021-01-15 00:00:00', 0, '3924', 1, '', 0, '7075', 0),
(43, '110', '2021-05-13 19:12:00', '0', 'undefined', 290, '0', 6, 1, '134.7500', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de rrhh', '0.00', '2021-01-15 00:00:00', 0, '3915', 1, '', 0, '7041', 0),
(44, '111', '2021-05-13 19:22:21', '0', 'undefined', 315, '0', 6, 1, '215.5900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de fb', '0.00', '2021-01-15 00:00:00', 0, '3916', 1, '', 0, '7056', 0),
(45, '112', '2021-05-13 19:26:06', '0', 'undefined', 313, '0', 6, 1, '134.7500', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de plani', '0.00', '2021-01-15 00:00:00', 0, '3918', 1, '', 0, '7045', 0),
(46, '113', '2021-05-13 19:28:02', '0', 'undefined', 312, '0', 6, 1, '107.8000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de aj', '0.00', '2021-01-15 00:00:00', 0, '3911', 1, '', 0, '7044', 0),
(47, '114', '2021-05-13 19:42:11', '0', 'undefined', 288, '0', 6, 1, '538.9800', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de ur', '0.00', '2021-01-15 00:00:00', 0, '3913', 1, '', 0, '7047', 0),
(48, '115', '2021-05-13 19:57:32', '0', 'undefined', 316, '0', 6, 1, '215.5900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de uachpoi', '0.00', '2021-01-15 00:00:00', 0, '3914', 1, '', 0, '7050', 0),
(49, '116', '2021-05-13 20:18:12', '0', 'undefined', 314, '0', 6, 1, '269.4900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de sg', '0.00', '2021-01-15 00:00:00', 0, '3921', 1, '', 0, '7067', 0),
(50, '117', '2021-05-13 20:21:47', '0', 'undefined', 309, '0', 6, 1, '215.5900', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de uan', '0.00', '2021-05-15 00:00:00', 0, '3919', 1, '', 0, '7066', 0),
(51, '118', '2021-05-13 20:22:44', '0', 'undefined', 310, '0', 6, 1, '350.3400', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de em', '0.00', '2021-01-15 00:00:00', 0, '3920', 1, '', 0, '7070', 0),
(52, '119', '2021-05-13 20:37:21', '0', 'undefined', 311, '0', 6, 1, '270.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de ufa', '0.00', '2021-01-15 00:00:00', 0, '3922', 1, '', 0, '7057', 0),
(53, '120', '2021-05-13 20:38:45', '0', 'undefined', 311, '0', 6, 1, '565.1400', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de udaf', '0.00', '2021-05-15 00:00:00', 0, '3922', 1, '', 0, '7057', 0),
(54, '121', '2021-05-13 20:42:02', '0', 'undefined', 312, '0', 6, 1, '64.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de aj', '0.00', '2021-01-15 00:00:00', 0, '3911', 1, '', 0, '7044', 0),
(55, '122', '2021-05-13 20:49:26', '0', 'undefined', 288, '0', 6, 1, '48.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de ur', '0.00', '2021-01-15 00:00:00', 0, '3917', 1, '', 0, '7049', 0),
(56, '123', '2021-05-13 20:50:28', '0', 'undefined', 316, '0', 6, 1, '160.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de uachpoi', '0.00', '2021-01-15 00:00:00', 0, '3914', 1, '', 0, '7050', 0),
(57, '124', '2021-05-13 20:53:19', '0', 'undefined', 309, '0', 6, 1, '80.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'uso de uan', '0.00', '2021-01-15 00:00:00', 0, '3919', 1, '', 0, '7066', 0),
(58, '201', '2021-01-17 14:14:38', '0', '', 292, '0', 6, 1, '90.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-01-10 14:14:38', 0, '101', 2, '', 0, '', 0),
(59, '203', '2021-01-18 17:22:39', '0', '', 294, '0', 6, 1, '1724.5000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-01-05 17:22:39', 0, '103', 2, '', 0, '', 0),
(60, '125', '2021-05-16 18:03:22', '0', 'undefined', 290, '0', 6, 1, '2135.6500', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de rrhh', '0.00', '2021-01-18 00:00:00', 0, '303', 1, '', 0, '303', 0),
(61, '126', '2021-05-17 13:25:25', '0', 'undefined', 292, '0', 6, 1, '1056.3800', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de udaf', '0.00', '2021-01-17 00:00:00', 0, '78954', 1, '', 0, '1515', 0),
(62, '3333', '2021-01-14 09:06:07', '0', '', 284, '0', 6, 1, '3150.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-01-11 09:06:07', 0, '8888', 2, '', 0, '', 0),
(63, '127', '2021-05-20 09:14:03', '0', 'undefined', 292, '0', 6, 1, '399.0400', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de udaf', '0.00', '2021-01-14 00:00:00', 0, '3922', 1, '', 0, '745', 0),
(64, '128', '2021-05-20 09:56:23', '0', 'undefined', 292, '0', 6, 1, '539.1200', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de DG', '0.00', '2021-01-18 00:00:00', 0, '3924', 1, '', 0, '1041', 0),
(65, '123456', '2021-01-17 10:22:31', '0', '', 284, '0', 6, 1, '8400.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-01-17 10:22:31', 0, '9999', 2, '', 0, '', 0),
(67, '130', '2021-05-20 10:56:47', '0', 'undefined', 292, '0', 6, 1, '8400.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de aj', '0.00', '2021-01-18 00:00:00', 0, '3911', 1, '', 0, '23', 0),
(78, '140', '2021-05-21 15:47:11', '0', 'undefined', 292, '0', 6, 1, '1106.1400', '0.00', '1', 1, 1, 1, 1, 1, '1', 'consejo nacional de adopciones', '0.00', '2021-01-18 00:00:00', 0, '24152', 1, '', 0, '535326', 0),
(77, '241524', '2021-01-19 15:40:55', '0', '', 293, '0', 6, 1, '3175.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2020-12-14 15:40:55', 0, '958', 2, '', 0, '', 0),
(76, '139', '2021-05-20 16:00:50', '0', 'undefined', 290, '0', 3, 1, '1548.1800', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de rrh', '0.00', '2021-01-18 00:00:00', 0, '147', 1, '', 0, '150', 0),
(79, '141', '2021-05-23 21:34:16', '0', 'undefined', 320, '0', 6, 1, '3953.0600', '0.00', '1', 1, 1, 1, 1, 1, '1', 'fdasf', '0.00', '2021-01-17 00:00:00', 0, '200', 1, '', 0, '200', 0),
(80, '100', '2021-02-01 13:19:00', '0', '', 295, '0', 6, 1, '9135.3000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-02-01 13:19:00', 0, '58945', 2, '', 0, '', 0),
(81, '142', '2021-05-24 13:33:18', '0', 'undefined', 321, '0', 6, 1, '6305.9200', '0.00', '1', 1, 1, 1, 1, 1, '1', 'fdasfdasf', '0.00', '2021-02-02 00:00:00', 0, '200', 1, '', 0, '200', 0),
(82, '123456', '2021-02-02 09:26:32', '0', '', 293, '0', 6, 1, '14981.5000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-02-01 09:26:32', 0, '78789', 2, '', 0, '', 0),
(83, '143', '2021-05-25 09:35:34', '0', 'undefined', 288, '0', 6, 1, '4994.8100', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de registro', '0.00', '2021-02-03 00:00:00', 0, '7451', 1, '', 0, '5252', 0),
(84, '235223', '2021-02-03 12:14:48', '0', '', 284, '0', 6, 1, '13795.0000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-02-03 12:14:48', 0, '23522', 2, '', 0, '', 0),
(85, '144', '2021-05-26 13:22:26', '0', 'undefined', 288, '0', 6, 1, '13795.0000', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de registro', '0.00', '2021-02-03 00:00:00', 0, '1500', 1, '', 0, '1500', 0),
(86, '145', '2021-05-27 12:49:16', '0', 'undefined', 325, '0', 6, 1, '1854.4300', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de udaf', '0.00', '2021-02-04 00:00:00', 0, '100', 1, '', 0, '100', 0),
(87, '146', '2021-05-27 12:53:32', '0', 'undefined', 326, '0', 6, 1, '23.6500', '0.00', '1', 1, 1, 1, 1, 1, '1', 'tyu', '0.00', '2021-02-05 00:00:00', 0, '100', 1, '', 0, '100', 0),
(88, '1000', '2021-02-14 21:56:52', '0', '', 284, '0', 6, 1, '719.8000', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-02-14 21:56:52', 0, '1000', 2, '', 0, '', 0),
(89, '147', '2021-05-30 21:59:40', '0', 'undefined', 328, '0', 6, 1, '546.0400', '0.00', '1', 1, 1, 1, 1, 1, '1', 'para uso de genesis', '0.00', '2021-02-15 00:00:00', 0, '0618', 1, '', 0, '100', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `ingresosegresos`
--

INSERT INTO `ingresosegresos` (`id_detalle`, `id_cliente`, `id_vendedor`, `numero_factura`, `ot`, `id_producto`, `cantidad`, `cantidadIngreso`, `cantidadEgreso`, `precio_venta`, `tienda`, `activo`, `ven_com`, `fecha`, `precio_compra`, `tipo_doc`, `inv_ini`, `moneda`, `folio`, `nome`, `Renglon`, `Lote`, `Orden`, `Serie_fac`) VALUES
(1, 0, 6, 0, '2', '3', '152', 152, 0, '11.1177', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(2, 0, 6, 0, '2', '17', '42', 42, 0, '16.0000', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(3, 0, 6, 0, '2', '16', '54', 54, 0, '23.5475', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(4, 0, 6, 0, '2', '15', '70', 70, 0, '11.2500', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(5, 0, 6, 0, '2', '14', '91', 91, 0, '26.9491', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(6, 0, 6, 0, '2', '13', '287', 287, 0, '22.7837', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(7, 0, 6, 0, '2', '12', '48', 48, 0, '2.0000', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(8, 0, 6, 0, '2', '11', '17', 17, 0, '16.7133', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(9, 0, 6, 0, '2', '10', '19', 19, 0, '9.3900', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(10, 0, 6, 0, '2', '9', '50', 50, 0, '18.5000', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(11, 0, 6, 0, '2', '18', '7', 7, 0, '83.0000', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(12, 0, 6, 0, '2', '8', '7', 7, 0, '83.0000', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(13, 0, 6, 0, '2', '7', '7', 7, 0, '83.0000', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(14, 0, 6, 0, '2', '6', '6', 6, 0, '83.0000', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(15, 0, 6, 0, '2', '5', '23', 23, 0, '7.5000', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(16, 0, 6, 0, '2', '2', '42', 42, 0, '17.0000', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(17, 0, 6, 0, '2', '4', '52', 52, 0, '3.7500', 1, 1, 2, '2020-12-31 12:56:46', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(18, 293, 6, 200, '2', '1', '77', 77, 0, '12.0000', 1, 1, 2, '2021-01-01 12:56:46', '0.00', 1, '0.00', '1.00', '100', '', '145', '', 'caja chica', 'ab200'),
(19, 290, 6, 71, '1', '1', '77', 0, 77, '12.0000', 1, 1, 1, '2021-01-01 00:00:00', '12.00', 1, '77.00', '1.00', '50', '', '', '', 'caja chica', ''),
(20, 290, 6, 72, '1', '3', '24', 0, 24, '11.1177', 1, 1, 1, '2021-01-15 00:00:00', '11.12', 1, '152.00', '1.00', '51', '', '', '', '51', ''),
(21, 288, 6, 73, '1', '3', '10', 0, 10, '11.1177', 1, 1, 1, '2021-01-15 00:00:00', '11.12', 1, '128.00', '1.00', '3918', '', '', '', '7045', ''),
(22, 288, 6, 74, '1', '3', '12', 0, 12, '11.1177', 1, 1, 1, '2021-01-15 00:00:00', '11.12', 1, '118.00', '1.00', '3917', '', '', '', '7049', ''),
(23, 299, 6, 75, '1', '3', '12', 0, 12, '11.1177', 1, 1, 1, '2021-01-15 00:00:00', '11.12', 1, '106.00', '1.00', '3914', '', '', '', '7050', ''),
(24, 300, 6, 76, '1', '3', '5', 0, 5, '11.1177', 1, 1, 1, '2021-01-15 00:00:00', '11.12', 1, '94.00', '1.00', '3919', '', '', '', '7066', ''),
(25, 301, 6, 77, '1', '3', '12', 0, 12, '11.1177', 1, 1, 1, '2021-01-15 00:00:00', '11.12', 1, '89.00', '1.00', '3924', '', '', '', '7075', ''),
(26, 302, 6, 78, '1', '2', '6', 0, 6, '17.0000', 1, 1, 1, '2021-01-15 00:00:00', '17.00', 1, '42.00', '1.00', '3922', '', '', '', '7057', ''),
(27, 290, 6, 79, '1', '4', '10', 0, 10, '3.7500', 1, 1, 1, '2021-01-15 00:00:00', '3.75', 1, '52.00', '1.00', '3915', '', '', '', '7041', ''),
(28, 301, 6, 80, '1', '4', '3', 0, 3, '3.7500', 1, 1, 1, '2021-01-15 00:00:00', '3.75', 1, '42.00', '1.00', '3918', '', '', '', '7045', ''),
(29, 303, 6, 81, '1', '4', '8', 0, 8, '3.7500', 1, 1, 1, '2021-01-15 00:00:00', '3.75', 1, '39.00', '1.00', '3911', '', '', '', '7044', ''),
(30, 288, 6, 82, '1', '4', '2', 0, 2, '3.7500', 1, 1, 1, '2021-01-15 00:00:00', '3.75', 1, '31.00', '1.00', '3917', '', '', '', '7049', ''),
(31, 304, 6, 83, '1', '4', '6', 0, 6, '3.7500', 1, 1, 1, '2021-01-15 00:00:00', '3.75', 1, '29.00', '1.00', '3914', '', '', '', '7050', ''),
(32, 305, 6, 84, '1', '4', '3', 0, 3, '3.7500', 1, 1, 1, '2021-01-15 00:00:00', '3.75', 1, '23.00', '1.00', '3920', '', '', '', '7070', ''),
(33, 0, 6, 85, '1', '5', '6', 0, 6, '7.5000', 1, 1, 1, '2021-01-15 00:00:00', '7.50', 1, '23.00', '1.00', '3911', '', '', '', '7044', ''),
(34, 307, 6, 86, '1', '5', '1', 0, 1, '7.5000', 1, 1, 1, '2021-01-15 00:00:00', '7.50', 1, '17.00', '1.00', '3924', '', '', '', '7075', ''),
(35, 290, 6, 87, '1', '6', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-15 00:00:00', '83.00', 1, '6.00', '1.00', '3915', '', '', '', '7041', ''),
(36, 308, 6, 88, '1', '6', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-15 00:00:00', '83.00', 1, '5.00', '1.00', '3914', '', '', '', '7050', ''),
(37, 309, 6, 89, '1', '6', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-15 00:00:00', '83.00', 1, '4.00', '1.00', '3919', '', '', '', '3920', ''),
(38, 310, 6, 90, '1', '6', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-15 00:00:00', '83.00', 1, '3.00', '1.00', '3920', '', '', '', '7070', ''),
(39, 290, 6, 91, '1', '7', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-15 00:00:00', '83.00', 1, '7.00', '1.00', '3915', '', '', '', '7041', ''),
(40, 308, 6, 92, '1', '7', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-15 00:00:00', '83.00', 1, '6.00', '1.00', '3914', '', '', '', '7050', ''),
(41, 290, 6, 93, '1', '8', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-15 00:00:00', '83.00', 1, '7.00', '1.00', '3915', '', '', '', '7041', ''),
(42, 308, 6, 94, '1', '8', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-15 00:00:00', '83.00', 1, '6.00', '1.00', '3914', '', '', '', '7050', ''),
(43, 308, 6, 95, '1', '18', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-15 00:00:00', '83.00', 1, '7.00', '1.00', '3915', '', '', '', '7041', ''),
(44, 290, 6, 96, '1', '18', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-15 00:00:00', '83.00', 1, '6.00', '1.00', '3915', '', '', '', '7041', ''),
(45, 311, 6, 97, '1', '9', '20', 0, 20, '18.5000', 1, 1, 1, '2021-01-15 00:00:00', '18.50', 1, '50.00', '1.00', '3922', '', '', '', '7057', ''),
(46, 311, 6, 98, '1', '10', '2', 0, 2, '9.3900', 1, 1, 1, '2021-01-15 00:00:00', '9.39', 1, '19.00', '1.00', '3922', '', '', '', '7057', ''),
(47, 311, 6, 99, '1', '11', '2', 0, 2, '16.7133', 1, 1, 1, '2021-01-15 00:00:00', '16.71', 1, '17.00', '1.00', '3922', '', '', '', '7057', ''),
(48, 312, 6, 100, '1', '12', '10', 0, 10, '2.0000', 1, 1, 1, '2021-01-15 00:00:00', '2.00', 1, '48.00', '1.00', '3911', '', '', '', '7044', ''),
(49, 288, 6, 101, '1', '12', '2', 0, 2, '2.0000', 1, 1, 1, '2021-01-15 00:00:00', '2.00', 1, '38.00', '1.00', '3917', '', '', '', '7049', ''),
(50, 309, 6, 102, '1', '12', '12', 0, 12, '2.0000', 1, 1, 1, '2021-01-15 00:00:00', '2.00', 1, '36.00', '1.00', '3919', '', '', '', '7066', ''),
(51, 290, 6, 103, '1', '13', '5', 0, 5, '22.7837', 1, 1, 1, '2021-01-15 00:00:00', '22.78', 1, '287.00', '1.00', '3915', '', '', '', '7141', ''),
(52, 313, 6, 104, '1', '13', '5', 0, 5, '22.7837', 1, 1, 1, '2021-01-15 00:00:00', '22.78', 1, '282.00', '1.00', '3911', '', '', '', '7044', ''),
(53, 312, 6, 105, '1', '13', '3', 0, 3, '22.7837', 1, 1, 1, '2021-01-15 00:00:00', '22.78', 1, '277.00', '1.00', '3911', '', '', '', '7044', ''),
(54, 288, 6, 106, '1', '13', '8', 0, 8, '22.7837', 1, 1, 1, '2021-01-15 00:00:00', '22.78', 1, '274.00', '1.00', '3913', '', '', '', '7047', ''),
(55, 314, 6, 107, '1', '13', '10', 0, 10, '22.7837', 1, 1, 1, '2021-01-15 00:00:00', '22.78', 1, '266.00', '1.00', '3921', '', '', '', '7067', ''),
(56, 310, 6, 108, '1', '13', '7', 0, 7, '22.7837', 1, 1, 1, '2021-01-15 00:00:00', '22.78', 1, '256.00', '1.00', '3920', '', '', '', '7070', ''),
(57, 307, 6, 109, '1', '13', '5', 0, 5, '22.7837', 1, 1, 1, '2021-01-15 00:00:00', '22.78', 1, '249.00', '1.00', '3924', '', '', '', '7075', ''),
(58, 290, 6, 110, '1', '14', '5', 0, 5, '26.9491', 1, 1, 1, '2021-01-15 00:00:00', '26.95', 1, '91.00', '1.00', '3915', '', '', '', '7041', ''),
(59, 315, 6, 111, '1', '14', '8', 0, 8, '26.9491', 1, 1, 1, '2021-01-15 00:00:00', '26.95', 1, '86.00', '1.00', '3916', '', '', '', '7056', ''),
(60, 313, 6, 112, '1', '14', '5', 0, 5, '26.9491', 1, 1, 1, '2021-01-15 00:00:00', '26.95', 1, '78.00', '1.00', '3918', '', '', '', '7045', ''),
(61, 312, 6, 113, '1', '14', '4', 0, 4, '26.9491', 1, 1, 1, '2021-01-15 00:00:00', '26.95', 1, '73.00', '1.00', '3911', '', '', '', '7044', ''),
(62, 288, 6, 114, '1', '14', '20', 0, 20, '26.9491', 1, 1, 1, '2021-01-15 00:00:00', '26.95', 1, '69.00', '1.00', '3913', '', '', '', '7047', ''),
(63, 316, 6, 115, '1', '14', '8', 0, 8, '26.9491', 1, 1, 1, '2021-01-15 00:00:00', '26.95', 1, '49.00', '1.00', '3914', '', '', '', '7050', ''),
(64, 314, 6, 116, '1', '14', '10', 0, 10, '26.9491', 1, 1, 1, '2021-01-15 00:00:00', '26.95', 1, '41.00', '1.00', '3921', '', '', '', '7067', ''),
(65, 309, 6, 117, '1', '14', '8', 0, 8, '26.9491', 1, 1, 1, '2021-01-15 00:00:00', '26.95', 1, '31.00', '1.00', '3919', '', '', '', '7066', ''),
(66, 310, 6, 118, '1', '14', '13', 0, 13, '26.9491', 1, 1, 1, '2021-01-15 00:00:00', '26.95', 1, '23.00', '1.00', '3920', '', '', '', '7070', ''),
(67, 311, 6, 119, '1', '15', '24', 0, 24, '11.2500', 1, 1, 1, '2021-01-15 00:00:00', '11.25', 1, '70.00', '1.00', '3922', '', '', '', '7057', ''),
(68, 311, 6, 120, '1', '16', '24', 0, 24, '23.5475', 1, 1, 1, '2021-01-15 00:00:00', '23.55', 1, '54.00', '1.00', '3922', '', '', '', '7057', ''),
(69, 312, 6, 121, '1', '17', '4', 0, 4, '16.0000', 1, 1, 1, '2021-01-15 00:00:00', '16.00', 1, '42.00', '1.00', '3911', '', '', '', '7044', ''),
(70, 288, 6, 122, '1', '17', '3', 0, 3, '16.0000', 1, 1, 1, '2021-01-15 00:00:00', '16.00', 1, '38.00', '1.00', '3917', '', '', '', '7049', ''),
(71, 316, 6, 123, '1', '17', '10', 0, 10, '16.0000', 1, 1, 1, '2021-01-15 00:00:00', '16.00', 1, '35.00', '1.00', '3914', '', '', '', '7050', ''),
(72, 309, 6, 124, '1', '17', '5', 0, 5, '16.0000', 1, 1, 1, '2021-01-15 00:00:00', '16.00', 1, '25.00', '1.00', '3919', '', '', '', '7066', ''),
(73, 292, 6, 201, '2', '5', '10', 10, 0, '9.0000', 1, 1, 2, '2021-01-17 14:14:38', '0.00', 1, '16.00', '1.00', '101', '', '120', '', 'caja chica', 'ab201'),
(74, 294, 6, 203, '2', '2', '14', 14, 0, '19.0000', 1, 1, 2, '2021-01-18 17:22:39', '0.00', 1, '36.00', '1.00', '103', '', '320', '', '74', 'ab203'),
(75, 294, 6, 203, '2', '1', '100', 100, 0, '11.2500', 1, 1, 2, '2021-01-18 17:22:39', '0.00', 1, '0.00', '1.00', '103', '', '320', '', '74', 'ab203'),
(76, 294, 6, 203, '2', '3', '23', 23, 0, '14.5000', 1, 1, 2, '2021-01-18 17:22:39', '0.00', 1, '77.00', '1.00', '103', '', '420', '', '74', 'ab203'),
(77, 290, 6, 125, '1', '18', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-18 00:00:00', '83.00', 1, '5.00', '1.00', '303', '', '', '', '303', ''),
(78, 290, 6, 125, '1', '8', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-18 00:00:00', '83.00', 1, '5.00', '1.00', '303', '', '', '', '303', ''),
(79, 290, 6, 125, '1', '7', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-18 00:00:00', '83.00', 1, '5.00', '1.00', '303', '', '', '', '303', ''),
(80, 290, 6, 125, '1', '6', '1', 0, 1, '83.0000', 1, 1, 1, '2021-01-18 00:00:00', '83.00', 1, '2.00', '1.00', '303', '', '', '', '303', ''),
(81, 290, 6, 125, '1', '1', '45', 0, 45, '11.2500', 1, 1, 1, '2021-01-18 00:00:00', '11.25', 1, '100.00', '1.00', '303', '', '', '', '303', ''),
(82, 290, 6, 125, '1', '3', '50', 0, 50, '11.9000', 1, 1, 1, '2021-01-18 00:00:00', '11.90', 1, '100.00', '1.00', '303', '', '', '', '303', ''),
(83, 290, 6, 125, '1', '2', '40', 0, 40, '17.5600', 1, 1, 1, '2021-01-18 00:00:00', '17.56', 1, '50.00', '1.00', '303', '', '', '', '303', ''),
(84, 292, 0, 126, '1', '14', '2', 0, 2, '26.9491', 1, 1, 1, '2021-01-17 00:00:00', '26.95', 1, '10.00', '1.00', '78954', '', '', '', '1515', ''),
(85, 292, 0, 126, '1', '13', '44', 0, 44, '22.7837', 1, 1, 1, '2021-01-17 00:00:00', '22.78', 1, '244.00', '1.00', '78954', '', '', '', '1515', ''),
(86, 284, 6, 3333, '2', '1', '200', 200, 0, '15.7500', 1, 1, 2, '2021-01-14 09:06:07', '0.00', 1, '55.00', '1.00', '8888', '', '120', '', '456', 'ab3333'),
(87, 292, 0, 127, '1', '1', '27', 0, 27, '14.7794', 1, 1, 1, '2021-01-14 00:00:00', '14.78', 1, '255.00', '1.00', '3922', '', '', '', '745', ''),
(88, 292, 6, 128, '1', '1', '28', 0, 28, '14.7794', 1, 1, 1, '2021-01-18 00:00:00', '14.78', 1, '228.00', '1.00', '3924', '', '', '', '1041', ''),
(89, 292, 6, 128, '1', '4', '10', 0, 10, '3.7500', 1, 1, 1, '2021-01-18 00:00:00', '3.75', 1, '20.00', '1.00', '3924', '', '', '', '1041', ''),
(90, 292, 6, 128, '1', '2', '5', 0, 5, '17.5600', 1, 1, 1, '2021-01-18 00:00:00', '17.56', 1, '10.00', '1.00', '3924', '', '', '', '1041', ''),
(91, 284, 6, 123456, '2', '19', '1', 1, 0, '8400.0000', 1, 1, 2, '2021-01-17 10:22:31', '0.00', 1, '0.00', '1.00', '9999', '123', '444', 'ccc444', '7213', 'ab123456'),
(93, 292, 6, 130, '1', '19', '1', 0, 1, '8400.0000', 1, 1, 1, '2021-01-18 00:00:00', '8400.00', 1, '1.00', '1.00', '3911', '', '', '1', '23', ''),
(94, 290, 3, 139, '1', '1', '100', 0, 100, '14.7794', 1, 1, 1, '2021-01-18 00:00:00', '14.78', 1, '200.00', '1.00', '147', '', '', '', '150', ''),
(95, 290, 3, 139, '1', '2', '4', 0, 4, '17.5600', 1, 1, 1, '2021-01-18 00:00:00', '17.56', 1, '5.00', '1.00', '147', '', '', '', '150', ''),
(96, 293, 6, 241524, '2', '10', '100', 100, 0, '12.5000', 1, 1, 2, '2021-01-19 15:40:55', '0.00', 1, '17.00', '1.00', '958', '', '250', '', '532653', '241524ab'),
(97, 293, 6, 241524, '2', '8', '5', 5, 0, '90.0000', 1, 1, 2, '2021-01-19 15:40:55', '0.00', 1, '4.00', '1.00', '958', '', '250', '', '532653', '241524ab'),
(98, 293, 6, 241524, '2', '11', '100', 100, 0, '14.7500', 1, 1, 2, '2021-01-19 15:40:55', '0.00', 1, '15.00', '1.00', '958', '', '320', '', '532653', '241524ab'),
(99, 292, 6, 140, '1', '8', '2', 0, 2, '86.8889', 1, 1, 1, '2021-01-18 00:00:00', '86.89', 1, '9.00', '1.00', '24152', '', '', '', '535326', ''),
(100, 292, 6, 140, '1', '11', '41', 0, 41, '15.0061', 1, 1, 1, '2021-01-18 00:00:00', '15.01', 1, '115.00', '1.00', '24152', '', '', '', '535326', ''),
(101, 292, 6, 140, '1', '10', '23', 0, 23, '12.0481', 1, 1, 1, '2021-01-18 00:00:00', '12.05', 1, '117.00', '1.00', '24152', '', '', '', '535326', ''),
(102, 292, 6, 140, '1', '12', '20', 0, 20, '2.0000', 1, 1, 1, '2021-01-18 00:00:00', '2.00', 1, '24.00', '1.00', '24152', '', '', '', '535326', ''),
(103, 320, 6, 141, '1', '3', '35', 0, 35, '11.9000', 1, 1, 1, '2021-01-17 00:00:00', '11.90', 1, '50.00', '1.00', '200', '', '', '', '200', ''),
(104, 320, 6, 141, '1', '3', '10', 0, 10, '11.9000', 1, 1, 1, '2021-01-17 00:00:00', '11.90', 1, '15.00', '1.00', '200', '', '', '', '200', ''),
(105, 320, 6, 141, '1', '13', '150', 0, 150, '22.7837', 1, 1, 1, '2021-01-17 00:00:00', '22.78', 1, '200.00', '1.00', '200', '', '', '', '200', ''),
(106, 295, 6, 100, '2', '2', '200', 200, 0, '19.9600', 1, 1, 2, '2021-02-01 13:19:00', '0.00', 1, '1.00', '1.00', '58945', '', '121', '', '1001', '102'),
(107, 295, 6, 100, '2', '1', '100', 100, 0, '14.3300', 1, 1, 2, '2021-02-01 13:19:00', '0.00', 1, '100.00', '1.00', '58945', '', '120', '', '1001', '102'),
(108, 295, 6, 100, '2', '3', '55', 55, 0, '67.4600', 1, 1, 2, '2021-02-01 13:19:00', '0.00', 1, '5.00', '1.00', '58945', '', '122', '', '1001', '102'),
(109, 321, 6, 142, '1', '3', '40', 0, 40, '62.8300', 1, 1, 1, '2021-02-02 00:00:00', '62.83', 1, '60.00', '1.00', '200', '', '', '', '200', ''),
(110, 321, 6, 142, '1', '2', '150', 0, 150, '19.9481', 1, 1, 1, '2021-02-02 00:00:00', '19.95', 1, '201.00', '1.00', '200', '', '', '', '200', ''),
(111, 321, 6, 142, '1', '1', '55', 0, 55, '14.5547', 1, 1, 1, '2021-02-02 00:00:00', '14.55', 1, '200.00', '1.00', '200', '', '', '', '200', ''),
(112, 293, 6, 123456, '2', '14', '250', 250, 0, '26.6500', 1, 1, 2, '2021-02-02 09:26:32', '0.00', 1, '8.00', '1.00', '78789', '', '320', '', 'caja chica', '123456ab'),
(113, 293, 6, 123456, '2', '15', '180', 180, 0, '12.5000', 1, 1, 2, '2021-02-02 09:26:32', '0.00', 1, '46.00', '1.00', '78789', '', '261', '', 'caja chica', '123456ab'),
(114, 293, 6, 123456, '2', '16', '180', 180, 0, '25.3000', 1, 1, 2, '2021-02-02 09:26:32', '0.00', 1, '30.00', '1.00', '78789', '', '261', '', 'caja chica', '123456ab'),
(115, 293, 6, 123456, '2', '3', '150', 150, 0, '10.1000', 1, 1, 2, '2021-02-02 09:26:32', '0.00', 1, '20.00', '1.00', '78789', '', '261', '', 'caja chica', '123456ab'),
(116, 288, 6, 143, '1', '15', '49', 0, 49, '12.2456', 1, 1, 1, '2021-02-03 00:00:00', '12.25', 1, '226.00', '1.00', '7451', '', '', '', '5252', ''),
(117, 288, 6, 143, '1', '16', '56', 0, 56, '25.0496', 1, 1, 1, '2021-02-03 00:00:00', '25.05', 1, '210.00', '1.00', '7451', '', '', '', '5252', ''),
(118, 288, 6, 143, '1', '14', '100', 0, 100, '26.6593', 1, 1, 1, '2021-02-03 00:00:00', '26.66', 1, '258.00', '1.00', '7451', '', '', '', '5252', ''),
(119, 288, 6, 143, '1', '3', '20', 0, 20, '16.3035', 1, 1, 1, '2021-02-03 00:00:00', '16.30', 1, '170.00', '1.00', '7451', '', '', '', '5252', ''),
(120, 284, 6, 235223, '2', '20', '1', 1, 0, '845.0000', 1, 1, 2, '2021-02-03 12:14:48', '0.00', 1, '0.00', '1.00', '23522', 'aaa', '328', '111ccc', '232323', 'ab235223'),
(121, 284, 6, 235223, '2', '21', '1', 1, 0, '12950.0000', 1, 1, 2, '2021-02-03 12:14:48', '0.00', 1, '0.00', '1.00', '23522', '00417CB1', '328', 'CND9013YST', '232323', 'ab235223'),
(122, 288, 6, 144, '1', '21', '1', 0, 1, '12950.0000', 1, 1, 1, '2021-02-03 00:00:00', '12950.00', 1, '1.00', '1.00', '1500', '', '', 'CND9013YST', '1500', ''),
(123, 288, 6, 144, '1', '20', '1', 0, 1, '845.0000', 1, 1, 1, '2021-02-03 00:00:00', '845.00', 1, '1.00', '1.00', '1500', '', '', '111ccc', '1500', ''),
(124, 325, 6, 145, '1', '1', '100', 0, 100, '14.5547', 1, 1, 1, '2021-02-04 00:00:00', '14.55', 1, '145.00', '1.00', '100', '', '', '', '100', ''),
(125, 325, 6, 145, '1', '2', '20', 0, 20, '19.9481', 1, 1, 1, '2021-02-04 00:00:00', '19.95', 1, '51.00', '1.00', '100', '', '', '', '100', ''),
(126, 326, 6, 146, '1', '5', '2', 0, 2, '8.0769', 1, 1, 1, '2021-02-05 00:00:00', '8.08', 1, '26.00', '1.00', '100', '', '', '', '100', ''),
(127, 326, 6, 146, '1', '4', '2', 0, 2, '3.7500', 1, 1, 1, '2021-02-05 00:00:00', '3.75', 1, '10.00', '1.00', '100', '', '', '', '100', ''),
(128, 284, 6, 1000, '2', '2', '30', 30, 0, '15.6600', 1, 1, 2, '2021-02-14 21:56:52', '0.00', 1, '31.00', '1.00', '1000', '', '150', '', '200', 'ab1000'),
(129, 284, 6, 1000, '2', '1', '20', 20, 0, '12.5000', 1, 1, 2, '2021-02-14 21:56:52', '0.00', 1, '45.00', '1.00', '1000', '', '130', '', '200', 'ab1000'),
(130, 328, 6, 147, '1', '2', '15', 0, 15, '17.8392', 1, 1, 1, '2021-02-15 00:00:00', '17.84', 1, '61.00', '1.00', '0618', '', '', '', '100', ''),
(131, 328, 6, 147, '1', '1', '20', 0, 20, '13.9225', 1, 1, 1, '2021-02-15 00:00:00', '13.92', 1, '65.00', '1.00', '0618', '', '', '', '100', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `status_producto`, `date_added`, `precio_producto`, `costo_producto`, `mon_costo`, `mon_venta`, `max`, `desc_corta`, `color`, `b1`, `b2`, `b3`, `b4`, `b5`, `b6`, `cat_pro`, `pro_ser`, `foto1`, `foto2`, `foto3`, `foto4`, `fecha_caducidad`, `pre_web`, `descripcion`, `descripcion1`, `megusta`, `nomegusta`, `precio2`, `precio3`, `und_pro`, `barras`, `dcto`, `min`) VALUES
(1, 'ag', 'AGUA PURA', 1, '2021-05-13 10:03:23', '12.5000', '13.9225', '1.00', 1, '100', 'agua pura garrafÃ³n ', 'agua pura garrafÃ³n marca salvidas', '45.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-06-24', '0.00', '1', '', 0, 0, '13.9225', '0.00', 1, '417299436582', '0.00', '10.00'),
(2, 'az', 'azucar morena', 1, '2021-05-13 10:04:20', '15.6600', '17.8392', '1.00', 1, '80', 'azÃºcar morena ', 'azÃºcar morena caÃ±areal ', '46.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-03-21', '0.00', '1', '', 0, 0, '17.8392', '0.00', 1, '932222709353', '0.00', '10.00'),
(3, 'arc', 'ARCHIVADORES TAMAÃ‘O OFICIO', 1, '2021-05-13 10:06:11', '10.1000', '16.3035', '1.00', 1, '50', 'archivadores tamaÃ±o oficio ', 'archivadores tamaÃ±ao oficio color negro ', '150.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '16.3035', '0.00', 1, '397012743262', '0.00', '5.00'),
(4, 'bn', 'BANDERITAS PARA DOCTOS.', 1, '2021-05-13 10:07:07', '3.7500', '3.7500', '1.00', 1, '60', 'BANDERITAS PARA DOCTOS.', 'BANDERITAS PARA DOCTOS.', '8.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '3.7500', '0.00', 1, '', '0.00', '40.00'),
(5, 'brp', 'BARRAS GOMA PRITT', 1, '2021-05-13 10:08:06', '9.0000', '8.0769', '1.00', 1, '100', 'BARRAS GOMA PRITT', 'BARRAS GOMA PRITT', '24.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '7.5000', '0.00', 1, '', '0.00', '4.00'),
(6, 'CEP1', 'C.EPSON T6641 NEGRO', 1, '2021-05-13 10:09:37', '83.0000', '83.0000', '1.00', 1, '100', 'C.EPSON T6641 NEGRO', 'C.EPSON T6641 NEGRO', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '0', '', 0, 0, '83.0000', '0.00', 1, '', '0.00', '5.00'),
(7, 'cep2', 'C.EPSON T6642 CYAN', 1, '2021-05-13 10:10:25', '83.0000', '83.0000', '1.00', 1, '100', 'C.EPSON T6642 CYAN', 'C.EPSON T6642 CYAN', '4.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '83.0000', '0.00', 1, '', '0.00', '4.00'),
(8, 'cep3', 'C.EPSON T6643 MAGENTA', 1, '2021-05-13 10:10:52', '90.0000', '86.8889', '1.00', 1, '100', 'C.EPSON T6643 MAGENTA', 'C.EPSON T6643 MAGENTA', '7.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '86.8889', '0.00', 1, '', '0.00', '2.00'),
(9, 'cfe', 'CAFE MOLIDO', 1, '2021-05-13 10:11:23', '18.5000', '18.5000', '1.00', 1, '80', 'CAFE MOLIDO', 'CAFE MOLIDO', '30.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '0', '', 0, 0, '18.5000', '0.00', 1, '', '0.00', '2.00'),
(10, 'clr', 'GALON DE CLORO', 1, '2021-05-13 10:12:41', '12.5000', '12.0481', '1.00', 1, '50', 'GALON DE CLORO', 'GALON DE CLORO', '94.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto10.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-12-22', '0.00', '0', '', 0, 0, '12.0481', '0.00', 1, '', '0.00', '5.00'),
(11, 'dcf', 'GALON DE DESINFECTANTE', 1, '2021-05-13 10:13:43', '14.7500', '15.0061', '1.00', 1, '80', 'GALON DE DESINFECTANTE', 'GALON DE DESINFECTANTE', '74.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-10-21', '0.00', '0', '', 0, 0, '15.0061', '0.00', 1, '', '0.00', '2.00'),
(12, 'rs', 'RESALTADORES', 1, '2021-05-13 10:14:05', '2.0000', '2.0000', '1.00', 1, '100', 'RESALTADORES', 'RESALTADORES', '4.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '0', '', 0, 0, '2.0000', '0.00', 1, '', '0.00', '1.00'),
(13, 'rsh', 'RESMAS CARTA', 1, '2021-05-13 10:14:26', '22.7837', '22.7837', '1.00', 1, '100', 'RESMAS CARTA', 'RESMAS CARTA', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '0', '', 0, 0, '22.7837', '0.00', 1, '', '0.00', '2.00'),
(14, 'rsho', 'RESMAS OFICIO', 1, '2021-05-13 10:14:50', '26.6500', '26.6593', '1.00', 1, '100', 'RESMAS OFICIO', 'RESMAS OFICIO', '158.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '0', '', 0, 0, '26.6593', '0.00', 1, '', '0.00', '5.00'),
(15, 'rll', 'ROLLO PAPEL HIGIENICO', 1, '2021-05-13 10:15:22', '12.5000', '12.2456', '1.00', 1, '200', 'ROLLO PAPEL HIGIENICO', 'ROLLO PAPEL HIGIENICO', '177.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '12.2456', '0.00', 1, '', '0.00', '2.00'),
(16, 'rllsm', 'Rollo Toalla secamano', 1, '2021-05-13 10:15:47', '25.3000', '25.0496', '1.00', 1, '80', 'Rollo Toalla secamano', 'Rollo Toalla secamano', '154.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '0', '', 0, 0, '25.0496', '0.00', 1, '', '0.00', '2.00'),
(17, 'tp', 'TAPE MAGICO', 1, '2021-05-13 10:16:18', '16.0000', '16.0000', '1.00', 1, '20', 'TAPE MAGICO', 'TAPE MAGICO', '20.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '0', '', 0, 0, '16.0000', '0.00', 1, '', '0.00', '1.00'),
(18, 'cp4', 'C.EPSON T6644 Amarillo ', 1, '2021-05-13 10:18:48', '83.0000', '83.0000', '1.00', 1, '200', 'C.EPSON T6644 Amarillo', 'C.EPSON T6644 Amarillo', '4.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '0', '', 0, 0, '83.0000', '0.00', 1, '0', '0.00', '100.00'),
(19, 'comp1', 'Computadora de escritorio', 1, '2021-05-20 10:22:19', '8400.0000', '8400.0000', '1.00', 1, '10', 'computadora de escritorio hp ', 'Computadora de escritorio marca HP bluethot mouse serie xx44', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '0', '', 0, 0, '8400.0000', '0.00', 1, '', '0.00', '1.00'),
(20, '1232.03-ASE-003-CNA', 'Ala secretarial para escritorio', 1, '2021-05-26 12:11:03', '845.0000', '845.0000', '1.00', 1, '10', 'Ala secretarial para escritorio Office Master', 'Ala secretarial para escritorio Office Master', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '845.0000', '0.00', 1, '285239093211', '0.00', '1.00'),
(21, '00417CB1', 'Computadora portÃ¡til personal Marca HP', 1, '2021-05-26 12:12:00', '12950.0000', '12950.0000', '1.00', 1, '10', 'Computadora portÃ¡til personal Marca HP, Modelo Pa', 'Computadora portÃ¡til personal Marca HP, Modelo Pavilion 15-cx0045nr, nÃºmero de serie CND9013YST, Procesador Intel i7 desde 2,2 GHz hasta 4,1 GHz de octava generaciÃ³n, 16 GB de RAM, coprocesador de graficos NVIDIA GeForce GTX 1050, pantalla de 15.6 pulgadas con resoluciÃ³n de 1920x1080, 1 TB de disco duro, puertos RJ45 Y USB, 802.11 ac WI-FI + Bluetooth, baterÃ­a de Ion litio con 5 horas de duraciÃ³n, licencia de sistema operativo Windows 10 pro, incluye mochila y mouse', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '1', '', 0, 0, '12950.0000', '0.00', 1, '', '0.00', '1.00');

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
(0, 88, 'ACTIVIDADES CENTRALES', 4545, '2021-05-31 02:11:06'),
(1, 3, 'ACTIVIDADES CENTRALES', 200, '2021-05-13 17:57:55'),
(2, 3, 'ASESORIA A MADRES Y/O PADRES BIOLOGICOS EN CONFLICTO CON SU PARENTALIDAD', 200, '2021-05-13 17:57:55'),
(3, 3, 'AUTORIZACION Y SUPERVISION DE HOGARES DE PROTECCION, ABRIGO Y CUIDADO DE NNA Y ORGANISMO INTERNACIONALES', 200, '2021-05-13 17:57:55'),
(4, 58, 'RESTITUCION DE LOS DERECHOS DEL NNA', 201, '2021-05-16 19:17:18'),
(5, 59, 'ACTIVIDADES CENTRALES', 203, '2021-05-16 22:27:08'),
(6, 62, 'ASESORIA A MADRES Y/O PADRES BIOLOGICOS EN CONFLICTO CON SU PARENTALIDAD', 3333, '2021-05-20 14:07:25'),
(7, 77, 'ACTIVIDADES CENTRALES', 241524, '2021-05-21 20:45:20'),
(8, 77, 'ASESORIA A MADRES Y/O PADRES BIOLOGICOS EN CONFLICTO CON SU PARENTALIDAD', 241524, '2021-05-21 20:45:20'),
(9, 80, 'ACTIVIDADES CENTRALES', 100, '2021-05-24 18:21:57'),
(10, 80, 'RESTITUCION DE LOS DERECHOS DEL NNA', 100, '2021-05-24 18:21:57'),
(11, 82, 'ACTIVIDADES CENTRALES', 123456, '2021-05-25 14:29:38'),
(12, 84, 'ACTIVIDADES CENTRALES', 235223, '2021-05-26 17:16:50');

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
(1, 'Encargado de inventarios ', 1, 'UDAF'),
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
(1, '0.0000', '2020-11-01', '2020-11-30'),
(15, '18218.2863', '2020-12-01', '2020-12-31'),
(16, '18218.2863', '2020-12-01', '2020-12-31'),
(17, '18218.2863', '2021-01-01', '2021-01-31'),
(18, '18218.2863', '2021-01-01', '2021-01-31'),
(19, '17951.4627', '2021-01-01', '2021-01-31'),
(20, '18218.2863', '2020-12-01', '2020-12-31'),
(21, '17951.4627', '2021-01-01', '2021-01-31'),
(22, '17951.4627', '2021-01-01', '2021-01-31'),
(23, '17951.4627', '2021-01-01', '2021-01-31'),
(24, '11460.0372', '2021-01-01', '2021-01-31'),
(25, '11460.0372', '2021-01-01', '2021-01-31'),
(26, '11460.0372', '2021-01-01', '2021-01-31'),
(27, '11550.0372', '2021-01-01', '2021-01-31'),
(28, '11550.0372', '2021-01-01', '2021-01-31'),
(29, '11550.0372', '2021-01-01', '2021-01-31'),
(30, '11550.0372', '2021-01-01', '2021-01-31'),
(31, '11550.0372', '2021-01-01', '2021-01-31'),
(32, '11550.0372', '2021-01-01', '2021-01-31'),
(33, '11550.0372', '2021-01-01', '2021-01-31'),
(34, '13274.9782', '2021-01-01', '2021-01-31'),
(35, '13274.9782', '2021-01-01', '2021-01-31'),
(36, '13274.9782', '2021-01-01', '2021-01-31'),
(37, '13274.9782', '2021-01-01', '2021-01-31'),
(38, '11139.3282', '2021-02-01', '2021-01-31'),
(39, '11139.3282', '2021-01-01', '2021-01-31'),
(40, '11139.3282', '2021-01-01', '2021-01-31'),
(41, '10082.9454', '2021-01-01', '2021-01-31'),
(42, '10082.9454', '2021-01-01', '2021-05-31'),
(43, '10082.9454', '2021-01-01', '2021-01-31'),
(44, '10082.9454', '2021-01-01', '2021-01-31'),
(45, '10082.9454', '2021-01-01', '2021-01-31'),
(46, '10082.9454', '2021-01-01', '2021-01-31'),
(47, '10082.9454', '2021-01-01', '2021-01-31'),
(48, '10082.9454', '2021-01-01', '2021-01-31'),
(49, '10082.9454', '2021-01-01', '2021-01-31'),
(50, '10082.9454', '2021-01-01', '2021-01-31'),
(51, '10082.9454', '2021-01-01', '2021-01-31'),
(52, '10082.9454', '2021-01-01', '2021-01-31'),
(53, '10082.9454', '2021-01-01', '2021-01-31'),
(54, '10082.9454', '2021-01-01', '2021-01-31'),
(55, '0.0000', '2021-01-01', '2021-01-31'),
(56, '10082.9454', '2021-01-01', '2021-01-31'),
(57, '10082.9454', '2021-01-01', '2021-01-31'),
(58, '10082.9454', '2021-01-01', '2021-01-31'),
(59, '10082.9454', '2021-01-01', '2021-01-31'),
(60, '10082.9454', '2021-01-01', '2021-01-31'),
(61, '10082.9454', '2021-01-01', '2021-01-31'),
(62, '13232.9454', '2021-01-01', '2021-01-31'),
(63, '12833.9013', '2021-01-01', '2021-01-31'),
(64, '12294.7778', '2021-01-01', '2021-01-31'),
(65, '20694.7778', '2021-01-01', '2021-01-31'),
(66, '12294.7778', '2021-01-01', '2021-01-31'),
(67, '10746.5966', '2021-01-01', '2021-05-20'),
(68, '10746.5966', '2021-01-01', '2021-01-31'),
(69, '10746.5966', '2021-01-01', '2021-01-31'),
(70, '13921.5967', '2021-01-01', '2021-01-31'),
(71, '12815.4627', '2021-01-01', '2021-01-31'),
(72, '12815.4627', '2021-01-01', '2021-01-31'),
(73, '8862.4017', '2021-01-01', '2021-01-31'),
(74, '8862.4017', '2021-01-01', '2021-01-31'),
(75, '8862.4017', '2021-01-01', '2021-01-31'),
(76, '8862.4017', '2021-01-01', '2021-01-31'),
(77, '17997.7018', '2021-02-01', '2021-02-28'),
(78, '11691.7840', '2021-02-01', '2021-02-28'),
(79, '11691.7840', '2021-02-01', '2021-02-28'),
(80, '11691.7840', '2021-02-01', '2021-02-28'),
(81, '26673.2839', '2021-02-01', '2021-02-28'),
(82, '21678.4727', '2021-02-01', '2021-02-28'),
(83, '32523.4727', '2021-02-01', '2021-02-28'),
(84, '35473.4681', '2021-02-01', '2021-02-28'),
(85, '21678.4681', '2021-02-01', '2021-02-28'),
(86, '21678.4681', '2021-02-01', '2021-02-28'),
(87, '21678.4681', '2021-02-01', '2021-02-28'),
(88, '19800.3823', '2021-02-01', '2021-02-28'),
(89, '19800.3823', '2021-02-01', '2021-02-28');

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

INSERT INTO `tarjeta_responsabilidad` (`id_detalle`, `id_cliente`, `id_vendedor`, `numero_factura`, `ot`, `id_producto`, `cantidad`, `cantidadIngreso`, `cantidadEgreso`, `precio_venta`, `tienda`, `activo`, `ven_com`, `fecha`, `precio_compra`, `tipo_doc`, `inv_ini`, `moneda`, `folio`, `nome`, `Renglon`, `Lote`, `Orden`, `Serie_fac`) VALUES
(1, 328, 6, 147, '1', '20', '1', 0, 1, '845.0000', 1, 1, 1, '2020-12-01 00:00:00', '845.00', 1, '0.00', '1.00', '0618', '', '', '111ccc', 'undefined', ''),
(2, 328, 6, 147, '1', '21', '1', 0, 1, '12950.0000', 1, 1, 1, '2020-12-28 00:00:00', '12950.00', 1, '0.00', '1.00', '0618', '', '', '', 'undefined', ''),
(3, 291, 6, 148, '1', '7', '1', 0, 1, '83.0000', 1, 1, 1, '2021-05-01 00:00:00', '83.00', 1, '4.00', '1.00', '5', '', '', '', 'undefined', ''),
(4, 291, 6, 148, '1', '8', '1', 0, 1, '86.8889', 1, 1, 1, '2021-05-01 00:00:00', '86.89', 1, '7.00', '1.00', '5', '', '', '', 'undefined', '');

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
(3, 'UDAF', 'Unidad De Administración Financiera', 1);

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
(3, 'Hugo Marco Vasquez', 'Hz08*cna', 'hvasquez', '\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?', '00:00:00', 'hvasquezg2@miumg.edu.gt', '2021-03-18 15:11:06', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '2126145170901', 'Guatemala', '145', 1, 'usuario3.jpg', 1, 2),
(4, 'Byron Castillo Casasola', 'Bcastillo08*cna', 'bcastillo', '', '00:00:00', 'bcastillo@cna.gob.gt', '2021-03-18 15:39:53', '......1................1....1.1..1..............1.......', '14514787885', 'Guatemala ', '135', 1, 'usuario4.jpg', 2, 2),
(5, 'Omar Reyes', 'Or08*cna', 'Oreyes', '3131254717', '00:00:00', 'oreyes@cna.gob.gt', '2021-03-30 15:39:05', '......1................1....1.1..1..............1.......', '33225222', 'Guatemala', '140', 1, 'user.png', 3, 2),
(6, 'Feliciano Merlos Sanchez', 'fs07*cna', 'fmerlos', '\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?', '00:00:00', 'fmerlos@cna.gob.gt', '2021-05-10 09:37:54', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '1953353250206', 'Guatemala', '200', 1, 'user.png', 3, 1),
(7, 'Keylor Navas', 'kn05*cna', 'knavas', '\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0\0?', '00:00:00', 'fmerlos@cna.gob.gt', '2021-05-10 09:37:54', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '151520', 'Guatemala', '200', 1, 'user.png', 3, 1),
(8, 'Genesis Rodriguez Altan', 'gz09*cna', 'grodriguez', '74853246', '00:00:00', 'grodriguez@cna.gob.gt', '2021-05-10 09:37:54', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '2227155280901', 'Guatemala', '200', 1, 'user.png', 3, 1);

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
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;
--
-- AUTO_INCREMENT de la tabla `detalle_tarjeta`
--
ALTER TABLE `detalle_tarjeta`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT de la tabla `ingresosegresos`
--
ALTER TABLE `ingresosegresos`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `tarjeta_responsabilidad`
--
ALTER TABLE `tarjeta_responsabilidad`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `tmp_descarga_tarjeta`
--
ALTER TABLE `tmp_descarga_tarjeta`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

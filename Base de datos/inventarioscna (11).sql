-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2021 a las 16:54:56
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
  `doc` varchar(15) NOT NULL,
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
  `documento` varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `telefono_cliente`, `email_cliente`, `direccion_cliente`, `status_cliente`, `date_added`, `doc`, `dni`, `vendedor`, `pais`, `departamento`, `provincia`, `distrito`, `cuenta`, `tipo1`, `tienda`, `users`, `deuda`, `debe`, `documento`) VALUES
(1, 'CLIENTES VARIOS', '', 'undefined', '', 0, '0000-00-00 00:00:00', '0', '11111111', '', '', '', '', '', '', 0, 1, 0, '0.00', '0.00', '11111111'),
(284, 'Data Flex S.A.', '', '', 'AV. PASEO DE LA REPUBLICA NRO. 291 INT. 903 (PLAZA GRAU) LIMA - LIMA - LIMA', 1, '2020-12-19 00:41:47', '20549500553', '0', '', 'Peru', '', '', '', '', 2, 1, 0, '0.00', '0.00', '20549500553'),
(2, 'Lucrecia Monterroso', '200', 'undefined', 'Unidad De RRHH', 1, '0000-00-00 00:00:00', '0', '1485789540901', '', 'Guatemala', 'Guatemala', 'Ciudad De Guatemala', '', '', 1, 1, 0, '0.00', '0.00', '14857890901'),
(288, 'Hugo Marco Vasquez', '145', '100', 'Unidad de Registro', 1, '2021-03-30 11:45:25', '2126145170901', '0', '', 'Peru', '', '', '', '', 1, 1, 0, '0.00', '0.00', '2126145170901'),
(290, 'Byron Castillo Casasola', '135', '102', 'Unidad de Recursos Humanos', 1, '2021-03-30 14:20:18', '14514787885', '0', '', 'Peru', '', '', '', '', 1, 1, 0, '0.00', '0.00', '14514787885'),
(291, 'Omar Reyes', '140', '5', 'Servicios Generales y Trasporte', 1, '2021-03-30 15:48:59', '3131254717', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '3131254717'),
(292, 'Libreria Platino S.A.', '77889955', 'LIBRERIA@PLATINO.COM', 'zona 9', 1, '2021-04-06 00:00:00', '', '', '', 'Guatemala', 'Guatemala', 'Guatemala', '', '', 2, 1, 0, '0.00', '0.00', ''),
(293, 'Dollar City', '55220909', 'dollar@gmail.com', 'zona 1 Cdad. Guatemala', 1, '0000-00-00 00:00:00', '', '', '', 'Guatemala', 'Guatemala', 'Guatemala', 'Guatemala', '', 2, 1, 0, '0.00', '0.00', ''),
(294, 'LIBRERIA E IMPRENTA VIVIAN , S.A.', '2415-0000', 'libreria@vivian.com', 'zona 1 Cdad. Guatemala', 1, '2021-04-20 08:56:17', '147', '0', '', 'Guatemala', 'Guatemala', 'Guatemala', 'Guatemala', '7845451212-7', 2, 1, 0, '0.00', '0.00', '147'),
(295, 'OFFIMARKET, S.A.', '21261418', 'empresa@offimarket.com', 'Empresa Guatemalteca', 1, '2021-04-21 15:20:34', '45', '0', '', 'Guatemala', 'Guatemala', 'Guatemala', 'Guatemala', '7845457788-8', 2, 1, 0, '0.00', '0.00', '45'),
(296, 'CompuFacil S.A.', '22141516', 'compufacil@gmail.com', '1ra avenida zona 1 Guatemala, Guatemala', 1, '2021-04-27 08:29:38', '72943246', '0', 'Juan Perez', 'Guatemala', 'Guatemala', 'Guatemala', '', '7}2454124755', 2, 1, 0, '0.00', '0.00', '72943246'),
(297, 'Justo Rufino Perez Lux', '', '', '', 1, '2021-04-27 09:44:00', '25631918', '0', '', 'Guatemala', '', '', '', '', 2, 1, 0, '0.00', '0.00', '25631918'),
(298, 'Amanda Debora', '100', '78954', 'Unidad financiera', 1, '2021-05-10 10:27:09', '2123878', '0', '', 'Guatemala', '', '', '', '', 1, 1, 0, '0.00', '0.00', '2123878');

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
(2855, 100, '15', '2020-12-31', '2021-01-31', '1', '', 'producto 15');

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
(1, '', '', '', 'carga inicial pr1 y pr2', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(2, '', '', '', 'carga inicial producto 3 al 13', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(3, '', '', '', 'carga inicial productos 16 al 18, 20 al 26 y 29 al 30', 'Ubicacion 1', '', '0000-00-00 00:00:00'),
(4, 'ab200', '', '', 'primer ingreso con formulario  productos 3 al 6 y 11 al 15 con fecha ingreso 10 de enero 2021 fecha factura 5  de enero 2021 empezamos con formulario 1h 200 factura 100 serie ab100', 'Ubicacion 1', '745', '0000-00-00 00:00:00'),
(5, 'av101', '', '', 'prueba ingreso producto 13', 'Ubicacion 1', '745', '0000-00-00 00:00:00'),
(6, 'ab205', '', '', 'prueba ingreso 100 unidades producto 15 a Q15.00', 'Ubicacion 1', 'caja chica', '0000-00-00 00:00:00'),
(7, 'ab206', '', '', 'ingreso producto 14', 'Ubicacion 1', '456', '0000-00-00 00:00:00');

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
(1, 'factura', 0, '70', '0', '0', '0', '0', '0', 'F001', 'F002', 'F003', 'F004', 'F005', 'F006'),
(2, 'boleta', 0, '0', '0', '0', '0', '0', '0', 'B001', 'B002', 'B003', 'B004', 'B005', 'B006'),
(3, 'guia', 0, '0', '0', '0', '0', '0', '0', 'T001', 'T002', 'T003', 'T004', 'T005', 'T006'),
(4, 'remision', 0, '0', '0', '0', '0', '0', '0', 'T001', 'T002', 'T003', 'T004', 'T005', 'T006'),
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
  `total_venta` decimal(10,2) NOT NULL,
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
(1, '0', '2020-12-31 08:41:09', '0', '', 0, '0', 6, 1, '1775.00', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 08:41:09', 0, '', 2, '', 0, '', 0),
(2, '0', '2020-12-31 08:56:52', '0', '', 0, '0', 6, 1, '153594.50', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 08:56:52', 0, '', 2, '', 0, '', 0),
(3, '0', '2020-12-31 09:49:40', '0', '', 0, '0', 6, 1, '22409.00', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '1969-12-31 09:49:40', 0, '', 2, '', 0, '', 0),
(4, '200', '2021-01-10 10:11:05', '0', '', 294, '0', 6, 1, '28766.00', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-01-05 10:11:05', 0, '100', 2, '', 0, '', 0),
(5, '101', '2021-01-11 15:07:00', '0', '', 295, '0', 6, 1, '4050.00', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-05-06 15:07:00', 0, '201', 2, '', 0, '', 0),
(6, '205', '2021-01-13 09:03:30', '0', '', 296, '0', 6, 1, '1500.00', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-01-05 09:03:30', 0, '105', 2, '', 0, '', 0),
(7, '206', '2021-05-14 09:44:12', '0', '', 293, '0', 6, 1, '400.00', '0.00', '1', 1, 2, 1, 0, 1, '', '', '0.00', '2021-01-06 09:44:12', 0, '106', 2, '', 0, '', 0);

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
  `cantidadEgreso` int(100) NOT NULL,
  `precio_venta` decimal(10,6) NOT NULL,
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

INSERT INTO `ingresosegresos` (`id_detalle`, `id_cliente`, `id_vendedor`, `numero_factura`, `ot`, `id_producto`, `cantidad`, `cantidadEgreso`, `precio_venta`, `tienda`, `activo`, `ven_com`, `fecha`, `precio_compra`, `tipo_doc`, `inv_ini`, `moneda`, `folio`, `nome`, `Renglon`, `Lote`, `Orden`, `Serie_fac`) VALUES
(1, 0, 6, 0, '2', '1', '100', 0, '14.000000', 1, 1, 2, '2020-12-31 08:41:09', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(2, 0, 6, 0, '2', '2', '50', 0, '7.500000', 1, 1, 2, '2020-12-31 08:41:09', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(3, 0, 6, 0, '2', '4', '250', 0, '333.330000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(4, 0, 6, 0, '2', '3', '60', 0, '200.000000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(5, 0, 6, 0, '2', '5', '150', 0, '23.000000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(6, 0, 6, 0, '2', '6', '500', 0, '2.500000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(7, 0, 6, 0, '2', '7', '130', 0, '150.000000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(8, 0, 6, 0, '2', '8', '75', 0, '33.860000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(9, 0, 6, 0, '2', '9', '100', 0, '7.700000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(10, 0, 6, 0, '2', '10', '50', 0, '40.000000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(11, 0, 6, 0, '2', '11', '45', 0, '1.500000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(12, 0, 6, 0, '2', '12', '200', 0, '142.750000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(13, 0, 6, 0, '2', '13', '30', 0, '4.500000', 1, 1, 2, '2020-12-31 08:56:52', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(14, 0, 6, 0, '2', '29', '1', 0, '650.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(15, 0, 6, 0, '2', '26', '1', 0, '84.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(16, 0, 6, 0, '2', '25', '1', 0, '2400.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(17, 0, 6, 0, '2', '24', '2', 0, '250.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(18, 0, 6, 0, '2', '23', '1', 0, '845.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(19, 0, 6, 0, '2', '22', '1', 0, '100.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(20, 0, 6, 0, '2', '21', '5', 0, '450.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(21, 0, 6, 0, '2', '20', '1', 0, '450.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(22, 0, 6, 0, '2', '18', '1', 0, '350.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(23, 0, 6, 0, '2', '17', '5', 0, '1100.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(24, 0, 6, 0, '2', '16', '2', 0, '4500.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(25, 0, 6, 0, '2', '30', '2', 0, '140.000000', 1, 1, 2, '2020-12-31 09:49:40', '0.00', 1, '0.00', '1.00', '', '', '', '', '', ''),
(26, 294, 6, 200, '2', '14', '100', 0, '74.000000', 1, 1, 2, '2021-01-10 10:11:05', '0.00', 1, '0.00', '1.00', '100', '', '322', '', '745', 'ab200'),
(27, 294, 6, 200, '2', '13', '70', 0, '100.000000', 1, 1, 2, '2021-01-10 10:11:05', '0.00', 1, '30.00', '1.00', '100', '', '322', '', '745', 'ab200'),
(28, 294, 6, 200, '2', '12', '100', 0, '12.000000', 1, 1, 2, '2021-01-10 10:11:05', '0.00', 1, '200.00', '1.00', '100', '', '322', '', '745', 'ab200'),
(29, 294, 6, 200, '2', '11', '55', 0, '145.000000', 1, 1, 2, '2021-01-10 10:11:05', '0.00', 1, '45.00', '1.00', '100', '', '320', '', '745', 'ab200'),
(30, 294, 6, 200, '2', '6', '50', 0, '17.000000', 1, 1, 2, '2021-01-10 10:11:05', '0.00', 1, '500.00', '1.00', '100', '', '', '', '745', 'ab200'),
(31, 294, 6, 200, '2', '5', '50', 0, '10.000000', 1, 1, 2, '2021-01-10 10:11:05', '0.00', 1, '150.00', '1.00', '100', '', '320', '', '745', 'ab200'),
(32, 294, 6, 200, '2', '4', '50', 0, '17.500000', 1, 1, 2, '2021-01-10 10:11:05', '0.00', 1, '250.00', '1.00', '100', '', '', '', '745', 'ab200'),
(33, 294, 6, 200, '2', '3', '40', 0, '7.500000', 1, 1, 2, '2021-01-10 10:11:05', '0.00', 1, '60.00', '1.00', '100', '', '256', '', '745', 'ab200'),
(34, 294, 6, 200, '2', '15', '200', 0, '13.330000', 1, 1, 2, '2021-01-10 10:11:05', '0.00', 1, '0.00', '1.00', '100', '', '322', '', '745', 'ab200'),
(35, 295, 6, 101, '2', '13', '45', 0, '90.000000', 1, 1, 2, '2021-01-11 15:07:00', '0.00', 1, '100.00', '1.00', '201', '', '320', '', '745', 'av101'),
(36, 296, 6, 205, '2', '15', '100', 0, '15.000000', 1, 1, 2, '2021-01-13 09:03:30', '0.00', 1, '200.00', '1.00', '105', '', '145', '', 'caja chica', 'ab205'),
(37, 293, 6, 206, '2', '14', '20', 0, '20.000000', 1, 1, 2, '2021-01-14 09:44:12', '0.00', 1, '100.00', '1.00', '106', '', '450', '', '456', 'ab206');

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
  `costo_producto` decimal(10,6) NOT NULL,
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
  `descripcion` text NOT NULL,
  `descripcion1` text NOT NULL,
  `megusta` int(10) NOT NULL,
  `nomegusta` int(10) NOT NULL,
  `precio2` decimal(10,2) NOT NULL,
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
(1, 'pr1', 'producto 1', 1, '2021-05-12 08:30:29', '0.0000', '14.000000', '1.00', 1, '400', 'producto 1 color rojo', 'producto 1, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(2, 'pr2', 'producto 2', 1, '2021-05-12 08:30:29', '0.0000', '7.500000', '1.00', 1, '400', 'producto 2 color rojo', 'producto 2, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(3, 'pr3', 'producto 3', 1, '2021-05-12 08:30:29', '7.5000', '123.000000', '1.00', 1, '400', 'producto 3 color rojo', 'producto 3, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(4, 'pr4', 'producto 4', 1, '2021-05-12 08:30:29', '17.5000', '280.691667', '1.00', 1, '400', 'producto 4 color rojo', 'producto 4, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(5, 'pr5', 'producto 5', 1, '2021-05-12 08:30:29', '10.0000', '19.750000', '1.00', 1, '400', 'producto 5 color rojo', 'producto 5, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(6, 'pr6', 'producto 6', 1, '2021-05-12 08:30:29', '17.0000', '3.818182', '1.00', 1, '400', 'producto 6 color rojo', 'producto 6, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(7, 'pr7', 'producto 7', 1, '2021-05-12 08:30:29', '0.0000', '150.000000', '1.00', 1, '400', 'producto 7 color rojo', 'producto 7, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '130.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(8, 'pr8', 'producto 8', 1, '2021-05-12 08:30:29', '0.0000', '33.860000', '1.00', 1, '400', 'producto 8 color rojo', 'producto 8, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '75.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(9, 'pr9', 'producto 9', 1, '2021-05-12 08:30:29', '0.0000', '7.700000', '1.00', 1, '400', 'producto 9 color rojo', 'producto 9, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(10, 'pr10', 'producto 10', 1, '2021-05-12 08:30:29', '0.0000', '40.000000', '1.00', 1, '400', 'producto 10 color rojo', 'producto 10, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(11, 'pr11', 'producto 11', 1, '2021-05-12 08:30:29', '145.0000', '80.425000', '1.00', 1, '400', 'producto 11 color rojo', 'producto 11, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(12, 'pr12', 'producto 12', 1, '2021-05-12 08:30:29', '12.0000', '99.166667', '1.00', 1, '400', 'producto 12 color rojo', 'producto 12, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(13, 'pr13', 'producto 13', 1, '2021-05-12 08:30:29', '96.0870', '77.131931', '1.00', 1, '400', 'producto 13 color rojo', 'producto 13, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '145.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '358176730837', '0.00', '100.00'),
(14, 'pr14', 'producto 14', 1, '2021-05-12 08:30:29', '65.0000', '65.000000', '1.00', 1, '400', 'producto 14 color rojo', 'producto 14, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '120.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(15, 'pr15', 'producto 15', 1, '2021-05-12 08:30:29', '13.8867', '13.886667', '1.00', 1, '400', 'producto 15 color rojo', 'producto 15, On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', 24, 1, 'producto0.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '2021-07-30', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '100.00'),
(16, 'pr16', 'producto 16', 1, '2021-05-12 09:26:58', '0.0000', '4500.000000', '1.00', 1, '10', 'producto 16 ', 'producto 16 gurpo 300 serie xx16', '2.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(17, 'pr17', 'producto 17', 1, '2021-05-12 09:26:58', '0.0000', '1100.000000', '1.00', 1, '10', 'producto 17 ', 'producto 17 gurpo 300 serie xx17', '5.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(18, 'pr18', 'producto 18', 1, '2021-05-12 09:26:58', '0.0000', '350.000000', '1.00', 1, '10', 'producto 18 ', 'producto 18 gurpo 300 serie xx18', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(19, 'pr19', 'producto 19', 1, '2021-05-12 09:26:58', '0.0000', '0.000000', '1.00', 1, '10', 'producto 19 ', 'producto 19 gurpo 300 serie xx19', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(20, 'pr20', 'producto 20', 1, '2021-05-12 09:26:58', '0.0000', '450.000000', '1.00', 1, '10', 'producto 20 ', 'producto 20 gurpo 300 serie xx20', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(21, 'pr21', 'producto 21', 1, '2021-05-12 09:26:58', '0.0000', '450.000000', '1.00', 1, '10', 'producto 21 ', 'producto 21 gurpo 300 serie xx21', '5.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(22, 'pr22', 'producto 22', 1, '2021-05-12 09:26:58', '0.0000', '100.000000', '1.00', 1, '10', 'producto 22products ', 'producto 22 gurpo 300 serie xx22', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(23, 'pr23', 'producto 23', 1, '2021-05-12 09:26:58', '0.0000', '845.000000', '1.00', 1, '10', 'producto 23 ', 'producto 23 gurpo 300 serie xx23', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(24, 'pr24', 'producto 24', 1, '2021-05-12 09:26:58', '0.0000', '250.000000', '1.00', 1, '10', 'producto 24 ', 'producto 24 gurpo 300 serie xx24', '2.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(25, 'pr25', 'producto 25', 1, '2021-05-12 09:26:58', '0.0000', '2400.000000', '1.00', 1, '10', 'producto 25 ', 'producto 25 gurpo 300 serie xx25', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(26, 'pr26', 'producto 26', 1, '2021-05-12 09:26:58', '0.0000', '84.000000', '1.00', 1, '10', 'producto 26 ', 'producto 26 gurpo 300 serie xx26', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(27, 'pr27', 'producto 27', 1, '2021-05-12 09:26:58', '0.0000', '0.000000', '1.00', 1, '10', 'producto 27 ', 'producto 27 gurpo 300 serie xx27', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(28, 'pr28', 'producto 28', 1, '2021-05-12 09:26:58', '0.0000', '0.000000', '1.00', 1, '10', 'producto 28 ', 'producto 28 gurpo 300 serie xx28', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(29, 'pr29', 'producto 29', 1, '2021-05-12 09:26:58', '0.0000', '650.000000', '1.00', 1, '10', 'producto 29 ', 'producto 29 gurpo 300 serie xx29', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00'),
(30, 'pr30', 'producto 30', 1, '2021-05-12 09:26:58', '0.0000', '140.000000', '1.00', 1, '10', 'producto 30 ', 'producto 30 gurpo 300 serie xx30', '2.00', '0.00', '0.00', '0.00', '0.00', '0.00', 23, 1, 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', 'nuevo.jpg', '1969-12-31', '0.00', '', '', 0, 0, '0.00', '0.00', 1, '', '0.00', '1.00');

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
(1, 4, 'ACTIVIDADES CENTRALES', 200, '2021-05-12 15:17:27'),
(2, 4, 'RESTITUCION DE LOS DERECHOS DEL NNA', 200, '2021-05-12 15:17:27'),
(3, 5, 'RESTITUCION DE LOS DERECHOS DEL NNA', 101, '2021-05-12 20:10:23'),
(4, 5, 'ASESORIA A MADRES Y/O PADRES BIOLOGICOS EN CONFLICTO CON SU PARENTALIDAD', 101, '2021-05-12 20:10:23'),
(5, 6, 'ACTIVIDADES CENTRALES', 205, '2021-05-13 14:06:45'),
(6, 7, 'ACTIVIDADES CENTRALES', 206, '2021-05-13 14:45:44'),
(7, 7, 'RESTITUCION DE LOS DERECHOS DEL NNA', 206, '2021-05-13 14:45:44');

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
  `saldo` decimal(10,2) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `fecha_final` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saldos`
--

INSERT INTO `saldos` (`id_saldo`, `saldo`, `fecha_inicial`, `fecha_final`) VALUES
(2, '0.00', '2020-11-01', '2020-11-30'),
(5, '155369.50', '2020-12-01', '2020-12-31'),
(6, '155369.50', '2020-12-01', '2020-12-31'),
(7, '155369.50', '2021-01-01', '2021-01-31'),
(8, '177778.50', '2020-12-01', '2020-12-31'),
(9, '177778.50', '2021-01-01', '2021-01-31'),
(11, '206544.50', '2021-01-01', '2021-05-31'),
(12, '206544.50', '2021-01-01', '2021-01-31'),
(19, '210594.50', '2021-01-01', '2021-01-31'),
(20, '210594.50', '2020-12-01', '2021-01-31'),
(21, '210594.50', '2020-12-01', '2021-01-31'),
(22, '210594.50', '2021-01-01', '2021-01-31'),
(23, '210594.50', '2021-01-01', '2021-01-31'),
(24, '210594.80', '2021-01-01', '2021-01-31'),
(25, '210594.80', '2021-01-01', '2021-01-31'),
(26, '213342.11', '2021-01-01', '2021-01-31'),
(27, '210593.63', '2021-01-01', '2021-01-31'),
(28, '210593.63', '2021-01-01', '2021-01-31'),
(29, '210593.63', '2021-01-01', '2021-01-31'),
(30, '212093.63', '2021-01-01', '2021-01-31'),
(31, '212093.63', '2021-01-01', '2021-05-31'),
(32, '212093.63', '2021-01-01', '2021-01-31'),
(33, '212493.63', '2021-01-01', '2021-01-31'),
(34, '212493.63', '2021-01-01', '2021-01-31');

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
  `id_producto` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad_tmp` decimal(10,2) NOT NULL,
  `precio_tmp` decimal(10,2) DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tienda` decimal(10,2) NOT NULL,
  `cod` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Renglon_Presupuestario` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(3, 'SGYT', 'Servicios Generales y Trasporte', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `nombres` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `clave` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `hora` time NOT NULL,
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL,
  `accesos` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dni` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `domicilio` text COLLATE utf8_unicode_ci NOT NULL,
  `telefono` text COLLATE utf8_unicode_ci NOT NULL,
  `sucursal` int(2) NOT NULL,
  `foto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_unidad` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `nombres`, `clave`, `user_name`, `hora`, `user_email`, `date_added`, `accesos`, `dni`, `domicilio`, `telefono`, `sucursal`, `foto`, `id_unidad`) VALUES
(2, 'usuario', '123456', 'usuario', '00:00:00', '', '2019-07-21 03:24:30', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1..1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '', '', '', 1, 'user.png', NULL),
(3, 'Hugo Marco Vasquez', 'Hz08*cna', 'hvasquez', '00:00:00', 'hvasquezg2@miumg.edu.gt', '2021-03-18 15:11:06', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '2126145170901', 'Guatemala', '145', 1, 'usuario3.jpg', 1),
(4, 'Byron Castillo Casasola', 'Bcastillo08*cna', 'bcastillo', '00:00:00', 'bcastillo@cna.gob.gt', '2021-03-18 15:39:53', '......1................1....1.1..1..............1.......', '14514787885', 'Guatemala ', '135', 1, 'usuario4.jpg', 2),
(5, 'Omar Reyes', 'Or08*cna', 'Oreyes', '00:00:00', 'oreyes@cna.gob.gt', '2021-03-30 15:39:05', '......1................1....1.1..1..............1.......', '3131254717', 'Guatemala', '140', 1, 'user.png', 3),
(6, 'Feliciano Merlos Sanchez', 'fs07*cna', 'fmerlos', '00:00:00', 'fmerlos@cna.gob.gt', '2021-05-10 09:37:54', '1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1......1.1', '1953353250206', 'Guatemala', '200', 1, 'user.png', NULL);

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
  MODIFY `id_asistencia` int(10) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;
--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2856;
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
  MODIFY `id_factura` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
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
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `programas_facturas`
--
ALTER TABLE `programas_facturas`
  MODIFY `id_Programa_Factura` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `resumen_documentos`
--
ALTER TABLE `resumen_documentos`
  MODIFY `id_resumen` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `saldos`
--
ALTER TABLE `saldos`
  MODIFY `id_saldo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
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
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4006;
--
-- AUTO_INCREMENT de la tabla `tmp1`
--
ALTER TABLE `tmp1`
  MODIFY `id_tmp` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `und`
--
ALTER TABLE `und`
  MODIFY `id_und` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `id_unidad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=7;
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

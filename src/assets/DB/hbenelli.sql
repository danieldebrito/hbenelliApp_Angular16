-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2023 a las 04:29:27
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hbenelli`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(5) DEFAULT NULL,
  `rubro` varchar(50) DEFAULT NULL,
  `subrubro` varchar(50) DEFAULT NULL,
  `idDetalle` int(5) DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `peso` decimal(6,2) DEFAULT NULL,
  `unidad` varchar(20) DEFAULT NULL,
  `precioLista` decimal(6,2) DEFAULT NULL,
  `precioNeto` decimal(6,2) DEFAULT NULL,
  `urlPhoto` varchar(200) DEFAULT NULL,
  `updated_at` varchar(100) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `rubro`, `subrubro`, `idDetalle`, `codigo`, `nombre`, `observaciones`, `peso`, `unidad`, `precioLista`, `precioNeto`, `urlPhoto`, `updated_at`, `created_at`) VALUES
(1, 'alimentaria', 'especias', NULL, 'ES-ACHT', 'ACHUETE', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(2, 'alimentaria', 'especias', NULL, 'ES-AJMO', 'AJI MOLIDO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(3, 'alimentaria', 'especias', NULL, 'ES-AJPN', 'AJO EN POLVO', 'Nacional', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(4, 'alimentaria', 'especias', NULL, 'ES-AJPC', 'AJO EN POLVO', 'Chino Blanco', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(5, 'alimentaria', 'especias', NULL, 'ES-APAC', 'AJO PARTIDO', 'Chino', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(6, 'alimentaria', 'especias', NULL, 'ES-APNA', 'AJO PARTIDO', 'Nacional', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(7, 'alimentaria', 'especias', NULL, 'ES-ANGM', 'ANIS EN GRANO O MOLIDO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(8, 'alimentaria', 'especias', NULL, 'ES-ANTG', 'ANTICUAGULANTE', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(9, 'alimentaria', 'especias', NULL, 'ES-CALA', 'CALER \"A\" (fijador color secos)', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(10, 'alimentaria', 'especias', NULL, 'ES-CALS', 'CALER \"S\" (fijador color frescos)', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(11, 'alimentaria', 'especias', NULL, 'ES-CAMO', 'CANELA MOLIDA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(12, 'alimentaria', 'especias', NULL, 'ES-CARM', 'CARMIN', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(13, 'alimentaria', 'especias', NULL, 'ES-CYNO', 'CAYENA MOLIDA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(14, 'alimentaria', 'especias', NULL, 'ES-CHIM', 'CHIMICHURRI', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(15, 'alimentaria', 'especias', NULL, 'ES-CLOG', 'CLAVO DE OLOR EN GRANO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(16, 'alimentaria', 'especias', NULL, 'ES-CLOM', 'CLAVO OLOR MOLIDO (PEDUNCULO)', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(17, 'alimentaria', 'especias', NULL, 'ES-COVG', 'COLORANTE VEGETAL', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(18, 'alimentaria', 'especias', NULL, 'ES-CMMO', 'COMINO MOLIDO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(19, 'alimentaria', 'especias', NULL, 'ES-ARROZ', 'CONDIMENTO PARA ARROZ', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(20, 'alimentaria', 'especias', NULL, 'ES-PIZZA', 'CONDIMENTO PIZZA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(21, 'alimentaria', 'especias', NULL, 'ES-COMO', 'CORIANDRO MOLIDO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(22, 'alimentaria', 'especias', NULL, 'ES-CURC', 'CURCUMA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(23, 'alimentaria', 'especias', NULL, 'ES-DEXT', 'DEXTROSA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(24, 'alimentaria', 'especias', NULL, 'ES-ESSU', 'ESPECIAS SURTIDAS', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(25, 'alimentaria', 'especias', NULL, 'ES-FIUE', 'FIUMER \"E\" (fosfato emulsion)', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(26, 'alimentaria', 'especias', NULL, 'ES-FIUI', 'FIUMER \"I\" (fosfato inyeccion)', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(27, 'alimentaria', 'especias', NULL, 'ES-GLMO', 'GLUTAMATO MONOSODICO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(28, 'alimentaria', 'especias', NULL, 'ES-GMEX', 'GOMEX', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(29, 'alimentaria', 'especias', NULL, 'ES-HIGM', 'HINOJO EN GRANO O MOLIDO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(30, 'alimentaria', 'especias', NULL, 'ES-JENG', 'JENGIBRE', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(31, 'alimentaria', 'especias', NULL, 'ES-LAUM', 'LAUREL MOLIDO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(32, 'alimentaria', 'especias', NULL, 'ES-LIGAM', 'LIGA PARA MATAMBRE', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(33, 'alimentaria', 'especias', NULL, 'ES-NISO', 'NITRATO DE SODIO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(34, 'alimentaria', 'especias', NULL, 'ES-NZMM', 'NUEZ MOSCADA MOLIDA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(35, 'alimentaria', 'especias', NULL, 'ES-ORGA', 'OREGANO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(36, 'alimentaria', 'especias', NULL, 'ES-PERH', 'PEREJIL EN HOJA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(37, 'alimentaria', 'especias', NULL, 'ES-PIMB', 'PIMENTA BLANCA GRANO /PART/MOLIDA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(38, 'alimentaria', 'especias', NULL, 'ES-PIME', 'PIMENTON ESENCIA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(39, 'alimentaria', 'especias', NULL, 'ES-PIAH', 'PIMENTON AHUMADO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(40, 'alimentaria', 'especias', NULL, 'ES-PNGR', 'PIMIENTA NEGRA GRANO/PART/MOLIDA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(41, 'alimentaria', 'especias', NULL, 'ES-PROV', 'PROVENZAL IMPORTADA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(42, 'alimentaria', 'especias', NULL, 'ES-SAL', 'SAL', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(43, 'alimentaria', 'especias', NULL, 'ES-SALX', 'SAL ANTIOXIDANTE', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(44, 'alimentaria', 'especias', NULL, 'ES-SALC', 'SAL DE CURA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(45, 'alimentaria', 'especias', NULL, 'ES-NITR', 'NITRITO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(46, 'alimentaria', 'harinas', NULL, 'HA-SULS', 'SULFITO DE SODIO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(47, 'alimentaria', 'harinas', NULL, 'HA-FMZ01', 'FECULA DE MAIZ', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(48, 'alimentaria', 'harinas', NULL, 'HA-FMZ25', 'FECULA DE MAIZ', NULL, '25.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(49, 'alimentaria', 'harinas', NULL, 'HA-FMA01', 'FECULA DE MANDIOCA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(50, 'alimentaria', 'harinas', NULL, 'HA-FMA25', 'FECULA DE MANDIOCA', NULL, '25.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(51, 'alimentaria', 'harinas', NULL, 'HA-FEP01', 'FECULA DE PAPA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(52, 'alimentaria', 'harinas', NULL, 'HA-FEP25', 'FECULA DE PAPA', NULL, '25.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(53, 'alimentaria', 'harinas', NULL, 'HA-FET01', 'FECULA DE TRIGO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(54, 'alimentaria', 'harinas', NULL, 'HA-FET25', 'FECULA DE TRIGO', NULL, '25.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(55, 'alimentaria', 'harinas', NULL, 'HA-GLT01', 'GLUTEN DE TRIGO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(56, 'alimentaria', 'harinas', NULL, 'HA-GLT25', 'GLUTEN DE TRIGO', NULL, '25.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(57, 'alimentaria', 'harinas', NULL, 'HA-SOJ20', 'HARINA DE SOJA', NULL, '20.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(58, 'alimentaria', 'harinas', NULL, 'HA-SOF01', 'HARINA DE SOJA FINA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(59, 'alimentaria', 'harinas', NULL, 'HA-SOG01', 'HARINA DE SOJA GRUESA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(60, 'alimentaria', 'harinas', NULL, 'HA-SOG30', 'HARINA DE SOJA GRUESA', NULL, '30.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(61, 'alimentaria', 'harinas', NULL, 'HA-RBZ25', 'REBOZADOR BALONIX', NULL, '25.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(62, 'alimentaria', 'harinas', NULL, 'HA-SAE01', 'SANGRE ENTERA (NUTRAGEL)', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(63, 'alimentaria', 'harinas', NULL, 'HA-SAE20', 'SANGRE ENTERA X 20 KG', NULL, '20.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(64, 'alimentaria', 'harinas', NULL, 'HA-PRLL25', 'PAN RALLADO X 25 KG', NULL, '25.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(65, 'alimentaria', 'integrales', NULL, 'IN-CHF05', 'INTEGRAL CHORIZO FRESCO', 'Uso 7 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(66, 'alimentaria', 'integrales', NULL, 'IN-CHF10', 'INTEGRAL CHORIZO FRESCO', 'Uso 7 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(67, 'alimentaria', 'integrales', NULL, 'IN-CHF01', 'INTEGRAL CHORIZO FRESCO', 'Uso 7 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(68, 'alimentaria', 'integrales', NULL, 'IN-CHC05', 'INTEGRAL CHORIZO FRESCO COLORADO', 'Uso 10 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(69, 'alimentaria', 'integrales', NULL, 'IN-CHC10', 'INTEGRAL CHORIZO FRESCO COLORADO', 'Uso 10 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(70, 'alimentaria', 'integrales', NULL, 'IN-CHC01', 'INTEGRAL CHORIZO FRESCO COLORADO', 'Uso 10 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(71, 'alimentaria', 'integrales', NULL, 'IN-SALC05', 'INTEGRAL SALCHICHA FRESCA', 'Uso 7 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(72, 'alimentaria', 'integrales', NULL, 'IN-SALC10', 'INTEGRAL SALCHICHA FRESCA', 'Uso 7 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(73, 'alimentaria', 'integrales', NULL, 'IN-SALC01', 'INTEGRAL SALCHICHA FRESCA', 'Uso 7 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(74, 'alimentaria', 'integrales', NULL, 'IN-HAC05', 'INTEGRAL HAMBURGUESA S/CARNE', 'Uso 5 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(75, 'alimentaria', 'integrales', NULL, 'IN-HAC10', 'INTEGRAL HAMBURGUESA S/CARNE', 'Uso 5 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(76, 'alimentaria', 'integrales', NULL, 'IN-HAC01', 'INTEGRAL HAMBURGUESA S/CARNE', 'Uso 5 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(77, 'alimentaria', 'integrales', NULL, 'IN-HAP05', 'INTEGRAL HAMBURGUESA S/POLLO', 'Uso 5 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(78, 'alimentaria', 'integrales', NULL, 'IN-HAP10', 'INTEGRAL HAMBURGUESA S/POLLO', 'Uso 5 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(79, 'alimentaria', 'integrales', NULL, 'IN-HAP01', 'INTEGRAL HAMBURGUESA S/POLLO', 'Uso 5 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(80, 'alimentaria', 'integrales', 2, 'IN-MIC05', 'INTEGRAL MILANESA DE CARNE', 'Uso 1 x 6 Agua', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(81, 'alimentaria', 'integrales', 2, 'IN-MIC10', 'INTEGRAL MILANESA DE CARNE', 'Uso 1 x 6 Agua', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(82, 'alimentaria', 'integrales', 2, 'IN-MIC01', 'INTEGRAL MILANESA DE CARNE', 'Uso 1 x 6 Agua', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(83, 'alimentaria', 'integrales', NULL, 'IN-MIP05', 'INTEGRAL MILANESA S/POLLO', 'Uso 1 x 6 Agua', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(84, 'alimentaria', 'integrales', NULL, 'IN-MIP10', 'INTEGRAL MILANESA S/POLLO', 'Uso 1 x 6 Agua', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(85, 'alimentaria', 'integrales', NULL, 'IN-MIP01', 'INTEGRAL MILANESA S/POLLO', 'Uso 1 x 6 Agua', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(86, 'alimentaria', 'integrales', NULL, 'IN-SAL05', 'INTEGRAL SALAME', 'Uso 7 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(87, 'alimentaria', 'integrales', NULL, 'IN-SAL10', 'INTEGRAL SALAME', 'Uso 7 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(88, 'alimentaria', 'integrales', NULL, 'IN-SAL01', 'INTEGRAL SALAME', 'Uso 7 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(89, 'alimentaria', 'integrales', NULL, 'IN-LOG05', 'INTEGRAL LONGANIZA ESPAÑOLA', 'Uso 10 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(90, 'alimentaria', 'integrales', NULL, 'IN-LOG10', 'INTEGRAL LONGANIZA ESPAÑOLA', 'Uso 10 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(91, 'alimentaria', 'integrales', NULL, 'IN-LOG01', 'INTEGRAL LONGANIZA ESPAÑOLA', 'Uso 10 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(92, 'alimentaria', 'integrales', NULL, 'IN-CRE05', 'INTEGRAL CRESPON Y CANTIMPALO', 'Uso 10 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(93, 'alimentaria', 'integrales', NULL, 'IN-CRE10', 'INTEGRAL CRESPON Y CANTIMPALO', 'Uso 10 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(94, 'alimentaria', 'integrales', NULL, 'IN-CRE01', 'INTEGRAL CRESPON Y CANTIMPALO', 'Uso 10 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(95, 'alimentaria', 'integrales', NULL, 'IN-BOJ05', 'INTEGRAL BONDIOLA Y JAMON', 'Uso 7 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(96, 'alimentaria', 'integrales', NULL, 'IN-BOJ10', 'INTEGRAL BONDIOLA Y JAMON', 'Uso 7 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(97, 'alimentaria', 'integrales', NULL, 'IN-BOJ01', 'INTEGRAL BONDIOLA Y JAMON', 'Uso 7 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(98, 'alimentaria', 'integrales', NULL, 'IN-MOR05', 'INTEGRAL MORCILLA', 'Uso 7 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(99, 'alimentaria', 'integrales', NULL, 'IN-MOR10', 'INTEGRAL MORCILLA', 'Uso 7 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(100, 'alimentaria', 'integrales', NULL, 'IN-MOR01', 'INTEGRAL MORCILLA', 'Uso 7 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(101, 'alimentaria', 'integrales', NULL, 'IN-QUC05', 'INTEGRAL QUESO DE CERDO', 'Uso 7 x 100', '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(102, 'alimentaria', 'integrales', NULL, 'IN-QUC10', 'INTEGRAL QUESO DE CERDO', 'Uso 7 x 100', '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(103, 'alimentaria', 'integrales', NULL, 'IN-QUC01', 'INTEGRAL QUESO DE CERDO', 'Uso 7 x 100', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(104, 'alimentaria', 'integrales', NULL, 'IN-PAN05', 'INTEGRAL PANCETA', NULL, '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(105, 'alimentaria', 'integrales', NULL, 'IN-PAN10', 'INTEGRAL PANCETA', NULL, '10.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(106, 'alimentaria', 'integrales', NULL, 'IN-CIE01', 'INTEGRAL CIERVO Y ÑANDU', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(107, 'alimentaria', 'integrales', NULL, 'IN-HUM01', 'SABOR A HUMO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(108, 'alimentaria', 'integrales', NULL, 'IN-JAM01', 'SABOR A JAMON', 'Concentracion 1 x 10', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(109, 'alimentaria', 'integrales', NULL, 'IN-POLL01', 'SABOR A POLLO', 'Concentracion 1 x 10', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(110, 'alimentaria', 'integrales', NULL, 'IN-QUE01', 'SABOR A QUESO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(111, 'alimentaria', 'integrales', NULL, 'IN-AJO01', 'SABORIZANTE AJO', 'Concentracion 1 x 10', '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(112, 'alimentaria', 'integrales', NULL, 'IN-SCHO01', 'SABORIZANTE CHORIZO', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(113, 'alimentaria', 'integrales', NULL, 'IN-SCHE01', 'SABORIZANTE CHORIZO ESPECIAL', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(114, 'alimentaria', 'integrales', NULL, 'IN-SCHP01', 'SABORIZANTE CHORIZO P/C', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(115, 'alimentaria', 'integrales', NULL, 'IN-SMAT01', 'SABORIZANTE MATAMBRE', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(116, 'alimentaria', 'integrales', NULL, 'IN-SMOR01', 'SABORIZANTE MORCILLA', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(117, 'alimentaria', 'integrales', NULL, 'IN-SRAV01', 'SABORIZANTE RAVIOLES', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(118, 'alimentaria', 'integrales', NULL, 'IN-SPIM05', 'SABOR PIMIENTA', NULL, '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(119, 'alimentaria', 'integrales', NULL, 'IN-SNZ05', 'SABOR NUEZ MOSCADA', NULL, '5.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(120, 'alimentaria', 'tripas', NULL, 'TR-OV4042', 'ORILLA VACUNA 40/42', NULL, '15.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(121, 'alimentaria', 'tripas', NULL, 'TR-OV4244', 'ORILLA VACUNA 42/44', NULL, '25.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(122, 'alimentaria', 'tripas', NULL, 'TR-OV4446', 'ORILLA VACUNA 44/46', NULL, '25.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(123, 'alimentaria', 'tripas', NULL, 'TR-TVAC', 'TRIPON VACUNO (planchado y blanqueado)', NULL, '10.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(124, 'alimentaria', 'tripas', NULL, 'TR-OV4043-15', 'ORILLA VACUNA 40/43', NULL, '15.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(125, 'alimentaria', 'tripas', NULL, 'TR-OV4043-30', 'ORILLA VACUNA 40/43', NULL, '30.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(126, 'alimentaria', 'tripas', NULL, 'TR-CHIIP', 'CHINEZCA IMPORTADA', NULL, '90.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(127, 'alimentaria', 'tripas', NULL, 'TR-CHINA', 'CHINEZCA NACIONAL 38/40', NULL, '70.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(128, 'alimentaria', 'tripas', NULL, 'TR-OVIN', 'OVINO 22/24', NULL, '90.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(129, 'alimentaria', 'tripas', NULL, 'TR-TUBO24', 'TUBO 24', NULL, '15.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(130, 'alimentaria', 'tripas', NULL, 'TR-CHINATC', 'CHINEZCA NACIONAL TIRAS CORTAS', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(131, 'alimentaria', 'tripas', NULL, 'TR-COL24', 'COLAGENO 24', NULL, '425.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(132, 'alimentaria', 'tripas', NULL, 'TR-COL25', 'COLAGENO 25', NULL, '630.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(133, 'alimentaria', 'tripas', NULL, 'TR-COL45', 'COLAGENO 45 (FIBRAN)', NULL, '1.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(134, 'alimentaria', 'tripas', NULL, 'TR-COL50', 'COLAGENO 50 (FIBRAN)', NULL, '1.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(135, 'alimentaria', 'tripas', NULL, 'TR-COL55', 'COLAGENO 55 (FIBRAN)', NULL, '1.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(136, 'alimentaria', 'tripas', NULL, 'TR-COL60', 'COLAGENO 60 (FIBRAN)', NULL, '1.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(137, 'alimentaria', 'tripas', NULL, 'TR-COL80', 'COLAGENO 80 (FIBRAN)', NULL, '1.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(138, 'alimentaria', 'tripas', NULL, 'TR-BOLC1856', 'BOLSAS CRISTAL 18 X 56', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(139, 'alimentaria', 'tripas', NULL, 'TR-COLMORT', 'BOLSAS MORT. POLIAMIDA marron', NULL, '1.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(140, 'alimentaria', 'tripas', NULL, 'TR-BOLQUE', 'BOLSAS QUESO DE CERDO 18 X 56', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(141, 'alimentaria', 'tripas', NULL, 'TR-BOLRO1856', 'BOLSAS ROJAS 18 X 56', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(142, 'alimentaria', 'tripas', NULL, 'TR-BOLSJA1856', 'BOLSAS SALCHICHON C/JAMON 18 X 56', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(143, 'alimentaria', 'tripas', NULL, 'TR-BOLSAP1856', 'BOLSAS SALCHICHON PRIMAV 18 X 56', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(144, 'alimentaria', 'tripas', NULL, 'TR-CEL4650', 'CELOFAN MICROPOROSO 46 X 50', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(145, 'alimentaria', 'tripas', NULL, 'TR-CEL7090', 'CELOFAN MICROPOROSO 70 x 90', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(146, 'alimentaria', 'tripas', NULL, 'TR-GANME', 'GANCHOS METALICOS N° 1', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(147, 'alimentaria', 'tripas', NULL, 'TR-HIPOS', 'HIPOCLORITO DE SODIO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(148, 'alimentaria', 'tripas', NULL, 'TR-PAPFOL', 'PAPEL FOLEX P/HAMBURGUESA', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(149, 'alimentaria', 'tripas', NULL, 'TR-PASTD', 'PASTA DESENGRASANTE', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(150, 'alimentaria', 'tripas', NULL, 'TR-REDBC', 'RED BONDIOLA CUADRADA POR RED', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(151, 'alimentaria', 'tripas', NULL, 'TR-REDBX', 'RED BONDIOLA', NULL, '10.00', 'mts', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(152, 'alimentaria', 'tripas', NULL, 'TR-REDMOR', 'RED MORTADELA COLOR', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(153, 'alimentaria', 'tripas', NULL, 'TR-VASE', 'VASELINA LIQUIDA', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(154, 'alimentaria', 'insumos', NULL, 'TR-HAMM', 'HAMBURGUESERA MEDIANA', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(155, 'alimentaria', 'insumos', NULL, 'TR-HAMC', 'HAMBURGUESERA CHICA', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(156, 'alimentaria', 'insumos', NULL, 'TR-EMAC', 'EMBUDO ACERO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(157, 'alimentaria', 'insumos', NULL, 'TR-PALES', 'PALITOS ESPUELAS', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(158, 'alimentaria', 'insumos', NULL, 'TR-PALO', 'PALOTE', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(159, 'alimentaria', 'insumos', NULL, 'TR-EMPA32', 'EMBUDO PLASTICO 32 CHORIZO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(160, 'alimentaria', 'insumos', NULL, 'TR-EMBA', 'EMBUDO PLASTICO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(161, 'alimentaria', 'insumos', NULL, 'TR-DISCP', 'DISCO PLASTICO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(162, 'alimentaria', 'insumos', NULL, 'TR-PINCH', 'PINCHE', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(163, 'textil', 'hilo p/papelera', NULL, 'HC3B330', 'HILO CRUDO Nº 3 BOBINA', NULL, '330.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC3B330.jpg', NULL, NULL),
(164, 'textil', 'hilo p/papelera', NULL, 'HC3B900', 'HILO CRUDO Nº 3 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC3B900.jpg', NULL, NULL),
(165, 'textil', 'hilo p/papelera', NULL, 'HC4B330', 'HILO CRUDO Nº 4 BOBINA', NULL, '330.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC4B330.jpg', NULL, NULL),
(166, 'textil', 'hilo p/papelera', NULL, 'HC4B900', 'HILO CRUDO Nº 4 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC4B900.jpg', NULL, NULL),
(167, 'textil', 'hilo p/papelera', NULL, 'HC5B330', 'HILO CRUDO Nº 5 BOBINA', NULL, '330.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC5B330.jpg', NULL, NULL),
(168, 'textil', 'hilo p/papelera', NULL, 'HC6B330', 'HILO CRUDO Nº 6 BOBINA', NULL, '330.00', 'gr', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(169, 'textil', 'hilo p/papelera', NULL, 'HC8B330', 'HILO CRUDO Nº 8 BOBINA', NULL, '330.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC8B330.jpg', NULL, NULL),
(170, 'textil', 'hilo p/papelera', NULL, 'HC8B800', 'HILO CRUDO Nº 8 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC8B800.jpg', NULL, NULL),
(171, 'textil', 'hilo p/papelera', NULL, 'HC11B900', 'HILO CRUDO Nº 11 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC11B900.jpg', NULL, NULL),
(172, 'textil', 'hilo p/papelera', NULL, 'HC15B800', 'HILO CRUDO Nº 15 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC15B800.jpg', NULL, NULL),
(173, 'textil', 'hilo p/papelera', NULL, 'HC22B800', 'HILO CRUDO Nº 22 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC22B800.jpg', NULL, NULL),
(174, 'textil', 'hilo p/papelera', NULL, 'HC27B800', 'HILO CRUDO Nº 27 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HC27B800.jpg', NULL, NULL),
(175, 'textil', 'hilo p/papelera', NULL, 'HP3A330', 'HILO PULIDO AMARILLO Nº 3 BOBINA', NULL, '330.00', 'gr', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(176, 'textil', 'hilo p/papelera', NULL, 'HCO30', 'HILO CRUDO Nº 3 OVILLO', NULL, '30.00', 'gr', NULL, NULL, 'assets/img/catalogo/HCO30.jpg', NULL, NULL),
(177, 'textil', 'hilo p/papelera', NULL, 'HCO50', 'HILO CRUDO Nº 4 OVILLO', NULL, '50.00', 'gr', NULL, NULL, 'assets/img/catalogo/HCO50.jpg', NULL, NULL),
(178, 'textil', 'hilo p/papelera', NULL, 'HCO100', 'HILO CRUDO Nº 4 OVILLO', NULL, '100.00', 'gr', NULL, NULL, 'assets/img/catalogo/HCO100.jpg', NULL, NULL),
(179, 'textil', 'hilo p/papelera', NULL, 'HPO30', 'HILO PULIDO AMARILLO Nº 3 OVILLO', NULL, '30.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPO30.jpg', NULL, NULL),
(180, 'textil', 'hilo p/papelera', NULL, 'HPO50', 'HILO PULIDO AMARILLO Nº 3 OVILLO', NULL, '50.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPO50.jpg', NULL, NULL),
(181, 'textil', 'hilo p/papelera', NULL, 'HPO100', 'HILO PULIDO AMARILLO Nº 3 OVILLO', NULL, '100.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPO100.jpg', NULL, NULL),
(182, 'textil', 'hilo p/papelera', NULL, 'HOX50GRIS', 'HILO COLOR GRIS TOPO OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/HOX50GRIS.jpg', NULL, NULL),
(183, 'textil', 'hilo p/papelera', NULL, 'HOBX50', 'HILO COLOR BLANCO OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/HOBX50.jpg', NULL, NULL),
(184, 'textil', 'hilo p/papelera', NULL, 'HOX50CEL', 'HILO COLOR CELESTE OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/HOX50CEL.jpg', NULL, NULL),
(185, 'textil', 'hilo p/papelera', NULL, 'HOX50FRA', 'HILO COLOR FRANCIA OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/HOX50FRA.jpg', NULL, NULL),
(186, 'textil', 'hilo p/papelera', NULL, 'HOX50NAR', 'HILO COLOR NARANJA OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(187, 'textil', 'hilo p/papelera', NULL, 'HOX50NEG', 'HILO COLOR NEGRO OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(188, 'textil', 'hilo p/papelera', NULL, 'HORX50', 'HILO COLOR ROSA OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/HORX50.jpg', NULL, NULL),
(189, 'textil', 'hilo p/papelera', NULL, 'HOVCX100', 'HILO COLOR VERDE CLARO OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/HOVCX100.jpg', NULL, NULL),
(190, 'textil', 'hilo p/papelera', NULL, 'HOX50VERDE', 'HILO COLOR VERDE OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(191, 'textil', 'hilo p/papelera', NULL, 'HOX50AZU', 'HILO COLOR AZUL OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(192, 'textil', 'hilo p/papelera', NULL, 'HOROX100', 'HILO COLOR ROJO OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(193, 'textil', 'hilo p/papelera', NULL, 'HOX50BOX', 'HILO COLOR BORDO OVILLO 50 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(194, 'textil', 'hilo p/papelera', NULL, 'HOX50MUL', 'HILO MULTICOLOR OVILLO 50 G', NULL, '11.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(195, 'textil', 'hilo p/papelera', NULL, 'HYOX100', 'HILO YUTE OVILLO 100 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/HYOX100.jpg', NULL, NULL),
(196, 'textil', 'hilo p/papelera', NULL, 'HSOX100', 'HILO SISAL OVILLO 80 G', NULL, '10.00', 'unid', NULL, NULL, 'assets/img/catalogo/HSOX100.jpg', NULL, NULL),
(197, 'textil', 'hilo p/papelera', NULL, 'HCP27X100', 'HILO PIOLIN Nº 27 X 100 G', NULL, '100.00', 'gr', NULL, NULL, 'assets/img/catalogo/HCP27X100.jpg', NULL, NULL),
(198, 'textil', 'hilo p/papelera', NULL, 'HCP24X50G', 'HILO CRUDO PIOLIN Nº 24 X 50 G', NULL, '50.00', 'gr', NULL, NULL, 'assets/img/catalogo/HCP24X50G.jpg', NULL, NULL),
(199, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO MAQ. ATA. S/NÚCLEO BOBINA 120 g', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HPFX120G.jpg', NULL, NULL),
(200, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO MAQ. ATA. POLIESTER BOBINA 80g', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/HPOL100.jpg', NULL, NULL),
(201, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO AMARILLO Nº 3 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HP3A900.jpg', NULL, NULL),
(202, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO AMARILLO Nº 6 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HP6AB900.jpg', NULL, NULL),
(203, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO AMARILLO Nº 9 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HP9AB900G.jpg', NULL, NULL),
(204, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO NARANJA Nº 3 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HP3N900.jpg', NULL, NULL),
(205, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO ROJO Nº 3 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(206, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO ROJO Nº 9 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(207, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO AMARILLO Y ROJO Nº 3', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HP3AR900.jpg', NULL, NULL),
(208, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO AMARILLO Y VERDE Nº 3', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HP3AV900.jpg', NULL, NULL),
(209, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO BLANCO Y ROJO Nº 3', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HP3BR900.jpg', NULL, NULL),
(210, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO BLANCO Y AZUL Nº 3', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HP3BA900.jpg', NULL, NULL),
(211, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO BLANCO Y VERDE Nº 3', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(212, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO BLANCO, ROJO Y VERDE Nº 3', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HP3BRV900.jpg', NULL, NULL),
(213, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO AMARILLO, ROJO Y NEGRO Nº 3', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HP3ARN.jpg', NULL, NULL),
(214, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO FULL AMARILLO Nº 3 BOBINA', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPFA.jpg', NULL, NULL),
(215, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO FULL AMARILLO Y ROJO Nº 3', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPFARB.jpg', NULL, NULL),
(216, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO FULL BLANCO Y ROJO Nº 3', NULL, '800.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPFBR800.jpg', NULL, NULL),
(217, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO FULL BLANCO Y AZUL Nº 3', NULL, '800.00', 'gr', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(218, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO FULL BLANCO Y VERDE Nº 3', NULL, '800.00', 'gr', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(219, 'textil', 'hilo p/frigorifico', NULL, 'HP27C', 'HILO MORTADELA BOCHA CRUDO 27', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(220, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO MORTADELA BOCHA PULIDO MARRON 22', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HP22M.jpg', NULL, NULL),
(221, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO SUPER AMARILLO Nº 3', NULL, '500.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPOL3SUPER.jpg', NULL, NULL),
(222, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO SUPER AMARILLO Nº 6', NULL, '500.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPOL6SUPER.jpg', NULL, NULL),
(223, 'textil', 'hilo p/frigorifico', NULL, '', 'HILO PULIDO SUPER AMARILLO Nº 9', NULL, '500.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPOL9SUPER.jpg', NULL, NULL),
(224, 'textil', 'hilo p/agroindustria', NULL, 'HPOL180G', 'HILO POLIESTER CONITO', NULL, '180.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPOL180G.jpg', NULL, NULL),
(225, 'textil', 'hilo p/agroindustria', NULL, 'HPOL160G', 'HILO POLIESTER CONITO', NULL, '160.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPOL160G.jpg', NULL, NULL),
(226, 'textil', 'hilo p/agroindustria', NULL, 'HPOLC2500', 'HILO POLIESTER CONO', NULL, '2500.00', 'gr', NULL, NULL, 'assets/img/catalogo/HPOLC2500.jpg', NULL, NULL),
(227, 'textil', 'hilo p/agroindustria', NULL, 'HCM', 'HILO MULTIFILAMENTO', NULL, '180.00', 'gr', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(228, 'textil', 'hilo p/agroindustria', NULL, 'HCE500G', 'HILO PARA ENCAÑAR', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HCE500G.jpg', NULL, NULL),
(229, 'textil', 'hilo p/agroindustria', NULL, 'HPE', 'HILO PARA ENFARDAR', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(230, 'textil', 'hilo p/agroindustria', NULL, 'HCPV', 'HILO PABILO PARA VELAS', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(231, 'textil', 'hilo p/agroindustria', NULL, 'HCP27B900', 'HILO PIOLIN Nº 27', NULL, '900.00', 'gr', NULL, NULL, 'assets/img/catalogo/HCP27B900.jpg', NULL, NULL),
(232, 'textil', 'hilo p/tejeduria', NULL, 'HA4-1C', 'HILO 4/1 ALGODÓN EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(233, 'textil', 'hilo p/tejeduria', NULL, 'HC3C2000', 'HILO 4/3 ALGODON CRUDO EN CONO', NULL, '11.00', 'unid', NULL, NULL, 'assets/img/catalogo/HC3C2000.jpg', NULL, NULL),
(234, 'textil', 'hilo p/tejeduria', NULL, 'HP3AC1500', 'HILO 4/3 AMARILLO PULIDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HP3AC1500.jpg', NULL, NULL),
(235, 'textil', 'hilo p/tejeduria', NULL, 'HC6C', 'HILO 4/6 ALGODON CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HC6C.jpg', NULL, NULL),
(236, 'textil', 'hilo p/tejeduria', NULL, 'HC7-1C', 'HILO 7/1 CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HC7-1C.jpg', NULL, NULL),
(237, 'textil', 'hilo p/tejeduria', NULL, 'HC7-2C', 'HILO 7/2 CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HC7-2C.jpg', NULL, NULL),
(238, 'textil', 'hilo p/tejeduria', NULL, 'HC7-3C', 'HILO 7/3 CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HC7-3C.jpg', NULL, NULL),
(239, 'textil', 'hilo p/tejeduria', NULL, 'HP7-2VC', 'HILO 7/2 VERDE PULIDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HP7-2VC.jpg', NULL, NULL),
(240, 'textil', 'hilo p/tejeduria', NULL, 'HP7-3VC', 'HILO 7/3 VERDE PULIDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HP7-3VC.jpg', NULL, NULL),
(241, 'textil', 'hilo p/tejeduria', NULL, 'HC8-1CRUC', 'HILO 8/1 CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HC8-1CRUC.jpg', NULL, NULL),
(242, 'textil', 'hilo p/tejeduria', NULL, 'HAMX8-1C', 'HILO 8/1 AMARILLO R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HAMX8-1C.jpg', NULL, NULL),
(243, 'textil', 'hilo p/tejeduria', NULL, 'HAZ8-1C', 'HILO 8/1 AZUL R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HAZ8-1C.jpg', NULL, NULL),
(244, 'textil', 'hilo p/tejeduria', NULL, 'HVC8-1C', 'HILO 8/1 VERDE CLARO R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HVC8-1C.jpg', NULL, NULL),
(245, 'textil', 'hilo p/tejeduria', NULL, 'HGTC8-1C', 'HILO 8/1 GRIS TOPO R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(246, 'textil', 'hilo p/tejeduria', NULL, 'HN8-1C', 'HILO 8/1 NEGRO R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HN8-1C.jpg', NULL, NULL),
(247, 'textil', 'hilo p/tejeduria', NULL, 'HB8-1C', 'HILO 8/1 BLANCO R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HB8-1C.jpg', NULL, NULL),
(248, 'textil', 'hilo p/tejeduria', NULL, 'HBOR8-1C', 'HILO 8/1 BORDO R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HBOR8-1C.jpg', NULL, NULL),
(249, 'textil', 'hilo p/tejeduria', NULL, 'HFRA8-1C', 'HILO 8/1 FRANCIA R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HFRA8-1C.jpg', NULL, NULL),
(250, 'textil', 'hilo p/tejeduria', NULL, 'HNAR8-1C', 'HILO 8/1 NARANJA R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HNAR8-1C.jpg', NULL, NULL),
(251, 'textil', 'hilo p/tejeduria', NULL, 'HR8-1C', 'HILO 8/1 ROSA R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HR8-1C.jpg', NULL, NULL),
(252, 'textil', 'hilo p/tejeduria', NULL, 'H8-1C', 'HILO 8/1 CELESTE R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/H8-1C.jpg', NULL, NULL),
(253, 'textil', 'hilo p/tejeduria', NULL, 'H8C-2C', 'HILO 8/2 “COLOR” R EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(254, 'textil', 'hilo p/tejeduria', NULL, 'H8T-1C', 'HILO 8/1 “TINTORERIA” EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(255, 'textil', 'hilo p/tejeduria', NULL, 'H12-1C', 'HILO 12/1 CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(256, 'textil', 'hilo p/tejeduria', NULL, 'H12-2C', 'HILO 12/2 CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(257, 'textil', 'hilo p/tejeduria', NULL, 'HC14-1C', 'HILO 14/1 CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HC14-1C.jpg', NULL, NULL),
(258, 'textil', 'hilo p/tejeduria', NULL, 'HC14-2C', 'HILO 14/2 CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HC14-2C.jpg', NULL, NULL),
(259, 'textil', 'hilo p/tejeduria', NULL, 'HN14-1TN', 'HILO 14/1 NEGRO T CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(260, 'textil', 'hilo p/tejeduria', NULL, 'HB14-1C', 'HILO 14/1 BLANCO T CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(261, 'textil', 'hilo p/tejeduria', NULL, 'H14-1VERMC', 'HILO 14/1 VERDE MUSGO T CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(262, 'textil', 'hilo p/tejeduria', NULL, 'HCAR14-1C', 'HILO 14/1 CARAMELO T CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(263, 'textil', 'hilo p/tejeduria', NULL, 'HSAL14-1C', 'HILO 14/1 SALVADO T CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(264, 'textil', 'hilo p/tejeduria', NULL, 'HGT14-1C', 'HILO 14/1 GRIS TOPO T CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(265, 'textil', 'hilo p/tejeduria', NULL, 'HMA14-1C', 'HILO 14/1 MARRON AFRICANO T CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(266, 'textil', 'hilo p/tejeduria', NULL, 'HGPL14-1C', 'HILO 14/1 GRIS PLATA T CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(267, 'textil', 'hilo p/tejeduria', NULL, 'HAZU14-1C', 'HILO 14/1 AZUL MARINO T CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(268, 'textil', 'hilo p/tejeduria', NULL, 'HCO14-2C', 'HILO 14/2 “COLOR” T CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(269, 'textil', 'hilo p/tejeduria', NULL, 'HC16-1W', 'HILO 16/1 CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(270, 'textil', 'hilo p/tejeduria', NULL, 'HC16-2C', 'HILO 16/2 CRUDO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(271, 'textil', 'hilo p/tejeduria', NULL, 'HW24-1C', 'HILO 24/1 WATER ALGODON EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(272, 'textil', 'hilo p/tejeduria', NULL, 'HC24-2C', 'HILO 24/2 WATER ALGODON EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HC24-2C.jpg', NULL, NULL),
(273, 'textil', 'hilo p/tejeduria', NULL, 'HP24-1C', 'HILO 24/1 PEINADO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(274, 'textil', 'hilo p/tejeduria', NULL, 'HC24-2PEIN', 'HILO 24/2 PEINADO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(275, 'textil', 'hilo p/tejeduria', NULL, 'H30-1C', 'HILO 30/1 PEINADO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(276, 'textil', 'hilo p/tejeduria', NULL, 'HC30-2PEIN', 'HILO 30/2 PEINADO EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(277, 'textil', 'hilo p/tejeduria', NULL, 'HPO24-1C', 'HILO 24/1 POLIESTER EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(278, 'textil', 'hilo p/tejeduria', NULL, 'HCP1', 'HILO PABILO Nº 1 EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(279, 'textil', 'hilo p/tejeduria', NULL, 'HCP1X3', 'HILO PABILO Nº 1 X 3 CABOS EN CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/HCP1X3.jpg', NULL, NULL),
(280, 'textil', 'hilo fason', NULL, 'HFA4-3', 'TRABAJO A FASON RETORCIDO 4/3 CONO', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(281, 'textil', 'hilo fason', NULL, 'HFA7-2', 'TRABAJO A FASON RETORCIDO 7/2 ó 7/3', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(282, 'textil', 'hilo fason', NULL, 'HFA12-2', 'TRABAJO A FASON RETORCIDO 12/2', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(283, 'textil', 'hilo fason', NULL, 'HFA14-2', 'TRABAJO A FASON RETORCIDO 14/2 ó 16/2', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(284, 'textil', 'hilo fason', NULL, 'HFA24-2', 'TRABAJO A FASON RETORCIDO 24/2', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(285, 'textil', 'hilo fason', NULL, 'HFA30-2', 'TRABAJO A FASON RETORCIDO 30/2', NULL, '1.00', 'unid', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(286, 'textil', 'hilo fason', NULL, 'MFAT200', 'TRABAJO A FASON MADEJA TITULO 1', NULL, '200.00', 'gr', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(287, 'textil', 'hilo fason', NULL, 'MFAO100', 'TRABAJO A FASON OVILLADO TITULO 1', NULL, '100.00', 'gr', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL),
(288, 'textil', 'hilo fason', NULL, 'MFAV1K', 'TRABAJO A FASON VAPORIZADO TITULO 1', NULL, '1.00', 'kg', NULL, NULL, 'assets/img/catalogo/default.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos2`
--

CREATE TABLE `articulos2` (
  `id` int(11) NOT NULL,
  `subcategoria` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idDetalle` int(11) DEFAULT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `peso` decimal(7,2) NOT NULL,
  `unidad` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `urlPhoto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `updated_at` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `articulos2`
--

INSERT INTO `articulos2` (`id`, `subcategoria`, `idCategoria`, `idDetalle`, `codigo`, `nombre`, `peso`, `unidad`, `urlPhoto`, `updated_at`, `created_at`) VALUES
(1, 'alimentaria', 1, NULL, NULL, 'ACHUETE', '1.00', 'kg', '', '', ''),
(2, 'alimentaria', 1, NULL, NULL, 'AJI MOLIDO', '1.00', 'kg', '', '', ''),
(3, 'alimentaria', 1, NULL, NULL, 'AJO EN POLVO (NACIONAL)', '1.00', 'kg', '', '', ''),
(4, 'alimentaria', 1, NULL, NULL, 'AJO EN POLVO(CHINO) BLANCO', '1.00', 'kg', '', '', ''),
(5, 'alimentaria', 1, NULL, NULL, 'AJO PARTIDO CHINO', '1.00', 'kg', '', '', ''),
(6, 'alimentaria', 1, NULL, NULL, 'AJO PARTIDO NACIONAL', '1.00', 'kg', '', '', ''),
(7, 'alimentaria', 1, NULL, NULL, 'ANIS EN GRANO O MOLIDO', '1.00', 'kg', '', '', ''),
(8, 'alimentaria', 1, NULL, NULL, 'ANTICUAGULANTE', '1.00', 'kg', '', '', ''),
(9, 'alimentaria', 1, NULL, NULL, 'CALER \"A\" (fijador color secos)', '1.00', 'kg', '', '', ''),
(10, 'alimentaria', 1, NULL, NULL, 'CALER \"S\" (fijador color frescos)', '1.00', 'kg', '', '', ''),
(11, 'alimentaria', 1, NULL, NULL, 'CANELA MOLIDA', '1.00', 'kg', '', '', ''),
(12, 'alimentaria', 1, NULL, NULL, 'CARMIN', '1.00', 'kg', '', '', ''),
(13, 'alimentaria', 1, NULL, NULL, 'CAYENA MOLIDA', '1.00', 'kg', '', '', ''),
(14, 'alimentaria', 1, NULL, NULL, 'CHIMICHURRI', '1.00', 'kg', '', '', ''),
(15, 'alimentaria', 1, NULL, NULL, 'CLAVO DE OLOR EN GRANO', '1.00', 'kg', '', '', ''),
(16, 'alimentaria', 1, NULL, NULL, 'CLAVO OLOR MOLIDO (PEDUNCULO)', '1.00', 'kg', '', '', ''),
(17, 'alimentaria', 1, NULL, NULL, 'COLORANTE VEGETAL', '1.00', 'kg', '', '', ''),
(18, 'alimentaria', 1, NULL, NULL, 'COMINO MOLIDO', '1.00', 'kg', '', '', ''),
(19, 'alimentaria', 1, NULL, NULL, 'CONDIMENTO PARA ARROZ', '1.00', 'kg', '', '', ''),
(20, 'alimentaria', 1, NULL, NULL, 'CONDIMENTO PIZZA', '1.00', 'kg', '', '', ''),
(21, 'alimentaria', 1, NULL, NULL, 'CORIANDRO MOLIDO', '1.00', 'kg', '', '', ''),
(22, 'alimentaria', 1, NULL, NULL, 'CURCUMA', '1.00', 'kg', '', '', ''),
(23, 'alimentaria', 1, NULL, NULL, 'DEXTROSA', '1.00', 'kg', '', '', ''),
(24, 'alimentaria', 1, NULL, NULL, 'ESPECIAS SURTIDAS', '1.00', 'kg', '', '', ''),
(25, 'alimentaria', 1, NULL, NULL, 'FIUMER \"E\" (fosfato emulsion)', '1.00', 'kg', '', '', ''),
(26, 'alimentaria', 1, NULL, NULL, 'FIUMER \"I\" (fosfato inyeccion)', '1.00', 'kg', '', '', ''),
(27, 'alimentaria', 1, NULL, NULL, 'GLUTAMATO MONOSODICO', '1.00', 'kg', '', '', ''),
(28, 'alimentaria', 1, NULL, NULL, 'GOMEX', '1.00', 'kg', '', '', ''),
(29, 'alimentaria', 1, NULL, NULL, 'HINOJO EN GRANO O MOLIDO', '1.00', 'kg', '', '', ''),
(30, 'alimentaria', 1, NULL, NULL, 'JENGIBRE', '1.00', 'kg', '', '', ''),
(31, 'alimentaria', 1, NULL, NULL, 'LAUREL MOLIDO', '1.00', 'kg', '', '', ''),
(32, 'alimentaria', 1, NULL, NULL, 'LIGA PARA MATAMBRE', '1.00', 'kg', '', '', ''),
(33, 'alimentaria', 1, NULL, NULL, 'NITRATO DE SODIO', '1.00', 'kg', '', '', ''),
(34, 'alimentaria', 1, NULL, NULL, 'NUEZ MOSCADA MOLIDA', '1.00', 'kg', '', '', ''),
(35, 'alimentaria', 1, NULL, NULL, 'OREGANO', '1.00', 'kg', '', '', ''),
(36, 'alimentaria', 1, NULL, NULL, 'PEREJIL EN HOJA', '1.00', 'kg', '', '', ''),
(37, 'alimentaria', 1, NULL, NULL, 'PIMENTA BLANCA GRANO /PART/MOLIDA', '1.00', 'kg', '', '', ''),
(38, 'alimentaria', 1, NULL, NULL, 'PIMENTON ESENCIA', '1.00', 'kg', '', '', ''),
(39, 'alimentaria', 1, NULL, NULL, 'PIMENTON AHUMADO', '1.00', 'kg', '', '', ''),
(40, 'alimentaria', 1, NULL, NULL, 'PIMIENTA NEGRA GRANO/PART/MOLIDA', '1.00', 'kg', '', '', ''),
(41, 'alimentaria', 1, NULL, NULL, 'PROVENZAL IMPORTADA', '1.00', 'kg', '', '', ''),
(42, 'alimentaria', 1, NULL, NULL, 'SAL', '1.00', 'kg', '', '', ''),
(43, 'alimentaria', 1, NULL, NULL, 'SAL ANTIOXIDANTE', '1.00', 'kg', '', '', ''),
(44, 'alimentaria', 1, NULL, NULL, 'SAL DE CURA', '1.00', 'kg', '', '', ''),
(45, 'alimentaria', 1, NULL, NULL, 'NITRITO', '1.00', 'kg', '', '', ''),
(46, 'alimentaria', 2, NULL, NULL, 'SULFITO DE SODIO', '1.00', 'kg', '', '', ''),
(47, 'alimentaria', 2, NULL, NULL, 'FECULA DE MAIZ KG', '1.00', 'kg', '', '', ''),
(48, 'alimentaria', 2, NULL, NULL, 'FECULA DE MAIZ X 25 KG.', '25.00', 'kg', '', '', ''),
(49, 'alimentaria', 2, NULL, NULL, 'FECULA DE MANDIOCA', '1.00', 'kg', '', '', ''),
(50, 'alimentaria', 2, NULL, NULL, 'FECULA DE MANDIOCA X 25 KG', '25.00', 'kg', '', '', ''),
(51, 'alimentaria', 2, NULL, NULL, 'FECULA DE PAPA', '1.00', 'kg', '', '', ''),
(52, 'alimentaria', 2, NULL, NULL, 'FECULA DE PAPA X 25 KG', '25.00', 'kg', '', '', ''),
(53, 'alimentaria', 2, NULL, NULL, 'FECULA DE TRIGO', '1.00', 'kg', '', '', ''),
(54, 'alimentaria', 2, NULL, NULL, 'FECULA DE TRIGO X 25 KG', '25.00', 'kg', '', '', ''),
(55, 'alimentaria', 2, NULL, NULL, 'GLUTEN DE TRIGO', '1.00', 'kg', '', '', ''),
(56, 'alimentaria', 2, NULL, NULL, 'GLUTEN DE TRIGO X 25 KG', '25.00', 'kg', '', '', ''),
(57, 'alimentaria', 2, NULL, NULL, 'HARINA DE SOJA X 20 kg', '20.00', 'kg', '', '', ''),
(58, 'alimentaria', 2, NULL, NULL, 'HARINA DE SOJA FINA', '1.00', 'kg', '', '', ''),
(59, 'alimentaria', 2, NULL, NULL, 'HARINA DE SOJA X 1 KG GRUESA', '1.00', 'kg', '', '', ''),
(60, 'alimentaria', 2, NULL, NULL, 'HARINA DE SOJA M X 30 GRUESA', '30.00', 'kg', '', '', ''),
(61, 'alimentaria', 2, NULL, NULL, 'REBOZADOR BALONIX 25', '25.00', 'kg', '', '', ''),
(62, 'alimentaria', 2, NULL, NULL, 'SANGRE ENTERA (NUTRAGEL)', '1.00', 'kg', '', '', ''),
(63, 'alimentaria', 2, NULL, NULL, 'SANGRE ENTERA X 20 KG', '20.00', 'kg', '', '', ''),
(64, 'alimentaria', 2, NULL, NULL, 'PAN RALLADO X 25 KG', '25.00', 'kg', '', '', ''),
(65, 'alimentaria', 3, NULL, NULL, 'INTEGRAL CHORIZO FRESCO (uso 7 x 100)', '5.00', 'kg', '', '', ''),
(66, 'alimentaria', 3, NULL, NULL, 'INTEGRAL CHORIZO FRESCO (uso 7 x 100)', '10.00', 'kg', '', '', ''),
(67, 'alimentaria', 3, NULL, NULL, 'INTEGRAL CHORIZO FRESCO (uso 7 x 100)', '1.00', 'kg', '', '', ''),
(68, 'alimentaria', 3, NULL, NULL, 'INTEGRAL CHORIZO FRESCO COLORADO (10X100)', '5.00', 'kg', '', '', ''),
(69, 'alimentaria', 3, NULL, NULL, 'INTEGRAL CHORIZO FRESCO COLORADO (10X100)', '10.00', 'kg', '', '', ''),
(70, 'alimentaria', 3, NULL, NULL, 'INTEGRAL CHORIZO FRESCO COLORADO (10X100)', '1.00', 'kg', '', '', ''),
(71, 'alimentaria', 3, NULL, NULL, 'INTEGRAL SALCHICHA FRESCA (7X100)', '5.00', 'kg', '', '', ''),
(72, 'alimentaria', 3, NULL, NULL, 'INTEGRAL SALCHICHA FRESCA (7X100)', '10.00', 'kg', '', '', ''),
(73, 'alimentaria', 3, NULL, NULL, 'INTEGRAL SALCHICHA FRESCA (7 X 100)', '1.00', 'kg', '', '', ''),
(74, 'alimentaria', 3, NULL, NULL, 'INTEGRAL HAMBURGUESA S/CARNE (5X100)', '5.00', 'kg', '', '', ''),
(75, 'alimentaria', 3, NULL, NULL, 'INTEGRAL HAMBURGUESA S/CARNE (5X100)', '10.00', 'kg', '', '', ''),
(76, 'alimentaria', 3, NULL, NULL, 'INTEGRAL HAMBURGUESA S/CARNE X 1 KG (5 x 100)', '1.00', 'kg', '', '', ''),
(77, 'alimentaria', 3, NULL, NULL, 'INTEGRAL HAMBURGUESA S/POLLO 5 Y 10 (5 X 100)', '5.00', 'kg', '', '', ''),
(78, 'alimentaria', 3, NULL, NULL, 'INTEGRAL HAMBURGUESA S/POLLO 5 Y 10 (5 X 100)', '10.00', 'kg', '', '', ''),
(79, 'alimentaria', 3, NULL, NULL, 'INTEGRAL HAMBURGUESA SABOR POLLO X 1 KG (5X100)', '1.00', 'kg', '', '', ''),
(80, 'alimentaria', 3, 2, NULL, 'INTEGRAL MILANESA DE CARNE (USO 1 X 6 AGUA)', '5.00', 'kg', '', '', ''),
(81, 'alimentaria', 3, 2, NULL, 'INTEGRAL MILANESA DE CARNE (USO 1 X 6 AGUA)', '10.00', 'kg', '', '', ''),
(82, 'alimentaria', 3, 2, NULL, 'INTEGRAL MILANESA DE CARNE (USO 1 KG X 6 AGUA)', '1.00', 'kg', '', '', ''),
(83, 'alimentaria', 3, NULL, NULL, 'INTEGRAL MILANESA S/POLLO (1KG X 6 AGUA)', '5.00', 'kg', '', '', ''),
(84, 'alimentaria', 3, NULL, NULL, 'INTEGRAL MILANESA S/POLLO (1KG X 6 AGUA)', '10.00', 'kg', '', '', ''),
(85, 'alimentaria', 3, NULL, NULL, 'INTEGRAL MILANESA SABOR POLLO X 1KG (1X6 AGUA)', '1.00', 'kg', '', '', ''),
(86, 'alimentaria', 3, NULL, NULL, 'INTEGRAL SALAME (USO 7 X 100)', '5.00', 'kg', '', '', ''),
(87, 'alimentaria', 3, NULL, NULL, 'INTEGRAL SALAME (USO 7 X 100)', '10.00', 'kg', '', '', ''),
(88, 'alimentaria', 3, NULL, NULL, 'INTEGRAL SALAME (USO 7 X 100)', '1.00', 'kg', '', '', ''),
(89, 'alimentaria', 3, NULL, NULL, 'INTEGRAL LONGANIZA ESPAÑOLA (USO10X100)', '5.00', 'kg', '', '', ''),
(90, 'alimentaria', 3, NULL, NULL, 'INTEGRAL LONGANIZA ESPAÑOLA (USO10X100)', '10.00', 'kg', '', '', ''),
(91, 'alimentaria', 3, NULL, NULL, 'INTEGRAL LONGANIZA ESPAÑOLA X 1 KG(USO 10 X 100)', '1.00', 'kg', '', '', ''),
(92, 'alimentaria', 3, NULL, NULL, 'INTEGRAL CRESPON Y CANTIMPALO 5 Y 10 (USO 10X100)', '5.00', 'kg', '', '', ''),
(93, 'alimentaria', 3, NULL, NULL, 'INTEGRAL CRESPON Y CANTIMPALO 5 Y 10 (USO 10X100)', '10.00', 'kg', '', '', ''),
(94, 'alimentaria', 3, NULL, NULL, 'INTEGRAL CRESPON Y CANTIMPALO X 1 KG (USO 10 X 100)', '1.00', 'kg', '', '', ''),
(95, 'alimentaria', 3, NULL, NULL, 'INTEGRAL BONDIOLA Y JAMON', '5.00', 'kg', '', '', ''),
(96, 'alimentaria', 3, NULL, NULL, 'INTEGRAL BONDIOLA Y JAMON', '10.00', 'kg', '', '', ''),
(97, 'alimentaria', 3, NULL, NULL, 'INTEGRAL BONDIOLA Y JAMON (7 X 100)', '1.00', 'kg', '', '', ''),
(98, 'alimentaria', 3, NULL, NULL, 'INTEGRAL MORCILLA (USO 7 X 100)', '5.00', 'kg', '', '', ''),
(99, 'alimentaria', 3, NULL, NULL, 'INTEGRAL MORCILLA (USO 7 X 100)', '10.00', 'kg', '', '', ''),
(100, 'alimentaria', 3, NULL, NULL, 'INTEGRAL MORCILLA X 1 KG (USO 7 X 100)', '1.00', 'kg', '', '', ''),
(101, 'alimentaria', 3, NULL, NULL, 'INTEGRAL QUESO DE CERDO (USO 7 X 100)', '5.00', 'kg', '', '', ''),
(102, 'alimentaria', 3, NULL, NULL, 'INTEGRAL QUESO DE CERDO (USO 7 X 100)', '10.00', 'kg', '', '', ''),
(103, 'alimentaria', 3, NULL, NULL, 'INTEGRAL QUESO DE CERDO X 1 KG(USO 7 X 100)', '1.00', 'kg', '', '', ''),
(104, 'alimentaria', 3, NULL, NULL, 'INTEGRAL PANCETA', '5.00', 'kg', '', '', ''),
(105, 'alimentaria', 3, NULL, NULL, 'INTEGRAL PANCETA', '10.00', 'kg', '', '', ''),
(106, 'alimentaria', 3, NULL, NULL, 'INTEGRAL CIERVO Y ÑANDU', '1.00', 'kg', '', '', ''),
(107, 'alimentaria', 3, NULL, NULL, 'SABOR A HUMO', '1.00', 'kg', '', '', ''),
(108, 'alimentaria', 3, NULL, NULL, 'SABOR A JAMON concentracion 1 x 10', '1.00', 'kg', '', '', ''),
(109, 'alimentaria', 3, NULL, NULL, 'SABOR A POLLO concentracion 1x 10', '1.00', 'kg', '', '', ''),
(110, 'alimentaria', 3, NULL, NULL, 'SABOR A QUESO', '1.00', 'kg', '', '', ''),
(111, 'alimentaria', 3, NULL, NULL, 'SABORIZANTE AJO concentrado 1 x 10', '1.00', 'kg', '', '', ''),
(112, 'alimentaria', 3, NULL, NULL, 'SABORIZANTE CHORIZO', '1.00', 'kg', '', '', ''),
(113, 'alimentaria', 3, NULL, NULL, 'SABORIZANTE CHORIZO ESPECIAL', '1.00', 'kg', '', '', ''),
(114, 'alimentaria', 3, NULL, NULL, 'SABORIZANTE CHORIZO P/C', '1.00', 'kg', '', '', ''),
(115, 'alimentaria', 3, NULL, NULL, 'SABORIZANTE MATAMBRE', '1.00', 'kg', '', '', ''),
(116, 'alimentaria', 3, NULL, NULL, 'SABORIZANTE MORCILLA', '1.00', 'kg', '', '', ''),
(117, 'alimentaria', 3, NULL, NULL, 'SABORIZANTE RAVIOLES', '1.00', 'kg', '', '', ''),
(118, 'alimentaria', 3, NULL, NULL, 'SABOR PIMIENTA', '5.00', 'kg', '', '', ''),
(119, 'alimentaria', 3, NULL, NULL, 'SABOR NUEZ MOSCADA', '5.00', 'kg', '', '', ''),
(120, 'alimentaria', 4, NULL, NULL, 'ORILLA VACUNA 40/42', '15.00', 'mts', '', '', ''),
(121, 'alimentaria', 4, NULL, NULL, 'ORILLA VACUNA 42/44', '25.00', 'mts', '', '', ''),
(122, 'alimentaria', 4, NULL, NULL, 'ORILLA VACUNA 44/46', '25.00', 'mts', '', '', ''),
(123, 'alimentaria', 4, NULL, NULL, 'TRIPON VACUNO (planchado y blanqueado)', '10.00', 'mts', '', '', ''),
(124, 'alimentaria', 4, NULL, NULL, 'ORILLA VACUNA 40/43 X 15 MTS', '15.00', 'mts', '', '', ''),
(125, 'alimentaria', 4, NULL, NULL, 'ORILLA VACUNA 40/43 X 30 MTS', '30.00', 'mts', '', '', ''),
(126, 'alimentaria', 4, NULL, NULL, 'CHINEZCA IMPORTADA X 90 MT', '90.00', 'mts', '', '', ''),
(127, 'alimentaria', 4, NULL, NULL, 'CHINEZCA NACIONAL 38/40 X 70', '70.00', 'mts', '', '', ''),
(128, 'alimentaria', 4, NULL, NULL, 'OVINO 22/24 X 90 MTS', '90.00', 'mts', '', '', ''),
(129, 'alimentaria', 4, NULL, NULL, 'TUBO 24 X 15 MTS', '15.00', 'mts', '', '', ''),
(130, 'alimentaria', 4, NULL, NULL, 'CHINEZCA NACIONAL TIRAS CORTAS', '1.00', 'unid', '', '', ''),
(131, 'alimentaria', 4, NULL, NULL, 'COLAGENO 24', '425.00', 'mts', '', '', ''),
(132, 'alimentaria', 4, NULL, NULL, 'COLAGENO 25', '630.00', 'mts', '', '', ''),
(133, 'alimentaria', 4, NULL, NULL, 'COLAGENO 45 EL MT (FIBRAN)', '1.00', 'mts', '', '', ''),
(134, 'alimentaria', 4, NULL, NULL, 'COLAGENO 50 EL MTS (FIBRAN)', '1.00', 'mts', '', '', ''),
(135, 'alimentaria', 4, NULL, NULL, 'COLAGENO 55 EL MT (FIBRAN)', '1.00', 'mts', '', '', ''),
(136, 'alimentaria', 4, NULL, NULL, 'COLAGENO 60 EL MT (FIBRAN)', '1.00', 'mts', '', '', ''),
(137, 'alimentaria', 4, NULL, NULL, 'COLAGENO 80 EL MT (FIBRAN)', '1.00', 'mts', '', '', ''),
(138, 'alimentaria', 4, NULL, NULL, 'BOLSAS CRISTAL 18 X 56', '1.00', 'unid', '', '', ''),
(139, 'alimentaria', 4, NULL, NULL, 'BOLSAS MORT. POLIAMIDA marron', '1.00', 'mts', '', '', ''),
(140, 'alimentaria', 4, NULL, NULL, 'BOLSAS QUESO DE CERDO 18 X 56', '1.00', 'unid', '', '', ''),
(141, 'alimentaria', 4, NULL, NULL, 'BOLSAS ROJAS 18 X 56', '1.00', 'unid', '', '', ''),
(142, 'alimentaria', 4, NULL, NULL, 'BOLSAS SALCHICHON C/JAMON 18 X 56', '1.00', 'unid', '', '', ''),
(143, 'alimentaria', 4, NULL, NULL, 'BOLSAS SALCHICHON PRIMAV 18 X 56', '1.00', 'unid', '', '', ''),
(144, 'alimentaria', 4, NULL, NULL, 'CELOFAN MICROPOROSO 46 X 50', '1.00', 'unid', '', '', ''),
(145, 'alimentaria', 4, NULL, NULL, 'CELOFAN MICROPOROSO 70 x 90', '1.00', 'unid', '', '', ''),
(146, 'alimentaria', 4, NULL, NULL, 'GANCHOS METALICOS N° 1', '1.00', 'unid', '', '', ''),
(147, 'alimentaria', 4, NULL, NULL, 'HIPOCLORITO DE SODIO', '1.00', 'unid', '', '', ''),
(148, 'alimentaria', 4, NULL, NULL, 'PAPEL FOLEX P/HAMBURGUESA', '1.00', 'unid', '', '', ''),
(149, 'alimentaria', 4, NULL, NULL, 'PASTA DESENGRASANTE', '1.00', 'unid', '', '', ''),
(150, 'alimentaria', 4, NULL, NULL, 'RED BONDIOLA CUADRADA POR RED', '1.00', 'unid', '', '', ''),
(151, 'alimentaria', 4, NULL, NULL, 'RED BONDIOLAX 10MTS', '10.00', 'mts', '', '', ''),
(152, 'alimentaria', 4, NULL, NULL, 'RED MORTADELA COLOR', '1.00', 'unid', '', '', ''),
(153, 'alimentaria', 4, NULL, NULL, 'VASELINA LIQUIDA', '1.00', 'unid', '', '', ''),
(154, 'alimentaria', 5, NULL, NULL, 'HAMBURGUESERA MEDIANA', '1.00', 'unid', '', '', ''),
(155, 'alimentaria', 5, NULL, NULL, 'HAMBURGUESERA CHICA', '1.00', 'unid', '', '', ''),
(156, 'alimentaria', 5, NULL, NULL, 'EMBUDO ACERO', '1.00', 'unid', '', '', ''),
(157, 'alimentaria', 5, NULL, NULL, 'PALITOS ESPUELAS', '1.00', 'unid', '', '', ''),
(158, 'alimentaria', 5, NULL, NULL, 'PALOTE', '1.00', 'unid', '', '', ''),
(159, 'alimentaria', 5, NULL, NULL, 'EMBUDO PLASTICO 32 CHORIZO', '1.00', 'unid', '', '', ''),
(160, 'alimentaria', 5, NULL, NULL, 'EMBUDO PLASTICO', '1.00', 'unid', '', '', ''),
(161, 'alimentaria', 5, NULL, NULL, 'DISCO PLASTICO', '1.00', 'unid', '', '', ''),
(162, 'alimentaria', 5, NULL, NULL, 'PINCHE', '1.00', 'unid', '', '', ''),
(163, 'textil', 6, NULL, 'HC3B330', 'HILO CRUDO Nº 3 BOBINA 330 G', '330.00', 'gr', '', '', ''),
(164, 'textil', 6, NULL, 'HC3B900', 'HILO CRUDO Nº 3 BOBINA 900 G', '900.00', 'gr', '', '', ''),
(165, 'textil', 6, NULL, 'HC4B330', 'HILO CRUDO Nº 4 BOBINA 330 G', '330.00', 'gr', '', '', ''),
(166, 'textil', 6, NULL, 'HC4B900', 'HILO CRUDO Nº 4 BOBINA 900 G', '900.00', 'gr', '', '', ''),
(167, 'textil', 6, NULL, 'HC5B330', 'HILO CRUDO Nº 5 BOBINA 330 G', '330.00', 'gr', '', '', ''),
(168, 'textil', 6, NULL, 'HC6B330', 'HILO CRUDO Nº 6 BOBINA 330 G', '330.00', 'gr', '', '', ''),
(169, 'textil', 6, NULL, 'HC8B330', 'HILO CRUDO Nº 8 BOBINA 330 G', '330.00', 'gr', '', '', ''),
(170, 'textil', 6, NULL, 'HC8B800', 'HILO CRUDO Nº 8 BOBINA 900 G', '900.00', 'gr', '', '', ''),
(171, 'textil', 6, NULL, 'HC11B900', 'HILO CRUDO Nº 11 BOBINA 900 G', '900.00', 'gr', '', '', ''),
(172, 'textil', 6, NULL, 'HC15B800', 'HILO CRUDO Nº 15 BOBINA 900 G', '900.00', 'gr', '', '', ''),
(173, 'textil', 6, NULL, 'HC22B800', 'HILO CRUDO Nº 22 BOBINA 900 G', '900.00', 'gr', '', '', ''),
(174, 'textil', 6, NULL, 'HC27B800', 'HILO CRUDO Nº 27 BOBINA 900 G', '900.00', 'gr', '', '', ''),
(175, 'textil', 6, NULL, 'HP3A900', 'HILO PULIDO AMARILLO Nº 3 BOBINA 330 G', '330.00', 'gr', '', '', ''),
(176, 'textil', 6, NULL, 'HCO30', 'HILO CRUDO Nº 3 OVILLO DE 30 G', '30.00', 'gr', '', '', ''),
(177, 'textil', 6, NULL, 'HCO50', 'HILO CRUDO Nº 4 OVILLO DE 50 G', '50.00', 'gr', '', '', ''),
(178, 'textil', 6, NULL, 'HCO100', 'HILO CRUDO Nº 4 OVILLO DE 100 G', '100.00', 'gr', '', '', ''),
(179, 'textil', 6, NULL, 'HPO30', 'HILO PULIDO AMARILLO Nº 3 OVILLO 30 G', '30.00', 'gr', '', '', ''),
(180, 'textil', 6, NULL, 'HPO50', 'HILO PULIDO AMARILLO Nº 3 OVILLO 50 G', '50.00', 'gr', '', '', ''),
(181, 'textil', 6, NULL, 'HPO100', 'HILO PULIDO AMARILLO Nº 3 OVILLO 100 G', '100.00', 'gr', '', '', ''),
(182, 'textil', 6, NULL, 'HOX50GRIS', 'HILO COLOR GRIS TOPO OVILLO 50 G PAQ 10U', '10.00', 'unid', '', '', ''),
(183, 'textil', 6, NULL, 'HOBX50', 'HILO COLOR BLANCO OVILLO 50 G PAQ 10U', '10.00', 'unid', '', '', ''),
(184, 'textil', 6, NULL, 'HOX50CEL', 'HILO COLOR CELESTE OVILLO 50 G PAQ 10', '10.00', 'unid', '', '', ''),
(185, 'textil', 6, NULL, 'HOX50FRA', 'HILO COLOR FRANCIA OVILLO 50 G PAQ 10', '10.00', 'unid', '', '', ''),
(186, 'textil', 6, NULL, 'HOX50NAR', 'HILO COLOR NARANJA OVILLO 50 G PAQ 10', '10.00', 'unid', '', '', ''),
(187, 'textil', 6, NULL, 'HOX50NEG', 'HILO COLOR NEGRO OVILLO 50 G PAQ 10', '10.00', 'unid', '', '', ''),
(188, 'textil', 6, NULL, 'HORX50', 'HILO COLOR ROSA OVILLO 50 G PAQ 10', '10.00', 'unid', '', '', ''),
(189, 'textil', 6, NULL, 'HOVCX100', 'HILO COLOR VERDE CLARO OVILLO 50 G PAQ 10', '10.00', 'unid', '', '', ''),
(190, 'textil', 6, NULL, 'HOX50VERDE', 'HILO COLOR VERDE OVILLO 50 G PAQ 10', '10.00', 'unid', '', '', ''),
(191, 'textil', 6, NULL, 'HOX50AZU', 'HILO COLOR AZUL OVILLO 50 G PAQ 10', '10.00', 'unid', '', '', ''),
(192, 'textil', 6, NULL, 'HOROX100', 'HILO COLOR ROJO OVILLO 50 G PAQ 10', '10.00', 'unid', '', '', ''),
(193, 'textil', 6, NULL, 'HOX50BOX', 'HILO COLOR BORDO OVILLO 50 G PAQ 10', '10.00', 'unid', '', '', ''),
(194, 'textil', 6, NULL, 'HOX50MUL', 'HILO MULTICOLOR OVILLO 50 G PAQ 11', '11.00', 'unid', '', '', ''),
(195, 'textil', 6, NULL, 'HYOX100', 'HILO YUTE OVILLO 100 G PAQ 10U', '10.00', 'unid', '', '', ''),
(196, 'textil', 6, NULL, 'HSOX100', 'HILO SISAL OVILLO 80 G PAQ 10U', '10.00', 'unid', '', '', ''),
(197, 'textil', 6, NULL, 'HCP27X100', 'HILO PIOLIN Nº 27 X 100 G', '100.00', 'gr', '', '', ''),
(198, 'textil', 6, NULL, 'HCP24X50G', 'HILO CRUDO PIOLIN Nº 24 X 50 G', '50.00', 'gr', '', '', ''),
(199, 'textil', 7, NULL, '', '', '120.00', 'gr', '', '', ''),
(200, 'textil', 7, NULL, '', '', '1.00', 'kg', '', '', ''),
(201, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(202, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(203, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(204, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(205, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(206, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(207, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(208, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(209, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(210, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(211, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(212, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(213, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(214, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(215, 'textil', 7, NULL, '', '', '900.00', 'gr', '', '', ''),
(216, 'textil', 7, NULL, '', '', '800.00', 'gr', '', '', ''),
(217, 'textil', 7, NULL, '', '', '800.00', 'gr', '', '', ''),
(218, 'textil', 7, NULL, '', '', '800.00', 'gr', '', '', ''),
(219, 'textil', 7, NULL, '', '', '1.00', 'unid', '', '', ''),
(220, 'textil', 7, NULL, '', '', '1.00', 'unid', '', '', ''),
(221, 'textil', 7, NULL, '', '', '500.00', 'gr', '', '', ''),
(222, 'textil', 7, NULL, '', '', '500.00', 'gr', '', '', ''),
(223, 'textil', 7, NULL, '', '', '500.00', 'gr', '', '', ''),
(224, 'textil', 8, NULL, '', '', '180.00', 'gr', '', '', ''),
(225, 'textil', 8, NULL, '', '', '160.00', 'gr', '', '', ''),
(226, 'textil', 8, NULL, '', '', '2500.00', 'gr', '', '', ''),
(227, 'textil', 8, NULL, '', '', '180.00', 'gr', '', '', ''),
(228, 'textil', 8, NULL, '', '', '1.00', 'unid', '', '', ''),
(229, 'textil', 8, NULL, '', '', '1.00', 'unid', '', '', ''),
(230, 'textil', 8, NULL, '', '', '1.00', 'unid', '', '', ''),
(231, 'textil', 8, NULL, '', '', '900.00', 'gr', '', '', ''),
(232, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(233, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(234, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(235, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(236, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(237, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(238, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(239, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(240, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(241, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(242, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(243, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(244, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(245, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(246, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(247, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(248, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(249, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(250, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(251, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(252, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(253, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(254, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(255, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(256, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(257, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(258, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(259, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(260, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(261, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(262, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(263, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(264, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(265, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(266, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(267, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(268, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(269, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(270, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(271, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(272, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(273, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(274, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(275, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(276, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(277, 'textil', 9, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(278, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(279, 'textil', 9, NULL, '', '', '1.00', 'unid', '', '', ''),
(280, 'textil', 10, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(281, 'textil', 10, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(282, 'textil', 10, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(283, 'textil', 10, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(284, 'textil', 10, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(285, 'textil', 10, NULL, NULL, '', '1.00', 'unid', '', '', ''),
(286, 'textil', 10, NULL, NULL, '', '200.00', 'gr', '', '', ''),
(287, 'textil', 10, NULL, NULL, '', '100.00', 'gr', '', '', ''),
(288, 'textil', 10, NULL, NULL, '', '1.00', 'kg', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` int(11) NOT NULL,
  `idIntegral` int(11) NOT NULL,
  `detalle` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` decimal(5,2) NOT NULL,
  `unidad` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `idIntegral`, `detalle`, `cantidad`, `unidad`, `updated_at`, `created_at`) VALUES
(1, 1, 'integral mortadela', '2.00', 'kg', 0, 0),
(2, 1, 'gluten', '2.00', 'kg', 0, 0),
(3, 1, 'fecula de trigo o mandioca', '10.00', 'kg', 0, 0),
(4, 1, 'carne', '50.00', 'kg', 0, 0),
(5, 2, 'integral milanesa', '1.00', 'kg', 0, 0),
(6, 2, 'agua', '6.00', 'lt', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integraldetalles`
--

CREATE TABLE `integraldetalles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `imagenBolsa` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `updated_at` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `integraldetalles`
--

INSERT INTO `integraldetalles` (`id`, `nombre`, `descripcion`, `imagenBolsa`, `updated_at`, `created_at`) VALUES
(1, 'integral mortadela', 'aditivo integral para la fabricacion de mortadela, contiene sal aditivos y especias', '', '', ''),
(2, 'integral milanesa', 'aditivo integral para la fabricacion de milanesas', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetaitems`
--

CREATE TABLE `recetaitems` (
  `id` int(11) NOT NULL,
  `idIntegral` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `detalle` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `updated_at` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `recetaitems`
--

INSERT INTO `recetaitems` (`id`, `idIntegral`, `orden`, `detalle`, `updated_at`, `created_at`) VALUES
(1, 2, 1, 'Batir por unos seguntos y dejar hidratar 10 minutos', '', ''),
(2, 2, 2, 'Empanar los medallones de carne por redozador o pan rallado', '', ''),
(3, 2, 3, 'rebozador: cuanto mas se pone mas dura sale la milanesa pero con menor humedad', '', ''),
(4, 2, 4, 'pan rallado: cuanto mas se pone mas tierna sale la miklanesa pero con mayor humedad', '', ''),
(5, 2, 5, 'mezclar 50% de pan y 50% de rebozador, luego regular según como se desee que quede', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrubros`
--

CREATE TABLE `subrubros` (
  `id` int(11) NOT NULL,
  `rubro` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `subrubro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `updated_at` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `subrubros`
--

INSERT INTO `subrubros` (`id`, `rubro`, `subrubro`, `updated_at`, `created_at`) VALUES
(1, 'alimentaria', 'especias', '', ''),
(2, 'alimentaria', 'harinas', '', ''),
(3, 'alimentaria', 'integrales', '', ''),
(4, 'alimentaria', 'tripas', '', ''),
(5, 'alimentaria', 'insumos', '', ''),
(6, 'textil', 'hilo p/papelera', '', ''),
(7, 'textil', 'hilo p/frigorifico', '', ''),
(8, 'textil', 'hilo p/agroindustria', '', ''),
(9, 'textil', 'hilo p/tejeduria', '', ''),
(10, 'textil', 'hilo fason', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos2`
--
ALTER TABLE `articulos2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `integraldetalles`
--
ALTER TABLE `integraldetalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recetaitems`
--
ALTER TABLE `recetaitems`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subrubros`
--
ALTER TABLE `subrubros`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos2`
--
ALTER TABLE `articulos2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `integraldetalles`
--
ALTER TABLE `integraldetalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recetaitems`
--
ALTER TABLE `recetaitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `subrubros`
--
ALTER TABLE `subrubros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

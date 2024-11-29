-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2024 at 02:35 PM
-- Server version: 8.0.39
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbsistemaventas`
--

-- --------------------------------------------------------

--
-- Table structure for table `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `caracteristicas`
--

INSERT INTO `caracteristicas` (`id`, `nombre`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'coca cola 350 ml', NULL, 1, '2024-11-22 14:06:13', '2024-11-22 14:06:13'),
(2, 'lata', NULL, 1, '2024-11-22 14:06:24', '2024-11-22 14:06:24'),
(3, 'Bebidas de fantasia', NULL, 1, '2024-11-22 14:06:43', '2024-11-22 14:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint UNSIGNED NOT NULL,
  `caracteristica_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `caracteristica_id`, `created_at`, `updated_at`) VALUES
(1, 3, '2024-11-22 14:06:43', '2024-11-22 14:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `categoria_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categoria_producto`
--

INSERT INTO `categoria_producto` (`id`, `producto_id`, `categoria_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-11-22 14:07:22', '2024-11-22 14:07:22'),
(2, 2, 1, '2024-11-22 14:18:26', '2024-11-22 14:18:26'),
(3, 3, 1, '2024-11-22 14:18:59', '2024-11-22 14:18:59'),
(4, 4, 1, '2024-11-22 14:19:29', '2024-11-22 14:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `persona_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `persona_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2024-11-22 14:08:14', '2024-11-22 14:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `compras`
--

CREATE TABLE `compras` (
  `id` bigint UNSIGNED NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(8,2) UNSIGNED NOT NULL,
  `numero_comprobante` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(8,2) UNSIGNED NOT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  `comprobante_id` bigint UNSIGNED DEFAULT NULL,
  `proveedore_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compras`
--

INSERT INTO `compras` (`id`, `fecha_hora`, `impuesto`, `numero_comprobante`, `total`, `estado`, `comprobante_id`, `proveedore_id`, `created_at`, `updated_at`) VALUES
(1, '2024-11-22 11:08:22', '950.00', '651684', '5950.00', 1, 1, 1, '2024-11-22 14:08:45', '2024-11-22 14:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `compra_producto`
--

CREATE TABLE `compra_producto` (
  `id` bigint UNSIGNED NOT NULL,
  `compra_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` int UNSIGNED NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compra_producto`
--

INSERT INTO `compra_producto` (`id`, `compra_id`, `producto_id`, `cantidad`, `precio_compra`, `precio_venta`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, '1000.00', '1300.00', '2024-11-22 14:08:45', '2024-11-22 14:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `comprobantes`
--

CREATE TABLE `comprobantes` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comprobantes`
--

INSERT INTO `comprobantes` (`id`, `tipo_comprobante`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Boleta', 1, NULL, NULL),
(2, 'Factura', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documentos`
--

CREATE TABLE `documentos` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo_documento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documentos`
--

INSERT INTO `documentos` (`id`, `tipo_documento`, `created_at`, `updated_at`) VALUES
(1, 'Pasaporte', NULL, NULL),
(2, 'RUT', NULL, NULL),
(3, 'Carnet Extranjería', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marcas`
--

CREATE TABLE `marcas` (
  `id` bigint UNSIGNED NOT NULL,
  `caracteristica_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marcas`
--

INSERT INTO `marcas` (`id`, `caracteristica_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-11-22 14:06:13', '2024-11-22 14:06:13');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_15_011515_create_documentos_table', 1),
(6, '2024_10_15_012149_create_personas_table', 1),
(7, '2024_10_15_015030_create_proveedores_table', 1),
(8, '2024_10_15_015806_create_clientes_table', 1),
(9, '2024_10_15_020010_create_comprobantes_table', 1),
(10, '2024_10_15_020257_create_compras_table', 1),
(11, '2024_10_15_022517_create_ventas_table', 1),
(12, '2024_10_15_023329_create_caracteristicas_table', 1),
(13, '2024_10_15_023555_create_categorias_table', 1),
(14, '2024_10_15_023818_create_marcas_table', 1),
(15, '2024_10_15_023953_create_presentaciones_table', 1),
(16, '2024_10_15_024112_create_productos_table', 1),
(17, '2024_10_15_025418_create_categoria_producto_table', 1),
(18, '2024_10_15_025748_create_compra_producto_table', 1),
(19, '2024_10_15_030137_create_producto_venta_table', 1),
(20, '2024_10_15_214216_update_colums_to_documentos_table', 1),
(21, '2024_10_15_214713_update_colums_to_personas_table', 1),
(22, '2024_10_15_224734_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ver-categoria', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(2, 'crear-categoria', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(3, 'editar-categoria', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(4, 'eliminar-categoria', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(5, 'ver-cliente', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(6, 'crear-cliente', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(7, 'editar-cliente', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(8, 'eliminar-cliente', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(9, 'ver-compra', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(10, 'crear-compra', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(11, 'mostrar-compra', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(12, 'eliminar-compra', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(13, 'ver-marca', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(14, 'crear-marca', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(15, 'editar-marca', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(16, 'eliminar-marca', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(17, 'ver-presentacione', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(18, 'crear-presentacione', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(19, 'editar-presentacione', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(20, 'eliminar-presentacione', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(21, 'ver-producto', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(22, 'crear-producto', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(23, 'editar-producto', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(24, 'eliminar-producto', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(25, 'ver-proveedore', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(26, 'crear-proveedore', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(27, 'editar-proveedore', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(28, 'eliminar-proveedore', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(29, 'ver-venta', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(30, 'crear-venta', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(31, 'mostrar-venta', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(32, 'eliminar-venta', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(33, 'ver-role', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(34, 'crear-role', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(35, 'editar-role', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(36, 'eliminar-role', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(37, 'ver-user', 'web', '2024-11-22 14:04:42', '2024-11-22 14:04:42'),
(38, 'crear-user', 'web', '2024-11-22 14:04:43', '2024-11-22 14:04:43'),
(39, 'editar-user', 'web', '2024-11-22 14:04:43', '2024-11-22 14:04:43'),
(40, 'eliminar-user', 'web', '2024-11-22 14:04:43', '2024-11-22 14:04:43'),
(41, 'ver-perfil', 'web', '2024-11-22 14:04:43', '2024-11-22 14:04:43'),
(42, 'editar-perfil', 'web', '2024-11-22 14:04:43', '2024-11-22 14:04:43');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE `personas` (
  `id` bigint UNSIGNED NOT NULL,
  `razon_social` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_persona` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  `documento_id` bigint UNSIGNED NOT NULL,
  `numero_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`id`, `razon_social`, `direccion`, `tipo_persona`, `estado`, `documento_id`, `numero_documento`, `created_at`, `updated_at`) VALUES
(1, 'Coca Cola SPA', 'av miraflores 650', 'juridica', 1, 2, '77855965-k', '2024-11-22 14:05:59', '2024-11-22 14:05:59'),
(2, 'Cliente defecto', 'av el cerro 780', 'natural', 1, 2, '1111111111', '2024-11-22 14:08:14', '2024-11-22 14:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `presentaciones`
--

CREATE TABLE `presentaciones` (
  `id` bigint UNSIGNED NOT NULL,
  `caracteristica_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presentaciones`
--

INSERT INTO `presentaciones` (`id`, `caracteristica_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2024-11-22 14:06:24', '2024-11-22 14:06:24');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int UNSIGNED NOT NULL DEFAULT '0',
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  `marca_id` bigint UNSIGNED NOT NULL,
  `presentacione_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `stock`, `descripcion`, `fecha_vencimiento`, `img_path`, `estado`, `marca_id`, `presentacione_id`, `created_at`, `updated_at`) VALUES
(1, '222222222222', 'Coca Cola 350 ml', 5, NULL, '2024-12-03', NULL, 1, 1, 1, '2024-11-22 14:07:22', '2024-11-22 14:25:09'),
(2, '3333333333', 'sprite 350cc', 0, NULL, '2024-11-28', NULL, 1, 1, 1, '2024-11-22 14:18:26', '2024-11-22 14:18:26'),
(3, '444444444444', 'fanta 350cc', 0, NULL, '2024-12-02', NULL, 1, 1, 1, '2024-11-22 14:18:59', '2024-11-22 14:25:44'),
(4, '55555555', 'billz', 0, NULL, '2024-11-25', NULL, 1, 1, 1, '2024-11-22 14:19:29', '2024-11-22 14:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `producto_venta`
--

CREATE TABLE `producto_venta` (
  `id` bigint UNSIGNED NOT NULL,
  `venta_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` int UNSIGNED NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `descuento` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `id` bigint UNSIGNED NOT NULL,
  `persona_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`id`, `persona_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-11-22 14:05:59', '2024-11-22 14:05:59');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrador', 'web', '2024-11-22 14:04:43', '2024-11-22 14:04:43');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Bastian Navarrete', 'admin@gmail.com', NULL, '$2y$10$KRhKK1EXIy31lUhWRgjLhOzFFINeJiKn9l3QyZb1WTEJ2iSJV2Uxe', NULL, '2024-11-22 14:04:43', '2024-11-22 14:04:43');

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint UNSIGNED NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(8,2) UNSIGNED NOT NULL,
  `numero_comprobante` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(8,2) UNSIGNED NOT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  `cliente_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `comprobante_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorias_caracteristica_id_unique` (`caracteristica_id`);

--
-- Indexes for table `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_producto_producto_id_foreign` (`producto_id`),
  ADD KEY `categoria_producto_categoria_id_foreign` (`categoria_id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientes_persona_id_unique` (`persona_id`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compras_comprobante_id_foreign` (`comprobante_id`),
  ADD KEY `compras_proveedore_id_foreign` (`proveedore_id`);

--
-- Indexes for table `compra_producto`
--
ALTER TABLE `compra_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_producto_compra_id_foreign` (`compra_id`),
  ADD KEY `compra_producto_producto_id_foreign` (`producto_id`);

--
-- Indexes for table `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marcas_caracteristica_id_unique` (`caracteristica_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personas_documento_id_foreign` (`documento_id`);

--
-- Indexes for table `presentaciones`
--
ALTER TABLE `presentaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `presentaciones_caracteristica_id_unique` (`caracteristica_id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_marca_id_foreign` (`marca_id`),
  ADD KEY `productos_presentacione_id_foreign` (`presentacione_id`);

--
-- Indexes for table `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_venta_venta_id_foreign` (`venta_id`),
  ADD KEY `producto_venta_producto_id_foreign` (`producto_id`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `proveedores_persona_id_unique` (`persona_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `ventas_user_id_foreign` (`user_id`),
  ADD KEY `ventas_comprobante_id_foreign` (`comprobante_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `compra_producto`
--
ALTER TABLE `compra_producto`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personas`
--
ALTER TABLE `personas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `presentaciones`
--
ALTER TABLE `presentaciones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `producto_venta`
--
ALTER TABLE `producto_venta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_caracteristica_id_foreign` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD CONSTRAINT `categoria_producto_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoria_producto_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_comprobante_id_foreign` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobantes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `compras_proveedore_id_foreign` FOREIGN KEY (`proveedore_id`) REFERENCES `proveedores` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `compra_producto`
--
ALTER TABLE `compra_producto`
  ADD CONSTRAINT `compra_producto_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compra_producto_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marcas`
--
ALTER TABLE `marcas`
  ADD CONSTRAINT `marcas_caracteristica_id_foreign` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_documento_id_foreign` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `presentaciones`
--
ALTER TABLE `presentaciones`
  ADD CONSTRAINT `presentaciones_caracteristica_id_foreign` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productos_presentacione_id_foreign` FOREIGN KEY (`presentacione_id`) REFERENCES `presentaciones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD CONSTRAINT `producto_venta_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `producto_venta_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_comprobante_id_foreign` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobantes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

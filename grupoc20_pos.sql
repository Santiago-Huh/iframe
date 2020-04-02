-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-04-2020 a las 19:45:08
-- Versión del servidor: 5.7.23-23
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
-- Base de datos: `grupoc20_pos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adjust_product_stock_types`
--

CREATE TABLE `adjust_product_stock_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `adjust_product_stock_types`
--

INSERT INTO `adjust_product_stock_types` (`id`, `title`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Producto dañado', 1, '2020-02-06 23:56:32', '2020-03-31 00:03:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taxable` tinyint(4) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `is_cash_register` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `branches`
--

INSERT INTO `branches` (`id`, `name`, `branch_type`, `taxable`, `is_default`, `tax_id`, `is_cash_register`, `user_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Abarrotes Gema', 'retail', 1, 1, 1, 1, 1, 1, '2020-02-06 23:56:32', '2020-02-07 05:24:01'),
(2, 'Abarrotes 2 hermanos', 'retail', 0, 1, 1, 1, 3, 3, '0000-00-00 00:00:00', '2020-02-14 00:12:10'),
(3, 'Bodega', 'retail', 0, 0, 0, 1, 3, 3, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `sales_invoice_id` int(11) NOT NULL,
  `receiving_invoice_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `multiple_access` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `title`, `branch_id`, `sales_invoice_id`, `receiving_invoice_id`, `created_by`, `multiple_access`, `created_at`, `updated_at`) VALUES
(1, 'Caja secundaria', 1, 2, 4, 1, 0, '2020-02-06 23:56:32', '2020-03-30 23:34:45'),
(2, 'Caja principal', 2, 2, 4, 1, 0, '2020-02-06 23:56:32', '2020-03-30 23:35:03'),
(3, 'Principal', 3, 2, 4, 1, 0, '2020-02-06 23:56:32', '2020-03-30 23:35:14'),
(4, 'Main Cash Register', 4, 2, 4, 1, 0, '2020-02-06 23:56:32', NULL),
(5, 'Principal', 2, 2, 4, 1, 0, '2020-02-07 05:25:12', '2020-03-31 00:06:51'),
(6, 'Caja principal', 1, 1, 3, 3, 0, '2020-02-13 22:59:14', '2020-02-13 22:59:14'),
(7, 'Principal bodega', 3, 2, 4, 3, 0, '2020-02-14 00:11:18', '2020-03-31 00:06:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cash_register_logs`
--

CREATE TABLE `cash_register_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cash_register_id` int(11) NOT NULL,
  `opening_amount` double DEFAULT NULL,
  `closing_amount` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `opening_time` datetime DEFAULT NULL,
  `closing_time` datetime DEFAULT NULL,
  `opened_by` int(11) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cash_register_logs`
--

INSERT INTO `cash_register_logs` (`id`, `user_id`, `cash_register_id`, `opening_amount`, `closing_amount`, `status`, `opening_time`, `closing_time`, `opened_by`, `closed_by`, `note`, `created_at`, `updated_at`) VALUES
(1, '1', 1, 500, 500, 'closed', '2020-02-06 23:44:00', '2020-02-08 17:36:00', 1, 1, NULL, '2020-02-07 04:44:15', '2020-02-08 23:36:24'),
(2, '1', 5, 5000, 0, 'closed', '2020-02-07 00:50:00', '2020-03-30 20:38:00', 1, 5, 'ds', '2020-02-07 05:50:59', '2020-03-31 01:38:07'),
(3, '1', 1, 500, 500, 'closed', '2020-02-08 21:29:00', '2020-02-08 20:34:00', 1, 2, NULL, '2020-02-09 02:29:05', '2020-02-09 02:34:35'),
(4, '2', 1, 500, 0, 'closed', '2020-02-08 20:34:00', '2020-03-30 19:07:00', 2, 1, 'asd', '2020-02-09 02:34:44', '2020-03-31 00:07:21'),
(5, '3', 2, 0, 0, 'closed', '2020-02-13 16:31:00', '2020-03-30 21:07:00', 3, 3, 'test', '2020-02-13 22:31:10', '2020-03-31 02:07:06'),
(6, '4', 6, 0, 0, 'closed', '2020-02-13 16:59:00', '2020-02-13 19:14:00', 4, 3, NULL, '2020-02-13 22:59:49', '2020-02-14 00:14:25'),
(7, '3', 6, 0, 0, 'closed', '2020-02-13 19:14:00', '2020-02-20 20:04:00', 3, 1, NULL, '2020-02-14 00:14:30', '2020-02-21 01:04:11'),
(8, '3', 3, 0, 0, 'closed', '2020-02-13 19:22:00', '2020-02-13 19:24:00', 3, 3, NULL, '2020-02-14 00:22:22', '2020-02-14 00:24:23'),
(9, '3', 3, 0, 0, 'closed', '2020-02-15 11:29:00', '2020-02-17 15:23:00', 3, 3, NULL, '2020-02-15 16:29:15', '2020-02-17 20:23:39'),
(10, '3', 3, 0, 0, 'closed', '2020-02-17 15:23:00', '2020-03-30 20:38:00', 3, 5, 's', '2020-02-17 20:23:45', '2020-03-31 01:38:25'),
(11, '1', 7, 0, 6500, 'closed', '2020-02-20 19:55:00', '2020-03-30 20:55:00', 1, 5, 'todo bien', '2020-02-21 00:55:09', '2020-03-31 01:55:54'),
(12, '1', 6, 0, 0, 'closed', '2020-02-20 20:04:00', '2020-03-20 23:16:00', 1, 3, NULL, '2020-02-21 01:04:15', '2020-03-21 04:16:22'),
(13, '3', 6, 0, 0, 'closed', '2020-03-20 23:16:00', '2020-03-30 20:22:00', 3, 5, NULL, '2020-03-21 04:16:46', '2020-03-31 01:22:44'),
(14, '1', 1, 0, NULL, 'open', '2020-03-30 19:07:00', NULL, 1, NULL, NULL, '2020-03-31 00:07:46', '2020-03-31 00:07:46'),
(15, '5', 6, 0, NULL, 'open', '2020-03-30 20:22:00', NULL, 5, NULL, NULL, '2020-03-31 01:22:48', '2020-03-31 01:22:48'),
(16, '5', 5, 0, NULL, 'open', '2020-03-30 20:38:00', NULL, 5, NULL, NULL, '2020-03-31 01:38:11', '2020-03-31 01:38:11'),
(17, '5', 3, 0, NULL, 'open', '2020-03-30 20:38:00', NULL, 5, NULL, NULL, '2020-03-31 01:38:30', '2020-03-31 01:38:30'),
(18, '3', 2, 0, NULL, 'open', '2020-03-30 21:07:00', NULL, 3, NULL, NULL, '2020-03-31 02:07:13', '2020-03-31 02:07:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corn_job_logs`
--

CREATE TABLE `corn_job_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `customer_group` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_default` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_type`, `template_subject`, `default_content`, `custom_content`, `created_at`, `updated_at`) VALUES
(1, 'user_invitation', 'You are invited', '<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi,<br>\n                {invited_by} invited you to join with the team on {app_name}.<br>\n                Please click the link below to accept the invitation!<br>\n                {verification_link}        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(2, 'account_verification', 'Account verification', '<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {first_name},<br>\n                        Your account has been created.<br>\n                        Please click the link below to verify your email.<br>\n                        {verification_link}        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(3, 'reset_password', 'Reset password', '<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi,<br>\n                        You have requested to change your password.<br>\n                        Please click the link below to change your password!<br>\n                        {reset_password_link}        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(4, 'pos_invoice', 'Invoice', '<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {first_name},<br>\n                        Thanks for shopping with us.<br>\n                        Please find the attachment for your purchase ({invoice_id}) details.        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(5, 'low_stock', 'Low Stock Template', '<div style=\"text-align: center; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                            <p>{app_logo}</p>\n                            <h1 style=\"font-weight: lighter; margin-bottom: 0;\">{app_name}</h1>\n                            <br>\n                            <small>Low Stock Notification</small>\n                            <br>\n                            <h3 style=\"text-align:center;\">Out Of Stock List</h3>\n                        </div>\n                        <!--header bottom start-->\n                        <div style=\"margin-bottom:-30px; height:170px; width: 100%; overflow: hidden; display: block; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                                <div style=\"float:left; width: 50%;\">\n                                    <p style=\"font-weight:bold;\">Branch Name: <span>{branch_name}</span></p>\n                                    <p style=\"font-weight:bold;\">Branch Manager: <span>{branch_manager}</span></p>\n                                </div>\n                                <div style=\"float:right; width: 45%;\">\n                                    <p style=\"font-weight:bold; text-align: right;\">Date : <span>{date}</span></p>\n                                    <p style=\"font-weight:bold; text-align: right;\">Time : <span>{time}</span></p>\n                                </div>\n                        </div>\n                        <table style=\"border-top: 1px solid #bfbfbf; border-bottom: 1px solid #bfbfbf; border-collapse: collapse; font-weight:500; width: 100%; max-width: 100%; margin-bottom: 0; background-color: transparent; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                            <tr>\n                                <th style=\"text-align: left; padding: 7px 0; border-bottom: 1px solid #bfbfbf; width: 40%;\">Item</th>\n                                <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Re Order</th>\n                                <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Qty</th>\n                            </tr><br><td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{item_details}</td></table>', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invites`
--

CREATE TABLE `invites` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invited_as` int(11) NOT NULL,
  `invited_branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `invited_by` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `invites`
--

INSERT INTO `invites` (`id`, `email`, `invited_as`, `invited_branch`, `is_accepted`, `invited_by`, `token`, `created_at`, `updated_at`) VALUES
(1, 'felipe@mail.com', 2, '1,2', 0, 0, 'hZo7LTsQlALQIoBE', '2020-02-08 16:02:45', '2020-02-08 16:02:45'),
(2, 'jafet_linkinpark@hotmail.com', 2, '1,2', 0, 0, 'vHFJjVrW3CeKXFun', '2020-02-08 16:03:02', '2020-02-08 16:03:02'),
(3, 'jk@mail.com', 2, '1', 0, 0, 'nhwSffCkP5VzeLgJ', '2020-02-08 16:04:11', '2020-02-08 16:04:11'),
(4, 'felipe@mail.com', 2, '1,2', 0, 0, 'TAnbBiGkN0Ngas2U', '2020-02-08 16:15:53', '2020-02-08 16:15:53'),
(5, 'felipe.cordova.garcia@gmail.com', 2, '1,2', 1, 0, '', '2020-02-08 16:20:26', '2020-02-08 16:38:58'),
(6, 'jafet117@icloud.com', 1, '1,2', 0, 0, 'SpHhldxbi6JZUxph', '2020-02-08 16:28:33', '2020-02-08 16:28:33'),
(7, 'oscar_pineds@live.com', 3, '1,2', 0, 0, 'EcT4NGcQmkvq5s34', '2020-02-08 18:29:52', '2020-02-08 18:29:52'),
(8, 'oscar_pineda@live.com', 3, '1,2', 1, 0, '', '2020-02-08 20:59:47', '2020-02-08 22:27:46'),
(9, 'jafet117@icloud.com', 5, '1', 1, 0, '', '2020-02-11 08:26:42', '2020-02-11 08:31:04'),
(10, 'jafetpg117@outlook.com', 3, '1,2,3', 1, 0, '', '2020-03-31 00:10:18', '2020-03-31 00:11:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_templates`
--

CREATE TABLE `invoice_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `template_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default_template` tinyint(4) NOT NULL,
  `default_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `invoice_templates`
--

INSERT INTO `invoice_templates` (`id`, `template_title`, `template_type`, `is_default_template`, `default_content`, `custom_content`, `created_at`, `updated_at`) VALUES
(1, 'Small Sales Invoice', 'sales', 1, '<section style=\"margin: 0 auto; max-width: 500px; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n            <!--header top start-->\n            <div style=\"text-align: center; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                <p>{app_logo}</p>\n                <h1 style=\"font-weight: lighter; margin-bottom: 0;\">{app_name}</h1>\n                <br>\n                <small>Sales Receipt</small>\n                <br>\n                <h3 style=\"text-align:center;\">INVOICE</h3>\n            </div>\n            <!--header top end-->\n\n            <!--header bottom start-->\n            <div style=\"margin-bottom:-30px; height:245px; width: 100%; overflow: hidden; display: block; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                 <div style=\"float:left; width: 50%;\">\n                     <p style=\"font-weight:bold;\">Invoice ID: <span>{invoice_id}</span></p>\n                     <p style=\"font-weight:bold;\">Sold To: <span>{customer_name}</span></p>\n                     <p style=\"font-weight:bold;\">Sold By: <span>{employee_name}</span></p>\n                     <p style=\"font-weight:bold;\">Phone: <span>{phone_number}</span></p>\n                     <p style=\"font-weight:bold;\">Address: <span>{address}</span></p>\n                 </div>\n                 <div style=\"float:right; width: 45%;\">\n                     <p style=\"font-weight:bold; text-align: right;\">Date : <span>{date}</span></p>\n                     <p style=\"font-weight:bold; text-align: right;\">Time : <span>{time}</span></p>\n                 </div>\n            </div>\n                <table style=\"border-top: 1px solid #bfbfbf; border-bottom: 1px solid #bfbfbf; border-collapse: collapse; width: 100%; max-width: 100%; margin-bottom: 0; background-color: transparent; font-family: DejaVu Sans,\'Raleway\', sans-serif;\">\n                    <tr>\n                        <th style=\"text-align: left; padding: 7px 0; border-bottom: 1px solid #bfbfbf; width: 40%;\">Items</th>\n                        <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Qty</th>\n                        <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Price</th>\n                        <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Discount</th>\n                        <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Total</th>\n                    </tr><br>\n                <tr>\n                   <td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{item_details}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Sub Total</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{sub_total}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Tax</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{tax}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Discount</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{discount}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left;\">Total</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{total}</td>\n                </tr>\n                <tr>\n                   <td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{payment_details}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Exchange</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{exchange}</td>\n                </tr></table>\n            </div>\n       </section>', '<section style=\"margin: 0 auto; max-width: 500px; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n            <!--header top start-->\n            <div style=\"text-align: center; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                <p>{app_logo}</p>\n                <h1 style=\"font-weight: lighter; margin-bottom: 0;\">{app_name}</h1>\n                <br><span style=\"font-size: 12.8px;\">Recibo de venta</span><br>\n                <h3 style=\"text-align:center;\">Ticket</h3>\n            </div>\n            <!--header top end-->\n\n            <!--header bottom start-->\n            <div style=\"margin-bottom:-30px; height:245px; width: 100%; overflow: hidden; display: block; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                 <div style=\"float:left; width: 50%;\">\n                     <p style=\"font-weight:bold;\">N de ticket: <span>{invoice_id}</span></p>\n                     <p style=\"font-weight:bold;\">Atendio: <span>{employee_name}</span></p>\n                     <p style=\"font-weight:bold;\"><br></p>\n                 </div>\n                 <div style=\"float:right; width: 45%;\">\n                     <p style=\"font-weight:bold; text-align: right;\">Fecha:&nbsp;<span>{date}</span></p>\n                     <p style=\"font-weight:bold; text-align: right;\">Hora:&nbsp;<span>{time}</span></p>\n                 </div>\n            </div>\n                <br><table style=\"border-top: 1px solid #bfbfbf; border-bottom: 1px solid #bfbfbf; border-collapse: collapse; width: 100%; max-width: 100%; margin-bottom: 0; background-color: transparent; font-family: DejaVu Sans,\'Raleway\', sans-serif;\">\n                    <tbody><tr>\n                        <th style=\"text-align: left; padding: 7px 0; border-bottom: 1px solid #bfbfbf; width: 40%;\">Productos</th>\n                        <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Cant</th>\n                        <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Precio</th>\n                        <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Desc</th>\n                        <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Total</th>\n                    </tr>\n                <tr>\n                   <td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{item_details}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Sub Total</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{sub_total}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">IVA</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{tax}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Desc</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{discount}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left;\">Total</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{total}</td>\n                </tr>\n                <tr>\n                   <td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{payment_details}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Cambio</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{exchange}</td>\n                </tr></tbody></table>\n            \n       </section>', NULL, '2020-02-14 00:03:01'),
(2, 'Large Sales Invoice', 'sales', 0, '<div style=\"text-align: center; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                        <p>{app_logo}</p>\n                        <h1 style=\"font-weight: lighter; margin-bottom: 0;\">{app_name}</h1>\n                        <br>\n                        <small>Sales Receipt</small>\n                        <br>\n                        <h3 style=\"text-align:center;\">INVOICE</h3>\n                    </div>\n                    <!--header bottom start-->\n                    <div style=\"margin-bottom:-30px; height:245px; width: 100%; overflow: hidden; display: block; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                         <div style=\"float:left; width: 50%;\">\n                             <p style=\"font-weight:bold;\">Invoice ID: <span>{invoice_id}</span></p>\n                             <p style=\"font-weight:bold;\">Sold To: <span>{customer_name}</span></p>\n                             <p style=\"font-weight:bold;\">Sold By: <span>{employee_name}</span></p>\n                             <p style=\"font-weight:bold;\">Phone: <span>{phone_number}</span></p>\n                             <p style=\"font-weight:bold;\">Address: <span>{address}</span></p>\n                         </div>\n                         <div style=\"float:right; width: 45%;\">\n                             <p style=\"font-weight:bold; text-align: right;\">Date : <span>{date}</span></p>\n                             <p style=\"font-weight:bold; text-align: right;\">Time : <span>{time}</span></p>\n                         </div>\n                    </div>\n                    <table style=\"border-top: 1px solid #bfbfbf; border-bottom: 1px solid #bfbfbf; border-collapse: collapse; font-weight:500; width: 100%; max-width: 100%; margin-bottom: 0; background-color: transparent; font-family: DejaVu Sans,\'Raleway\', sans-serif;\">\n                        <tr>\n                            <th style=\"text-align: left; padding: 7px 0; border-bottom: 1px solid #bfbfbf; width: 40%;\">Items</th>\n                            <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Qty</th>\n                            <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Price</th>\n                            <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Discount</th>\n                            <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Total</th>\n                        </tr><br>\n                <tr>\n                   <td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{item_details}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Sub Total</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{sub_total}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Tax</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{tax}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Discount</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{discount}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left;\">Total</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{total}</td>\n                </tr>\n                <tr>\n                   <td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{payment_details}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Exchange</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{exchange}</td>\n                </tr></table>', '', NULL, '2020-02-14 00:03:01'),
(3, 'Small Purchase Invoice', 'receiving', 0, '<section style=\"margin: 0 auto; max-width: 500px;\">\n        <!--header top start-->\n       <div style=\"text-align: center; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n            <p>{app_logo}</p>\n            <h1 style=\"font-weight: lighter; margin-bottom: 0;\">{app_name}</h1>\n            <br>\n            <small>Purchase Receipt</small>\n            <br>\n            <h3 style=\"text-align:center;\">INVOICE</h3>\n       </div>\n       <!--header top end-->\n\n        <!--header bottom start-->\n        <div style=\"margin-bottom:-30px; height:170px; width: 100%; overflow: hidden; display: block; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n             <div style=\"float:left; width: 50%;\">\n                 <p style=\"font-weight:bold;\">Invoice ID: <span>{invoice_id}</span></p>\n                 <p style=\"font-weight:bold;\">Purchased From: <span>{supplier_name}</span></p>\n                 <p style=\"font-weight:bold;\">Purchased By: <span>{employee_name}</span></p>\n             </div>\n             <div style=\"float:right; width: 45%;\">\n                 <p style=\"font-weight:bold; text-align: right;\">Date : <span>{date}</span></p>\n                 <p style=\"font-weight:bold; text-align: right;\">Time : <span>{time}</span></p>\n             </div>\n        </div>\n        <table style=\"border-top: 1px solid #bfbfbf; border-bottom: 1px solid #bfbfbf; border-collapse: collapse; font-weight:500; width: 100%; max-width: 100%; margin-bottom: 0; background-color: transparent; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n           <tr>\n               <th style=\"text-align: left; padding: 7px 0; border-bottom: 1px solid #bfbfbf; width: 40%;\">Items</th>\n               <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Qty</th>\n               <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Price</th>\n               <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Discount</th>\n               <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Total</th>\n           </tr><br>\n                <tr>\n                   <td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{item_details}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Sub Total</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{sub_total}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Tax</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{tax}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Discount</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{discount}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left;\">Total</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{total}</td>\n                </tr>\n                <tr>\n                   <td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{payment_details}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Exchange</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{exchange}</td>\n                </tr></table>\n       </div>\n   </section>', '', NULL, NULL),
(4, 'Large Purchase Invoice', 'receiving', 1, '<div style=\"text-align: center; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                               <p>{app_logo}</p>\n                               <h1 style=\"font-weight: lighter; margin-bottom: 0;\">{app_name}</h1>\n                               <br>\n                               <small>Purchased Receipt</small>\n                               <br>\n                               <h3 style=\"text-align:center;\">INVOICE</h3>\n                           </div>\n                           <!--header bottom start-->\n                            <div style=\"margin-bottom:-30px; height:170px; width: 100%; overflow: hidden; display: block; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                                 <div style=\"float:left; width: 50%;\">\n                                     <p style=\"font-weight:bold;\">Invoice ID: <span>{invoice_id}</span></p>\n                                     <p style=\"font-weight:bold;\">Purchased From: <span>{supplier_name}</span></p>\n                                     <p style=\"font-weight:bold;\">Purchased By: <span>{employee_name}</span></p>\n                                 </div>\n                                 <div style=\"float:right; width: 45%;\">\n                                     <p style=\"font-weight:bold; text-align: right;\">Date : <span>{date}</span></p>\n                                     <p style=\"font-weight:bold; text-align: right;\">Time : <span>{time}</span></p>\n                                 </div>\n                            </div>\n                           <table style=\"border-top: 1px solid #bfbfbf; border-bottom: 1px solid #bfbfbf; border-collapse: collapse; font-weight:500; width: 100%; max-width: 100%; margin-bottom: 0; background-color: transparent; font-family: DejaVu Sans, \'Raleway\', sans-serif;\">\n                               <tr>\n                                   <th style=\"text-align: left; padding: 7px 0; border-bottom: 1px solid #bfbfbf; width: 40%;\">Items</th>\n                                   <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Qty</th>\n                                   <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Price</th>\n                                   <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Discount</th>\n                                   <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Total</th>\n                               </tr><br>\n                 <tr>\n                   <td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{item_details}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Sub Total</th>\n                   <th style=\"padding: 7px 0;\"></th>\n                   <th style=\"padding: 7px 0;\"></th>\n                   <th style=\"padding: 7px 0;\"></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{sub_total}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Tax</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{tax}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Discount</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{discount}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left;\">Total</th>\n                   <th></th>\n                   <th></th>\n                   <th></th>\n                   <td style=\"text-align: right;\">{total}</td>\n                </tr>\n                <tr>\n                   <td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{payment_details}</td>\n                </tr>\n                <tr>\n                   <th style=\"text-align: left; padding: 7px 0;\">Exchange</th>\n                   <th style=\"padding: 7px 0;\"></th>\n                   <th style=\"padding: 7px 0;\"></th>\n                   <th style=\"padding: 7px 0;\"></th>\n                   <td style=\"text-align: right; padding: 7px 0;\">{exchange}</td>\n                </tr></table>', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2014_10_12_000000_create_users_table', 2),
(7, '2014_10_12_100000_create_password_resets_table', 2),
(8, '2018_03_04_124154_create_settings_table', 2),
(9, '2018_03_05_134724_create_roles_table', 2),
(10, '2018_03_06_125804_create_email_templates_table', 2),
(11, '2018_03_11_081629_create_invites_table', 2),
(12, '2018_04_04_122419_create_notifications_table', 2),
(13, '2018_04_23_093600_create_product_categories_table', 2),
(14, '2018_04_23_094449_create_payment_types_table', 2),
(15, '2018_04_23_133454_create_customer_groups_table', 2),
(16, '2018_04_24_065209_create_product_brands_table', 2),
(17, '2018_04_24_074704_create_product_groups_table', 2),
(18, '2018_04_24_114457_create_products_table', 2),
(19, '2018_04_24_120528_create_product_variants_table', 2),
(20, '2018_04_24_123129_create_product_attributes_table', 2),
(21, '2018_04_25_063137_create_taxes_table', 2),
(22, '2018_04_25_113030_create_branches_table', 2),
(23, '2018_05_06_093016_create_product_attribute_values_table', 2),
(24, '2018_09_24_121807_create_orders_table', 2),
(25, '2018_09_24_122120_create_order_items_table', 2),
(26, '2018_09_24_122145_create_payments_table', 2),
(27, '2018_09_25_102442_create_cash_registers_table', 2),
(28, '2018_10_18_080804_create_cash_register_logs_table', 2),
(29, '2018_12_26_065902_create_product_units_table', 2),
(30, '2019_04_15_074946_create_customers_table', 2),
(31, '2019_04_15_080443_create_suppliers_table', 2),
(32, '2019_05_29_073208_create_shortcut_keys_table', 2),
(33, '2019_08_26_071749_invoice_template_table', 2),
(34, '2019_10_03_110011_create_restaurant_tables_table', 2),
(35, '2019_11_21_100102_create_adjust_product_stock_types_table', 2),
(36, '2019_11_26_072652_create_todo_lists_table', 2),
(37, '2019_12_26_082431_create_corn_job_logs_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `booking_id` int(11) NOT NULL,
  `booking_by` int(11) NOT NULL,
  `notify_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `read_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `order_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_total` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `due_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `total` double(8,2) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profit` double(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `all_discount` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `transfer_branch_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `date`, `order_type`, `sub_total`, `total_tax`, `due_amount`, `total`, `type`, `profit`, `status`, `all_discount`, `customer_id`, `supplier_id`, `branch_id`, `transfer_branch_id`, `table_id`, `created_by`, `invoice_id`, `created_at`, `updated_at`) VALUES
(1, '2020-02-07', 'receiving', '80', '0', 0.00, 80.00, 'supplier', 0.00, 'done', 0, NULL, NULL, 1, NULL, NULL, 1, '1', '2020-02-07 00:28:00', '2020-02-07 05:28:52'),
(2, '2020-02-07', 'receiving', '50', '0', 0.00, 50.00, 'supplier', 0.00, 'done', 0, NULL, NULL, 1, NULL, NULL, 1, '2', '2020-02-07 00:29:00', '2020-02-07 05:29:04'),
(3, '2020-02-07', 'sales', '0', '0', 0.00, 0.00, 'internal', -31.00, 'done', 100, NULL, NULL, 1, 2, NULL, 1, '3', '2020-02-07 00:38:00', '2020-02-07 05:38:02'),
(4, '2020-02-07', 'sales', '100', '0', 0.00, 100.00, 'customer', 12.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 1, '4', '2020-02-07 00:51:00', '2020-02-07 05:51:37'),
(5, '2020-02-07', 'receiving', '25', '0', 0.00, 25.00, 'internal', 0.00, 'done', 0, NULL, NULL, 2, 1, NULL, 1, '5', '2020-02-07 00:53:00', '2020-02-07 05:53:22'),
(6, '2020-02-07', 'sales', '20', '0', 0.00, 20.00, 'customer', 10.00, 'done', 0, NULL, NULL, 1, NULL, NULL, 1, '6', '2020-02-07 01:13:00', '2020-02-07 06:13:31'),
(7, '2020-02-08', 'sales', '48', '0', 0.00, 48.00, 'customer', 16.00, 'done', 0, NULL, NULL, 1, NULL, NULL, 1, '7', '2020-02-07 20:58:00', '2020-02-08 01:58:49'),
(8, '2020-02-09', 'sales', '12', '0', 0.00, 12.00, 'customer', -16.00, 'done', 100, NULL, NULL, 1, NULL, NULL, 1, '8', '2020-02-08 21:29:00', '2020-02-09 02:31:45'),
(9, '2020-02-09', 'sales', '30', '0', 0.00, 30.00, 'customer', 15.00, 'done', 0, NULL, NULL, 1, NULL, NULL, 1, '9', '2020-02-08 21:32:00', '2020-02-09 02:32:31'),
(10, '2020-02-09', 'sales', '34', '0', 0.00, 34.00, 'customer', -87.00, 'done', 0, NULL, NULL, 1, NULL, NULL, 2, '10', '2020-02-08 20:35:00', '2020-02-09 02:36:51'),
(11, '2020-02-09', 'sales', '0', '0', 0.00, -34.00, 'customer', 0.00, 'done', 0, NULL, NULL, 1, NULL, NULL, 2, '11', '2020-02-08 20:40:00', '2020-02-09 02:40:43'),
(12, '2020-02-13', 'receiving', '24', '0', 0.00, 24.00, 'supplier', 0.00, 'pending', 0, NULL, NULL, 1, NULL, NULL, 2, '12', '2020-02-12 23:22:00', '2020-02-13 05:23:09'),
(13, '2020-02-13', 'receiving', '100', '0', 0.00, 100.00, 'supplier', 0.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 3, '13', '2020-02-13 16:33:00', '2020-02-13 22:33:11'),
(14, '2020-02-13', 'sales', '30', '0', 0.00, 30.00, 'customer', 10.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 3, '14', '2020-02-13 16:34:00', '2020-02-13 22:34:25'),
(15, '2020-02-13', 'receiving', '500', '0', 0.00, 500.00, 'supplier', 0.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 3, '15', '2020-02-13 16:52:00', '2020-02-13 22:52:28'),
(16, '2020-02-13', 'receiving', '80', '0', 0.00, 80.00, 'supplier', 0.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 3, '16', '2020-02-13 17:09:00', '2020-02-13 23:09:08'),
(17, '2020-02-13', 'sales', '20', '0', 0.00, 20.00, 'customer', 2748.00, 'cancelled', 0, NULL, NULL, 2, NULL, NULL, 3, '17', '2020-02-13 17:09:00', '2020-02-13 23:20:18'),
(18, '2020-02-13', 'receiving', '400', '0', 0.00, 400.00, 'supplier', 0.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 3, '18', '2020-02-13 17:19:00', '2020-02-13 23:19:11'),
(19, '2020-02-13', 'sales', '235', '0', 0.00, 235.00, 'customer', 65.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 3, '19-2-3', '2020-02-13 17:30:00', '2020-02-13 23:31:09'),
(20, '2020-02-13', 'sales', '0.32', '0', 0.00, 0.32, 'customer', 0.12, 'done', 0, NULL, NULL, 2, NULL, NULL, 3, '20-2-3', '2020-02-13 17:30:00', '2020-02-13 23:31:09'),
(21, '2020-02-13', 'receiving', '30', '0', 0.00, 30.00, 'supplier', 10.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 3, '20', '2020-02-13 18:50:00', '2020-02-13 23:50:33'),
(22, '2020-02-14', 'sales', '110', '0', 0.00, 110.00, 'customer', 30.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 1, '21', '2020-02-13 19:03:00', '2020-02-14 00:03:18'),
(23, '2020-02-15', 'adjustment', '133.76999999999998', '0', 0.00, 133.77, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '22', '2020-02-15 16:53:02', '2020-02-15 16:53:02'),
(24, '2020-02-15', 'adjustment', '360', '0', 0.00, 360.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '23', '2020-02-15 16:55:25', '2020-02-15 16:55:25'),
(25, '2020-02-15', 'adjustment', '93', '0', 0.00, 93.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '24', '2020-02-15 16:58:27', '2020-02-15 16:58:27'),
(26, '2020-02-15', 'adjustment', '96', '0', 0.00, 96.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '25', '2020-02-15 16:58:50', '2020-02-15 16:58:50'),
(27, '2020-02-15', 'adjustment', '122.99999999999999', '0', 0.00, 123.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '26', '2020-02-15 17:02:05', '2020-02-15 17:02:05'),
(28, '2020-02-15', 'adjustment', '131', '0', 0.00, 131.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '27', '2020-02-15 17:07:17', '2020-02-15 17:07:17'),
(29, '2020-02-15', 'adjustment', '129', '0', 0.00, 129.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '28', '2020-02-15 17:27:13', '2020-02-15 17:27:13'),
(30, '2020-02-15', 'adjustment', '78', '0', 0.00, 78.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '29', '2020-02-15 17:28:57', '2020-02-15 17:28:57'),
(31, '2020-02-15', 'adjustment', '90', '0', 0.00, 90.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '30', '2020-02-15 17:30:20', '2020-02-15 17:30:20'),
(32, '2020-02-15', 'adjustment', '67.19999999999999', '0', 0.00, 67.20, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '31', '2020-02-15 17:31:45', '2020-02-15 17:31:45'),
(33, '2020-02-15', 'adjustment', '223.79999999999998', '0', 0.00, 223.80, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '32', '2020-02-15 18:04:25', '2020-02-15 18:04:25'),
(34, '2020-02-15', 'adjustment', '204.66', '0', 0.00, 204.66, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '33', '2020-02-15 18:06:22', '2020-02-15 18:06:22'),
(35, '2020-02-15', 'adjustment', '149.1', '0', 0.00, 149.10, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '34', '2020-02-15 18:08:21', '2020-02-15 18:08:21'),
(36, '2020-02-15', 'adjustment', '122.5', '0', 0.00, 122.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '35', '2020-02-15 18:10:23', '2020-02-15 18:10:23'),
(37, '2020-02-15', 'adjustment', '93', '0', 0.00, 93.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '36', '2020-02-15 18:13:35', '2020-02-15 18:13:35'),
(38, '2020-02-15', 'adjustment', '175', '0', 0.00, 175.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '37', '2020-02-15 18:15:50', '2020-02-15 18:15:50'),
(39, '2020-02-15', 'adjustment', '103.5', '0', 0.00, 103.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '38', '2020-02-15 18:24:54', '2020-02-15 18:24:54'),
(40, '2020-02-15', 'adjustment', '82.74', '0', 0.00, 82.74, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '39', '2020-02-15 18:27:14', '2020-02-15 18:27:14'),
(41, '2020-02-15', 'adjustment', '50.31', '0', 0.00, 50.31, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '40', '2020-02-15 18:29:17', '2020-02-15 18:29:17'),
(42, '2020-02-15', 'adjustment', '134.4', '0', 0.00, 134.40, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '41', '2020-02-15 18:30:46', '2020-02-15 18:30:46'),
(43, '2020-02-15', 'adjustment', '16.27', '0', 0.00, 16.27, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '42', '2020-02-15 18:33:15', '2020-02-15 18:33:15'),
(44, '2020-02-15', 'adjustment', '432', '0', 0.00, 432.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '43', '2020-02-15 18:47:48', '2020-02-15 18:47:48'),
(45, '2020-02-15', 'adjustment', '243.12', '0', 0.00, 243.12, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '44', '2020-02-15 18:51:09', '2020-02-15 18:51:09'),
(46, '2020-02-15', 'adjustment', '182.16', '0', 0.00, 182.16, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '45', '2020-02-15 18:53:54', '2020-02-15 18:53:54'),
(47, '2020-02-15', 'adjustment', '57.1', '0', 0.00, 57.10, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '46', '2020-02-15 18:57:53', '2020-02-15 18:57:53'),
(48, '2020-02-15', 'adjustment', '28.83', '0', 0.00, 28.83, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '47', '2020-02-15 18:59:21', '2020-02-15 18:59:21'),
(49, '2020-02-15', 'adjustment', '227.52', '0', 0.00, 227.52, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '48', '2020-02-15 19:01:12', '2020-02-15 19:01:12'),
(50, '2020-02-15', 'adjustment', '233.92', '0', 0.00, 233.92, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '49', '2020-02-15 19:03:09', '2020-02-15 19:03:09'),
(51, '2020-02-15', 'adjustment', '258', '0', 0.00, 258.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '50', '2020-02-15 19:05:28', '2020-02-15 19:05:28'),
(52, '2020-02-15', 'adjustment', '191.88', '0', 0.00, 191.88, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '51', '2020-02-15 19:07:47', '2020-02-15 19:07:47'),
(53, '2020-02-15', 'adjustment', '32.64', '0', 0.00, 32.64, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '52', '2020-02-15 19:09:54', '2020-02-15 19:09:54'),
(54, '2020-02-15', 'adjustment', '85.44', '0', 0.00, 85.44, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '53', '2020-02-15 19:12:23', '2020-02-15 19:12:23'),
(55, '2020-02-15', 'adjustment', '25', '0', 0.00, 25.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '54', '2020-02-15 19:13:41', '2020-02-15 19:13:41'),
(56, '2020-02-15', 'adjustment', '36.92', '0', 0.00, 36.92, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '55', '2020-02-15 19:14:46', '2020-02-15 19:14:46'),
(57, '2020-02-15', 'adjustment', '173.52', '0', 0.00, 173.52, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '56', '2020-02-15 19:16:51', '2020-02-15 19:16:51'),
(58, '2020-02-15', 'adjustment', '183', '0', 0.00, 183.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '57', '2020-02-15 19:19:30', '2020-02-15 19:19:30'),
(59, '2020-02-15', 'adjustment', '87.08', '0', 0.00, 87.08, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '58', '2020-02-15 19:20:36', '2020-02-15 19:20:36'),
(60, '2020-02-15', 'adjustment', '150', '0', 0.00, 150.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '59', '2020-02-15 19:23:12', '2020-02-15 19:23:12'),
(61, '2020-02-15', 'adjustment', '61.800000000000004', '0', 0.00, 61.80, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '60', '2020-02-15 19:24:56', '2020-02-15 19:24:56'),
(62, '2020-02-15', 'adjustment', '99.24', '0', 0.00, 99.24, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '61', '2020-02-15 19:27:14', '2020-02-15 19:27:14'),
(63, '2020-02-15', 'adjustment', '101.42999999999999', '0', 0.00, 101.43, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '62', '2020-02-15 19:28:24', '2020-02-15 19:28:24'),
(64, '2020-02-15', 'adjustment', '11.27', '0', 0.00, 11.27, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '63', '2020-02-15 19:30:51', '2020-02-15 19:30:51'),
(65, '2020-02-15', 'adjustment', '114.6', '0', 0.00, 114.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '64', '2020-02-15 19:33:27', '2020-02-15 19:33:27'),
(66, '2020-02-15', 'adjustment', '25', '0', 0.00, 25.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '65', '2020-02-15 19:35:19', '2020-02-15 19:35:19'),
(67, '2020-02-15', 'adjustment', '56', '0', 0.00, 56.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '66', '2020-02-15 19:36:23', '2020-02-15 19:36:23'),
(68, '2020-02-15', 'adjustment', '158.72', '0', 0.00, 158.72, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '67', '2020-02-15 19:39:04', '2020-02-15 19:39:04'),
(69, '2020-02-15', 'adjustment', '68.25', '0', 0.00, 68.25, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '68', '2020-02-15 19:42:29', '2020-02-15 19:42:29'),
(70, '2020-02-15', 'adjustment', '120.96000000000001', '0', 0.00, 120.96, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '69', '2020-02-15 19:46:57', '2020-02-15 19:46:57'),
(71, '2020-02-15', 'adjustment', '13.440000000000001', '0', 0.00, 13.44, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '70', '2020-02-15 19:48:22', '2020-02-15 19:48:22'),
(72, '2020-02-15', 'adjustment', '31.57', '0', 0.00, 31.57, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '71', '2020-02-15 19:49:40', '2020-02-15 19:49:40'),
(73, '2020-02-15', 'adjustment', '41.04', '0', 0.00, 41.04, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '72', '2020-02-15 19:52:37', '2020-02-15 19:52:37'),
(74, '2020-02-15', 'adjustment', '78.21', '0', 0.00, 78.21, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '73', '2020-02-15 19:53:47', '2020-02-15 19:53:47'),
(75, '2020-02-15', 'adjustment', '8.64', '0', 0.00, 8.64, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '74', '2020-02-15 19:54:51', '2020-02-15 19:54:51'),
(76, '2020-02-15', 'adjustment', '361.62', '0', 0.00, 361.62, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '75', '2020-02-15 19:58:27', '2020-02-15 19:58:27'),
(77, '2020-02-15', 'adjustment', '65.7', '0', 0.00, 65.70, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '76', '2020-02-15 19:59:35', '2020-02-15 19:59:35'),
(78, '2020-02-15', 'adjustment', '54', '0', 0.00, 54.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '77', '2020-02-15 20:08:38', '2020-02-15 20:08:38'),
(79, '2020-02-15', 'adjustment', '227.5', '0', 0.00, 227.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '78', '2020-02-15 20:10:54', '2020-02-15 20:10:54'),
(80, '2020-02-15', 'adjustment', '158.39999999999998', '0', 0.00, 158.40, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '79', '2020-02-15 20:14:48', '2020-02-15 20:14:48'),
(81, '2020-02-15', 'adjustment', '57.52', '0', 0.00, 57.52, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '80', '2020-02-15 20:16:58', '2020-02-15 20:16:58'),
(82, '2020-02-15', 'adjustment', '6.6', '0', 0.00, 6.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '81', '2020-02-15 20:17:55', '2020-02-15 20:17:55'),
(83, '2020-02-15', 'adjustment', '43.62', '0', 0.00, 43.62, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '82', '2020-02-15 20:19:51', '2020-02-15 20:19:51'),
(84, '2020-02-15', 'adjustment', '59.46', '0', 0.00, 59.46, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '83', '2020-02-15 20:20:51', '2020-02-15 20:20:51'),
(85, '2020-02-15', 'adjustment', '62.099999999999994', '0', 0.00, 62.10, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '84', '2020-02-15 20:22:05', '2020-02-15 20:22:05'),
(86, '2020-02-15', 'adjustment', '152', '0', 0.00, 152.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '85', '2020-02-15 20:24:12', '2020-02-15 20:24:12'),
(87, '2020-02-15', 'adjustment', '163.44', '0', 0.00, 163.44, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '86', '2020-02-15 20:25:09', '2020-02-15 20:25:09'),
(88, '2020-02-15', 'adjustment', '96', '0', 0.00, 96.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '87', '2020-02-15 20:26:17', '2020-02-15 20:26:17'),
(89, '2020-02-15', 'adjustment', '71.52', '0', 0.00, 71.52, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '88', '2020-02-15 20:28:13', '2020-02-15 20:28:13'),
(90, '2020-02-15', 'adjustment', '189.84', '0', 0.00, 189.84, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '89', '2020-02-15 20:35:48', '2020-02-15 20:35:48'),
(91, '2020-02-15', 'adjustment', '707.5600000000001', '0', 0.00, 707.56, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '90', '2020-02-15 20:36:54', '2020-02-15 20:36:54'),
(92, '2020-02-15', 'adjustment', '186.20000000000002', '0', 0.00, 186.20, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '91', '2020-02-15 20:37:10', '2020-02-15 20:37:10'),
(93, '2020-02-15', 'adjustment', '146.52', '0', 0.00, 146.52, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '92', '2020-02-15 20:39:08', '2020-02-15 20:39:08'),
(94, '2020-02-15', 'adjustment', '27.6', '0', 0.00, 27.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '93', '2020-02-15 20:41:30', '2020-02-15 20:41:30'),
(95, '2020-02-15', 'adjustment', '69.6', '0', 0.00, 69.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '94', '2020-02-15 20:43:10', '2020-02-15 20:43:10'),
(96, '2020-02-15', 'adjustment', '99.96000000000001', '0', 0.00, 99.96, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '95', '2020-02-15 20:44:14', '2020-02-15 20:44:14'),
(97, '2020-02-15', 'adjustment', '50.099999999999994', '0', 0.00, 50.10, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '96', '2020-02-15 20:47:09', '2020-02-15 20:47:09'),
(98, '2020-02-15', 'adjustment', '156.8', '0', 0.00, 156.80, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '97', '2020-02-15 20:49:55', '2020-02-15 20:49:55'),
(99, '2020-02-15', 'adjustment', '78.4', '0', 0.00, 78.40, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '98', '2020-02-15 20:51:05', '2020-02-15 20:51:05'),
(100, '2020-02-15', 'adjustment', '86.64', '0', 0.00, 86.64, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '99', '2020-02-15 20:52:14', '2020-02-15 20:52:14'),
(101, '2020-02-15', 'adjustment', '137.20000000000002', '0', 0.00, 137.20, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '100', '2020-02-15 20:54:36', '2020-02-15 20:54:36'),
(102, '2020-02-16', 'sales', '31.11', '0', 0.00, 31.11, 'customer', 0.00, 'cancelled', 0, NULL, NULL, 3, NULL, NULL, 3, '101', '2020-02-15 19:40:00', '2020-02-16 00:40:52'),
(103, '2020-02-16', 'adjustment', '19.11', '0', 0.00, 19.11, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '102', '2020-02-16 00:42:44', '2020-02-16 00:42:44'),
(104, '2020-02-16', 'adjustment', '12', '0', 0.00, 12.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '103', '2020-02-16 00:43:07', '2020-02-16 00:43:07'),
(105, '2020-02-16', 'adjustment', '585.5999999999999', '0', 0.00, 585.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '104', '2020-02-16 00:55:08', '2020-02-16 00:55:08'),
(106, '2020-02-16', 'adjustment', '98', '0', 0.00, 98.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '105', '2020-02-16 00:56:22', '2020-02-16 00:56:22'),
(107, '2020-02-16', 'adjustment', '80.60000000000001', '0', 0.00, 80.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '106', '2020-02-16 00:57:31', '2020-02-16 00:57:31'),
(108, '2020-02-16', 'adjustment', '131.6', '0', 0.00, 131.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '107', '2020-02-16 00:58:51', '2020-02-16 00:58:51'),
(109, '2020-02-16', 'adjustment', '88.19999999999999', '0', 0.00, 88.20, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '108', '2020-02-16 01:00:30', '2020-02-16 01:00:30'),
(110, '2020-02-16', 'adjustment', '44.32', '0', 0.00, 44.32, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '109', '2020-02-16 01:01:47', '2020-02-16 01:01:47'),
(111, '2020-02-16', 'adjustment', '55', '0', 0.00, 55.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '110', '2020-02-16 01:03:28', '2020-02-16 01:03:28'),
(112, '2020-02-16', 'adjustment', '121.36', '0', 0.00, 121.36, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '111', '2020-02-16 01:04:43', '2020-02-16 01:04:43'),
(113, '2020-02-16', 'adjustment', '113.88', '0', 0.00, 113.88, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '112', '2020-02-16 01:06:05', '2020-02-16 01:06:05'),
(114, '2020-02-16', 'adjustment', '47', '0', 0.00, 47.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '113', '2020-02-16 01:07:32', '2020-02-16 01:07:32'),
(115, '2020-02-16', 'adjustment', '178.48', '0', 0.00, 178.48, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '114', '2020-02-16 01:09:11', '2020-02-16 01:09:11'),
(116, '2020-02-16', 'adjustment', '183.2', '0', 0.00, 183.20, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '115', '2020-02-16 01:10:31', '2020-02-16 01:10:31'),
(117, '2020-02-16', 'adjustment', '411.84', '0', 0.00, 411.84, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '116', '2020-02-16 01:15:09', '2020-02-16 01:15:09'),
(118, '2020-02-16', 'adjustment', '257.58', '0', 0.00, 257.58, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '117', '2020-02-16 01:16:52', '2020-02-16 01:16:52'),
(119, '2020-02-16', 'adjustment', '91.8', '0', 0.00, 91.80, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '118', '2020-02-16 01:19:19', '2020-02-16 01:19:19'),
(120, '2020-02-16', 'adjustment', '12.33', '0', 0.00, 12.33, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '119', '2020-02-16 01:22:52', '2020-02-16 01:22:52'),
(121, '2020-02-16', 'adjustment', '167.46', '0', 0.00, 167.46, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '120', '2020-02-16 01:25:41', '2020-02-16 01:25:41'),
(122, '2020-02-16', 'adjustment', '117.12', '0', 0.00, 117.12, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '121', '2020-02-16 01:26:51', '2020-02-16 01:26:51'),
(123, '2020-02-16', 'adjustment', '125.58000000000001', '0', 0.00, 125.58, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '122', '2020-02-16 01:29:20', '2020-02-16 01:29:20'),
(124, '2020-02-16', 'adjustment', '50.4', '0', 0.00, 50.40, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '123', '2020-02-16 01:32:32', '2020-02-16 01:32:32'),
(125, '2020-02-16', 'adjustment', '36.81', '0', 0.00, 36.81, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '124', '2020-02-16 01:34:19', '2020-02-16 01:34:19'),
(126, '2020-02-16', 'adjustment', '223.68', '0', 0.00, 223.68, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '125', '2020-02-16 01:37:11', '2020-02-16 01:37:11'),
(127, '2020-02-16', 'adjustment', '160.0225', '0', 0.00, 160.02, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '126', '2020-02-16 01:38:39', '2020-02-16 01:38:39'),
(128, '2020-02-16', 'adjustment', '-160.0225', '0', 0.00, -160.02, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '127', '2020-02-16 01:39:28', '2020-02-16 01:39:28'),
(129, '2020-02-16', 'adjustment', '759', '0', 0.00, 759.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '128', '2020-02-16 01:39:56', '2020-02-16 01:39:56'),
(130, '2020-02-16', 'adjustment', '76', '0', 0.00, 76.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '129', '2020-02-16 01:40:58', '2020-02-16 01:40:58'),
(131, '2020-02-16', 'adjustment', '218.64', '0', 0.00, 218.64, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '130', '2020-02-16 01:44:51', '2020-02-16 01:44:51'),
(132, '2020-02-16', 'adjustment', '655.92', '0', 0.00, 655.92, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '131', '2020-02-16 01:46:48', '2020-02-16 01:46:48'),
(133, '2020-02-16', 'adjustment', '-893.7600000000001', '0', 0.00, -893.76, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '132', '2020-02-16 01:47:47', '2020-02-16 01:47:47'),
(134, '2020-02-16', 'adjustment', '186.20000000000002', '0', 0.00, 186.20, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '133', '2020-02-16 01:49:00', '2020-02-16 01:49:00'),
(135, '2020-02-16', 'adjustment', '186', '0', 0.00, 186.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '134', '2020-02-16 01:51:59', '2020-02-16 01:51:59'),
(136, '2020-02-16', 'adjustment', '280.8', '0', 0.00, 280.80, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '135', '2020-02-16 01:55:02', '2020-02-16 01:55:02'),
(137, '2020-02-16', 'adjustment', '237.12', '0', 0.00, 237.12, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '136', '2020-02-16 02:01:37', '2020-02-16 02:01:37'),
(138, '2020-02-16', 'adjustment', '237.12', '0', 0.00, 237.12, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '137', '2020-02-16 02:03:23', '2020-02-16 02:03:23'),
(139, '2020-02-16', 'adjustment', '97.61440000000002', '0', 0.00, 97.61, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '138', '2020-02-16 02:04:49', '2020-02-16 02:04:49'),
(140, '2020-02-16', 'adjustment', '-97.61440000000002', '0', 0.00, -97.61, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '139', '2020-02-16 02:05:06', '2020-02-16 02:05:06'),
(141, '2020-02-16', 'adjustment', '237.12', '0', 0.00, 237.12, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '140', '2020-02-16 02:05:21', '2020-02-16 02:05:21'),
(142, '2020-02-16', 'adjustment', '237.12', '0', 0.00, 237.12, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '141', '2020-02-16 02:07:29', '2020-02-16 02:07:29'),
(143, '2020-02-16', 'adjustment', '237.12', '0', 0.00, 237.12, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '142', '2020-02-16 02:08:43', '2020-02-16 02:08:43'),
(144, '2020-02-16', 'adjustment', '335.04', '0', 0.00, 335.04, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '143', '2020-02-16 02:12:42', '2020-02-16 02:12:42'),
(145, '2020-02-16', 'adjustment', '371.52', '0', 0.00, 371.52, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '144', '2020-02-16 02:14:37', '2020-02-16 02:14:37'),
(146, '2020-02-16', 'adjustment', '243.12', '0', 0.00, 243.12, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '145', '2020-02-16 03:14:35', '2020-02-16 03:14:35'),
(147, '2020-02-17', 'sales', '770.52', '0', 0.00, 770.52, 'customer', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '146', '2020-02-17 15:51:00', '2020-02-17 20:51:37'),
(148, '2020-02-17', 'sales', '437.71000000000004', '0', 0.00, 437.71, 'customer', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '147', '2020-02-17 15:55:00', '2020-02-17 20:55:30'),
(149, '2020-02-17', 'sales', '165', '0', 0.00, 165.00, 'customer', 55.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 1, '148-5-1', '2020-02-17 19:25:00', '2020-02-18 00:25:13'),
(150, '2020-02-18', 'sales', '69', '0', 0.00, 69.00, 'customer', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '148', '2020-02-17 19:25:00', '2020-02-18 00:25:51'),
(151, '2020-02-18', 'adjustment', '130.16', '0', 0.00, 130.16, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '149', '2020-02-18 00:27:24', '2020-02-18 00:27:24'),
(152, '2020-02-20', 'adjustment', '129.84', '0', 0.00, 129.84, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '150', '2020-02-20 01:09:33', '2020-02-20 01:09:33'),
(153, '2020-02-20', 'adjustment', '69', '0', 0.00, 69.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '151', '2020-02-20 01:12:27', '2020-02-20 01:12:27'),
(154, '2020-02-20', 'adjustment', '220.85999999999999', '0', 0.00, 220.86, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '152', '2020-02-20 01:16:20', '2020-02-20 01:16:20'),
(155, '2020-02-20', 'adjustment', '39.42', '0', 0.00, 39.42, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '153', '2020-02-20 01:45:58', '2020-02-20 01:45:58'),
(156, '2020-02-20', 'adjustment', '149.52', '0', 0.00, 149.52, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '154', '2020-02-20 01:53:55', '2020-02-20 01:53:55'),
(157, '2020-02-20', 'adjustment', '220.85999999999999', '0', 0.00, 220.86, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '155', '2020-02-20 01:58:26', '2020-02-20 01:58:26'),
(158, '2020-02-20', 'adjustment', '94.5', '0', 0.00, 94.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '156', '2020-02-20 02:03:09', '2020-02-20 02:03:09'),
(159, '2020-02-20', 'adjustment', '310.5', '0', 0.00, 310.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '157', '2020-02-20 02:04:19', '2020-02-20 02:04:19'),
(160, '2020-02-20', 'adjustment', '222.32000000000002', '0', 0.00, 222.32, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '158', '2020-02-20 02:08:28', '2020-02-20 02:08:28'),
(161, '2020-02-20', 'adjustment', '137.76', '0', 0.00, 137.76, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '159', '2020-02-20 02:14:14', '2020-02-20 02:14:14'),
(162, '2020-02-20', 'adjustment', '105', '0', 0.00, 105.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '160', '2020-02-20 02:19:57', '2020-02-20 02:19:57'),
(163, '2020-02-20', 'adjustment', '121.5', '0', 0.00, 121.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '161', '2020-02-20 02:23:28', '2020-02-20 02:23:28'),
(164, '2020-02-21', 'receiving', '500', '0', 0.00, 500.00, 'supplier', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 1, '162', '2020-02-20 19:56:00', '2020-02-21 00:56:22'),
(165, '2020-02-21', 'sales', '150', '0', 0.00, 150.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, 2, NULL, 1, '163', '2020-02-20 19:58:00', '2020-02-21 00:58:25'),
(166, '2020-02-21', 'receiving', '70', '0', 0.00, 70.00, 'internal', 0.00, 'done', 0, NULL, NULL, 2, 3, NULL, 1, '164', '2020-02-20 20:00:00', '2020-02-21 01:01:02'),
(167, '2020-02-21', 'receiving', '30', '0', 0.00, 30.00, 'internal', 0.00, 'done', 0, NULL, NULL, 1, 3, NULL, 1, '165', '2020-02-20 20:05:00', '2020-02-21 01:05:03'),
(168, '2020-02-25', 'adjustment', '132.32', '0', 0.00, 132.32, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '166', '2020-02-25 23:34:21', '2020-02-25 23:34:21'),
(169, '2020-02-25', 'adjustment', '254.99999999999997', '0', 0.00, 255.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '167', '2020-02-25 23:36:22', '2020-02-25 23:36:22'),
(170, '2020-02-26', 'adjustment', '207', '0', 0.00, 207.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '168', '2020-02-26 00:33:10', '2020-02-26 00:33:10'),
(171, '2020-02-26', 'adjustment', '300', '0', 0.00, 300.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '169', '2020-02-26 00:35:46', '2020-02-26 00:35:46'),
(172, '2020-02-26', 'adjustment', '104.39999999999999', '0', 0.00, 104.40, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '170', '2020-02-26 00:54:55', '2020-02-26 00:54:55'),
(173, '2020-02-26', 'adjustment', '66.39999999999999', '0', 0.00, 66.40, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '171', '2020-02-26 00:58:00', '2020-02-26 00:58:00'),
(174, '2020-02-26', 'adjustment', '91.19999999999999', '0', 0.00, 91.20, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '172', '2020-02-26 01:01:55', '2020-02-26 01:01:55'),
(175, '2020-02-26', 'adjustment', '78.6', '0', 0.00, 78.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '173', '2020-02-26 01:02:43', '2020-02-26 01:02:43'),
(176, '2020-02-26', 'adjustment', '78.6', '0', 0.00, 78.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '174', '2020-02-26 01:04:09', '2020-02-26 01:04:09'),
(177, '2020-02-26', 'adjustment', '242.72', '0', 0.00, 242.72, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '175', '2020-02-26 01:05:56', '2020-02-26 01:05:56'),
(178, '2020-02-26', 'adjustment', '61', '0', 0.00, 61.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '176', '2020-02-26 01:09:52', '2020-02-26 01:09:52'),
(179, '2020-02-26', 'adjustment', '56.96', '0', 0.00, 56.96, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '177', '2020-02-26 01:11:29', '2020-02-26 01:11:29'),
(180, '2020-02-26', 'adjustment', '75.6', '0', 0.00, 75.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '178', '2020-02-26 01:15:41', '2020-02-26 01:15:41'),
(181, '2020-02-26', 'adjustment', '137.52', '0', 0.00, 137.52, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '179', '2020-02-26 01:20:09', '2020-02-26 01:20:09'),
(182, '2020-02-26', 'adjustment', '244.92000000000002', '0', 0.00, 244.92, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '180', '2020-02-26 01:23:16', '2020-02-26 01:23:16'),
(183, '2020-02-26', 'adjustment', '149.92', '0', 0.00, 149.92, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '181', '2020-02-26 01:28:41', '2020-02-26 01:28:41'),
(184, '2020-02-26', 'adjustment', '169.44', '0', 0.00, 169.44, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '182', '2020-02-26 01:33:23', '2020-02-26 01:33:23'),
(185, '2020-02-26', 'adjustment', '109.56', '0', 0.00, 109.56, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '183', '2020-02-26 01:37:35', '2020-02-26 01:37:35'),
(186, '2020-02-26', 'adjustment', '204', '0', 0.00, 204.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '184', '2020-02-26 01:45:22', '2020-02-26 01:45:22'),
(187, '2020-02-26', 'adjustment', '121.5', '0', 0.00, 121.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '185', '2020-02-26 01:50:21', '2020-02-26 01:50:21'),
(188, '2020-02-26', 'adjustment', '-91.8', '0', 0.00, -91.80, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '186', '2020-02-26 01:51:06', '2020-02-26 01:51:06'),
(189, '2020-02-26', 'adjustment', '145.5', '0', 0.00, 145.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '187', '2020-02-26 01:54:33', '2020-02-26 01:54:33'),
(190, '2020-02-26', 'adjustment', '65.5', '0', 0.00, 65.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '188', '2020-02-26 01:55:28', '2020-02-26 01:55:28'),
(191, '2020-02-26', 'adjustment', '65.5', '0', 0.00, 65.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '189', '2020-02-26 01:56:15', '2020-02-26 01:56:15'),
(192, '2020-02-26', 'adjustment', '43', '0', 0.00, 43.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '190', '2020-02-26 01:57:05', '2020-02-26 01:57:05'),
(193, '2020-02-26', 'adjustment', '1260', '0', 0.00, 1260.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '191', '2020-02-26 01:59:13', '2020-02-26 01:59:13'),
(194, '2020-02-26', 'adjustment', '57', '0', 0.00, 57.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '192', '2020-02-26 02:09:30', '2020-02-26 02:09:30'),
(195, '2020-02-26', 'adjustment', '64.5', '0', 0.00, 64.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '193', '2020-02-26 02:09:43', '2020-02-26 02:09:43'),
(196, '2020-02-26', 'adjustment', '118.26', '0', 0.00, 118.26, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '194', '2020-02-26 02:11:31', '2020-02-26 02:11:31'),
(197, '2020-02-26', 'adjustment', '140.64000000000001', '0', 0.00, 140.64, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '195', '2020-02-26 02:14:31', '2020-02-26 02:14:31'),
(198, '2020-02-26', 'adjustment', '-99.24', '0', 0.00, -99.24, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '196', '2020-02-26 02:15:19', '2020-02-26 02:15:19'),
(199, '2020-02-26', 'adjustment', '127.4', '0', 0.00, 127.40, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '197', '2020-02-26 02:19:04', '2020-02-26 02:19:04'),
(200, '2020-02-26', 'adjustment', '-19.6', '0', 0.00, -19.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '198', '2020-02-26 02:19:26', '2020-02-26 02:19:26'),
(201, '2020-02-26', 'adjustment', '-46.5', '0', 0.00, -46.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '199', '2020-02-26 02:20:27', '2020-02-26 02:20:27'),
(202, '2020-02-28', 'adjustment', '-129.84', '0', 0.00, -129.84, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '200', '2020-02-28 18:34:42', '2020-02-28 18:34:42'),
(203, '2020-02-28', 'adjustment', '-276', '0', 0.00, -276.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '201', '2020-02-28 18:36:24', '2020-02-28 18:36:24'),
(204, '2020-02-28', 'adjustment', '-98', '0', 0.00, -98.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '202', '2020-02-28 18:37:09', '2020-02-28 18:37:09'),
(205, '2020-02-28', 'adjustment', '-78.4', '0', 0.00, -78.40, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '203', '2020-02-28 18:37:49', '2020-02-28 18:37:49'),
(206, '2020-02-28', 'adjustment', '-136.2', '0', 0.00, -136.20, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '204', '2020-02-28 18:38:59', '2020-02-28 18:38:59'),
(207, '2020-02-28', 'adjustment', '-27.24', '0', 0.00, -27.24, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '205', '2020-02-28 18:39:28', '2020-02-28 18:39:28'),
(208, '2020-02-28', 'adjustment', '-44.800000000000004', '0', 0.00, -44.80, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '206', '2020-02-28 18:40:55', '2020-02-28 18:40:55'),
(209, '2020-02-28', 'adjustment', '-24', '0', 0.00, -24.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '207', '2020-02-28 18:41:34', '2020-02-28 18:41:34'),
(210, '2020-02-28', 'adjustment', '-106.6', '0', 0.00, -106.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '208', '2020-02-28 18:42:09', '2020-02-28 18:42:09'),
(211, '2020-02-28', 'adjustment', '-57.33', '0', 0.00, -57.33, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '209', '2020-02-28 18:42:57', '2020-02-28 18:42:57'),
(212, '2020-02-28', 'adjustment', '-455.40000000000003', '0', 0.00, -455.40, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '210', '2020-02-28 18:44:36', '2020-02-28 18:44:36'),
(213, '2020-02-29', 'sales', '0.4', '0', 0.00, 0.40, 'customer', 0.15, 'done', 0, NULL, NULL, 2, NULL, NULL, 1, '211', '2020-02-29 15:17:00', '2020-02-29 20:17:36'),
(214, '2020-03-02', 'adjustment', '213.6', '0', 0.00, 213.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '212', '2020-03-02 21:19:29', '2020-03-02 21:19:29'),
(215, '2020-03-02', 'adjustment', '432.6', '0', 0.00, 432.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '213', '2020-03-02 23:58:01', '2020-03-02 23:58:01'),
(216, '2020-03-03', 'adjustment', '295.20000000000005', '0', 0.00, 295.20, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '214', '2020-03-03 00:00:49', '2020-03-03 00:00:49'),
(217, '2020-03-03', 'adjustment', '252', '0', 0.00, 252.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '215', '2020-03-03 00:07:07', '2020-03-03 00:07:07'),
(218, '2020-03-03', 'adjustment', '455.52', '0', 0.00, 455.52, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '216', '2020-03-03 00:18:49', '2020-03-03 00:18:49'),
(219, '2020-03-03', 'adjustment', '140.04', '0', 0.00, 140.04, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '217', '2020-03-03 00:52:41', '2020-03-03 00:52:41'),
(220, '2020-03-03', 'adjustment', '134.04', '0', 0.00, 134.04, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '218', '2020-03-03 00:54:58', '2020-03-03 00:54:58'),
(221, '2020-03-03', 'adjustment', '59.46', '0', 0.00, 59.46, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '219', '2020-03-03 00:58:55', '2020-03-03 00:58:55'),
(222, '2020-03-03', 'adjustment', '379.20000000000005', '0', 0.00, 379.20, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '220', '2020-03-03 01:02:56', '2020-03-03 01:02:56'),
(223, '2020-03-03', 'adjustment', '79.5', '0', 0.00, 79.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '221', '2020-03-03 01:03:46', '2020-03-03 01:03:46'),
(224, '2020-03-03', 'adjustment', '67.5', '0', 0.00, 67.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '222', '2020-03-03 01:05:53', '2020-03-03 01:05:53'),
(225, '2020-03-03', 'adjustment', '57', '0', 0.00, 57.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '223', '2020-03-03 01:08:09', '2020-03-03 01:08:09'),
(226, '2020-03-03', 'adjustment', '275.4', '0', 0.00, 275.40, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '224', '2020-03-03 01:10:15', '2020-03-03 01:10:15'),
(227, '2020-03-03', 'adjustment', '327.12', '0', 0.00, 327.12, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '225', '2020-03-03 01:12:32', '2020-03-03 01:12:32'),
(228, '2020-03-03', 'adjustment', '189', '0', 0.00, 189.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '226', '2020-03-03 01:14:19', '2020-03-03 01:14:19'),
(229, '2020-03-03', 'adjustment', '189', '0', 0.00, 189.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '227', '2020-03-03 01:14:36', '2020-03-03 01:14:36'),
(230, '2020-03-03', 'adjustment', '189', '0', 0.00, 189.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '228', '2020-03-03 01:15:48', '2020-03-03 01:15:48'),
(231, '2020-03-03', 'adjustment', '194.16', '0', 0.00, 194.16, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '229', '2020-03-03 01:17:56', '2020-03-03 01:17:56'),
(232, '2020-03-03', 'adjustment', '68.75999999999999', '0', 0.00, 68.76, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '230', '2020-03-03 01:22:44', '2020-03-03 01:22:44'),
(233, '2020-03-03', 'adjustment', '261.03000000000003', '0', 0.00, 261.03, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '231', '2020-03-03 01:24:26', '2020-03-03 01:24:26'),
(234, '2020-03-03', 'adjustment', '257.58', '0', 0.00, 257.58, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '232', '2020-03-03 01:27:34', '2020-03-03 01:27:34'),
(235, '2020-03-03', 'adjustment', '751.5', '0', 0.00, 751.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '233', '2020-03-03 01:28:40', '2020-03-03 01:28:40'),
(236, '2020-03-03', 'adjustment', '347.59999999999997', '0', 0.00, 347.60, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '234', '2020-03-03 01:34:10', '2020-03-03 01:34:10'),
(237, '2020-03-03', 'adjustment', '189', '0', 0.00, 189.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '235', '2020-03-03 01:36:49', '2020-03-03 01:36:49'),
(238, '2020-03-03', 'adjustment', '-189', '0', 0.00, -189.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '236', '2020-03-03 01:37:52', '2020-03-03 01:37:52'),
(239, '2020-03-03', 'adjustment', '-189', '0', 0.00, -189.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '237', '2020-03-03 01:38:29', '2020-03-03 01:38:29'),
(240, '2020-03-03', 'adjustment', '189', '0', 0.00, 189.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '238', '2020-03-03 01:39:44', '2020-03-03 01:39:44'),
(241, '2020-03-03', 'adjustment', '271.08', '0', 0.00, 271.08, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '239', '2020-03-03 01:42:25', '2020-03-03 01:42:25'),
(242, '2020-03-03', 'adjustment', '31.5', '0', 0.00, 31.50, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '240', '2020-03-03 01:45:02', '2020-03-03 01:45:02'),
(243, '2020-03-03', 'adjustment', '228', '0', 0.00, 228.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '241', '2020-03-03 01:50:07', '2020-03-03 01:50:07'),
(244, '2020-03-03', 'adjustment', '228', '0', 0.00, 228.00, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '242', '2020-03-03 01:54:35', '2020-03-03 01:54:35'),
(245, '2020-03-03', 'adjustment', '86.8', '0', 0.00, 86.80, 'internal', 0.00, 'done', 0, NULL, NULL, 3, NULL, NULL, 3, '243', '2020-03-03 02:03:57', '2020-03-03 02:03:57'),
(246, '2020-03-21', 'receiving', '50', '0', 0.00, 50.00, 'supplier', 0.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 1, '244', '2020-03-20 22:54:00', '2020-03-21 03:54:51'),
(247, '2020-03-21', 'receiving', '100', '0', 0.00, 100.00, 'supplier', 0.00, 'done', 0, NULL, NULL, 2, NULL, NULL, 1, '245', '2020-03-20 22:55:00', '2020-03-21 03:55:43'),
(248, '2020-03-21', 'sales', '30.75', '0', 0.00, 30.75, 'internal', 0.00, 'done', 0, NULL, NULL, 3, 1, NULL, 1, '246', '2020-03-20 23:05:00', '2020-03-21 04:05:14'),
(249, '2020-03-21', 'sales', '16.8', '0', 0.00, 16.80, 'customer', 6.30, 'done', 0, NULL, NULL, 2, NULL, NULL, 3, '247', '2020-03-20 23:23:00', '2020-03-21 04:23:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double(8,2) NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `sub_total` double(8,2) NOT NULL DEFAULT '0.00',
  `tax_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `adjust_stock_type_id` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `variant_id`, `type`, `quantity`, `price`, `discount`, `sub_total`, `tax_id`, `order_id`, `adjust_stock_type_id`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'receiving', 10.00, 8.00, 0.00, 80.00, NULL, 1, 0, NULL, '2020-02-07 05:28:52', '2020-02-07 05:28:52'),
(2, 2, 2, 'receiving', 10.00, 5.00, 0.00, 50.00, NULL, 2, 0, NULL, '2020-02-07 05:29:04', '2020-02-07 05:29:04'),
(3, 2, 2, 'sales', -3.00, 5.00, 100.00, 0.00, NULL, 3, 0, NULL, '2020-02-07 05:38:02', '2020-02-07 05:38:02'),
(4, 1, 1, 'sales', -2.00, 8.00, 100.00, 0.00, NULL, 3, 0, NULL, '2020-02-07 05:38:02', '2020-02-07 05:38:02'),
(6, 2, 2, 'sales', -10.00, 10.00, 0.00, 100.00, NULL, 4, 0, NULL, '2020-02-07 05:51:37', '2020-02-07 05:51:37'),
(7, 2, 2, 'receiving', 5.00, 5.00, 0.00, 25.00, NULL, 5, 0, NULL, '2020-02-07 05:53:22', '2020-02-07 05:53:22'),
(8, 2, 2, 'sales', -2.00, 10.00, 0.00, 20.00, NULL, 6, 0, NULL, '2020-02-07 06:13:31', '2020-02-07 06:13:31'),
(10, 1, 1, 'sales', -4.00, 12.00, 0.00, 48.00, NULL, 7, 0, NULL, '2020-02-08 01:58:49', '2020-02-08 01:58:49'),
(12, 1, 1, 'sales', -1.00, 12.00, 0.00, 12.00, NULL, 8, 0, NULL, '2020-02-09 02:31:45', '2020-02-09 02:31:45'),
(13, 2, 2, 'sales', -3.00, 10.00, 0.00, 30.00, NULL, 9, 0, NULL, '2020-02-09 02:32:31', '2020-02-09 02:32:31'),
(22, 2, 2, 'sales', 1.00, 10.00, 0.00, -10.00, NULL, 11, 0, NULL, '2020-02-09 02:40:43', '2020-02-09 02:40:43'),
(21, 2, 2, 'sales', -1.00, 10.00, 0.00, 10.00, NULL, 10, 0, NULL, '2020-02-09 02:36:51', '2020-02-09 02:36:51'),
(20, 1, 1, 'sales', -2.00, 12.00, 0.00, 24.00, NULL, 10, 0, NULL, '2020-02-09 02:36:51', '2020-02-09 02:36:51'),
(23, 1, 1, 'sales', 2.00, 12.00, 0.00, -24.00, NULL, 11, 0, NULL, '2020-02-09 02:40:43', '2020-02-09 02:40:43'),
(25, 1, 1, 'receiving', 3.00, 8.00, 0.00, 24.00, NULL, 12, 0, NULL, '2020-02-13 05:23:09', '2020-02-13 05:23:09'),
(27, 3, 3, 'receiving', 10.00, 10.00, 0.00, 100.00, NULL, 13, 0, NULL, '2020-02-13 22:33:11', '2020-02-13 22:33:11'),
(28, 3, 3, 'sales', -2.00, 15.00, 0.00, 30.00, NULL, 14, 0, NULL, '2020-02-13 22:34:25', '2020-02-13 22:34:25'),
(29, 3, 3, 'receiving', 50.00, 10.00, 0.00, 500.00, NULL, 15, 0, NULL, '2020-02-13 22:52:28', '2020-02-13 22:52:28'),
(30, 5, 5, 'receiving', 1000.00, 0.08, 0.00, 80.00, NULL, 16, 0, NULL, '2020-02-13 23:09:08', '2020-02-13 23:09:08'),
(32, 5, 5, 'sales', -250.00, 0.08, 0.00, 20.00, NULL, 17, 0, NULL, '2020-02-13 23:11:07', '2020-02-13 23:11:07'),
(33, 6, 6, 'receiving', 5.00, 80.00, 0.00, 400.00, NULL, 18, 0, NULL, '2020-02-13 23:19:11', '2020-02-13 23:19:11'),
(34, 3, 3, 'sales', -1.00, 15.00, 0.00, 15.00, NULL, 19, 0, NULL, '2020-02-13 23:31:09', '2020-02-13 23:31:09'),
(35, 6, 6, 'sales', -2.00, 110.00, 0.00, 220.00, NULL, 19, 0, NULL, '2020-02-13 23:31:09', '2020-02-13 23:31:09'),
(36, 5, 5, 'sales', -4.00, 0.08, 0.00, 0.32, NULL, 20, 0, NULL, '2020-02-13 23:31:09', '2020-02-13 23:31:09'),
(37, 4, 4, 'receiving', 1.00, 30.00, 0.00, 30.00, NULL, 21, 0, NULL, '2020-02-13 23:50:33', '2020-02-13 23:50:33'),
(38, 6, 6, 'sales', -1.00, 110.00, 0.00, 110.00, NULL, 22, 0, NULL, '2020-02-14 00:03:18', '2020-02-14 00:03:18'),
(39, 7, 7, 'adjustment', 7.00, 19.11, 0.00, 133.77, NULL, 23, 1, NULL, NULL, NULL),
(40, 8, 8, 'adjustment', 30.00, 12.00, 0.00, 360.00, NULL, 24, 1, NULL, NULL, NULL),
(41, 10, 10, 'adjustment', 20.00, 4.65, 0.00, 93.00, NULL, 25, 1, NULL, NULL, NULL),
(42, 9, 9, 'adjustment', 12.00, 8.00, 0.00, 96.00, NULL, 26, 1, NULL, NULL, NULL),
(43, 11, 11, 'adjustment', 30.00, 4.10, 0.00, 123.00, NULL, 27, 1, NULL, NULL, NULL),
(44, 12, 12, 'adjustment', 20.00, 6.55, 0.00, 131.00, NULL, 28, 1, NULL, NULL, NULL),
(45, 13, 13, 'adjustment', 12.00, 10.75, 0.00, 129.00, NULL, 29, 1, NULL, NULL, NULL),
(46, 14, 14, 'adjustment', 4.00, 19.50, 0.00, 78.00, NULL, 30, 1, NULL, NULL, NULL),
(47, 15, 15, 'adjustment', 12.00, 7.50, 0.00, 90.00, NULL, 31, 1, NULL, NULL, NULL),
(48, 16, 16, 'adjustment', 6.00, 11.20, 0.00, 67.20, NULL, 32, 1, NULL, NULL, NULL),
(49, 17, 17, 'adjustment', 10.00, 22.38, 0.00, 223.80, NULL, 33, 1, NULL, NULL, NULL),
(50, 18, 18, 'adjustment', 27.00, 7.58, 0.00, 204.66, NULL, 34, 1, NULL, NULL, NULL),
(51, 19, 19, 'adjustment', 21.00, 7.10, 0.00, 149.10, NULL, 35, 1, NULL, NULL, NULL),
(52, 20, 20, 'adjustment', 7.00, 17.50, 0.00, 122.50, NULL, 36, 1, NULL, NULL, NULL),
(53, 21, 21, 'adjustment', 10.00, 9.30, 0.00, 93.00, NULL, 37, 1, NULL, NULL, NULL),
(54, 22, 22, 'adjustment', 14.00, 12.50, 0.00, 175.00, NULL, 38, 1, NULL, NULL, NULL),
(55, 23, 23, 'adjustment', 6.00, 17.25, 0.00, 103.50, NULL, 39, 1, NULL, NULL, NULL),
(56, 24, 24, 'adjustment', 6.00, 13.79, 0.00, 82.74, NULL, 40, 1, NULL, NULL, NULL),
(57, 25, 25, 'adjustment', 3.00, 16.77, 0.00, 50.31, NULL, 41, 1, NULL, NULL, NULL),
(58, 26, 26, 'adjustment', 15.00, 8.96, 0.00, 134.40, NULL, 42, 1, NULL, NULL, NULL),
(59, 27, 27, 'adjustment', 1.00, 16.27, 0.00, 16.27, NULL, 43, 1, NULL, NULL, NULL),
(60, 28, 28, 'adjustment', 24.00, 18.00, 0.00, 432.00, NULL, 44, 1, NULL, NULL, NULL),
(61, 29, 29, 'adjustment', 24.00, 10.13, 0.00, 243.12, NULL, 45, 1, NULL, NULL, NULL),
(62, 30, 30, 'adjustment', 18.00, 10.12, 0.00, 182.16, NULL, 46, 1, NULL, NULL, NULL),
(63, 31, 31, 'adjustment', 10.00, 5.71, 0.00, 57.10, NULL, 47, 1, NULL, NULL, NULL),
(64, 32, 32, 'adjustment', 1.00, 28.83, 0.00, 28.83, NULL, 48, 1, NULL, NULL, NULL),
(65, 33, 33, 'adjustment', 48.00, 4.74, 0.00, 227.52, NULL, 49, 1, NULL, NULL, NULL),
(66, 34, 34, 'adjustment', 32.00, 7.31, 0.00, 233.92, NULL, 50, 1, NULL, NULL, NULL),
(67, 35, 35, 'adjustment', 12.00, 21.50, 0.00, 258.00, NULL, 51, 1, NULL, NULL, NULL),
(68, 36, 36, 'adjustment', 9.00, 21.32, 0.00, 191.88, NULL, 52, 1, NULL, NULL, NULL),
(69, 37, 37, 'adjustment', 2.00, 16.32, 0.00, 32.64, NULL, 53, 1, NULL, NULL, NULL),
(70, 39, 39, 'adjustment', 24.00, 3.56, 0.00, 85.44, NULL, 54, 1, NULL, NULL, NULL),
(71, 40, 40, 'adjustment', 1.00, 25.00, 0.00, 25.00, NULL, 55, 1, NULL, NULL, NULL),
(72, 41, 41, 'adjustment', 1.00, 36.92, 0.00, 36.92, NULL, 56, 1, NULL, NULL, NULL),
(73, 42, 42, 'adjustment', 24.00, 7.23, 0.00, 173.52, NULL, 57, 1, NULL, NULL, NULL),
(74, 43, 43, 'adjustment', 6.00, 30.50, 0.00, 183.00, NULL, 58, 1, NULL, NULL, NULL),
(75, 44, 44, 'adjustment', 4.00, 21.77, 0.00, 87.08, NULL, 59, 1, NULL, NULL, NULL),
(76, 45, 45, 'adjustment', 10.00, 15.00, 0.00, 150.00, NULL, 60, 1, NULL, NULL, NULL),
(77, 46, 46, 'adjustment', 6.00, 10.30, 0.00, 61.80, NULL, 61, 1, NULL, NULL, NULL),
(78, 47, 47, 'adjustment', 6.00, 16.54, 0.00, 99.24, NULL, 62, 1, NULL, NULL, NULL),
(79, 48, 48, 'adjustment', 9.00, 11.27, 0.00, 101.43, NULL, 63, 1, NULL, NULL, NULL),
(80, 48, 48, 'adjustment', 1.00, 11.27, 0.00, 11.27, NULL, 64, 1, NULL, NULL, NULL),
(81, 49, 49, 'adjustment', 15.00, 7.64, 0.00, 114.60, NULL, 65, 1, NULL, NULL, NULL),
(82, 50, 50, 'adjustment', 2.00, 12.50, 0.00, 25.00, NULL, 66, 1, NULL, NULL, NULL),
(83, 51, 51, 'adjustment', 7.00, 8.00, 0.00, 56.00, NULL, 67, 1, NULL, NULL, NULL),
(84, 52, 52, 'adjustment', 31.00, 5.12, 0.00, 158.72, NULL, 68, 1, NULL, NULL, NULL),
(85, 53, 53, 'adjustment', 3.00, 22.75, 0.00, 68.25, NULL, 69, 1, NULL, NULL, NULL),
(86, 54, 54, 'adjustment', 27.00, 4.48, 0.00, 120.96, NULL, 70, 1, NULL, NULL, NULL),
(87, 54, 54, 'adjustment', 3.00, 4.48, 0.00, 13.44, NULL, 71, 1, NULL, NULL, NULL),
(88, 55, 55, 'adjustment', 7.00, 4.51, 0.00, 31.57, NULL, 72, 1, NULL, NULL, NULL),
(89, 56, 56, 'adjustment', 8.00, 5.13, 0.00, 41.04, NULL, 73, 1, NULL, NULL, NULL),
(90, 57, 57, 'adjustment', 9.00, 8.69, 0.00, 78.21, NULL, 74, 1, NULL, NULL, NULL),
(91, 58, 58, 'adjustment', 2.00, 4.32, 0.00, 8.64, NULL, 75, 1, NULL, NULL, NULL),
(92, 59, 59, 'adjustment', 41.00, 8.82, 0.00, 361.62, NULL, 76, 1, NULL, NULL, NULL),
(93, 60, 60, 'adjustment', 9.00, 7.30, 0.00, 65.70, NULL, 77, 1, NULL, NULL, NULL),
(94, 61, 61, 'adjustment', 8.00, 6.75, 0.00, 54.00, NULL, 78, 1, NULL, NULL, NULL),
(95, 62, 62, 'adjustment', 13.00, 17.50, 0.00, 227.50, NULL, 79, 1, NULL, NULL, NULL),
(96, 63, 63, 'adjustment', 24.00, 6.60, 0.00, 158.40, NULL, 80, 1, NULL, NULL, NULL),
(97, 64, 64, 'adjustment', 8.00, 7.19, 0.00, 57.52, NULL, 81, 1, NULL, NULL, NULL),
(98, 63, 63, 'adjustment', 1.00, 6.60, 0.00, 6.60, NULL, 82, 1, NULL, NULL, NULL),
(99, 65, 65, 'adjustment', 6.00, 7.27, 0.00, 43.62, NULL, 83, 1, NULL, NULL, NULL),
(100, 66, 66, 'adjustment', 6.00, 9.91, 0.00, 59.46, NULL, 84, 1, NULL, NULL, NULL),
(101, 67, 67, 'adjustment', 6.00, 10.35, 0.00, 62.10, NULL, 85, 1, NULL, NULL, NULL),
(102, 68, 68, 'adjustment', 16.00, 9.50, 0.00, 152.00, NULL, 86, 1, NULL, NULL, NULL),
(103, 69, 69, 'adjustment', 12.00, 13.62, 0.00, 163.44, NULL, 87, 1, NULL, NULL, NULL),
(104, 70, 70, 'adjustment', 8.00, 12.00, 0.00, 96.00, NULL, 88, 1, NULL, NULL, NULL),
(105, 71, 71, 'adjustment', 6.00, 11.92, 0.00, 71.52, NULL, 89, 1, NULL, NULL, NULL),
(106, 72, 72, 'adjustment', 8.00, 23.73, 0.00, 189.84, NULL, 90, 1, NULL, NULL, NULL),
(107, 73, 73, 'adjustment', 26.60, 26.60, 0.00, 707.56, NULL, 91, 1, NULL, NULL, NULL),
(108, 73, 73, 'adjustment', 7.00, 26.60, 0.00, 186.20, NULL, 92, 1, NULL, NULL, NULL),
(109, 74, 74, 'adjustment', 6.00, 24.42, 0.00, 146.52, NULL, 93, 1, NULL, NULL, NULL),
(110, 76, 76, 'adjustment', 2.00, 13.80, 0.00, 27.60, NULL, 94, 1, NULL, NULL, NULL),
(111, 77, 77, 'adjustment', 12.00, 5.80, 0.00, 69.60, NULL, 95, 1, NULL, NULL, NULL),
(112, 78, 78, 'adjustment', 12.00, 8.33, 0.00, 99.96, NULL, 96, 1, NULL, NULL, NULL),
(113, 79, 79, 'adjustment', 3.00, 16.70, 0.00, 50.10, NULL, 97, 1, NULL, NULL, NULL),
(114, 80, 80, 'adjustment', 20.00, 7.84, 0.00, 156.80, NULL, 98, 1, NULL, NULL, NULL),
(115, 81, 81, 'adjustment', 10.00, 7.84, 0.00, 78.40, NULL, 99, 1, NULL, NULL, NULL),
(116, 82, 82, 'adjustment', 8.00, 10.83, 0.00, 86.64, NULL, 100, 1, NULL, NULL, NULL),
(117, 83, 83, 'adjustment', 14.00, 9.80, 0.00, 137.20, NULL, 101, 1, NULL, NULL, NULL),
(118, 7, 7, 'sales', -1.00, 19.11, 0.00, 19.11, NULL, 102, 0, NULL, '2020-02-16 00:40:45', '2020-02-16 00:40:45'),
(119, 8, 8, 'sales', -1.00, 12.00, 0.00, 12.00, NULL, 102, 0, NULL, '2020-02-16 00:40:45', '2020-02-16 00:40:45'),
(120, 7, 7, 'adjustment', 1.00, 19.11, 0.00, 19.11, NULL, 103, 1, NULL, NULL, NULL),
(121, 8, 8, 'adjustment', 1.00, 12.00, 0.00, 12.00, NULL, 104, 1, NULL, NULL, NULL),
(122, 85, 85, 'adjustment', 24.00, 24.40, 0.00, 585.60, NULL, 105, 1, NULL, NULL, NULL),
(123, 84, 84, 'adjustment', 10.00, 9.80, 0.00, 98.00, NULL, 106, 1, NULL, NULL, NULL),
(124, 86, 86, 'adjustment', 26.00, 3.10, 0.00, 80.60, NULL, 107, 1, NULL, NULL, NULL),
(125, 87, 87, 'adjustment', 7.00, 18.80, 0.00, 131.60, NULL, 108, 1, NULL, NULL, NULL),
(126, 88, 88, 'adjustment', 6.00, 14.70, 0.00, 88.20, NULL, 109, 1, NULL, NULL, NULL),
(127, 89, 89, 'adjustment', 2.00, 22.16, 0.00, 44.32, NULL, 110, 1, NULL, NULL, NULL),
(128, 90, 90, 'adjustment', 5.00, 11.00, 0.00, 55.00, NULL, 111, 1, NULL, NULL, NULL),
(129, 91, 91, 'adjustment', 8.00, 15.17, 0.00, 121.36, NULL, 112, 1, NULL, NULL, NULL),
(130, 92, 92, 'adjustment', 6.00, 18.98, 0.00, 113.88, NULL, 113, 1, NULL, NULL, NULL),
(131, 93, 93, 'adjustment', 5.00, 9.40, 0.00, 47.00, NULL, 114, 1, NULL, NULL, NULL),
(132, 94, 94, 'adjustment', 8.00, 22.31, 0.00, 178.48, NULL, 115, 1, NULL, NULL, NULL),
(133, 95, 95, 'adjustment', 16.00, 11.45, 0.00, 183.20, NULL, 116, 1, NULL, NULL, NULL),
(134, 96, 96, 'adjustment', 44.00, 9.36, 0.00, 411.84, NULL, 117, 1, NULL, NULL, NULL),
(135, 97, 97, 'adjustment', 27.00, 9.54, 0.00, 257.58, NULL, 118, 1, NULL, NULL, NULL),
(136, 98, 98, 'adjustment', 9.00, 10.20, 0.00, 91.80, NULL, 119, 1, NULL, NULL, NULL),
(137, 99, 99, 'adjustment', 1.00, 12.33, 0.00, 12.33, NULL, 120, 1, NULL, NULL, NULL),
(138, 100, 100, 'adjustment', 6.00, 27.91, 0.00, 167.46, NULL, 121, 1, NULL, NULL, NULL),
(139, 75, 75, 'adjustment', 6.00, 19.52, 0.00, 117.12, NULL, 122, 1, NULL, NULL, NULL),
(140, 101, 101, 'adjustment', 14.00, 8.97, 0.00, 125.58, NULL, 123, 1, NULL, NULL, NULL),
(141, 102, 102, 'adjustment', 8.00, 6.30, 0.00, 50.40, NULL, 124, 1, NULL, NULL, NULL),
(142, 103, 103, 'adjustment', 3.00, 12.27, 0.00, 36.81, NULL, 125, 1, NULL, NULL, NULL),
(143, 104, 104, 'adjustment', 24.00, 9.32, 0.00, 223.68, NULL, 126, 1, NULL, NULL, NULL),
(144, 105, 105, 'adjustment', 12.65, 12.65, 0.00, 160.02, NULL, 127, 1, NULL, NULL, NULL),
(145, 105, 105, 'adjustment', -12.65, 12.65, 0.00, -160.02, NULL, 128, 1, NULL, NULL, NULL),
(146, 105, 105, 'adjustment', 60.00, 12.65, 0.00, 759.00, NULL, 129, 1, NULL, NULL, NULL),
(147, 38, 38, 'adjustment', 5.00, 15.20, 0.00, 76.00, NULL, 130, 1, NULL, NULL, NULL),
(148, 106, 106, 'adjustment', 12.00, 18.22, 0.00, 218.64, NULL, 131, 1, NULL, NULL, NULL),
(149, 107, 107, 'adjustment', 36.00, 18.22, 0.00, 655.92, NULL, 132, 1, NULL, NULL, NULL),
(150, 73, 73, 'adjustment', -33.60, 26.60, 0.00, -893.76, NULL, 133, 1, NULL, NULL, NULL),
(151, 73, 73, 'adjustment', 7.00, 26.60, 0.00, 186.20, NULL, 134, 1, NULL, NULL, NULL),
(152, 108, 108, 'adjustment', 60.00, 3.10, 0.00, 186.00, NULL, 135, 1, NULL, NULL, NULL),
(153, 109, 109, 'adjustment', 90.00, 3.12, 0.00, 280.80, NULL, 136, 1, NULL, NULL, NULL),
(154, 110, 110, 'adjustment', 24.00, 9.88, 0.00, 237.12, NULL, 137, 1, NULL, NULL, NULL),
(155, 111, 111, 'adjustment', 24.00, 9.88, 0.00, 237.12, NULL, 138, 1, NULL, NULL, NULL),
(156, 112, 112, 'adjustment', 9.88, 9.88, 0.00, 97.61, NULL, 139, 1, NULL, NULL, NULL),
(157, 112, 112, 'adjustment', -9.88, 9.88, 0.00, -97.61, NULL, 140, 1, NULL, NULL, NULL),
(158, 112, 112, 'adjustment', 24.00, 9.88, 0.00, 237.12, NULL, 141, 1, NULL, NULL, NULL),
(159, 113, 113, 'adjustment', 24.00, 9.88, 0.00, 237.12, NULL, 142, 1, NULL, NULL, NULL),
(160, 114, 114, 'adjustment', 24.00, 9.88, 0.00, 237.12, NULL, 143, 1, NULL, NULL, NULL),
(161, 115, 115, 'adjustment', 24.00, 13.96, 0.00, 335.04, NULL, 144, 1, NULL, NULL, NULL),
(162, 116, 116, 'adjustment', 24.00, 15.48, 0.00, 371.52, NULL, 145, 1, NULL, NULL, NULL),
(163, 29, 29, 'adjustment', 24.00, 10.13, 0.00, 243.12, NULL, 146, 1, NULL, NULL, NULL),
(164, 42, 42, 'sales', -24.00, 7.23, 0.00, 173.52, NULL, 147, 0, NULL, '2020-02-17 20:51:37', '2020-02-17 20:51:37'),
(165, 112, 112, 'sales', -6.00, 9.88, 0.00, 59.28, NULL, 147, 0, NULL, '2020-02-17 20:51:37', '2020-02-17 20:51:37'),
(166, 114, 114, 'sales', -6.00, 9.88, 0.00, 59.28, NULL, 147, 0, NULL, '2020-02-17 20:51:37', '2020-02-17 20:51:37'),
(167, 73, 73, 'sales', -2.00, 26.60, 0.00, 53.20, NULL, 147, 0, NULL, '2020-02-17 20:51:37', '2020-02-17 20:51:37'),
(168, 13, 13, 'sales', -7.00, 10.75, 0.00, 75.25, NULL, 147, 0, NULL, '2020-02-17 20:51:37', '2020-02-17 20:51:37'),
(169, 12, 12, 'sales', -9.00, 6.55, 0.00, 58.95, NULL, 147, 0, NULL, '2020-02-17 20:51:37', '2020-02-17 20:51:37'),
(170, 11, 11, 'sales', -4.00, 4.10, 0.00, 16.40, NULL, 147, 0, NULL, '2020-02-17 20:51:37', '2020-02-17 20:51:37'),
(171, 9, 9, 'sales', -7.00, 8.00, 0.00, 56.00, NULL, 147, 0, NULL, '2020-02-17 20:51:37', '2020-02-17 20:51:37'),
(172, 107, 107, 'sales', -12.00, 18.22, 0.00, 218.64, NULL, 147, 0, NULL, '2020-02-17 20:51:37', '2020-02-17 20:51:37'),
(173, 77, 77, 'sales', -6.00, 5.80, 0.00, 34.80, NULL, 148, 0, NULL, '2020-02-17 20:55:30', '2020-02-17 20:55:30'),
(174, 43, 43, 'sales', -3.00, 30.50, 0.00, 91.50, NULL, 148, 0, NULL, '2020-02-17 20:55:30', '2020-02-17 20:55:30'),
(175, 10, 10, 'sales', -9.00, 4.65, 0.00, 41.85, NULL, 148, 0, NULL, '2020-02-17 20:55:30', '2020-02-17 20:55:30'),
(176, 40, 40, 'sales', -1.00, 25.00, 0.00, 25.00, NULL, 148, 0, NULL, '2020-02-17 20:55:30', '2020-02-17 20:55:30'),
(177, 71, 71, 'sales', -6.00, 11.92, 0.00, 71.52, NULL, 148, 0, NULL, '2020-02-17 20:55:30', '2020-02-17 20:55:30'),
(178, 70, 70, 'sales', -1.00, 12.00, 0.00, 12.00, NULL, 148, 0, NULL, '2020-02-17 20:55:30', '2020-02-17 20:55:30'),
(179, 73, 73, 'sales', -1.00, 26.60, 0.00, 26.60, NULL, 148, 0, NULL, '2020-02-17 20:55:30', '2020-02-17 20:55:30'),
(180, 13, 13, 'sales', -5.00, 10.75, 0.00, 53.75, NULL, 148, 0, NULL, '2020-02-17 20:55:30', '2020-02-17 20:55:30'),
(181, 12, 12, 'sales', -11.00, 6.55, 0.00, 72.05, NULL, 148, 0, NULL, '2020-02-17 20:55:30', '2020-02-17 20:55:30'),
(182, 58, 58, 'sales', -2.00, 4.32, 0.00, 8.64, NULL, 148, 0, NULL, '2020-02-17 20:55:30', '2020-02-17 20:55:30'),
(183, 6, 6, 'sales', -1.00, 110.00, 0.00, 110.00, NULL, 149, 0, NULL, '2020-02-18 00:25:13', '2020-02-18 00:25:13'),
(184, 4, 4, 'sales', -1.00, 40.00, 0.00, 40.00, NULL, 149, 0, NULL, '2020-02-18 00:25:13', '2020-02-18 00:25:13'),
(185, 3, 3, 'sales', -1.00, 15.00, 0.00, 15.00, NULL, 149, 0, NULL, '2020-02-18 00:25:13', '2020-02-18 00:25:13'),
(186, 10, 10, 'sales', -4.00, 4.65, 0.00, 18.60, NULL, 150, 0, NULL, '2020-02-18 00:25:51', '2020-02-18 00:25:51'),
(187, 102, 102, 'sales', -8.00, 6.30, 0.00, 50.40, NULL, 150, 0, NULL, '2020-02-18 00:25:51', '2020-02-18 00:25:51'),
(188, 27, 27, 'adjustment', 8.00, 16.27, 0.00, 130.16, NULL, 151, 1, NULL, NULL, NULL),
(189, 118, 118, 'adjustment', 12.00, 10.82, 0.00, 129.84, NULL, 152, 1, NULL, NULL, NULL),
(190, 119, 119, 'adjustment', 4.00, 17.25, 0.00, 69.00, NULL, 153, 1, NULL, NULL, NULL),
(191, 120, 120, 'adjustment', 9.00, 24.54, 0.00, 220.86, NULL, 154, 1, NULL, NULL, NULL),
(192, 121, 121, 'adjustment', 6.00, 6.57, 0.00, 39.42, NULL, 155, 1, NULL, NULL, NULL),
(193, 122, 122, 'adjustment', 6.00, 24.92, 0.00, 149.52, NULL, 156, 1, NULL, NULL, NULL),
(194, 103, 103, 'adjustment', 18.00, 12.27, 0.00, 220.86, NULL, 157, 1, NULL, NULL, NULL),
(195, 124, 124, 'adjustment', 6.00, 15.75, 0.00, 94.50, NULL, 158, 1, NULL, NULL, NULL),
(196, 123, 123, 'adjustment', 30.00, 10.35, 0.00, 310.50, NULL, 159, 1, NULL, NULL, NULL),
(197, 126, 126, 'adjustment', 14.00, 15.88, 0.00, 222.32, NULL, 160, 1, NULL, NULL, NULL),
(198, 127, 127, 'adjustment', 14.00, 9.84, 0.00, 137.76, NULL, 161, 1, NULL, NULL, NULL),
(199, 129, 129, 'adjustment', 6.00, 17.50, 0.00, 105.00, NULL, 162, 1, NULL, NULL, NULL),
(200, 130, 130, 'adjustment', 6.00, 20.25, 0.00, 121.50, NULL, 163, 1, NULL, NULL, NULL),
(201, 131, 131, 'receiving', 50.00, 10.00, 0.00, 500.00, NULL, 164, 0, NULL, '2020-02-21 00:56:22', '2020-02-21 00:56:22'),
(202, 131, 131, 'sales', -15.00, 10.00, 0.00, 150.00, NULL, 165, 0, NULL, '2020-02-21 00:58:25', '2020-02-21 00:58:25'),
(204, 131, 131, 'receiving', 7.00, 10.00, 0.00, 70.00, NULL, 166, 0, NULL, '2020-02-21 01:01:02', '2020-02-21 01:01:02'),
(205, 131, 131, 'receiving', 3.00, 10.00, 0.00, 30.00, NULL, 167, 0, NULL, '2020-02-21 01:05:03', '2020-02-21 01:05:03'),
(206, 47, 47, 'adjustment', 8.00, 16.54, 0.00, 132.32, NULL, 168, 1, NULL, NULL, NULL),
(207, 98, 98, 'adjustment', 25.00, 10.20, 0.00, 255.00, NULL, 169, 1, NULL, NULL, NULL),
(208, 119, 119, 'adjustment', 12.00, 17.25, 0.00, 207.00, NULL, 170, 1, NULL, NULL, NULL),
(209, 40, 40, 'adjustment', 12.00, 25.00, 0.00, 300.00, NULL, 171, 1, NULL, NULL, NULL),
(210, 77, 77, 'adjustment', 18.00, 5.80, 0.00, 104.40, NULL, 172, 1, NULL, NULL, NULL),
(211, 132, 132, 'adjustment', 20.00, 3.32, 0.00, 66.40, NULL, 173, 1, NULL, NULL, NULL),
(212, 134, 134, 'adjustment', 12.00, 7.60, 0.00, 91.20, NULL, 174, 1, NULL, NULL, NULL),
(213, 133, 133, 'adjustment', 12.00, 6.55, 0.00, 78.60, NULL, 175, 1, NULL, NULL, NULL),
(214, 135, 135, 'adjustment', 12.00, 6.55, 0.00, 78.60, NULL, 176, 1, NULL, NULL, NULL),
(215, 91, 91, 'adjustment', 16.00, 15.17, 0.00, 242.72, NULL, 177, 1, NULL, NULL, NULL),
(216, 136, 136, 'adjustment', 10.00, 6.10, 0.00, 61.00, NULL, 178, 1, NULL, NULL, NULL),
(217, 39, 39, 'adjustment', 16.00, 3.56, 0.00, 56.96, NULL, 179, 1, NULL, NULL, NULL),
(218, 102, 102, 'adjustment', 12.00, 6.30, 0.00, 75.60, NULL, 180, 1, NULL, NULL, NULL),
(219, 137, 137, 'adjustment', 6.00, 22.92, 0.00, 137.52, NULL, 181, 1, NULL, NULL, NULL),
(220, 138, 138, 'adjustment', 12.00, 20.41, 0.00, 244.92, NULL, 182, 1, NULL, NULL, NULL),
(221, 139, 139, 'adjustment', 16.00, 9.37, 0.00, 149.92, NULL, 183, 1, NULL, NULL, NULL),
(222, 140, 140, 'adjustment', 16.00, 10.59, 0.00, 169.44, NULL, 184, 1, NULL, NULL, NULL),
(223, 141, 141, 'adjustment', 12.00, 9.13, 0.00, 109.56, NULL, 185, 1, NULL, NULL, NULL),
(224, 142, 142, 'adjustment', 24.00, 8.50, 0.00, 204.00, NULL, 186, 1, NULL, NULL, NULL),
(225, 143, 143, 'adjustment', 15.00, 8.10, 0.00, 121.50, NULL, 187, 1, NULL, NULL, NULL),
(226, 98, 98, 'adjustment', -9.00, 10.20, 0.00, -91.80, NULL, 188, 1, NULL, NULL, NULL),
(227, 144, 144, 'adjustment', 6.00, 24.25, 0.00, 145.50, NULL, 189, 1, NULL, NULL, NULL),
(228, 12, 12, 'adjustment', 10.00, 6.55, 0.00, 65.50, NULL, 190, 1, NULL, NULL, NULL),
(229, 12, 12, 'adjustment', 10.00, 6.55, 0.00, 65.50, NULL, 191, 1, NULL, NULL, NULL),
(230, 13, 13, 'adjustment', 4.00, 10.75, 0.00, 43.00, NULL, 192, 1, NULL, NULL, NULL),
(231, 145, 145, 'adjustment', 20.00, 63.00, 0.00, 1260.00, NULL, 193, 1, NULL, NULL, NULL),
(232, 146, 146, 'adjustment', 6.00, 9.50, 0.00, 57.00, NULL, 194, 1, NULL, NULL, NULL),
(233, 147, 147, 'adjustment', 5.00, 12.90, 0.00, 64.50, NULL, 195, 1, NULL, NULL, NULL),
(234, 121, 121, 'adjustment', 18.00, 6.57, 0.00, 118.26, NULL, 196, 1, NULL, NULL, NULL),
(235, 148, 148, 'adjustment', 12.00, 11.72, 0.00, 140.64, NULL, 197, 1, NULL, NULL, NULL),
(236, 47, 47, 'adjustment', -6.00, 16.54, 0.00, -99.24, NULL, 198, 1, NULL, NULL, NULL),
(237, 84, 84, 'adjustment', 13.00, 9.80, 0.00, 127.40, NULL, 199, 1, NULL, NULL, NULL),
(238, 84, 84, 'adjustment', -2.00, 9.80, 0.00, -19.60, NULL, 200, 1, NULL, NULL, NULL),
(239, 86, 86, 'adjustment', -15.00, 3.10, 0.00, -46.50, NULL, 201, 1, NULL, NULL, NULL),
(240, 118, 118, 'adjustment', -12.00, 10.82, 0.00, -129.84, NULL, 202, 1, NULL, NULL, NULL),
(241, 119, 119, 'adjustment', -16.00, 17.25, 0.00, -276.00, NULL, 203, 1, NULL, NULL, NULL),
(242, 83, 83, 'adjustment', -10.00, 9.80, 0.00, -98.00, NULL, 204, 1, NULL, NULL, NULL),
(243, 84, 84, 'adjustment', -8.00, 9.80, 0.00, -78.40, NULL, 205, 1, NULL, NULL, NULL),
(244, 69, 69, 'adjustment', -10.00, 13.62, 0.00, -136.20, NULL, 206, 1, NULL, NULL, NULL),
(245, 69, 69, 'adjustment', -2.00, 13.62, 0.00, -27.24, NULL, 207, 1, NULL, NULL, NULL),
(246, 54, 54, 'adjustment', -10.00, 4.48, 0.00, -44.80, NULL, 208, 1, NULL, NULL, NULL),
(247, 9, 9, 'adjustment', -3.00, 8.00, 0.00, -24.00, NULL, 209, 1, NULL, NULL, NULL),
(248, 11, 11, 'adjustment', -26.00, 4.10, 0.00, -106.60, NULL, 210, 1, NULL, NULL, NULL),
(249, 7, 7, 'adjustment', -3.00, 19.11, 0.00, -57.33, NULL, 211, 1, NULL, NULL, NULL),
(250, 105, 105, 'adjustment', -36.00, 12.65, 0.00, -455.40, NULL, 212, 1, NULL, NULL, NULL),
(251, 5, 5, 'sales', -5.00, 0.08, 0.00, 0.40, NULL, 213, 0, NULL, '2020-02-29 20:17:36', '2020-02-29 20:17:36'),
(252, 149, 149, 'adjustment', 2.00, 106.80, 0.00, 213.60, NULL, 214, 1, NULL, NULL, NULL),
(253, 46, 46, 'adjustment', 42.00, 10.30, 0.00, 432.60, NULL, 215, 1, NULL, NULL, NULL),
(254, 150, 150, 'adjustment', 24.00, 12.30, 0.00, 295.20, NULL, 216, 1, NULL, NULL, NULL),
(255, 151, 151, 'adjustment', 24.00, 10.50, 0.00, 252.00, NULL, 217, 1, NULL, NULL, NULL),
(256, 92, 92, 'adjustment', 24.00, 18.98, 0.00, 455.52, NULL, 218, 1, NULL, NULL, NULL),
(257, 154, 154, 'adjustment', 12.00, 11.67, 0.00, 140.04, NULL, 219, 1, NULL, NULL, NULL),
(258, 155, 155, 'adjustment', 12.00, 11.17, 0.00, 134.04, NULL, 220, 1, NULL, NULL, NULL),
(259, 66, 66, 'adjustment', 6.00, 9.91, 0.00, 59.46, NULL, 221, 1, NULL, NULL, NULL),
(260, 156, 156, 'adjustment', 12.00, 31.60, 0.00, 379.20, NULL, 222, 1, NULL, NULL, NULL),
(261, 157, 157, 'adjustment', 3.00, 26.50, 0.00, 79.50, NULL, 223, 1, NULL, NULL, NULL),
(262, 158, 158, 'adjustment', 3.00, 22.50, 0.00, 67.50, NULL, 224, 1, NULL, NULL, NULL),
(263, 159, 159, 'adjustment', 3.00, 19.00, 0.00, 57.00, NULL, 225, 1, NULL, NULL, NULL),
(264, 160, 160, 'adjustment', 12.00, 22.95, 0.00, 275.40, NULL, 226, 1, NULL, NULL, NULL),
(265, 69, 69, 'adjustment', 24.00, 13.63, 0.00, 327.12, NULL, 227, 1, NULL, NULL, NULL),
(266, 161, 161, 'adjustment', 12.00, 15.75, 0.00, 189.00, NULL, 228, 1, NULL, NULL, NULL),
(267, 161, 161, 'adjustment', 12.00, 15.75, 0.00, 189.00, NULL, 229, 1, NULL, NULL, NULL),
(268, 162, 162, 'adjustment', 12.00, 15.75, 0.00, 189.00, NULL, 230, 1, NULL, NULL, NULL),
(269, 163, 163, 'adjustment', 24.00, 8.09, 0.00, 194.16, NULL, 231, 1, NULL, NULL, NULL),
(270, 49, 49, 'adjustment', 9.00, 7.64, 0.00, 68.76, NULL, 232, 1, NULL, NULL, NULL),
(271, 72, 72, 'adjustment', 11.00, 23.73, 0.00, 261.03, NULL, 233, 1, NULL, NULL, NULL),
(272, 97, 97, 'adjustment', 27.00, 9.54, 0.00, 257.58, NULL, 234, 1, NULL, NULL, NULL),
(273, 79, 79, 'adjustment', 45.00, 16.70, 0.00, 751.50, NULL, 235, 1, NULL, NULL, NULL),
(274, 57, 57, 'adjustment', 40.00, 8.69, 0.00, 347.60, NULL, 236, 1, NULL, NULL, NULL),
(275, 162, 162, 'adjustment', 12.00, 15.75, 0.00, 189.00, NULL, 237, 1, NULL, NULL, NULL),
(276, 161, 161, 'adjustment', -12.00, 15.75, 0.00, -189.00, NULL, 238, 1, NULL, NULL, NULL),
(277, 162, 162, 'adjustment', -12.00, 15.75, 0.00, -189.00, NULL, 239, 1, NULL, NULL, NULL),
(278, 164, 164, 'adjustment', 12.00, 15.75, 0.00, 189.00, NULL, 240, 1, NULL, NULL, NULL),
(279, 165, 165, 'adjustment', 12.00, 22.59, 0.00, 271.08, NULL, 241, 1, NULL, NULL, NULL),
(280, 102, 102, 'adjustment', 5.00, 6.30, 0.00, 31.50, NULL, 242, 1, NULL, NULL, NULL),
(281, 166, 166, 'adjustment', 24.00, 9.50, 0.00, 228.00, NULL, 243, 1, NULL, NULL, NULL),
(282, 167, 167, 'adjustment', 24.00, 9.50, 0.00, 228.00, NULL, 244, 1, NULL, NULL, NULL),
(283, 168, 168, 'adjustment', 40.00, 2.17, 0.00, 86.80, NULL, 245, 1, NULL, NULL, NULL),
(284, 3, 3, 'receiving', 5.00, 10.00, 0.00, 50.00, NULL, 246, 0, NULL, '2020-03-21 03:54:51', '2020-03-21 03:54:51'),
(285, 4, 4, 'receiving', 5.00, 20.00, 0.00, 100.00, NULL, 247, 0, NULL, '2020-03-21 03:55:43', '2020-03-21 03:55:43'),
(286, 8, 8, 'sales', -1.00, 12.00, 0.00, 12.00, NULL, 248, 0, NULL, '2020-03-21 04:05:14', '2020-03-21 04:05:14'),
(287, 9, 9, 'sales', -1.00, 8.00, 0.00, 8.00, NULL, 248, 0, NULL, '2020-03-21 04:05:14', '2020-03-21 04:05:14'),
(288, 13, 13, 'sales', -1.00, 10.75, 0.00, 10.75, NULL, 248, 0, NULL, '2020-03-21 04:05:14', '2020-03-21 04:05:14'),
(289, 5, 5, 'sales', -210.00, 0.08, 0.00, 16.80, NULL, 249, 0, NULL, '2020-03-21 04:23:36', '2020-03-21 04:23:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `paid` double(8,2) NOT NULL,
  `exchange` double(8,2) DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `date`, `paid`, `exchange`, `payment_method`, `options`, `order_id`, `cash_register_id`, `created_at`, `updated_at`) VALUES
(1, '2020-02-07', 80.00, 0.00, 1, 'a:0:{}', 1, 1, '2020-02-07 06:28:00', NULL),
(2, '2020-02-07', 50.00, 0.00, 1, 'a:0:{}', 2, 1, '2020-02-07 06:29:00', NULL),
(3, '2020-02-07', 0.00, 0.00, 1, 'a:0:{}', 3, 1, '2020-02-07 06:38:00', NULL),
(5, '2020-02-07', 100.00, 0.00, 1, 'a:0:{}', 4, 5, '2020-02-07 06:51:00', NULL),
(6, '2020-02-07', 25.00, 0.00, 1, 'a:0:{}', 5, 5, '2020-02-07 06:53:00', NULL),
(7, '2020-02-07', 20.00, 0.00, 1, 'a:0:{}', 6, 1, '2020-02-07 07:13:00', NULL),
(8, '2020-02-08', 48.00, 0.00, 1, 'a:0:{}', 7, 1, '2020-02-08 02:58:00', NULL),
(10, '2020-02-09', 12.00, 0.00, 1, 'a:0:{}', 8, 1, '2020-02-09 03:31:00', NULL),
(11, '2020-02-09', 50.00, 20.00, 1, 'a:0:{}', 9, 1, '2020-02-09 03:32:00', NULL),
(14, '2020-02-09', 34.00, 0.00, 1, 'a:0:{}', 10, 1, '2020-02-09 02:36:00', NULL),
(15, '2020-02-09', -34.00, 0.00, 1, 'a:0:{}', 11, 1, '2020-02-09 02:40:00', NULL),
(17, '2020-02-13', 24.00, 0.00, 1, 'a:0:{}', 12, 1, '2020-02-13 05:22:00', NULL),
(19, '2020-02-13', 100.00, 0.00, 1, 'a:0:{}', 13, 2, '2020-02-13 22:33:00', NULL),
(20, '2020-02-13', 30.00, 0.00, 1, 'a:0:{}', 14, 2, '2020-02-13 22:34:00', NULL),
(21, '2020-02-13', 500.00, 0.00, 1, 'a:0:{}', 15, 2, '2020-02-13 22:52:00', NULL),
(22, '2020-02-13', 80.00, 0.00, 1, 'a:0:{}', 16, 2, '2020-02-13 23:09:00', NULL),
(23, '2020-02-13', 2750.00, 0.00, 1, 'a:0:{}', 17, 2, '2020-02-13 23:09:00', NULL),
(24, '2020-02-13', 400.00, 0.00, 1, 'a:0:{}', 18, 2, '2020-02-13 23:19:00', NULL),
(25, '2020-02-13', 235.00, 0.00, 1, 'a:0:{}', 19, 2, '2020-02-13 23:30:00', NULL),
(26, '2020-02-13', 0.32, 0.00, 1, 'a:0:{}', 20, 2, '2020-02-13 23:30:00', NULL),
(27, '2020-02-13', 30.00, 0.00, 1, 'a:0:{}', 21, 2, '2020-02-14 00:50:00', NULL),
(28, '2020-02-14', 110.00, 0.00, 1, 'a:0:{}', 22, 5, '2020-02-14 01:03:00', NULL),
(29, '2020-02-16', 31.11, 0.00, 1, 'a:0:{}', 102, 3, '2020-02-16 01:40:00', NULL),
(30, '2020-02-17', 770.52, 0.00, 1, 'a:0:{}', 147, 3, '2020-02-17 21:51:00', NULL),
(31, '2020-02-17', 437.71, 0.00, 1, 'a:0:{}', 148, 3, '2020-02-17 21:55:00', NULL),
(32, '2020-02-17', 165.00, 0.00, 1, 'a:0:{}', 149, 5, '2020-02-18 01:25:00', NULL),
(33, '2020-02-18', 69.00, 0.00, 1, 'a:0:{}', 150, 3, '2020-02-18 01:25:00', NULL),
(34, '2020-02-21', 500.00, 0.00, 1, 'a:0:{}', 164, 7, '2020-02-21 01:56:00', NULL),
(35, '2020-02-21', 150.00, 0.00, 1, 'a:0:{}', 165, 7, '2020-02-21 01:58:00', NULL),
(37, '2020-02-21', 70.00, 0.00, 1, 'a:0:{}', 166, 5, '2020-02-21 02:01:00', NULL),
(38, '2020-02-21', 30.00, 0.00, 1, 'a:0:{}', 167, 6, '2020-02-21 02:05:00', NULL),
(39, '2020-02-29', 0.40, 0.00, 1, 'a:0:{}', 213, 5, '2020-02-29 21:17:00', NULL),
(40, '2020-03-21', 50.00, 0.00, 1, 'a:0:{}', 246, 5, '2020-03-21 04:54:00', NULL),
(41, '2020-03-21', 100.00, 0.00, 1, 'a:0:{}', 247, 5, '2020-03-21 04:55:00', NULL),
(42, '2020-03-21', 30.75, 0.00, 1, 'a:0:{}', 248, 7, '2020-03-21 05:05:00', NULL),
(43, '2020-03-21', 16.80, 0.00, 1, 'a:0:{}', 249, 2, '2020-03-21 05:23:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`, `type`, `status`, `is_default`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Efectivo', 'cash', 'near_half', 1, 1, NULL, '2020-03-30 23:35:52'),
(2, 'Tarjeta', 'credit', 'no_round', 0, 1, NULL, '2020-03-30 23:36:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `taxable` tinyint(4) NOT NULL DEFAULT '0',
  `tax_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_id` tinyint(1) DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `imageURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `category_id`, `brand_id`, `unit_id`, `group_id`, `taxable`, `tax_type`, `tax_id`, `product_type`, `branch_id`, `imageURL`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Agua mineral cristal', 2, 1, NULL, 1, 0, '', NULL, 'standard', NULL, 'no_image.png', 1, '2020-02-07 05:02:39', '2020-02-07 05:02:39'),
(2, 'Jugo de uva del valle', 2, 2, NULL, 1, 1, 'default', NULL, 'standard', NULL, 'no_image.png', 1, '2020-02-07 05:27:45', '2020-02-07 05:27:45'),
(3, 'tostadas', 2, 3, 1, 1, 0, '', NULL, 'standard', NULL, 'no_image.png', 1, '2020-02-13 22:27:40', '2020-02-13 22:27:40'),
(4, 'Desodorante v8', 4, 4, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-13 23:04:08', '2020-02-13 23:04:08'),
(5, 'Queso oaxaca gr', 3, NULL, 2, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-13 23:06:57', '2020-02-13 23:19:36'),
(6, 'Queso oaxaca kg', 3, NULL, NULL, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-13 23:18:52', '2020-02-13 23:18:52'),
(7, 'pinol 828 ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 16:28:18', '2020-02-15 16:28:18'),
(8, 'Pinol 500ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 16:54:50', '2020-02-15 16:54:50'),
(9, 'cloraluz 900ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 16:56:27', '2020-02-15 16:56:27'),
(10, 'cloraluz 500ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 16:57:35', '2020-02-15 16:57:35'),
(11, 'cloralex 250ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 17:01:30', '2020-02-15 17:01:30'),
(12, 'cloralex 500ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 17:06:40', '2020-02-15 17:06:40'),
(13, 'cloralex 950ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 17:24:42', '2020-02-15 17:26:40'),
(14, 'vanish gel 450ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 17:28:34', '2020-02-15 17:28:34'),
(15, 'flash 500ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 17:30:06', '2020-02-15 17:30:06'),
(16, 'Muriatex alamo 420ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 17:31:25', '2020-02-15 17:31:25'),
(17, 'Muriatex alamo 1L', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:04:04', '2020-02-15 18:04:44'),
(18, 'Jabon foca 250G', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:06:08', '2020-02-15 18:06:49'),
(19, 'Jabon blanca nieves 250g', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:08:09', '2020-02-15 18:08:09'),
(20, 'Jabon 1-2-3 suavizante y jazmin 900g', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:10:10', '2020-02-15 18:10:10'),
(21, 'Jabon princesa escamas 250g', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:13:23', '2020-02-15 18:13:23'),
(22, 'Fabuloso 500ml Mar fresco', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:15:07', '2020-02-15 18:15:07'),
(23, 'Fabuloso 1L', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:24:18', '2020-02-15 18:24:18'),
(24, 'suavitel fresca primavera 450ml', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:26:34', '2020-02-15 18:26:34'),
(25, 'Ariel  regular 500g', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:28:33', '2020-02-15 18:28:33'),
(26, 'Jabon axion 250g', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:30:30', '2020-02-15 18:30:30'),
(27, 'Ace regular 500', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:32:52', '2020-02-15 18:32:52'),
(28, 'Papel Hig regio', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:47:29', '2020-02-15 18:47:29'),
(29, 'Flamingo 4´s', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:50:38', '2020-02-15 18:50:38'),
(30, 'LYS 4´s', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:53:26', '2020-02-15 18:54:15'),
(31, 'Papel aluminio promax #7', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:57:40', '2020-02-15 18:57:40'),
(32, 'Choco krispis 290g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 18:59:06', '2020-02-15 18:59:06'),
(33, 'Cafe dolca 10g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:00:58', '2020-02-15 19:00:58'),
(34, 'Cafe clasico 14g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:02:06', '2020-02-15 19:02:06'),
(35, 'nescafe de caf 40g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:04:57', '2020-02-15 19:04:57'),
(36, 'Nescafe clasico 42g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:07:29', '2020-02-15 19:07:29'),
(37, 'Hot cakes 350g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:09:42', '2020-02-15 19:09:42'),
(38, 'Maizena 160g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:10:50', '2020-02-15 19:10:50'),
(39, 'Tang de piña', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:11:54', '2020-02-15 19:11:54'),
(40, 'Tulip 200g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:13:30', '2020-02-15 19:13:30'),
(41, 'Tulip 340g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:14:28', '2020-02-15 19:14:28'),
(42, 'Horchata deliciosa180ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:16:36', '2020-02-15 19:16:36'),
(43, 'Tajin 255g', 6, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:19:17', '2020-02-15 19:19:17'),
(44, 'Jugo maggi 100ml', 6, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:20:21', '2020-02-15 19:20:21'),
(45, 'Mole doña maria 360g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:22:56', '2020-02-15 19:22:56'),
(46, 'Lechera nestle 100g', 2, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:24:41', '2020-02-16 01:41:51'),
(47, 'Pure del fuerte 1kg', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:27:00', '2020-02-15 19:27:00'),
(48, 'Salsa catsup 408g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:28:07', '2020-02-15 19:28:07'),
(49, 'Salsa catsup 220g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:33:15', '2020-03-03 01:22:04'),
(50, 'Mc mayonesa tapa verde 210', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:35:06', '2020-02-15 19:35:06'),
(51, 'Mc mayonesa tapa verde 110g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:36:08', '2020-02-15 19:36:08'),
(52, 'itali pasta  codo rayado', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:38:49', '2020-02-15 19:38:49'),
(53, 'Mc moyonesa tapa verde 420g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:42:12', '2020-02-15 19:42:59'),
(54, 'itali pasta  codo mediano 200g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:46:44', '2020-02-15 19:46:44'),
(55, 'italipasta  caracol mediano 200g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:49:26', '2020-02-15 19:49:26'),
(56, 'la costeña rajas 105g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:52:12', '2020-02-15 19:52:12'),
(57, 'la costeña chipotles 105g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:53:32', '2020-02-15 19:53:32'),
(58, 'italipasta moño mediano 200g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:54:37', '2020-02-15 19:54:37'),
(59, 'La coste{a rajas 220g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:58:01', '2020-02-15 19:58:01'),
(60, 'La costeña jalapeños enteros 220g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 19:59:20', '2020-02-15 19:59:20'),
(61, 'la costeña chicharos 220g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:07:49', '2020-02-15 20:07:49'),
(62, 'La lechera nestle 387g', 2, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:10:18', '2020-02-16 01:41:41'),
(63, 'Ensalada de legumbres hdz 220g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:14:29', '2020-02-15 20:17:34'),
(64, 'ensalada de vegetales hdz 220g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:16:42', '2020-02-15 20:16:42'),
(65, 'La costeña salsa casera 220g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:19:36', '2020-02-15 20:19:36'),
(66, 'La costeña frijoles enteros negros 560g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:20:37', '2020-02-15 20:20:37'),
(67, 'La costeña frijoles negros refritos 440g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:21:47', '2020-02-15 20:21:47'),
(68, 'Salsa botanera 478g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:23:55', '2020-02-15 20:23:55'),
(69, 'Aceite 1-2-3 500ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:24:56', '2020-03-03 01:11:49'),
(70, 'Aceite cosinera 450ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:26:00', '2020-02-15 20:26:00'),
(71, 'Aceite  patrona 500ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:27:59', '2020-02-15 20:27:59'),
(72, 'Aceite patrona 1L', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:35:04', '2020-02-15 20:35:04'),
(73, 'Aceite 1-2-3 1L', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:36:34', '2020-02-16 01:47:20'),
(74, 'Aceite nutrioli 850ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:38:54', '2020-02-15 20:38:54'),
(75, 'Salsa guacamole 240g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:40:11', '2020-02-15 20:40:11'),
(76, 'Aceite nutrioli 400ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:41:03', '2020-02-15 20:41:03'),
(77, 'Pure del fuerte 210g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:42:59', '2020-02-15 20:42:59'),
(78, 'salsa verde del monte 210g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:44:01', '2020-02-15 20:44:01'),
(79, 'leche evaporada carnation clavel360g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:46:55', '2020-03-03 01:29:57'),
(80, 'vinagre blanco 500ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:49:42', '2020-02-15 20:49:42'),
(81, 'salsa taquera brava 210g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:50:51', '2020-02-15 20:50:51'),
(82, 'Vinagre blanco 1L', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:51:59', '2020-02-15 20:52:29'),
(83, 'azucar puritano 450g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:54:23', '2020-02-15 20:54:23'),
(84, 'Arroz puritano 450g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-15 20:55:55', '2020-02-15 20:55:55'),
(85, 'coca cola 2.5 RT', 7, 7, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 00:54:52', '2020-02-16 00:54:52'),
(86, 'Arroz puritano 250g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 00:57:14', '2020-02-16 00:57:14'),
(87, 'Azúcar puritano 900g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 00:58:37', '2020-02-16 00:58:37'),
(88, 'Leche nido 120g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 00:59:55', '2020-02-16 00:59:55'),
(89, 'leche nido kinder 144g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:01:13', '2020-02-16 01:01:13'),
(90, 'Avena molida 3min', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:03:05', '2020-02-16 01:03:05'),
(91, 'Chocomilk 160g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:04:26', '2020-02-16 01:04:26'),
(92, 'Chocokiwi 350g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:05:49', '2020-02-16 01:05:49'),
(93, 'Avena rivero entera 250g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:07:12', '2020-02-16 01:07:12'),
(94, 'Nutri rinde 240g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:08:57', '2020-02-16 01:08:57'),
(95, 'Arroz puritano 900g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:10:18', '2020-02-16 01:10:18'),
(96, 'Frijol puritano 450g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:14:49', '2020-02-16 01:14:49'),
(97, 'Media crema lala', 6, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:16:13', '2020-02-16 01:16:13'),
(98, 'Salsa valentina370ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:18:57', '2020-02-16 01:18:57'),
(99, 'Mostaza 226g', 6, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:22:14', '2020-02-16 01:22:32'),
(100, 'Mole doña maría 235g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:25:13', '2020-02-16 01:25:13'),
(101, 'sal de mar 1kg', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:28:34', '2020-02-16 01:28:34'),
(102, 'la costeña frijoles negros refritos 220g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:32:12', '2020-02-16 01:32:12'),
(103, 'frijoles isadora  Refritos negros 430g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:33:43', '2020-02-16 01:33:43'),
(104, 'Gel xtreme 250g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:36:54', '2020-02-16 01:36:54'),
(105, 'leche nutrileche 1L', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:38:20', '2020-02-16 01:38:20'),
(106, 'leche lala entera 1L', 6, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:44:36', '2020-02-16 01:44:36'),
(107, 'leche lala deslactosada', 6, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:46:14', '2020-02-16 01:46:14'),
(108, 'pañal suavelastick grande 1pz', 4, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:51:32', '2020-02-16 01:52:55'),
(109, 'pañal suavelastick jumbo 1pz', 4, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 01:54:34', '2020-02-16 01:54:34'),
(110, 'sopa knorr coditos', 2, 8, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 02:00:53', '2020-02-16 02:02:10'),
(111, 'sopa knorr estrella', 2, 8, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 02:03:09', '2020-02-16 02:03:09'),
(112, 'sopa knorr letras', 2, 8, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 02:04:30', '2020-02-16 02:04:30'),
(113, 'sopa knorr fideos con pollo', 2, 8, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 02:07:10', '2020-02-16 02:07:10'),
(114, 'sopa knorr fideos', 2, 8, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 02:08:29', '2020-02-16 02:08:29'),
(115, 'Coca-cola 1.5', 7, 7, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 02:12:28', '2020-02-16 02:12:28'),
(116, 'coca cola 1.25', 7, 7, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 02:14:21', '2020-02-16 02:14:21'),
(117, 'coca-cola 1.75 desechable', 7, 7, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-16 02:20:31', '2020-02-16 02:20:31'),
(118, 'Mc mayonesa tapa roja 110g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 01:09:06', '2020-02-20 01:09:06'),
(119, 'Mc mayonesa tapa roja 190g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 01:11:52', '2020-02-20 01:11:52'),
(120, 'Mc mayonesa tapa roja 390g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 01:15:50', '2020-02-20 01:15:50'),
(121, 'fideos dónde  200g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 01:45:32', '2020-02-20 01:45:32'),
(122, 'Papel aluminio alumex 50m', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 01:52:10', '2020-02-20 01:52:10'),
(123, 'sal sol 500g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 01:56:09', '2020-02-20 01:56:09'),
(124, 'axion liquido 400g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 02:02:19', '2020-02-20 02:02:19'),
(125, 'axion liquido 280ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 02:05:23', '2020-02-20 02:05:23'),
(126, 'Axion en polvo 500g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 02:07:49', '2020-02-20 02:07:49'),
(127, 'Media crema alpura 250ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 02:12:52', '2020-02-20 02:12:52'),
(128, 'italpasta pluma grande 200g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 02:16:00', '2020-02-20 02:16:00'),
(129, 'downy aroma floral 600ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 02:19:19', '2020-02-20 02:19:19'),
(130, 'suavitel complete acqua 800ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-20 02:21:53', '2020-02-20 02:21:53'),
(131, 'Producto de prueba para transferir', 8, 9, 4, 1, 0, '', NULL, 'standard', NULL, 'no_image.png', 1, '2020-02-21 00:53:14', '2020-02-21 00:53:14'),
(132, 'chocomilk 22g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 00:57:29', '2020-02-26 00:57:29'),
(133, 'maruchan con camaron, limon y habanero', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:00:09', '2020-02-26 01:00:09'),
(134, 'sopa nissin hot sauce con camaron', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:01:34', '2020-02-26 01:01:34'),
(135, 'maruchan con camaron y chile piquin', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:03:51', '2020-02-26 01:03:51'),
(136, 'nestea te negro sabor limon 25g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:09:29', '2020-02-26 01:09:29'),
(137, 'toallas humedas absorsec 120 pzas', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:19:37', '2020-02-26 01:19:37'),
(138, 'toallas suavelastic 70 piezas', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:22:56', '2020-02-26 01:22:56'),
(139, 'pañal abosorsec grande cont. 3 pzas', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:28:21', '2020-02-26 01:28:21'),
(140, 'pañal absorsec jumbo cont. 3 piezas', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:33:00', '2020-02-26 01:33:00'),
(141, 'kiwi colorfiel 60ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:36:44', '2020-02-26 01:36:44'),
(142, 'ace 250g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:42:29', '2020-02-26 01:42:29'),
(143, 'pinol 250ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:49:58', '2020-02-26 01:49:58'),
(144, 'headyshoulders 2 en 1 / 180ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:53:57', '2020-02-26 01:53:57'),
(145, 'cigarros', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 01:58:56', '2020-02-26 01:58:56'),
(146, 'harina sol de oro 1k', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 02:06:00', '2020-02-26 02:06:00'),
(147, 'Mazeca 1k', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 02:07:08', '2020-02-26 02:07:08'),
(148, 'suavel 4´s', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-02-26 02:14:15', '2020-02-26 02:14:15'),
(149, 'papel suavel 40rollos', 2, 6, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-02 21:19:06', '2020-03-02 21:19:06'),
(150, 'frijoles refritos bayos isadora 430g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 00:00:29', '2020-03-03 00:00:29'),
(151, 'la lechera 190g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 00:06:44', '2020-03-03 00:06:44'),
(152, 'la lechera 90g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 00:12:41', '2020-03-03 00:12:41'),
(153, 'chocokiwi 180g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 00:14:21', '2020-03-03 00:14:21'),
(154, 'frijoles la costeña negros refritos 580g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 00:52:26', '2020-03-03 00:52:26'),
(155, 'gel ego atraction', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 00:54:12', '2020-03-03 00:54:12'),
(156, 'chiles jalapeños rellenos de picadillo 380g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:00:59', '2020-03-03 01:00:59'),
(157, 'zucaritas 260g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:02:37', '2020-03-03 01:02:37'),
(158, 'nesquik', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:05:29', '2020-03-03 01:05:29'),
(159, 'cereal quaker multibran 220g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:07:39', '2020-03-03 01:07:39'),
(160, 'aceite cocinera de 1 lt', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:09:55', '2020-03-03 01:09:55'),
(161, 'electrolit sabor uva 625ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:14:05', '2020-03-03 01:14:05'),
(162, 'electrolit sabor naranja 625ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:15:33', '2020-03-03 01:37:31'),
(163, 'pure de tomate 345g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:17:31', '2020-03-03 01:17:31'),
(164, 'electrolit sabor fresa 625ml', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:39:30', '2020-03-03 01:39:30'),
(165, 'coffe mate 160g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:41:36', '2020-03-03 01:41:36'),
(166, 'fibra scotch brite c/esponja', 5, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:49:45', '2020-03-03 01:56:45'),
(167, 'fibra scocht brite verde s/esponja', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 01:54:16', '2020-03-03 01:55:24'),
(168, 'recado rojo 25g', 2, 5, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 3, '2020-03-03 02:03:40', '2020-03-03 02:03:40'),
(169, 'producto nuevo', 2, 1, 1, NULL, 0, '', NULL, 'standard', NULL, 'no_image.png', 5, '2020-03-31 02:28:20', '2020-03-31 02:28:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `values` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_brands`
--

CREATE TABLE `product_brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product_brands`
--

INSERT INTO `product_brands` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Cristal', 1, '2020-02-07 05:01:42', '2020-02-07 05:01:42'),
(2, 'Del valle', 1, '2020-02-07 05:26:53', '2020-02-07 05:26:53'),
(3, 'Del hogar', 1, '2020-02-13 22:25:01', '2020-02-13 22:25:01'),
(4, 'rexona', 3, '2020-02-13 23:03:39', '2020-02-13 23:03:39'),
(5, 'Donosusa', 3, '2020-02-15 16:22:00', '2020-02-15 16:22:00'),
(6, 'sam´s club', 3, '2020-02-15 19:18:29', '2020-02-15 19:18:29'),
(7, 'Coca-cola', 3, '2020-02-16 00:52:14', '2020-02-16 00:52:14'),
(8, 'Merza', 3, '2020-02-16 02:00:30', '2020-02-16 02:00:30'),
(9, 'prueba', 1, '2020-02-21 00:51:52', '2020-02-21 00:51:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Abarrotes', 1, '2020-02-07 11:01:32', '2020-02-07 11:01:32'),
(3, 'Cremeria', 1, '2020-02-14 04:28:21', '2020-02-14 04:28:21'),
(4, 'farmacia', 3, '2020-02-14 05:03:30', '2020-02-14 05:03:30'),
(5, 'Detergentes', 3, '2020-02-15 22:20:26', '2020-02-15 22:20:26'),
(6, 'sam´s club', 3, '2020-02-16 01:17:42', '2020-02-16 01:17:42'),
(7, 'bebidas', 3, '2020-02-16 06:51:59', '2020-02-16 06:51:59'),
(8, 'prueba', 1, '2020-02-21 06:51:42', '2020-02-21 06:51:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_groups`
--

CREATE TABLE `product_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product_groups`
--

INSERT INTO `product_groups` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Prueba AKI', 0, '2020-02-21 00:52:35', '2020-02-21 00:52:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_units`
--

CREATE TABLE `product_units` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product_units`
--

INSERT INTO `product_units` (`id`, `name`, `short_name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'pieza', 'pza', 0, '2020-02-14 04:25:37', '2020-02-14 04:25:37'),
(2, 'gramo', 'gr', 0, '2020-02-14 05:06:27', '2020-02-14 05:06:27'),
(3, 'kilo', 'kg', 0, '2020-02-14 05:18:31', '2020-02-14 05:18:31'),
(4, 'prueba', 'prueba', 0, '2020-02-21 06:52:44', '2020-02-21 06:52:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variant_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute_values` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `variant_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `isNotify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imageURL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no_image.png',
  `bar_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `re_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product_variants`
--

INSERT INTO `product_variants` (`id`, `sku`, `product_id`, `variant_title`, `attribute_values`, `variant_details`, `purchase_price`, `selling_price`, `enabled`, `isNotify`, `imageURL`, `bar_code`, `re_order`, `created_at`, `updated_at`) VALUES
(1, '123123123', 1, 'default_variant', 'default_variant', NULL, 11, 12, 1, NULL, 'no_image.png', 'qwertyuiop', 10, '2020-02-07 05:02:39', '2020-02-07 05:02:39'),
(2, '122122', 2, 'default_variant', 'default_variant', NULL, 7, 10, 1, NULL, 'no_image.png', '41414141414', 10, '2020-02-07 05:27:45', '2020-02-07 05:27:45'),
(3, NULL, 3, 'default_variant', 'default_variant', NULL, 14, 15, 1, NULL, 'no_image.png', '7501000106936', 10, '2020-02-13 22:27:40', '2020-02-13 22:27:40'),
(4, NULL, 4, 'default_variant', 'default_variant', NULL, 20, 40, 1, NULL, 'no_image.png', '7791293022567', 10, '2020-02-13 23:04:08', '2020-02-13 23:04:08'),
(5, NULL, 5, 'default_variant', 'default_variant', NULL, 0.05, 0.08, 1, NULL, 'no_image.png', '101', 10, '2020-02-13 23:06:57', '2020-02-13 23:19:36'),
(6, NULL, 6, 'default_variant', 'default_variant', NULL, 80, 110, 1, NULL, 'no_image.png', NULL, 10, '2020-02-13 23:18:52', '2020-02-13 23:18:52'),
(7, NULL, 7, 'default_variant', 'default_variant', NULL, 19.11, 19.11, 1, NULL, 'no_image.png', '7501025403485', 10, '2020-02-15 16:28:18', '2020-02-15 16:28:18'),
(8, NULL, 8, 'default_variant', 'default_variant', NULL, 12, 12, 1, NULL, 'no_image.png', '7501025403027', 10, '2020-02-15 16:54:50', '2020-02-15 16:54:50'),
(9, NULL, 9, 'default_variant', 'default_variant', NULL, 8, 8, 1, NULL, 'no_image.png', '7501025401252', 10, '2020-02-15 16:56:27', '2020-02-15 16:56:27'),
(10, NULL, 10, 'default_variant', 'default_variant', NULL, 4.65, 4.65, 1, NULL, 'no_image.png', '7501025401245', 10, '2020-02-15 16:57:35', '2020-02-15 16:57:35'),
(11, NULL, 11, 'default_variant', 'default_variant', NULL, 4.1, 4.1, 1, NULL, 'no_image.png', '75000592', 10, '2020-02-15 17:01:30', '2020-02-15 17:01:30'),
(12, NULL, 12, 'default_variant', 'default_variant', NULL, 6.55, 6.55, 1, NULL, 'no_image.png', '75000608', 10, '2020-02-15 17:06:40', '2020-02-15 17:06:40'),
(13, NULL, 13, 'default_variant', 'default_variant', NULL, 10.75, 10.75, 1, NULL, 'no_image.png', '75000615', 10, '2020-02-15 17:24:42', '2020-02-15 17:26:40'),
(14, NULL, 14, 'default_variant', 'default_variant', NULL, 19.5, 19.5, 1, NULL, 'no_image.png', '7501058752772', 10, '2020-02-15 17:28:34', '2020-02-15 17:28:34'),
(15, NULL, 15, 'default_variant', 'default_variant', NULL, 7.5, 7.5, 1, NULL, 'no_image.png', '7501025434021', 10, '2020-02-15 17:30:06', '2020-02-15 17:30:06'),
(16, NULL, 16, 'default_variant', 'default_variant', NULL, 11.2, 11.2, 1, NULL, 'no_image.png', '75006082', 10, '2020-02-15 17:31:25', '2020-02-15 17:31:25'),
(17, NULL, 17, 'default_variant', 'default_variant', NULL, 22.38, 22.38, 1, NULL, 'no_image.png', '7501042300439', 10, '2020-02-15 18:04:04', '2020-02-15 18:04:44'),
(18, NULL, 18, 'default_variant', 'default_variant', NULL, 7.58, 7.58, 1, NULL, 'no_image.png', '7501026026577', 10, '2020-02-15 18:06:08', '2020-02-15 18:06:49'),
(19, NULL, 19, 'default_variant', 'default_variant', NULL, 7.1, 7.1, 1, NULL, 'no_image.png', '7501026027550', 10, '2020-02-15 18:08:09', '2020-02-15 18:08:09'),
(20, NULL, 20, 'default_variant', 'default_variant', NULL, 17.5, 17.5, 1, NULL, 'no_image.png', '7501199410913', 10, '2020-02-15 18:10:10', '2020-02-15 18:10:10'),
(21, NULL, 21, 'default_variant', 'default_variant', NULL, 9.3, 9.3, 1, NULL, 'no_image.png', '7502251525521', 10, '2020-02-15 18:13:23', '2020-02-15 18:13:23'),
(22, NULL, 22, 'default_variant', 'default_variant', NULL, 12.5, 12.5, 1, NULL, 'no_image.png', '75001186', 10, '2020-02-15 18:15:07', '2020-02-15 18:15:07'),
(23, NULL, 23, 'default_variant', 'default_variant', NULL, 17.25, 17.25, 1, NULL, 'no_image.png', '7501035910096', 10, '2020-02-15 18:24:18', '2020-02-15 18:24:18'),
(24, NULL, 24, 'default_variant', 'default_variant', NULL, 13.79, 13.79, 1, NULL, 'no_image.png', '7509546017808', 10, '2020-02-15 18:26:34', '2020-02-15 18:26:34'),
(25, NULL, 25, 'default_variant', 'default_variant', NULL, 16.77, 16.77, 1, NULL, 'no_image.png', '7501007455730', 10, '2020-02-15 18:28:33', '2020-02-15 18:28:33'),
(26, NULL, 26, 'default_variant', 'default_variant', NULL, 8.96, 8.96, 1, NULL, 'no_image.png', '7509546018911', 10, '2020-02-15 18:30:30', '2020-02-15 18:30:30'),
(27, NULL, 27, 'default_variant', 'default_variant', NULL, 16.27, 16.27, 1, NULL, 'no_image.png', '7501007445557', 10, '2020-02-15 18:32:52', '2020-02-15 18:32:52'),
(28, NULL, 28, 'default_variant', 'default_variant', NULL, 18, 18, 1, NULL, 'no_image.png', '7501036622127', 10, '2020-02-15 18:47:29', '2020-02-15 18:47:29'),
(29, NULL, 29, 'default_variant', 'default_variant', NULL, 10.13, 10.13, 1, NULL, 'no_image.png', '7501017376476', 10, '2020-02-15 18:50:38', '2020-02-15 18:50:38'),
(30, NULL, 30, 'default_variant', 'default_variant', NULL, 10.12, 10.12, 1, NULL, 'no_image.png', '7501017364695', 10, '2020-02-15 18:53:26', '2020-02-15 18:54:15'),
(31, NULL, 31, 'default_variant', 'default_variant', NULL, 5.71, 5.71, 1, NULL, 'no_image.png', '7503010473558', 10, '2020-02-15 18:57:40', '2020-02-15 18:57:40'),
(32, NULL, 32, 'default_variant', 'default_variant', NULL, 28.83, 28.83, 1, NULL, 'no_image.png', '7501008018125', 10, '2020-02-15 18:59:06', '2020-02-15 18:59:06'),
(33, NULL, 33, 'default_variant', 'default_variant', NULL, 4.74, 4.74, 1, NULL, 'no_image.png', '7501059292406', 10, '2020-02-15 19:00:58', '2020-02-15 19:00:58'),
(34, NULL, 34, 'default_variant', 'default_variant', NULL, 7.31, 7.31, 1, NULL, 'no_image.png', '7501000911783', 10, '2020-02-15 19:02:06', '2020-02-15 19:02:06'),
(35, NULL, 35, 'default_variant', 'default_variant', NULL, 21.5, 21.5, 1, NULL, 'no_image.png', '7501058628466', 10, '2020-02-15 19:04:57', '2020-02-15 19:04:57'),
(36, NULL, 36, 'default_variant', 'default_variant', NULL, 21.32, 21.32, 1, NULL, 'no_image.png', '7501000912803', 10, '2020-02-15 19:07:29', '2020-02-15 19:07:29'),
(37, NULL, 37, 'default_variant', 'default_variant', NULL, 16.32, 16.32, 1, NULL, 'no_image.png', '7501200483127', 10, '2020-02-15 19:09:42', '2020-02-15 19:09:42'),
(38, NULL, 38, 'default_variant', 'default_variant', NULL, 15.2, 15.2, 1, NULL, 'no_image.png', '7501005110389', 10, '2020-02-15 19:10:50', '2020-02-15 19:10:50'),
(39, NULL, 39, 'default_variant', 'default_variant', NULL, 3.56, 3.56, 1, NULL, 'no_image.png', '7622210254610', 10, '2020-02-15 19:11:54', '2020-02-15 19:11:54'),
(40, NULL, 40, 'default_variant', 'default_variant', NULL, 25, 25, 1, NULL, 'no_image.png', '5762385061223', 10, '2020-02-15 19:13:30', '2020-02-15 19:13:30'),
(41, NULL, 41, 'default_variant', 'default_variant', NULL, 36.92, 36.92, 1, NULL, 'no_image.png', '5762385061230', 10, '2020-02-15 19:14:28', '2020-02-15 19:14:28'),
(42, NULL, 42, 'default_variant', 'default_variant', NULL, 7.23, 7.23, 1, NULL, 'no_image.png', '7501088013218', 10, '2020-02-15 19:16:36', '2020-02-15 19:16:36'),
(43, NULL, 43, 'default_variant', 'default_variant', NULL, 30.5, 30.5, 1, NULL, 'no_image.png', '633148101027', 10, '2020-02-15 19:19:17', '2020-02-15 19:19:17'),
(44, NULL, 44, 'default_variant', 'default_variant', NULL, 21.77, 21.77, 1, NULL, 'no_image.png', '7501001604103', 10, '2020-02-15 19:20:21', '2020-02-15 19:20:21'),
(45, NULL, 45, 'default_variant', 'default_variant', NULL, 15, 15, 1, NULL, 'no_image.png', '7501003100085', 10, '2020-02-15 19:22:56', '2020-02-15 19:22:56'),
(46, NULL, 46, 'default_variant', 'default_variant', NULL, 10.3, 10.3, 1, NULL, 'no_image.png', '7501059211209', 10, '2020-02-15 19:24:41', '2020-02-16 01:41:51'),
(47, NULL, 47, 'default_variant', 'default_variant', NULL, 16.54, 16.54, 1, NULL, 'no_image.png', '7501079702848', 10, '2020-02-15 19:27:00', '2020-02-15 19:27:00'),
(48, NULL, 48, 'default_variant', 'default_variant', NULL, 11.27, 11.27, 1, NULL, 'no_image.png', '7501052472102', 10, '2020-02-15 19:28:07', '2020-02-15 19:28:07'),
(49, NULL, 49, 'default_variant', 'default_variant', NULL, 7.64, 7.64, 1, NULL, 'no_image.png', '7501052472195', 10, '2020-02-15 19:33:15', '2020-03-03 01:22:04'),
(50, NULL, 50, 'default_variant', 'default_variant', NULL, 12.5, 12.5, 1, NULL, 'no_image.png', '7501003334329', 10, '2020-02-15 19:35:06', '2020-02-15 19:35:06'),
(51, NULL, 51, 'default_variant', 'default_variant', NULL, 8, 8, 1, NULL, 'no_image.png', '7501003300829', 10, '2020-02-15 19:36:08', '2020-02-15 19:36:08'),
(52, NULL, 52, 'default_variant', 'default_variant', NULL, 5.12, 5.12, 1, NULL, 'no_image.png', '7501079016457', 10, '2020-02-15 19:38:49', '2020-02-15 19:38:49'),
(53, NULL, 53, 'default_variant', 'default_variant', NULL, 22.75, 22.75, 1, NULL, 'no_image.png', '7501003334336', 10, '2020-02-15 19:42:12', '2020-02-15 19:42:59'),
(54, NULL, 54, 'default_variant', 'default_variant', NULL, 4.48, 4.48, 1, NULL, 'no_image.png', '7501079016440', 10, '2020-02-15 19:46:44', '2020-02-15 19:46:44'),
(55, NULL, 55, 'default_variant', 'default_variant', NULL, 4.51, 4.51, 1, NULL, 'no_image.png', '7501079016426', 10, '2020-02-15 19:49:26', '2020-02-15 19:49:26'),
(56, NULL, 56, 'default_variant', 'default_variant', NULL, 5.13, 5.13, 1, NULL, 'no_image.png', '7501017006014', 10, '2020-02-15 19:52:12', '2020-02-15 19:52:12'),
(57, NULL, 57, 'default_variant', 'default_variant', NULL, 8.69, 8.69, 1, NULL, 'no_image.png', '7501017006021', 10, '2020-02-15 19:53:32', '2020-02-15 19:53:32'),
(58, NULL, 58, 'default_variant', 'default_variant', NULL, 4.32, 4.32, 1, NULL, 'no_image.png', '7501079016143', 10, '2020-02-15 19:54:37', '2020-02-15 19:54:37'),
(59, NULL, 59, 'default_variant', 'default_variant', NULL, 8.82, 8.82, 1, NULL, 'no_image.png', '7501017005024', 10, '2020-02-15 19:58:01', '2020-02-15 19:58:01'),
(60, NULL, 60, 'default_variant', 'default_variant', NULL, 7.3, 7.3, 1, NULL, 'no_image.png', '7501017005000', 10, '2020-02-15 19:59:20', '2020-02-15 19:59:20'),
(61, NULL, 61, 'default_variant', 'default_variant', NULL, 6.75, 6.75, 1, NULL, 'no_image.png', '7501017005314', 10, '2020-02-15 20:07:49', '2020-02-15 20:07:49'),
(62, NULL, 62, 'default_variant', 'default_variant', NULL, 17.5, 17.5, 1, NULL, 'no_image.png', '7501058617873', 10, '2020-02-15 20:10:18', '2020-02-16 01:41:41'),
(63, NULL, 63, 'default_variant', 'default_variant', NULL, 6.6, 6.6, 1, NULL, 'no_image.png', '7501003124333', 10, '2020-02-15 20:14:29', '2020-02-15 20:17:34'),
(64, NULL, 64, 'default_variant', 'default_variant', NULL, 7.19, 7.19, 1, NULL, 'no_image.png', '7501003124319', 10, '2020-02-15 20:16:42', '2020-02-15 20:16:42'),
(65, NULL, 65, 'default_variant', 'default_variant', NULL, 7.27, 7.27, 1, NULL, 'no_image.png', '7501017005079', 10, '2020-02-15 20:19:36', '2020-02-15 20:19:36'),
(66, NULL, 66, 'default_variant', 'default_variant', NULL, 9.91, 9.91, 1, NULL, 'no_image.png', '7501017004294', 10, '2020-02-15 20:20:37', '2020-02-15 20:20:37'),
(67, NULL, 67, 'default_variant', 'default_variant', NULL, 10.35, 10.35, 1, NULL, 'no_image.png', '7501017040995', 10, '2020-02-15 20:21:47', '2020-02-15 20:21:47'),
(68, NULL, 68, 'default_variant', 'default_variant', NULL, 9.5, 9.5, 1, NULL, 'no_image.png', '738545010030', 10, '2020-02-15 20:23:55', '2020-02-15 20:23:55'),
(69, NULL, 69, 'default_variant', 'default_variant', NULL, 13.63, 13.63, 1, NULL, 'no_image.png', '75005443', 10, '2020-02-15 20:24:56', '2020-03-03 01:11:49'),
(70, NULL, 70, 'default_variant', 'default_variant', NULL, 12, 12, 1, NULL, 'no_image.png', '7502218210804', 10, '2020-02-15 20:26:00', '2020-02-15 20:26:00'),
(71, NULL, 71, 'default_variant', 'default_variant', NULL, 11.92, 11.92, 1, NULL, 'no_image.png', '7501060500026', 10, '2020-02-15 20:27:59', '2020-02-15 20:27:59'),
(72, NULL, 72, 'default_variant', 'default_variant', NULL, 23.73, 23.73, 1, NULL, 'no_image.png', '7501060500019', 10, '2020-02-15 20:35:04', '2020-02-15 20:35:04'),
(73, NULL, 73, 'default_variant', 'default_variant', NULL, 26.6, 26.6, 1, NULL, 'no_image.png', '75002343', 10, '2020-02-15 20:36:34', '2020-02-16 01:47:20'),
(74, NULL, 74, 'default_variant', 'default_variant', NULL, 24.42, 24.42, 1, NULL, 'no_image.png', '7501039121610', 10, '2020-02-15 20:38:54', '2020-02-15 20:38:54'),
(75, NULL, 75, 'default_variant', 'default_variant', NULL, 19.52, 19.52, 1, NULL, 'no_image.png', '7501003105431', 10, '2020-02-15 20:40:11', '2020-02-15 20:40:11'),
(76, NULL, 76, 'default_variant', 'default_variant', NULL, 13.8, 13.8, 1, NULL, 'no_image.png', '7501039121993', 10, '2020-02-15 20:41:03', '2020-02-15 20:41:03'),
(77, NULL, 77, 'default_variant', 'default_variant', NULL, 5.8, 5.8, 1, NULL, 'no_image.png', '7501079702817', 10, '2020-02-15 20:42:59', '2020-02-15 20:42:59'),
(78, NULL, 78, 'default_variant', 'default_variant', NULL, 8.33, 8.33, 1, NULL, 'no_image.png', '75014469', 10, '2020-02-15 20:44:01', '2020-02-15 20:44:01'),
(79, NULL, 79, 'default_variant', 'default_variant', NULL, 13.62, 13.62, 1, NULL, 'no_image.png', '7501058611062', 8, '2020-02-15 20:46:55', '2020-03-03 01:29:57'),
(80, NULL, 80, 'default_variant', 'default_variant', NULL, 7.84, 7.84, 1, NULL, 'no_image.png', '7501052475004', 10, '2020-02-15 20:49:42', '2020-02-15 20:49:42'),
(81, NULL, 81, 'default_variant', 'default_variant', NULL, 7.84, 7.84, 1, NULL, 'no_image.png', '75014452', 10, '2020-02-15 20:50:51', '2020-02-15 20:50:51'),
(82, NULL, 82, 'default_variant', 'default_variant', NULL, 10.83, 10.83, 1, NULL, 'no_image.png', '7501052475011', 10, '2020-02-15 20:51:59', '2020-02-15 20:52:29'),
(83, NULL, 83, 'default_variant', 'default_variant', NULL, 9.8, 9.8, 1, NULL, 'no_image.png', '7501533611471', 10, '2020-02-15 20:54:23', '2020-02-15 20:54:23'),
(84, NULL, 84, 'default_variant', 'default_variant', NULL, 9.8, 9.8, 1, NULL, 'no_image.png', '7501533610917', 10, '2020-02-15 20:55:55', '2020-02-15 20:55:55'),
(85, NULL, 85, 'default_variant', 'default_variant', NULL, 24.4, 24.4, 1, NULL, 'no_image.png', '7501055310227', 10, '2020-02-16 00:54:52', '2020-02-16 00:54:52'),
(86, NULL, 86, 'default_variant', 'default_variant', NULL, 3.1, 3.1, 1, NULL, 'no_image.png', '7501533610955', 10, '2020-02-16 00:57:14', '2020-02-16 00:57:14'),
(87, NULL, 87, 'default_variant', 'default_variant', NULL, 18.8, 18.8, 1, NULL, 'no_image.png', '7501533611402', 10, '2020-02-16 00:58:37', '2020-02-16 00:58:37'),
(88, NULL, 88, 'default_variant', 'default_variant', NULL, 14.7, 14.7, 1, NULL, 'no_image.png', '7501059281943', 10, '2020-02-16 00:59:55', '2020-02-16 00:59:55'),
(89, NULL, 89, 'default_variant', 'default_variant', NULL, 22.16, 22.16, 1, NULL, 'no_image.png', '7501059233072', 10, '2020-02-16 01:01:13', '2020-02-16 01:01:13'),
(90, NULL, 90, 'default_variant', 'default_variant', NULL, 11, 11, 1, NULL, 'no_image.png', '7501761846515', 10, '2020-02-16 01:03:05', '2020-02-16 01:03:05'),
(91, NULL, 91, 'default_variant', 'default_variant', NULL, 15.17, 15.17, 1, NULL, 'no_image.png', '7506205807589', 10, '2020-02-16 01:04:26', '2020-02-16 01:04:26'),
(92, NULL, 92, 'default_variant', 'default_variant', NULL, 18.98, 18.98, 1, NULL, 'no_image.png', '7501200485022', 10, '2020-02-16 01:05:49', '2020-02-16 01:05:49'),
(93, NULL, 93, 'default_variant', 'default_variant', NULL, 9.4, 9.4, 1, NULL, 'no_image.png', '7501088005039', 10, '2020-02-16 01:07:12', '2020-02-16 01:07:12'),
(94, NULL, 94, 'default_variant', 'default_variant', NULL, 22.31, 22.31, 1, NULL, 'no_image.png', '7501059282117', 10, '2020-02-16 01:08:57', '2020-02-16 01:08:57'),
(95, NULL, 95, 'default_variant', 'default_variant', NULL, 11.45, 11.45, 1, NULL, 'no_image.png', '7501533610924', 10, '2020-02-16 01:10:18', '2020-02-16 01:10:18'),
(96, NULL, 96, 'default_variant', 'default_variant', NULL, 9.36, 9.36, 1, NULL, 'no_image.png', '7501533610122', 10, '2020-02-16 01:14:49', '2020-02-16 01:14:49'),
(97, NULL, 97, 'default_variant', 'default_variant', NULL, 9.54, 9.54, 1, NULL, 'no_image.png', '7501020515299', 10, '2020-02-16 01:16:13', '2020-02-16 01:16:13'),
(98, NULL, 98, 'default_variant', 'default_variant', NULL, 10.2, 10.2, 1, NULL, 'no_image.png', '097339000054', 10, '2020-02-16 01:18:57', '2020-02-16 01:18:57'),
(99, NULL, 99, 'default_variant', 'default_variant', NULL, 12.33, 12.33, 1, NULL, 'no_image.png', '041500750903', 2, '2020-02-16 01:22:14', '2020-02-16 01:22:32'),
(100, NULL, 100, 'default_variant', 'default_variant', NULL, 27.91, 27.91, 1, NULL, 'no_image.png', '7501003150233', 10, '2020-02-16 01:25:13', '2020-02-16 01:25:13'),
(101, NULL, 101, 'default_variant', 'default_variant', NULL, 8.97, 8.97, 1, NULL, 'no_image.png', '7501118342103', 10, '2020-02-16 01:28:34', '2020-02-16 01:28:34'),
(102, NULL, 102, 'default_variant', 'default_variant', NULL, 6.3, 6.3, 1, NULL, 'no_image.png', '7501017043033', 10, '2020-02-16 01:32:12', '2020-02-16 01:32:12'),
(103, NULL, 103, 'default_variant', 'default_variant', NULL, 12.27, 12.27, 1, NULL, 'no_image.png', '7501071307799', 10, '2020-02-16 01:33:43', '2020-02-16 01:33:43'),
(104, NULL, 104, 'default_variant', 'default_variant', NULL, 9.32, 9.32, 1, NULL, 'no_image.png', '7503002163023', 10, '2020-02-16 01:36:54', '2020-02-16 01:36:54'),
(105, NULL, 105, 'default_variant', 'default_variant', NULL, 12.65, 12.65, 1, NULL, 'no_image.png', '7501020540666', 10, '2020-02-16 01:38:20', '2020-02-16 01:38:20'),
(106, NULL, 106, 'default_variant', 'default_variant', NULL, 18.22, 18.22, 1, NULL, 'no_image.png', '7501020515343', 10, '2020-02-16 01:44:36', '2020-02-16 01:44:36'),
(107, NULL, 107, 'default_variant', 'default_variant', NULL, 18.22, 18.22, 1, NULL, 'no_image.png', '7501020515398', 10, '2020-02-16 01:46:14', '2020-02-16 01:46:14'),
(108, NULL, 108, 'default_variant', 'default_variant', NULL, 3.1, 3.1, 1, NULL, 'no_image.png', '7501943493698', 10, '2020-02-16 01:51:32', '2020-02-16 01:52:55'),
(109, NULL, 109, 'default_variant', 'default_variant', NULL, 3.12, 3.12, 1, NULL, 'no_image.png', '7501943493704', 10, '2020-02-16 01:54:34', '2020-02-16 01:54:34'),
(110, NULL, 110, 'default_variant', 'default_variant', NULL, 9.88, 9.88, 1, NULL, 'no_image.png', '7501005129947', 10, '2020-02-16 02:00:53', '2020-02-16 02:02:10'),
(111, NULL, 111, 'default_variant', 'default_variant', NULL, 9.88, 9.88, 1, NULL, 'no_image.png', '7501005134712', 10, '2020-02-16 02:03:09', '2020-02-16 02:03:09'),
(112, NULL, 112, 'default_variant', 'default_variant', NULL, 9.88, 9.88, 1, NULL, 'no_image.png', '7501005129954', 10, '2020-02-16 02:04:30', '2020-02-16 02:04:30'),
(113, NULL, 113, 'default_variant', 'default_variant', NULL, 9.88, 9.88, 1, NULL, 'no_image.png', '7501005129930', 10, '2020-02-16 02:07:10', '2020-02-16 02:07:10'),
(114, NULL, 114, 'default_variant', 'default_variant', NULL, 9.88, 9.88, 1, NULL, 'no_image.png', '7501005129923', 10, '2020-02-16 02:08:29', '2020-02-16 02:08:29'),
(115, NULL, 115, 'default_variant', 'default_variant', NULL, 13.96, 13.96, 1, NULL, 'no_image.png', '7501055368785', 10, '2020-02-16 02:12:28', '2020-02-16 02:12:28'),
(116, NULL, 116, 'default_variant', 'default_variant', NULL, 15.48, 15.48, 1, NULL, 'no_image.png', '7501055313525', 10, '2020-02-16 02:14:21', '2020-02-16 02:14:21'),
(117, NULL, 117, 'default_variant', 'default_variant', NULL, 33.58, 33.58, 1, NULL, 'no_image.png', '7501055313532', 10, '2020-02-16 02:20:31', '2020-02-16 02:20:31'),
(118, NULL, 118, 'default_variant', 'default_variant', NULL, 10.82, 10.82, 1, NULL, 'no_image.png', '7501003300652', 10, '2020-02-20 01:09:06', '2020-02-20 01:09:06'),
(119, NULL, 119, 'default_variant', 'default_variant', NULL, 17.25, 17.25, 1, NULL, 'no_image.png', '7501003340122', 10, '2020-02-20 01:11:52', '2020-02-20 01:11:52'),
(120, NULL, 120, 'default_variant', 'default_variant', NULL, 24.54, 24.54, 1, NULL, 'no_image.png', '7501003340139', 10, '2020-02-20 01:15:50', '2020-02-20 01:15:50'),
(121, NULL, 121, 'default_variant', 'default_variant', NULL, 6.57, 6.57, 1, NULL, 'no_image.png', '724865070205', 10, '2020-02-20 01:45:32', '2020-02-20 01:45:32'),
(122, NULL, 122, 'default_variant', 'default_variant', NULL, 24.92, 24.92, 1, NULL, 'no_image.png', '7503010473121', 6, '2020-02-20 01:52:10', '2020-02-20 01:52:10'),
(123, NULL, 123, 'default_variant', 'default_variant', NULL, 10.35, 10.35, 1, NULL, 'no_image.png', '7501118341106', 10, '2020-02-20 01:56:09', '2020-02-20 01:56:09'),
(124, NULL, 124, 'default_variant', 'default_variant', NULL, 15.75, 15.75, 1, NULL, 'no_image.png', '7509546017143', 10, '2020-02-20 02:02:19', '2020-02-20 02:02:19'),
(125, NULL, 125, 'default_variant', 'default_variant', NULL, 11.5, 11.5, 1, NULL, 'no_image.png', '75045838', 8, '2020-02-20 02:05:23', '2020-02-20 02:05:23'),
(126, NULL, 126, 'default_variant', 'default_variant', NULL, 15.88, 15.88, 1, NULL, 'no_image.png', '7509546018928', 10, '2020-02-20 02:07:49', '2020-02-20 02:07:49'),
(127, NULL, 127, 'default_variant', 'default_variant', NULL, 9.84, 9.84, 1, NULL, 'no_image.png', '7501055905287', 10, '2020-02-20 02:12:52', '2020-02-20 02:12:52'),
(128, NULL, 128, 'default_variant', 'default_variant', NULL, 4.63, 4.63, 1, NULL, 'no_image.png', '7501079016495', 10, '2020-02-20 02:16:00', '2020-02-20 02:16:00'),
(129, NULL, 129, 'default_variant', 'default_variant', NULL, 17.5, 17.5, 1, NULL, 'no_image.png', '7500435127493', 10, '2020-02-20 02:19:19', '2020-02-20 02:19:19'),
(130, NULL, 130, 'default_variant', 'default_variant', NULL, 20.25, 20.25, 1, NULL, 'no_image.png', '7509546067506', 10, '2020-02-20 02:21:53', '2020-02-20 02:21:53'),
(131, NULL, 131, 'default_variant', 'default_variant', NULL, 14, 20, 1, NULL, 'no_image.png', '123123123', 10, '2020-02-21 00:53:14', '2020-02-21 00:53:14'),
(132, NULL, 132, 'default_variant', 'default_variant', NULL, 3.32, 3.32, 1, NULL, 'no_image.png', '7506205802409', 10, '2020-02-26 00:57:29', '2020-02-26 00:57:29'),
(133, NULL, 133, 'default_variant', 'default_variant', NULL, 6.55, 6.55, 1, NULL, 'no_image.png', '041789001864', 10, '2020-02-26 01:00:09', '2020-02-26 01:00:09'),
(134, NULL, 134, 'default_variant', 'default_variant', NULL, 7.6, 7.6, 1, NULL, 'no_image.png', '070662242025', 10, '2020-02-26 01:01:34', '2020-02-26 01:01:34'),
(135, NULL, 135, 'default_variant', 'default_variant', NULL, 6.55, 6.55, 1, NULL, 'no_image.png', '041789001987', 10, '2020-02-26 01:03:51', '2020-02-26 01:03:51'),
(136, NULL, 136, 'default_variant', 'default_variant', NULL, 6.1, 6.1, 1, NULL, 'no_image.png', '7501000911974', 10, '2020-02-26 01:09:29', '2020-02-26 01:09:29'),
(137, NULL, 137, 'default_variant', 'default_variant', NULL, 22.92, 22.92, 1, NULL, 'no_image.png', '7501943471900', 6, '2020-02-26 01:19:37', '2020-02-26 01:19:37'),
(138, NULL, 138, 'default_variant', 'default_variant', NULL, 20.41, 20.41, 1, NULL, 'no_image.png', '7501943454439', 8, '2020-02-26 01:22:56', '2020-02-26 01:22:56'),
(139, NULL, 139, 'default_variant', 'default_variant', NULL, 9.37, 9.37, 1, NULL, 'no_image.png', '7501943498907', 8, '2020-02-26 01:28:21', '2020-02-26 01:28:21'),
(140, NULL, 140, 'default_variant', 'default_variant', NULL, 10.59, 10.59, 1, NULL, 'no_image.png', '7501943446052', 8, '2020-02-26 01:33:00', '2020-02-26 01:33:00'),
(141, NULL, 141, 'default_variant', 'default_variant', NULL, 9.13, 9.13, 1, NULL, 'no_image.png', '7501032940102', 8, '2020-02-26 01:36:44', '2020-02-26 01:36:44'),
(142, NULL, 142, 'default_variant', 'default_variant', NULL, 8.5, 8.5, 1, NULL, 'no_image.png', '7501006705942', 10, '2020-02-26 01:42:29', '2020-02-26 01:42:29'),
(143, NULL, 143, 'default_variant', 'default_variant', NULL, 8.1, 8.1, 1, NULL, 'no_image.png', '7501025403010', 10, '2020-02-26 01:49:58', '2020-02-26 01:49:58'),
(144, NULL, 144, 'default_variant', 'default_variant', NULL, 24.25, 24.25, 1, NULL, 'no_image.png', '7500435019811', 8, '2020-02-26 01:53:57', '2020-02-26 01:53:57'),
(145, NULL, 145, 'default_variant', 'default_variant', NULL, 63, 63, 1, NULL, 'no_image.png', '75068783', 5, '2020-02-26 01:58:56', '2020-02-26 01:58:56'),
(146, NULL, 146, 'default_variant', 'default_variant', NULL, 9.5, 9.5, 1, NULL, 'no_image.png', '7502251520014', 5, '2020-02-26 02:06:00', '2020-02-26 02:06:00'),
(147, NULL, 147, 'default_variant', 'default_variant', NULL, 12.9, 12.9, 1, NULL, 'no_image.png', '7501077400050', 5, '2020-02-26 02:07:08', '2020-02-26 02:07:08'),
(148, NULL, 148, 'default_variant', 'default_variant', NULL, 11.72, 11.72, 1, NULL, 'no_image.png', '7501943458574', 10, '2020-02-26 02:14:15', '2020-02-26 02:14:15'),
(149, NULL, 149, 'default_variant', 'default_variant', NULL, 106.8, 106.8, 1, NULL, 'no_image.png', '7501943461345', 1, '2020-03-02 21:19:06', '2020-03-02 21:19:06'),
(150, NULL, 150, 'default_variant', 'default_variant', NULL, 12.3, 12.3, 1, NULL, 'no_image.png', '7501071307782', 10, '2020-03-03 00:00:29', '2020-03-03 00:00:29'),
(151, NULL, 151, 'default_variant', 'default_variant', NULL, 10.5, 10.5, 1, NULL, 'no_image.png', '7501058618696', 10, '2020-03-03 00:06:44', '2020-03-03 00:06:44'),
(152, NULL, 152, 'default_variant', 'default_variant', NULL, 6.9, 6.9, 1, NULL, 'no_image.png', '7501058620750', 10, '2020-03-03 00:12:41', '2020-03-03 00:12:41'),
(153, NULL, 153, 'default_variant', 'default_variant', NULL, 10.92, 10.92, 1, NULL, 'no_image.png', '7501200485053', 10, '2020-03-03 00:14:21', '2020-03-03 00:14:21'),
(154, NULL, 154, 'default_variant', 'default_variant', NULL, 11.67, 11.67, 1, NULL, 'no_image.png', '7501017004423', 10, '2020-03-03 00:52:26', '2020-03-03 00:52:26'),
(155, NULL, 155, 'default_variant', 'default_variant', NULL, 11.17, 11.17, 1, NULL, 'no_image.png', '7506192506601', 10, '2020-03-03 00:54:12', '2020-03-03 00:54:12'),
(156, NULL, 156, 'default_variant', 'default_variant', NULL, 31.6, 31.6, 1, NULL, 'no_image.png', '7501062702657', 6, '2020-03-03 01:00:59', '2020-03-03 01:00:59'),
(157, NULL, 157, 'default_variant', 'default_variant', NULL, 26.5, 26.5, 1, NULL, 'no_image.png', '7501008042984', 4, '2020-03-03 01:02:37', '2020-03-03 01:02:37'),
(158, NULL, 158, 'default_variant', 'default_variant', NULL, 22.5, 22.5, 1, NULL, 'no_image.png', '7501001625337', 4, '2020-03-03 01:05:29', '2020-03-03 01:05:29'),
(159, NULL, 159, 'default_variant', 'default_variant', NULL, 19, 19, 1, NULL, 'no_image.png', '7501761850932', 4, '2020-03-03 01:07:39', '2020-03-03 01:07:39'),
(160, NULL, 160, 'default_variant', 'default_variant', NULL, 22.95, 22.95, 1, NULL, 'no_image.png', '7502218211580', 6, '2020-03-03 01:09:55', '2020-03-03 01:09:55'),
(161, NULL, 161, 'default_variant', 'default_variant', NULL, 15.75, 15.75, 1, NULL, 'no_image.png', '7501125144851', 6, '2020-03-03 01:14:05', '2020-03-03 01:14:05'),
(162, NULL, 162, 'default_variant', 'default_variant', NULL, 15.75, 15.75, 1, NULL, 'no_image.png', '7501125104688', 6, '2020-03-03 01:15:33', '2020-03-03 01:37:31'),
(163, NULL, 163, 'default_variant', 'default_variant', NULL, 8.09, 8.09, 1, NULL, 'no_image.png', '7501079702855', 8, '2020-03-03 01:17:31', '2020-03-03 01:17:31'),
(164, NULL, 164, 'default_variant', 'default_variant', NULL, 15.75, 15.75, 1, NULL, 'no_image.png', '7501125104268', 8, '2020-03-03 01:39:30', '2020-03-03 01:39:30'),
(165, NULL, 165, 'default_variant', 'default_variant', NULL, 22.59, 22.59, 1, NULL, 'no_image.png', '7501058619228', 6, '2020-03-03 01:41:36', '2020-03-03 01:41:36'),
(166, NULL, 166, 'default_variant', 'default_variant', NULL, 9.5, 9.5, 1, NULL, 'no_image.png', '7501023114932', 12, '2020-03-03 01:49:45', '2020-03-03 01:56:45'),
(167, NULL, 167, 'default_variant', 'default_variant', NULL, 9.5, 9.5, 1, NULL, 'no_image.png', '7501023118374', 10, '2020-03-03 01:54:16', '2020-03-03 01:55:24'),
(168, NULL, 168, 'default_variant', 'default_variant', NULL, 2.17, 2.17, 1, NULL, 'no_image.png', '7501008950012', 10, '2020-03-03 02:03:40', '2020-03-03 02:03:40'),
(169, NULL, 169, 'default_variant', 'default_variant', NULL, 10, 20, 1, NULL, 'no_image.png', '234234234234', 10, '2020-03-31 02:28:20', '2020-03-31 02:28:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurant_tables`
--

CREATE TABLE `restaurant_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'available',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `title`, `permissions`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Dev - tester', 'a:43:{i:0;s:19:\"can_manage_products\";i:1;s:16:\"can_see_products\";i:2;s:21:\"can_manage_categories\";i:3;s:18:\"can_see_categories\";i:4;s:17:\"can_manage_brands\";i:5;s:14:\"can_see_brands\";i:6;s:17:\"can_manage_groups\";i:7;s:14:\"can_see_groups\";i:8;s:28:\"can_manage_variant_attribute\";i:9;s:25:\"can_see_variant_attribute\";i:10;s:16:\"can_manage_units\";i:11;s:13:\"can_see_units\";i:12;s:16:\"can_manage_sales\";i:13;s:22:\"can_manage_sales_price\";i:14;s:17:\"can_add_suppliers\";i:15;s:17:\"can_see_suppliers\";i:16;s:24:\"can_see_supplier_details\";i:17;s:19:\"can_manage_receives\";i:18;s:20:\"can_manage_customers\";i:19;s:17:\"can_see_customers\";i:20;s:26:\"can_manage_customer_groups\";i:21;s:23:\"can_see_customer_groups\";i:22;s:24:\"can_see_customer_details\";i:23;s:30:\"can_close_others_cash_register\";i:24;s:21:\"can_see_sales_reports\";i:25;s:30:\"can_see_personal_sales_reports\";i:26;s:29:\"can_see_sales_summary_reports\";i:27;s:25:\"can_see_receiving_reports\";i:28;s:34:\"can_see_personal_receiving_reports\";i:29;s:33:\"can_see_receiving_summary_reports\";i:30;s:24:\"can_see_register_reports\";i:31;s:25:\"can_see_inventory_reports\";i:32;s:23:\"can_see_payment_reports\";i:33;s:29:\"can_see_sales_payment_reports\";i:34;s:31:\"can_see_payment_summary_reports\";i:35;s:32:\"can_see_sales_statistics_reports\";i:36;s:19:\"can_see_tax_reports\";i:37;s:27:\"can_see_profit_loss_reports\";i:38;s:32:\"can_see_customer_summary_reports\";i:39;s:32:\"can_see_supplier_summary_reports\";i:40;s:34:\"can_see_sales_and_purchase_reports\";i:41;s:20:\"can_see_adjust_stock\";i:42;s:21:\"can_see_report_action\";}', 1, '2020-02-08 15:59:18', '2020-03-31 02:24:54'),
(2, 'tester', 'a:83:{i:0;s:28:\"can_edit_application_setting\";i:1;s:28:\"can_see_application_settings\";i:2;s:24:\"can_manage_sales_setting\";i:3;s:21:\"can_see_sales_setting\";i:4;s:22:\"can_edit_email_setting\";i:5;s:22:\"can_see_email_settings\";i:6;s:23:\"can_edit_email_template\";i:7;s:23:\"can_see_email_templates\";i:8;s:19:\"can_manage_branches\";i:9;s:16:\"can_see_branches\";i:10;s:27:\"can_manage_payment_settings\";i:11;s:24:\"can_see_payment_settings\";i:12;s:23:\"can_manage_tax_settings\";i:13;s:20:\"can_see_tax_settings\";i:14;s:26:\"can_manage_invoice_setting\";i:15;s:23:\"can_see_invoice_setting\";i:16;s:16:\"can_manage_roles\";i:17;s:13:\"can_see_roles\";i:18;s:25:\"can_manage_cash_registers\";i:19;s:22:\"can_see_cash_registers\";i:20;s:16:\"can_manage_users\";i:21;s:13:\"can_see_users\";i:22;s:21:\"can_see_users_details\";i:23;s:26:\"can_manage_product_setting\";i:24;s:23:\"can_see_product_setting\";i:25;s:23:\"can_manage_adjust_stock\";i:26;s:29:\"can_see_adjust_stock_settings\";i:27;s:26:\"can_manage_updates_setting\";i:28;s:23:\"can_see_updates_setting\";i:29;s:24:\"can_manage_table_setting\";i:30;s:21:\"can_see_table_setting\";i:31;s:35:\"can_manage_invoice_template_setting\";i:32;s:32:\"can_see_invoice_template_setting\";i:33;s:31:\"can_manage_notification_setting\";i:34;s:28:\"can_see_notification_setting\";i:35;s:24:\"can_see_corn_job_setting\";i:36;s:19:\"can_manage_products\";i:37;s:16:\"can_see_products\";i:38;s:21:\"can_manage_categories\";i:39;s:18:\"can_see_categories\";i:40;s:17:\"can_manage_brands\";i:41;s:14:\"can_see_brands\";i:42;s:17:\"can_manage_groups\";i:43;s:14:\"can_see_groups\";i:44;s:28:\"can_manage_variant_attribute\";i:45;s:25:\"can_see_variant_attribute\";i:46;s:16:\"can_manage_units\";i:47;s:13:\"can_see_units\";i:48;s:16:\"can_manage_sales\";i:49;s:22:\"can_manage_sales_price\";i:50;s:17:\"can_add_suppliers\";i:51;s:17:\"can_see_suppliers\";i:52;s:24:\"can_see_supplier_details\";i:53;s:19:\"can_manage_receives\";i:54;s:20:\"can_manage_customers\";i:55;s:17:\"can_see_customers\";i:56;s:26:\"can_manage_customer_groups\";i:57;s:23:\"can_see_customer_groups\";i:58;s:24:\"can_see_customer_details\";i:59;s:30:\"can_close_others_cash_register\";i:60;s:21:\"can_see_sales_reports\";i:61;s:30:\"can_see_personal_sales_reports\";i:62;s:29:\"can_see_sales_summary_reports\";i:63;s:25:\"can_see_receiving_reports\";i:64;s:34:\"can_see_personal_receiving_reports\";i:65;s:33:\"can_see_receiving_summary_reports\";i:66;s:24:\"can_see_register_reports\";i:67;s:25:\"can_see_inventory_reports\";i:68;s:23:\"can_see_payment_reports\";i:69;s:29:\"can_see_sales_payment_reports\";i:70;s:31:\"can_see_payment_summary_reports\";i:71;s:32:\"can_see_sales_statistics_reports\";i:72;s:19:\"can_see_tax_reports\";i:73;s:27:\"can_see_profit_loss_reports\";i:74;s:32:\"can_see_customer_summary_reports\";i:75;s:32:\"can_see_supplier_summary_reports\";i:76;s:34:\"can_see_sales_and_purchase_reports\";i:77;s:20:\"can_see_adjust_stock\";i:78;s:21:\"can_see_report_action\";i:79;s:22:\"can_manage_sms_setting\";i:80;s:19:\"can_see_sms_setting\";i:81;s:35:\"can_manage_purchase_invoice_setting\";i:82;s:32:\"can_see_purchase_invoice_setting\";}', 1, '2020-02-08 16:00:36', '2020-03-31 00:09:35'),
(3, 'Administrador', 'a:79:{i:0;s:28:\"can_edit_application_setting\";i:1;s:28:\"can_see_application_settings\";i:2;s:24:\"can_manage_sales_setting\";i:3;s:21:\"can_see_sales_setting\";i:4;s:22:\"can_edit_email_setting\";i:5;s:23:\"can_edit_email_template\";i:6;s:22:\"can_see_email_settings\";i:7;s:23:\"can_see_email_templates\";i:8;s:19:\"can_manage_branches\";i:9;s:16:\"can_see_branches\";i:10;s:27:\"can_manage_payment_settings\";i:11;s:24:\"can_see_payment_settings\";i:12;s:23:\"can_manage_tax_settings\";i:13;s:20:\"can_see_tax_settings\";i:14;s:26:\"can_manage_invoice_setting\";i:15;s:23:\"can_see_invoice_setting\";i:16;s:16:\"can_manage_roles\";i:17;s:13:\"can_see_roles\";i:18;s:25:\"can_manage_cash_registers\";i:19;s:22:\"can_see_cash_registers\";i:20;s:16:\"can_manage_users\";i:21;s:21:\"can_see_users_details\";i:22;s:13:\"can_see_users\";i:23;s:26:\"can_manage_product_setting\";i:24;s:23:\"can_see_product_setting\";i:25;s:23:\"can_manage_adjust_stock\";i:26;s:29:\"can_see_adjust_stock_settings\";i:27;s:26:\"can_manage_updates_setting\";i:28;s:23:\"can_see_updates_setting\";i:29;s:24:\"can_manage_table_setting\";i:30;s:21:\"can_see_table_setting\";i:31;s:35:\"can_manage_invoice_template_setting\";i:32;s:32:\"can_see_invoice_template_setting\";i:33;s:31:\"can_manage_notification_setting\";i:34;s:24:\"can_see_corn_job_setting\";i:35;s:28:\"can_see_notification_setting\";i:36;s:19:\"can_manage_products\";i:37;s:16:\"can_see_products\";i:38;s:21:\"can_manage_categories\";i:39;s:18:\"can_see_categories\";i:40;s:17:\"can_manage_brands\";i:41;s:14:\"can_see_brands\";i:42;s:17:\"can_manage_groups\";i:43;s:14:\"can_see_groups\";i:44;s:28:\"can_manage_variant_attribute\";i:45;s:25:\"can_see_variant_attribute\";i:46;s:16:\"can_manage_units\";i:47;s:13:\"can_see_units\";i:48;s:16:\"can_manage_sales\";i:49;s:22:\"can_manage_sales_price\";i:50;s:17:\"can_add_suppliers\";i:51;s:17:\"can_see_suppliers\";i:52;s:24:\"can_see_supplier_details\";i:53;s:19:\"can_manage_receives\";i:54;s:20:\"can_manage_customers\";i:55;s:17:\"can_see_customers\";i:56;s:26:\"can_manage_customer_groups\";i:57;s:23:\"can_see_customer_groups\";i:58;s:24:\"can_see_customer_details\";i:59;s:30:\"can_close_others_cash_register\";i:60;s:21:\"can_see_sales_reports\";i:61;s:30:\"can_see_personal_sales_reports\";i:62;s:29:\"can_see_sales_summary_reports\";i:63;s:25:\"can_see_receiving_reports\";i:64;s:34:\"can_see_personal_receiving_reports\";i:65;s:33:\"can_see_receiving_summary_reports\";i:66;s:24:\"can_see_register_reports\";i:67;s:25:\"can_see_inventory_reports\";i:68;s:23:\"can_see_payment_reports\";i:69;s:29:\"can_see_sales_payment_reports\";i:70;s:31:\"can_see_payment_summary_reports\";i:71;s:32:\"can_see_sales_statistics_reports\";i:72;s:19:\"can_see_tax_reports\";i:73;s:27:\"can_see_profit_loss_reports\";i:74;s:32:\"can_see_customer_summary_reports\";i:75;s:32:\"can_see_supplier_summary_reports\";i:76;s:34:\"can_see_sales_and_purchase_reports\";i:77;s:20:\"can_see_adjust_stock\";i:78;s:21:\"can_see_report_action\";}', 1, '2020-02-08 16:02:11', '2020-02-08 16:02:11'),
(5, 'Cajero', 'a:22:{i:0;s:24:\"can_see_payment_settings\";i:1;s:16:\"can_see_branches\";i:2;s:22:\"can_see_cash_registers\";i:3;s:16:\"can_see_products\";i:4;s:18:\"can_see_categories\";i:5;s:14:\"can_see_brands\";i:6;s:14:\"can_see_groups\";i:7;s:25:\"can_see_variant_attribute\";i:8;s:13:\"can_see_units\";i:9;s:16:\"can_manage_sales\";i:10;s:17:\"can_see_suppliers\";i:11;s:19:\"can_manage_receives\";i:12;s:34:\"can_see_sales_and_purchase_reports\";i:13;s:21:\"can_see_sales_reports\";i:14;s:25:\"can_see_receiving_reports\";i:15;s:33:\"can_see_receiving_summary_reports\";i:16;s:29:\"can_see_sales_summary_reports\";i:17;s:30:\"can_see_personal_sales_reports\";i:18;s:24:\"can_see_register_reports\";i:19;s:31:\"can_see_payment_summary_reports\";i:20;s:29:\"can_see_sales_payment_reports\";i:21;s:23:\"can_see_payment_reports\";}', 1, '2020-02-11 08:25:18', '2020-02-13 22:50:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `setting_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_value`, `setting_type`, `user_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'time_format', '12h', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(2, 'date_format', 'd/m/Y', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(3, 'currency_symbol', '$', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(4, 'currency_format', 'left', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(5, 'thousand_separator', ',', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(6, 'language_setting', 'español', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(7, 'decimal_separator', '.', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(8, 'number_of_decimal', '2', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(9, 'offday_setting', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'email_from_name', 'Administrapp', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(11, 'email_from_address', 'app@grupoconectate.com', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(12, 'email_driver', 'sendmail', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(13, 'email_smtp_host', 'mail.grupoconectate.com', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(14, 'email_port', '993', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(15, 'email_smtp_password', '4dm1n1str4d0r', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(16, 'email_encryption_type', 'tls', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(17, 'mandrill_api', '', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(18, 'sparkpost_api', '', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(19, 'mailgun_domain', '', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(20, 'mailgun_api', '', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-08 16:13:01'),
(21, 'max_row_per_table', '10', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(22, 'app_name', 'Administrapp', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(23, 'app_logo', 'logo_75320320.png', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(24, 'currency_code', 'usd', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'purchase_code', '9f4bdbbc-5404-43e8-836f-967bc87f0bfd', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'can_signup', '1', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'can_login', '1', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'invoice_prefix', '', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-09 03:18:29'),
(29, 'invoice_suffix', '', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-09 03:18:29'),
(30, 'last_invoice_number', '248', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-21 04:23:36'),
(31, 'auto_generate_invoice', '1', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-09 03:18:29'),
(32, 'auto_email_receive', '0', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-09 03:18:29'),
(33, 'invoice_starts_from', '1', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'invoiceLogo', 'default-logo.jpg', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 're_order', '10', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'sku_prefix', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'sales_return_status', 'sales', '', NULL, 0, '0000-00-00 00:00:00', '2020-04-01 20:20:53'),
(38, 'offline_mode', '1', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(39, 'time_zone', 'UTC', '', NULL, 0, '0000-00-00 00:00:00', '2020-03-31 01:26:58'),
(40, 'notification_time', '2019-12-25T04:00:00.641Z', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'low_stock_notification', '1', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-07 05:24:20'),
(42, 'out_of_stock_products', '1', '', NULL, 0, '0000-00-00 00:00:00', '2020-02-09 02:31:03'),
(43, 'current_branch', '1', 'user', 1, 0, '2020-02-07 04:41:16', '2020-03-31 00:07:04'),
(44, 'sales_type', 'customer', '', 1, 0, '0000-00-00 00:00:00', '2020-03-30 23:41:24'),
(45, 'receiving_type', 'supplier', '', 1, 0, '0000-00-00 00:00:00', '2020-03-21 03:54:06'),
(46, 'current_branch', '1', 'user', 2, 0, '2020-02-08 16:40:28', '2020-02-08 16:40:28'),
(47, 'current_branch', '2', 'user', 3, 0, '2020-02-08 22:31:23', '2020-03-21 04:16:54'),
(49, 'current_branch', '3', 'user', 5, 0, '2020-03-31 01:21:38', '2020-03-31 01:38:16'),
(48, 'current_branch', '1', 'user', 4, 0, '2020-02-11 08:31:59', '2020-02-11 08:31:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shortcut_keys`
--

CREATE TABLE `shortcut_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `defaultShortcuts` longtext COLLATE utf8_unicode_ci NOT NULL,
  `customShortcuts` longtext COLLATE utf8_unicode_ci,
  `created_by` int(11) NOT NULL,
  `shortcutsStatus` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `shortcut_keys`
--

INSERT INTO `shortcut_keys` (`id`, `user_id`, `defaultShortcuts`, `customShortcuts`, `created_by`, `shortcutsStatus`, `created_at`, `updated_at`) VALUES
(1, 1, 'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}', NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}', NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 3, 'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}', NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 4, 'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}', NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 5, 'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}', NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id`, `first_name`, `last_name`, `email`, `company`, `phone_number`, `address`, `avatar`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Gerardo', 'Rodriguez', NULL, 'Coca cola', NULL, NULL, 'default.jpg', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL DEFAULT '0',
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `percentage`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Zero Tax', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `todo_lists`
--

CREATE TABLE `todo_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `due_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `completed` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `todo_lists`
--

INSERT INTO `todo_lists` (`id`, `title`, `description`, `due_date`, `completed_date`, `completed`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Cuadrar stock', NULL, '2020-02-11', NULL, 0, 1, '2020-02-09 03:26:05', '2020-02-09 09:26:05'),
(2, 'añadir', NULL, '2020-02-13', NULL, 0, 2, '2020-02-09 03:26:01', '2020-02-09 09:26:01'),
(3, 'ordenar productos', NULL, '2020-02-20', '0000-00-00', 1, 3, '2020-02-13 23:27:56', '2020-02-14 05:27:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `user_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `branch_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_check` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `gender`, `date_of_birth`, `company`, `phone_number`, `address`, `avatar`, `verified`, `is_admin`, `role_id`, `user_type`, `enabled`, `created_by`, `branch_id`, `token`, `remember_token`, `notification_check`, `created_at`, `updated_at`) VALUES
(1, 'Jafet', 'Prieto', 'jafetgonzalez117@gmail.com', '$2y$10$sORzzBlsSUwzQx4HrJY4vObMXlE9uluJbHD8PrJzR413u4uX5CW6C', NULL, NULL, NULL, NULL, NULL, 'default.jpg', 1, 1, 0, 'staff', 1, 0, '1', '', 'O2ACdv3cdlLpjiVyyQrLsur1P9Cj5V5OXMIG2OgrJJdYJtcFBYz6zh054xvg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Felipe', 'Cordova', 'felipe.cordova.garcia@gmail.com', '$2y$10$nRZuKRmuLtFUEji82Pq1FezSMj.ygVWUUdE04kYut2xswJq3UYZAu', NULL, NULL, NULL, NULL, NULL, 'default.jpg', 1, 0, 2, 'staff', 1, 0, '1,2,3', 'LmUuTU7S1e5L1o5D', 'lnjJBumpRDJZj9E0QCEgR5OMwnnWYIrWvCA8Y7V2oJOvf18Urz1UAHnDzCw4', NULL, '2020-02-08 16:38:58', '2020-03-31 00:09:18'),
(3, 'oscar', 'pineda nah', 'oscar_pineda@live.com', '$2y$10$VvdXUKBiJQNu5fwvnFBsJuw7Rs5GDhZHhwTn3weZ47BVZIAOWDtdu', NULL, NULL, NULL, NULL, NULL, 'default.jpg', 1, 0, 3, 'staff', 1, 0, '1,2,3', 'cUWAoWXJorLNojtX', 'pumMEtmMtV41PrV0dZlSsG7VJo8CLFAXWVF8Uod1ZSnTDbHJnbAJ6PQiduAI', NULL, '2020-02-08 22:27:46', '2020-03-31 02:55:45'),
(4, 'Jaf', 'Prieto', 'jafet117@icloud.com', '$2y$10$WoUYBq1n/R4JicX0EhGrIOY3uQuT1r0tKJgbSywWERIqfr2KFeZ.G', NULL, NULL, NULL, NULL, NULL, 'default.jpg', 1, 0, 1, 'staff', 1, 0, '1,2,3', 'xwgTYRV5byeDCemV', 'imChAdSUah59awc5Zgscadv86yrd9dnTfKxEM6zyiBlOoT0dTpaZx6tmr18s', NULL, '2020-02-11 08:31:04', '2020-03-31 00:08:45'),
(5, 'Jafet', 'pg', 'jafetpg117@outlook.com', '$2y$10$ikcZ4ViSpznTVuMzmioVN.TTbCwxGLsZ.HBh3jGnZdmlcjjjgHJBS', NULL, NULL, NULL, NULL, NULL, 'default.jpg', 1, 0, 3, 'staff', 1, 0, '1,2,3', 'NEyCUdBvcRPoFQRY', NULL, NULL, '2020-03-31 00:11:10', '2020-03-31 00:11:10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adjust_product_stock_types`
--
ALTER TABLE `adjust_product_stock_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cash_register_logs`
--
ALTER TABLE `cash_register_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `corn_job_logs`
--
ALTER TABLE `corn_job_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `invoice_templates`
--
ALTER TABLE `invoice_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_brands`
--
ALTER TABLE `product_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_groups`
--
ALTER TABLE `product_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_units`
--
ALTER TABLE `product_units`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_sku_unique` (`sku`);

--
-- Indices de la tabla `restaurant_tables`
--
ALTER TABLE `restaurant_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shortcut_keys`
--
ALTER TABLE `shortcut_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `todo_lists`
--
ALTER TABLE `todo_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adjust_product_stock_types`
--
ALTER TABLE `adjust_product_stock_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cash_register_logs`
--
ALTER TABLE `cash_register_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `corn_job_logs`
--
ALTER TABLE `corn_job_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `invites`
--
ALTER TABLE `invites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `invoice_templates`
--
ALTER TABLE `invoice_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT de la tabla `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_brands`
--
ALTER TABLE `product_brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `product_groups`
--
ALTER TABLE `product_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT de la tabla `restaurant_tables`
--
ALTER TABLE `restaurant_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `shortcut_keys`
--
ALTER TABLE `shortcut_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `todo_lists`
--
ALTER TABLE `todo_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 02:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2_stok_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Admin', 5, 1730945009),
('Admin', 8, 1731460658),
('Admin', 15, 1732515387),
('Admin', 16, 1732520942),
('Admin', 17, 1732520978),
('maintenance', 9, 1730950172),
('maintenance', 12, 1731460710),
('sandbag', 10, 1730952624),
('superadmin', 1, 1730169714),
('superadmin', 4, 1731036786),
('superadmin', 11, 1730952835),
('superadmin', 14, 1732246917);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`, `group_code`) VALUES
('/*', 3, NULL, NULL, NULL, 1729233880, 1729233880, NULL),
('/category/*', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/category/create', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/category/delete', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/category/index', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/category/update', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/category/view', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/debug/*', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/debug/default/*', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/debug/default/db-explain', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/debug/default/download-mail', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/debug/default/index', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/debug/default/toolbar', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/debug/default/view', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/debug/user/*', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/debug/user/reset-identity', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/debug/user/set-identity', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/docs/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/docs/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/docs/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/docs/delete-old-docs', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/docs/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/docs/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/docs/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/docs/view-docs', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/document/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/document/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/document/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/document/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/document/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/document/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/employee/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/employee/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/employee/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/employee/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/employee/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/employee/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/export-damaged', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/export-item-report', 3, NULL, NULL, NULL, 1731036360, 1731036360, NULL),
('/export/export-lending', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/export-lending-history', 3, NULL, NULL, NULL, 1731289810, 1731289810, NULL),
('/export/export-log', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/export-log-single', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/export-main', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/export-repair', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/export-unit-report', 3, NULL, NULL, NULL, 1731036360, 1731036360, NULL),
('/export/export-xlsx', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/item-detail', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/warehouse', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/export/wh-dist', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/gii/*', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/gii/default/*', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/gii/default/action', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/gii/default/diff', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/gii/default/index', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/gii/default/preview', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/gii/default/view', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/item/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/dashboard-data', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/details', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/item-name', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/pic-upload', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/view-image', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/item/warehouse', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/history-detail', 3, NULL, NULL, NULL, 1731374474, 1731374474, NULL),
('/lending/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/item-report-active', 3, NULL, NULL, NULL, 1731030003, 1731030003, NULL),
('/lending/lending-history', 3, NULL, NULL, NULL, 1731046375, 1731046375, NULL),
('/lending/lending-list', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/list', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/loan-unit', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/return-image', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/lending/unit-report-active', 3, NULL, NULL, NULL, 1731032938, 1731032938, NULL),
('/lending/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/view-image', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/log/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/done-repair-log', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/edit-log', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/lending-log', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/new-unit', 3, NULL, NULL, NULL, 1731374474, 1731374474, NULL),
('/log/repair-log', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/return-log', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/search-log', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/search-result', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/log/view-log', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/rbac/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/rbac/init', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/rbac/list', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/repair-log/*', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/repair-log/create', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/repair-log/delete', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/repair-log/index', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/repair-log/update', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/repair-log/view', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/site/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/about', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/captcha', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/contact', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/error', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/login', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/logout', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/set-language', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/site/translate', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/unit/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/add-unit', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/available-lending', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/available-unit', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/broken-unit', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/bulk-add', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/bulk-add-preview', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/check', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/unit/correction-search', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/correction-unit', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/damaged', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/finish-repair', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/item-detail', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/repair', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/return-unit', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/send-repair', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/unit-repair', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/warehouse-distribution', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/*', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/auth-item-group/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/bulk-activate', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/bulk-deactivate', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/bulk-delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/grid-page-size', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/grid-sort', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/toggle-attribute', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth-item-group/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth/captcha', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth/change-own-password', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/auth/confirm-email', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth/confirm-email-receive', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth/confirm-registration-email', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth/login', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth/logout', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth/password-recovery', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth/password-recovery-receive', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/auth/registration', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/bulk-activate', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/bulk-deactivate', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/bulk-delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/grid-page-size', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/grid-sort', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/refresh-routes', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/set-child-permissions', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/set-child-routes', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/toggle-attribute', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/permission/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/bulk-activate', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/bulk-deactivate', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/bulk-delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/grid-page-size', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/grid-sort', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/set-child-permissions', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/set-child-roles', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/toggle-attribute', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/role/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-permission/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-permission/set', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user-permission/set-roles', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user-visit-log/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/bulk-activate', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/bulk-deactivate', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/bulk-delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/grid-page-size', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/grid-sort', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/toggle-attribute', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user-visit-log/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user/bulk-activate', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user/bulk-deactivate', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user/bulk-delete', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user/change-password', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user/create', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user/delete', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user/grid-page-size', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user/grid-sort', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user/index', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user/toggle-attribute', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user-management/user/update', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user-management/user/view', 3, NULL, NULL, NULL, 1729233881, 1729233881, NULL),
('/user/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user/generate-auth-keys', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user/options', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/user/toggle-status', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/warehouse/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/warehouse/assign', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/warehouse/assign-admins', 3, NULL, NULL, NULL, 1732160071, 1732160071, NULL),
('/warehouse/create', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/warehouse/delete', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/warehouse/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/warehouse/item', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/warehouse/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/warehouse/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('Admin', 1, 'Warehouse Admin', NULL, NULL, 1729233881, 1730953614, NULL),
('assign-to-wh', 2, 'Assign Warehouse Admins To WH', NULL, NULL, 1732517504, 1732517504, 'userManagement'),
('assignRolesToUsers', 2, 'Assign roles to users', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('base', 2, 'BASE. REQUIRED TO USE THE APP', NULL, NULL, 1730946802, 1730952596, 'base'),
('bindUserToIp', 2, 'Bind user to IP', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('bulk-documents', 2, 'bulk-documents', NULL, NULL, 1730949029, 1730949029, 'inventory-master'),
('changeOwnPassword', 2, 'Change own password', NULL, NULL, 1729233881, 1729233881, 'userCommonPermissions'),
('changeUserPassword', 2, 'Change user password', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('commonPermission', 2, 'Common permission', NULL, NULL, 1729233880, 1729233880, NULL),
('createUsers', 2, 'Create users', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('damaged-list', 2, 'Damaged Unit', NULL, NULL, 1730949678, 1730951532, 'maintenance'),
('damaged-view-only', 2, 'damaged view only', NULL, NULL, 1731040192, 1731040192, 'maintenance'),
('deleteUsers', 2, 'Delete users', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('documents-view', 2, 'documents-view-only', NULL, NULL, 1732505627, 1732505627, 'inventory-master'),
('editUserEmail', 2, 'Edit user email', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('editUsers', 2, 'Edit users', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('employee', 2, 'Employee', NULL, NULL, 1730949984, 1730951475, 'employee'),
('employee-view-only', 2, 'employee-view-only', NULL, NULL, 1731038487, 1731038487, 'employee'),
('god', 2, 'GOD MODE', NULL, NULL, 1730953358, 1730953358, 'god'),
('in-repair-view-only', 2, 'in-repair-view-only', NULL, NULL, 1731040294, 1731040294, 'maintenance'),
('inventory-view', 2, 'inventory view only', NULL, NULL, 1730962928, 1730963079, 'inventory-master'),
('item-loan', 2, 'unit loaning', NULL, NULL, 1730949341, 1730949341, 'loaning'),
('lending-history', 2, 'lending-history', NULL, NULL, 1731046364, 1731046364, 'loaning'),
('loan-list', 2, 'loan-list & return', NULL, NULL, 1730949508, 1730949508, 'loaning'),
('loan-report', 2, 'loan-report', NULL, NULL, 1731032924, 1731032924, 'loaning'),
('loaning-view-only', 2, 'loaning-view-only', NULL, NULL, 1731038542, 1731038542, 'loaning'),
('log-view', 2, 'log-view', NULL, NULL, 1730949125, 1730949125, 'inventory-master'),
('maintenance', 1, 'Maintenance & Repair Officer', NULL, NULL, 1730943897, 1730953864, NULL),
('manage-unit', 2, 'manage-unit', NULL, NULL, 1730948658, 1730948658, 'inventory-master'),
('manageItems', 2, 'Manage items', NULL, NULL, 1730169714, 1730169714, NULL),
('master-inventory', 2, 'master-inventory', NULL, NULL, 1730944559, 1730947946, 'inventory-master'),
('repair-list', 2, 'Unit In-repair', NULL, NULL, 1730950949, 1730951420, 'maintenance'),
('repair-summary', 2, 'repair-summary', NULL, NULL, 1732240270, 1732240270, 'maintenance'),
('role-assign', 2, 'role-assign', NULL, NULL, 1732507908, 1732507945, 'userManagement'),
('sandbag', 1, 'rbac test', NULL, NULL, 1730952500, 1730952500, NULL),
('superadmin', 1, 'App Admin', NULL, NULL, 1730169714, 1730953801, NULL),
('viewItems', 2, 'View items', NULL, NULL, 1730169714, 1730169714, NULL),
('viewRegistrationIp', 2, 'View registration IP', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('viewUserEmail', 2, 'View user email', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('viewUserRoles', 2, 'View user roles', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('viewUsers', 2, 'View users', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('viewVisitLog', 2, 'View visit log', NULL, NULL, 1729233881, 1729233881, 'userManagement'),
('warehouse', 2, 'Warehouse', NULL, NULL, 1730949846, 1730951487, 'warehouse'),
('warehouse-view-only', 2, 'warehouse-view-only', NULL, NULL, 1731040023, 1731040023, 'warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Admin', 'base'),
('Admin', 'bulk-documents'),
('Admin', 'changeOwnPassword'),
('Admin', 'damaged-list'),
('Admin', 'employee'),
('Admin', 'item-loan'),
('Admin', 'lending-history'),
('Admin', 'loan-list'),
('Admin', 'loan-report'),
('Admin', 'log-view'),
('Admin', 'manage-unit'),
('Admin', 'master-inventory'),
('Admin', 'repair-summary'),
('Admin', 'warehouse'),
('assign-to-wh', '/warehouse/assign'),
('assign-to-wh', '/warehouse/assign-admins'),
('assignRolesToUsers', '/user-management/user-permission/*'),
('assignRolesToUsers', 'manageItems'),
('assignRolesToUsers', 'viewItems'),
('assignRolesToUsers', 'viewUserRoles'),
('assignRolesToUsers', 'viewUsers'),
('base', '/item/dashboard-data'),
('base', '/item/index'),
('base', '/item/item-name'),
('base', '/item/view-image'),
('base', '/site/*'),
('base', '/user/options'),
('bulk-documents', '/docs/delete'),
('bulk-documents', '/docs/delete-old-docs'),
('bulk-documents', '/docs/index'),
('bulk-documents', '/docs/update'),
('bulk-documents', '/docs/view'),
('bulk-documents', '/docs/view-docs'),
('bulk-documents', '/document/*'),
('changeOwnPassword', '/user-management/auth/change-own-password'),
('changeUserPassword', '/user-management/user/change-password'),
('changeUserPassword', 'viewUsers'),
('createUsers', '/user-management/user/create'),
('createUsers', 'viewUsers'),
('damaged-list', '/export/export-damaged'),
('damaged-list', '/unit/damaged'),
('damaged-list', '/unit/send-repair'),
('damaged-view-only', '/unit/damaged'),
('deleteUsers', '/user-management/user/bulk-delete'),
('deleteUsers', '/user-management/user/delete'),
('deleteUsers', 'viewUsers'),
('documents-view', '/docs/index'),
('documents-view', '/docs/view'),
('documents-view', '/docs/view-docs'),
('documents-view', '/document/*'),
('editUserEmail', 'viewUserEmail'),
('editUsers', '/user-management/user/bulk-activate'),
('editUsers', '/user-management/user/bulk-deactivate'),
('editUsers', '/user-management/user/update'),
('editUsers', 'viewUsers'),
('employee', '/employee/*'),
('employee-view-only', '/employee/index'),
('employee-view-only', '/employee/view'),
('god', '/*'),
('god', 'assignRolesToUsers'),
('god', 'base'),
('god', 'bindUserToIp'),
('god', 'bulk-documents'),
('god', 'changeOwnPassword'),
('god', 'changeUserPassword'),
('god', 'createUsers'),
('god', 'damaged-list'),
('god', 'deleteUsers'),
('god', 'editUserEmail'),
('god', 'editUsers'),
('god', 'employee'),
('god', 'item-loan'),
('god', 'loan-list'),
('god', 'log-view'),
('god', 'manage-unit'),
('god', 'manageItems'),
('god', 'master-inventory'),
('god', 'repair-list'),
('god', 'viewItems'),
('god', 'viewRegistrationIp'),
('god', 'viewUserEmail'),
('god', 'viewUserRoles'),
('god', 'viewUsers'),
('god', 'viewVisitLog'),
('god', 'warehouse'),
('in-repair-view-only', '/unit/repair'),
('inventory-view', '/export/export-main'),
('inventory-view', '/export/item-detail'),
('inventory-view', '/item/dashboard-data'),
('inventory-view', '/item/details'),
('inventory-view', '/item/index'),
('inventory-view', '/item/item-name'),
('inventory-view', '/item/view'),
('inventory-view', '/item/view-image'),
('inventory-view', '/item/warehouse'),
('item-loan', '/lending/create'),
('item-loan', '/lending/index'),
('item-loan', '/lending/loan-unit'),
('lending-history', '/export/export-lending-history'),
('lending-history', '/lending/lending-history'),
('loan-list', '/export/export-lending'),
('loan-list', '/lending/lending-list'),
('loan-list', '/lending/list'),
('loan-list', '/lending/update'),
('loan-list', '/unit/return-unit'),
('loan-report', '/export/export-item-report'),
('loan-report', '/export/export-lending-history'),
('loan-report', '/export/export-unit-report'),
('loan-report', '/lending/history-detail'),
('loan-report', '/lending/item-report-active'),
('loan-report', '/lending/unit-report-active'),
('loaning-view-only', '/lending/index'),
('loaning-view-only', '/lending/item-report-active'),
('loaning-view-only', '/lending/lending-list'),
('loaning-view-only', '/lending/list'),
('loaning-view-only', '/lending/unit-report-active'),
('log-view', '/export/export-log'),
('log-view', '/export/export-log-single'),
('log-view', '/log/edit-log'),
('log-view', '/log/index'),
('log-view', '/log/search-result'),
('log-view', '/log/view'),
('log-view', '/log/view-log'),
('maintenance', 'base'),
('maintenance', 'changeOwnPassword'),
('maintenance', 'damaged-list'),
('maintenance', 'inventory-view'),
('maintenance', 'log-view'),
('maintenance', 'repair-list'),
('maintenance', 'repair-summary'),
('maintenance', 'warehouse-view-only'),
('manage-unit', '/unit/add-unit'),
('manage-unit', '/unit/available-lending'),
('manage-unit', '/unit/available-unit'),
('manage-unit', '/unit/bulk-add'),
('manage-unit', '/unit/bulk-add-preview'),
('manage-unit', '/unit/create'),
('manage-unit', '/unit/delete'),
('manage-unit', '/unit/index'),
('manage-unit', '/unit/update'),
('manage-unit', '/unit/view'),
('master-inventory', '/export/export-main'),
('master-inventory', '/export/item-detail'),
('master-inventory', '/export/wh-dist'),
('master-inventory', '/item/*'),
('master-inventory', '/item/create'),
('master-inventory', '/item/dashboard-data'),
('master-inventory', '/item/delete'),
('master-inventory', '/item/details'),
('master-inventory', '/item/index'),
('master-inventory', '/item/item-name'),
('master-inventory', '/item/pic-upload'),
('master-inventory', '/item/update'),
('master-inventory', '/item/view'),
('master-inventory', '/item/view-image'),
('master-inventory', '/item/warehouse'),
('master-inventory', '/unit/correction-search'),
('master-inventory', '/unit/correction-unit'),
('master-inventory', 'viewItems'),
('repair-list', '/export/export-repair'),
('repair-list', '/unit/finish-repair'),
('repair-list', '/unit/repair'),
('repair-summary', '/repair-log/index'),
('role-assign', '/user-management/user-permission/*'),
('role-assign', 'manageItems'),
('role-assign', 'viewItems'),
('sandbag', 'base'),
('sandbag', 'changeOwnPassword'),
('sandbag', 'damaged-view-only'),
('sandbag', 'employee-view-only'),
('sandbag', 'in-repair-view-only'),
('sandbag', 'loan-report'),
('sandbag', 'loaning-view-only'),
('sandbag', 'warehouse-view-only'),
('superadmin', 'Admin'),
('superadmin', 'assign-to-wh'),
('superadmin', 'assignRolesToUsers'),
('superadmin', 'base'),
('superadmin', 'bindUserToIp'),
('superadmin', 'bulk-documents'),
('superadmin', 'changeOwnPassword'),
('superadmin', 'changeUserPassword'),
('superadmin', 'createUsers'),
('superadmin', 'damaged-list'),
('superadmin', 'deleteUsers'),
('superadmin', 'editUserEmail'),
('superadmin', 'editUsers'),
('superadmin', 'employee'),
('superadmin', 'inventory-view'),
('superadmin', 'lending-history'),
('superadmin', 'loan-report'),
('superadmin', 'log-view'),
('superadmin', 'maintenance'),
('superadmin', 'manage-unit'),
('superadmin', 'manageItems'),
('superadmin', 'master-inventory'),
('superadmin', 'repair-list'),
('superadmin', 'repair-summary'),
('superadmin', 'role-assign'),
('superadmin', 'viewItems'),
('superadmin', 'viewRegistrationIp'),
('superadmin', 'viewUserEmail'),
('superadmin', 'viewUserRoles'),
('superadmin', 'viewUsers'),
('superadmin', 'viewVisitLog'),
('superadmin', 'warehouse'),
('viewUsers', '/user-management/user/grid-page-size'),
('viewUsers', '/user-management/user/index'),
('viewUsers', '/user-management/user/view'),
('viewVisitLog', '/user-management/user-visit-log/*'),
('warehouse', '/warehouse/create'),
('warehouse', '/warehouse/delete'),
('warehouse', '/warehouse/index'),
('warehouse', '/warehouse/item'),
('warehouse', '/warehouse/update'),
('warehouse', '/warehouse/view'),
('warehouse-view-only', '/warehouse/index'),
('warehouse-view-only', '/warehouse/item'),
('warehouse-view-only', '/warehouse/view');

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_group`
--

CREATE TABLE `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auth_item_group`
--

INSERT INTO `auth_item_group` (`code`, `name`, `created_at`, `updated_at`) VALUES
('admin-list', 'admin-list', 1730944343, 1730944343),
('base', 'BASE. REQUIRED TO USE THE APP', 1730952588, 1730952588),
('bulk-history', 'bulk-history', 1730944208, 1730944208),
('docs', 'docs', 1730944385, 1730944385),
('employee', 'employee', 1730944330, 1730944330),
('export', 'export', 1730944397, 1730944397),
('god', 'GOD MODE', 1730953336, 1730953336),
('inventory-master', 'inventory-master', 1730944142, 1730944142),
('loaning', 'loaning', 1730944247, 1730944247),
('maintenance', 'maintenance', 1730944271, 1730946203),
('manage-unit', 'manage-unit', 1730944191, 1730944191),
('unit-log', 'unit-log', 1730944222, 1730944222),
('userCommonPermissions', 'User common permission', 1729233881, 1729233881),
('userManagement', 'User management', 1729233881, 1729233881),
('warehouse', 'warehouse', 1730944302, 1730944302);

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `id` char(128) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`id`, `expire`, `data`) VALUES
('000448b255bc9f770e1a9d2453babba5', 2147483647, 0x613a323a7b693a303b733a31313a22496e204765627261756368223b693a313b4e3b7d),
('0014b32f64614e2214af12bbc87c1958', 2147483647, 0x613a323a7b693a303b733a32363a22417573676577c3a4686c746520416b7475616c6973696572656e223b693a313b4e3b7d),
('0045ddd53085016edb9cbd8988cde8e5', 2147483647, 0x613a323a7b693a303b733a35353a2242697374204475207369636865722c20646173732044752064696573657320456c656d656e74206cc3b6736368656e2077696c6c73743f223b693a313b4e3b7d),
('00d716905c8ed414aa0103ba17815795', 0, 0x613a323a7b693a303b613a333a7b693a303b4f3a31353a227969695c7765625c55726c52756c65223a31363a7b733a343a226e616d65223b733a333a22676969223b733a373a227061747465726e223b733a383a22235e676969242375223b733a343a22686f7374223b4e3b733a353a22726f757465223b733a31373a226769692f64656661756c742f696e646578223b733a383a2264656661756c7473223b613a303a7b7d733a363a22737566666978223b4e3b733a343a2276657262223b4e3b733a343a226d6f6465223b4e3b733a31323a22656e636f6465506172616d73223b623a313b733a31303a226e6f726d616c697a6572223b4e3b733a31353a22002a00637265617465537461747573223b4e3b733a31353a22002a00706c616365686f6c64657273223b613a303a7b7d733a32363a22007969695c7765625c55726c52756c65005f74656d706c617465223b733a353a222f6769692f223b733a32373a22007969695c7765625c55726c52756c65005f726f75746552756c65223b4e3b733a32383a22007969695c7765625c55726c52756c65005f706172616d52756c6573223b613a303a7b7d733a32393a22007969695c7765625c55726c52756c65005f726f757465506172616d73223b613a303a7b7d7d693a313b4f3a31353a227969695c7765625c55726c52756c65223a31363a7b733a343a226e616d65223b733a31323a226769692f3c69643a5c772b3e223b733a373a227061747465726e223b733a32373a22235e6769692f283f503c6162663339363735303e5c772b29242375223b733a343a22686f7374223b4e3b733a353a22726f757465223b733a31363a226769692f64656661756c742f76696577223b733a383a2264656661756c7473223b613a303a7b7d733a363a22737566666978223b4e3b733a343a2276657262223b4e3b733a343a226d6f6465223b4e3b733a31323a22656e636f6465506172616d73223b623a313b733a31303a226e6f726d616c697a6572223b4e3b733a31353a22002a00637265617465537461747573223b4e3b733a31353a22002a00706c616365686f6c64657273223b613a313a7b733a393a22616266333936373530223b733a323a226964223b7d733a32363a22007969695c7765625c55726c52756c65005f74656d706c617465223b733a31303a222f6769692f3c69643e2f223b733a32373a22007969695c7765625c55726c52756c65005f726f75746552756c65223b4e3b733a32383a22007969695c7765625c55726c52756c65005f706172616d52756c6573223b613a313a7b733a323a226964223b733a383a22235e5c772b242375223b7d733a32393a22007969695c7765625c55726c52756c65005f726f757465506172616d73223b613a303a7b7d7d693a323b4f3a31353a227969695c7765625c55726c52756c65223a31363a7b733a343a226e616d65223b733a34313a226769692f3c636f6e74726f6c6c65723a5b5c775c2d5d2b3e2f3c616374696f6e3a5b5c775c2d5d2b3e223b733a373a227061747465726e223b733a35343a22235e6769692f283f503c6134636632363639613e5b5c775c2d5d2b292f283f503c6134376363386339323e5b5c775c2d5d2b29242375223b733a343a22686f7374223b4e3b733a353a22726f757465223b733a32353a226769692f3c636f6e74726f6c6c65723e2f3c616374696f6e3e223b733a383a2264656661756c7473223b613a303a7b7d733a363a22737566666978223b4e3b733a343a2276657262223b4e3b733a343a226d6f6465223b4e3b733a31323a22656e636f6465506172616d73223b623a313b733a31303a226e6f726d616c697a6572223b4e3b733a31353a22002a00637265617465537461747573223b4e3b733a31353a22002a00706c616365686f6c64657273223b613a323a7b733a393a22613463663236363961223b733a31303a22636f6e74726f6c6c6572223b733a393a22613437636338633932223b733a363a22616374696f6e223b7d733a32363a22007969695c7765625c55726c52756c65005f74656d706c617465223b733a32373a222f6769692f3c636f6e74726f6c6c65723e2f3c616374696f6e3e2f223b733a32373a22007969695c7765625c55726c52756c65005f726f75746552756c65223b733a35343a22235e6769692f283f503c6134636632363639613e5b5c775c2d5d2b292f283f503c6134376363386339323e5b5c775c2d5d2b29242375223b733a32383a22007969695c7765625c55726c52756c65005f706172616d52756c6573223b613a303a7b7d733a32393a22007969695c7765625c55726c52756c65005f726f757465506172616d73223b613a323a7b733a31303a22636f6e74726f6c6c6572223b733a31323a223c636f6e74726f6c6c65723e223b733a363a22616374696f6e223b733a383a223c616374696f6e3e223b7d7d7d693a313b4e3b7d),
('0131eb2d6200a0a06ec8c0eea5703761', 2147483647, 0x613a323a7b693a303b733a31323a2250696c6968206265726b6173223b693a313b4e3b7d),
('015e7707a0822df0572d80de61a87771', 2147483647, 0x613a323a7b693a303b733a363a22426168617361223b693a313b4e3b7d),
('02184bffcca1aa6776bb6f92b13764b3', 2147483647, 0x613a323a7b693a303b733a31313a2247616d626172204974656d223b693a313b4e3b7d),
('0345d51e20cef06d150b18ad7535dd0f', 1735093396, 0x613a323a7b693a303b733a31313a224b656c6f6c6120556e6974223b693a313b4e3b7d),
('04ec49e874ca6ce1c2ef5f5199f42c68', 2147483647, 0x613a323a7b693a303b733a393a2253706569636865726e223b693a313b4e3b7d),
('0500648d1fa6d5222390f16faad74fec', 2147483647, 0x613a323a7b693a303b733a36303a224dc3a4c39f6967206265736368c3a46469677420286573206665686c742065696e205465696c206f6465722065696e65204b6f6d706f6e656e746529223b693a313b4e3b7d),
('05c393c001e184658389e0d68523f7ff', 2147483647, 0x613a323a7b693a303b733a323a224f4b223b693a313b4e3b7d),
('0617be15577cf0eb2890793156a0c32c', 2147483647, 0x613a323a7b693a303b733a31313a224e6f6d6f7220536572693a223b693a313b4e3b7d),
('06d43befa26f40389425483d0f0ebe92', 2147483647, 0x613a323a7b693a303b733a36353a22556e697420504341202d30303031202d303030312064697065726261696b692e20446962617761206b6520677564616e67206f6c656820737570657261646d696e223b693a313b4e3b7d),
('0782e711e794596f9d5e3b64d8eb27b7', 1735093338, 0x613a323a7b693a303b733a31343a2255706c6f61642d5665726c617566223b693a313b4e3b7d),
('0a2d697487d8bd8d392c897d22d90007', 2147483647, 0x613a323a7b693a303b733a31303a225374617274646174756d223b693a313b4e3b7d),
('0a79c4dfdf2f53b2d0476d28d1110efb', 2147483647, 0x613a323a7b693a303b733a31313a22496e204765627261756368223b693a313b4e3b7d),
('0af169ea0a00a70993a115b58f9e995c', 2147483647, 0x613a323a7b693a303b733a32343a22417274696b656c64657461696c7320696e204c616765726e223b693a313b4e3b7d),
('0b727c4ede7cb592f052a221ba7cae3a', 2147483647, 0x613a323a7b693a303b733a31333a224e616d612050656e6767756e61223b693a313b4e3b7d),
('0be2d1a313ca185900fc2844b6948c34', 2147483647, 0x613a323a7b693a303b733a31313a2247616d62617220556e6974223b693a313b4e3b7d),
('0ec1fe9a5b96b836ec58c152e0ebe881', 2147483647, 0x613a323a7b693a303b733a37323a2245696e68656974205043412d303030312d3030303120766f6e20467265646479207a7572c3bc636b6765676562656e2c20766f6e20537570657261646d696e20657268616c74656e223b693a313b4e3b7d),
('103f454413cdb288fe4a28d90e58f1d7', 2147483647, 0x613a323a7b693a303b733a35333a22556e6974206261727520506161202d30303031202d3030363520646974616d6261686b616e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('106b01cddacaaf5e4953142e41a61a94', 2147483647, 0x613a323a7b693a303b733a32353a2242656e75747a65722d4265737563687370726f746f6b6f6c6c223b693a313b4e3b7d),
('1073ef0da0e33e4808893a4bda290373', 2147483647, 0x613a323a7b693a303b733a33353a224a756d6c61682053617475616e204b616c692079616e6720446970696e6a616d6b616e223b693a313b4e3b7d),
('112444df135ded5b8efc403ed0891ce9', 2147483647, 0x613a323a7b693a303b733a32313a2256657277656e64756e677370726f746f6b6f6c6c65223b693a313b4e3b7d),
('1279c37f6d10163576fff58e3dcfe095', 2147483647, 0x613a323a7b693a303b733a36363a2245696e68656974205041412d303030312d30303031207265706172696572742e20566f6d20537570657261646d696e20696e73204c61676572206765627261636874223b693a313b4e3b7d),
('12bed4d0992fd65e3d0bfa236291d074', 2147483647, 0x613a323a7b693a303b733a31393a2256657266c3bc6762617220696d204c61676572223b693a313b4e3b7d),
('12fbf2614da446a3694e7ed7db71fdcb', 1735093363, 0x613a323a7b693a303b733a32303a2241646d696e2d4c61676572207a7577656973656e223b693a313b4e3b7d),
('130c7bf44f4f33353534456b72b4f634', 2147483647, 0x613a323a7b693a303b733a363a22537461747573223b693a313b4e3b7d),
('134d7765239e6f7631a42cc631d30b1c', 2147483647, 0x613a323a7b693a303b733a363a224b656c756172223b693a313b4e3b7d),
('147ef379ba3c7d2207a7549a138b10ac', 2147483647, 0x613a323a7b693a303b733a31363a224d656d627561742050656e6767756e61223b693a313b4e3b7d),
('15683b3a1425a9231a9bacda735efa79', 2147483647, 0x613a323a7b693a303b733a343a2243617269223b693a313b4e3b7d),
('1679e7b90a9aa9f01ca8fa2a5d2f4193', 2147483647, 0x613a323a7b693a303b733a31333a2250656e67656d62616c69616e20223b693a313b4e3b7d),
('17044500687fc7199fcce2b0415d53ef', 2147483647, 0x613a323a7b693a303b733a3132333a2241646d696e2057617265686f7573652c20616b756e20416e646120746964616b206d656d696c696b692057617265686f7573652079616e6720646974657461706b616e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('1737312afb6ecd9024aaf1dedfa8deb3', 2147483647, 0x613a323a7b693a303b733a37313a2245696e68656974205041412d303030312d3030303120766f6e204a6f68616e207a7572c3bc636b6765676562656e2c20766f6d20537570657261646d696e20657268616c74656e223b693a313b4e3b7d),
('17de87b5c31987ae676ac3c8f5b85db2', 2147483647, 0x613a323a7b693a303b733a33353a2241706120416e64612079616b696e20696e67696e206d656e67686170757320696e693f223b693a313b4e3b7d),
('1858f50649cdf450bab4378abefcc697', 2147483647, 0x613a323a7b693a303b733a373a22496e616b746976223b693a313b4e3b7d),
('18dd1e88e4a953a2e66380508713d866', 1735093346, 0x613a323a7b693a303b733a32343a22417274696b656c2d4461726c6568656e7362657269636874223b693a313b4e3b7d),
('19586ffb81a02ec8d793b72557824f9c', 2147483647, 0x613a323a7b693a303b733a32313a2244657461696c204974656d20446920477564616e67223b693a313b4e3b7d),
('1ae9034136e035ba5cbaca6238ce1c42', 1735093361, 0x613a323a7b693a303b733a383a2242656e75747a6572223b693a313b4e3b7d),
('1b1f3e55cc07dd3846cfe77408fd6f44', 2147483647, 0x613a323a7b693a303b733a31343a22476573616d7420417274696b656c223b693a313b4e3b7d),
('1b66e3b92d34558e5efc26d3326229ff', 2147483647, 0x613a323a7b693a303b733a31323a224e616d61204265726b617320223b693a313b4e3b7d),
('1baaed5262afa015c96379a445d5cf6c', 1735093327, 0x613a323a7b693a303b733a31363a2245696e68656974207665726c6f72656e223b693a313b4e3b7d),
('1c1a8beb309873dd7cd25d619efa94f1', 2147483647, 0x613a323a7b693a303b733a383a224b6f6d656e746172223b693a313b4e3b7d),
('1c1f9fa4f1ab1914cd780c9fb3003163', 1735093402, 0x613a323a7b693a303b733a31353a224461667461722050696e6a616d616e223b693a313b4e3b7d),
('1d0a25ea7667cccb839fdc81eb1638bb', 1735093443, 0x613a323a7b693a303b733a31373a22556c616e6769206b6174612073616e6469223b693a313b4e3b7d),
('1fe64a5cdc1994216a1a7969d9d37967', 2147483647, 0x613a323a7b693a303b733a31363a2254616d6261686b616e20477564616e67223b693a313b4e3b7d),
('207d658a76603f9e09022b6fcb399b7c', 2147483647, 0x613a323a7b693a303b733a31313a22546964616b20416b746966223b693a313b4e3b7d),
('20b5da0c9bbbe252b8353883eacebefe', 2147483647, 0x613a323a7b693a303b733a31313a224d69746172626569746572223b693a313b4e3b7d),
('21df02c8610fb6755edd182b30c53817', 2147483647, 0x613a323a7b693a303b733a35303a22477564616e67206d61736968206d656e79696d70616e20626172616e67202d20626172616e672064692064616c616d6e7961223b693a313b4e3b7d),
('21ebcae4553c64373dd9bf060f384669', 2147483647, 0x613a323a7b693a303b733a31333a225370726163686175737761686c223b693a313b4e3b7d),
('21f93b737da5ced9a41e1d29215d825c', 2147483647, 0x613a323a7b693a303b733a3132373a22477564616e672041646d696e2e20416b756e20416e646120746964616b206d656d696c696b6920477564616e672079616e6720646974657461706b616e20756e74756b206974752e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('223aa1df008299499fd7348b7d30e4fc', 1735093441, 0x613a323a7b693a303b733a373a2255706461746564223b693a313b4e3b7d),
('224c578c40263d42574c1d14ffa99baa', 2147483647, 0x613a323a7b693a303b733a38363a224b6172796177616e20746964616b20646170617420646968617075732e2053617475616e20626172616e672079616e67206d6173696820646970696e6a616d6b616e206b6570616461206b6172796177616e20696e69223b693a313b4e3b7d),
('2367836179fdb4cb0c8807faf6876fe2', 2147483647, 0x613a323a7b693a303b733a353a22446174756d223b693a313b4e3b7d),
('24681e30c3c2888e3404743c527ca340', 2147483647, 0x613a323a7b693a303b733a31383a2242756174204b617465676f7269204974656d223b693a313b4e3b7d),
('247b974371055c0f77624dd901414f7d', 1735093390, 0x613a323a7b693a303b733a31313a2247616d626172204974656d223b693a313b4e3b7d),
('2494ca0d9e452f7dabc9c02cd8fb6c8d', 2147483647, 0x613a323a7b693a303b733a31383a22416b7475656c6c65732050617373776f7274223b693a313b4e3b7d),
('24c232fe6ecdd32037281e4be5bdce2f', 2147483647, 0x613a323a7b693a303b733a33333a22417274696b656c20696d204c61676572204a4f4720434f4e444f4e474341545552223b693a313b4e3b7d),
('24c93e227a88bea3474d7de60a5b9d46', 2147483647, 0x613a323a7b693a303b733a32383a224d617373656e2d55706c6f61642066c3bc722045696e68656974656e223b693a313b4e3b7d),
('25640547e982846e2587036dc7496332', 2147483647, 0x613a323a7b693a303b733a36303a2245696e68656974205041412d303030312d3030303120766f6d20537570657261646d696e207a75722052657061726174757220676573636869636b74223b693a313b4e3b7d),
('25c67a9c34a6889800d15be7086896d8', 2147483647, 0x613a323a7b693a303b733a32383a2257c3a4686c656e205369652065696e65205370726163686520617573223b693a313b4e3b7d),
('266a8501eb03a7ad79ea1d37e99b5db6', 2147483647, 0x613a323a7b693a303b733a35363a2245696e68656974205043412d303030312d3030303120766f6e20537570657261646d696e20616e20467265646479207665726c696568656e223b693a313b4e3b7d),
('27d3a4de2bd78b917681c9b938f7cf96', 1735093400, 0x613a323a7b693a303b733a31303a2250656d696e6a616d616e223b693a313b4e3b7d),
('27e29450577a5b917122b596ce98e022', 2147483647, 0x613a323a7b693a303b733a31373a224b6f6e6669726d6173692053696d70616e223b693a313b4e3b7d),
('28218c16221c9d17d95c9056214b0bae', 2147483647, 0x613a323a7b693a303b733a31383a22426572686173696c20646973696d70616e2e223b693a313b4e3b7d),
('2825394b0ede73de7073daed25571514', 2147483647, 0x613a323a7b693a303b733a33363a2254657461706b616e2041646d696e20477564616e67206672616e7a66657264696e616e64223b693a313b4e3b7d),
('285514f8900f6100f7ba6ac0f39a7cfd', 2147483647, 0x613a323a7b693a303b733a31343a225374617475732077c3a4686c656e223b693a313b4e3b7d),
('28a892ec3e65a04832e646d86e0d0927', 1735093364, 0x613a323a7b693a303b733a31363a2242656e75747a65726f7074696f6e656e223b693a313b4e3b7d),
('2aa2cf41abdab2201663b6b1107557c0', 2147483647, 0x613a323a7b693a303b733a31383a2254616d6261686b616e204b6172796177616e223b693a313b4e3b7d),
('2aaf7bcef5718b7432273dbed6e97514', 2147483647, 0x613a323a7b693a303b733a36323a2245696e68656974205041412d303030312d303030312c20646965204a6f68616e20766f6d20537570657261646d696e2067656c696568656e207775726465223b693a313b4e3b7d),
('2b04106b22eae0ff14c748afb4642480', 2147483647, 0x613a323a7b693a303b733a31393a224c6f672050656e6767756e61616e20556e6974223b693a313b4e3b7d),
('2b7b69cd710b2b5d0d1a3bbabb9041a5', 2147483647, 0x613a323a7b693a303b733a31333a224c6968617420646f6b756d656e223b693a313b4e3b7d),
('2badc429137ced5c122e99ca3a765f9a', 2147483647, 0x613a323a7b693a303b733a36323a22556e697420506161202d30303031202d3030363420646970696e6a616d6b616e206b657061646120467265646479206f6c656820737570657261646d696e223b693a313b4e3b7d),
('2cb49542399150c4544f378b26545edb', 1735093341, 0x613a323a7b693a303b733a31363a224461726c6568656e7376657267616265223b693a313b4e3b7d),
('2d0b245fe038e387871b8f5ead34bb38', 2147483647, 0x613a323a7b693a303b733a33323a2241646d696e6973747261746f722064656d204c61676572207a7577656973656e223b693a313b4e3b7d),
('2d3e68568f2536fc74f43ee541ee84e8', 1735093358, 0x613a323a7b693a303b733a31323a224172626569746e65686d6572223b693a313b4e3b7d),
('2d606dfe6a3e063f5ff6a049f3fe6bde', 2147483647, 0x613a323a7b693a303b733a31343a2253657269656e6e756d6d65723a20223b693a313b4e3b7d),
('2e07de5d75aba8a7c6bf7365730def81', 2147483647, 0x613a323a7b693a303b733a31333a224c61676572616472657373653a223b693a313b4e3b7d),
('2e75736f34cb692650ceeb0a074aaab3', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420506161202d30303031202d303030312064696b6972696d20756e74756b2064697065726261696b69206f6c656820737570657261646d696e223b693a313b4e3b7d),
('30e7e57eb898cb5c8a133c125150b30d', 1735093335, 0x613a323a7b693a303b733a31373a22417274696b656c204b617465676f726965223b693a313b4e3b7d),
('3119f35bb188d5e48b15a91a87354615', 2147483647, 0x613a323a7b693a303b733a36323a22556e697420544341202d30303031202d3030303220646970696e6a616d6b616e206b657061646120467265646479206f6c656820737570657261646d696e223b693a313b4e3b7d),
('32336e70d136fb76a26933087ea215ac', 2147483647, 0x613a323a7b693a303b733a34333a224dc3b6636874656e2053696520646965204461746569656e207769726b6c696368206cc3b6736368656e3f223b693a313b4e3b7d),
('330cf4581138dba05a34a3913d5c695b', 2147483647, 0x613a323a7b693a303b733a38333a224b6172796177616e20746964616b20646170617420646968617075732e2041646120626172616e672079616e67206d6173696820646970696e6a616d6b616e206b6570616461206b6172796177616e20696e69223b693a313b4e3b7d),
('348fa1ecbb72a6c30aaec4bab27dc778', 1735093376, 0x613a323a7b693a303b733a31373a2254616d626168206974656d20626172752e223b693a313b4e3b7d),
('34b7c68c032774412ab29f3e84cf988e', 2147483647, 0x613a323a7b693a303b733a33393a225a7573616d6d656e66617373756e67206465722052657061726174757270726f746f6b6f6c6c65223b693a313b4e3b7d),
('35649a1ef35e050231b8b929ffc99ff1', 2147483647, 0x613a323a7b693a303b733a31303a224b65746572616e67616e223b693a313b4e3b7d),
('367c9510ff83db6c592ad903bb748227', 2147483647, 0x613a323a7b693a303b733a31333a224e616d61204b617465676f7269223b693a313b4e3b7d),
('37055e639af81d71af6a842b3227143d', 2147483647, 0x613a323a7b693a303b733a31353a2255626168206b6174612073616e6469223b693a313b4e3b7d),
('383a8e36a3555b5afe7949764d2a3f87', 2147483647, 0x613a323a7b693a303b733a353a22456d61696c223b693a313b4e3b7d),
('387aefb09f644d6d4618ff810abe19f9', 2147483647, 0x613a323a7b693a303b733a32303a22446970696e6a616d2f446970696e6a616d6b616e223b693a313b4e3b7d),
('389f860baa888f65a1abf56512661d77', 2147483647, 0x613a323a7b693a303b733a35393a22556e697420507561202d30303031202d3030303320646970696e6a616d6b616e206b65205368696f72696e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('3a315be6b9a8bce0745149a7df4c33d3', 2147483647, 0x613a323a7b693a303b733a37313a22556e697420544341202d30303031202d303030322064696b656d62616c696b616e206f6c6568204672656464792c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('3b0b0045885337ebceed1a6951478b6a', 2147483647, 0x613a323a7b693a303b733a36373a2245696e68656974205041412d303030312d30303031207a75722052657061726174757220647572636820626f627468657265706169726d616e20676573636869636b74223b693a313b4e3b7d),
('3bf96d8b774f7d1bbd716bd91ddf0f03', 2147483647, 0x613a323a7b693a303b733a393a224261756d7374616d6d223b693a313b4e3b7d),
('3cbb8931c3c701ee040cb91e381cf970', 2147483647, 0x613a323a7b693a303b733a31363a22417274696b656c20696d204c61676572223b693a313b4e3b7d),
('3d3601291f756c732954f7414875a441', 1735093360, 0x613a323a7b693a303b733a31313a2241646d696e204d656ec3bc223b693a313b4e3b7d),
('3e8a366f2f820cd5ca7faf4004d2a9fa', 2147483647, 0x613a323a7b693a303b733a33313a22556e69742064697065726261696b692064616e20646970657262617275692e223b693a313b4e3b7d),
('3ecd72f2ca0098638d5e63f255eb256c', 2147483647, 0x613a323a7b693a303b733a31313a224e616d6120477564616e67223b693a313b4e3b7d),
('3f48a8ce14738edc537a0e4ee03ed17f', 2147483647, 0x613a323a7b693a303b733a373a2253707261636865223b693a313b4e3b7d),
('3ffa962447c7c4bd3634707b912ec49d', 2147483647, 0x613a323a7b693a303b733a32373a22417274696b656c6b617465676f7269652061757377c3a4686c656e223b693a313b4e3b7d),
('402aa72faae3c30e3d1777d4753941d7', 2147483647, 0x613a323a7b693a303b733a35363a22556e697420564441202d30303032202d3030303120646970696e6a616d6b616e206b65204f6c6567206f6c656820737570657261646d696e223b693a313b4e3b7d),
('40d6cbba7e73bba0549973eea4a08ef2', 2147483647, 0x613a323a7b693a303b733a32343a2254616d6261686b616e20556e6974204974656d2042617275223b693a313b4e3b7d),
('40d8d692a44654fb72e3ca69498e3f65', 2147483647, 0x613a323a7b693a303b733a373a2254656c65666f6e223b693a313b4e3b7d),
('419f3c1c370803df8a5b173771eadb99', 2147483647, 0x613a323a7b693a303b733a32313a22456c656d656e7420616b7475616c6973696572656e223b693a313b4e3b7d),
('43165f079f514323ff689e807ab4fade', 1735093353, 0x613a323a7b693a303b733a31393a22476572c3a47420696e20526570617261747572223b693a313b4e3b7d),
('450dd88c120ce040f2529638378c61c8', 2147483647, 0x613a323a7b693a303b733a35343a224b6f6d6d656e74617220736f6c6c746520496e666f726d6174696f6e656e207a75722052657061726174757220656e7468616c74656e223b693a313b4e3b7d),
('4748331ec4b4b314e5b3e36e420d2716', 2147483647, 0x613a323a7b693a303b733a373a2254616e6767616c223b693a313b4e3b7d),
('4908e844bace6c08e41838ea603ff058', 2147483647, 0x613a323a7b693a303b733a32343a22456b73706f722044617461204c6f67206b65202e786c7378223b693a313b4e3b7d),
('493ad1b792334a1b8030b7f342942dea', 2147483647, 0x613a323a7b693a303b733a343a224e616d61223b693a313b4e3b7d),
('4992018ac6f4a2db89bd03ed01de9ee7', 2147483647, 0x613a323a7b693a303b733a34333a22556e7769656465726272696e676c696368206265736368c3a464696774206f646572207665726c6f72656e223b693a313b4e3b7d),
('4ad5a55dced16e2ab8b1fd4d4fd8e28d', 2147483647, 0x613a323a7b693a303b733a3130363a2245696e68656974205041412d303030322d30303031207a7572c3bc636b6765676562656e20766f6e204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e2c20657268616c74656e20766f6e20537570657261646d696e223b693a313b4e3b7d),
('4ceaf947af315e14c419e6876db4d23d', 2147483647, 0x613a323a7b693a303b733a31383a225665726c69657274206f646572207a65722d223b693a313b4e3b7d),
('4d7ef5af824a5699c218abe00aea9f0f', 2147483647, 0x613a323a7b693a303b733a31363a2254616d70696c6b616e2047616d626172223b693a313b4e3b7d),
('5001f80eceee17bf7573e19e6cd6e13d', 1735093330, 0x613a323a7b693a303b733a343a2242696c64223b693a313b4e3b7d),
('508cd682899e906086929b60b2584e05', 2147483647, 0x613a323a7b693a303b733a31343a2250696e6a616d6b616e20556e6974223b693a313b4e3b7d),
('50d23186107c3ae0d6844cf9b091f5d5', 2147483647, 0x613a323a7b693a303b733a393a22477564616e67204944223b693a313b4e3b7d),
('510e12c841471e8a87a9c7ae6657b2d8', 2147483647, 0x613a323a7b693a303b733a39303a2245696e68656974205043412d303030322d3030303420766f6e20537570657261646d696e20616e204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e207665726c696568656e223b693a313b4e3b7d),
('51774da7ccec300cb09c4416fa7290c2', 2147483647, 0x613a323a7b693a303b733a31343a22417274696b656c64657461696c73223b693a313b4e3b7d),
('519e70f2ab8654bd476f06c282236050', 2147483647, 0x613a323a7b693a303b733a32333a2275626168206b6174612073616e64692073656e64697269223b693a313b4e3b7d),
('525cbf30ba1ef80c679f89546d0830ed', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420506161202d30303031202d3030303120646970696e6a616d6b616e206b6570616461204a6f68616e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('528871360210fb0643b6eab032409b88', 2147483647, 0x613a323a7b693a303b733a3131323a224d656e756761736b616e20677564616e67206b652061646d696e20616b616e206d656d62617461736920616b756e20616761722068616e7961206461706174206d656e67616b736573206974656d202620677564616e672074656d706174206d6572656b6120646974756761736b616e223b693a313b4e3b7d),
('52fd6b029edd8aaf26bfc9d8e682cc12', 2147483647, 0x613a323a7b693a303b733a36323a22556e697420504341202d30303031202d3030303120646970696e6a616d6b616e206b657061646120467265646479206f6c656820737570657261646d696e223b693a313b4e3b7d),
('534f18c9afa48a0eba3764dd0c285948', 2147483647, 0x613a323a7b693a303b733a32393a224c65626968206461726920333635206861726920283120746168756e29223b693a313b4e3b7d),
('5380c64866f5526afec242fe52093d65', 2147483647, 0x613a323a7b693a303b733a31383a2254616d6261686b616e2070656e6767756e61223b693a313b4e3b7d),
('53d0b1b185589e86817d46e1ae93aae9', 2147483647, 0x613a323a7b693a303b733a31323a2253657269656e6e756d6d6572223b693a313b4e3b7d),
('55341ca9e7d8c0eb26397729ccd8c3db', 2147483647, 0x613a323a7b693a303b733a32333a224d697461726265697465722068696e7a7566c3bc67656e223b693a313b4e3b7d),
('556e1677b17d05b93d515c48288a3930', 2147483647, 0x613a323a7b693a303b733a31393a2250726f746f6b6f6c6c646174756d20456e6465223b693a313b4e3b7d),
('55fb9439a304fe88449a68920d51361d', 2147483647, 0x613a323a7b693a303b733a31323a22696e20526570617261747572223b693a313b4e3b7d),
('571eb69979a128ec12f4c947937ae7cc', 2147483647, 0x613a323a7b693a303b733a383a2241626d656c64656e223b693a313b4e3b7d),
('575e89b3d42368e1ebcc65f28c075156', 2147483647, 0x613a323a7b693a303b733a33343a22496e2052657061726174757220626566696e646c696368652045696e68656974656e223b693a313b4e3b7d),
('5825e2391dbfd7ee39232f6e5aa8f53f', 2147483647, 0x613a323a7b693a303b733a31363a224c65696368746572205363686164656e223b693a313b4e3b7d),
('58b41f104ab8b556b89bfac61b8bd7ae', 2147483647, 0x613a323a7b693a303b733a31383a2250696c6968204b6f6e6469736920556e6974223b693a313b4e3b7d),
('58b883f0d8fad0662c6280c9ef43b4af', 2147483647, 0x613a323a7b693a303b733a39393a2241646d696e2057617265686f7573652e20546964616b206164612057617265686f7573652061737369676e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('58f7ea520b516328a47f41cb9c78bbc3', 2147483647, 0x613a323a7b693a303b733a32373a22c3846c74657220616c732037205461676520283120576f63686529223b693a313b4e3b7d),
('591b1f56813da3255af4562b4852c848', 2147483647, 0x613a323a7b693a303b733a31313a22417274696b656c62696c64223b693a313b4e3b7d),
('591dcd573a871680349e9886b7578b95', 1735093407, 0x613a323a7b693a303b733a32313a224c61706f72616e2050696e6a616d616e20556e6974223b693a313b4e3b7d),
('594974c10bbd6a6eda5e6c9e981e6803', 2147483647, 0x613a323a7b693a303b733a33303a225245504152415455522d5645525343484c4f5353454e45205354454c4c45223b693a313b4e3b7d),
('5a2a8653b88b31d9a84d1535e85189c4', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420564441202d30303034202d3030303320646970696e6a616d6b616e206b6570616461204a6f68616e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('5a9bffad9c2bf01b40913e1b549027e3', 2147483647, 0x613a323a7b693a303b733a31383a22556e69742079616e67205465727365646961223b693a313b4e3b7d),
('5ac066619ee86373a0f8b0d6bccca294', 1735093434, 0x613a323a7b693a303b733a31303a224d656e752041646d696e223b693a313b4e3b7d),
('5ca62e4018976cb07a869c5dc315cad9', 1735093428, 0x613a323a7b693a303b733a363a22477564616e67223b693a313b4e3b7d),
('5cce5f7a376d69595c9183051ba1d474', 2147483647, 0x613a323a7b693a303b733a32333a224c656968656e205369652065696e652045696e68656974223b693a313b4e3b7d),
('5d743cf17417089a96e3a7ec194c6b78', 1735093343, 0x613a323a7b693a303b733a31323a225665726c6569686c69737465223b693a313b4e3b7d),
('5df4429e94412a8254634c3b8270fa9e', 2147483647, 0x613a323a7b693a303b733a33333a2254616d6261686b616e20556e69742064616c616d204a756d6c6168204265736172223b693a313b4e3b7d),
('5f25bfbe8c654089942e54c22c27f221', 2147483647, 0x613a323a7b693a303b733a31323a2249642057617265686f757365223b693a313b4e3b7d),
('5f2fb05825fb47e4fbfca3f7ad5b67aa', 2147483647, 0x613a323a7b693a303b733a31333a22416c616d617420477564616e67223b693a313b4e3b7d),
('602811cbab7fa6e4b3782b15fc74fb10', 1735093310, 0x613a323a7b693a303b733a32313a22652d6d61696c202862657374c3a4746967656e293a223b693a313b4e3b7d),
('6145c654bb14be0968701c2cc59c1eb7', 2147483647, 0x613a323a7b693a303b733a383a2254756761736b616e223b693a313b4e3b7d),
('6202a1d6744074f5ed42bd21b9669ff9', 2147483647, 0x613a323a7b693a303b733a363a22537461747573223b693a313b4e3b7d),
('62a898fcf6914b3b71aebcc6e4451b0d', 1735093377, 0x613a323a7b693a303b733a32303a22456b73706f722044617461206b65202e786c7378223b693a313b4e3b7d),
('633c5bf069d539e078d850c81f08f05a', 2147483647, 0x613a323a7b693a303b733a36363a22556e697420506161202d30303031202d303030312064696b6972696d20756e74756b2064697065726261696b69206f6c656820626f627468657265706169726d616e223b693a313b4e3b7d),
('6360fdaad318b3ed534d4940cf61f871', 2147483647, 0x613a323a7b693a303b733a31333a224b6f6465204b617465676f7269223b693a313b4e3b7d),
('636650e489a7a1c941618180a603b6f6', 1735093344, 0x613a323a7b693a303b733a31343a224b7265646974686973746f726965223b693a313b4e3b7d),
('64e6cd68c65748abd22eefb1c7542973', 2147483647, 0x613a323a7b693a303b733a31343a22576172656e6c616765726e616d65223b693a313b4e3b7d),
('652b0ef63c82fb454e3f12bba142d6f8', 1735093387, 0x613a323a7b693a303b733a31313a22556e69742048696c616e67223b693a313b4e3b7d),
('65fcf2ae37cbed7aa9035a4623afe79f', 1735093384, 0x613a323a7b693a303b733a31343a22536564616e6720446970616b6169223b693a313b4e3b7d),
('66544bedead1543694d571fa93818568', 1735093333, 0x613a323a7b693a303b733a383a22496e76656e746172223b693a313b4e3b7d),
('67798973f55184d3ad58c2f1c724b16b', 2147483647, 0x613a323a7b693a303b733a373a2254656c65706f6e223b693a313b4e3b7d),
('680d65da73d7d1a6dbfe558f06730a93', 2147483647, 0x613a323a7b693a303b733a33363a2250726174696e6a617520556e69742079616e6720416b616e20446974616d6261686b616e223b693a313b4e3b7d),
('6864aecd84141eb98890555ff46d4d5f', 2147483647, 0x613a323a7b693a303b733a34353a22527573616b2079616e6720746964616b2064617061742064697065726261696b6920617461752048696c616e67223b693a313b4e3b7d),
('69f8ba258d217780a97c0b032dbf0c91', 2147483647, 0x613a323a7b693a303b733a35363a2245696e68656974205041412d303030342d3030303420766f6e20537570657261646d696e20616e20467265646479207665726c696568656e223b693a313b4e3b7d),
('69fa86fb914ea14ed6a4564df596d68c', 1735093323, 0x613a323a7b693a303b733a31313a22496e204765627261756368223b693a313b4e3b7d),
('6ae6bf78215fcc6141f6883cc66f0892', 2147483647, 0x613a323a7b693a303b733a34343a2243756b757020727573616b2028746964616b206164612062616769616e2061746175206b6f6d706f6e656e29223b693a313b4e3b7d),
('6af28923c2e66a8d9a3c9bd6019b68c6', 2147483647, 0x613a323a7b693a303b733a33353a2241706120416e64612079616b696e20696e67696e206d656e67686170757320696e693f223b693a313b4e3b7d),
('6b0e8172177c9616a1aca8b5f84eeea2', 2147483647, 0x613a323a7b693a303b733a31353a2244616c616d207065726261696b616e223b693a313b4e3b7d),
('6ca87b923cfdcdadb358bb00286d692a', 1735093352, 0x613a323a7b693a303b733a32303a224265736368c3a464696774652045696e68656974223b693a313b4e3b7d),
('6ea5fc7760cae78444737f7e7e2f4c44', 2147483647, 0x613a323a7b693a303b733a31373a22526570617261747572206265656e64656e223b693a313b4e3b7d),
('6f007180d533b963c049c420a95a6fa6', 2147483647, 0x613a323a7b693a303b733a32343a22456967656e65732050617373776f727420c3a46e6465726e223b693a313b4e3b7d),
('717e5fb1a71a948ba1d7a8e1531c0d7b', 2147483647, 0x613a323a7b693a303b733a32383a224c65626968206461726920372068617269202831206d696e67677529223b693a313b4e3b7d),
('7281dd80d00fe72b1174c6e799909816', 2147483647, 0x613a323a7b693a303b733a343a2242756174223b693a313b4e3b7d),
('73243126e4318e1fc7e0520c3350002a', 2147483647, 0x613a323a7b693a303b733a3130353a22556e697420506161202d30303032202d303030312064696b656d62616c696b616e206f6c6568204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e2c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('739d51493833fec7220fb684b62a2440', 2147483647, 0x613a323a7b693a303b733a31323a2245696e686569747362696c64223b693a313b4e3b7d),
('73d68099f2f038538c62b66d5ad57c15', 2147483647, 0x613a323a7b693a303b733a35343a2245696e68656974205644412d303030312d3030303220766f6e20537570657261646d696e20616e204f6c6567207665726c696568656e223b693a313b4e3b7d),
('73e53d2bf952efa127e7cf664337c29a', 2147483647, 0x613a323a7b693a303b733a383a22446973696d70616e223b693a313b4e3b7d),
('743bfb0a5bfec6fdc1e558f3dfceb1bc', 1735093427, 0x613a323a7b693a303b733a31343a2245646974204461746120556e6974223b693a313b4e3b7d),
('75016a5a89cce7da2e3e062e23d9aae4', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420504341202d30303031202d303030312064696b6972696d20756e74756b2064697065726261696b69206f6c656820737570657261646d696e223b693a313b4e3b7d),
('752cf70edc46ffebf37ea53a2521a175', 1735093321, 0x613a323a7b693a303b733a31313a22657268c3a46c746c696368223b693a313b4e3b7d),
('76baacd6a8292d1cb94b04f73e13a291', 2147483647, 0x613a323a7b693a303b733a31383a2256657266c3bc676261726520416e7a61686c223b693a313b4e3b7d),
('7726f95bf7303f0e3d4b49f352ede068', 1732587359, 0x613a323a7b693a303b613a303a7b7d693a313b4e3b7d),
('77ba461790c769597bdee1b790309b28', 1735093379, 0x613a323a7b693a303b733a393a224e616d61204974656d223b693a313b4e3b7d),
('786bebd2cdba16e9cec2ab6126af03ba', 2147483647, 0x613a323a7b693a303b733a31373a224361746174616e206b756e6a756e67616e223b693a313b4e3b7d),
('7907fab8c5abd6fc54d4d9e399dc62b3', 2147483647, 0x613a323a7b693a303b733a33333a22476562656e205369652064656e2050726f746f6b6f6c6c696e68616c742065696e223b693a313b4e3b7d),
('79754ac3f877f036f91c8266c2003d6b', 2147483647, 0x613a323a7b693a303b733a31363a224b65727573616b616e2052696e67616e223b693a313b4e3b7d),
('7a4709b250ddad78a6d108fa29ebbf00', 2147483647, 0x613a323a7b693a303b733a39303a2245696e68656974205041412d303030322d3030303120766f6e20537570657261646d696e20616e204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e207665726c696568656e223b693a313b4e3b7d),
('7bc6aa270e81dd11be5addd9a16f01fc', 2147483647, 0x613a323a7b693a303b733a32363a224974656d20626572686173696c20646974616d6261686b616e2e223b693a313b4e3b7d),
('7bc82cddfaf39b9e97d08a31478e88ac', 2147483647, 0x613a323a7b693a303b733a363a22416c616d6174223b693a313b4e3b7d),
('7beb2537dfc87695787b70504a2c1227', 2147483647, 0x613a323a7b693a303b733a32303a224c6167657261646d696e6973747261746f72656e223b693a313b4e3b7d),
('7c14626447c7ae7fa0f60c251d7d30a1', 1735093313, 0x613a323a7b693a303b733a32303a224d61737465722d42657374616e64736c69737465223b693a313b4e3b7d),
('7c22d893c025a11533834b80e09bd5b8', 2147483647, 0x613a323a7b693a303b733a353a2242756c616e223b693a313b4e3b7d),
('7c95fbbc78a7da1126d606a285d5803a', 2147483647, 0x613a323a7b693a303b733a31373a22556e69742050656e67656d62616c69616e223b693a313b4e3b7d),
('7c9fba1515579cffe8ec18de5cb8c15d', 2147483647, 0x613a323a7b693a303b733a32383a224d656e67656d62616c696b616e20556e6974206b6520477564616e67223b693a313b4e3b7d),
('7cdade6d1b29a05d3397f8472c2202e7', 2147483647, 0x613a323a7b693a303b733a35343a2245696e68656974205443412d303030312d3030323520766f6e20537570657261646d696e20616e204f6c6567207665726c696568656e223b693a313b4e3b7d),
('7d413c291aaba288e60e3a9bf131df45', 1735093436, 0x613a323a7b693a303b733a32313a2254756761736b616e20477564616e672041646d696e223b693a313b4e3b7d),
('7e596c65bd34ef8c6b70348f8d124843', 2147483647, 0x613a323a7b693a303b733a31373a2254616e6767616c204d756c6169204c6f67223b693a313b4e3b7d),
('7ed89a95611319f38cdba06695f6cb16', 1735093399, 0x613a323a7b693a303b733a31393a224c6f672050656e6767756e61616e20556e6974223b693a313b4e3b7d),
('7ee0042db71d019ca9e95b0021c8572a', 1735093316, 0x613a323a7b693a303b733a31353a224578706f727420616c7320584c5358223b693a313b4e3b7d),
('7fbbdf38ba748747955b30f291cb31ed', 2147483647, 0x613a323a7b693a303b733a31333a2242696c6420616e7a656967656e223b693a313b4e3b7d),
('8070faa5a4cdaae5a133225c5ea8a5d6', 2147483647, 0x613a323a7b693a303b733a31373a225065726261696b616e2044697475747570223b693a313b4e3b7d),
('8071754fb9166757c188194580e5b398', 2147483647, 0x613a323a7b693a303b733a31393a2250657262617275692064617461204974656d3a223b693a313b4e3b7d),
('8085fbb64994f7f791f2fbdfa05fc06b', 2147483647, 0x613a323a7b693a303b733a31323a2244696b656d62616c696b616e223b693a313b4e3b7d),
('81c2b73df6b49d6f1138030a973cda02', 2147483647, 0x613a323a7b693a303b733a31303a224e6f6d6f722053657269223b693a313b4e3b7d),
('81df771d914f87e8ef9555aa42f7ffd4', 2147483647, 0x613a323a7b693a303b733a39363a22556e697420506161202d30303032202d3030303120646970696e6a616d6b616e206b6570616461204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('82060c68a78638564119511ba69d59e0', 1735093305, 0x613a323a7b693a303b733a31323a22416b7475616c697369657274223b693a313b4e3b7d),
('826305de605090988ae60e8bcbff0117', 1735093435, 0x613a323a7b693a303b733a383a2250656e6767756e61223b693a313b4e3b7d),
('82f8a54a395e85be3d0ac3c3dbbe0ad9', 2147483647, 0x613a323a7b693a303b733a31373a224c616765722068696e7a7566c3bc67656e223b693a313b4e3b7d),
('8301292eb993d3ff19f0b1cfe988b789', 0, 0x613a323a7b693a303b613a323a7b693a303b4f3a31353a227969695c7765625c55726c52756c65223a31363a7b733a343a226e616d65223b733a353a226465627567223b733a373a227061747465726e223b733a31303a22235e6465627567242375223b733a343a22686f7374223b4e3b733a353a22726f757465223b733a353a226465627567223b733a383a2264656661756c7473223b613a303a7b7d733a363a22737566666978223b623a303b733a343a2276657262223b4e3b733a343a226d6f6465223b4e3b733a31323a22656e636f6465506172616d73223b623a313b733a31303a226e6f726d616c697a6572223b623a303b733a31353a22002a00637265617465537461747573223b4e3b733a31353a22002a00706c616365686f6c64657273223b613a303a7b7d733a32363a22007969695c7765625c55726c52756c65005f74656d706c617465223b733a373a222f64656275672f223b733a32373a22007969695c7765625c55726c52756c65005f726f75746552756c65223b4e3b733a32383a22007969695c7765625c55726c52756c65005f706172616d52756c6573223b613a303a7b7d733a32393a22007969695c7765625c55726c52756c65005f726f757465506172616d73223b613a303a7b7d7d693a313b4f3a31353a227969695c7765625c55726c52756c65223a31363a7b733a343a226e616d65223b733a34333a2264656275672f3c636f6e74726f6c6c65723a5b5c775c2d5d2b3e2f3c616374696f6e3a5b5c775c2d5d2b3e223b733a373a227061747465726e223b733a35363a22235e64656275672f283f503c6134636632363639613e5b5c775c2d5d2b292f283f503c6134376363386339323e5b5c775c2d5d2b29242375223b733a343a22686f7374223b4e3b733a353a22726f757465223b733a32373a2264656275672f3c636f6e74726f6c6c65723e2f3c616374696f6e3e223b733a383a2264656661756c7473223b613a303a7b7d733a363a22737566666978223b623a303b733a343a2276657262223b4e3b733a343a226d6f6465223b4e3b733a31323a22656e636f6465506172616d73223b623a313b733a31303a226e6f726d616c697a6572223b623a303b733a31353a22002a00637265617465537461747573223b4e3b733a31353a22002a00706c616365686f6c64657273223b613a323a7b733a393a22613463663236363961223b733a31303a22636f6e74726f6c6c6572223b733a393a22613437636338633932223b733a363a22616374696f6e223b7d733a32363a22007969695c7765625c55726c52756c65005f74656d706c617465223b733a32393a222f64656275672f3c636f6e74726f6c6c65723e2f3c616374696f6e3e2f223b733a32373a22007969695c7765625c55726c52756c65005f726f75746552756c65223b733a35363a22235e64656275672f283f503c6134636632363639613e5b5c775c2d5d2b292f283f503c6134376363386339323e5b5c775c2d5d2b29242375223b733a32383a22007969695c7765625c55726c52756c65005f706172616d52756c6573223b613a303a7b7d733a32393a22007969695c7765625c55726c52756c65005f726f757465506172616d73223b613a323a7b733a31303a22636f6e74726f6c6c6572223b733a31323a223c636f6e74726f6c6c65723e223b733a363a22616374696f6e223b733a383a223c616374696f6e3e223b7d7d7d693a313b4e3b7d),
('83546fa1312bef027cc65ad769704b3d', 2147483647, 0x613a323a7b693a303b733a31373a22446970657262616861727569206f6c6568223b693a313b4e3b7d),
('8372d9adb8016f208a564384124fcdb0', 1735093303, 0x613a323a7b693a303b733a31353a2245727374656c6c742f4372c3a9c3a9223b693a313b4e3b7d),
('847556c5e7f0b8150d8fe7580f4e381e', 2147483647, 0x613a323a7b693a303b733a393a22416e6d65726b756e67223b693a313b4e3b7d),
('84e8ecd742279e5713a6d0017dd84a53', 2147483647, 0x613a323a7b693a303b733a363a224b656c756172223b693a313b4e3b7d),
('850a9d100618013fa35b45adad5afb6d', 2147483647, 0x613a323a7b693a303b733a393a22416e73636872696674223b693a313b4e3b7d),
('858d3090ec1148b1a33d3ef6be5ad3a9', 2147483647, 0x613a323a7b693a303b733a3132303a22477564616e672041646d696e2e20416b756e20416e646120746964616b206d656d696c696b6920477564616e672079616e6720646974756761736b616e206b652e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('85fe8cf224832475f4bf8a9d666083e6', 2147483647, 0x613a323a7b693a303b733a36333a2253696e6420536965207369636865722c2064617373205369652064696573656e204d69746172626569746572206cc3b6736368656e206dc3b6636874656e3f223b693a313b4e3b7d),
('868ff1286561f9f19463a12b5fedc807', 2147483647, 0x613a323a7b693a303b733a32383a22556e69742044696b6972696d20756e74756b205065726261696b616e223b693a313b4e3b7d),
('86ed57dbc6b8ea5acb5273ce47c471dc', 2147483647, 0x613a323a7b693a303b733a31363a224c616765722061757377c3a4686c656e223b693a313b4e3b7d),
('874ccef8d8593fd9ce45788403992cfa', 2147483647, 0x613a323a7b693a303b733a33373a2250726f746f6b6f6c6c646174656e206e616368202e786c7378206578706f7274696572656e223b693a313b4e3b7d),
('87f3552d5bf24ec0bb9a3d17cc19e66f', 2147483647, 0x613a323a7b693a303b733a35363a22556e697420544341202d30303031202d3030323520646970696e6a616d6b616e206b65204f6c6567206f6c656820737570657261646d696e223b693a313b4e3b7d),
('8975cbe3af3fc5f653d23ea38138de1c', 2147483647, 0x613a323a7b693a303b733a32313a2253657269656e6e756d6d65722065696e676562656e223b693a313b4e3b7d),
('8a241ac023c78513fa1d63567a5c6813', 2147483647, 0x613a323a7b693a303b733a363a2253696d70616e223b693a313b4e3b7d),
('8a577d969414eb470c1a3ff3fb3a008c', 2147483647, 0x613a323a7b693a303b733a343a2245646974223b693a313b4e3b7d),
('8b778c4a127fcd978f611438fd692a53', 2147483647, 0x613a323a7b693a303b733a33393a22496872652045696e7374656c6c756e67656e2077757264656e20616b7475616c6973696572742e223b693a313b4e3b7d),
('8c73acf866da82e5ec665719d23674ec', 2147483647, 0x613a323a7b693a303b733a33373a22416e64612079616b696e20696e67696e206d656e6768617075732066696c65206c616d613f223b693a313b4e3b7d),
('8d559084e914dab1588aca4e8e5273f6', 2147483647, 0x613a323a7b693a303b733a32373a22546f74616c204974656d2079616e6720446970696e6a616d6b616e223b693a313b4e3b7d),
('8d58ba10fbc74be3d8a36d8e07e02d1d', 1735093328, 0x613a323a7b693a303b733a363a22416b74696f6e223b693a313b4e3b7d),
('8ee455935dc9b2aa7fe238a110c4eee5', 2147483647, 0x613a323a7b693a303b733a383a224b6172796177616e223b693a313b4e3b7d),
('8fa7e9ad6d04ec70dc60d8929ad7d578', 2147483647, 0x613a323a7b693a303b733a33313a224e65756520417274696b656c65696e686569742068696e7a7566c3bc67656e223b693a313b4e3b7d),
('902538f3c8d584195cbac5b2c4834e36', 2147483647, 0x613a323a7b693a303b733a31323a22646970696e6a616d6b616e2e223b693a313b4e3b7d),
('902bf75c55fb49c5ee212afeafcce9a6', 2147483647, 0x613a323a7b693a303b733a37313a22556e697420504341202d30303031202d303030312064696b656d62616c696b616e206f6c6568204672656464792c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('905659d0f1a8925e911c76c6b69377ad', 1735093392, 0x613a323a7b693a303b733a31353a2250656e6761747572616e20416b756e223b693a313b4e3b7d),
('905c47a1a5506f3f658c4a58c53d6fe3', 1735093444, 0x613a323a7b693a303b733a31393a22456d61696c207465726b6f6e6669726d617369223b693a313b4e3b7d),
('91a50fd2f82703c54fa5562f624fc0de', 2147483647, 0x613a323a7b693a303b733a31363a2247616e7469204b6174612053616e6469223b693a313b4e3b7d),
('91dd361fadc17aaf3da40fdaac42bb2f', 2147483647, 0x613a323a7b693a303b733a33353a2241706120416e64612079616b696e20696e67696e206d656e67686170757320696e693f223b693a313b4e3b7d),
('91f0737a7683e8a3b04c902b6fa09ec3', 2147483647, 0x613a323a7b693a303b733a353a22416b746976223b693a313b4e3b7d),
('91f8c3322d218e40188487d9bf9413d9', 2147483647, 0x613a323a7b693a303b733a31393a224d6173756b6b616e206b6f6e74656e206c6f67223b693a313b4e3b7d),
('9317b7f6a854d7ac98b7569d085bdc49', 2147483647, 0x613a323a7b693a303b733a34373a22556e697420506161202d30303031202d303030322064697065726261727569206f6c656820737570657261646d696e223b693a313b4e3b7d),
('935a1159657b17ca478a15e62c78d989', 2147483647, 0x613a323a7b693a303b733a31323a2250696c696820737461747573223b693a313b4e3b7d),
('9388b23dc507e31933b90397e268e841', 2147483647, 0x613a323a7b693a303b733a35393a224b65727573616b616e2062657361722028746964616b2064617061742064696f7065726173696b616e2c207065726c75207065726261696b616e29223b693a313b4e3b7d),
('93c9ae2f8e003be67270d7375ad5231b', 1735093405, 0x613a323a7b693a303b733a32313a224c61706f72616e2050696e6a616d616e204974656d223b693a313b4e3b7d),
('95c6f8a08b0edcd2047260c0ef67ba31', 2147483647, 0x613a323a7b693a303b733a35313a224e6f6d6f72205365726920616b616e206469746f6c616b206a696b6120646974656d756b616e2079616e67206964656e74696b223b693a313b4e3b7d),
('96dbb20ccb30225ffa8da00ec3c77351', 2147483647, 0x613a323a7b693a303b733a343a224a616872223b693a313b4e3b7d),
('96eaaf2ee5d4670123c484079768efa0', 1735093381, 0x613a323a7b693a303b733a383a224b617465676f7269223b693a313b4e3b7d),
('973a60a61b6c036cfd754f7c3fa54f1d', 1735093408, 0x613a323a7b693a303b733a32383a22556e697420527573616b20262044616c616d205065726261696b616e223b693a313b4e3b7d),
('97aa708589534669d77edb9e24d32017', 2147483647, 0x613a323a7b693a303b733a32353a22526f6c6c656e20756e6420426572656368746967756e67656e223b693a313b4e3b7d),
('99019d2f7d71a22e8da253fbf1937591', 2147483647, 0x613a323a7b693a303b733a32303a2245696e6865697420626569205265746f7572656e223b693a313b4e3b7d),
('99bf910431a6d523f1aa83758152e30c', 2147483647, 0x613a323a7b693a303b733a36353a22556e697420506161202d30303031202d303030312064697065726261696b692e20446962617761206b6520677564616e67206f6c656820737570657261646d696e223b693a313b4e3b7d),
('99e86967529cc3d90353e1c24ff387f9', 2147483647, 0x613a323a7b693a303b733a32343a2257616b7475204b756e6a756e67616e3a2054616e6767616c223b693a313b4e3b7d),
('99ec266cadbff54db0aea543aec93ba1', 2147483647, 0x613a323a7b693a303b733a33353a2241706120416e64612079616b696e20696e67696e206d656e67686170757320696e693f223b693a313b4e3b7d),
('9b94ebf8f11c1fa0efb6925be28f7e78', 2147483647, 0x613a323a7b693a303b733a31383a2254616d6261686b616e2050656e6767756e61223b693a313b4e3b7d),
('9b96ed13e994050036eda36965891087', 2147483647, 0x613a323a7b693a303b733a31323a2250696c696820477564616e67223b693a313b4e3b7d),
('9c572c30e1746788c4a52a07e2e09859', 2147483647, 0x613a323a7b693a303b733a353a225375636865223b693a313b4e3b7d),
('9e047b8ce7c7f1ea1696968ab0a0a18c', 2147483647, 0x613a323a7b693a303b733a32383a224c65626968206461726920333020686172692028312062756c616e29223b693a313b4e3b7d),
('9eeb56a5d26eb40084d54bfee94a6615', 2147483647, 0x613a323a7b693a303b733a373a225a757374616e64223b693a313b4e3b7d),
('9f03ee1e7f7cc4be127890921d02e64f', 1735093398, 0x613a323a7b693a303b733a32333a225269776179617420556e67676168616e204d617373616c223b693a313b4e3b7d),
('9f13ef30714d886d650138fb7ba723b0', 2147483647, 0x613a323a7b693a303b733a31363a2244616c616d2050656e6767756e61616e223b693a313b4e3b7d),
('9f92fd8606af54a4c0e618f2acc61dba', 1735093309, 0x613a323a7b693a303b733a32303a2250617373776f727420776965646572686f6c656e223b693a313b4e3b7d),
('a00fb77a2232795776a5ea751cbf0b8a', 2147483647, 0x613a323a7b693a303b733a33323a22556e69742079616e6720536564616e672064616c616d205065726261696b616e223b693a313b4e3b7d),
('a0c319f4e43fbc59d6c6ea57fe0bb3a8', 1735093416, 0x613a323a7b693a303b733a32303a22556e69742044616c616d205065726261696b616e223b693a313b4e3b7d),
('a156d8edf85a3696bccdf31253bfe304', 2147483647, 0x613a323a7b693a303b733a393a2253756368646174656e223b693a313b4e3b7d),
('a197b0e4d81c07a343e98ff67b154b25', 2147483647, 0x613a323a7b693a303b733a31303a22446174756d205a656974223b693a313b4e3b7d),
('a24e33eacd5481adabe833d2f4707ae3', 2147483647, 0x613a323a7b693a303b733a393a2245727374656c6c656e223b693a313b4e3b7d),
('a259a7fb1c7290adcc98609af8bfcc7f', 1735093385, 0x613a323a7b693a303b733a31353a2244616c616d205065726261696b616e223b693a313b4e3b7d),
('a26c3cdfa2018cc009d6d45181ff7a3c', 2147483647, 0x613a323a7b693a303b733a383a225065726261696b69223b693a313b4e3b7d),
('a3087094713cb6078dabc416c8896c12', 2147483647, 0x613a323a7b693a303b733a37323a2245696e68656974205443412d303030312d3030303220766f6e20467265646479207a7572c3bc636b6765676562656e2c20766f6e20537570657261646d696e20657268616c74656e223b693a313b4e3b7d),
('a4b4c13bfea88dae1568912ff2c96ec3', 2147483647, 0x613a323a7b693a303b733a31353a2250696c6968204974656d20556e6974223b693a313b4e3b7d),
('a4f252f1cb64e7567aa1610d45e267e5', 2147483647, 0x613a323a7b693a303b733a353a224d6f6e6174223b693a313b4e3b7d),
('a4fabe9dbe678ea08ad6d8daf8579770', 2147483647, 0x613a323a7b693a303b733a31393a224c6167657220616b7475616c6973696572656e223b693a313b4e3b7d),
('a60214ab9bfd08e000d04c3b19a33e4c', 2147483647, 0x613a323a7b693a303b733a32333a225065726261727569204b617465676f7269204974656d3a223b693a313b4e3b7d),
('a60296e5b7cd6082f41959c2e49a24cf', 2147483647, 0x613a323a7b693a303b733a383a224469626c6f6b6972223b693a313b4e3b7d),
('a683833c2ea07b1db36e40a2a0c1e425', 2147483647, 0x613a323a7b693a303b733a31323a2242656e75747a65726e616d65223b693a313b4e3b7d),
('a6fd89799c3be81d83f187543b3cd328', 2147483647, 0x613a323a7b693a303b733a31383a22486170757320646f6b756d656e206c616d61223b693a313b4e3b7d),
('a74d7ce59e23536de0cac6689552bedc', 2147483647, 0x613a323a7b693a303b733a32303a225a5552205245504152415455522053454e44454e223b693a313b4e3b7d),
('a840684adcc6311b1d9b8147497de1e5', 2147483647, 0x613a323a7b693a303b733a36393a22556e697420506161202d30303032202d303030322064696b656d62616c696b616e206f6c6568204f6c65672c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('a8c284c2a4843856279b12ac768ecf39', 2147483647, 0x613a323a7b693a303b733a31363a2250617373776f727420c3a46e6465726e223b693a313b4e3b7d),
('a8de0da5a9b90716574edf7e8bf6be74', 2147483647, 0x613a323a7b693a303b733a31393a22456e746c696568656e2f5665726c696568656e223b693a313b4e3b7d),
('aa11fb3df5cdf876cfd350cd4e1a1e3a', 1735093382, 0x613a323a7b693a303b733a383a225465727365646961223b693a313b4e3b7d),
('ac9327c64e00159d874aed73db85a05a', 2147483647, 0x613a323a7b693a303b733a31303a224265617262656974656e223b693a313b4e3b7d),
('acde71e2de732cf8557a80f434bc8d02', 2147483647, 0x613a323a7b693a303b733a31363a22416b7475616c69736965727420766f6e223b693a313b4e3b7d),
('ae6d95c14127079b4bfd3d16c2701eb7', 2147483647, 0x613a323a7b693a303b733a36323a22556e697420506161202d30303034202d3030303420646970696e6a616d6b616e206b657061646120467265646479206f6c656820737570657261646d696e223b693a313b4e3b7d),
('ae70621e6c5e3e988e0e70f140f681bb', 2147483647, 0x613a323a7b693a303b733a31343a224974656d20446920477564616e67223b693a313b4e3b7d),
('ae7fb54d4bb8d32828304efafd040b63', 2147483647, 0x613a323a7b693a303b733a32303a22556e69742064692070656e67656d62616c69616e223b693a313b4e3b7d),
('af7c136564f6dd928680f2b3a02f5087', 1735093350, 0x613a323a7b693a303b733a31393a22526570617261747572c3bc6265727369636874223b693a313b4e3b7d),
('afaadda7aeef981425de59298190bb0b', 2147483647, 0x613a323a7b693a303b733a37333a2245696e68656974205041412d303030312d3030303220766f6e205368696f72696e207a7572c3bc636b6765676562656e2c20766f6d20537570657261646d696e20657268616c74656e223b693a313b4e3b7d),
('aff7279a6a42e7b530bb10c38a987909', 2147483647, 0x613a323a7b693a303b733a32313a225065726261727569206461746120477564616e673a223b693a313b4e3b7d),
('b035e05f85c7236a7fc9ab0caa373cd8', 2147483647, 0x613a323a7b693a303b733a32303a2253656c657361696b616e205065726261696b616e223b693a313b4e3b7d),
('b3886215617c6bac09fa104538a6ed11', 2147483647, 0x613a323a7b693a303b733a3131373a22477564616e672041646d696e2e20416b756e20416e646120746964616b206d656d696c696b6920477564616e672079616e6720646974657461706b616e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('b3eba2b20f802b2a19bace5202790e8d', 2147483647, 0x613a323a7b693a303b733a31313a2244657461696c204974656d223b693a313b4e3b7d),
('b4de8de9b6043a409bf54c40edb34b95', 2147483647, 0x613a323a7b693a303b733a31343a225a7572c3bc636b6765676562656e223b693a313b4e3b7d);
INSERT INTO `cache` (`id`, `expire`, `data`) VALUES
('b63cd41e8362c9ecfed29766f302f115', 2147483647, 0x613a323a7b693a303b733a33363a22426172616e6720446920477564616e67204a4f47494e4720434f4e444f4e474341545552223b693a313b4e3b7d),
('b774833d2aec5b4fd7f781b4aa737a57', 2147483647, 0x613a323a7b693a303b733a31393a224d6173756b6b616e206e6f6d6f722073657269223b693a313b4e3b7d),
('b7a2d820e669f00cb301b3d3b0c34f7f', 2147483647, 0x613a323a7b693a303b733a35353a2245696e68656974205644412d303030342d3030303320766f6e20537570657261646d696e20616e204a6f68616e207665726c696568656e223b693a313b4e3b7d),
('b8071ea0bd302ec8fe77d18a55db9bb3', 2147483647, 0x613a323a7b693a303b733a33343a22416b7475616c6973696572656e20646572204d69746172626569746572646174656e223b693a313b4e3b7d),
('b823caa9e6e7f3c417841b17bc2951e2', 1735093340, 0x613a323a7b693a303b733a32393a2256657277656e64756e677370726f746f6b6f6c6c20616e7a656967656e223b693a313b4e3b7d),
('b8bb3da62f347778148b975e024fe7cd', 2147483647, 0x613a323a7b693a303b733a32373a22477564616e6720626572686173696c20646974756761736b616e2e223b693a313b4e3b7d),
('b9654dd94ce5245cc7fb1e6dadb2b435', 2147483647, 0x613a323a7b693a303b733a383a224944204c61676572223b693a313b4e3b7d),
('b9b0285761ca176952ff9fc4340b887c', 2147483647, 0x613a323a7b693a303b733a32313a224e616d6520646573204d6974617262656974657273223b693a313b4e3b7d),
('b9cbeec10b76fc17ff25637960f22cf2', 2147483647, 0x613a323a7b693a303b733a31333a224e616d61204b6172796177616e223b693a313b4e3b7d),
('ba124e60e546f214cac5fc0f1814e449', 2147483647, 0x613a323a7b693a303b733a32363a224dc3b663687465737420647520646173206cc3b6736368656e3f223b693a313b4e3b7d),
('ba1870d2670d1d96741098ba761f6aa6', 2147483647, 0x613a323a7b693a303b733a33303a2257616b7475204b756e6a756e67616e3a2057616b74752054616e6767616c223b693a313b4e3b7d),
('ba8c2b27a6f778482d8a008dcf27f900', 2147483647, 0x613a323a7b693a303b733a363a22477564616e67223b693a313b4e3b7d),
('bc74708dbafb82efbc7586535e7328ec', 2147483647, 0x613a323a7b693a303b733a363a22556e67676168223b693a313b4e3b7d),
('bd2dc63f39b15c1152059ae9c77e8d0a', 2147483647, 0x613a323a7b693a303b733a34373a22556e697420506161202d30303031202d303030332064697065726261727569206f6c656820737570657261646d696e223b693a313b4e3b7d),
('be0e37dd243d45e96fa95bb5fd945ae5', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420506161202d30303031202d303030312064696b6972696d20756e74756b2064697065726261696b69206f6c656820737570657261646d696e223b693a313b4e3b7d),
('be816784bcabf873ede7997b1ba4d48b', 1735093442, 0x613a323a7b693a303b733a31303a224b6174612053616e6469223b693a313b4e3b7d),
('bedc09017a202a6e1430dbcf6decbf31', 2147483647, 0x613a323a7b693a303b733a31363a22c3846c74657220616c73203120546167223b693a313b4e3b7d),
('bf0acdd47aa7295aab7f6ae270bd2ee9', 2147483647, 0x613a323a7b693a303b733a31393a2250696c6968204b617465676f7269204974656d223b693a313b4e3b7d),
('c03d12a008992dc63d94cf71a45438a3', 2147483647, 0x613a323a7b693a303b733a373a224b6f6e64697369223b693a313b4e3b7d),
('c04a5fd81a9d6684a0499a9274fdd14d', 2147483647, 0x613a323a7b693a303b733a32393a2254756761736b616e2041646d696e20477564616e67206179796c6d616f223b693a313b4e3b7d),
('c085a10f222805f65a48819c58b699d5', 2147483647, 0x613a323a7b693a303b733a37303a22556e697420506161202d30303031202d303030312064696b656d62616c696b616e206f6c6568204a6f68616e2c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('c107446bc5eac32cc257af9304be498f', 2147483647, 0x613a323a7b693a303b733a31343a2241757367657363686c6f7373656e223b693a313b4e3b7d),
('c1b527fff25355ecce33a7b361a4d9eb', 1735093356, 0x613a323a7b693a303b733a353a224c61676572223b693a313b4e3b7d),
('c26d25d4d976d46dc41e60301e59dd33', 2147483647, 0x613a323a7b693a303b733a353a22416b746966223b693a313b4e3b7d),
('c3222dd954b2c33e2c0e4d7b09072a2a', 1735093307, 0x613a323a7b693a303b733a383a2250617373776f7274223b693a313b4e3b7d),
('c362aee9103533125edc3fe9bab26e9e', 2147483647, 0x613a323a7b693a303b733a33313a225a75722052657061726174757220676573656e646574652045696e68656974223b693a313b4e3b7d),
('c3cc1f748917ce0c6be1c2df1a1986bb', 2147483647, 0x613a323a7b693a303b733a34393a2245696e68656974205041412d303030312d3030303320766f6d20537570657261646d696e20616b7475616c697369657274223b693a313b4e3b7d),
('c4012058b4ac668707bef07e6dd10884', 2147483647, 0x613a323a7b693a303b733a32313a2250696c69682044697065726261727569204f6c6568223b693a313b4e3b7d),
('c4e178c1c526accd7c6c293cda09a88d', 2147483647, 0x613a323a7b693a303b733a32363a22556e67676168616e204d617373616c20756e74756b20756e6974223b693a313b4e3b7d),
('c5690a42e548891f4bf9ed3ba673fa0b', 2147483647, 0x613a323a7b693a303b733a32303a2254616e6767616c204c6f6720426572616b686972223b693a313b4e3b7d),
('c5a5e60a8c6a7485bc7880d93898bbbc', 2147483647, 0x613a323a7b693a303b733a33303a225a757374616e64206465722045696e686569742061757377c3a4686c656e223b693a313b4e3b7d),
('c5b2ff841e8f3a0bc37f49d704a1e1c3', 2147483647, 0x613a323a7b693a303b733a32373a224b6972696d20556e697420556e74756b2044697065726261696b69223b693a313b4e3b7d),
('c601a4b0e43aca9225c4fc70f06555e4', 1735093348, 0x613a323a7b693a303b733a34393a224265736368c3a4646967746520756e6420696e2052657061726174757220626566696e646c696368652045696e68656974223b693a313b4e3b7d),
('c6d3cd63a10cfe32d45bb648ea9c4f9f', 2147483647, 0x613a323a7b693a303b733a31353a2254616e6767616c20262057616b7475223b693a313b4e3b7d),
('c73139fff4d81ae49badbc829b21a808', 2147483647, 0x613a323a7b693a303b733a39363a22556e697420504341202d30303032202d3030303420646970696e6a616d6b616e206b6570616461204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('c86fe595bbf42a1210d35d6bc1725636', 2147483647, 0x613a323a7b693a303b733a35363a2245696e68656974205443412d303030312d3030303220766f6e20537570657261646d696e20616e20467265646479207665726c696568656e223b693a313b4e3b7d),
('c9ab49711327e1debbc315336bd4cb47', 2147483647, 0x613a323a7b693a303b733a3132303a2241646d696e2057617265686f7573652c20616b756e20416e646120746964616b206d656d696c696b6920677564616e672079616e6720646974657461706b616e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('cae8a4b06016e5fa15a280cf9c6db60d', 1735093314, 0x613a323a7b693a303b733a32333a224e6575657320456c656d656e742065696e66c3bc67656e223b693a313b4e3b7d),
('cba6193d8cd2757b8d9aac05c0228faa', 2147483647, 0x613a323a7b693a303b733a32373a224d69746172626569746572206767662e2061757377c3a4686c656e223b693a313b4e3b7d),
('cc2d89e5c96b92c7a103a6a74a8ef79c', 2147483647, 0x613a323a7b693a303b733a333a224c6f67223b693a313b4e3b7d),
('cca73bbf7d8e28da98fbf5c23d7c198e', 2147483647, 0x613a323a7b693a303b733a32373a22496b6c616e20626572686173696c2064692070657262617275692e223b693a313b4e3b7d),
('ce150ecb2ac19bd33b2c728906e21269', 2147483647, 0x613a323a7b693a303b733a32333a2250657262617275692064617461204b6172796177616e3a223b693a313b4e3b7d),
('ce6bc695843f4d77e3c77175c859ff00', 2147483647, 0x613a323a7b693a303b733a353a22546168756e223b693a313b4e3b7d),
('ce707da9cae21e45d08f6558929cf8d3', 2147483647, 0x613a323a7b693a303b733a31383a2245696e686569742061757377c3a4686c656e223b693a313b4e3b7d),
('ce8c2321908091cc6d3c8ce147a96789', 2147483647, 0x613a323a7b693a303b733a31363a2244616c616d2050656e6767756e61616e223b693a313b4e3b7d),
('cedbff080e517f86d88f7c707736e46f', 2147483647, 0x613a323a7b693a303b733a37373a224b6172796177616e20746964616b20646170617420646968617075732e204974656d2079616e67206d6173696820646970696e6a616d6b616e206b6570616461206b6172796177616e20696e69223b693a313b4e3b7d),
('d17f5dd2ba1e276497ff9610ef128199', 2147483647, 0x613a323a7b693a303b733a36323a224772c3b6c39f65726520536368c3a464656e202866756e6b74696f6e73756e66c3a46869672c20526570617261747572206572666f726465726c69636829223b693a313b4e3b7d),
('d1be7b2bc987a263ca5cf831fda04d2c', 2147483647, 0x613a323a7b693a303b733a33363a22416e64612079616b696e20616b616e206d656e67686170757320627574697220696e693f223b693a313b4e3b7d),
('d2a67a5851b2e3d0a3efe320b9775288', 2147483647, 0x613a323a7b693a303b733a31393a224b6174612073616e6469207361617420696e69223b693a313b4e3b7d),
('d2b5a538cef375d37a8f08c1a72e0fd2', 2147483647, 0x613a323a7b693a303b733a35343a2245696e68656974205041412d303030322d3030303220766f6e20537570657261646d696e20616e204f6c6567207665726c696568656e223b693a313b4e3b7d),
('d3ae3360c7e1582f17b745c1711c26c3', 2147483647, 0x613a323a7b693a303b733a353a224c61676572223b693a313b4e3b7d),
('d3edb4757b405b4b8988543a6d951d90', 2147483647, 0x613a323a7b693a303b733a32343a2250696c696820556e69742079616e67205465727365646961223b693a313b4e3b7d),
('d401bb3c7e2ca4a3b946558115ff58bc', 2147483647, 0x613a323a7b693a303b733a35363a22556e697420506161202d30303032202d3030303220646970696e6a616d6b616e206b65204f6c6567206f6c656820737570657261646d696e223b693a313b4e3b7d),
('d4cf439532208d842533afc9c76f2c0a', 1735093439, 0x613a323a7b693a303b733a373a2243726561746564223b693a313b4e3b7d),
('d5d33ea55add37d1ad800c6e10f049f6', 1735093438, 0x613a323a7b693a303b733a31333a224f7073692050656e6767756e61223b693a313b4e3b7d),
('d6a7fc172efcd87950497ab5a61a5769', 2147483647, 0x613a323a7b693a303b733a31373a224c65626968206461726920312068617269223b693a313b4e3b7d),
('d7c3aa03ec4bed8feb11e888cc6cfc5c', 1735093355, 0x613a323a7b693a303b733a32343a2245696e6865697473646174656e206265617262656974656e223b693a313b4e3b7d),
('d858fb8f6308cb9258a5e62e3c17e737', 2147483647, 0x613a323a7b693a303b733a36303a2245696e68656974205043412d303030312d3030303120766f6d20537570657261646d696e207a75722052657061726174757220676573636869636b74223b693a313b4e3b7d),
('d8ac4c072915e514b4e97d3762e8a6ba', 1735093412, 0x613a323a7b693a303b733a31393a2252696e676b6173616e205065726261696b616e223b693a313b4e3b7d),
('d8b4316a2c9f9b498100f7a3fce73950', 2147483647, 0x613a323a7b693a303b733a31373a22417274696b656c2d45696e68656974656e223b693a313b4e3b7d),
('d8b4bc198d8e7f25e48cfc7c1ecd1bd4', 2147483647, 0x613a323a7b693a303b733a393a2242756174204974656d223b693a313b4e3b7d),
('d9dfb9a434cf6cbdbb6cbdf8df5b584f', 2147483647, 0x613a323a7b693a303b733a34373a22556e697420506161202d30303031202d303030312064697065726261727569206f6c656820737570657261646d696e223b693a313b4e3b7d),
('d9f1bbf207aad9288b6282629b689730', 2147483647, 0x613a323a7b693a303b733a35343a2245696e68656974205644412d303030322d3030303120766f6e20537570657261646d696e20616e204f6c6567207665726c696568656e223b693a313b4e3b7d),
('da1fecb72e1dce2a2ff6f982ad3eeae7', 2147483647, 0x613a323a7b693a303b733a32383a22c3846c74657220616c73203336352054616765202831204a61687229223b693a313b4e3b7d),
('da49a00a2ba59b5bfc4e04c316c0ec01', 2147483647, 0x613a323a7b693a303b733a33303a2256657266c3bc67626172652045696e686569742061757377c3a4686c656e223b693a313b4e3b7d),
('db10dba5e9a9ea34ce366a14e2858d83', 2147483647, 0x613a323a7b693a303b733a3132363a2241646d696e2057617265686f7573652c20616b756e20416e646120746964616b206d656d696c696b692057617265686f7573652079616e6720646974756761736b616e206b652e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('db4e139ab9f95c60e7c9f2e61cc89973', 1735093404, 0x613a323a7b693a303b733a31363a22526977617961742050696e6a616d616e223b693a313b4e3b7d),
('dc90435136bbfc89db4de99f2eeda113', 2147483647, 0x613a323a7b693a303b733a35373a2245696e68656974205041412d303030312d3030303220766f6e20537570657261646d696e20616e205368696f72696e207665726c696568656e223b693a313b4e3b7d),
('dc9cf78cf46dffa65511c8eaa9928f3c', 2147483647, 0x613a323a7b693a303b733a34363a22477564616e67206d61736968206d656d696c696b6920756e697420626172616e672064692064616c616d6e79612e223b693a313b4e3b7d),
('dd3591b347b95895cbe45b4670291a9a', 1735093337, 0x613a323a7b693a303b733a31373a2245696e686569742076657277616c74656e223b693a313b4e3b7d),
('dd62251a64ad31d66e93680359e9c3c3', 2147483647, 0x613a323a7b693a303b733a34393a224b6f6d656e7461722068617275732062657275706120696e666f726d6173692074656e74616e67207065726261696b616e223b693a313b4e3b7d),
('dec0346df757614aecb409ff78ecee20', 2147483647, 0x613a323a7b693a303b733a31343a22506572616e2064616e20697a696e223b693a313b4e3b7d),
('def97fa8aaac744a6c59464e9aaae86c', 2147483647, 0x613a323a7b693a303b733a31373a22446f6b756d656e7420616e7a656967656e223b693a313b4e3b7d),
('df5e425078e41096a00b4ab62b5325bd', 2147483647, 0x613a323a7b693a303b733a31383a2248696c616e6720617461752048616e637572223b693a313b4e3b7d),
('dfeb25d360c526b51b125e7c7569432c', 2147483647, 0x613a323a7b693a303b733a31323a2241646d696e20477564616e67223b693a313b4e3b7d),
('e0c329a10ea468611ee3ad2a0f06218c', 2147483647, 0x613a323a7b693a303b733a31393a2253657269656e6e756d6d65722073756368656e223b693a313b4e3b7d),
('e0e7c4182998c9372c5d1eb4705a05b8', 2147483647, 0x613a323a7b693a303b733a31383a22546572736564696120646920677564616e67223b693a313b4e3b7d),
('e0ff92763cab693a0a8845cf4ed6821f', 2147483647, 0x613a323a7b693a303b733a31323a2250696c696820426168617361223b693a313b4e3b7d),
('e12c5a756ffee698afe674176d37f2ef', 1735093319, 0x613a323a7b693a303b733a393a224b617465676f726965223b693a313b4e3b7d),
('e1532ecdac3658336d10daae470b3d45', 2147483647, 0x613a323a7b693a303b733a363a22452d4d61696c223b693a313b4e3b7d),
('e2a93ec48960b546bca8f8100417812b', 2147483647, 0x613a323a7b693a303b733a31323a224e616d61204b6f6e64697369223b693a313b4e3b7d),
('e2d62223f6cc655c968703eb91de4631', 1735093347, 0x613a323a7b693a303b733a32353a2245696e68656974732d4461726c6568656e7362657269636874223b693a313b4e3b7d),
('e44c5541afc68b507787a385dac546cc', 1735093388, 0x613a323a7b693a303b733a343a22416b7369223b693a313b4e3b7d),
('e5e8e5a84cb194e533bbb3c284054393', 2147483647, 0x613a323a7b693a303b733a323a224f4b223b693a313b4e3b7d),
('e6ea6e63bfcc83832cd8df924614bdd7', 2147483647, 0x613a323a7b693a303b733a35373a2245696e68656974205055412d303030312d3030303320766f6e20537570657261646d696e20616e205368696f72696e207665726c696568656e223b693a313b4e3b7d),
('ea02c89b55a39edd6572e00db3b17745', 2147483647, 0x613a323a7b693a303b733a37323a22556e697420506161202d30303031202d303030322064696b656d62616c696b616e206f6c6568205368696f72696e2c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('eb058b65a6b3bc628af148cfabcb5dcf', 2147483647, 0x613a323a7b693a303b733a32323a224c6f67204b756e6a756e67616e2050656e6767756e61223b693a313b4e3b7d),
('eb586cb1350f1e58eae87797489a2804', 2147483647, 0x613a323a7b693a303b733a393a22436172692044617461223b693a313b4e3b7d),
('eb616fe6de7c005997c0aa3cd92fbe9f', 2147483647, 0x613a323a7b693a303b733a393a2244617465696e616d65223b693a313b4e3b7d),
('ebc358c823def4500744e6c805af803f', 1735093414, 0x613a323a7b693a303b733a31303a22556e697420527573616b223b693a313b4e3b7d),
('ebdc9bceae886746aff898cdbbe77b33', 2147483647, 0x613a323a7b693a303b733a32313a224d656d627561742050656e6767756e612042617275223b693a313b4e3b7d),
('ed05dc99586e6bdbf26d8c74976e1cc3', 2147483647, 0x613a323a7b693a303b733a32333a2252696e676b6173616e204c6f67205065726261696b616e223b693a313b4e3b7d),
('ed33d3ef03b7dfe6f3984819db56c400', 1735093374, 0x613a323a7b693a303b733a31363a22496e76656e746172697320496e64756b223b693a313b4e3b7d),
('edb756ea04b487dfb0dfd81a1e5500e4', 1735093395, 0x613a323a7b693a303b733a31333a224b617465676f7269204974656d223b693a313b4e3b7d),
('edc2b2d8a4947af5aea3e660adb624de', 2147483647, 0x613a323a7b693a303b733a3130383a2241646d696e2057617265686f7573652e20546964616b206164612057617265686f7573652079616e6720646974756761736b616e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('ee9cba4a0cf94a324344874924358636', 2147483647, 0x613a323a7b693a303b733a32383a22c3846c74657220616c732033302054616765202831204d6f6e617429223b693a313b4e3b7d),
('efb58d91b80b6d6af968b4c7498a081b', 2147483647, 0x613a323a7b693a303b733a393a22556e6974204974656d223b693a313b4e3b7d),
('f00c592eda5bf336473477ebb069f153', 1735093325, 0x613a323a7b693a303b733a31333a22496e205265706172617475723a223b693a313b4e3b7d),
('f320358d967529fd2aa4ebce1a428199', 2147483647, 0x613a323a7b693a303b733a31343a2250696c6968204b6172796177616e223b693a313b4e3b7d),
('f397a91c9afd8d018667cd4aa1808618', 1735093393, 0x613a323a7b693a303b733a31303a22496e76656e7461726973223b693a313b4e3b7d),
('f45627865e18e66ae843a314721b3aa5', 1735093430, 0x613a323a7b693a303b733a383a224b6172796177616e223b693a313b4e3b7d),
('f45c00e4bc1357a650acdb7d3f0c861d', 1735093332, 0x613a323a7b693a303b733a32313a224163636f756e742d45696e7374656c6c756e67656e223b693a313b4e3b7d),
('f47e62f133d5142b6f4bd9fe4525ba62', 2147483647, 0x613a323a7b693a303b733a35363a22556e697420564441202d30303031202d3030303220646970696e6a616d6b616e206b65204f6c6567206f6c656820737570657261646d696e223b693a313b4e3b7d),
('f52773e070cbed2a4038323c2da5adc4', 2147483647, 0x613a323a7b693a303b733a32323a2256616c69646173692067616d62617220676167616c2e223b693a313b4e3b7d),
('f64802096e7e1d2cd4fbc449488dc1b5', 2147483647, 0x613a323a7b693a303b733a32343a2254657461706b616e2041646d696e206b6520477564616e67223b693a313b4e3b7d),
('f7763f4822688848a943f5d067cad96d', 2147483647, 0x613a323a7b693a303b733a31333a224b617465676f7269204974656d223b693a313b4e3b7d),
('f89673e9f7685be6197c92d53b2e421d', 2147483647, 0x613a323a7b693a303b733a33393a22556e697420626572686173696c2064696b6972696d20756e74756b2064697065726261696b692e223b693a313b4e3b7d),
('fca0bf85e9ffb44f4a3e8d048ac22cbf', 2147483647, 0x613a323a7b693a303b733a35393a22556e697420506161202d30303031202d3030303220646970696e6a616d6b616e206b65205368696f72696e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('fcc42a5e2efcba3ac8d689721ce97ceb', 2147483647, 0x613a323a7b693a303b733a31353a2243617269204e6f6d6f722053657269223b693a313b4e3b7d),
('fcdb799c4e4cd92e73a603d497987fdc', 2147483647, 0x613a323a7b693a303b733a32333a22416c746520446f6b756d656e7465206cc3b6736368656e223b693a313b4e3b7d),
('fd3a67e2aa4416817a5afa41e2817f20', 2147483647, 0x613a323a7b693a303b733a31303a225265706172696572656e223b693a313b4e3b7d),
('fdbd5ef7e2e3ee8535b90daf89217ef9', 2147483647, 0x613a323a7b693a303b733a31343a22556e6475682054656d706c617465223b693a313b4e3b7d),
('fe01f763ffc9853bf233b144b247a4f9', 1735093318, 0x613a323a7b693a303b733a31313a22417274696b656c6e616d65223b693a313b4e3b7d),
('ff2c7ee8e5926a02a15c93a2a1fae527', 2147483647, 0x613a323a7b693a303b733a32373a22556e697420626572686173696c2064696b656d62616c696b616e2e223b693a313b4e3b7d),
('ff97b763cfaeb518ce45ba693e6ef8f4', 2147483647, 0x613a323a7b693a303b733a31363a2244617465692061757377c3a4686c656e223b693a313b4e3b7d),
('ffbeb44e085da1568fc0a8ffb893f2a3', 2147483647, 0x613a323a7b693a303b733a31313a224f70736920426168617361223b693a313b4e3b7d);

-- --------------------------------------------------------

--
-- Table structure for table `condition_lookup`
--

CREATE TABLE `condition_lookup` (
  `id_condition` tinyint(3) UNSIGNED NOT NULL,
  `condition_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `condition_lookup`
--

INSERT INTO `condition_lookup` (`id_condition`, `condition_name`) VALUES
(1, 'OK'),
(2, 'Light Damage'),
(3, 'Moderately damaged (missing a part or component)'),
(4, 'Major damage (inoperable, repair required)'),
(5, 'Lost or Destroyed');

-- --------------------------------------------------------

--
-- Table structure for table `doc_uploaded`
--

CREATE TABLE `doc_uploaded` (
  `id_doc` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `datetime` datetime(2) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doc_uploaded`
--

INSERT INTO `doc_uploaded` (`id_doc`, `file_name`, `datetime`, `user_id`) VALUES
(36, 'bulk_unit820_1732502968.xlsx', '2024-11-25 09:49:28.00', 1),
(37, 'bulk_unit791_1732516032.xlsx', '2024-11-25 13:27:12.00', 1),
(38, 'bulk_unit203_1732516042.xlsx', '2024-11-25 13:27:22.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(10) UNSIGNED NOT NULL,
  `emp_name` varchar(80) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id_employee`, `emp_name`, `phone`, `email`, `address`) VALUES
(1, 'Johan', '0888888', 'ayymail@lmao.com', 'jalan jalan aj'),
(2, 'Emma', '0812121211212', 'emma@mail.com', 'a random street name'),
(3, 'Oleg', '08080808', 'tumbal@mail.com', 'jalan gk tau'),
(4, 'Freddy', '0821321321', 'freddymail@mail.com', 'somewhere in a city'),
(5, 'Shiorin', '081684316487', 'shiorin@ayymail.com', 'idk somewhere a'),
(7, 'Mark', '080818123215', 'Mark@mail.com', 'idk somewhere in us continent'),
(8, 'Manfred Albrecht Freiherr von Richthofen', '0812354612324', 'redbaronrulerofthesky@mail.com', 'somewhere in German');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id_item` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(60) NOT NULL,
  `SKU` varchar(50) NOT NULL,
  `imagefile` varchar(255) NOT NULL,
  `id_category` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `item_name`, `SKU`, `imagefile`, `id_category`) VALUES
(11, 'Logitech Signature Slim Keyboard K950', 'PAA-0001', '736_1731394912.webp', 1),
(12, 'Logitech MX Anywhere 3S', 'PAA-0002', '304_1731394932.webp', 1),
(13, 'ThinkPad T14s Gen 4 (14″ AMD)', 'PCA-0001', '859_1731395020.jpg', 3),
(14, 'Generic Mousepad Small', 'PAA-0003', '409_1731395120.jpeg', 1),
(15, 'Sennheisser HD600', 'VDA-0001', '959_1731395082.jpeg', 2),
(16, 'Shure SM7B', 'VDA-0002', '121_1731395169.jpeg', 2),
(18, 'TC-Helicon GOXLR', 'VDA-0003', '903_1731395204.jpeg', 2),
(25, 'USB-C Hub Multi Dongle', 'PAA-0004', '624_1731395239.jpeg', 1),
(26, 'Macbook Air M3', 'PCA-0002', '116_1731395279.jpeg', 3),
(27, 'Sony A7 iv', 'VDA-0004', '302_1731460840.webp', 2),
(28, 'Test FlakPz Gepard', 'TCA-0001', '945_1732075232.jpeg', 4),
(29, 'Test Item 1', 'TCA-0002', '382_1732155439.jpeg', 4),
(30, 'Test G1', 'TCA-0003', '744_1732155555.jpg', 4),
(31, 'Laptop Backpack M24', 'PUA-0001', '646_1732515992.jpeg', 7),
(32, 'Suffers Mk1', 'TCA-0004', '476_1732519661.jpeg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id_category` int(10) NOT NULL,
  `category_name` varchar(60) NOT NULL,
  `cat_code` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`id_category`, `category_name`, `cat_code`) VALUES
(1, 'Computer Peripherals', 'PA'),
(2, 'Audio Visual Production', 'VD'),
(3, 'Personal Computer', 'PC'),
(4, 'Test Cat', 'TC'),
(6, 'Test C2', 'TS'),
(7, 'Personal Utility Item', 'PU');

-- --------------------------------------------------------

--
-- Table structure for table `item_unit`
--

CREATE TABLE `item_unit` (
  `id_unit` int(10) UNSIGNED NOT NULL,
  `id_item` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `id_wh` int(10) UNSIGNED DEFAULT NULL,
  `comment` varchar(60) DEFAULT NULL,
  `serial_number` varchar(60) NOT NULL,
  `condition` tinyint(3) UNSIGNED NOT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_unit`
--

INSERT INTO `item_unit` (`id_unit`, `id_item`, `status`, `id_wh`, `comment`, `serial_number`, `condition`, `updated_by`) VALUES
(54294, 11, 1, 5, 'audit 2', 'PAA-0001-0001', 2, 1),
(54295, 11, 1, 6, 'audit', 'PAA-0001-0002', 1, 1),
(54296, 11, 1, 7, 'test on log date time', 'PAA-0001-0003', 1, 1),
(54297, 11, 1, 8, 'new data after purge', 'PAA-0001-0004', 1, 1),
(54298, 11, 1, 9, 'new data after purge', 'PAA-0001-0005', 1, 1),
(54299, 11, 1, 10, 'new data after purge', 'PAA-0001-0006', 1, 1),
(54300, 11, 1, 11, 'new data after purge', 'PAA-0001-0007', 1, 1),
(54301, 11, 1, 13, 'new data after purge', 'PAA-0001-0008', 1, 1),
(54302, 11, 1, 5, 'new data after purge', 'PAA-0001-0009', 1, 1),
(54303, 11, 1, 6, 'new data after purge', 'PAA-0001-0010', 1, 1),
(54304, 11, 1, 7, 'new data after purge', 'PAA-0001-0011', 1, 1),
(54305, 11, 1, 8, 'new data after purge', 'PAA-0001-0012', 1, 1),
(54306, 11, 1, 9, 'new data after purge', 'PAA-0001-0013', 1, 1),
(54307, 11, 1, 10, 'new data after purge', 'PAA-0001-0014', 1, 1),
(54308, 11, 1, 11, 'new data after purge', 'PAA-0001-0015', 1, 1),
(54309, 11, 1, 13, 'new data after purge', 'PAA-0001-0016', 1, 1),
(54310, 11, 1, 5, 'new data after purge', 'PAA-0001-0017', 1, 1),
(54311, 11, 1, 6, 'new data after purge', 'PAA-0001-0018', 1, 1),
(54312, 11, 1, 7, 'new data after purge', 'PAA-0001-0019', 1, 1),
(54313, 11, 1, 8, 'new data after purge', 'PAA-0001-0020', 1, 1),
(54314, 11, 1, 9, 'new data after purge', 'PAA-0001-0021', 1, 1),
(54315, 11, 1, 10, 'new data after purge', 'PAA-0001-0022', 1, 1),
(54316, 11, 1, 11, 'new data after purge', 'PAA-0001-0023', 1, 1),
(54317, 11, 1, 13, 'new data after purge', 'PAA-0001-0024', 1, 1),
(54318, 11, 1, 5, 'new data after purge', 'PAA-0001-0025', 1, 1),
(54319, 11, 1, 6, 'new data after purge', 'PAA-0001-0026', 1, 1),
(54320, 11, 1, 7, 'new data after purge', 'PAA-0001-0027', 1, 1),
(54321, 11, 1, 8, 'new data after purge', 'PAA-0001-0028', 1, 1),
(54322, 11, 1, 9, 'new data after purge', 'PAA-0001-0029', 1, 1),
(54323, 11, 1, 10, 'new data after purge', 'PAA-0001-0030', 1, 1),
(54324, 11, 1, 11, 'new data after purge', 'PAA-0001-0031', 1, 1),
(54325, 11, 1, 13, 'new data after purge', 'PAA-0001-0032', 1, 1),
(54326, 11, 1, 5, 'new data after purge', 'PAA-0001-0033', 1, 1),
(54327, 11, 1, 6, 'new data after purge', 'PAA-0001-0034', 1, 1),
(54328, 11, 1, 7, 'new data after purge', 'PAA-0001-0035', 1, 1),
(54329, 11, 1, 8, 'new data after purge', 'PAA-0001-0036', 1, 1),
(54330, 11, 1, 9, 'new data after purge', 'PAA-0001-0037', 1, 1),
(54331, 11, 1, 10, 'new data after purge', 'PAA-0001-0038', 1, 1),
(54332, 11, 1, 11, 'new data after purge', 'PAA-0001-0039', 1, 1),
(54333, 11, 1, 13, 'new data after purge', 'PAA-0001-0040', 1, 1),
(54334, 11, 1, 5, 'new data after purge', 'PAA-0001-0041', 1, 1),
(54335, 11, 1, 6, 'new data after purge', 'PAA-0001-0042', 1, 1),
(54336, 11, 1, 7, 'new data after purge', 'PAA-0001-0043', 1, 1),
(54337, 11, 1, 8, 'new data after purge', 'PAA-0001-0044', 1, 1),
(54338, 11, 1, 9, 'new data after purge', 'PAA-0001-0045', 1, 1),
(54339, 11, 1, 10, 'new data after purge', 'PAA-0001-0046', 1, 1),
(54340, 11, 1, 11, 'new data after purge', 'PAA-0001-0047', 1, 1),
(54341, 11, 1, 13, 'new data after purge', 'PAA-0001-0048', 1, 1),
(54342, 11, 1, 5, 'new data after purge', 'PAA-0001-0049', 1, 1),
(54343, 11, 1, 6, 'new data after purge', 'PAA-0001-0050', 1, 1),
(54344, 11, 1, 7, 'new data after purge', 'PAA-0001-0051', 1, 1),
(54345, 11, 1, 8, 'new data after purge', 'PAA-0001-0052', 1, 1),
(54346, 11, 1, 9, 'new data after purge', 'PAA-0001-0053', 1, 1),
(54347, 11, 1, 10, 'new data after purge', 'PAA-0001-0054', 1, 1),
(54348, 11, 1, 11, 'new data after purge', 'PAA-0001-0055', 1, 1),
(54349, 11, 1, 13, 'new data after purge', 'PAA-0001-0056', 1, 1),
(54350, 11, 1, 5, 'new data after purge', 'PAA-0001-0057', 1, 1),
(54351, 11, 1, 6, 'new data after purge', 'PAA-0001-0058', 1, 1),
(54352, 11, 1, 7, 'new data after purge', 'PAA-0001-0059', 1, 1),
(54353, 11, 1, 8, 'new data after purge', 'PAA-0001-0060', 1, 1),
(54354, 11, 1, 9, 'new data after purge', 'PAA-0001-0061', 1, 1),
(54355, 11, 1, 10, 'new data after purge', 'PAA-0001-0062', 1, 1),
(54356, 11, 1, 11, 'new data after purge', 'PAA-0001-0063', 1, 1),
(54357, 11, 2, 13, 'new data after purge', 'PAA-0001-0064', 1, 1),
(54358, 12, 1, 5, 'new data after purge', 'PAA-0002-0001', 1, 1),
(54359, 12, 1, 6, 'audit', 'PAA-0002-0002', 1, 1),
(54360, 12, 1, 7, 'new data after purge', 'PAA-0002-0003', 1, 1),
(54361, 12, 1, 8, 'new data after purge', 'PAA-0002-0004', 1, 1),
(54362, 12, 1, 9, 'new data after purge', 'PAA-0002-0005', 1, 1),
(54363, 12, 1, 10, 'new data after purge', 'PAA-0002-0006', 1, 1),
(54364, 12, 1, 11, 'new data after purge', 'PAA-0002-0007', 1, 1),
(54365, 12, 1, 13, 'new data after purge', 'PAA-0002-0008', 1, 1),
(54366, 12, 1, 5, 'new data after purge', 'PAA-0002-0009', 1, 1),
(54367, 12, 1, 6, 'new data after purge', 'PAA-0002-0010', 1, 1),
(54368, 12, 1, 7, 'new data after purge', 'PAA-0002-0011', 1, 1),
(54369, 12, 1, 8, 'new data after purge', 'PAA-0002-0012', 1, 1),
(54370, 12, 1, 9, 'new data after purge', 'PAA-0002-0013', 1, 1),
(54371, 12, 1, 10, 'new data after purge', 'PAA-0002-0014', 1, 1),
(54372, 12, 1, 11, 'new data after purge', 'PAA-0002-0015', 1, 1),
(54373, 12, 1, 13, 'new data after purge', 'PAA-0002-0016', 1, 1),
(54374, 12, 1, 5, 'new data after purge', 'PAA-0002-0017', 1, 1),
(54375, 12, 1, 6, 'new data after purge', 'PAA-0002-0018', 1, 1),
(54376, 12, 1, 7, 'new data after purge', 'PAA-0002-0019', 1, 1),
(54377, 12, 1, 8, 'new data after purge', 'PAA-0002-0020', 1, 1),
(54378, 12, 1, 9, 'new data after purge', 'PAA-0002-0021', 1, 1),
(54379, 12, 1, 10, 'new data after purge', 'PAA-0002-0022', 1, 1),
(54380, 12, 1, 11, 'new data after purge', 'PAA-0002-0023', 1, 1),
(54381, 12, 1, 13, 'new data after purge', 'PAA-0002-0024', 1, 1),
(54382, 12, 1, 5, 'new data after purge', 'PAA-0002-0025', 1, 1),
(54383, 12, 1, 6, 'new data after purge', 'PAA-0002-0026', 1, 1),
(54384, 12, 1, 7, 'new data after purge', 'PAA-0002-0027', 1, 1),
(54385, 12, 1, 8, 'new data after purge', 'PAA-0002-0028', 1, 1),
(54386, 12, 1, 9, 'new data after purge', 'PAA-0002-0029', 1, 1),
(54387, 12, 1, 10, 'new data after purge', 'PAA-0002-0030', 1, 1),
(54388, 12, 1, 11, 'new data after purge', 'PAA-0002-0031', 1, 1),
(54389, 12, 1, 13, 'new data after purge', 'PAA-0002-0032', 1, 1),
(54390, 12, 1, 5, 'new data after purge', 'PAA-0002-0033', 1, 1),
(54391, 12, 1, 6, 'new data after purge', 'PAA-0002-0034', 1, 1),
(54392, 12, 1, 7, 'new data after purge', 'PAA-0002-0035', 1, 1),
(54393, 12, 1, 8, 'new data after purge', 'PAA-0002-0036', 1, 1),
(54394, 12, 1, 9, 'new data after purge', 'PAA-0002-0037', 1, 1),
(54395, 12, 1, 10, 'new data after purge', 'PAA-0002-0038', 1, 1),
(54396, 12, 1, 11, 'new data after purge', 'PAA-0002-0039', 1, 1),
(54397, 12, 1, 13, 'new data after purge', 'PAA-0002-0040', 1, 1),
(54398, 12, 1, 5, 'new data after purge', 'PAA-0002-0041', 1, 1),
(54399, 12, 1, 6, 'new data after purge', 'PAA-0002-0042', 1, 1),
(54400, 12, 1, 7, 'new data after purge', 'PAA-0002-0043', 1, 1),
(54401, 12, 1, 8, 'new data after purge', 'PAA-0002-0044', 1, 1),
(54402, 12, 1, 9, 'new data after purge', 'PAA-0002-0045', 1, 1),
(54403, 12, 1, 10, 'new data after purge', 'PAA-0002-0046', 1, 1),
(54404, 12, 1, 11, 'new data after purge', 'PAA-0002-0047', 1, 1),
(54405, 12, 1, 13, 'new data after purge', 'PAA-0002-0048', 1, 1),
(54406, 12, 1, 5, 'new data after purge', 'PAA-0002-0049', 1, 1),
(54407, 12, 1, 6, 'new data after purge', 'PAA-0002-0050', 1, 1),
(54408, 12, 1, 7, 'new data after purge', 'PAA-0002-0051', 1, 1),
(54409, 12, 1, 8, 'new data after purge', 'PAA-0002-0052', 1, 1),
(54410, 12, 1, 9, 'new data after purge', 'PAA-0002-0053', 1, 1),
(54411, 12, 1, 10, 'new data after purge', 'PAA-0002-0054', 1, 1),
(54412, 12, 1, 11, 'new data after purge', 'PAA-0002-0055', 1, 1),
(54413, 12, 1, 13, 'new data after purge', 'PAA-0002-0056', 1, 1),
(54414, 12, 1, 5, 'new data after purge', 'PAA-0002-0057', 1, 1),
(54415, 12, 1, 6, 'new data after purge', 'PAA-0002-0058', 1, 1),
(54416, 12, 1, 7, 'new data after purge', 'PAA-0002-0059', 1, 1),
(54417, 12, 1, 8, 'new data after purge', 'PAA-0002-0060', 1, 1),
(54418, 12, 1, 9, 'new data after purge', 'PAA-0002-0061', 1, 1),
(54419, 12, 1, 10, 'new data after purge', 'PAA-0002-0062', 1, 1),
(54420, 12, 1, 11, 'new data after purge', 'PAA-0002-0063', 1, 1),
(54421, 12, 1, 13, 'new data after purge', 'PAA-0002-0064', 1, 1),
(54422, 13, 1, 7, 'audit', 'PCA-0001-0001', 2, 1),
(54423, 13, 1, 6, 'new data after purge', 'PCA-0001-0002', 1, 1),
(54424, 13, 1, 7, 'new data after purge', 'PCA-0001-0003', 1, 1),
(54425, 13, 1, 8, 'new data after purge', 'PCA-0001-0004', 1, 1),
(54426, 13, 1, 9, 'new data after purge', 'PCA-0001-0005', 1, 1),
(54427, 13, 1, 10, 'new data after purge', 'PCA-0001-0006', 1, 1),
(54428, 13, 1, 11, 'new data after purge', 'PCA-0001-0007', 1, 1),
(54429, 13, 1, 13, 'new data after purge', 'PCA-0001-0008', 1, 1),
(54430, 13, 1, 5, 'new data after purge', 'PCA-0001-0009', 1, 1),
(54431, 13, 1, 6, 'new data after purge', 'PCA-0001-0010', 1, 1),
(54432, 13, 1, 7, 'new data after purge', 'PCA-0001-0011', 1, 1),
(54433, 13, 1, 8, 'new data after purge', 'PCA-0001-0012', 1, 1),
(54434, 13, 1, 9, 'new data after purge', 'PCA-0001-0013', 1, 1),
(54435, 13, 1, 10, 'new data after purge', 'PCA-0001-0014', 1, 1),
(54436, 13, 1, 11, 'new data after purge', 'PCA-0001-0015', 1, 1),
(54437, 13, 1, 13, 'new data after purge', 'PCA-0001-0016', 1, 1),
(54438, 13, 1, 5, 'new data after purge', 'PCA-0001-0017', 1, 1),
(54439, 13, 1, 6, 'new data after purge', 'PCA-0001-0018', 1, 1),
(54440, 13, 1, 7, 'new data after purge', 'PCA-0001-0019', 1, 1),
(54441, 13, 1, 8, 'new data after purge', 'PCA-0001-0020', 1, 1),
(54442, 13, 1, 9, 'new data after purge', 'PCA-0001-0021', 1, 1),
(54443, 13, 1, 10, 'new data after purge', 'PCA-0001-0022', 1, 1),
(54444, 13, 1, 11, 'new data after purge', 'PCA-0001-0023', 1, 1),
(54445, 13, 1, 13, 'new data after purge', 'PCA-0001-0024', 1, 1),
(54446, 13, 1, 5, 'new data after purge', 'PCA-0001-0025', 1, 1),
(54447, 13, 1, 6, 'new data after purge', 'PCA-0001-0026', 1, 1),
(54448, 13, 1, 7, 'new data after purge', 'PCA-0001-0027', 1, 1),
(54449, 13, 1, 8, 'new data after purge', 'PCA-0001-0028', 1, 1),
(54450, 13, 1, 9, 'new data after purge', 'PCA-0001-0029', 1, 1),
(54451, 13, 1, 10, 'new data after purge', 'PCA-0001-0030', 1, 1),
(54452, 13, 1, 11, 'new data after purge', 'PCA-0001-0031', 1, 1),
(54453, 13, 1, 13, 'new data after purge', 'PCA-0001-0032', 1, 1),
(54454, 13, 1, 5, 'new data after purge', 'PCA-0001-0033', 1, 1),
(54455, 13, 1, 6, 'new data after purge', 'PCA-0001-0034', 1, 1),
(54456, 13, 1, 7, 'new data after purge', 'PCA-0001-0035', 1, 1),
(54457, 13, 1, 8, 'new data after purge', 'PCA-0001-0036', 1, 1),
(54458, 13, 1, 9, 'new data after purge', 'PCA-0001-0037', 1, 1),
(54459, 13, 1, 10, 'new data after purge', 'PCA-0001-0038', 1, 1),
(54460, 13, 1, 11, 'new data after purge', 'PCA-0001-0039', 1, 1),
(54461, 13, 1, 13, 'new data after purge', 'PCA-0001-0040', 1, 1),
(54462, 13, 1, 5, 'new data after purge', 'PCA-0001-0041', 1, 1),
(54463, 13, 1, 6, 'new data after purge', 'PCA-0001-0042', 1, 1),
(54464, 13, 1, 7, 'new data after purge', 'PCA-0001-0043', 1, 1),
(54465, 13, 1, 8, 'new data after purge', 'PCA-0001-0044', 1, 1),
(54466, 13, 1, 9, 'new data after purge', 'PCA-0001-0045', 1, 1),
(54467, 13, 1, 10, 'new data after purge', 'PCA-0001-0046', 1, 1),
(54468, 13, 1, 11, 'new data after purge', 'PCA-0001-0047', 1, 1),
(54469, 13, 1, 13, 'new data after purge', 'PCA-0001-0048', 1, 1),
(54470, 13, 1, 5, 'new data after purge', 'PCA-0001-0049', 1, 1),
(54471, 13, 1, 6, 'new data after purge', 'PCA-0001-0050', 1, 1),
(54472, 13, 1, 7, 'new data after purge', 'PCA-0001-0051', 1, 1),
(54473, 13, 1, 8, 'new data after purge', 'PCA-0001-0052', 1, 1),
(54474, 13, 1, 9, 'new data after purge', 'PCA-0001-0053', 1, 1),
(54475, 13, 1, 10, 'new data after purge', 'PCA-0001-0054', 1, 1),
(54476, 13, 1, 11, 'new data after purge', 'PCA-0001-0055', 1, 1),
(54477, 13, 1, 13, 'new data after purge', 'PCA-0001-0056', 1, 1),
(54478, 13, 1, 5, 'new data after purge', 'PCA-0001-0057', 1, 1),
(54479, 13, 1, 6, 'new data after purge', 'PCA-0001-0058', 1, 1),
(54480, 13, 1, 7, 'new data after purge', 'PCA-0001-0059', 1, 1),
(54481, 13, 1, 8, 'new data after purge', 'PCA-0001-0060', 1, 1),
(54482, 13, 1, 9, 'new data after purge', 'PCA-0001-0061', 1, 1),
(54483, 13, 1, 10, 'new data after purge', 'PCA-0001-0062', 1, 1),
(54484, 13, 1, 11, 'new data after purge', 'PCA-0001-0063', 1, 1),
(54485, 13, 1, 13, 'new data after purge', 'PCA-0001-0064', 1, 1),
(54486, 14, 1, 5, 'new data after purge', 'PAA-0003-0001', 1, 1),
(54487, 14, 1, 6, 'new data after purge', 'PAA-0003-0002', 1, 1),
(54488, 14, 1, 7, 'new data after purge', 'PAA-0003-0003', 1, 1),
(54489, 14, 1, 8, 'new data after purge', 'PAA-0003-0004', 1, 1),
(54490, 14, 1, 9, 'new data after purge', 'PAA-0003-0005', 1, 1),
(54491, 14, 1, 10, 'new data after purge', 'PAA-0003-0006', 1, 1),
(54492, 14, 1, 11, 'new data after purge', 'PAA-0003-0007', 1, 1),
(54493, 14, 1, 13, 'new data after purge', 'PAA-0003-0008', 1, 1),
(54494, 14, 1, 5, 'new data after purge', 'PAA-0003-0009', 1, 1),
(54495, 14, 1, 6, 'new data after purge', 'PAA-0003-0010', 1, 1),
(54496, 14, 1, 7, 'new data after purge', 'PAA-0003-0011', 1, 1),
(54497, 14, 1, 8, 'new data after purge', 'PAA-0003-0012', 1, 1),
(54498, 14, 1, 9, 'new data after purge', 'PAA-0003-0013', 1, 1),
(54499, 14, 1, 10, 'new data after purge', 'PAA-0003-0014', 1, 1),
(54500, 14, 1, 11, 'new data after purge', 'PAA-0003-0015', 1, 1),
(54501, 14, 1, 13, 'new data after purge', 'PAA-0003-0016', 1, 1),
(54502, 14, 1, 5, 'new data after purge', 'PAA-0003-0017', 1, 1),
(54503, 14, 1, 6, 'new data after purge', 'PAA-0003-0018', 1, 1),
(54504, 14, 1, 7, 'new data after purge', 'PAA-0003-0019', 1, 1),
(54505, 14, 1, 8, 'new data after purge', 'PAA-0003-0020', 1, 1),
(54506, 14, 1, 9, 'new data after purge', 'PAA-0003-0021', 1, 1),
(54507, 14, 1, 10, 'new data after purge', 'PAA-0003-0022', 1, 1),
(54508, 14, 1, 11, 'new data after purge', 'PAA-0003-0023', 1, 1),
(54509, 14, 1, 13, 'new data after purge', 'PAA-0003-0024', 1, 1),
(54510, 14, 1, 5, 'new data after purge', 'PAA-0003-0025', 1, 1),
(54511, 14, 1, 6, 'new data after purge', 'PAA-0003-0026', 1, 1),
(54512, 14, 1, 7, 'new data after purge', 'PAA-0003-0027', 1, 1),
(54513, 14, 1, 8, 'new data after purge', 'PAA-0003-0028', 1, 1),
(54514, 14, 1, 9, 'new data after purge', 'PAA-0003-0029', 1, 1),
(54515, 14, 1, 10, 'new data after purge', 'PAA-0003-0030', 1, 1),
(54516, 14, 1, 11, 'new data after purge', 'PAA-0003-0031', 1, 1),
(54517, 14, 1, 13, 'new data after purge', 'PAA-0003-0032', 1, 1),
(54518, 14, 1, 5, 'new data after purge', 'PAA-0003-0033', 1, 1),
(54519, 14, 1, 6, 'new data after purge', 'PAA-0003-0034', 1, 1),
(54520, 14, 1, 7, 'new data after purge', 'PAA-0003-0035', 1, 1),
(54521, 14, 1, 8, 'new data after purge', 'PAA-0003-0036', 1, 1),
(54522, 14, 1, 9, 'new data after purge', 'PAA-0003-0037', 1, 1),
(54523, 14, 1, 10, 'new data after purge', 'PAA-0003-0038', 1, 1),
(54524, 14, 1, 11, 'new data after purge', 'PAA-0003-0039', 1, 1),
(54525, 14, 1, 13, 'new data after purge', 'PAA-0003-0040', 1, 1),
(54526, 14, 1, 5, 'new data after purge', 'PAA-0003-0041', 1, 1),
(54527, 14, 1, 6, 'new data after purge', 'PAA-0003-0042', 1, 1),
(54528, 14, 1, 7, 'new data after purge', 'PAA-0003-0043', 1, 1),
(54529, 14, 1, 8, 'new data after purge', 'PAA-0003-0044', 1, 1),
(54530, 14, 1, 9, 'new data after purge', 'PAA-0003-0045', 1, 1),
(54531, 14, 1, 10, 'new data after purge', 'PAA-0003-0046', 1, 1),
(54532, 14, 1, 11, 'new data after purge', 'PAA-0003-0047', 1, 1),
(54533, 14, 1, 13, 'new data after purge', 'PAA-0003-0048', 1, 1),
(54534, 14, 1, 5, 'new data after purge', 'PAA-0003-0049', 1, 1),
(54535, 14, 1, 6, 'new data after purge', 'PAA-0003-0050', 1, 1),
(54536, 14, 1, 7, 'new data after purge', 'PAA-0003-0051', 1, 1),
(54537, 14, 1, 8, 'new data after purge', 'PAA-0003-0052', 1, 1),
(54538, 14, 1, 9, 'new data after purge', 'PAA-0003-0053', 1, 1),
(54539, 14, 1, 10, 'new data after purge', 'PAA-0003-0054', 1, 1),
(54540, 14, 1, 11, 'new data after purge', 'PAA-0003-0055', 1, 1),
(54541, 14, 1, 13, 'new data after purge', 'PAA-0003-0056', 1, 1),
(54542, 14, 1, 5, 'new data after purge', 'PAA-0003-0057', 1, 1),
(54543, 14, 1, 6, 'new data after purge', 'PAA-0003-0058', 1, 1),
(54544, 14, 1, 7, 'new data after purge', 'PAA-0003-0059', 1, 1),
(54545, 14, 1, 8, 'new data after purge', 'PAA-0003-0060', 1, 1),
(54546, 14, 1, 9, 'new data after purge', 'PAA-0003-0061', 1, 1),
(54547, 14, 1, 10, 'new data after purge', 'PAA-0003-0062', 1, 1),
(54548, 14, 1, 11, 'new data after purge', 'PAA-0003-0063', 1, 1),
(54549, 14, 1, 13, 'new data after purge', 'PAA-0003-0064', 1, 1),
(54550, 15, 1, 5, 'new data after purge', 'VDA-0001-0001', 1, 1),
(54551, 15, 2, 6, 'new data after purge', 'VDA-0001-0002', 1, 1),
(54552, 15, 1, 7, 'new data after purge', 'VDA-0001-0003', 1, 1),
(54553, 15, 1, 8, 'new data after purge', 'VDA-0001-0004', 1, 1),
(54554, 15, 1, 9, 'new data after purge', 'VDA-0001-0005', 1, 1),
(54555, 15, 1, 10, 'new data after purge', 'VDA-0001-0006', 1, 1),
(54556, 15, 1, 11, 'new data after purge', 'VDA-0001-0007', 1, 1),
(54557, 15, 1, 13, 'new data after purge', 'VDA-0001-0008', 1, 1),
(54558, 15, 1, 5, 'new data after purge', 'VDA-0001-0009', 1, 1),
(54559, 15, 1, 6, 'new data after purge', 'VDA-0001-0010', 1, 1),
(54560, 15, 1, 7, 'new data after purge', 'VDA-0001-0011', 1, 1),
(54561, 15, 1, 8, 'new data after purge', 'VDA-0001-0012', 1, 1),
(54562, 15, 1, 9, 'new data after purge', 'VDA-0001-0013', 1, 1),
(54563, 15, 1, 10, 'new data after purge', 'VDA-0001-0014', 1, 1),
(54564, 15, 1, 11, 'new data after purge', 'VDA-0001-0015', 1, 1),
(54565, 15, 1, 13, 'new data after purge', 'VDA-0001-0016', 1, 1),
(54566, 15, 1, 5, 'new data after purge', 'VDA-0001-0017', 1, 1),
(54567, 15, 1, 6, 'new data after purge', 'VDA-0001-0018', 1, 1),
(54568, 15, 1, 7, 'new data after purge', 'VDA-0001-0019', 1, 1),
(54569, 15, 1, 8, 'new data after purge', 'VDA-0001-0020', 1, 1),
(54570, 15, 1, 9, 'new data after purge', 'VDA-0001-0021', 1, 1),
(54571, 15, 1, 10, 'new data after purge', 'VDA-0001-0022', 1, 1),
(54572, 15, 1, 11, 'new data after purge', 'VDA-0001-0023', 1, 1),
(54573, 15, 1, 13, 'new data after purge', 'VDA-0001-0024', 1, 1),
(54574, 15, 1, 5, 'new data after purge', 'VDA-0001-0025', 1, 1),
(54575, 15, 1, 6, 'new data after purge', 'VDA-0001-0026', 1, 1),
(54576, 15, 1, 7, 'new data after purge', 'VDA-0001-0027', 1, 1),
(54577, 15, 1, 8, 'new data after purge', 'VDA-0001-0028', 1, 1),
(54578, 15, 1, 9, 'new data after purge', 'VDA-0001-0029', 1, 1),
(54579, 15, 1, 10, 'new data after purge', 'VDA-0001-0030', 1, 1),
(54580, 15, 1, 11, 'new data after purge', 'VDA-0001-0031', 1, 1),
(54581, 15, 1, 13, 'new data after purge', 'VDA-0001-0032', 1, 1),
(54582, 15, 1, 5, 'new data after purge', 'VDA-0001-0033', 1, 1),
(54583, 15, 1, 6, 'new data after purge', 'VDA-0001-0034', 1, 1),
(54584, 15, 1, 7, 'new data after purge', 'VDA-0001-0035', 1, 1),
(54585, 15, 1, 8, 'new data after purge', 'VDA-0001-0036', 1, 1),
(54586, 15, 1, 9, 'new data after purge', 'VDA-0001-0037', 1, 1),
(54587, 15, 1, 10, 'new data after purge', 'VDA-0001-0038', 1, 1),
(54588, 15, 1, 11, 'new data after purge', 'VDA-0001-0039', 1, 1),
(54589, 15, 1, 13, 'new data after purge', 'VDA-0001-0040', 1, 1),
(54590, 15, 1, 5, 'new data after purge', 'VDA-0001-0041', 1, 1),
(54591, 15, 1, 6, 'new data after purge', 'VDA-0001-0042', 1, 1),
(54592, 15, 1, 7, 'new data after purge', 'VDA-0001-0043', 1, 1),
(54593, 15, 1, 8, 'new data after purge', 'VDA-0001-0044', 1, 1),
(54594, 15, 1, 9, 'new data after purge', 'VDA-0001-0045', 1, 1),
(54595, 15, 1, 10, 'new data after purge', 'VDA-0001-0046', 1, 1),
(54596, 15, 1, 11, 'new data after purge', 'VDA-0001-0047', 1, 1),
(54597, 15, 1, 13, 'new data after purge', 'VDA-0001-0048', 1, 1),
(54598, 15, 1, 5, 'new data after purge', 'VDA-0001-0049', 1, 1),
(54599, 15, 1, 6, 'new data after purge', 'VDA-0001-0050', 1, 1),
(54600, 15, 1, 7, 'new data after purge', 'VDA-0001-0051', 1, 1),
(54601, 15, 1, 8, 'new data after purge', 'VDA-0001-0052', 1, 1),
(54602, 15, 1, 9, 'new data after purge', 'VDA-0001-0053', 1, 1),
(54603, 15, 1, 10, 'new data after purge', 'VDA-0001-0054', 1, 1),
(54604, 15, 1, 11, 'new data after purge', 'VDA-0001-0055', 1, 1),
(54605, 15, 1, 13, 'new data after purge', 'VDA-0001-0056', 1, 1),
(54606, 15, 1, 5, 'new data after purge', 'VDA-0001-0057', 1, 1),
(54607, 15, 1, 6, 'new data after purge', 'VDA-0001-0058', 1, 1),
(54608, 15, 1, 7, 'new data after purge', 'VDA-0001-0059', 1, 1),
(54609, 15, 1, 8, 'new data after purge', 'VDA-0001-0060', 1, 1),
(54610, 15, 1, 9, 'new data after purge', 'VDA-0001-0061', 1, 1),
(54611, 15, 1, 10, 'new data after purge', 'VDA-0001-0062', 1, 1),
(54612, 15, 1, 11, 'new data after purge', 'VDA-0001-0063', 1, 1),
(54613, 15, 1, 13, 'new data after purge', 'VDA-0001-0064', 1, 1),
(54614, 16, 2, 5, 'new data after purge', 'VDA-0002-0001', 1, 1),
(54615, 16, 1, 6, 'new data after purge', 'VDA-0002-0002', 1, 1),
(54616, 16, 1, 7, 'new data after purge', 'VDA-0002-0003', 1, 1),
(54617, 16, 1, 8, 'new data after purge', 'VDA-0002-0004', 1, 1),
(54618, 16, 1, 9, 'new data after purge', 'VDA-0002-0005', 1, 1),
(54619, 16, 1, 10, 'new data after purge', 'VDA-0002-0006', 1, 1),
(54620, 16, 1, 11, 'new data after purge', 'VDA-0002-0007', 1, 1),
(54621, 16, 1, 13, 'new data after purge', 'VDA-0002-0008', 1, 1),
(54622, 16, 1, 5, 'new data after purge', 'VDA-0002-0009', 1, 1),
(54623, 16, 1, 6, 'new data after purge', 'VDA-0002-0010', 1, 1),
(54624, 16, 1, 7, 'new data after purge', 'VDA-0002-0011', 1, 1),
(54625, 16, 1, 8, 'new data after purge', 'VDA-0002-0012', 1, 1),
(54626, 16, 1, 9, 'new data after purge', 'VDA-0002-0013', 1, 1),
(54627, 16, 1, 10, 'new data after purge', 'VDA-0002-0014', 1, 1),
(54628, 16, 1, 11, 'new data after purge', 'VDA-0002-0015', 1, 1),
(54629, 16, 1, 13, 'new data after purge', 'VDA-0002-0016', 1, 1),
(54630, 16, 1, 5, 'new data after purge', 'VDA-0002-0017', 1, 1),
(54631, 16, 1, 6, 'new data after purge', 'VDA-0002-0018', 1, 1),
(54632, 16, 1, 7, 'new data after purge', 'VDA-0002-0019', 1, 1),
(54633, 16, 1, 8, 'new data after purge', 'VDA-0002-0020', 1, 1),
(54634, 16, 1, 9, 'new data after purge', 'VDA-0002-0021', 1, 1),
(54635, 16, 1, 10, 'new data after purge', 'VDA-0002-0022', 1, 1),
(54636, 16, 1, 11, 'new data after purge', 'VDA-0002-0023', 1, 1),
(54637, 16, 1, 13, 'new data after purge', 'VDA-0002-0024', 1, 1),
(54638, 16, 1, 5, 'new data after purge', 'VDA-0002-0025', 1, 1),
(54639, 16, 1, 6, 'new data after purge', 'VDA-0002-0026', 1, 1),
(54640, 16, 1, 7, 'new data after purge', 'VDA-0002-0027', 1, 1),
(54641, 16, 1, 8, 'new data after purge', 'VDA-0002-0028', 1, 1),
(54642, 16, 1, 9, 'new data after purge', 'VDA-0002-0029', 1, 1),
(54643, 16, 1, 10, 'new data after purge', 'VDA-0002-0030', 1, 1),
(54644, 16, 1, 11, 'new data after purge', 'VDA-0002-0031', 1, 1),
(54645, 16, 1, 13, 'new data after purge', 'VDA-0002-0032', 1, 1),
(54646, 16, 1, 5, 'new data after purge', 'VDA-0002-0033', 1, 1),
(54647, 16, 1, 6, 'new data after purge', 'VDA-0002-0034', 1, 1),
(54648, 16, 1, 7, 'new data after purge', 'VDA-0002-0035', 1, 1),
(54649, 16, 1, 8, 'new data after purge', 'VDA-0002-0036', 1, 1),
(54650, 16, 1, 9, 'new data after purge', 'VDA-0002-0037', 1, 1),
(54651, 16, 1, 10, 'new data after purge', 'VDA-0002-0038', 1, 1),
(54652, 16, 1, 11, 'new data after purge', 'VDA-0002-0039', 1, 1),
(54653, 16, 1, 13, 'new data after purge', 'VDA-0002-0040', 1, 1),
(54654, 16, 1, 5, 'new data after purge', 'VDA-0002-0041', 1, 1),
(54655, 16, 1, 6, 'new data after purge', 'VDA-0002-0042', 1, 1),
(54656, 16, 1, 7, 'new data after purge', 'VDA-0002-0043', 1, 1),
(54657, 16, 1, 8, 'new data after purge', 'VDA-0002-0044', 1, 1),
(54658, 16, 1, 9, 'new data after purge', 'VDA-0002-0045', 1, 1),
(54659, 16, 1, 10, 'new data after purge', 'VDA-0002-0046', 1, 1),
(54660, 16, 1, 11, 'new data after purge', 'VDA-0002-0047', 1, 1),
(54661, 16, 1, 13, 'new data after purge', 'VDA-0002-0048', 1, 1),
(54662, 16, 1, 5, 'new data after purge', 'VDA-0002-0049', 1, 1),
(54663, 16, 1, 6, 'new data after purge', 'VDA-0002-0050', 1, 1),
(54664, 16, 1, 7, 'new data after purge', 'VDA-0002-0051', 1, 1),
(54665, 16, 1, 8, 'new data after purge', 'VDA-0002-0052', 1, 1),
(54666, 16, 1, 9, 'new data after purge', 'VDA-0002-0053', 1, 1),
(54667, 16, 1, 10, 'new data after purge', 'VDA-0002-0054', 1, 1),
(54668, 16, 1, 11, 'new data after purge', 'VDA-0002-0055', 1, 1),
(54669, 16, 1, 13, 'new data after purge', 'VDA-0002-0056', 1, 1),
(54670, 16, 1, 5, 'new data after purge', 'VDA-0002-0057', 1, 1),
(54671, 16, 1, 6, 'new data after purge', 'VDA-0002-0058', 1, 1),
(54672, 16, 1, 7, 'new data after purge', 'VDA-0002-0059', 1, 1),
(54673, 16, 1, 8, 'new data after purge', 'VDA-0002-0060', 1, 1),
(54674, 16, 1, 9, 'new data after purge', 'VDA-0002-0061', 1, 1),
(54675, 16, 1, 10, 'new data after purge', 'VDA-0002-0062', 1, 1),
(54676, 16, 1, 11, 'new data after purge', 'VDA-0002-0063', 1, 1),
(54677, 16, 1, 13, 'new data after purge', 'VDA-0002-0064', 1, 1),
(54678, 18, 1, 5, 'new data after purge', 'VDA-0003-0001', 1, 1),
(54679, 18, 1, 6, 'new data after purge', 'VDA-0003-0002', 1, 1),
(54680, 18, 1, 7, 'new data after purge', 'VDA-0003-0003', 1, 1),
(54681, 18, 1, 8, 'new data after purge', 'VDA-0003-0004', 1, 1),
(54682, 18, 1, 9, 'new data after purge', 'VDA-0003-0005', 1, 1),
(54683, 18, 1, 10, 'new data after purge', 'VDA-0003-0006', 1, 1),
(54684, 18, 1, 11, 'new data after purge', 'VDA-0003-0007', 1, 1),
(54685, 18, 1, 13, 'new data after purge', 'VDA-0003-0008', 1, 1),
(54686, 18, 1, 5, 'new data after purge', 'VDA-0003-0009', 1, 1),
(54687, 18, 1, 6, 'new data after purge', 'VDA-0003-0010', 1, 1),
(54688, 18, 1, 7, 'new data after purge', 'VDA-0003-0011', 1, 1),
(54689, 18, 1, 8, 'new data after purge', 'VDA-0003-0012', 1, 1),
(54690, 18, 1, 9, 'new data after purge', 'VDA-0003-0013', 1, 1),
(54691, 18, 1, 10, 'new data after purge', 'VDA-0003-0014', 1, 1),
(54692, 18, 1, 11, 'new data after purge', 'VDA-0003-0015', 1, 1),
(54693, 18, 1, 13, 'new data after purge', 'VDA-0003-0016', 1, 1),
(54694, 18, 1, 5, 'new data after purge', 'VDA-0003-0017', 1, 1),
(54695, 18, 1, 6, 'new data after purge', 'VDA-0003-0018', 1, 1),
(54696, 18, 1, 7, 'new data after purge', 'VDA-0003-0019', 1, 1),
(54697, 18, 1, 8, 'new data after purge', 'VDA-0003-0020', 1, 1),
(54698, 18, 1, 9, 'new data after purge', 'VDA-0003-0021', 1, 1),
(54699, 18, 1, 10, 'new data after purge', 'VDA-0003-0022', 1, 1),
(54700, 18, 1, 11, 'new data after purge', 'VDA-0003-0023', 1, 1),
(54701, 18, 1, 13, 'new data after purge', 'VDA-0003-0024', 1, 1),
(54702, 18, 1, 5, 'new data after purge', 'VDA-0003-0025', 1, 1),
(54703, 18, 1, 6, 'new data after purge', 'VDA-0003-0026', 1, 1),
(54704, 18, 1, 7, 'new data after purge', 'VDA-0003-0027', 1, 1),
(54705, 18, 1, 8, 'new data after purge', 'VDA-0003-0028', 1, 1),
(54706, 18, 1, 9, 'new data after purge', 'VDA-0003-0029', 1, 1),
(54707, 18, 1, 10, 'new data after purge', 'VDA-0003-0030', 1, 1),
(54708, 18, 1, 11, 'new data after purge', 'VDA-0003-0031', 1, 1),
(54709, 18, 1, 13, 'new data after purge', 'VDA-0003-0032', 1, 1),
(54710, 18, 1, 5, 'new data after purge', 'VDA-0003-0033', 1, 1),
(54711, 18, 1, 6, 'new data after purge', 'VDA-0003-0034', 1, 1),
(54712, 18, 1, 7, 'new data after purge', 'VDA-0003-0035', 1, 1),
(54713, 18, 1, 8, 'new data after purge', 'VDA-0003-0036', 1, 1),
(54714, 18, 1, 9, 'new data after purge', 'VDA-0003-0037', 1, 1),
(54715, 18, 1, 10, 'new data after purge', 'VDA-0003-0038', 1, 1),
(54716, 18, 1, 11, 'new data after purge', 'VDA-0003-0039', 1, 1),
(54717, 18, 1, 13, 'new data after purge', 'VDA-0003-0040', 1, 1),
(54718, 18, 1, 5, 'new data after purge', 'VDA-0003-0041', 1, 1),
(54719, 18, 1, 6, 'new data after purge', 'VDA-0003-0042', 1, 1),
(54720, 18, 1, 7, 'new data after purge', 'VDA-0003-0043', 1, 1),
(54721, 18, 1, 8, 'new data after purge', 'VDA-0003-0044', 1, 1),
(54722, 18, 1, 9, 'new data after purge', 'VDA-0003-0045', 1, 1),
(54723, 18, 1, 10, 'new data after purge', 'VDA-0003-0046', 1, 1),
(54724, 18, 1, 11, 'new data after purge', 'VDA-0003-0047', 1, 1),
(54725, 18, 1, 13, 'new data after purge', 'VDA-0003-0048', 1, 1),
(54726, 18, 1, 5, 'new data after purge', 'VDA-0003-0049', 1, 1),
(54727, 18, 1, 6, 'new data after purge', 'VDA-0003-0050', 1, 1),
(54728, 18, 1, 7, 'new data after purge', 'VDA-0003-0051', 1, 1),
(54729, 18, 1, 8, 'new data after purge', 'VDA-0003-0052', 1, 1),
(54730, 18, 1, 9, 'new data after purge', 'VDA-0003-0053', 1, 1),
(54731, 18, 1, 10, 'new data after purge', 'VDA-0003-0054', 1, 1),
(54732, 18, 1, 11, 'new data after purge', 'VDA-0003-0055', 1, 1),
(54733, 18, 1, 13, 'new data after purge', 'VDA-0003-0056', 1, 1),
(54734, 18, 1, 5, 'new data after purge', 'VDA-0003-0057', 1, 1),
(54735, 18, 1, 6, 'new data after purge', 'VDA-0003-0058', 1, 1),
(54736, 18, 1, 7, 'new data after purge', 'VDA-0003-0059', 1, 1),
(54737, 18, 1, 8, 'new data after purge', 'VDA-0003-0060', 1, 1),
(54738, 18, 1, 9, 'new data after purge', 'VDA-0003-0061', 1, 1),
(54739, 18, 1, 10, 'new data after purge', 'VDA-0003-0062', 1, 1),
(54740, 18, 1, 11, 'new data after purge', 'VDA-0003-0063', 1, 1),
(54741, 18, 1, 13, 'new data after purge', 'VDA-0003-0064', 1, 1),
(54742, 25, 1, 5, 'new data after purge', 'PAA-0004-0001', 1, 1),
(54743, 25, 1, 6, 'new data after purge', 'PAA-0004-0002', 1, 1),
(54744, 25, 1, 7, 'new data after purge', 'PAA-0004-0003', 1, 1),
(54745, 25, 2, 8, 'new data after purge', 'PAA-0004-0004', 1, 1),
(54746, 25, 1, 9, 'new data after purge', 'PAA-0004-0005', 1, 1),
(54747, 25, 1, 10, 'new data after purge', 'PAA-0004-0006', 1, 1),
(54748, 25, 1, 11, 'new data after purge', 'PAA-0004-0007', 1, 1),
(54749, 25, 1, 13, 'new data after purge', 'PAA-0004-0008', 1, 1),
(54750, 25, 1, 5, 'new data after purge', 'PAA-0004-0009', 1, 1),
(54751, 25, 1, 6, 'new data after purge', 'PAA-0004-0010', 1, 1),
(54752, 25, 1, 7, 'new data after purge', 'PAA-0004-0011', 1, 1),
(54753, 25, 1, 8, 'new data after purge', 'PAA-0004-0012', 1, 1),
(54754, 25, 1, 9, 'new data after purge', 'PAA-0004-0013', 1, 1),
(54755, 25, 1, 10, 'new data after purge', 'PAA-0004-0014', 1, 1),
(54756, 25, 1, 11, 'new data after purge', 'PAA-0004-0015', 1, 1),
(54757, 25, 1, 13, 'new data after purge', 'PAA-0004-0016', 1, 1),
(54758, 25, 1, 5, 'new data after purge', 'PAA-0004-0017', 1, 1),
(54759, 25, 1, 6, 'new data after purge', 'PAA-0004-0018', 1, 1),
(54760, 25, 1, 7, 'new data after purge', 'PAA-0004-0019', 1, 1),
(54761, 25, 1, 8, 'new data after purge', 'PAA-0004-0020', 1, 1),
(54762, 25, 1, 9, 'new data after purge', 'PAA-0004-0021', 1, 1),
(54763, 25, 1, 10, 'new data after purge', 'PAA-0004-0022', 1, 1),
(54764, 25, 1, 11, 'new data after purge', 'PAA-0004-0023', 1, 1),
(54765, 25, 1, 13, 'new data after purge', 'PAA-0004-0024', 1, 1),
(54766, 25, 1, 5, 'new data after purge', 'PAA-0004-0025', 1, 1),
(54767, 25, 1, 6, 'new data after purge', 'PAA-0004-0026', 1, 1),
(54768, 25, 1, 7, 'new data after purge', 'PAA-0004-0027', 1, 1),
(54769, 25, 1, 8, 'new data after purge', 'PAA-0004-0028', 1, 1),
(54770, 25, 1, 9, 'new data after purge', 'PAA-0004-0029', 1, 1),
(54771, 25, 1, 10, 'new data after purge', 'PAA-0004-0030', 1, 1),
(54772, 25, 1, 11, 'new data after purge', 'PAA-0004-0031', 1, 1),
(54773, 25, 1, 13, 'new data after purge', 'PAA-0004-0032', 1, 1),
(54774, 25, 1, 5, 'new data after purge', 'PAA-0004-0033', 1, 1),
(54775, 25, 1, 6, 'new data after purge', 'PAA-0004-0034', 1, 1),
(54776, 25, 1, 7, 'new data after purge', 'PAA-0004-0035', 1, 1),
(54777, 25, 1, 8, 'new data after purge', 'PAA-0004-0036', 1, 1),
(54778, 25, 1, 9, 'new data after purge', 'PAA-0004-0037', 1, 1),
(54779, 25, 1, 10, 'new data after purge', 'PAA-0004-0038', 1, 1),
(54780, 25, 1, 11, 'new data after purge', 'PAA-0004-0039', 1, 1),
(54781, 25, 1, 13, 'new data after purge', 'PAA-0004-0040', 1, 1),
(54782, 25, 1, 5, 'new data after purge', 'PAA-0004-0041', 1, 1),
(54783, 25, 1, 6, 'new data after purge', 'PAA-0004-0042', 1, 1),
(54784, 25, 1, 7, 'new data after purge', 'PAA-0004-0043', 1, 1),
(54785, 25, 1, 8, 'new data after purge', 'PAA-0004-0044', 1, 1),
(54786, 25, 1, 9, 'new data after purge', 'PAA-0004-0045', 1, 1),
(54787, 25, 1, 10, 'new data after purge', 'PAA-0004-0046', 1, 1),
(54788, 25, 1, 11, 'new data after purge', 'PAA-0004-0047', 1, 1),
(54789, 25, 1, 13, 'new data after purge', 'PAA-0004-0048', 1, 1),
(54790, 25, 1, 5, 'new data after purge', 'PAA-0004-0049', 1, 1),
(54791, 25, 1, 6, 'new data after purge', 'PAA-0004-0050', 1, 1),
(54792, 25, 1, 7, 'new data after purge', 'PAA-0004-0051', 1, 1),
(54793, 25, 1, 8, 'new data after purge', 'PAA-0004-0052', 1, 1),
(54794, 25, 1, 9, 'new data after purge', 'PAA-0004-0053', 1, 1),
(54795, 25, 1, 10, 'new data after purge', 'PAA-0004-0054', 1, 1),
(54796, 25, 1, 11, 'new data after purge', 'PAA-0004-0055', 1, 1),
(54797, 25, 1, 13, 'new data after purge', 'PAA-0004-0056', 1, 1),
(54798, 25, 1, 5, 'new data after purge', 'PAA-0004-0057', 1, 1),
(54799, 25, 1, 6, 'new data after purge', 'PAA-0004-0058', 1, 1),
(54800, 25, 1, 7, 'new data after purge', 'PAA-0004-0059', 1, 1),
(54801, 25, 1, 8, 'new data after purge', 'PAA-0004-0060', 1, 1),
(54802, 25, 1, 9, 'new data after purge', 'PAA-0004-0061', 1, 1),
(54803, 25, 1, 10, 'new data after purge', 'PAA-0004-0062', 1, 1),
(54804, 25, 1, 11, 'new data after purge', 'PAA-0004-0063', 1, 1),
(54805, 25, 1, 13, 'new data after purge', 'PAA-0004-0064', 1, 1),
(54806, 26, 1, 5, 'new data after purge', 'PCA-0002-0001', 1, 1),
(54807, 26, 1, 6, 'new data after purge', 'PCA-0002-0002', 1, 1),
(54808, 26, 1, 7, 'new data after purge', 'PCA-0002-0003', 1, 1),
(54809, 26, 2, 8, 'new data after purge', 'PCA-0002-0004', 1, 1),
(54810, 26, 1, 9, 'new data after purge', 'PCA-0002-0005', 1, 1),
(54811, 26, 1, 10, 'new data after purge', 'PCA-0002-0006', 1, 1),
(54812, 26, 1, 11, 'new data after purge', 'PCA-0002-0007', 1, 1),
(54813, 26, 1, 13, 'new data after purge', 'PCA-0002-0008', 1, 1),
(54814, 26, 1, 5, 'new data after purge', 'PCA-0002-0009', 1, 1),
(54815, 26, 1, 6, 'new data after purge', 'PCA-0002-0010', 1, 1),
(54816, 26, 1, 7, 'new data after purge', 'PCA-0002-0011', 1, 1),
(54817, 26, 1, 8, 'new data after purge', 'PCA-0002-0012', 1, 1),
(54818, 26, 1, 9, 'new data after purge', 'PCA-0002-0013', 1, 1),
(54819, 26, 1, 10, 'new data after purge', 'PCA-0002-0014', 1, 1),
(54820, 26, 1, 11, 'new data after purge', 'PCA-0002-0015', 1, 1),
(54821, 26, 1, 13, 'new data after purge', 'PCA-0002-0016', 1, 1),
(54822, 26, 1, 5, 'new data after purge', 'PCA-0002-0017', 1, 1),
(54823, 26, 1, 6, 'new data after purge', 'PCA-0002-0018', 1, 1),
(54824, 26, 1, 7, 'new data after purge', 'PCA-0002-0019', 1, 1),
(54825, 26, 1, 8, 'new data after purge', 'PCA-0002-0020', 1, 1),
(54826, 26, 1, 9, 'new data after purge', 'PCA-0002-0021', 1, 1),
(54827, 26, 1, 10, 'new data after purge', 'PCA-0002-0022', 1, 1),
(54828, 26, 1, 11, 'new data after purge', 'PCA-0002-0023', 1, 1),
(54829, 26, 1, 13, 'new data after purge', 'PCA-0002-0024', 1, 1),
(54830, 26, 1, 5, 'new data after purge', 'PCA-0002-0025', 1, 1),
(54831, 26, 1, 6, 'new data after purge', 'PCA-0002-0026', 1, 1),
(54832, 26, 1, 7, 'new data after purge', 'PCA-0002-0027', 1, 1),
(54833, 26, 1, 8, 'new data after purge', 'PCA-0002-0028', 1, 1),
(54834, 26, 1, 9, 'new data after purge', 'PCA-0002-0029', 1, 1),
(54835, 26, 1, 10, 'new data after purge', 'PCA-0002-0030', 1, 1),
(54836, 26, 1, 11, 'new data after purge', 'PCA-0002-0031', 1, 1),
(54837, 26, 1, 13, 'new data after purge', 'PCA-0002-0032', 1, 1),
(54838, 26, 1, 5, 'new data after purge', 'PCA-0002-0033', 1, 1),
(54839, 26, 1, 6, 'new data after purge', 'PCA-0002-0034', 1, 1),
(54840, 26, 1, 7, 'new data after purge', 'PCA-0002-0035', 1, 1),
(54841, 26, 1, 8, 'new data after purge', 'PCA-0002-0036', 1, 1),
(54842, 26, 1, 9, 'new data after purge', 'PCA-0002-0037', 1, 1),
(54843, 26, 1, 10, 'new data after purge', 'PCA-0002-0038', 1, 1),
(54844, 26, 1, 11, 'new data after purge', 'PCA-0002-0039', 1, 1),
(54845, 26, 1, 13, 'new data after purge', 'PCA-0002-0040', 1, 1),
(54846, 26, 1, 5, 'new data after purge', 'PCA-0002-0041', 1, 1),
(54847, 26, 1, 6, 'new data after purge', 'PCA-0002-0042', 1, 1),
(54848, 26, 1, 7, 'new data after purge', 'PCA-0002-0043', 1, 1),
(54849, 26, 1, 8, 'new data after purge', 'PCA-0002-0044', 1, 1),
(54850, 26, 1, 9, 'new data after purge', 'PCA-0002-0045', 1, 1),
(54851, 26, 1, 10, 'new data after purge', 'PCA-0002-0046', 1, 1),
(54852, 26, 1, 11, 'new data after purge', 'PCA-0002-0047', 1, 1),
(54853, 26, 1, 13, 'new data after purge', 'PCA-0002-0048', 1, 1),
(54854, 26, 1, 5, 'new data after purge', 'PCA-0002-0049', 1, 1),
(54855, 26, 1, 6, 'new data after purge', 'PCA-0002-0050', 1, 1),
(54856, 26, 1, 7, 'new data after purge', 'PCA-0002-0051', 1, 1),
(54857, 26, 1, 8, 'new data after purge', 'PCA-0002-0052', 1, 1),
(54858, 26, 1, 9, 'new data after purge', 'PCA-0002-0053', 1, 1),
(54859, 26, 1, 10, 'new data after purge', 'PCA-0002-0054', 1, 1),
(54860, 26, 1, 11, 'new data after purge', 'PCA-0002-0055', 1, 1),
(54861, 26, 1, 13, 'new data after purge', 'PCA-0002-0056', 1, 1),
(54862, 26, 1, 5, 'new data after purge', 'PCA-0002-0057', 1, 1),
(54863, 26, 1, 6, 'new data after purge', 'PCA-0002-0058', 1, 1),
(54864, 26, 1, 7, 'new data after purge', 'PCA-0002-0059', 1, 1),
(54865, 26, 1, 8, 'new data after purge', 'PCA-0002-0060', 1, 1),
(54866, 26, 1, 9, 'new data after purge', 'PCA-0002-0061', 1, 1),
(54867, 26, 1, 10, 'new data after purge', 'PCA-0002-0062', 1, 1),
(54868, 26, 1, 11, 'new data after purge', 'PCA-0002-0063', 1, 1),
(54869, 26, 1, 13, 'new data after purge', 'PCA-0002-0064', 1, 1),
(54870, 27, 1, 5, 'new data after purge', 'VDA-0004-0001', 1, 1),
(54871, 27, 1, 6, 'new data after purge', 'VDA-0004-0002', 1, 1),
(54872, 27, 2, 7, 'new data after purge', 'VDA-0004-0003', 1, 1),
(54873, 27, 1, 8, 'new data after purge', 'VDA-0004-0004', 1, 1),
(54874, 27, 1, 9, 'new data after purge', 'VDA-0004-0005', 1, 1),
(54875, 27, 1, 10, 'new data after purge', 'VDA-0004-0006', 1, 1),
(54876, 27, 1, 11, 'new data after purge', 'VDA-0004-0007', 1, 1),
(54877, 27, 1, 13, 'new data after purge', 'VDA-0004-0008', 1, 1),
(54878, 27, 1, 5, 'new data after purge', 'VDA-0004-0009', 1, 1),
(54879, 27, 1, 6, 'new data after purge', 'VDA-0004-0010', 1, 1),
(54880, 27, 1, 7, 'new data after purge', 'VDA-0004-0011', 1, 1),
(54881, 27, 1, 8, 'new data after purge', 'VDA-0004-0012', 1, 1),
(54882, 27, 1, 9, 'new data after purge', 'VDA-0004-0013', 1, 1),
(54883, 27, 1, 10, 'new data after purge', 'VDA-0004-0014', 1, 1),
(54884, 27, 1, 11, 'new data after purge', 'VDA-0004-0015', 1, 1),
(54885, 27, 1, 13, 'new data after purge', 'VDA-0004-0016', 1, 1),
(54886, 27, 1, 5, 'new data after purge', 'VDA-0004-0017', 1, 1),
(54887, 27, 1, 6, 'new data after purge', 'VDA-0004-0018', 1, 1),
(54888, 27, 1, 7, 'new data after purge', 'VDA-0004-0019', 1, 1),
(54889, 27, 1, 8, 'new data after purge', 'VDA-0004-0020', 1, 1),
(54890, 27, 1, 9, 'new data after purge', 'VDA-0004-0021', 1, 1),
(54891, 27, 1, 10, 'new data after purge', 'VDA-0004-0022', 1, 1),
(54892, 27, 1, 11, 'new data after purge', 'VDA-0004-0023', 1, 1),
(54893, 27, 1, 13, 'new data after purge', 'VDA-0004-0024', 1, 1),
(54894, 27, 1, 5, 'new data after purge', 'VDA-0004-0025', 1, 1),
(54895, 27, 1, 6, 'new data after purge', 'VDA-0004-0026', 1, 1),
(54896, 27, 1, 7, 'new data after purge', 'VDA-0004-0027', 1, 1),
(54897, 27, 1, 8, 'new data after purge', 'VDA-0004-0028', 1, 1),
(54898, 27, 1, 9, 'new data after purge', 'VDA-0004-0029', 1, 1),
(54899, 27, 1, 10, 'new data after purge', 'VDA-0004-0030', 1, 1),
(54900, 27, 1, 11, 'new data after purge', 'VDA-0004-0031', 1, 1),
(54901, 27, 1, 13, 'new data after purge', 'VDA-0004-0032', 1, 1),
(54902, 27, 1, 5, 'new data after purge', 'VDA-0004-0033', 1, 1),
(54903, 27, 1, 6, 'new data after purge', 'VDA-0004-0034', 1, 1),
(54904, 27, 1, 7, 'new data after purge', 'VDA-0004-0035', 1, 1),
(54905, 27, 1, 8, 'new data after purge', 'VDA-0004-0036', 1, 1),
(54906, 27, 1, 9, 'new data after purge', 'VDA-0004-0037', 1, 1),
(54907, 27, 1, 10, 'new data after purge', 'VDA-0004-0038', 1, 1),
(54908, 27, 1, 11, 'new data after purge', 'VDA-0004-0039', 1, 1),
(54909, 27, 1, 13, 'new data after purge', 'VDA-0004-0040', 1, 1),
(54910, 27, 1, 5, 'new data after purge', 'VDA-0004-0041', 1, 1),
(54911, 27, 1, 6, 'new data after purge', 'VDA-0004-0042', 1, 1),
(54912, 27, 1, 7, 'new data after purge', 'VDA-0004-0043', 1, 1),
(54913, 27, 1, 8, 'new data after purge', 'VDA-0004-0044', 1, 1),
(54914, 27, 1, 9, 'new data after purge', 'VDA-0004-0045', 1, 1),
(54915, 27, 1, 10, 'new data after purge', 'VDA-0004-0046', 1, 1),
(54916, 27, 1, 11, 'new data after purge', 'VDA-0004-0047', 1, 1),
(54917, 27, 1, 13, 'new data after purge', 'VDA-0004-0048', 1, 1),
(54918, 27, 1, 5, 'new data after purge', 'VDA-0004-0049', 1, 1),
(54919, 27, 1, 6, 'new data after purge', 'VDA-0004-0050', 1, 1),
(54920, 27, 1, 7, 'new data after purge', 'VDA-0004-0051', 1, 1),
(54921, 27, 1, 8, 'new data after purge', 'VDA-0004-0052', 1, 1),
(54922, 27, 1, 9, 'new data after purge', 'VDA-0004-0053', 1, 1),
(54923, 27, 1, 10, 'new data after purge', 'VDA-0004-0054', 1, 1),
(54924, 27, 1, 11, 'new data after purge', 'VDA-0004-0055', 1, 1),
(54925, 27, 1, 13, 'new data after purge', 'VDA-0004-0056', 1, 1),
(54926, 27, 1, 5, 'new data after purge', 'VDA-0004-0057', 1, 1),
(54927, 27, 1, 6, 'new data after purge', 'VDA-0004-0058', 1, 1),
(54928, 27, 1, 7, 'new data after purge', 'VDA-0004-0059', 1, 1),
(54929, 27, 1, 8, 'new data after purge', 'VDA-0004-0060', 1, 1),
(54930, 27, 1, 9, 'new data after purge', 'VDA-0004-0061', 1, 1),
(54931, 27, 1, 10, 'new data after purge', 'VDA-0004-0062', 1, 1),
(54932, 27, 1, 11, 'new data after purge', 'VDA-0004-0063', 1, 1),
(54933, 27, 1, 13, 'new data after purge', 'VDA-0004-0064', 1, 1),
(54934, 28, 1, 5, 'new data after purge', 'TCA-0001-0001', 1, 1),
(54935, 28, 1, 6, 'new data after purge', 'TCA-0001-0002', 1, 1),
(54936, 28, 1, 7, 'new data after purge', 'TCA-0001-0003', 1, 1),
(54937, 28, 1, 8, 'new data after purge', 'TCA-0001-0004', 1, 1),
(54938, 28, 1, 9, 'new data after purge', 'TCA-0001-0005', 1, 1),
(54939, 28, 1, 10, 'new data after purge', 'TCA-0001-0006', 1, 1),
(54940, 28, 1, 11, 'new data after purge', 'TCA-0001-0007', 1, 1),
(54941, 28, 1, 13, 'new data after purge', 'TCA-0001-0008', 1, 1),
(54942, 28, 1, 5, 'new data after purge', 'TCA-0001-0009', 1, 1),
(54943, 28, 1, 6, 'new data after purge', 'TCA-0001-0010', 1, 1),
(54944, 28, 1, 7, 'new data after purge', 'TCA-0001-0011', 1, 1),
(54945, 28, 1, 8, 'new data after purge', 'TCA-0001-0012', 1, 1),
(54946, 28, 1, 9, 'new data after purge', 'TCA-0001-0013', 1, 1),
(54947, 28, 1, 10, 'new data after purge', 'TCA-0001-0014', 1, 1),
(54948, 28, 1, 11, 'new data after purge', 'TCA-0001-0015', 1, 1),
(54949, 28, 1, 13, 'new data after purge', 'TCA-0001-0016', 1, 1),
(54950, 28, 1, 5, 'new data after purge', 'TCA-0001-0017', 1, 1),
(54951, 28, 1, 6, 'new data after purge', 'TCA-0001-0018', 1, 1),
(54952, 28, 1, 7, 'new data after purge', 'TCA-0001-0019', 1, 1),
(54953, 28, 1, 8, 'new data after purge', 'TCA-0001-0020', 1, 1),
(54954, 28, 1, 9, 'new data after purge', 'TCA-0001-0021', 1, 1),
(54955, 28, 1, 10, 'new data after purge', 'TCA-0001-0022', 1, 1),
(54956, 28, 1, 11, 'new data after purge', 'TCA-0001-0023', 1, 1),
(54957, 28, 1, 13, 'new data after purge', 'TCA-0001-0024', 1, 1),
(54958, 28, 2, 5, 'new data after purge', 'TCA-0001-0025', 1, 1),
(54959, 28, 1, 6, 'new data after purge', 'TCA-0001-0026', 1, 1),
(54960, 28, 1, 7, 'new data after purge', 'TCA-0001-0027', 1, 1),
(54961, 28, 1, 8, 'new data after purge', 'TCA-0001-0028', 1, 1),
(54962, 28, 1, 9, 'new data after purge', 'TCA-0001-0029', 1, 1),
(54963, 28, 1, 10, 'new data after purge', 'TCA-0001-0030', 1, 1),
(54964, 28, 1, 11, 'new data after purge', 'TCA-0001-0031', 1, 1),
(54965, 28, 1, 13, 'new data after purge', 'TCA-0001-0032', 1, 1),
(54966, 28, 1, 5, 'new data after purge', 'TCA-0001-0033', 1, 1),
(54967, 28, 1, 6, 'new data after purge', 'TCA-0001-0034', 1, 1),
(54968, 28, 1, 7, 'new data after purge', 'TCA-0001-0035', 1, 1),
(54969, 28, 1, 8, 'new data after purge', 'TCA-0001-0036', 1, 1),
(54970, 28, 1, 9, 'new data after purge', 'TCA-0001-0037', 1, 1),
(54971, 28, 1, 10, 'new data after purge', 'TCA-0001-0038', 1, 1),
(54972, 28, 1, 11, 'new data after purge', 'TCA-0001-0039', 1, 1),
(54973, 28, 1, 13, 'new data after purge', 'TCA-0001-0040', 1, 1),
(54974, 28, 1, 5, 'new data after purge', 'TCA-0001-0041', 1, 1),
(54975, 28, 1, 6, 'new data after purge', 'TCA-0001-0042', 1, 1),
(54976, 28, 1, 7, 'new data after purge', 'TCA-0001-0043', 1, 1),
(54977, 28, 1, 8, 'new data after purge', 'TCA-0001-0044', 1, 1),
(54978, 28, 1, 9, 'new data after purge', 'TCA-0001-0045', 1, 1),
(54979, 28, 1, 10, 'new data after purge', 'TCA-0001-0046', 1, 1),
(54980, 28, 1, 11, 'new data after purge', 'TCA-0001-0047', 1, 1),
(54981, 28, 1, 13, 'new data after purge', 'TCA-0001-0048', 1, 1),
(54982, 28, 1, 5, 'new data after purge', 'TCA-0001-0049', 1, 1),
(54983, 28, 1, 6, 'new data after purge', 'TCA-0001-0050', 1, 1),
(54984, 28, 1, 7, 'new data after purge', 'TCA-0001-0051', 1, 1),
(54985, 28, 1, 8, 'new data after purge', 'TCA-0001-0052', 1, 1),
(54986, 28, 1, 9, 'new data after purge', 'TCA-0001-0053', 1, 1),
(54987, 28, 1, 10, 'new data after purge', 'TCA-0001-0054', 1, 1),
(54988, 28, 1, 11, 'new data after purge', 'TCA-0001-0055', 1, 1),
(54989, 28, 1, 13, 'new data after purge', 'TCA-0001-0056', 1, 1),
(54990, 28, 1, 5, 'new data after purge', 'TCA-0001-0057', 1, 1),
(54991, 28, 1, 6, 'new data after purge', 'TCA-0001-0058', 1, 1),
(54992, 28, 1, 7, 'new data after purge', 'TCA-0001-0059', 1, 1),
(54993, 28, 1, 8, 'new data after purge', 'TCA-0001-0060', 1, 1),
(54994, 28, 1, 9, 'new data after purge', 'TCA-0001-0061', 1, 1),
(54995, 28, 1, 10, 'new data after purge', 'TCA-0001-0062', 1, 1),
(54996, 28, 1, 11, 'new data after purge', 'TCA-0001-0063', 1, 1),
(54997, 28, 1, 13, 'new data after purge', 'TCA-0001-0064', 1, 1),
(54998, 18, 1, 5, 'new data after purge', 'VDA-0003-0065', 1, 1),
(54999, 18, 1, 6, 'new data after purge', 'VDA-0003-0066', 1, 1),
(55000, 18, 1, 7, 'new data after purge', 'VDA-0003-0067', 1, 1),
(55001, 18, 1, 8, 'new data after purge', 'VDA-0003-0068', 1, 1),
(55002, 18, 1, 9, 'new data after purge', 'VDA-0003-0069', 1, 1),
(55003, 18, 1, 10, 'new data after purge', 'VDA-0003-0070', 1, 1),
(55004, 18, 1, 11, 'new data after purge', 'VDA-0003-0071', 1, 1),
(55005, 18, 1, 13, 'new data after purge', 'VDA-0003-0072', 1, 1),
(55006, 18, 1, 5, 'new data after purge', 'VDA-0003-0073', 1, 1),
(55007, 18, 1, 6, 'new data after purge', 'VDA-0003-0074', 1, 1),
(55008, 18, 1, 7, 'new data after purge', 'VDA-0003-0075', 1, 1),
(55009, 18, 1, 8, 'new data after purge', 'VDA-0003-0076', 1, 1),
(55010, 18, 1, 9, 'new data after purge', 'VDA-0003-0077', 1, 1),
(55011, 18, 1, 10, 'new data after purge', 'VDA-0003-0078', 1, 1),
(55012, 18, 1, 11, 'new data after purge', 'VDA-0003-0079', 1, 1),
(55013, 18, 1, 13, 'new data after purge', 'VDA-0003-0080', 1, 1),
(55014, 18, 1, 5, 'new data after purge', 'VDA-0003-0081', 1, 1),
(55015, 18, 1, 6, 'new data after purge', 'VDA-0003-0082', 1, 1),
(55016, 18, 1, 7, 'new data after purge', 'VDA-0003-0083', 1, 1),
(55017, 18, 1, 8, 'new data after purge', 'VDA-0003-0084', 1, 1),
(55018, 18, 1, 9, 'new data after purge', 'VDA-0003-0085', 1, 1),
(55019, 18, 1, 10, 'new data after purge', 'VDA-0003-0086', 1, 1),
(55020, 18, 1, 11, 'new data after purge', 'VDA-0003-0087', 1, 1),
(55021, 18, 1, 13, 'new data after purge', 'VDA-0003-0088', 1, 1),
(55022, 18, 1, 5, 'new data after purge', 'VDA-0003-0089', 1, 1),
(55023, 18, 1, 6, 'new data after purge', 'VDA-0003-0090', 1, 1),
(55024, 18, 1, 7, 'new data after purge', 'VDA-0003-0091', 1, 1),
(55025, 18, 1, 8, 'new data after purge', 'VDA-0003-0092', 1, 1),
(55026, 18, 1, 9, 'new data after purge', 'VDA-0003-0093', 1, 1),
(55027, 18, 1, 10, 'new data after purge', 'VDA-0003-0094', 1, 1),
(55028, 18, 1, 11, 'new data after purge', 'VDA-0003-0095', 1, 1),
(55029, 18, 1, 13, 'new data after purge', 'VDA-0003-0096', 1, 1),
(55030, 18, 1, 5, 'new data after purge', 'VDA-0003-0097', 1, 1),
(55031, 18, 1, 6, 'new data after purge', 'VDA-0003-0098', 1, 1),
(55032, 18, 1, 7, 'new data after purge', 'VDA-0003-0099', 1, 1),
(55033, 18, 1, 8, 'new data after purge', 'VDA-0003-0100', 1, 1),
(55034, 18, 1, 9, 'new data after purge', 'VDA-0003-0101', 1, 1),
(55035, 18, 1, 10, 'new data after purge', 'VDA-0003-0102', 1, 1),
(55036, 18, 1, 11, 'new data after purge', 'VDA-0003-0103', 1, 1),
(55037, 18, 1, 13, 'new data after purge', 'VDA-0003-0104', 1, 1),
(55038, 18, 1, 5, 'new data after purge', 'VDA-0003-0105', 1, 1),
(55039, 18, 1, 6, 'new data after purge', 'VDA-0003-0106', 1, 1),
(55040, 18, 1, 7, 'new data after purge', 'VDA-0003-0107', 1, 1),
(55041, 18, 1, 8, 'new data after purge', 'VDA-0003-0108', 1, 1),
(55042, 18, 1, 9, 'new data after purge', 'VDA-0003-0109', 1, 1),
(55043, 18, 1, 10, 'new data after purge', 'VDA-0003-0110', 1, 1),
(55044, 18, 1, 11, 'new data after purge', 'VDA-0003-0111', 1, 1),
(55045, 18, 1, 13, 'new data after purge', 'VDA-0003-0112', 1, 1),
(55046, 18, 1, 5, 'new data after purge', 'VDA-0003-0113', 1, 1),
(55047, 18, 1, 6, 'new data after purge', 'VDA-0003-0114', 1, 1),
(55048, 18, 1, 7, 'new data after purge', 'VDA-0003-0115', 1, 1),
(55049, 18, 1, 8, 'new data after purge', 'VDA-0003-0116', 1, 1),
(55050, 18, 1, 9, 'new data after purge', 'VDA-0003-0117', 1, 1),
(55051, 18, 1, 10, 'new data after purge', 'VDA-0003-0118', 1, 1),
(55052, 18, 1, 11, 'new data after purge', 'VDA-0003-0119', 1, 1),
(55053, 18, 1, 13, 'new data after purge', 'VDA-0003-0120', 1, 1),
(55054, 18, 1, 5, 'new data after purge', 'VDA-0003-0121', 1, 1),
(55055, 18, 1, 6, 'new data after purge', 'VDA-0003-0122', 1, 1),
(55056, 18, 1, 7, 'new data after purge', 'VDA-0003-0123', 1, 1),
(55057, 18, 1, 8, 'new data after purge', 'VDA-0003-0124', 1, 1),
(55058, 18, 1, 9, 'new data after purge', 'VDA-0003-0125', 1, 1),
(55059, 18, 1, 10, 'new data after purge', 'VDA-0003-0126', 1, 1),
(55060, 18, 1, 11, 'new data after purge', 'VDA-0003-0127', 1, 1),
(55061, 18, 1, 13, 'new data after purge', 'VDA-0003-0128', 1, 1),
(55062, 29, 1, 5, 'new data after purge', 'TCA-0002-0001', 1, 1),
(55063, 29, 1, 6, 'new data after purge', 'TCA-0002-0002', 1, 1),
(55064, 29, 1, 7, 'new data after purge', 'TCA-0002-0003', 1, 1),
(55065, 29, 1, 8, 'new data after purge', 'TCA-0002-0004', 1, 1),
(55066, 29, 1, 9, 'new data after purge', 'TCA-0002-0005', 1, 1),
(55067, 29, 1, 10, 'new data after purge', 'TCA-0002-0006', 1, 1),
(55068, 29, 1, 11, 'new data after purge', 'TCA-0002-0007', 1, 1);
INSERT INTO `item_unit` (`id_unit`, `id_item`, `status`, `id_wh`, `comment`, `serial_number`, `condition`, `updated_by`) VALUES
(55069, 29, 1, 13, 'new data after purge', 'TCA-0002-0008', 1, 1),
(55070, 29, 1, 5, 'new data after purge', 'TCA-0002-0009', 1, 1),
(55071, 29, 1, 6, 'new data after purge', 'TCA-0002-0010', 1, 1),
(55072, 29, 1, 7, 'new data after purge', 'TCA-0002-0011', 1, 1),
(55073, 29, 1, 8, 'new data after purge', 'TCA-0002-0012', 1, 1),
(55074, 29, 1, 9, 'new data after purge', 'TCA-0002-0013', 1, 1),
(55075, 29, 1, 10, 'new data after purge', 'TCA-0002-0014', 1, 1),
(55076, 29, 1, 11, 'new data after purge', 'TCA-0002-0015', 1, 1),
(55077, 29, 1, 13, 'new data after purge', 'TCA-0002-0016', 1, 1),
(55078, 29, 1, 5, 'new data after purge', 'TCA-0002-0017', 1, 1),
(55079, 29, 1, 6, 'new data after purge', 'TCA-0002-0018', 1, 1),
(55080, 29, 1, 7, 'new data after purge', 'TCA-0002-0019', 1, 1),
(55081, 29, 1, 8, 'new data after purge', 'TCA-0002-0020', 1, 1),
(55082, 29, 1, 9, 'new data after purge', 'TCA-0002-0021', 1, 1),
(55083, 29, 1, 10, 'new data after purge', 'TCA-0002-0022', 1, 1),
(55084, 29, 1, 11, 'new data after purge', 'TCA-0002-0023', 1, 1),
(55085, 29, 1, 13, 'new data after purge', 'TCA-0002-0024', 1, 1),
(55086, 29, 1, 5, 'new data after purge', 'TCA-0002-0025', 1, 1),
(55087, 29, 1, 6, 'new data after purge', 'TCA-0002-0026', 1, 1),
(55088, 29, 1, 7, 'new data after purge', 'TCA-0002-0027', 1, 1),
(55089, 29, 1, 8, 'new data after purge', 'TCA-0002-0028', 1, 1),
(55090, 29, 1, 9, 'new data after purge', 'TCA-0002-0029', 1, 1),
(55091, 29, 1, 10, 'new data after purge', 'TCA-0002-0030', 1, 1),
(55092, 29, 1, 11, 'new data after purge', 'TCA-0002-0031', 1, 1),
(55093, 29, 1, 13, 'new data after purge', 'TCA-0002-0032', 1, 1),
(55094, 29, 1, 5, 'new data after purge', 'TCA-0002-0033', 1, 1),
(55095, 29, 1, 6, 'new data after purge', 'TCA-0002-0034', 1, 1),
(55096, 29, 1, 7, 'new data after purge', 'TCA-0002-0035', 1, 1),
(55097, 29, 1, 8, 'new data after purge', 'TCA-0002-0036', 1, 1),
(55098, 29, 1, 9, 'new data after purge', 'TCA-0002-0037', 1, 1),
(55099, 29, 1, 10, 'new data after purge', 'TCA-0002-0038', 1, 1),
(55100, 29, 1, 11, 'new data after purge', 'TCA-0002-0039', 1, 1),
(55101, 29, 1, 13, 'new data after purge', 'TCA-0002-0040', 1, 1),
(55102, 29, 1, 5, 'new data after purge', 'TCA-0002-0041', 1, 1),
(55103, 29, 1, 6, 'new data after purge', 'TCA-0002-0042', 1, 1),
(55104, 29, 1, 7, 'new data after purge', 'TCA-0002-0043', 1, 1),
(55105, 29, 1, 8, 'new data after purge', 'TCA-0002-0044', 1, 1),
(55106, 29, 1, 9, 'new data after purge', 'TCA-0002-0045', 1, 1),
(55107, 29, 1, 10, 'new data after purge', 'TCA-0002-0046', 1, 1),
(55108, 29, 1, 11, 'new data after purge', 'TCA-0002-0047', 1, 1),
(55109, 29, 1, 13, 'new data after purge', 'TCA-0002-0048', 1, 1),
(55110, 29, 1, 5, 'new data after purge', 'TCA-0002-0049', 1, 1),
(55111, 29, 1, 6, 'new data after purge', 'TCA-0002-0050', 1, 1),
(55112, 29, 1, 7, 'new data after purge', 'TCA-0002-0051', 1, 1),
(55113, 29, 1, 8, 'new data after purge', 'TCA-0002-0052', 1, 1),
(55114, 29, 1, 9, 'new data after purge', 'TCA-0002-0053', 1, 1),
(55115, 29, 1, 10, 'new data after purge', 'TCA-0002-0054', 1, 1),
(55116, 29, 1, 11, 'new data after purge', 'TCA-0002-0055', 1, 1),
(55117, 29, 1, 13, 'new data after purge', 'TCA-0002-0056', 1, 1),
(55118, 29, 1, 5, 'new data after purge', 'TCA-0002-0057', 1, 1),
(55119, 29, 1, 6, 'new data after purge', 'TCA-0002-0058', 1, 1),
(55120, 29, 1, 7, 'new data after purge', 'TCA-0002-0059', 1, 1),
(55121, 29, 1, 8, 'new data after purge', 'TCA-0002-0060', 1, 1),
(55122, 29, 1, 9, 'new data after purge', 'TCA-0002-0061', 1, 1),
(55123, 29, 1, 10, 'new data after purge', 'TCA-0002-0062', 1, 1),
(55124, 29, 1, 11, 'new data after purge', 'TCA-0002-0063', 1, 1),
(55125, 29, 1, 13, 'new data after purge', 'TCA-0002-0064', 1, 1),
(55126, 30, 1, 5, 'new data after purge', 'TCA-0003-0001', 1, 1),
(55127, 30, 1, 6, 'new data after purge', 'TCA-0003-0002', 1, 1),
(55128, 30, 1, 7, 'new data after purge', 'TCA-0003-0003', 1, 1),
(55129, 30, 1, 8, 'new data after purge', 'TCA-0003-0004', 1, 1),
(55130, 30, 1, 9, 'new data after purge', 'TCA-0003-0005', 1, 1),
(55131, 30, 1, 10, 'new data after purge', 'TCA-0003-0006', 1, 1),
(55132, 30, 1, 11, 'new data after purge', 'TCA-0003-0007', 1, 1),
(55133, 30, 1, 13, 'new data after purge', 'TCA-0003-0008', 1, 1),
(55134, 30, 1, 5, 'new data after purge', 'TCA-0003-0009', 1, 1),
(55135, 30, 1, 6, 'new data after purge', 'TCA-0003-0010', 1, 1),
(55136, 30, 1, 7, 'new data after purge', 'TCA-0003-0011', 1, 1),
(55137, 30, 1, 8, 'new data after purge', 'TCA-0003-0012', 1, 1),
(55138, 30, 1, 9, 'new data after purge', 'TCA-0003-0013', 1, 1),
(55139, 30, 1, 10, 'new data after purge', 'TCA-0003-0014', 1, 1),
(55140, 30, 1, 11, 'new data after purge', 'TCA-0003-0015', 1, 1),
(55141, 30, 1, 13, 'new data after purge', 'TCA-0003-0016', 1, 1),
(55142, 30, 1, 5, 'new data after purge', 'TCA-0003-0017', 1, 1),
(55143, 30, 1, 6, 'new data after purge', 'TCA-0003-0018', 1, 1),
(55144, 30, 1, 7, 'new data after purge', 'TCA-0003-0019', 1, 1),
(55145, 30, 1, 8, 'new data after purge', 'TCA-0003-0020', 1, 1),
(55146, 30, 1, 9, 'new data after purge', 'TCA-0003-0021', 1, 1),
(55147, 30, 1, 10, 'new data after purge', 'TCA-0003-0022', 1, 1),
(55148, 30, 1, 11, 'new data after purge', 'TCA-0003-0023', 1, 1),
(55149, 30, 1, 13, 'new data after purge', 'TCA-0003-0024', 1, 1),
(55150, 30, 1, 5, 'new data after purge', 'TCA-0003-0025', 1, 1),
(55151, 30, 1, 6, 'new data after purge', 'TCA-0003-0026', 1, 1),
(55152, 30, 1, 7, 'new data after purge', 'TCA-0003-0027', 1, 1),
(55153, 30, 1, 8, 'new data after purge', 'TCA-0003-0028', 1, 1),
(55154, 30, 1, 9, 'new data after purge', 'TCA-0003-0029', 1, 1),
(55155, 30, 1, 10, 'new data after purge', 'TCA-0003-0030', 1, 1),
(55156, 30, 1, 11, 'new data after purge', 'TCA-0003-0031', 1, 1),
(55157, 30, 1, 13, 'new data after purge', 'TCA-0003-0032', 1, 1),
(55158, 30, 1, 5, 'new data after purge', 'TCA-0003-0033', 1, 1),
(55159, 30, 1, 6, 'new data after purge', 'TCA-0003-0034', 1, 1),
(55160, 30, 1, 7, 'new data after purge', 'TCA-0003-0035', 1, 1),
(55161, 30, 1, 8, 'new data after purge', 'TCA-0003-0036', 1, 1),
(55162, 30, 1, 9, 'new data after purge', 'TCA-0003-0037', 1, 1),
(55163, 30, 1, 10, 'new data after purge', 'TCA-0003-0038', 1, 1),
(55164, 30, 1, 11, 'new data after purge', 'TCA-0003-0039', 1, 1),
(55165, 30, 1, 13, 'new data after purge', 'TCA-0003-0040', 1, 1),
(55166, 30, 1, 5, 'new data after purge', 'TCA-0003-0041', 1, 1),
(55167, 30, 1, 6, 'new data after purge', 'TCA-0003-0042', 1, 1),
(55168, 30, 1, 7, 'new data after purge', 'TCA-0003-0043', 1, 1),
(55169, 30, 1, 8, 'new data after purge', 'TCA-0003-0044', 1, 1),
(55170, 30, 1, 9, 'new data after purge', 'TCA-0003-0045', 1, 1),
(55171, 30, 1, 10, 'new data after purge', 'TCA-0003-0046', 1, 1),
(55172, 30, 1, 11, 'new data after purge', 'TCA-0003-0047', 1, 1),
(55173, 30, 1, 13, 'new data after purge', 'TCA-0003-0048', 1, 1),
(55174, 30, 1, 5, 'new data after purge', 'TCA-0003-0049', 1, 1),
(55175, 30, 1, 6, 'new data after purge', 'TCA-0003-0050', 1, 1),
(55176, 30, 1, 7, 'new data after purge', 'TCA-0003-0051', 1, 1),
(55177, 30, 1, 8, 'new data after purge', 'TCA-0003-0052', 1, 1),
(55178, 30, 1, 9, 'new data after purge', 'TCA-0003-0053', 1, 1),
(55179, 30, 1, 10, 'new data after purge', 'TCA-0003-0054', 1, 1),
(55180, 30, 1, 11, 'new data after purge', 'TCA-0003-0055', 1, 1),
(55181, 30, 1, 13, 'new data after purge', 'TCA-0003-0056', 1, 1),
(55182, 30, 1, 5, 'new data after purge', 'TCA-0003-0057', 1, 1),
(55183, 30, 1, 6, 'new data after purge', 'TCA-0003-0058', 1, 1),
(55184, 30, 1, 7, 'new data after purge', 'TCA-0003-0059', 1, 1),
(55185, 30, 1, 8, 'new data after purge', 'TCA-0003-0060', 1, 1),
(55186, 30, 1, 9, 'new data after purge', 'TCA-0003-0061', 1, 1),
(55187, 30, 1, 10, 'new data after purge', 'TCA-0003-0062', 1, 1),
(55188, 30, 1, 11, 'new data after purge', 'TCA-0003-0063', 1, 1),
(55189, 30, 1, 13, 'new data after purge', 'TCA-0003-0064', 1, 1),
(55190, 31, 1, 5, 'new data after purge', 'PUA-0001-0001', 1, 1),
(55191, 31, 1, 6, 'new data after purge', 'PUA-0001-0002', 1, 1),
(55192, 31, 2, 7, 'new data after purge', 'PUA-0001-0003', 1, 1),
(55193, 31, 1, 8, 'new data after purge', 'PUA-0001-0004', 1, 1),
(55194, 31, 1, 9, 'new data after purge', 'PUA-0001-0005', 1, 1),
(55195, 31, 1, 10, 'new data after purge', 'PUA-0001-0006', 1, 1),
(55196, 31, 1, 11, 'new data after purge', 'PUA-0001-0007', 1, 1),
(55197, 31, 1, 13, 'new data after purge', 'PUA-0001-0008', 1, 1),
(55198, 31, 1, 5, 'new data after purge', 'PUA-0001-0009', 1, 1),
(55199, 31, 1, 6, 'new data after purge', 'PUA-0001-0010', 1, 1),
(55200, 31, 1, 7, 'new data after purge', 'PUA-0001-0011', 1, 1),
(55201, 31, 1, 8, 'new data after purge', 'PUA-0001-0012', 1, 1),
(55202, 31, 1, 9, 'new data after purge', 'PUA-0001-0013', 1, 1),
(55203, 31, 1, 10, 'new data after purge', 'PUA-0001-0014', 1, 1),
(55204, 31, 1, 11, 'new data after purge', 'PUA-0001-0015', 1, 1),
(55205, 31, 1, 13, 'new data after purge', 'PUA-0001-0016', 1, 1),
(55206, 31, 1, 5, 'new data after purge', 'PUA-0001-0017', 1, 1),
(55207, 31, 1, 6, 'new data after purge', 'PUA-0001-0018', 1, 1),
(55208, 31, 1, 7, 'new data after purge', 'PUA-0001-0019', 1, 1),
(55209, 31, 1, 8, 'new data after purge', 'PUA-0001-0020', 1, 1),
(55210, 31, 1, 9, 'new data after purge', 'PUA-0001-0021', 1, 1),
(55211, 31, 1, 10, 'new data after purge', 'PUA-0001-0022', 1, 1),
(55212, 31, 1, 11, 'new data after purge', 'PUA-0001-0023', 1, 1),
(55213, 31, 1, 13, 'new data after purge', 'PUA-0001-0024', 1, 1),
(55214, 31, 1, 5, 'new data after purge', 'PUA-0001-0025', 1, 1),
(55215, 31, 1, 6, 'new data after purge', 'PUA-0001-0026', 1, 1),
(55216, 31, 1, 7, 'new data after purge', 'PUA-0001-0027', 1, 1),
(55217, 31, 1, 8, 'new data after purge', 'PUA-0001-0028', 1, 1),
(55218, 31, 1, 9, 'new data after purge', 'PUA-0001-0029', 1, 1),
(55219, 31, 1, 10, 'new data after purge', 'PUA-0001-0030', 1, 1),
(55220, 31, 1, 11, 'new data after purge', 'PUA-0001-0031', 1, 1),
(55221, 31, 1, 13, 'new data after purge', 'PUA-0001-0032', 1, 1),
(55222, 31, 1, 5, 'new data after purge', 'PUA-0001-0033', 1, 1),
(55223, 31, 1, 6, 'new data after purge', 'PUA-0001-0034', 1, 1),
(55224, 31, 1, 7, 'new data after purge', 'PUA-0001-0035', 1, 1),
(55225, 31, 1, 8, 'new data after purge', 'PUA-0001-0036', 1, 1),
(55226, 31, 1, 9, 'new data after purge', 'PUA-0001-0037', 1, 1),
(55227, 31, 1, 10, 'new data after purge', 'PUA-0001-0038', 1, 1),
(55228, 31, 1, 11, 'new data after purge', 'PUA-0001-0039', 1, 1),
(55229, 31, 1, 13, 'new data after purge', 'PUA-0001-0040', 1, 1),
(55230, 31, 1, 5, 'new data after purge', 'PUA-0001-0041', 1, 1),
(55231, 31, 1, 6, 'new data after purge', 'PUA-0001-0042', 1, 1),
(55232, 31, 1, 7, 'new data after purge', 'PUA-0001-0043', 1, 1),
(55233, 31, 1, 8, 'new data after purge', 'PUA-0001-0044', 1, 1),
(55234, 31, 1, 9, 'new data after purge', 'PUA-0001-0045', 1, 1),
(55235, 31, 1, 10, 'new data after purge', 'PUA-0001-0046', 1, 1),
(55236, 31, 1, 11, 'new data after purge', 'PUA-0001-0047', 1, 1),
(55237, 31, 1, 13, 'new data after purge', 'PUA-0001-0048', 1, 1),
(55238, 31, 1, 5, 'new data after purge', 'PUA-0001-0049', 1, 1),
(55239, 31, 1, 6, 'new data after purge', 'PUA-0001-0050', 1, 1),
(55240, 31, 1, 7, 'new data after purge', 'PUA-0001-0051', 1, 1),
(55241, 31, 1, 8, 'new data after purge', 'PUA-0001-0052', 1, 1),
(55242, 31, 1, 9, 'new data after purge', 'PUA-0001-0053', 1, 1),
(55243, 31, 1, 10, 'new data after purge', 'PUA-0001-0054', 1, 1),
(55244, 31, 1, 11, 'new data after purge', 'PUA-0001-0055', 1, 1),
(55245, 31, 1, 13, 'new data after purge', 'PUA-0001-0056', 1, 1),
(55246, 31, 1, 5, 'new data after purge', 'PUA-0001-0057', 1, 1),
(55247, 31, 1, 6, 'new data after purge', 'PUA-0001-0058', 1, 1),
(55248, 31, 1, 7, 'new data after purge', 'PUA-0001-0059', 1, 1),
(55249, 31, 1, 8, 'new data after purge', 'PUA-0001-0060', 1, 1),
(55250, 31, 1, 9, 'new data after purge', 'PUA-0001-0061', 1, 1),
(55251, 31, 1, 10, 'new data after purge', 'PUA-0001-0062', 1, 1),
(55252, 31, 1, 11, 'new data after purge', 'PUA-0001-0063', 1, 1),
(55253, 31, 1, 13, 'new data after purge', 'PUA-0001-0064', 1, 1),
(55254, 11, 1, 7, 'return test 22', 'PAA-0001-0065', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lending`
--

CREATE TABLE `lending` (
  `id_lending` int(10) UNSIGNED NOT NULL,
  `id_unit` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_employee` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `pic_loan` varchar(255) NOT NULL,
  `pic_return` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lending`
--

INSERT INTO `lending` (`id_lending`, `id_unit`, `user_id`, `id_employee`, `type`, `date`, `pic_loan`, `pic_return`) VALUES
(72, 54294, 1, 1, 2, '2024-11-21', '724_1732157149.jpeg', '646_1732157591.webp'),
(73, 54295, 1, 5, 2, '2024-11-25', '834_1732157159.jpg', '118_1732502792.jpeg'),
(74, 54358, 1, 8, 2, '2024-11-25', '449_1732157171.jpeg', '273_1732499769.jpeg'),
(75, 54359, 1, 3, 2, '2024-11-25', '355_1732157182.jpeg', '453_1732520173.jpeg'),
(76, 54422, 1, 4, 2, '2024-11-21', '717_1732157214.jpeg', '334_1732157606.gif'),
(77, 54614, 1, 3, 1, '2024-11-21', '693_1732157232.jpeg', ''),
(78, 54935, 1, 4, 2, '2024-11-25', '407_1732499642.gif', '790_1732499731.jpeg'),
(79, 54551, 1, 3, 1, '2024-11-25', '927_1732499699.gif', ''),
(80, 55192, 1, 5, 1, '2024-11-25', '403_1732516159.jpeg', ''),
(81, 54958, 1, 3, 1, '2024-11-25', '172_1732516176.jpeg', ''),
(82, 54872, 1, 1, 1, '2024-11-25', '630_1732516206.jpeg', ''),
(83, 54809, 1, 8, 1, '2024-11-25', '809_1732516215.jpeg', ''),
(84, 54745, 1, 4, 1, '2024-11-25', '463_1732516225.jpeg', ''),
(85, 54357, 1, 4, 1, '2024-11-25', '468_1732520114.jpeg', '');

-- --------------------------------------------------------

--
-- Table structure for table `lending_type_lookup`
--

CREATE TABLE `lending_type_lookup` (
  `id_type` tinyint(3) UNSIGNED NOT NULL,
  `type_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lending_type_lookup`
--

INSERT INTO `lending_type_lookup` (`id_type`, `type_name`) VALUES
(1, 'Item going out from warehouse '),
(2, 'Item returned to warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1729233876),
('m140608_173539_create_user_table', 1729233879),
('m140611_133903_init_rbac', 1729233879),
('m140808_073114_create_auth_item_group_table', 1729233880),
('m140809_072112_insert_superadmin_to_user', 1729233880),
('m140809_073114_insert_common_permisison_to_auth_item', 1729233880),
('m141023_141535_create_user_visit_log', 1729233880),
('m141116_115804_add_bind_to_ip_and_registration_ip_to_user', 1729233880),
('m141121_194858_split_browser_and_os_column', 1729233880),
('m141201_220516_add_email_and_email_confirmed_to_user', 1729233880),
('m141207_001649_create_basic_user_permissions', 1729233881);

-- --------------------------------------------------------

--
-- Table structure for table `repair_log`
--

CREATE TABLE `repair_log` (
  `id_repair` int(10) NOT NULL,
  `id_unit` int(10) NOT NULL,
  `comment` varchar(120) NOT NULL,
  `rep_type` tinyint(3) NOT NULL,
  `datetime` datetime(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repair_log`
--

INSERT INTO `repair_log` (`id_repair`, `id_unit`, `comment`, `rep_type`, `datetime`) VALUES
(1, 54294, 'PAA-0001-0001. rep test at repair shop 1', 1, '2024-11-21 09:54:11.00'),
(2, 54294, 'PAA-0001-0001. rep test at repair shop 1', 2, '2024-11-21 09:57:17.00'),
(3, 54294, 'PAA-0001-0001. rep test at repair shop 1', 1, '2024-11-21 14:45:11.00'),
(4, 54422, 'PCA-0001-0001. rep test', 1, '2024-11-25 09:48:07.00'),
(5, 54294, 'PAA-0001-0001. rep test at repair shop 1', 2, '2024-11-25 09:48:24.00'),
(6, 54294, 'PAA-0001-0001. audit', 1, '2024-11-25 14:42:16.00'),
(7, 54294, 'PAA-0001-0001. audit 2', 2, '2024-11-25 14:42:27.00'),
(8, 54422, 'PCA-0001-0001. audit', 2, '2024-11-25 14:42:35.00');

-- --------------------------------------------------------

--
-- Table structure for table `rep_type_lookup`
--

CREATE TABLE `rep_type_lookup` (
  `id_rep_t` tinyint(3) NOT NULL,
  `rep_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rep_type_lookup`
--

INSERT INTO `rep_type_lookup` (`id_rep_t`, `rep_type`) VALUES
(1, 'Repair on going'),
(2, 'Repair done. Repair Closed');

-- --------------------------------------------------------

--
-- Table structure for table `status_lookup`
--

CREATE TABLE `status_lookup` (
  `id_status` tinyint(3) UNSIGNED NOT NULL,
  `status_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status_lookup`
--

INSERT INTO `status_lookup` (`id_status`, `status_name`) VALUES
(1, 'Available in warehouse'),
(2, 'Borrowed/Lent'),
(3, 'In-repair'),
(4, 'Broken beyond repair or Lost');

-- --------------------------------------------------------

--
-- Table structure for table `unit_log`
--

CREATE TABLE `unit_log` (
  `id_log` int(11) NOT NULL,
  `id_unit` int(10) NOT NULL,
  `content` varchar(255) NOT NULL,
  `update_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_log`
--

INSERT INTO `unit_log` (`id_log`, `id_unit`, `content`, `update_at`) VALUES
(139, 54294, 'Unit PAA-0001-0001 lent to Johan by superadmin', '2024-11-21 09:45:49.000000'),
(140, 54295, 'Unit PAA-0001-0002 lent to Shiorin by superadmin', '2024-11-21 09:45:59.000000'),
(141, 54358, 'Unit PAA-0002-0001 lent to Manfred Albrecht Freiherr von Richthofen by superadmin', '2024-11-21 09:46:11.000000'),
(142, 54359, 'Unit PAA-0002-0002 lent to Oleg by superadmin', '2024-11-21 09:46:22.000000'),
(143, 54422, 'Unit PCA-0001-0001 lent to Freddy by superadmin', '2024-11-21 09:46:54.000000'),
(144, 54614, 'Unit VDA-0002-0001 lent to Oleg by superadmin', '2024-11-21 09:47:12.000000'),
(145, 54294, 'Unit PAA-0001-0001 returned by Johan, recieved by superadmin', '2024-11-21 09:53:11.000000'),
(146, 54422, 'Unit PCA-0001-0001 returned by Freddy, recieved by superadmin', '2024-11-21 09:53:26.000000'),
(147, 54294, 'Unit PAA-0001-0001 sent for repair by superadmin', '2024-11-21 09:54:11.000000'),
(148, 54294, 'Unit PAA-0001-0001 repaired. Taken to warehouse by superadmin', '2024-11-21 09:57:17.000000'),
(149, 54294, 'Unit PAA-0001-0001 sent for repair by bobtherepairman', '2024-11-21 14:45:11.000000'),
(150, 54296, 'Unit PAA-0001-0003 updated by superadmin', '2024-11-25 08:52:56.000000'),
(151, 54935, 'Unit TCA-0001-0002 lent to Freddy by superadmin', '2024-11-25 08:54:02.000000'),
(152, 54551, 'Unit VDA-0001-0002 lent to Oleg by superadmin', '2024-11-25 08:54:59.000000'),
(153, 54935, 'Unit TCA-0001-0002 returned by Freddy, recieved by superadmin', '2024-11-25 08:55:31.000000'),
(154, 54358, 'Unit PAA-0002-0001 returned by Manfred Albrecht Freiherr von Richthofen, recieved by superadmin', '2024-11-25 08:56:09.000000'),
(155, 54295, 'Unit PAA-0001-0002 returned by Shiorin, recieved by superadmin', '2024-11-25 09:46:32.000000'),
(156, 54422, 'Unit PCA-0001-0001 sent to repair by superadmin', '2024-11-25 09:48:07.000000'),
(157, 54294, 'Unit PAA-0001-0001 repaired. Taken to warehouse by superadmin', '2024-11-25 09:48:24.000000'),
(158, 55192, 'Unit PUA-0001-0003 lent to Shiorin by superadmin', '2024-11-25 13:29:19.000000'),
(159, 54958, 'Unit TCA-0001-0025 lent to Oleg by superadmin', '2024-11-25 13:29:36.000000'),
(160, 54872, 'Unit VDA-0004-0003 lent to Johan by superadmin', '2024-11-25 13:30:06.000000'),
(161, 54809, 'Unit PCA-0002-0004 lent to Manfred Albrecht Freiherr von Richthofen by superadmin', '2024-11-25 13:30:15.000000'),
(162, 54745, 'Unit PAA-0004-0004 lent to Freddy by superadmin', '2024-11-25 13:30:26.000000'),
(163, 54294, 'Unit PAA-0001-0001 updated by superadmin', '2024-11-25 14:29:09.000000'),
(164, 54294, 'Unit PAA-0001-0001 updated by superadmin', '2024-11-25 14:29:25.000000'),
(165, 55254, 'New unit PAA-0001-0065 added by superadmin', '2024-11-25 14:31:18.000000'),
(166, 54357, 'Unit PAA-0001-0064 lent to Freddy by superadmin', '2024-11-25 14:35:14.000000'),
(167, 54359, 'Unit PAA-0002-0002 returned by Oleg, recieved by superadmin', '2024-11-25 14:36:13.000000'),
(168, 54294, 'Unit PAA-0001-0001 sent to repair by superadmin', '2024-11-25 14:42:16.000000'),
(169, 54294, 'Unit PAA-0001-0001 repaired. Taken to warehouse by superadmin', '2024-11-25 14:42:27.000000'),
(170, 54422, 'Unit PCA-0001-0001 repaired. Taken to warehouse by superadmin', '2024-11-25 14:42:35.000000'),
(171, 54295, 'Unit PAA-0001-0002 updated by superadmin', '2024-11-25 14:43:31.000000');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `superadmin` smallint(6) DEFAULT 0,
  `created_at` datetime(2) NOT NULL,
  `updated_at` datetime(2) NOT NULL,
  `registration_ip` varchar(15) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `bind_to_ip` varchar(255) DEFAULT NULL,
  `email_confirmed` int(11) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `id_wh` int(10) UNSIGNED DEFAULT NULL,
  `user_lang` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password_hash`, `status`, `superadmin`, `created_at`, `updated_at`, `registration_ip`, `email`, `auth_key`, `bind_to_ip`, `email_confirmed`, `confirmation_token`, `id_wh`, `user_lang`) VALUES
(1, 'superadmin', '$2y$13$bp2w2.mTeJ/ORRVlEjA.jOHw0o49vwAJ.A15RTPjnSyk05M.20ZyS', 1, 1, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', NULL, 'super@mail.com', 'OtBMG-3O_ULHaEMKmM_pZIPvia1k_js_', '', 1, '', 5, 'en'),
(4, 'appadmin', '$2y$13$.X94ue5lX8Yt10motmlym.HyhumhiBXBZ7leukSITV7e9sTgLjNrK', 1, 0, '2024-10-28 13:20:22.00', '0000-00-00 00:00:00.00', '::1', 'bogosbinted@mail.com', 'pUwr74uXpIAq5h1XQU-3y3PuplNbm2P8', '', 1, '', 5, NULL),
(5, 'franzferdinand', '$2y$13$QEUqv2hQRuKQ2uFtNfXbcuPoiz2pyiZsn1kpv3RfboEQEdA8MZC9e', 1, 0, '2024-10-28 14:32:42.00', '0000-00-00 00:00:00.00', '::1', 'ferdinand@mail.com', 'LZN0hVpdM-xAb6SA0AEALIcxiVeCAS5H', '', 1, '', 13, 'id'),
(8, 'warehouse@mail.com', '$2y$13$XZ6TofHa8d5cAMutTqSMs.QzdqeRCGMeRs3ZfqoMQCWveNyOjdTs2', 1, 0, '2024-10-30 08:40:40.00', '0000-00-00 00:00:00.00', '::1', 'fred@mail.com', 'JGU2pLcVye5PBUUqBlGuB7h1M8c6gkrx', '', 1, '', 5, NULL),
(9, 'bobtherepairman', '$2y$13$0FJ7ZV.5Th2sydV4mDEP2u81kx56ocrbVEFZomEzdjK6xPfRt0xGa', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'bobrepair@mail.com', 'MbIXLNVCI6OHZFAZgwzyyLXTeiaVd6At', '', 1, '', 5, 'en'),
(10, 'bogosbinted', '$2y$13$byH/Orep9xl5ZWDL1IMtH.1NRxOm2IK/s9vDxODkiEp7o2gJ9TuZ2', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'bogosbinted@alien.com', 'LMStQ2EH_AMPtTfWSbwc9Li493FfLSTY', '', 1, '', 5, NULL),
(11, 'manfred', '$2y$13$S.Pu6X0K3VWvc/kr2atfyuWdDK9xYc1BMFyvHBnjKWMjJCZuUwKRG', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'redbaron@mail.com', 'E8fnjVCzTMoHqvXiFnfAyEEw7aU80X5W', '', 1, '', 5, 'de'),
(12, 'hugh', '$2y$13$iREFX85Oa9udbjkKDslyy.46GR1OLNOKYh6JaiZ03pfwS59xaCnUS', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'hugh@mail.com', '-R2PpAC6v4_aTMieMxphBxZ3l_tgVRez', '', 1, '', 5, NULL),
(14, 'admin_en', '$2y$13$NHfn.C7OGhaRG5/7IIHy/.Wj7q0jNKBOznQAz9kjlnCtDNJP0G3IG', 1, 1, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'admin_en@mail.com', '9YMT5b8a1ZCf18Sa01GV9z_YC4o7tLzI', '', 1, NULL, NULL, 'en'),
(15, 'ayylmao', '$2y$13$x0QphLkVQfC3H0emEqg...BIYV/WcQ3BgnkfjBDH9EBxRw6D91sIK', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'ayylmao@mail.com', 'qCfi3ew0w3uCaGeSUCTXCGiWsnyHhiOI', '', 1, NULL, 9, NULL),
(16, 'wilhelm', '$2y$13$blFp7hYsLyNBWP24NbxLxuSS8uVGcW/iSaKgnmfekmCy5rB6fYp3.', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'kaiser@mail.com', 'JZ1mfkN_QMtMh9X1Gwf3IHatXo1DqOVB', '', 1, NULL, 10, NULL),
(17, 'paul', '$2y$13$rxLl1fw.rhbgq/5DyP129OHNCBlpBBg3Equ1vSuNSb71G/pALVruW', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'paul@mail.com', 'xRQolWsjnmiVd1mWyRY32ppfye--PKNh', '', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_visit_log`
--

CREATE TABLE `user_visit_log` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` char(2) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_visit_log`
--

INSERT INTO `user_visit_log` (`id`, `token`, `ip`, `language`, `user_agent`, `user_id`, `visit_time`, `browser`, `os`) VALUES
(1, '672c16dc84d32', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1730942684, 'Chrome', 'Windows'),
(2, '672c18f5e7365', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1730943221, 'Chrome', 'Windows'),
(3, '672c21efda00e', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1730945519, 'Chrome', 'Windows'),
(4, '672c28a54750c', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1730947237, 'Chrome', 'Windows'),
(5, '672c2c60da2ca', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1730948192, 'Chrome', 'Windows'),
(6, '672c35658ae4b', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 9, 1730950501, 'Chrome', 'Windows'),
(7, '672c37b84241f', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 9, 1730951096, 'Chrome', 'Windows'),
(8, '672c39c88e63e', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 9, 1730951624, 'Chrome', 'Windows'),
(9, '672c3a385d005', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1730951736, 'Chrome', 'Windows'),
(10, '672c3afd75f13', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1730951933, 'Chrome', 'Windows'),
(11, '672c3b5ac8bc0', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1730952026, 'Chrome', 'Windows'),
(12, '672c3b61b9b5c', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1730952033, 'Chrome', 'Windows'),
(13, '672c3be089697', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1730952160, 'Chrome', 'Windows'),
(14, '672c3dd86522e', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 10, 1730952664, 'Chrome', 'Windows'),
(15, '672c3f7005e81', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 11, 1730953072, 'Chrome', 'Windows'),
(16, '672c4196049a8', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1730953622, 'Chrome', 'Windows'),
(17, '672c41cd410d8', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', NULL, 1730953677, 'Chrome', 'Windows'),
(18, '672c41f6c5272', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 11, 1730953718, 'Chrome', 'Windows'),
(19, '672c43edd6228', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 11, 1730954221, 'Chrome', 'Windows'),
(20, '672c43ee9b9ab', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 11, 1730954222, 'Chrome', 'Windows'),
(21, '672c5e257ecb2', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1730960933, 'Chrome', 'Windows'),
(22, '672c5e6b70cba', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 11, 1730961003, 'Chrome', 'Windows'),
(23, '672c607b9de46', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 9, 1730961531, 'Chrome', 'Windows'),
(24, '672c631a85584', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 11, 1730962202, 'Chrome', 'Windows'),
(25, '672c63a2a9199', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 9, 1730962338, 'Chrome', 'Windows'),
(26, '672c64e152848', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1730962657, 'Chrome', 'Windows'),
(27, '672c64ebcb9fb', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 10, 1730962667, 'Chrome', 'Windows'),
(28, '672c66f688a01', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 9, 1730963190, 'Chrome', 'Windows'),
(29, '672c66feeaa8a', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 10, 1730963198, 'Chrome', 'Windows'),
(30, '672d65a65750b', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1731028390, 'Chrome', 'Windows'),
(31, '672d84ff293ca', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 10, 1731036415, 'Chrome', 'Windows'),
(32, '672d850843ba3', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1731036424, 'Chrome', 'Windows'),
(33, '672d86868f007', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 4, 1731036806, 'Chrome', 'Windows'),
(34, '672d8742e61f7', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 5, 1731036994, 'Chrome', 'Windows'),
(35, '672d8b9728c31', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1731038103, 'Chrome', 'Windows'),
(36, '672d8ce8234f1', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1731038440, 'Chrome', 'Windows'),
(37, '672d8dfce99b4', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 10, 1731038716, 'Chrome', 'Windows'),
(38, '67315a5579f86', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1731287637, 'Chrome', 'Windows'),
(39, '673161bb0d07e', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 10, 1731289531, 'Chrome', 'Windows'),
(40, '673164f703a23', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1731290359, 'Chrome', 'Windows'),
(41, '6731687eb8890', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1731291262, 'Chrome', 'Windows'),
(42, '6731751f8a0aa', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1731294495, 'Chrome', 'Windows'),
(43, '6731a3ad86b2c', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 10, 1731306413, 'Chrome', 'Windows'),
(44, '6731aa3f0e91b', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1731308095, 'Chrome', 'Windows'),
(45, '6732ab845e8c9', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1731373956, 'Chrome', 'Windows'),
(46, '6732acf4ea9cd', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 10, 1731374324, 'Chrome', 'Windows'),
(47, '6732afa4450ca', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1731375012, 'Chrome', 'Windows'),
(48, '6732b0d9e8250', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 11, 1731375321, 'Chrome', 'Windows'),
(49, '6732b0dab1ec6', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 11, 1731375322, 'Chrome', 'Windows'),
(50, '6732b9632abe5', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 11, 1731377507, 'Chrome', 'Windows'),
(51, '6732bb292fbbe', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 11, 1731377961, 'Chrome', 'Windows'),
(52, '6732c64469c9b', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1731380804, 'Chrome', 'Windows'),
(53, '6732d039c4535', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1731383353, 'Chrome', 'Windows'),
(54, '6732d1633d2e9', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1731383651, 'Chrome', 'Windows'),
(55, '6732f1799957b', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1731391865, 'Chrome', 'Windows'),
(56, '6733fe076394c', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1731460615, 'Chrome', 'Windows'),
(57, '6733fe136345e', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1731460627, 'Chrome', 'Windows'),
(58, '67340022e2456', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 9, 1731461154, 'Chrome', 'Windows'),
(59, '673400972f908', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1731461271, 'Chrome', 'Windows'),
(60, '673d45b403fb5', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1732068788, 'Chrome', 'Windows'),
(61, '673d4bca6ff9a', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1732070346, 'Chrome', 'Windows'),
(62, '673e88c959f1f', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1732151497, 'Chrome', 'Windows'),
(63, '673e88ca5f3d1', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1732151498, 'Chrome', 'Windows'),
(64, '673eaa293ad8c', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1732160041, 'Chrome', 'Windows'),
(65, '673eaa3839d9b', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1732160056, 'Chrome', 'Windows'),
(66, '673eaa58113dc', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1732160088, 'Chrome', 'Windows'),
(67, '673eae0ad8ae6', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 4, 1732161034, 'Chrome', 'Windows'),
(68, '673ee49b8cf5c', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1732175003, 'Chrome', 'Windows'),
(69, '673ee4a854360', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 9, 1732175016, 'Chrome', 'Windows'),
(70, '673ee5352558f', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1732175157, 'Chrome', 'Windows'),
(71, '673fdab05b216', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 1, 1732238000, 'Chrome', 'Windows'),
(72, '673fe051b99ca', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1732239441, 'Chrome', 'Windows'),
(73, '673fe416141fc', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 9, 1732240406, 'Chrome', 'Windows'),
(74, '673fe7ad45e4e', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1732241325, 'Chrome', 'Windows'),
(89, '6743d75373355', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 2147483647, 'Chrome', 'Windows'),
(90, '6743d79f0e2b0', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 2147483647, 'Chrome', 'Windows'),
(91, '6743d7fee5853', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 2147483647, 'Chrome', 'Windows'),
(92, '6743dab9d4a6d', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732500153, 'Chrome', 'Windows'),
(93, '6743dba65af1e', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732500390, 'Chrome', 'Windows'),
(94, '6743dc4cc1625', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732525756, 'Chrome', 'Windows'),
(95, '6743dc5e14174', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732522174, 'Chrome', 'Windows'),
(96, '6743dd7b5c1d6', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 11, 1732522459, 'Chrome', 'Windows'),
(97, '6743de79da2e9', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732522713, 'Chrome', 'Windows'),
(98, '6743df35cff4a', '::1', 'de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 11, 1732522901, 'Chrome', 'Windows'),
(99, '6743e21beffcd', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 5, 1732523643, 'Chrome', 'Windows'),
(100, '6743e26ecabce', '::1', 'de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 11, 1732523726, 'Chrome', 'Windows'),
(101, '6743e3def0791', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 14, 1732524094, 'Chrome', 'Windows'),
(102, '6743e3dfbe290', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 14, 1732524095, 'Chrome', 'Windows'),
(103, '6743e9cb3238c', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 5, 1732525611, 'Chrome', 'Windows'),
(104, '6743ec171820c', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732526199, 'Chrome', 'Windows'),
(105, '6743ee3618eea', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 4, 1732526742, 'Chrome', 'Windows'),
(106, '6743ef3d7a0cb', '::1', 'de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 11, 1732527005, 'Chrome', 'Windows'),
(107, '6743ef3e529cd', '::1', 'de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 11, 1732527006, 'Chrome', 'Windows'),
(108, '674416f3d5682', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 11, 1732537171, 'Chrome', 'Windows'),
(109, '67442c1be0bb4', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 17, 1732542587, 'Chrome', 'Windows'),
(110, '67442cc74dc33', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 17, 1732542759, 'Chrome', 'Windows'),
(111, '67442d50cb2b0', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 5, 1732542896, 'Chrome', 'Windows'),
(112, '67442d5e0676f', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 4, 1732542910, 'Chrome', 'Windows'),
(113, '6745215f850cb', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732605375, 'Chrome', 'Windows'),
(114, '67452160b8777', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732605376, 'Chrome', 'Windows'),
(115, '674521aab8ca5', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 17, 1732605450, 'Chrome', 'Windows'),
(116, '6745225402f54', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 4, 1732605620, 'Firefox', 'Windows');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id_wh` int(10) UNSIGNED NOT NULL,
  `wh_name` varchar(255) NOT NULL,
  `wh_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id_wh`, `wh_name`, `wh_address`) VALUES
(5, 'JOG Condongcatur', 'Jl Gk tau, Condongcatur, Sleman'),
(6, 'Semarang Office', 'somewhere in semarang'),
(7, 'JKT Headquarter', 'somewhere in Jaksel'),
(8, 'Wonosobo Office Wh', 'somewhere in wonosobo'),
(9, 'PWT Office Wh', 'somewhere in pwt'),
(10, 'CLP Office Wh', 'somewhere in CLP'),
(11, 'SRBY Office Wh', 'somewhere in surabaya'),
(13, 'BDG Office Wh', 'somewhere in a bandung');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`),
  ADD KEY `fk_auth_item_group_code` (`group_code`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_item_group`
--
ALTER TABLE `auth_item_group`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `condition_lookup`
--
ALTER TABLE `condition_lookup`
  ADD PRIMARY KEY (`id_condition`);

--
-- Indexes for table `doc_uploaded`
--
ALTER TABLE `doc_uploaded`
  ADD PRIMARY KEY (`id_doc`),
  ADD KEY `doc_user` (`user_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD UNIQUE KEY `SKU` (`SKU`),
  ADD KEY `cat_item` (`id_category`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `item_unit`
--
ALTER TABLE `item_unit`
  ADD PRIMARY KEY (`id_unit`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD KEY `id_item` (`id_item`),
  ADD KEY `id_wh` (`id_wh`),
  ADD KEY `item_unit_ibfk_1` (`status`),
  ADD KEY `item_unit_ibfk_2` (`condition`),
  ADD KEY `item_unit_user_updated` (`updated_by`);

--
-- Indexes for table `lending`
--
ALTER TABLE `lending`
  ADD PRIMARY KEY (`id_lending`),
  ADD KEY `type` (`type`),
  ADD KEY `id_unit` (`id_unit`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indexes for table `lending_type_lookup`
--
ALTER TABLE `lending_type_lookup`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `repair_log`
--
ALTER TABLE `repair_log`
  ADD PRIMARY KEY (`id_repair`),
  ADD KEY `rep_type` (`rep_type`);

--
-- Indexes for table `rep_type_lookup`
--
ALTER TABLE `rep_type_lookup`
  ADD PRIMARY KEY (`id_rep_t`);

--
-- Indexes for table `status_lookup`
--
ALTER TABLE `status_lookup`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `unit_log`
--
ALTER TABLE `unit_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wh_usuer` (`id_wh`);

--
-- Indexes for table `user_visit_log`
--
ALTER TABLE `user_visit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id_wh`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `condition_lookup`
--
ALTER TABLE `condition_lookup`
  MODIFY `id_condition` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doc_uploaded`
--
ALTER TABLE `doc_uploaded`
  MODIFY `id_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id_category` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item_unit`
--
ALTER TABLE `item_unit`
  MODIFY `id_unit` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55255;

--
-- AUTO_INCREMENT for table `lending`
--
ALTER TABLE `lending`
  MODIFY `id_lending` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `lending_type_lookup`
--
ALTER TABLE `lending_type_lookup`
  MODIFY `id_type` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `repair_log`
--
ALTER TABLE `repair_log`
  MODIFY `id_repair` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rep_type_lookup`
--
ALTER TABLE `rep_type_lookup`
  MODIFY `id_rep_t` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_lookup`
--
ALTER TABLE `status_lookup`
  MODIFY `id_status` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `unit_log`
--
ALTER TABLE `unit_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_visit_log`
--
ALTER TABLE `user_visit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id_wh` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_auth_item_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doc_uploaded`
--
ALTER TABLE `doc_uploaded`
  ADD CONSTRAINT `doc_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `cat_item` FOREIGN KEY (`id_category`) REFERENCES `item_category` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item_unit`
--
ALTER TABLE `item_unit`
  ADD CONSTRAINT `item_unit_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status_lookup` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `item_unit_ibfk_2` FOREIGN KEY (`condition`) REFERENCES `condition_lookup` (`id_condition`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `item_unit_ibfk_3` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `item_unit_ibfk_4` FOREIGN KEY (`id_wh`) REFERENCES `warehouse` (`id_wh`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `item_unit_user_updated` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lending`
--
ALTER TABLE `lending`
  ADD CONSTRAINT `lending_ibfk_1` FOREIGN KEY (`id_unit`) REFERENCES `item_unit` (`id_unit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `lending_ibfk_2` FOREIGN KEY (`type`) REFERENCES `lending_type_lookup` (`id_type`),
  ADD CONSTRAINT `lending_ibfk_3` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_lending_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `repair_log`
--
ALTER TABLE `repair_log`
  ADD CONSTRAINT `rep_type` FOREIGN KEY (`rep_type`) REFERENCES `rep_type_lookup` (`id_rep_t`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `wh_usuer` FOREIGN KEY (`id_wh`) REFERENCES `warehouse` (`id_wh`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_visit_log`
--
ALTER TABLE `user_visit_log`
  ADD CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2024 at 05:30 AM
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
('maintenance', 9, 1730950172),
('maintenance', 12, 1731460710),
('sandbag', 10, 1730952624),
('superadmin', 1, 1730169714),
('superadmin', 4, 1731036786),
('superadmin', 11, 1730952835);

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
('App Admin', 2, 'App Admin', NULL, NULL, 1730954049, 1730954049, NULL),
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
('Admin', 'warehouse'),
('App Admin', '/user-management/user-visit-log/*'),
('App Admin', '/warehouse/assign'),
('App Admin', '/warehouse/assign-admins'),
('App Admin', 'assignRolesToUsers'),
('App Admin', 'base'),
('App Admin', 'bindUserToIp'),
('App Admin', 'bulk-documents'),
('App Admin', 'changeOwnPassword'),
('App Admin', 'changeUserPassword'),
('App Admin', 'createUsers'),
('App Admin', 'damaged-list'),
('App Admin', 'deleteUsers'),
('App Admin', 'editUserEmail'),
('App Admin', 'editUsers'),
('App Admin', 'employee'),
('App Admin', 'item-loan'),
('App Admin', 'loan-list'),
('App Admin', 'log-view'),
('App Admin', 'manage-unit'),
('App Admin', 'manageItems'),
('App Admin', 'master-inventory'),
('App Admin', 'repair-list'),
('App Admin', 'viewItems'),
('App Admin', 'viewRegistrationIp'),
('App Admin', 'viewUserEmail'),
('App Admin', 'viewUserRoles'),
('App Admin', 'viewUsers'),
('App Admin', 'viewVisitLog'),
('App Admin', 'warehouse'),
('assignRolesToUsers', '/user-management/user-permission/set'),
('assignRolesToUsers', '/user-management/user-permission/set-roles'),
('assignRolesToUsers', 'viewUserRoles'),
('assignRolesToUsers', 'viewUsers'),
('base', '/item/dashboard-data'),
('base', '/item/index'),
('base', '/item/item-name'),
('base', '/item/view-image'),
('base', '/site/*'),
('base', '/user/options'),
('bulk-documents', '/docs/index'),
('bulk-documents', '/docs/update'),
('bulk-documents', '/docs/view'),
('bulk-documents', '/docs/view-docs'),
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
('sandbag', 'base'),
('sandbag', 'changeOwnPassword'),
('sandbag', 'damaged-view-only'),
('sandbag', 'employee-view-only'),
('sandbag', 'in-repair-view-only'),
('sandbag', 'loan-report'),
('sandbag', 'loaning-view-only'),
('sandbag', 'warehouse-view-only'),
('superadmin', 'App Admin'),
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
('superadmin', 'manage-unit'),
('superadmin', 'manageItems'),
('superadmin', 'master-inventory'),
('superadmin', 'repair-list'),
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
(2, 'Lightly damaged (minor damage)'),
(3, 'Moderately damaged (missing a part or component)'),
(4, 'Major damage (inoperable, repair required)'),
(5, 'Total loss');

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
(30, 'Test G1', 'TCA-0003', '744_1732155555.jpg', 4);

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
(6, 'Test C2', 'TS');

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
(54294, 11, 1, 5, 'rep test at repair shop 1', 'PAA-0001-0001', 2, 1),
(54295, 11, 2, 6, 'new data after purge', 'PAA-0001-0002', 1, 1),
(54296, 11, 1, 7, 'new data after purge', 'PAA-0001-0003', 1, 1),
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
(54357, 11, 1, 13, 'new data after purge', 'PAA-0001-0064', 1, 1),
(54358, 12, 2, 5, 'new data after purge', 'PAA-0002-0001', 1, 1),
(54359, 12, 2, 6, 'new data after purge', 'PAA-0002-0002', 1, 1),
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
(54422, 13, 1, 5, 'rep test', 'PCA-0001-0001', 2, 1),
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
(54551, 15, 1, 6, 'new data after purge', 'VDA-0001-0002', 1, 1),
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
(54745, 25, 1, 8, 'new data after purge', 'PAA-0004-0004', 1, 1),
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
(54809, 26, 1, 8, 'new data after purge', 'PCA-0002-0004', 1, 1),
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
(54872, 27, 1, 7, 'new data after purge', 'VDA-0004-0003', 1, 1),
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
(54933, 27, 1, 13, 'new data after purge', 'VDA-0004-0064', 1, 1);

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
(73, 54295, 1, 5, 1, '2024-11-21', '834_1732157159.jpg', ''),
(74, 54358, 1, 8, 1, '2024-11-21', '449_1732157171.jpeg', ''),
(75, 54359, 1, 3, 1, '2024-11-21', '355_1732157182.jpeg', ''),
(76, 54422, 1, 4, 2, '2024-11-21', '717_1732157214.jpeg', '334_1732157606.gif'),
(77, 54614, 1, 3, 1, '2024-11-21', '693_1732157232.jpeg', '');

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
(2, 54294, 'PAA-0001-0001. rep test at repair shop 1', 2, '2024-11-21 09:57:17.00');

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
(4, 'Totalled or Lost');

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
(148, 54294, 'Unit PAA-0001-0001 repaired. Taken to warehouse by superadmin', '2024-11-21 09:57:17.000000');

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
  `bind_to_ip` varchar(255) NOT NULL,
  `email_confirmed` int(11) NOT NULL,
  `confirmation_token` varchar(255) NOT NULL,
  `id_wh` int(10) UNSIGNED NOT NULL,
  `user_lang` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password_hash`, `status`, `superadmin`, `created_at`, `updated_at`, `registration_ip`, `email`, `auth_key`, `bind_to_ip`, `email_confirmed`, `confirmation_token`, `id_wh`, `user_lang`) VALUES
(1, 'superadmin', '$2y$13$bp2w2.mTeJ/ORRVlEjA.jOHw0o49vwAJ.A15RTPjnSyk05M.20ZyS', 1, 1, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', NULL, 'super@mail.com', 'OtBMG-3O_ULHaEMKmM_pZIPvia1k_js_', '', 1, '', 5, 'id'),
(4, 'appadmin', '$2y$13$.X94ue5lX8Yt10motmlym.HyhumhiBXBZ7leukSITV7e9sTgLjNrK', 1, 0, '2024-10-28 13:20:22.00', '0000-00-00 00:00:00.00', '::1', 'bogosbinted@mail.com', 'pUwr74uXpIAq5h1XQU-3y3PuplNbm2P8', '', 1, '', 5, NULL),
(5, 'franzferdinand', '$2y$13$QEUqv2hQRuKQ2uFtNfXbcuPoiz2pyiZsn1kpv3RfboEQEdA8MZC9e', 1, 0, '2024-10-28 14:32:42.00', '0000-00-00 00:00:00.00', '::1', 'ferdinand@mail.com', 'LZN0hVpdM-xAb6SA0AEALIcxiVeCAS5H', '', 1, '', 5, 'id'),
(8, 'warehouse@mail.com', '$2y$13$XZ6TofHa8d5cAMutTqSMs.QzdqeRCGMeRs3ZfqoMQCWveNyOjdTs2', 1, 0, '2024-10-30 08:40:40.00', '0000-00-00 00:00:00.00', '::1', 'fred@mail.com', 'JGU2pLcVye5PBUUqBlGuB7h1M8c6gkrx', '', 1, '', 5, NULL),
(9, 'bobtherepairman', '$2y$13$0FJ7ZV.5Th2sydV4mDEP2u81kx56ocrbVEFZomEzdjK6xPfRt0xGa', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'bobrepair@mail.com', 'MbIXLNVCI6OHZFAZgwzyyLXTeiaVd6At', '', 1, '', 5, NULL),
(10, 'bogosbinted', '$2y$13$byH/Orep9xl5ZWDL1IMtH.1NRxOm2IK/s9vDxODkiEp7o2gJ9TuZ2', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'bogosbinted@alien.com', 'LMStQ2EH_AMPtTfWSbwc9Li493FfLSTY', '', 1, '', 5, NULL),
(11, 'manfred', '$2y$13$S.Pu6X0K3VWvc/kr2atfyuWdDK9xYc1BMFyvHBnjKWMjJCZuUwKRG', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'redbaron@mail.com', 'E8fnjVCzTMoHqvXiFnfAyEEw7aU80X5W', '', 1, '', 5, NULL),
(12, 'hugh', '$2y$13$iREFX85Oa9udbjkKDslyy.46GR1OLNOKYh6JaiZ03pfwS59xaCnUS', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'hugh@mail.com', '-R2PpAC6v4_aTMieMxphBxZ3l_tgVRez', '', 1, '', 5, NULL);

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
(67, '673eae0ad8ae6', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 4, 1732161034, 'Chrome', 'Windows');

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
  MODIFY `id_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id_category` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item_unit`
--
ALTER TABLE `item_unit`
  MODIFY `id_unit` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54934;

--
-- AUTO_INCREMENT for table `lending`
--
ALTER TABLE `lending`
  MODIFY `id_lending` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `lending_type_lookup`
--
ALTER TABLE `lending_type_lookup`
  MODIFY `id_type` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `repair_log`
--
ALTER TABLE `repair_log`
  MODIFY `id_repair` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_visit_log`
--
ALTER TABLE `user_visit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id_wh` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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

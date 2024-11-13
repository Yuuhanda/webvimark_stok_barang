-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2024 at 02:43 AM
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
('/lending/unit-report-active', 3, NULL, NULL, NULL, 1731032938, 1731032938, NULL),
('/lending/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/lending/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
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
('/site/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/about', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/captcha', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/contact', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/error', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/index', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/login', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/site/logout', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/add-unit', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/available-lending', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/available-unit', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/broken-unit', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/bulk-add', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/unit/bulk-add-preview', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
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
('/user/toggle-status', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user/update', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/user/view', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
('/warehouse/*', 3, NULL, NULL, NULL, 1730945389, 1730945389, NULL),
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
('warehouse', '/warehouse/*'),
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

--
-- Dumping data for table `doc_uploaded`
--

INSERT INTO `doc_uploaded` (`id_doc`, `file_name`, `datetime`, `user_id`) VALUES
(1, 'bulk_unit651_1730948866.xlsx', '2024-11-07 10:07:46.00', 5),
(2, 'bulk_unit417_1731039861.xlsx', '2024-11-08 11:24:21.00', 10),
(3, 'bulk_unit638_1731460940.xlsx', '2024-11-13 08:22:20.00', 5),
(4, 'bulk_unit135_1731460963.xlsx', '2024-11-13 08:22:43.00', 5),
(5, 'bulk_unit904_1731460975.xlsx', '2024-11-13 08:22:55.00', 5),
(6, 'bulk_unit264_1731460985.xlsx', '2024-11-13 08:23:05.00', 5),
(7, 'bulk_unit839_1731461003.xlsx', '2024-11-13 08:23:23.00', 5),
(8, 'bulk_unit554_1731461012.xlsx', '2024-11-13 08:23:32.00', 5);

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
  `imagefile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `item_name`, `SKU`, `imagefile`) VALUES
(11, 'Logitech Signature Slim Keyboard K950', 'BOGD-44', '736_1731394912.webp'),
(12, 'Logitech MX Anywhere 3S', 'OJWL-41', '304_1731394932.webp'),
(13, 'ThinkPad T14s Gen 4 (14″ AMD)', 'BNKH-93', '859_1731395020.jpg'),
(14, 'Generic Mousepad Small', 'RGTD-6', '409_1731395120.jpeg'),
(15, 'Sennheisser HD600', 'OTLP-31', '959_1731395082.jpeg'),
(16, 'Shure SM7B', 'UGSI-9059', '121_1731395169.jpeg'),
(18, 'TC-Helicon GOXLR', 'WX95-54EB', '903_1731395204.jpeg'),
(25, 'USB-C Hub Multi Dongle', 'UD31-64DI', '624_1731395239.jpeg'),
(26, 'Macbook Air M3', 'PU87-69AN', '116_1731395279.jpeg'),
(27, 'Sony A7 iv', 'LV46-13GV', '302_1731460840.webp');

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
(58, 11, 1, 7, 'rbac test 3', 'BOG5409', 1, 5),
(59, 11, 1, 6, 'test add new unit', 'BOG-7848', 1, 1),
(60, 11, 2, 5, 'finish repair test', 'BOG-2254', 1, 5),
(61, 11, 3, NULL, 'test add new unit', 'BOG-0642', 3, 8),
(62, 11, 3, NULL, 'test rbac', 'BOG-6089', 2, 5),
(63, 11, 1, 8, 'edit test', 'BOG-7894', 2, 1),
(64, 11, 1, 5, 'test add new unit', 'BOG-0790', 1, 1),
(65, 11, 3, NULL, 'test add new unit', 'BOG-0346', 2, 8),
(66, 11, 3, NULL, 'test add new unit', 'BOG-3217', 3, 8),
(67, 11, 1, 7, 'test add new unit', 'BOG-7480', 1, 1),
(68, 11, 4, 7, 'test add new unit', 'BOG-4594', 4, 8),
(69, 11, 1, 5, 'test add new unit', 'BOG-3363', 1, 1),
(70, 11, 2, 7, 'test add new unit', 'BOG-2006', 1, 5),
(71, 12, 1, 5, 'test add new unit', 'OJW-5143', 1, 1),
(72, 12, 3, NULL, 'rbac test', 'OJW-5757', 3, 5),
(73, 12, 1, 7, 'test add new unit', 'OJW-6303', 1, 1),
(74, 13, 1, NULL, 'test add new unit', 'BNK-0338', 1, NULL),
(75, 13, 1, 5, '', 'BNK-7156', 1, NULL),
(76, 13, 1, 7, 'test add new unit', 'BNK-2251', 1, NULL),
(77, 13, 1, 7, 'test add new unit', 'BNK-6793', 1, NULL),
(78, 14, 1, 9, 'test add new unit', 'RGT-2537', 1, NULL),
(79, 14, 1, 5, '', 'RGT-2175', 1, NULL),
(80, 14, 1, 5, 'test add new unit', 'RGT-6288', 1, NULL),
(81, 13, 1, 9, 'edit test', 'BNK-9582', 1, NULL),
(82, 13, 1, 8, 'edit test', 'BNK-1702', 1, 5),
(83, 14, 1, NULL, '', 'RGT-6039', 1, NULL),
(84, 14, 1, 8, 'rbac test', 'RGT-1395', 1, 5),
(85, 14, 1, 5, 'New Unit', 'RGT-9633', 1, NULL),
(87, 11, 1, 5, 'mass upload test', 'BOG-670', 1, 5),
(88, 11, 1, 6, 'mass upload test', 'BOG-389', 1, 1),
(89, 11, 1, 7, 'mass upload test', 'BOG-460', 1, 5),
(90, 11, 1, 8, 'mass upload test', 'BOG-932', 1, 5),
(91, 11, 1, 9, 'mass upload test', 'BOG-623', 1, 5),
(92, 11, 1, 5, 'mass upload test', 'BOG-297', 1, 5),
(93, 11, 1, 6, 'mass upload test', 'BOG-263', 1, 5),
(94, 11, 1, 7, 'mass upload test', 'BOG-784', 1, 5),
(95, 11, 2, 8, 'eyy', 'BOG-261', 1, 5),
(96, 11, 2, 9, 'mass upload test', 'BOG-914', 1, 5),
(97, 14, 1, 5, 'mass upload test', 'RGT-908', 1, 5),
(98, 14, 1, 6, 'mass upload test', 'RGT-882', 1, 5),
(99, 14, 1, 7, 'mass upload test', 'RGT-567', 1, 5),
(100, 14, 1, 8, 'mass upload test', 'RGT-614', 1, 5),
(101, 14, 1, 9, 'mass upload test', 'RGT-848', 1, 5),
(102, 14, 1, 5, 'mass upload test', 'RGT-780', 1, 5),
(103, 14, 1, 6, 'mass upload test', 'RGT-197', 1, 5),
(104, 14, 1, 7, 'mass upload test', 'RGT-389', 1, 5),
(105, 14, 1, 8, 'mass upload test', 'RGT-105', 1, 5),
(106, 14, 1, 9, 'mass upload test', 'RGT-51', 1, 5),
(107, 14, 1, 5, 'mass upload test', 'RGT-880', 1, 5),
(108, 14, 1, 6, 'mass upload test', 'RGT-626', 1, 5),
(109, 14, 1, 7, 'mass upload test', 'RGT-403', 1, 5),
(110, 14, 1, 8, 'mass upload test', 'RGT-110', 1, 5),
(111, 14, 1, 9, 'mass upload test', 'RGT-946', 1, 5),
(112, 14, 1, 5, 'mass upload test', 'RGT-577', 1, 5),
(113, 14, 1, 6, 'mass upload test', 'RGT-805', 1, 5),
(114, 14, 1, 7, 'mass upload test', 'RGT-583', 1, 5),
(115, 14, 1, 8, 'mass upload test', 'RGT-268', 1, 5),
(116, 14, 1, 9, 'mass upload test', 'RGT-372', 1, 5),
(53303, 16, 1, 6, 'test add new unit', 'UGSI-31JEAB', 1, 4),
(53304, 16, 1, 6, 'test add new unit', 'UGSI-85EDXN74', 1, 4),
(53305, 16, 1, 10, 'New Unit', 'UGSI-31XB39FY', 1, 4),
(53306, 16, 1, 8, 'test add new unit', 'UGSI-4994KW', 1, 4),
(53307, 18, 1, 8, 'test add new unit', 'WX95-1911YK', 1, 4),
(53308, 18, 2, 5, 'test add new unit  new autogenerate format', 'WX95-8225CZ-GH', 1, 4),
(53309, 18, 1, 7, 'new format check', 'WX95-4898QB-TN', 1, 4),
(54210, 26, 1, 5, 'rbac test', 'PU87-3865SB-CB', 1, 5),
(54211, 26, 1, 5, 'rbac test webvimark bulk', 'PU87-2604YU-GG', 1, 5),
(54212, 26, 1, 6, 'rbac test webvimark bulk', 'PU87-5165WZ-FF', 1, 5),
(54213, 26, 1, 7, 'rbac test webvimark bulk', 'PU87-2309CI-BE', 1, 5),
(54214, 26, 1, 8, 'rbac test webvimark bulk', 'PU87-7290MP-OU', 1, 5),
(54215, 26, 1, 9, 'rbac test webvimark bulk', 'PU87-2368QM-AM', 1, 5),
(54216, 26, 1, 10, 'rbac test webvimark bulk', 'PU87-5412DB-WD', 1, 5),
(54217, 12, 1, 9, 'return test demo 1', 'OJWL-5502BT-GD', 1, 5),
(54218, 12, 1, 10, 'test add new unit 222', 'OJWL-8475IX-GL', 1, 1),
(54219, 27, 1, 5, 'test add new unit', 'LV46-8908QM-BG', 1, 5),
(54220, 27, 1, 6, 'New Unit', 'LV46-4496ZX-VF', 1, 5),
(54221, 25, 1, 5, 'test add new unit', 'UD31-2295XN-UY', 1, 5),
(54222, 15, 1, 5, 'test', 'OTLP-6254BO-BY', 1, 5),
(54223, 15, 1, 6, 'test', 'OTLP-9868UR-CE', 1, 5),
(54224, 15, 1, 7, 'test', 'OTLP-6484BD-UW', 1, 5),
(54225, 15, 1, 8, 'test', 'OTLP-3005PX-FQ', 1, 5),
(54226, 15, 1, 9, 'test', 'OTLP-1691EA-WY', 1, 5),
(54227, 15, 1, 10, 'test', 'OTLP-4385YA-XN', 1, 5),
(54228, 15, 1, 11, 'test', 'OTLP-7802QJ-RP', 1, 5),
(54229, 15, 1, 13, 'test', 'OTLP-4704VS-VK', 1, 5),
(54230, 25, 1, 5, 'test', 'UD31-6957PS-FN', 1, 5),
(54231, 25, 1, 6, 'test', 'UD31-0624QS-XH', 1, 5),
(54232, 25, 1, 7, 'test', 'UD31-6126LI-SG', 1, 5),
(54233, 25, 1, 8, 'test', 'UD31-2747EZ-YV', 1, 5),
(54234, 25, 1, 9, 'test', 'UD31-2473BK-VC', 1, 5),
(54235, 25, 1, 10, 'test', 'UD31-6379RS-DV', 1, 5),
(54236, 25, 1, 11, 'test', 'UD31-6465XI-OX', 1, 5),
(54237, 25, 1, 13, 'test', 'UD31-7610JF-TN', 1, 5),
(54238, 18, 1, 5, 'test', 'WX95-7528VL-SU', 1, 5),
(54239, 18, 1, 6, 'test', 'WX95-0322WC-UD', 1, 5),
(54240, 18, 1, 7, 'test', 'WX95-6061ZE-LL', 1, 5),
(54241, 18, 1, 8, 'test', 'WX95-6813WW-KD', 1, 5),
(54242, 18, 1, 9, 'test', 'WX95-1630WR-EN', 1, 5),
(54243, 18, 1, 10, 'test', 'WX95-9020QW-JY', 1, 5),
(54244, 18, 1, 11, 'test', 'WX95-0517GE-GT', 1, 5),
(54245, 18, 1, 13, 'test', 'WX95-8865TB-IV', 1, 5),
(54246, 27, 1, 5, 'test', 'LV46-5078AR-YB', 1, 5),
(54247, 27, 1, 6, 'test', 'LV46-9572BZ-SW', 1, 5),
(54248, 27, 1, 7, 'test', 'LV46-8071NF-CJ', 1, 5),
(54249, 27, 1, 8, 'test', 'LV46-1354WC-EB', 1, 5),
(54250, 27, 1, 9, 'test', 'LV46-1770ND-MO', 1, 5),
(54251, 27, 1, 10, 'test', 'LV46-7495GJ-LF', 1, 5),
(54252, 27, 1, 11, 'test', 'LV46-6755FE-ZK', 1, 5),
(54253, 27, 1, 13, 'test', 'LV46-7798ZZ-GH', 1, 5),
(54254, 26, 1, 5, 'test', 'PU87-0283HB-SQ', 1, 5),
(54255, 26, 1, 6, 'test', 'PU87-2761DF-DP', 1, 5),
(54256, 26, 1, 7, 'test', 'PU87-8835FS-CY', 1, 5),
(54257, 26, 1, 8, 'test', 'PU87-5616TH-JV', 1, 5),
(54258, 26, 1, 9, 'test', 'PU87-5813OA-GJ', 1, 5),
(54259, 26, 1, 10, 'test', 'PU87-2753OL-JQ', 1, 5),
(54260, 26, 1, 11, 'test', 'PU87-7408EE-YS', 1, 5),
(54261, 26, 1, 13, 'test', 'PU87-9607QD-DW', 1, 5),
(54262, 16, 1, 5, 'test', 'UGSI-8274JB-CA', 1, 5),
(54263, 16, 1, 6, 'test', 'UGSI-8526JK-PU', 1, 5),
(54264, 16, 1, 7, 'test', 'UGSI-0756VM-UW', 1, 5),
(54265, 16, 1, 8, 'test', 'UGSI-7763YA-KY', 1, 5),
(54266, 16, 1, 9, 'test', 'UGSI-8200TC-UN', 1, 5),
(54267, 16, 1, 10, 'test', 'UGSI-4665OJ-EU', 1, 5),
(54268, 16, 1, 11, 'test', 'UGSI-8632EA-RL', 1, 5),
(54269, 16, 1, 13, 'test', 'UGSI-4969KT-HK', 1, 5);

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
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lending`
--

INSERT INTO `lending` (`id_lending`, `id_unit`, `user_id`, `id_employee`, `type`, `date`) VALUES
(30, 62, 1, 3, 2, '2024-10-29'),
(31, 61, 4, 1, 2, '2024-10-29'),
(32, 60, 4, 2, 2, '2024-10-29'),
(33, 58, 5, 2, 2, '2024-10-29'),
(34, 66, 5, 1, 2, '2024-10-30'),
(35, 61, 5, 1, 2, '2024-10-30'),
(36, 64, 5, 1, 2, '2024-10-29'),
(37, 72, 8, 2, 2, '2024-10-30'),
(38, 65, 8, 3, 2, '2024-10-30'),
(39, 68, 8, 2, 2, '2024-10-30'),
(40, 70, 8, 3, 2, '2024-10-31'),
(41, 64, 8, 2, 2, '2024-10-30'),
(42, 84, 5, 4, 2, '2024-10-30'),
(43, 84, 5, 1, 2, '2024-11-07'),
(44, 64, 5, 2, 2, '2024-11-12'),
(45, 70, 5, 1, 1, '2024-10-31'),
(46, 60, 5, 1, 1, '2024-10-31'),
(47, 95, 5, 1, 1, '2024-10-31'),
(48, 95, 5, 1, 1, '2024-10-31'),
(49, 53308, 4, 2, 1, '2024-10-31'),
(50, 96, 5, 2, 1, '2024-11-07'),
(51, 88, 1, 5, 1, '2024-11-08'),
(52, 88, 1, 5, 2, '2024-11-11'),
(53, 54217, 1, 5, 2, '2024-11-11'),
(54, 54217, 1, 4, 2, '2024-11-11'),
(55, 54217, 5, 5, 2, '2024-11-11'),
(56, 93, 5, 5, 2, '2024-11-11'),
(57, 88, 1, 5, 2, '2024-11-12'),
(58, 59, 1, 7, 2, '2024-11-12');

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
(24, 62, 'Unit BOG-6089 lent to Tumbal', '2024-10-28 14:14:04.000000'),
(25, 58, 'Unit BOG5409 updated by tumbaladmin', '2024-10-29 08:52:07.000000'),
(26, 62, 'Unit BOG-6089 returned by Tumbal', '2024-10-29 08:56:09.000000'),
(27, 62, 'Unit BOG-6089 sent for repair by tumbaladmin', '2024-10-29 08:58:36.000000'),
(28, 62, 'Unit BOG-6089 repaired. Taken to warehouse by fradmin', '2024-10-29 09:02:13.000000'),
(29, 62, 'Unit BOG-6089 sent for repair by fradmin', '2024-10-29 09:02:42.000000'),
(30, 61, 'Unit BOG-0642 lent to johan tumbal by fradmin', '2024-10-29 09:11:57.000000'),
(31, 60, 'Unit BOG-2254 lent to Emma by fradmin', '2024-10-29 09:12:48.000000'),
(32, 61, 'Unit BOG-0642 returned by johan tumbal, recieved by fradmin', '2024-10-29 09:13:00.000000'),
(33, 61, 'Unit BOG-0642 returned by johan tumbal, recieved by fradmin', '2024-10-29 09:13:00.000000'),
(34, 60, 'Unit BOG-2254 returned by Emma, recieved by fradmin', '2024-10-29 09:14:20.000000'),
(35, 60, 'Unit BOG-2254 sent for repair by fradmin', '2024-10-29 09:16:01.000000'),
(36, 58, 'Unit BOG5409 lent to Emma by tumbaladmin', '2024-10-29 10:11:55.000000'),
(37, 58, 'Unit BOG5409 returned by Emma, recieved by tumbaladmin', '2024-10-29 10:19:15.000000'),
(38, 66, 'Unit BOG-3217 lent to johan tumbal by tumbaladmin', '2024-10-29 10:31:10.000000'),
(39, 61, 'Unit BOG-0642 lent to johan tumbal by tumbaladmin', '2024-10-29 10:31:14.000000'),
(40, 64, 'Unit BOG-0790 lent to johan tumbal by tumbaladmin', '2024-10-29 10:31:18.000000'),
(41, 64, 'Unit BOG-0790 updated by tumbaladmin', '2024-10-29 13:42:54.000000'),
(42, 64, 'Unit BOG-0790 updated by tumbaladmin', '2024-10-29 13:43:01.000000'),
(43, 64, 'Unit BOG-0790 returned by johan tumbal, recieved by tumbaladmin', '2024-10-29 13:43:17.000000'),
(44, 72, 'Unit OJW-5757 lent to Emma by fredadmin', '2024-10-30 08:42:02.000000'),
(45, 65, 'Unit BOG-0346 lent to Tumbal by fredadmin', '2024-10-30 08:42:08.000000'),
(46, 60, 'Unit BOG-2254 repaired. Taken to warehouse by fredadmin', '2024-10-30 09:03:55.000000'),
(47, 66, 'Unit BOG-3217 returned by johan tumbal, recieved by fredadmin', '2024-10-30 09:04:12.000000'),
(48, 61, 'Unit BOG-0642 returned by johan tumbal, recieved by fredadmin', '2024-10-30 09:04:26.000000'),
(49, 61, 'Unit BOG-0642 sent for repair by fredadmin', '2024-10-30 09:04:37.000000'),
(50, 66, 'Unit BOG-3217 sent for repair by fredadmin', '2024-10-30 09:04:39.000000'),
(51, 65, 'Unit BOG-0346 returned by Tumbal, recieved by fredadmin', '2024-10-30 09:10:01.000000'),
(52, 65, 'Unit BOG-0346 sent for repair by fredadmin', '2024-10-30 09:10:07.000000'),
(53, 68, 'Unit BOG-4594 lent to Emma by fredadmin', '2024-10-30 09:14:52.000000'),
(54, 70, 'Unit BOG-2006 lent to Tumbal by fredadmin', '2024-10-30 09:14:57.000000'),
(55, 72, 'Unit OJW-5757 returned by Emma, recieved by fredadmin', '2024-10-30 09:15:05.000000'),
(56, 68, 'Unit BOG-4594 returned by Emma, recieved by fredadmin', '2024-10-30 09:15:10.000000'),
(57, 64, 'Unit BOG-0790 lent to Emma by fredadmin', '2024-10-30 10:24:38.000000'),
(58, 63, 'Unit BOG-7894 updated by fradmin', '2024-10-30 11:11:53.000000'),
(59, 84, 'Unit RGT-1395 lent to Freddy by tumbaladmin', '2024-10-30 14:31:37.000000'),
(60, 84, 'Unit RGT-1395 returned by Freddy, recieved by tumbaladmin', '2024-10-30 14:31:53.000000'),
(61, 64, 'Unit BOG-0790 returned by Emma, recieved by tumbaladmin', '2024-10-30 14:32:00.000000'),
(62, 81, 'Unit BNK-9582 updated by tumbaladmin', '2024-10-30 14:37:46.000000'),
(63, 82, 'Unit BNK-1702 updated by tumbaladmin', '2024-10-30 14:38:04.000000'),
(64, 82, 'Unit BNK-1702 updated by tumbaladmin', '2024-10-30 14:40:33.000000'),
(65, 82, 'Unit BNK-1702 updated by tumbaladmin', '2024-10-30 14:42:53.000000'),
(66, 70, 'Unit BOG-2006 returned by Tumbal, recieved by tumbaladmin', '2024-10-31 09:15:27.000000'),
(67, 84, 'Unit RGT-1395 lent to johan tumbal by tumbaladmin', '2024-10-31 09:15:43.000000'),
(68, 64, 'Unit BOG-0790 lent to Emma by tumbaladmin', '2024-10-31 09:15:48.000000'),
(69, 70, 'Unit BOG-2006 lent to johan tumbal by tumbaladmin', '2024-10-31 09:15:53.000000'),
(70, 60, 'Unit BOG-2254 lent to johan tumbal by tumbaladmin', '2024-10-31 09:15:58.000000'),
(71, 95, 'Unit BOG-261 lent to johan tumbal by tumbaladmin', '2024-10-31 09:16:03.000000'),
(72, 95, 'Unit BOG-261 lent to johan tumbal by tumbaladmin', '2024-10-31 09:16:03.000000'),
(73, 95, 'Unit BOG-261 updated by tumbaladmin', '2024-10-31 09:17:30.000000'),
(74, 53308, 'Unit WX95-8225CZ-GH lent to Emma by fradmin', '2024-10-31 10:44:28.000000'),
(75, 58, 'Unit BOG5409 updated by tumbaladmin', '2024-11-07 09:57:30.000000'),
(76, 58, 'Unit BOG5409 updated by tumbaladmin', '2024-11-07 10:00:19.000000'),
(77, 58, 'Unit BOG5409 updated by tumbaladmin', '2024-11-07 10:00:41.000000'),
(78, 58, 'Unit BOG5409 updated by tumbaladmin', '2024-11-07 10:00:49.000000'),
(79, 58, 'Unit BOG5409 updated by tumbaladmin', '2024-11-07 10:01:07.000000'),
(80, 96, 'Unit BOG-914 lent to Emma by tumbaladmin', '2024-11-07 10:17:15.000000'),
(81, 84, 'Unit RGT-1395 returned by johan tumbal, recieved by tumbaladmin', '2024-11-07 10:19:24.000000'),
(82, 72, 'Unit OJW-5757 sent for repair by tumbaladmin', '2024-11-07 10:23:16.000000'),
(83, 62, 'Unit BOG-6089 repaired. Taken to warehouse by bobtherepairman', '2024-11-07 10:44:01.000000'),
(84, 88, 'Unit BOG-389 lent to Shioriiiin by superadmin', '2024-11-08 09:10:13.000000'),
(85, 88, 'Unit BOG-389 lent to Shioriiiin by superadmin', '2024-11-08 09:10:13.000000'),
(86, 59, 'Unit BOG-7848 updated by superadmin', '2024-11-11 10:41:21.000000'),
(87, 63, 'Unit BOG-7894 updated by superadmin', '2024-11-11 10:41:34.000000'),
(88, 63, 'Unit BOG-7894 updated by superadmin', '2024-11-11 10:41:35.000000'),
(89, 67, 'Unit BOG-7480 updated by superadmin', '2024-11-11 10:41:42.000000'),
(90, 69, 'Unit BOG-3363 updated by superadmin', '2024-11-11 10:41:47.000000'),
(91, 54218, 'Unit OJWL-8475IX-GL added by superadmin', '2024-11-11 10:51:35.000000'),
(92, 71, 'Unit OJW-5143 updated by superadmin', '2024-11-11 10:54:02.000000'),
(93, 73, 'Unit OJW-6303 updated by superadmin', '2024-11-11 10:54:10.000000'),
(94, 54217, 'Unit OJWL-5502BT-GD lent to Shioriiiin by superadmin', '2024-11-11 10:57:00.000000'),
(95, 54217, 'Unit OJWL-5502BT-GD returned by Shioriiiin, recieved by superadmin', '2024-11-11 13:37:47.000000'),
(96, 54217, 'Unit OJWL-5502BT-GD lent to Freddy by superadmin', '2024-11-11 13:38:47.000000'),
(97, 54217, 'Unit OJWL-5502BT-GD returned by Freddy, recieved by franzferdinand', '2024-11-11 13:55:20.000000'),
(98, 54217, 'Unit OJWL-5502BT-GD lent to Shioriiiin by franzferdinand', '2024-11-11 13:55:30.000000'),
(99, 54217, 'Unit OJWL-5502BT-GD returned by Shioriiiin, recieved by franzferdinand', '2024-11-11 13:56:24.000000'),
(100, 93, 'Unit BOG-263 lent to Shioriiiin by franzferdinand', '2024-11-11 13:58:18.000000'),
(101, 93, 'Unit BOG-263 returned by Shioriiiin, recieved by franzferdinand', '2024-11-11 13:58:42.000000'),
(102, 88, 'Unit BOG-389 returned by Shioriiiin, recieved by franzferdinand', '2024-11-11 13:58:49.000000'),
(103, 88, 'Unit BOG-389 lent to Shioriiiin by superadmin', '2024-11-12 08:15:29.000000'),
(104, 59, 'Unit BOG-7848 lent to Shioweeen by superadmin', '2024-11-12 08:15:41.000000'),
(105, 59, 'Unit BOG-7848 returned by Shioweeen, recieved by superadmin', '2024-11-12 08:15:53.000000'),
(106, 88, 'Unit BOG-389 returned by Shioriiiin, recieved by superadmin', '2024-11-12 08:16:05.000000'),
(107, 64, 'Unit BOG-0790 returned by Emma, recieved by superadmin', '2024-11-12 08:16:09.000000'),
(108, 62, 'Unit BOG-6089 sent for repair by franzferdinand', '2024-11-12 08:32:18.000000'),
(109, 54219, 'New unit LV46-8908QM-BG added by franzferdinand', '2024-11-13 08:21:02.000000'),
(110, 54220, 'New unit LV46-4496ZX-VF added by franzferdinand', '2024-11-13 08:21:08.000000'),
(111, 54221, 'New unit UD31-2295XN-UY added by franzferdinand', '2024-11-13 08:21:19.000000');

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
  `confirmation_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password_hash`, `status`, `superadmin`, `created_at`, `updated_at`, `registration_ip`, `email`, `auth_key`, `bind_to_ip`, `email_confirmed`, `confirmation_token`) VALUES
(1, 'superadmin', '$2y$13$bp2w2.mTeJ/ORRVlEjA.jOHw0o49vwAJ.A15RTPjnSyk05M.20ZyS', 1, 1, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', NULL, 'super@mail.com', 'OtBMG-3O_ULHaEMKmM_pZIPvia1k_js_', '', 1, ''),
(4, 'appadmin', '$2y$13$.X94ue5lX8Yt10motmlym.HyhumhiBXBZ7leukSITV7e9sTgLjNrK', 1, 0, '2024-10-28 13:20:22.00', '0000-00-00 00:00:00.00', '::1', 'bogosbinted@mail.com', 'pUwr74uXpIAq5h1XQU-3y3PuplNbm2P8', '', 1, ''),
(5, 'franzferdinand', '$2y$13$QEUqv2hQRuKQ2uFtNfXbcuPoiz2pyiZsn1kpv3RfboEQEdA8MZC9e', 1, 0, '2024-10-28 14:32:42.00', '0000-00-00 00:00:00.00', '::1', 'ferdinand@mail.com', 'LZN0hVpdM-xAb6SA0AEALIcxiVeCAS5H', '', 1, ''),
(8, 'warehouse@mail.com', '$2y$13$XZ6TofHa8d5cAMutTqSMs.QzdqeRCGMeRs3ZfqoMQCWveNyOjdTs2', 1, 0, '2024-10-30 08:40:40.00', '0000-00-00 00:00:00.00', '::1', 'fred@mail.com', 'JGU2pLcVye5PBUUqBlGuB7h1M8c6gkrx', '', 1, ''),
(9, 'bobtherepairman', '$2y$13$0FJ7ZV.5Th2sydV4mDEP2u81kx56ocrbVEFZomEzdjK6xPfRt0xGa', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'bobrepair@mail.com', 'MbIXLNVCI6OHZFAZgwzyyLXTeiaVd6At', '', 1, ''),
(10, 'bogosbinted', '$2y$13$byH/Orep9xl5ZWDL1IMtH.1NRxOm2IK/s9vDxODkiEp7o2gJ9TuZ2', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'bogosbinted@alien.com', 'LMStQ2EH_AMPtTfWSbwc9Li493FfLSTY', '', 1, ''),
(11, 'manfred', '$2y$13$S.Pu6X0K3VWvc/kr2atfyuWdDK9xYc1BMFyvHBnjKWMjJCZuUwKRG', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'redbaron@mail.com', 'E8fnjVCzTMoHqvXiFnfAyEEw7aU80X5W', '', 1, ''),
(12, 'hugh', '$2y$13$iREFX85Oa9udbjkKDslyy.46GR1OLNOKYh6JaiZ03pfwS59xaCnUS', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'hugh@mail.com', '-R2PpAC6v4_aTMieMxphBxZ3l_tgVRez', '', 1, '');

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
(59, '673400972f908', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 5, 1731461271, 'Chrome', 'Windows');

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
  ADD UNIQUE KEY `SKU` (`SKU`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `item_unit`
--
ALTER TABLE `item_unit`
  MODIFY `id_unit` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54270;

--
-- AUTO_INCREMENT for table `lending`
--
ALTER TABLE `lending`
  MODIFY `id_lending` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `lending_type_lookup`
--
ALTER TABLE `lending_type_lookup`
  MODIFY `id_type` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_lookup`
--
ALTER TABLE `status_lookup`
  MODIFY `id_status` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `unit_log`
--
ALTER TABLE `unit_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_visit_log`
--
ALTER TABLE `user_visit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

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
-- Constraints for table `user_visit_log`
--
ALTER TABLE `user_visit_log`
  ADD CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

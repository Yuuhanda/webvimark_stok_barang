-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2024 at 03:12 AM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateRepairLogSamples` ()   BEGIN
    DECLARE month_counter INT DEFAULT 1;
    DECLARE day_counter INT;
    DECLARE unit_id INT;
    DECLARE start_time DATETIME;
    DECLARE close_time DATETIME;

    WHILE month_counter <= 12 DO
        SET day_counter = 1;

        WHILE day_counter <= 4 DO
            SET unit_id = FLOOR(1 + RAND() * 500); -- Random id_unit between 1 and 500
            SET start_time = CONCAT('2024-', LPAD(month_counter, 2, '0'), '-', LPAD(FLOOR(1 + RAND() * 28), 2, '0'), ' ', LPAD(FLOOR(RAND() * 24), 2, '0'), ':', LPAD(FLOOR(RAND() * 60), 2, '0'), ':00');
            SET close_time = DATE_ADD(start_time, INTERVAL FLOOR(RAND() * 5) DAY); -- Random close date 0-5 days after start

            -- Insert "repair started" log
            INSERT INTO `repair_log` (`id_unit`, `comment`, `rep_type`, `datetime`)
            VALUES (unit_id, CONCAT('Repair started for unit ', unit_id), 1, start_time);

            -- Insert "repair done" log
            INSERT INTO `repair_log` (`id_unit`, `comment`, `rep_type`, `datetime`)
            VALUES (unit_id, CONCAT('Repair completed for unit ', unit_id), 2, close_time);

            SET day_counter = day_counter + 1;
        END WHILE;

        SET month_counter = month_counter + 1;
    END WHILE;
END$$

DELIMITER ;

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
('/repair-log/detail', 3, NULL, NULL, NULL, 1732765201, 1732765201, NULL),
('/repair-log/detail-single', 3, NULL, NULL, NULL, 1732765201, 1732765201, NULL),
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
('Admin', 1, 'Warehouse Admin', NULL, NULL, 1729233881, 1732585576, NULL),
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
('repair-log', 2, 'repair-log', NULL, NULL, 1732766409, 1732766409, 'maintenance'),
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
('Admin', 'repair-log'),
('Admin', 'repair-summary'),
('Admin', 'warehouse-view-only'),
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
('inventory-view', '/category/index'),
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
('lending-history', '/lending/return-image'),
('lending-history', '/lending/view-image'),
('loan-list', '/export/export-lending'),
('loan-list', '/lending/lending-list'),
('loan-list', '/lending/list'),
('loan-list', '/lending/update'),
('loan-list', '/lending/view-image'),
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
('maintenance', 'repair-log'),
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
('repair-log', '/repair-log/detail'),
('repair-log', '/repair-log/detail-single'),
('repair-log', '/repair-log/index'),
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
('superadmin', 'damaged-view-only'),
('superadmin', 'deleteUsers'),
('superadmin', 'editUserEmail'),
('superadmin', 'editUsers'),
('superadmin', 'employee'),
('superadmin', 'in-repair-view-only'),
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
('02368a7c1c10f0b14d0f2b7c95203339', 2147483647, 0x613a323a7b693a303b733a31323a2244c3a9636f6e6e6578696f6e223b693a313b4e3b7d),
('0345d51e20cef06d150b18ad7535dd0f', 1735093396, 0x613a323a7b693a303b733a31313a224b656c6f6c6120556e6974223b693a313b4e3b7d),
('03cbd1183b85ad010a8109d4f2b0e2ad', 2147483647, 0x613a323a7b693a303b733a31323a224d6f74206465207061737365223b693a313b4e3b7d),
('04ec49e874ca6ce1c2ef5f5199f42c68', 2147483647, 0x613a323a7b693a303b733a393a2253706569636865726e223b693a313b4e3b7d),
('0500648d1fa6d5222390f16faad74fec', 2147483647, 0x613a323a7b693a303b733a36303a224dc3a4c39f6967206265736368c3a46469677420286573206665686c742065696e205465696c206f6465722065696e65204b6f6d706f6e656e746529223b693a313b4e3b7d),
('05c393c001e184658389e0d68523f7ff', 2147483647, 0x613a323a7b693a303b733a323a224f4b223b693a313b4e3b7d),
('0617be15577cf0eb2890793156a0c32c', 2147483647, 0x613a323a7b693a303b733a31313a224e6f6d6f7220536572693a223b693a313b4e3b7d),
('06d43befa26f40389425483d0f0ebe92', 2147483647, 0x613a323a7b693a303b733a36353a22556e697420504341202d30303031202d303030312064697065726261696b692e20446962617761206b6520677564616e67206f6c656820737570657261646d696e223b693a313b4e3b7d),
('0782e711e794596f9d5e3b64d8eb27b7', 1735093338, 0x613a323a7b693a303b733a31343a2255706c6f61642d5665726c617566223b693a313b4e3b7d),
('0a0daa59b19b3035914716a3a41ecc95', 2147483647, 0x613a323a7b693a303b733a31393a224d656e752061646d696e697374726174657572223b693a313b4e3b7d),
('0a2d697487d8bd8d392c897d22d90007', 2147483647, 0x613a323a7b693a303b733a31303a225374617274646174756d223b693a313b4e3b7d),
('0a68a2b89eb018647b54e04163aaff46', 2147483647, 0x613a323a7b693a303b733a33353a225065726261696b616e2044696d756c61692e205065726261696b616e20646962756b61223b693a313b4e3b7d),
('0a79c4dfdf2f53b2d0476d28d1110efb', 2147483647, 0x613a323a7b693a303b733a31313a22496e204765627261756368223b693a313b4e3b7d),
('0af169ea0a00a70993a115b58f9e995c', 2147483647, 0x613a323a7b693a303b733a32343a22417274696b656c64657461696c7320696e204c616765726e223b693a313b4e3b7d),
('0b727c4ede7cb592f052a221ba7cae3a', 2147483647, 0x613a323a7b693a303b733a31333a224e616d612050656e6767756e61223b693a313b4e3b7d),
('0be2d1a313ca185900fc2844b6948c34', 2147483647, 0x613a323a7b693a303b733a31313a2247616d62617220556e6974223b693a313b4e3b7d),
('0e091d4e28bf06d2c6fa7389ce5baff6', 2147483647, 0x613a323a7b693a303b733a363a224372c3a9c3a9223b693a313b4e3b7d),
('0ebb080121484687598115e747f09973', 2147483647, 0x613a323a7b693a303b733a33363a22556e6974c3a920656e646f6d6d6167c3a96520657420656e2072c3a97061726174696f6e223b693a313b4e3b7d),
('0ec1fe9a5b96b836ec58c152e0ebe881', 2147483647, 0x613a323a7b693a303b733a37323a2245696e68656974205043412d303030312d3030303120766f6e20467265646479207a7572c3bc636b6765676562656e2c20766f6e20537570657261646d696e20657268616c74656e223b693a313b4e3b7d),
('103f454413cdb288fe4a28d90e58f1d7', 2147483647, 0x613a323a7b693a303b733a35333a22556e6974206261727520506161202d30303031202d3030363520646974616d6261686b616e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('106b01cddacaaf5e4953142e41a61a94', 2147483647, 0x613a323a7b693a303b733a32353a2242656e75747a65722d4265737563687370726f746f6b6f6c6c223b693a313b4e3b7d),
('1073ef0da0e33e4808893a4bda290373', 2147483647, 0x613a323a7b693a303b733a33353a224a756d6c61682053617475616e204b616c692079616e6720446970696e6a616d6b616e223b693a313b4e3b7d),
('112444df135ded5b8efc403ed0891ce9', 2147483647, 0x613a323a7b693a303b733a32313a2256657277656e64756e677370726f746f6b6f6c6c65223b693a313b4e3b7d),
('1191dd1eb0777e39110eaf347606cbdf', 2147483647, 0x613a323a7b693a303b733a31313a2250696c69682042756c616e223b693a313b4e3b7d),
('11d8e8ac264faf2a21b4fc43fb850208', 2147483647, 0x613a323a7b693a303b733a31323a225574696c6973617465757273223b693a313b4e3b7d),
('1279c37f6d10163576fff58e3dcfe095', 2147483647, 0x613a323a7b693a303b733a36363a2245696e68656974205041412d303030312d30303031207265706172696572742e20566f6d20537570657261646d696e20696e73204c61676572206765627261636874223b693a313b4e3b7d),
('12bed4d0992fd65e3d0bfa236291d074', 2147483647, 0x613a323a7b693a303b733a31393a2256657266c3bc6762617220696d204c61676572223b693a313b4e3b7d),
('12fbf2614da446a3694e7ed7db71fdcb', 1735093363, 0x613a323a7b693a303b733a32303a2241646d696e2d4c61676572207a7577656973656e223b693a313b4e3b7d),
('130c7bf44f4f33353534456b72b4f634', 2147483647, 0x613a323a7b693a303b733a363a22537461747573223b693a313b4e3b7d),
('134d7765239e6f7631a42cc631d30b1c', 2147483647, 0x613a323a7b693a303b733a363a224b656c756172223b693a313b4e3b7d),
('147482cbd9604f02604241d43c0dcd81', 2147483647, 0x613a323a7b693a303b733a31373a2246696c652059616e672044696861707573223b693a313b4e3b7d),
('147ef379ba3c7d2207a7549a138b10ac', 2147483647, 0x613a323a7b693a303b733a31363a224d656d627561742050656e6767756e61223b693a313b4e3b7d),
('14eacec7263a830534b4e2a5d30a55b2', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('15683b3a1425a9231a9bacda735efa79', 2147483647, 0x613a323a7b693a303b733a343a2243617269223b693a313b4e3b7d),
('1679e7b90a9aa9f01ca8fa2a5d2f4193', 2147483647, 0x613a323a7b693a303b733a31333a2250656e67656d62616c69616e20223b693a313b4e3b7d),
('17044500687fc7199fcce2b0415d53ef', 2147483647, 0x613a323a7b693a303b733a3132333a2241646d696e2057617265686f7573652c20616b756e20416e646120746964616b206d656d696c696b692057617265686f7573652079616e6720646974657461706b616e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('171bac0e635828f790381d4d3689421c', 2147483647, 0x613a323a7b693a303b733a39363a2241646d696e20677564616e6720746964616b206469697a696e6b616e206d656e616d6261686b616e20756e6974206b6520677564616e67206c61696e2079616e672062756b616e2074656d706174206d6572656b6120646974756761736b616e223b693a313b4e3b7d),
('1737312afb6ecd9024aaf1dedfa8deb3', 2147483647, 0x613a323a7b693a303b733a37313a2245696e68656974205041412d303030312d3030303120766f6e204a6f68616e207a7572c3bc636b6765676562656e2c20766f6d20537570657261646d696e20657268616c74656e223b693a313b4e3b7d),
('17de87b5c31987ae676ac3c8f5b85db2', 2147483647, 0x613a323a7b693a303b733a33353a2241706120416e64612079616b696e20696e67696e206d656e67686170757320696e693f223b693a313b4e3b7d),
('1858f50649cdf450bab4378abefcc697', 2147483647, 0x613a323a7b693a303b733a373a22496e616b746976223b693a313b4e3b7d),
('1889d14e979c72fe1bd6cb44e4672a18', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('18dd1e88e4a953a2e66380508713d866', 1735093346, 0x613a323a7b693a303b733a32343a22417274696b656c2d4461726c6568656e7362657269636874223b693a313b4e3b7d),
('19586ffb81a02ec8d793b72557824f9c', 2147483647, 0x613a323a7b693a303b733a32313a2244657461696c204974656d20446920477564616e67223b693a313b4e3b7d),
('1aafc8ca737419c5b6102e5223641380', 2147483647, 0x613a323a7b693a303b733a33323a22426172616e67204469204b616e746f7220477564616e672053656d6172616e67223b693a313b4e3b7d),
('1ae9034136e035ba5cbaca6238ce1c42', 1735093361, 0x613a323a7b693a303b733a383a2242656e75747a6572223b693a313b4e3b7d),
('1b1f3e55cc07dd3846cfe77408fd6f44', 2147483647, 0x613a323a7b693a303b733a31343a22476573616d7420417274696b656c223b693a313b4e3b7d),
('1b66e3b92d34558e5efc26d3326229ff', 2147483647, 0x613a323a7b693a303b733a31323a224e616d61204265726b617320223b693a313b4e3b7d),
('1baaed5262afa015c96379a445d5cf6c', 1735093327, 0x613a323a7b693a303b733a31363a2245696e68656974207665726c6f72656e223b693a313b4e3b7d),
('1c18ff64083d085bd240a81ea1ea3178', 2147483647, 0x613a323a7b693a303b733a38303a22e180a1e1809ee180afe180b6e180b8e18095e180bce180afe1809ee180b020e180a1e1809ce1808ae180bae180a1e18095e18090e180ba20e18099e180bee18090e180bae18090e18099e180bae180b8223b693a313b4e3b7d),
('1c1a8beb309873dd7cd25d619efa94f1', 2147483647, 0x613a323a7b693a303b733a383a224b6f6d656e746172223b693a313b4e3b7d),
('1c1f9fa4f1ab1914cd780c9fb3003163', 1735093402, 0x613a323a7b693a303b733a31353a224461667461722050696e6a616d616e223b693a313b4e3b7d),
('1d0a25ea7667cccb839fdc81eb1638bb', 1735093443, 0x613a323a7b693a303b733a31373a22556c616e6769206b6174612073616e6469223b693a313b4e3b7d),
('1d495707a70b9a13da395a15a8feb541', 2147483647, 0x613a323a7b693a303b733a34353a22e18081e180bbe180b1e180b8e18084e180bde180b1e18099e180bee18090e180bae18090e18099e180bae180b8223b693a313b4e3b7d),
('1e69f2197b7d2e62fd08d7917609aeef', 2147483647, 0x613a323a7b693a303b733a36363a22e1809ae180b0e18094e18085e180bae18081e180bbe180b1e180b8e18084e180bde180b1e180a1e18085e180aee1809be18084e180bae18081e180b6e18085e180ac223b693a313b4e3b7d),
('1fe64a5cdc1994216a1a7969d9d37967', 2147483647, 0x613a323a7b693a303b733a31363a2254616d6261686b616e20477564616e67223b693a313b4e3b7d),
('207d658a76603f9e09022b6fcb399b7c', 2147483647, 0x613a323a7b693a303b733a31313a22546964616b20416b746966223b693a313b4e3b7d),
('20b5da0c9bbbe252b8353883eacebefe', 2147483647, 0x613a323a7b693a303b733a31313a224d69746172626569746572223b693a313b4e3b7d),
('20f2db3ccc71bda45a21b7310cf4550f', 2147483647, 0x613a323a7b693a303b733a35383a22e18085e180aee18099e180b6e18081e18094e180b7e180bae18081e180bde180b2e18099e180bee180af20e18099e180aee18094e180b0e180b8223b693a313b4e3b7d),
('21df02c8610fb6755edd182b30c53817', 2147483647, 0x613a323a7b693a303b733a35303a22477564616e67206d61736968206d656e79696d70616e20626172616e67202d20626172616e672064692064616c616d6e7961223b693a313b4e3b7d),
('21ebcae4553c64373dd9bf060f384669', 2147483647, 0x613a323a7b693a303b733a31333a225370726163686175737761686c223b693a313b4e3b7d),
('21f93b737da5ced9a41e1d29215d825c', 2147483647, 0x613a323a7b693a303b733a3132373a22477564616e672041646d696e2e20416b756e20416e646120746964616b206d656d696c696b6920477564616e672079616e6720646974657461706b616e20756e74756b206974752e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('223aa1df008299499fd7348b7d30e4fc', 1735093441, 0x613a323a7b693a303b733a373a2255706461746564223b693a313b4e3b7d),
('224c578c40263d42574c1d14ffa99baa', 2147483647, 0x613a323a7b693a303b733a38363a224b6172796177616e20746964616b20646170617420646968617075732e2053617475616e20626172616e672079616e67206d6173696820646970696e6a616d6b616e206b6570616461206b6172796177616e20696e69223b693a313b4e3b7d),
('2367836179fdb4cb0c8807faf6876fe2', 2147483647, 0x613a323a7b693a303b733a353a22446174756d223b693a313b4e3b7d),
('243d3b37660142d9105f5a208f854db0', 2147483647, 0x613a323a7b693a303b733a36373a22556e697420564441202d30303032202d303030312064696b656d62616c696b616e206f6c6568204f6c65672c206469746572696d61206f6c65682061707061646d696e223b693a313b4e3b7d),
('24681e30c3c2888e3404743c527ca340', 2147483647, 0x613a323a7b693a303b733a31383a2242756174204b617465676f7269204974656d223b693a313b4e3b7d),
('247b974371055c0f77624dd901414f7d', 1735093390, 0x613a323a7b693a303b733a31313a2247616d626172204974656d223b693a313b4e3b7d),
('2494ca0d9e452f7dabc9c02cd8fb6c8d', 2147483647, 0x613a323a7b693a303b733a31383a22416b7475656c6c65732050617373776f7274223b693a313b4e3b7d),
('24c232fe6ecdd32037281e4be5bdce2f', 2147483647, 0x613a323a7b693a303b733a33333a22417274696b656c20696d204c61676572204a4f4720434f4e444f4e474341545552223b693a313b4e3b7d),
('24c93e227a88bea3474d7de60a5b9d46', 2147483647, 0x613a323a7b693a303b733a32383a224d617373656e2d55706c6f61642066c3bc722045696e68656974656e223b693a313b4e3b7d),
('251755454e68e05458dfbddddcc7bd32', 2147483647, 0x613a323a7b693a303b733a37333a22e1809ae180b0e18094e18085e180bae180a1e1809ee180afe180b6e180b8e18095e180bce180afe18099e180bee180af20e18099e180bee18090e180bae18090e18099e180bae180b8223b693a313b4e3b7d),
('255d14c2cced0a319836b5f506ccbd45', 2147483647, 0x613a323a7b693a303b733a353a226a656e6973223b693a313b4e3b7d),
('25640547e982846e2587036dc7496332', 2147483647, 0x613a323a7b693a303b733a36303a2245696e68656974205041412d303030312d3030303120766f6d20537570657261646d696e207a75722052657061726174757220676573636869636b74223b693a313b4e3b7d),
('25c67a9c34a6889800d15be7086896d8', 2147483647, 0x613a323a7b693a303b733a32383a2257c3a4686c656e205369652065696e65205370726163686520617573223b693a313b4e3b7d),
('266a8501eb03a7ad79ea1d37e99b5db6', 2147483647, 0x613a323a7b693a303b733a35363a2245696e68656974205043412d303030312d3030303120766f6e20537570657261646d696e20616e20467265646479207665726c696568656e223b693a313b4e3b7d),
('27b95626178b84fabfe90c41fd4c4a9d', 2147483647, 0x613a323a7b693a303b733a32343a2254c3a96cc3a963686172676572206c27686973746f697265223b693a313b4e3b7d),
('27d3a4de2bd78b917681c9b938f7cf96', 1735093400, 0x613a323a7b693a303b733a31303a2250656d696e6a616d616e223b693a313b4e3b7d),
('27e29450577a5b917122b596ce98e022', 2147483647, 0x613a323a7b693a303b733a31373a224b6f6e6669726d6173692053696d70616e223b693a313b4e3b7d),
('27fc09aa8288e1e2c38b6fb63cc6b5a6', 2147483647, 0x613a323a7b693a303b733a36343a22e18095e180bce180afe18095e180bce18084e180bae18099e180bee180afe180a1e18090e180bde18084e180bae180b820e1809ae180b0e18094e18085e180ba223b693a313b4e3b7d),
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
('2d183e2412a7560b6e9d66e64c4deb13', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('2d19ba7acd0a4dac9db596f0cfb68640', 2147483647, 0x613a323a7b693a303b733a31373a225065726261696b616e2044696d756c6169223b693a313b4e3b7d),
('2d3e68568f2536fc74f43ee541ee84e8', 1735093358, 0x613a323a7b693a303b733a31323a224172626569746e65686d6572223b693a313b4e3b7d),
('2d606dfe6a3e063f5ff6a049f3fe6bde', 2147483647, 0x613a323a7b693a303b733a31343a2253657269656e6e756d6d65723a20223b693a313b4e3b7d),
('2e07de5d75aba8a7c6bf7365730def81', 2147483647, 0x613a323a7b693a303b733a31333a224c61676572616472657373653a223b693a313b4e3b7d),
('2e75736f34cb692650ceeb0a074aaab3', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420506161202d30303031202d303030312064696b6972696d20756e74756b2064697065726261696b69206f6c656820737570657261646d696e223b693a313b4e3b7d),
('30e7e57eb898cb5c8a133c125150b30d', 1735093335, 0x613a323a7b693a303b733a31373a22417274696b656c204b617465676f726965223b693a313b4e3b7d),
('3119f35bb188d5e48b15a91a87354615', 2147483647, 0x613a323a7b693a303b733a36323a22556e697420544341202d30303031202d3030303220646970696e6a616d6b616e206b657061646120467265646479206f6c656820737570657261646d696e223b693a313b4e3b7d),
('3142eea0be11a9f967e8800ab32cefd4', 2147483647, 0x613a323a7b693a303b733a34303a22e18084e180bde180b1e18081e180bbe180b1e180b8e18081e180bce18084e180bae180b8e1818a20223b693a313b4e3b7d),
('3196ad40154b177f4376b6fe3e4188cc', 2147483647, 0x613a323a7b693a303b733a32313a224a6f75726e616c2064277574696c69736174696f6e223b693a313b4e3b7d),
('32336e70d136fb76a26933087ea215ac', 2147483647, 0x613a323a7b693a303b733a34333a224dc3b6636874656e2053696520646965204461746569656e207769726b6c696368206cc3b6736368656e3f223b693a313b4e3b7d),
('32e48236de3dd4e004b40f3fb9d4e85f', 2147483647, 0x613a323a7b693a303b733a32313a22e1809de18094e180bae18091e18099e180bae180b8223b693a313b4e3b7d),
('330cf4581138dba05a34a3913d5c695b', 2147483647, 0x613a323a7b693a303b733a38333a224b6172796177616e20746964616b20646170617420646968617075732e2041646120626172616e672079616e67206d6173696820646970696e6a616d6b616e206b6570616461206b6172796177616e20696e69223b693a313b4e3b7d),
('3313c2d44e608c59f2fb6020c1e1f21a', 2147483647, 0x613a323a7b693a303b733a35313a22e18095e180bbe18080e180bae18085e180aee180b8e18094e180b1e1809ee180b1e180ace1809ae180b0e18094e18085e180ba223b693a313b4e3b7d),
('345a744dac1df6457b2986ddc84c5567', 2147483647, 0x613a323a7b693a303b733a31363a22526170706f7274206465207072c3aa74223b693a313b4e3b7d),
('348fa1ecbb72a6c30aaec4bab27dc778', 1735093376, 0x613a323a7b693a303b733a31373a2254616d626168206974656d20626172752e223b693a313b4e3b7d),
('34b7c68c032774412ab29f3e84cf988e', 2147483647, 0x613a323a7b693a303b733a33393a225a7573616d6d656e66617373756e67206465722052657061726174757270726f746f6b6f6c6c65223b693a313b4e3b7d),
('34bd79604db7867e6be6ea26cda7639b', 2147483647, 0x613a323a7b693a303b733a343a2254697065223b693a313b4e3b7d),
('35649a1ef35e050231b8b929ffc99ff1', 2147483647, 0x613a323a7b693a303b733a31303a224b65746572616e67616e223b693a313b4e3b7d),
('35f2ace049ca571a22760487c6ef8bb3', 2147483647, 0x613a323a7b693a303b733a383a224e6f70656d626572223b693a313b4e3b7d),
('367c9510ff83db6c592ad903bb748227', 2147483647, 0x613a323a7b693a303b733a31333a224e616d61204b617465676f7269223b693a313b4e3b7d),
('37055e639af81d71af6a842b3227143d', 2147483647, 0x613a323a7b693a303b733a31353a2255626168206b6174612073616e6469223b693a313b4e3b7d),
('383a8e36a3555b5afe7949764d2a3f87', 2147483647, 0x613a323a7b693a303b733a353a22456d61696c223b693a313b4e3b7d),
('387aefb09f644d6d4618ff810abe19f9', 2147483647, 0x613a323a7b693a303b733a32303a22446970696e6a616d2f446970696e6a616d6b616e223b693a313b4e3b7d),
('389f860baa888f65a1abf56512661d77', 2147483647, 0x613a323a7b693a303b733a35393a22556e697420507561202d30303031202d3030303320646970696e6a616d6b616e206b65205368696f72696e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('3a315be6b9a8bce0745149a7df4c33d3', 2147483647, 0x613a323a7b693a303b733a37313a22556e697420544341202d30303031202d303030322064696b656d62616c696b616e206f6c6568204672656464792c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('3b0b0045885337ebceed1a6951478b6a', 2147483647, 0x613a323a7b693a303b733a36373a2245696e68656974205041412d303030312d30303031207a75722052657061726174757220647572636820626f627468657265706169726d616e20676573636869636b74223b693a313b4e3b7d),
('3bf4ebdb42dccef17c480efd6c16c5b0', 2147483647, 0x613a323a7b693a303b733a33383a22416666656374657220756e2061646d696e697374726174657572206427656e74726570c3b474223b693a313b4e3b7d),
('3bf96d8b774f7d1bbd716bd91ddf0f03', 2147483647, 0x613a323a7b693a303b733a393a224261756d7374616d6d223b693a313b4e3b7d),
('3cbb8931c3c701ee040cb91e381cf970', 2147483647, 0x613a323a7b693a303b733a31363a22417274696b656c20696d204c61676572223b693a313b4e3b7d),
('3d3601291f756c732954f7414875a441', 1735093360, 0x613a323a7b693a303b733a31313a2241646d696e204d656ec3bc223b693a313b4e3b7d),
('3db3588d8931c52bb891470f7f1138f6', 2147483647, 0x613a323a7b693a303b733a33363a225065726261696b616e2044696d756c61692e205065726261696b616e2064697475747570223b693a313b4e3b7d),
('3e7b989110d8baedb992683b51807a0f', 2147483647, 0x613a323a7b693a303b733a383a22456d706c6f79c3a9223b693a313b4e3b7d),
('3e8a366f2f820cd5ca7faf4004d2a9fa', 2147483647, 0x613a323a7b693a303b733a33313a22556e69742064697065726261696b692064616e20646970657262617275692e223b693a313b4e3b7d),
('3ecd72f2ca0098638d5e63f255eb256c', 2147483647, 0x613a323a7b693a303b733a31313a224e616d6120477564616e67223b693a313b4e3b7d),
('3f48a8ce14738edc537a0e4ee03ed17f', 2147483647, 0x613a323a7b693a303b733a373a2253707261636865223b693a313b4e3b7d),
('3ffa962447c7c4bd3634707b912ec49d', 2147483647, 0x613a323a7b693a303b733a32373a22417274696b656c6b617465676f7269652061757377c3a4686c656e223b693a313b4e3b7d),
('402aa72faae3c30e3d1777d4753941d7', 2147483647, 0x613a323a7b693a303b733a35363a22556e697420564441202d30303032202d3030303120646970696e6a616d6b616e206b65204f6c6567206f6c656820737570657261646d696e223b693a313b4e3b7d),
('40d6cbba7e73bba0549973eea4a08ef2', 2147483647, 0x613a323a7b693a303b733a32343a2254616d6261686b616e20556e6974204974656d2042617275223b693a313b4e3b7d),
('40d8d692a44654fb72e3ca69498e3f65', 2147483647, 0x613a323a7b693a303b733a373a2254656c65666f6e223b693a313b4e3b7d),
('419f3c1c370803df8a5b173771eadb99', 2147483647, 0x613a323a7b693a303b733a32313a22456c656d656e7420616b7475616c6973696572656e223b693a313b4e3b7d),
('43165f079f514323ff689e807ab4fade', 1735093353, 0x613a323a7b693a303b733a31393a22476572c3a47420696e20526570617261747572223b693a313b4e3b7d),
('438a8fc894c083e26e925d3202d66b0b', 2147483647, 0x613a323a7b693a303b733a31363a224c6973746520646573207072c3aa7473223b693a313b4e3b7d),
('43b43daf2550ca1911a4a90a44b83111', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('4483fa000f4b10fd1b635728d31a2ba3', 2147483647, 0x613a323a7b693a303b733a363a22417567757374223b693a313b4e3b7d),
('450dd88c120ce040f2529638378c61c8', 2147483647, 0x613a323a7b693a303b733a35343a224b6f6d6d656e74617220736f6c6c746520496e666f726d6174696f6e656e207a75722052657061726174757220656e7468616c74656e223b693a313b4e3b7d),
('462406725e5124fadeb6854442dd5961', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('46299eccd937c95ac85d31870d8322f5', 2147483647, 0x613a323a7b693a303b733a31373a224361746174616e205065726261696b616e223b693a313b4e3b7d),
('4695dffb82c67dbda5d83ed24609471e', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('4748331ec4b4b314e5b3e36e420d2716', 2147483647, 0x613a323a7b693a303b733a373a2254616e6767616c223b693a313b4e3b7d),
('4908e844bace6c08e41838ea603ff058', 2147483647, 0x613a323a7b693a303b733a32343a22456b73706f722044617461204c6f67206b65202e786c7378223b693a313b4e3b7d),
('493ad1b792334a1b8030b7f342942dea', 2147483647, 0x613a323a7b693a303b733a343a224e616d61223b693a313b4e3b7d),
('4992018ac6f4a2db89bd03ed01de9ee7', 2147483647, 0x613a323a7b693a303b733a34333a22556e7769656465726272696e676c696368206265736368c3a464696774206f646572207665726c6f72656e223b693a313b4e3b7d),
('4a08c572e1f9ba38b029e2621fa7f60b', 2147483647, 0x613a323a7b693a303b733a36343a22e18085e18080e180ace180b8e1809de180bde18080e180b9e180a1e180ace180b820e18091e18095e180b9e1809be180ade180afe18080e180b9e18095e180ab223b693a313b4e3b7d),
('4ad5a55dced16e2ab8b1fd4d4fd8e28d', 2147483647, 0x613a323a7b693a303b733a3130363a2245696e68656974205041412d303030322d30303031207a7572c3bc636b6765676562656e20766f6e204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e2c20657268616c74656e20766f6e20537570657261646d696e223b693a313b4e3b7d),
('4ae7330e288eaa3088802212a04f5256', 2147483647, 0x613a323a7b693a303b733a39323a224e6f6d6f722073657269202750413234202d30303031202d3030363820272e2041646d696e20677564616e6720746964616b206469697a696e6b616e206d656e616d6261686b616e20756e6974206b6520677564616e67206c61696e223b693a313b4e3b7d),
('4ceaf947af315e14c419e6876db4d23d', 2147483647, 0x613a323a7b693a303b733a31383a225665726c69657274206f646572207a65722d223b693a313b4e3b7d),
('4d7ef5af824a5699c218abe00aea9f0f', 2147483647, 0x613a323a7b693a303b733a31363a2254616d70696c6b616e2047616d626172223b693a313b4e3b7d),
('4eff03e181bc78d5f3c129ceef8936ad', 2147483647, 0x613a323a7b693a303b733a373a224f6b746f626572223b693a313b4e3b7d),
('4ff7e6791ffc2051fd51688255453ec7', 2147483647, 0x613a323a7b693a303b733a353a2253656d7561223b693a313b4e3b7d),
('5001f80eceee17bf7573e19e6cd6e13d', 1735093330, 0x613a323a7b693a303b733a343a2242696c64223b693a313b4e3b7d),
('50160e6afc25ddfd481d1ea3d03b5776', 2147483647, 0x613a323a7b693a303b733a36393a22556e697420506161202d30303031202d303030322064696b656d62616c696b616e206f6c6568204f6c65672c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('508cd682899e906086929b60b2584e05', 2147483647, 0x613a323a7b693a303b733a31343a2250696e6a616d6b616e20556e6974223b693a313b4e3b7d),
('50d23186107c3ae0d6844cf9b091f5d5', 2147483647, 0x613a323a7b693a303b733a393a22477564616e67204944223b693a313b4e3b7d),
('510e12c841471e8a87a9c7ae6657b2d8', 2147483647, 0x613a323a7b693a303b733a39303a2245696e68656974205043412d303030322d3030303420766f6e20537570657261646d696e20616e204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e207665726c696568656e223b693a313b4e3b7d),
('51774da7ccec300cb09c4416fa7290c2', 2147483647, 0x613a323a7b693a303b733a31343a22417274696b656c64657461696c73223b693a313b4e3b7d),
('519e70f2ab8654bd476f06c282236050', 2147483647, 0x613a323a7b693a303b733a32333a2275626168206b6174612073616e64692073656e64697269223b693a313b4e3b7d),
('525cbf30ba1ef80c679f89546d0830ed', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420506161202d30303031202d3030303120646970696e6a616d6b616e206b6570616461204a6f68616e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('528871360210fb0643b6eab032409b88', 2147483647, 0x613a323a7b693a303b733a3131323a224d656e756761736b616e20677564616e67206b652061646d696e20616b616e206d656d62617461736920616b756e20616761722068616e7961206461706174206d656e67616b736573206974656d202620677564616e672074656d706174206d6572656b6120646974756761736b616e223b693a313b4e3b7d),
('52e229ce9747932a9b64644115b8aa7b', 2147483647, 0x613a323a7b693a303b733a33393a22e18081e180bbe180b1e180b8e18084e180bde180b1e18085e180ace1809be18084e180bae180b8223b693a313b4e3b7d),
('52fd6b029edd8aaf26bfc9d8e682cc12', 2147483647, 0x613a323a7b693a303b733a36323a22556e697420504341202d30303031202d3030303120646970696e6a616d6b616e206b657061646120467265646479206f6c656820737570657261646d696e223b693a313b4e3b7d),
('534f18c9afa48a0eba3764dd0c285948', 2147483647, 0x613a323a7b693a303b733a32393a224c65626968206461726920333635206861726920283120746168756e29223b693a313b4e3b7d),
('5380c64866f5526afec242fe52093d65', 2147483647, 0x613a323a7b693a303b733a31383a2254616d6261686b616e2070656e6767756e61223b693a313b4e3b7d),
('53d0b1b185589e86817d46e1ae93aae9', 2147483647, 0x613a323a7b693a303b733a31323a2253657269656e6e756d6d6572223b693a313b4e3b7d),
('5455a1ac9aadc9fae67065a074f077c9', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('55341ca9e7d8c0eb26397729ccd8c3db', 2147483647, 0x613a323a7b693a303b733a32333a224d697461726265697465722068696e7a7566c3bc67656e223b693a313b4e3b7d),
('556e1677b17d05b93d515c48288a3930', 2147483647, 0x613a323a7b693a303b733a31393a2250726f746f6b6f6c6c646174756d20456e6465223b693a313b4e3b7d),
('558c2b3fc3f04f256aa58b0af2ebea13', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('55fb9439a304fe88449a68920d51361d', 2147483647, 0x613a323a7b693a303b733a31323a22696e20526570617261747572223b693a313b4e3b7d),
('571eb69979a128ec12f4c947937ae7cc', 2147483647, 0x613a323a7b693a303b733a383a2241626d656c64656e223b693a313b4e3b7d),
('575e89b3d42368e1ebcc65f28c075156', 2147483647, 0x613a323a7b693a303b733a33343a22496e2052657061726174757220626566696e646c696368652045696e68656974656e223b693a313b4e3b7d),
('5825e2391dbfd7ee39232f6e5aa8f53f', 2147483647, 0x613a323a7b693a303b733a31363a224c65696368746572205363686164656e223b693a313b4e3b7d),
('58686d4932c57747f1d19d0e13f83afe', 2147483647, 0x613a323a7b693a303b733a31373a225065726261696b616e2044696d756c6169223b693a313b4e3b7d),
('58b41f104ab8b556b89bfac61b8bd7ae', 2147483647, 0x613a323a7b693a303b733a31383a2250696c6968204b6f6e6469736920556e6974223b693a313b4e3b7d),
('58b883f0d8fad0662c6280c9ef43b4af', 2147483647, 0x613a323a7b693a303b733a39393a2241646d696e2057617265686f7573652e20546964616b206164612057617265686f7573652061737369676e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('58f7ea520b516328a47f41cb9c78bbc3', 2147483647, 0x613a323a7b693a303b733a32373a22c3846c74657220616c732037205461676520283120576f63686529223b693a313b4e3b7d),
('591b1f56813da3255af4562b4852c848', 2147483647, 0x613a323a7b693a303b733a31313a22417274696b656c62696c64223b693a313b4e3b7d),
('591dcd573a871680349e9886b7578b95', 1735093407, 0x613a323a7b693a303b733a32313a224c61706f72616e2050696e6a616d616e20556e6974223b693a313b4e3b7d),
('594974c10bbd6a6eda5e6c9e981e6803', 2147483647, 0x613a323a7b693a303b733a33303a225245504152415455522d5645525343484c4f5353454e45205354454c4c45223b693a313b4e3b7d),
('59eeac8381ed5999241e4065b46817d4', 2147483647, 0x613a323a7b693a303b733a32303a224368616e676572206d6f74206465207061737365223b693a313b4e3b7d),
('59fc23cde5e84fce44f5046709540730', 2147483647, 0x613a323a7b693a303b733a39313a2241646d696e20677564616e6720746964616b206469697a696e6b616e20756e74756b206d656e616d6261686b616e20756e6974206b6520677564616e67206c61696e2079616e6720746964616b20646974756761736b616e206b65223b693a313b4e3b7d),
('5a2a8653b88b31d9a84d1535e85189c4', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420564441202d30303034202d3030303320646970696e6a616d6b616e206b6570616461204a6f68616e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('5a9bffad9c2bf01b40913e1b549027e3', 2147483647, 0x613a323a7b693a303b733a31383a22556e69742079616e67205465727365646961223b693a313b4e3b7d),
('5ac066619ee86373a0f8b0d6bccca294', 1735093434, 0x613a323a7b693a303b733a31303a224d656e752041646d696e223b693a313b4e3b7d),
('5c24946af1077f00a8fa7c66c5def809', 2147483647, 0x613a323a7b693a303b733a343a224a756c69223b693a313b4e3b7d),
('5ca62e4018976cb07a869c5dc315cad9', 1735093428, 0x613a323a7b693a303b733a363a22477564616e67223b693a313b4e3b7d),
('5cce5f7a376d69595c9183051ba1d474', 2147483647, 0x613a323a7b693a303b733a32333a224c656968656e205369652065696e652045696e68656974223b693a313b4e3b7d),
('5cea664332eb87146e64b264bcc7f8b1', 2147483647, 0x613a323a7b693a303b733a31353a2247c3a9726572206c27756e6974c3a9223b693a313b4e3b7d),
('5d743cf17417089a96e3a7ec194c6b78', 1735093343, 0x613a323a7b693a303b733a31323a225665726c6569686c69737465223b693a313b4e3b7d),
('5df4429e94412a8254634c3b8270fa9e', 2147483647, 0x613a323a7b693a303b733a33333a2254616d6261686b616e20556e69742064616c616d204a756d6c6168204265736172223b693a313b4e3b7d),
('5ede393dbf386afaeec45ff403f593ef', 2147483647, 0x613a323a7b693a303b733a31373a224361746174616e205065726261696b616e223b693a313b4e3b7d),
('5f25bfbe8c654089942e54c22c27f221', 2147483647, 0x613a323a7b693a303b733a31323a2249642057617265686f757365223b693a313b4e3b7d),
('5f2fb05825fb47e4fbfca3f7ad5b67aa', 2147483647, 0x613a323a7b693a303b733a31333a22416c616d617420477564616e67223b693a313b4e3b7d),
('602811cbab7fa6e4b3782b15fc74fb10', 1735093310, 0x613a323a7b693a303b733a32313a22652d6d61696c202862657374c3a4746967656e293a223b693a313b4e3b7d),
('6145c654bb14be0968701c2cc59c1eb7', 2147483647, 0x613a323a7b693a303b733a383a2254756761736b616e223b693a313b4e3b7d),
('6202a1d6744074f5ed42bd21b9669ff9', 2147483647, 0x613a323a7b693a303b733a363a22537461747573223b693a313b4e3b7d),
('629b328c7d698cd7b86a725f41f3616c', 2147483647, 0x613a323a7b693a303b733a32353a2252c3a970c3a9746572206c65206d6f74206465207061737365223b693a313b4e3b7d),
('62a898fcf6914b3b71aebcc6e4451b0d', 1735093377, 0x613a323a7b693a303b733a32303a22456b73706f722044617461206b65202e786c7378223b693a313b4e3b7d),
('633c5bf069d539e078d850c81f08f05a', 2147483647, 0x613a323a7b693a303b733a36363a22556e697420506161202d30303031202d303030312064696b6972696d20756e74756b2064697065726261696b69206f6c656820626f627468657265706169726d616e223b693a313b4e3b7d),
('6360fdaad318b3ed534d4940cf61f871', 2147483647, 0x613a323a7b693a303b733a31333a224b6f6465204b617465676f7269223b693a313b4e3b7d),
('636650e489a7a1c941618180a603b6f6', 1735093344, 0x613a323a7b693a303b733a31343a224b7265646974686973746f726965223b693a313b4e3b7d),
('64e6cd68c65748abd22eefb1c7542973', 2147483647, 0x613a323a7b693a303b733a31343a22576172656e6c616765726e616d65223b693a313b4e3b7d),
('652b0ef63c82fb454e3f12bba142d6f8', 1735093387, 0x613a323a7b693a303b733a31313a22556e69742048696c616e67223b693a313b4e3b7d),
('65fcf2ae37cbed7aa9035a4623afe79f', 1735093384, 0x613a323a7b693a303b733a31343a22536564616e6720446970616b6169223b693a313b4e3b7d),
('66031ce78a6d5fd5adf992573e3e359d', 2147483647, 0x613a323a7b693a303b733a37333a22e18095e18085e180b9e18085e1808ae180bae180b8e18081e180bbe180b1e180b8e18084e180bde180b120e180a1e18085e180aee1809be18084e180bae18081e180b6e18085e180ac223b693a313b4e3b7d),
('66544bedead1543694d571fa93818568', 1735093333, 0x613a323a7b693a303b733a383a22496e76656e746172223b693a313b4e3b7d),
('67798973f55184d3ad58c2f1c724b16b', 2147483647, 0x613a323a7b693a303b733a373a2254656c65706f6e223b693a313b4e3b7d),
('680d65da73d7d1a6dbfe558f06730a93', 2147483647, 0x613a323a7b693a303b733a33363a2250726174696e6a617520556e69742079616e6720416b616e20446974616d6261686b616e223b693a313b4e3b7d),
('6864aecd84141eb98890555ff46d4d5f', 2147483647, 0x613a323a7b693a303b733a34353a22527573616b2079616e6720746964616b2064617061742064697065726261696b6920617461752048696c616e67223b693a313b4e3b7d),
('69f8ba258d217780a97c0b032dbf0c91', 2147483647, 0x613a323a7b693a303b733a35363a2245696e68656974205041412d303030342d3030303420766f6e20537570657261646d696e20616e20467265646479207665726c696568656e223b693a313b4e3b7d),
('69fa86fb914ea14ed6a4564df596d68c', 1735093323, 0x613a323a7b693a303b733a31313a22496e204765627261756368223b693a313b4e3b7d),
('6abb0a49a58a594275bf562d9293d6ba', 2147483647, 0x613a323a7b693a303b733a353a224d61726574223b693a313b4e3b7d),
('6ae6bf78215fcc6141f6883cc66f0892', 2147483647, 0x613a323a7b693a303b733a34343a2243756b757020727573616b2028746964616b206164612062616769616e2061746175206b6f6d706f6e656e29223b693a313b4e3b7d),
('6af28923c2e66a8d9a3c9bd6019b68c6', 2147483647, 0x613a323a7b693a303b733a33353a2241706120416e64612079616b696e20696e67696e206d656e67686170757320696e693f223b693a313b4e3b7d),
('6b0e8172177c9616a1aca8b5f84eeea2', 2147483647, 0x613a323a7b693a303b733a31353a2244616c616d207065726261696b616e223b693a313b4e3b7d),
('6ca87b923cfdcdadb358bb00286d692a', 1735093352, 0x613a323a7b693a303b733a32303a224265736368c3a464696774652045696e68656974223b693a313b4e3b7d),
('6d3146e8fc60ff7302b1d73245bb8d0f', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('6e32a1ba7d5a2ae24e64aed88d4159a3', 2147483647, 0x613a323a7b693a303b733a393a22456e74726570c3b474223b693a313b4e3b7d),
('6ea5fc7760cae78444737f7e7e2f4c44', 2147483647, 0x613a323a7b693a303b733a31373a22526570617261747572206265656e64656e223b693a313b4e3b7d),
('6f007180d533b963c049c420a95a6fa6', 2147483647, 0x613a323a7b693a303b733a32343a22456967656e65732050617373776f727420c3a46e6465726e223b693a313b4e3b7d),
('6fb9207c472cba42e94c0ebbbf9a52ae', 2147483647, 0x613a323a7b693a303b733a373a2274616e6767616c223b693a313b4e3b7d),
('708bf237e5054f448a75e2cb00a68ebe', 2147483647, 0x613a323a7b693a303b733a31303a224e6f6d6f722053657269223b693a313b4e3b7d),
('717e5fb1a71a948ba1d7a8e1531c0d7b', 2147483647, 0x613a323a7b693a303b733a32383a224c65626968206461726920372068617269202831206d696e67677529223b693a313b4e3b7d),
('71849d3af32f35d6ad18fbe643055c2d', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('718c87f1e0f7c275fb9dbcf125442582', 2147483647, 0x613a323a7b693a303b733a38323a2241646d696e20677564616e6720746964616b206469697a696e6b616e206d656e616d6261686b616e20756e6974206b6520677564616e67206c61696e2079616e6720746964616b20646974756761736b616e223b693a313b4e3b7d),
('7281dd80d00fe72b1174c6e799909816', 2147483647, 0x613a323a7b693a303b733a343a2242756174223b693a313b4e3b7d),
('73243126e4318e1fc7e0520c3350002a', 2147483647, 0x613a323a7b693a303b733a3130353a22556e697420506161202d30303032202d303030312064696b656d62616c696b616e206f6c6568204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e2c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('739d51493833fec7220fb684b62a2440', 2147483647, 0x613a323a7b693a303b733a31323a2245696e686569747362696c64223b693a313b4e3b7d),
('73d68099f2f038538c62b66d5ad57c15', 2147483647, 0x613a323a7b693a303b733a35343a2245696e68656974205644412d303030312d3030303220766f6e20537570657261646d696e20616e204f6c6567207665726c696568656e223b693a313b4e3b7d),
('73e53d2bf952efa127e7cf664337c29a', 2147483647, 0x613a323a7b693a303b733a383a22446973696d70616e223b693a313b4e3b7d),
('743bfb0a5bfec6fdc1e558f3dfceb1bc', 1735093427, 0x613a323a7b693a303b733a31343a2245646974204461746120556e6974223b693a313b4e3b7d),
('7444433bda6f0b2a9ddcc63b2a826f6a', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('75016a5a89cce7da2e3e062e23d9aae4', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420504341202d30303031202d303030312064696b6972696d20756e74756b2064697065726261696b69206f6c656820737570657261646d696e223b693a313b4e3b7d),
('752cf70edc46ffebf37ea53a2521a175', 1735093321, 0x613a323a7b693a303b733a31313a22657268c3a46c746c696368223b693a313b4e3b7d),
('76baacd6a8292d1cb94b04f73e13a291', 2147483647, 0x613a323a7b693a303b733a31383a2256657266c3bc676261726520416e7a61686c223b693a313b4e3b7d),
('76f6b8864a731d3530f2e04185244ccb', 2147483647, 0x613a323a7b693a303b733a35313a22e18095e18085e180b9e18085e1808ae180bae180b8e180a1e18099e180bbe180ade180afe180b8e180a1e18085e180ace180b8223b693a313b4e3b7d),
('7726f95bf7303f0e3d4b49f352ede068', 1732846278, 0x613a323a7b693a303b613a303a7b7d693a313b4e3b7d),
('77ba461790c769597bdee1b790309b28', 1735093379, 0x613a323a7b693a303b733a393a224e616d61204974656d223b693a313b4e3b7d),
('786bebd2cdba16e9cec2ab6126af03ba', 2147483647, 0x613a323a7b693a303b733a31373a224361746174616e206b756e6a756e67616e223b693a313b4e3b7d),
('7907fab8c5abd6fc54d4d9e399dc62b3', 2147483647, 0x613a323a7b693a303b733a33333a22476562656e205369652064656e2050726f746f6b6f6c6c696e68616c742065696e223b693a313b4e3b7d),
('79754ac3f877f036f91c8266c2003d6b', 2147483647, 0x613a323a7b693a303b733a31363a224b65727573616b616e2052696e67616e223b693a313b4e3b7d),
('79b8dbaa5255c551fe01b318597a5fb0', 2147483647, 0x613a323a7b693a303b733a31303a22496e76656e7461697265223b693a313b4e3b7d),
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
('7eae0dcdfaecd4b83f631bac9f7dc808', 2147483647, 0x613a323a7b693a303b733a32333a2253c3a96c656374696f6e6e657a206c61206c616e677565223b693a313b4e3b7d),
('7ed89a95611319f38cdba06695f6cb16', 1735093399, 0x613a323a7b693a303b733a31393a224c6f672050656e6767756e61616e20556e6974223b693a313b4e3b7d),
('7ee0042db71d019ca9e95b0021c8572a', 1735093316, 0x613a323a7b693a303b733a31353a224578706f727420616c7320584c5358223b693a313b4e3b7d),
('7f56c5b23053d8f1fb02e8131cdd1a8f', 2147483647, 0x613a323a7b693a303b733a31333a2254616e6767616c2057616b7475223b693a313b4e3b7d),
('7fbbdf38ba748747955b30f291cb31ed', 2147483647, 0x613a323a7b693a303b733a31333a2242696c6420616e7a656967656e223b693a313b4e3b7d),
('7fe3a2322c83c8c9e724ddebb85ffb19', 2147483647, 0x613a323a7b693a303b733a383a22446573656d626572223b693a313b4e3b7d),
('8070faa5a4cdaae5a133225c5ea8a5d6', 2147483647, 0x613a323a7b693a303b733a31373a225065726261696b616e2044697475747570223b693a313b4e3b7d),
('8071754fb9166757c188194580e5b398', 2147483647, 0x613a323a7b693a303b733a31393a2250657262617275692064617461204974656d3a223b693a313b4e3b7d),
('8085fbb64994f7f791f2fbdfa05fc06b', 2147483647, 0x613a323a7b693a303b733a31323a2244696b656d62616c696b616e223b693a313b4e3b7d),
('809477e476944b718fdd5e4f37b48c7f', 2147483647, 0x613a323a7b693a303b733a31363a22452d6d61696c20636f6e6669726dc3a9223b693a313b4e3b7d),
('81c2b73df6b49d6f1138030a973cda02', 2147483647, 0x613a323a7b693a303b733a31303a224e6f6d6f722053657269223b693a313b4e3b7d),
('81df771d914f87e8ef9555aa42f7ffd4', 2147483647, 0x613a323a7b693a303b733a39363a22556e697420506161202d30303032202d3030303120646970696e6a616d6b616e206b6570616461204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('82060c68a78638564119511ba69d59e0', 1735093305, 0x613a323a7b693a303b733a31323a22416b7475616c697369657274223b693a313b4e3b7d),
('821a0d84c229ddab1467c717cce4f4b3', 2147483647, 0x613a323a7b693a303b733a32313a22486973746f726971756520646573207072c3aa7473223b693a313b4e3b7d),
('826305de605090988ae60e8bcbff0117', 1735093435, 0x613a323a7b693a303b733a383a2250656e6767756e61223b693a313b4e3b7d),
('82f8a54a395e85be3d0ac3c3dbbe0ad9', 2147483647, 0x613a323a7b693a303b733a31373a224c616765722068696e7a7566c3bc67656e223b693a313b4e3b7d);
INSERT INTO `cache` (`id`, `expire`, `data`) VALUES
('8301292eb993d3ff19f0b1cfe988b789', 0, 0x613a323a7b693a303b613a323a7b693a303b4f3a31353a227969695c7765625c55726c52756c65223a31363a7b733a343a226e616d65223b733a353a226465627567223b733a373a227061747465726e223b733a31303a22235e6465627567242375223b733a343a22686f7374223b4e3b733a353a22726f757465223b733a353a226465627567223b733a383a2264656661756c7473223b613a303a7b7d733a363a22737566666978223b623a303b733a343a2276657262223b4e3b733a343a226d6f6465223b4e3b733a31323a22656e636f6465506172616d73223b623a313b733a31303a226e6f726d616c697a6572223b623a303b733a31353a22002a00637265617465537461747573223b4e3b733a31353a22002a00706c616365686f6c64657273223b613a303a7b7d733a32363a22007969695c7765625c55726c52756c65005f74656d706c617465223b733a373a222f64656275672f223b733a32373a22007969695c7765625c55726c52756c65005f726f75746552756c65223b4e3b733a32383a22007969695c7765625c55726c52756c65005f706172616d52756c6573223b613a303a7b7d733a32393a22007969695c7765625c55726c52756c65005f726f757465506172616d73223b613a303a7b7d7d693a313b4f3a31353a227969695c7765625c55726c52756c65223a31363a7b733a343a226e616d65223b733a34333a2264656275672f3c636f6e74726f6c6c65723a5b5c775c2d5d2b3e2f3c616374696f6e3a5b5c775c2d5d2b3e223b733a373a227061747465726e223b733a35363a22235e64656275672f283f503c6134636632363639613e5b5c775c2d5d2b292f283f503c6134376363386339323e5b5c775c2d5d2b29242375223b733a343a22686f7374223b4e3b733a353a22726f757465223b733a32373a2264656275672f3c636f6e74726f6c6c65723e2f3c616374696f6e3e223b733a383a2264656661756c7473223b613a303a7b7d733a363a22737566666978223b623a303b733a343a2276657262223b4e3b733a343a226d6f6465223b4e3b733a31323a22656e636f6465506172616d73223b623a313b733a31303a226e6f726d616c697a6572223b623a303b733a31353a22002a00637265617465537461747573223b4e3b733a31353a22002a00706c616365686f6c64657273223b613a323a7b733a393a22613463663236363961223b733a31303a22636f6e74726f6c6c6572223b733a393a22613437636338633932223b733a363a22616374696f6e223b7d733a32363a22007969695c7765625c55726c52756c65005f74656d706c617465223b733a32393a222f64656275672f3c636f6e74726f6c6c65723e2f3c616374696f6e3e2f223b733a32373a22007969695c7765625c55726c52756c65005f726f75746552756c65223b733a35363a22235e64656275672f283f503c6134636632363639613e5b5c775c2d5d2b292f283f503c6134376363386339323e5b5c775c2d5d2b29242375223b733a32383a22007969695c7765625c55726c52756c65005f706172616d52756c6573223b613a303a7b7d733a32393a22007969695c7765625c55726c52756c65005f726f757465506172616d73223b613a323a7b733a31303a22636f6e74726f6c6c6572223b733a31323a223c636f6e74726f6c6c65723e223b733a363a22616374696f6e223b733a383a223c616374696f6e3e223b7d7d7d693a313b4e3b7d),
('83546fa1312bef027cc65ad769704b3d', 2147483647, 0x613a323a7b693a303b733a31373a22446970657262616861727569206f6c6568223b693a313b4e3b7d),
('8372d9adb8016f208a564384124fcdb0', 1735093303, 0x613a323a7b693a303b733a31353a2245727374656c6c742f4372c3a9c3a9223b693a313b4e3b7d),
('837554f8041fb1b89cac5d466a4cbcaa', 2147483647, 0x613a323a7b693a303b733a32313a22556e6974c3a920656e2072c3a97061726174696f6e223b693a313b4e3b7d),
('83b04c7da6a5a4447f653cdb1a120cae', 2147483647, 0x613a323a7b693a303b733a39343a22e18095e180bae18080e180b9e18085e180aee180b8e180b1e18094e180b1e1809ee180ac202620e180bbe18095e18084e180b9e18086e18084e180b9e180b1e18094e1809ee1808ae180b7e180b920e1809ae180b0e18094e18085e180b9223b693a313b4e3b7d),
('847556c5e7f0b8150d8fe7580f4e381e', 2147483647, 0x613a323a7b693a303b733a393a22416e6d65726b756e67223b693a313b4e3b7d),
('84d5270a34ef78e91f1716525791ce97', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('84e8ecd742279e5713a6d0017dd84a53', 2147483647, 0x613a323a7b693a303b733a363a224b656c756172223b693a313b4e3b7d),
('850a9d100618013fa35b45adad5afb6d', 2147483647, 0x613a323a7b693a303b733a393a22416e73636872696674223b693a313b4e3b7d),
('858d3090ec1148b1a33d3ef6be5ad3a9', 2147483647, 0x613a323a7b693a303b733a3132303a22477564616e672041646d696e2e20416b756e20416e646120746964616b206d656d696c696b6920477564616e672079616e6720646974756761736b616e206b652e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('85fe8cf224832475f4bf8a9d666083e6', 2147483647, 0x613a323a7b693a303b733a36333a2253696e6420536965207369636865722c2064617373205369652064696573656e204d69746172626569746572206cc3b6736368656e206dc3b6636874656e3f223b693a313b4e3b7d),
('868ff1286561f9f19463a12b5fedc807', 2147483647, 0x613a323a7b693a303b733a32383a22556e69742044696b6972696d20756e74756b205065726261696b616e223b693a313b4e3b7d),
('86ed57dbc6b8ea5acb5273ce47c471dc', 2147483647, 0x613a323a7b693a303b733a31363a224c616765722061757377c3a4686c656e223b693a313b4e3b7d),
('874ccef8d8593fd9ce45788403992cfa', 2147483647, 0x613a323a7b693a303b733a33373a2250726f746f6b6f6c6c646174656e206e616368202e786c7378206578706f7274696572656e223b693a313b4e3b7d),
('87a88cbbeb1070c69dfff7dc320d5e25', 2147483647, 0x613a323a7b693a303b733a31363a224d617374657220496e76656e746f7279223b693a313b4e3b7d),
('87f3552d5bf24ec0bb9a3d17cc19e66f', 2147483647, 0x613a323a7b693a303b733a35363a22556e697420544341202d30303031202d3030323520646970696e6a616d6b616e206b65204f6c6567206f6c656820737570657261646d696e223b693a313b4e3b7d),
('8864b9d961c44cdf681a684cae8a88ca', 2147483647, 0x613a323a7b693a303b733a31393a224a6f75726e616c206465732076697369746573223b693a313b4e3b7d),
('8975cbe3af3fc5f653d23ea38138de1c', 2147483647, 0x613a323a7b693a303b733a32313a2253657269656e6e756d6d65722065696e676562656e223b693a313b4e3b7d),
('8a241ac023c78513fa1d63567a5c6813', 2147483647, 0x613a323a7b693a303b733a363a2253696d70616e223b693a313b4e3b7d),
('8a577d969414eb470c1a3ff3fb3a008c', 2147483647, 0x613a323a7b693a303b733a343a2245646974223b693a313b4e3b7d),
('8b778c4a127fcd978f611438fd692a53', 2147483647, 0x613a323a7b693a303b733a33393a22496872652045696e7374656c6c756e67656e2077757264656e20616b7475616c6973696572742e223b693a313b4e3b7d),
('8c73acf866da82e5ec665719d23674ec', 2147483647, 0x613a323a7b693a303b733a33373a22416e64612079616b696e20696e67696e206d656e6768617075732066696c65206c616d613f223b693a313b4e3b7d),
('8d559084e914dab1588aca4e8e5273f6', 2147483647, 0x613a323a7b693a303b733a32373a22546f74616c204974656d2079616e6720446970696e6a616d6b616e223b693a313b4e3b7d),
('8d58ba10fbc74be3d8a36d8e07e02d1d', 1735093328, 0x613a323a7b693a303b733a363a22416b74696f6e223b693a313b4e3b7d),
('8d91057f86369932def22d93a3a6eb52', 2147483647, 0x613a323a7b693a303b733a393a2253657074656d626572223b693a313b4e3b7d),
('8ee455935dc9b2aa7fe238a110c4eee5', 2147483647, 0x613a323a7b693a303b733a383a224b6172796177616e223b693a313b4e3b7d),
('8ef5f3c3c52e9c1b66d40273da7b6e72', 2147483647, 0x613a323a7b693a303b733a343a224a756e69223b693a313b4e3b7d),
('8fa7e9ad6d04ec70dc60d8929ad7d578', 2147483647, 0x613a323a7b693a303b733a33313a224e65756520417274696b656c65696e686569742068696e7a7566c3bc67656e223b693a313b4e3b7d),
('902538f3c8d584195cbac5b2c4834e36', 2147483647, 0x613a323a7b693a303b733a31323a22646970696e6a616d6b616e2e223b693a313b4e3b7d),
('902bf75c55fb49c5ee212afeafcce9a6', 2147483647, 0x613a323a7b693a303b733a37313a22556e697420504341202d30303031202d303030312064696b656d62616c696b616e206f6c6568204672656464792c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('905659d0f1a8925e911c76c6b69377ad', 1735093392, 0x613a323a7b693a303b733a31353a2250656e6761747572616e20416b756e223b693a313b4e3b7d),
('905c47a1a5506f3f658c4a58c53d6fe3', 1735093444, 0x613a323a7b693a303b733a31393a22456d61696c207465726b6f6e6669726d617369223b693a313b4e3b7d),
('91a50fd2f82703c54fa5562f624fc0de', 2147483647, 0x613a323a7b693a303b733a31363a2247616e7469204b6174612053616e6469223b693a313b4e3b7d),
('91b1dd2efea4e0da813d7175e40cc1aa', 2147483647, 0x613a323a7b693a303b733a32383a2252c3a973756dc3a9206465206c612072c3a97061726174696f6e203a223b693a313b4e3b7d),
('91dd361fadc17aaf3da40fdaac42bb2f', 2147483647, 0x613a323a7b693a303b733a33353a2241706120416e64612079616b696e20696e67696e206d656e67686170757320696e693f223b693a313b4e3b7d),
('91f0737a7683e8a3b04c902b6fa09ec3', 2147483647, 0x613a323a7b693a303b733a353a22416b746976223b693a313b4e3b7d),
('91f8c3322d218e40188487d9bf9413d9', 2147483647, 0x613a323a7b693a303b733a31393a224d6173756b6b616e206b6f6e74656e206c6f67223b693a313b4e3b7d),
('9317b7f6a854d7ac98b7569d085bdc49', 2147483647, 0x613a323a7b693a303b733a34373a22556e697420506161202d30303031202d303030322064697065726261727569206f6c656820737570657261646d696e223b693a313b4e3b7d),
('935a1159657b17ca478a15e62c78d989', 2147483647, 0x613a323a7b693a303b733a31323a2250696c696820737461747573223b693a313b4e3b7d),
('9388b23dc507e31933b90397e268e841', 2147483647, 0x613a323a7b693a303b733a35393a224b65727573616b616e2062657361722028746964616b2064617061742064696f7065726173696b616e2c207065726c75207065726261696b616e29223b693a313b4e3b7d),
('93c9ae2f8e003be67270d7375ad5231b', 1735093405, 0x613a323a7b693a303b733a32313a224c61706f72616e2050696e6a616d616e204974656d223b693a313b4e3b7d),
('93d3fc1a93271ccaa8829e83927d40f5', 2147483647, 0x613a323a7b693a303b733a37313a22e180a1e18085e180afe1809ce180ade180afe18080e180ba20e180a1e18095e180bae1809ce180afe18092e180ba20e18099e180bee18090e180bae18090e18099e180bae180b8223b693a313b4e3b7d),
('95c6f8a08b0edcd2047260c0ef67ba31', 2147483647, 0x613a323a7b693a303b733a35313a224e6f6d6f72205365726920616b616e206469746f6c616b206a696b6120646974656d756b616e2079616e67206964656e74696b223b693a313b4e3b7d),
('96dbb20ccb30225ffa8da00ec3c77351', 2147483647, 0x613a323a7b693a303b733a343a224a616872223b693a313b4e3b7d),
('96eaaf2ee5d4670123c484079768efa0', 1735093381, 0x613a323a7b693a303b733a383a224b617465676f7269223b693a313b4e3b7d),
('96edbdf8315e97c81a8bfbe65209ca43', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('973a60a61b6c036cfd754f7c3fa54f1d', 1735093408, 0x613a323a7b693a303b733a32383a22556e697420527573616b20262044616c616d205065726261696b616e223b693a313b4e3b7d),
('974ed2d49dd82656c1683963c7266012', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('97aa708589534669d77edb9e24d32017', 2147483647, 0x613a323a7b693a303b733a32353a22526f6c6c656e20756e6420426572656368746967756e67656e223b693a313b4e3b7d),
('99019d2f7d71a22e8da253fbf1937591', 2147483647, 0x613a323a7b693a303b733a32303a2245696e6865697420626569205265746f7572656e223b693a313b4e3b7d),
('995c947b537830b2530f8957f4f7b46f', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('99bf910431a6d523f1aa83758152e30c', 2147483647, 0x613a323a7b693a303b733a36353a22556e697420506161202d30303031202d303030312064697065726261696b692e20446962617761206b6520677564616e67206f6c656820737570657261646d696e223b693a313b4e3b7d),
('99e86967529cc3d90353e1c24ff387f9', 2147483647, 0x613a323a7b693a303b733a32343a2257616b7475204b756e6a756e67616e3a2054616e6767616c223b693a313b4e3b7d),
('99ec266cadbff54db0aea543aec93ba1', 2147483647, 0x613a323a7b693a303b733a33353a2241706120416e64612079616b696e20696e67696e206d656e67686170757320696e693f223b693a313b4e3b7d),
('9a469b4ccde98976f418a4a5f80a541d', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('9b94ebf8f11c1fa0efb6925be28f7e78', 2147483647, 0x613a323a7b693a303b733a31383a2254616d6261686b616e2050656e6767756e61223b693a313b4e3b7d),
('9b96ed13e994050036eda36965891087', 2147483647, 0x613a323a7b693a303b733a31323a2250696c696820477564616e67223b693a313b4e3b7d),
('9c572c30e1746788c4a52a07e2e09859', 2147483647, 0x613a323a7b693a303b733a353a225375636865223b693a313b4e3b7d),
('9c803b39868fd8e2a809e0fcc4606c2f', 2147483647, 0x613a323a7b693a303b733a31313a225072c3aa7420436f6e736f223b693a313b4e3b7d),
('9d46bb29f7f23d7e7dfaf20a37e8a355', 2147483647, 0x613a323a7b693a303b733a32373a22e18096e18094e180bae18090e180aee180b8e18090e180b2e180b7223b693a313b4e3b7d),
('9e047b8ce7c7f1ea1696968ab0a0a18c', 2147483647, 0x613a323a7b693a303b733a32383a224c65626968206461726920333020686172692028312062756c616e29223b693a313b4e3b7d),
('9eeb56a5d26eb40084d54bfee94a6615', 2147483647, 0x613a323a7b693a303b733a373a225a757374616e64223b693a313b4e3b7d),
('9f03ee1e7f7cc4be127890921d02e64f', 1735093398, 0x613a323a7b693a303b733a32333a225269776179617420556e67676168616e204d617373616c223b693a313b4e3b7d),
('9f13ef30714d886d650138fb7ba723b0', 2147483647, 0x613a323a7b693a303b733a31363a2244616c616d2050656e6767756e61616e223b693a313b4e3b7d),
('9f92fd8606af54a4c0e618f2acc61dba', 1735093309, 0x613a323a7b693a303b733a32303a2250617373776f727420776965646572686f6c656e223b693a313b4e3b7d),
('a00fb77a2232795776a5ea751cbf0b8a', 2147483647, 0x613a323a7b693a303b733a33323a22556e69742079616e6720536564616e672064616c616d205065726261696b616e223b693a313b4e3b7d),
('a0c319f4e43fbc59d6c6ea57fe0bb3a8', 1735093416, 0x613a323a7b693a303b733a32303a22556e69742044616c616d205065726261696b616e223b693a313b4e3b7d),
('a156d8edf85a3696bccdf31253bfe304', 2147483647, 0x613a323a7b693a303b733a393a2253756368646174656e223b693a313b4e3b7d),
('a15aa8631139e7def77b8945cb8cb390', 2147483647, 0x613a323a7b693a303b733a31313a2253656c6563742059656172223b693a313b4e3b7d),
('a17f01ff3fb5ddcb720b91d37a3ec619', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('a197b0e4d81c07a343e98ff67b154b25', 2147483647, 0x613a323a7b693a303b733a31303a22446174756d205a656974223b693a313b4e3b7d),
('a1c0868d2d58b16273e59f01ae2d9a1e', 2147483647, 0x613a323a7b693a303b733a33393a22e18080e180afe18094e180bae1809ce180bee180b1e180ace18084e180bae1809be180afe180b6223b693a313b4e3b7d),
('a24e33eacd5481adabe833d2f4707ae3', 2147483647, 0x613a323a7b693a303b733a393a2245727374656c6c656e223b693a313b4e3b7d),
('a259a7fb1c7290adcc98609af8bfcc7f', 1735093385, 0x613a323a7b693a303b733a31353a2244616c616d205065726261696b616e223b693a313b4e3b7d),
('a26c3cdfa2018cc009d6d45181ff7a3c', 2147483647, 0x613a323a7b693a303b733a383a225065726261696b69223b693a313b4e3b7d),
('a3087094713cb6078dabc416c8896c12', 2147483647, 0x613a323a7b693a303b733a37323a2245696e68656974205443412d303030312d3030303220766f6e20467265646479207a7572c3bc636b6765676562656e2c20766f6e20537570657261646d696e20657268616c74656e223b693a313b4e3b7d),
('a4b4c13bfea88dae1568912ff2c96ec3', 2147483647, 0x613a323a7b693a303b733a31353a2250696c6968204974656d20556e6974223b693a313b4e3b7d),
('a4f252f1cb64e7567aa1610d45e267e5', 2147483647, 0x613a323a7b693a303b733a353a224d6f6e6174223b693a313b4e3b7d),
('a4fabe9dbe678ea08ad6d8daf8579770', 2147483647, 0x613a323a7b693a303b733a31393a224c6167657220616b7475616c6973696572656e223b693a313b4e3b7d),
('a5903735f4266a09fdb5f75d6bbf074b', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('a5b15ff460b12bf3d6f04e885b61055c', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420564441202d30303032202d303030312064696b6972696d20756e74756b2064697065726261696b69206f6c656820737570657261646d696e223b693a313b4e3b7d),
('a60214ab9bfd08e000d04c3b19a33e4c', 2147483647, 0x613a323a7b693a303b733a32333a225065726261727569204b617465676f7269204974656d3a223b693a313b4e3b7d),
('a60296e5b7cd6082f41959c2e49a24cf', 2147483647, 0x613a323a7b693a303b733a383a224469626c6f6b6972223b693a313b4e3b7d),
('a683833c2ea07b1db36e40a2a0c1e425', 2147483647, 0x613a323a7b693a303b733a31323a2242656e75747a65726e616d65223b693a313b4e3b7d),
('a6fd89799c3be81d83f187543b3cd328', 2147483647, 0x613a323a7b693a303b733a31383a22486170757320646f6b756d656e206c616d61223b693a313b4e3b7d),
('a74d7ce59e23536de0cac6689552bedc', 2147483647, 0x613a323a7b693a303b733a32303a225a5552205245504152415455522053454e44454e223b693a313b4e3b7d),
('a780e7a12f4c460800a9acedab960eec', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('a840684adcc6311b1d9b8147497de1e5', 2147483647, 0x613a323a7b693a303b733a36393a22556e697420506161202d30303032202d303030322064696b656d62616c696b616e206f6c6568204f6c65672c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('a8c284c2a4843856279b12ac768ecf39', 2147483647, 0x613a323a7b693a303b733a31363a2250617373776f727420c3a46e6465726e223b693a313b4e3b7d),
('a8de0da5a9b90716574edf7e8bf6be74', 2147483647, 0x613a323a7b693a303b733a31393a22456e746c696568656e2f5665726c696568656e223b693a313b4e3b7d),
('aa11fb3df5cdf876cfd350cd4e1a1e3a', 1735093382, 0x613a323a7b693a303b733a383a225465727365646961223b693a313b4e3b7d),
('aaf0d31fd19911a3fad1be56a00c34fd', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('abc3b7bce4c7de37f63ce8dec0bb5e21', 2147483647, 0x613a323a7b693a303b733a32373a22e18091e180bde18080e180bae18095e180b1e180abe18080e180ba223b693a313b4e3b7d),
('ac9327c64e00159d874aed73db85a05a', 2147483647, 0x613a323a7b693a303b733a31303a224265617262656974656e223b693a313b4e3b7d),
('acde71e2de732cf8557a80f434bc8d02', 2147483647, 0x613a323a7b693a303b733a31363a22416b7475616c69736965727420766f6e223b693a313b4e3b7d),
('ae6d95c14127079b4bfd3d16c2701eb7', 2147483647, 0x613a323a7b693a303b733a36323a22556e697420506161202d30303034202d3030303420646970696e6a616d6b616e206b657061646120467265646479206f6c656820737570657261646d696e223b693a313b4e3b7d),
('ae70621e6c5e3e988e0e70f140f681bb', 2147483647, 0x613a323a7b693a303b733a31343a224974656d20446920477564616e67223b693a313b4e3b7d),
('ae7fb54d4bb8d32828304efafd040b63', 2147483647, 0x613a323a7b693a303b733a32303a22556e69742064692070656e67656d62616c69616e223b693a313b4e3b7d),
('af7c136564f6dd928680f2b3a02f5087', 1735093350, 0x613a323a7b693a303b733a31393a22526570617261747572c3bc6265727369636874223b693a313b4e3b7d),
('afaadda7aeef981425de59298190bb0b', 2147483647, 0x613a323a7b693a303b733a37333a2245696e68656974205041412d303030312d3030303220766f6e205368696f72696e207a7572c3bc636b6765676562656e2c20766f6d20537570657261646d696e20657268616c74656e223b693a313b4e3b7d),
('aff7279a6a42e7b530bb10c38a987909', 2147483647, 0x613a323a7b693a303b733a32313a225065726261727569206461746120477564616e673a223b693a313b4e3b7d),
('b035e05f85c7236a7fc9ab0caa373cd8', 2147483647, 0x613a323a7b693a303b733a32303a2253656c657361696b616e205065726261696b616e223b693a313b4e3b7d),
('b1705f745e672fb97e6c9817ce75b009', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('b176c20f666706b807d6591864d3cd6a', 2147483647, 0x613a323a7b693a303b733a33363a22e1809ee180ade18099e180bae180b8e18086e1808ae180bae180b8e1809ee1808ae180ba223b693a313b4e3b7d),
('b2782cb0df87b5e842518e186edb0fea', 2147483647, 0x613a323a7b693a303b733a33303a22e18099e180bde18099e180bae180b8e18099e180b6e18090e1809ae180ba223b693a313b4e3b7d),
('b3886215617c6bac09fa104538a6ed11', 2147483647, 0x613a323a7b693a303b733a3131373a22477564616e672041646d696e2e20416b756e20416e646120746964616b206d656d696c696b6920477564616e672079616e6720646974657461706b616e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('b3eba2b20f802b2a19bace5202790e8d', 2147483647, 0x613a323a7b693a303b733a31313a2244657461696c204974656d223b693a313b4e3b7d),
('b422c2d68a4c5c4146f06f6d3efc6616', 2147483647, 0x613a323a7b693a303b733a32313a2254756761736b616e2041646d696e20477564616e67223b693a313b4e3b7d),
('b4606e1dcfd632204f8339bfc12c11c1', 2147483647, 0x613a323a7b693a303b733a32343a22e18098e180ace1809ee180ace18085e18080e180ace180b8223b693a313b4e3b7d),
('b4de8de9b6043a409bf54c40edb34b95', 2147483647, 0x613a323a7b693a303b733a31343a225a7572c3bc636b6765676562656e223b693a313b4e3b7d),
('b528fbb39fb54725e5333a480a2e1513', 2147483647, 0x613a323a7b693a303b733a35343a22566f73207072c3a966c3a972656e636573206f6e7420c3a974c3a9206d6973657320c3a0206a6f757220617665632073756363c3a873223b693a313b4e3b7d),
('b63cd41e8362c9ecfed29766f302f115', 2147483647, 0x613a323a7b693a303b733a33363a22426172616e6720446920477564616e67204a4f47494e4720434f4e444f4e474341545552223b693a313b4e3b7d),
('b774833d2aec5b4fd7f781b4aa737a57', 2147483647, 0x613a323a7b693a303b733a31393a224d6173756b6b616e206e6f6d6f722073657269223b693a313b4e3b7d),
('b7a2d820e669f00cb301b3d3b0c34f7f', 2147483647, 0x613a323a7b693a303b733a35353a2245696e68656974205644412d303030342d3030303320766f6e20537570657261646d696e20616e204a6f68616e207665726c696568656e223b693a313b4e3b7d),
('b7c85fd771c2a506174b0c7c3a8c27c1', 2147483647, 0x613a323a7b693a303b733a33333a224d6f646966696572206c657320646f6e6ec3a96573206465206c27756e6974c3a9223b693a313b4e3b7d),
('b8071ea0bd302ec8fe77d18a55db9bb3', 2147483647, 0x613a323a7b693a303b733a33343a22416b7475616c6973696572656e20646572204d69746172626569746572646174656e223b693a313b4e3b7d),
('b823caa9e6e7f3c417841b17bc2951e2', 1735093340, 0x613a323a7b693a303b733a32393a2256657277656e64756e677370726f746f6b6f6c6c20616e7a656967656e223b693a313b4e3b7d),
('b8bb3da62f347778148b975e024fe7cd', 2147483647, 0x613a323a7b693a303b733a32373a22477564616e6720626572686173696c20646974756761736b616e2e223b693a313b4e3b7d),
('b9654dd94ce5245cc7fb1e6dadb2b435', 2147483647, 0x613a323a7b693a303b733a383a224944204c61676572223b693a313b4e3b7d),
('b9b0285761ca176952ff9fc4340b887c', 2147483647, 0x613a323a7b693a303b733a32313a224e616d6520646573204d6974617262656974657273223b693a313b4e3b7d),
('b9cbeec10b76fc17ff25637960f22cf2', 2147483647, 0x613a323a7b693a303b733a31333a224e616d61204b6172796177616e223b693a313b4e3b7d),
('ba124e60e546f214cac5fc0f1814e449', 2147483647, 0x613a323a7b693a303b733a32363a224dc3b663687465737420647520646173206cc3b6736368656e3f223b693a313b4e3b7d),
('ba1870d2670d1d96741098ba761f6aa6', 2147483647, 0x613a323a7b693a303b733a33303a2257616b7475204b756e6a756e67616e3a2057616b74752054616e6767616c223b693a313b4e3b7d),
('ba8c2b27a6f778482d8a008dcf27f900', 2147483647, 0x613a323a7b693a303b733a363a22477564616e67223b693a313b4e3b7d),
('bad62f706145705298d7b9fc47ec6d6f', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('bb282bdd985cd7d191696d1fc246273c', 2147483647, 0x613a323a7b693a303b733a3137303a22e1809ee18084e180ba20e1818f20e180a6e180b8e18085e180ace180b8e18095e180b1e180b8e18099e180bee180afe18099e180bbe180ace180b8e18080e180ade180af20e180a1e180b1e180ace18084e180bae18099e180bce18084e180bae18085e180bde180ac20e180a1e18095e180bae18092e180ade18090e180bae1809ce180afe18095e180bae18095e180bce180aee180b8e18095e180abe18095e180bce180ae20e1818b223b693a313b4e3b7d),
('bbdb48c0f06d60d953e1e4c6b2d82379', 2147483647, 0x613a323a7b693a303b733a35363a22556e697420506161202d30303031202d3030303220646970696e6a616d6b616e206b65204f6c6567206f6c656820737570657261646d696e223b693a313b4e3b7d),
('bc74708dbafb82efbc7586535e7328ec', 2147483647, 0x613a323a7b693a303b733a363a22556e67676168223b693a313b4e3b7d),
('bd2dc63f39b15c1152059ae9c77e8d0a', 2147483647, 0x613a323a7b693a303b733a34373a22556e697420506161202d30303031202d303030332064697065726261727569206f6c656820737570657261646d696e223b693a313b4e3b7d),
('be0e37dd243d45e96fa95bb5fd945ae5', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420506161202d30303031202d303030312064696b6972696d20756e74756b2064697065726261696b69206f6c656820737570657261646d696e223b693a313b4e3b7d),
('be816784bcabf873ede7997b1ba4d48b', 1735093442, 0x613a323a7b693a303b733a31303a224b6174612053616e6469223b693a313b4e3b7d),
('bedc09017a202a6e1430dbcf6decbf31', 2147483647, 0x613a323a7b693a303b733a31363a22c3846c74657220616c73203120546167223b693a313b4e3b7d),
('bf0acdd47aa7295aab7f6ae270bd2ee9', 2147483647, 0x613a323a7b693a303b733a31393a2250696c6968204b617465676f7269204974656d223b693a313b4e3b7d),
('c03d12a008992dc63d94cf71a45438a3', 2147483647, 0x613a323a7b693a303b733a373a224b6f6e64697369223b693a313b4e3b7d),
('c04a5fd81a9d6684a0499a9274fdd14d', 2147483647, 0x613a323a7b693a303b733a32393a2254756761736b616e2041646d696e20477564616e67206179796c6d616f223b693a313b4e3b7d),
('c07c03c2555e868ae1c05d790b0a94e7', 2147483647, 0x613a323a7b693a303b733a36373a22e1809ae180b0e18094e18085e180bae18092e180b1e18090e180ace18080e180ade180af20e18090e1808ae180bae180b8e18096e180bce18090e180bae18095e180ab223b693a313b4e3b7d),
('c085a10f222805f65a48819c58b699d5', 2147483647, 0x613a323a7b693a303b733a37303a22556e697420506161202d30303031202d303030312064696b656d62616c696b616e206f6c6568204a6f68616e2c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('c0e2d5aacf3798baebde5c1e5162abdf', 2147483647, 0x613a323a7b693a303b733a3131373a2241646d696e20477564616e672c20616b756e20416e646120746964616b206d656d696c696b6920677564616e672079616e6720646974657461706b616e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('c107446bc5eac32cc257af9304be498f', 2147483647, 0x613a323a7b693a303b733a31343a2241757367657363686c6f7373656e223b693a313b4e3b7d),
('c11b90ad4e19e4e2315cc32bf7e356d0', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('c1750a8b466e22792b56f2cbbfc81a9b', 2147483647, 0x613a323a7b693a303b733a35313a22e18098e180ace1809ee180ace18085e18080e180ace180b8e18080e180ade180afe1809be180bde180b1e180b8e18095e180ab223b693a313b4e3b7d),
('c1b527fff25355ecce33a7b361a4d9eb', 1735093356, 0x613a323a7b693a303b733a353a224c61676572223b693a313b4e3b7d),
('c1c62d740a324bfbb334462a8e38fab9', 2147483647, 0x613a323a7b693a303b733a32363a22e18085e18080e180ace180b8e1809de180bde18080e180b9202d223b693a313b4e3b7d),
('c228af04d368a4551cd43235110975e2', 2147483647, 0x613a323a7b693a303b733a33393a224f7074696f6e73206465206ce280997574696c697361746575722f7574696c6973617472696365223b693a313b4e3b7d),
('c2586eb893c89fbecb894f9250d4762d', 2147483647, 0x613a323a7b693a303b733a31313a224d697320c3a0206a6f7572223b693a313b4e3b7d),
('c26d25d4d976d46dc41e60301e59dd33', 2147483647, 0x613a323a7b693a303b733a353a22416b746966223b693a313b4e3b7d),
('c3222dd954b2c33e2c0e4d7b09072a2a', 1735093307, 0x613a323a7b693a303b733a383a2250617373776f7274223b693a313b4e3b7d),
('c362aee9103533125edc3fe9bab26e9e', 2147483647, 0x613a323a7b693a303b733a33313a225a75722052657061726174757220676573656e646574652045696e68656974223b693a313b4e3b7d),
('c3cc1f748917ce0c6be1c2df1a1986bb', 2147483647, 0x613a323a7b693a303b733a34393a2245696e68656974205041412d303030312d3030303320766f6d20537570657261646d696e20616b7475616c697369657274223b693a313b4e3b7d),
('c4012058b4ac668707bef07e6dd10884', 2147483647, 0x613a323a7b693a303b733a32313a2250696c69682044697065726261727569204f6c6568223b693a313b4e3b7d),
('c4e178c1c526accd7c6c293cda09a88d', 2147483647, 0x613a323a7b693a303b733a32363a22556e67676168616e204d617373616c20756e74756b20756e6974223b693a313b4e3b7d),
('c4f57bf15c777e9b23d418349bd54df2', 2147483647, 0x613a323a7b693a303b733a35383a22e180a1e180aee180b8e18099e180b1e180b8e1809ce180ba20e180a1e18090e1808ae180bae18095e180bce180afe18095e180bce180aee180b8223b693a313b4e3b7d),
('c5690a42e548891f4bf9ed3ba673fa0b', 2147483647, 0x613a323a7b693a303b733a32303a2254616e6767616c204c6f6720426572616b686972223b693a313b4e3b7d),
('c56cff686f4f3e4676a7ac30bc30e153', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('c5900941987b4a5808a67ce7ecf1a492', 2147483647, 0x613a323a7b693a303b733a32303a22496e76656e7461697265207072696e636970616c223b693a313b4e3b7d),
('c5a5e60a8c6a7485bc7880d93898bbbc', 2147483647, 0x613a323a7b693a303b733a33303a225a757374616e64206465722045696e686569742061757377c3a4686c656e223b693a313b4e3b7d),
('c5b2ff841e8f3a0bc37f49d704a1e1c3', 2147483647, 0x613a323a7b693a303b733a32373a224b6972696d20556e697420556e74756b2044697065726261696b69223b693a313b4e3b7d),
('c601a4b0e43aca9225c4fc70f06555e4', 1735093348, 0x613a323a7b693a303b733a34393a224265736368c3a4646967746520756e6420696e2052657061726174757220626566696e646c696368652045696e68656974223b693a313b4e3b7d),
('c6d3cd63a10cfe32d45bb648ea9c4f9f', 2147483647, 0x613a323a7b693a303b733a31353a2254616e6767616c20262057616b7475223b693a313b4e3b7d),
('c6f634ee31886f2f13e1cdd1867b8f4b', 2147483647, 0x613a323a7b693a303b733a363a224c616e677565223b693a313b4e3b7d),
('c73139fff4d81ae49badbc829b21a808', 2147483647, 0x613a323a7b693a303b733a39363a22556e697420504341202d30303032202d3030303420646970696e6a616d6b616e206b6570616461204d616e6672656420416c62726563687420467265696865727220766f6e205269636874686f66656e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('c86fe595bbf42a1210d35d6bc1725636', 2147483647, 0x613a323a7b693a303b733a35363a2245696e68656974205443412d303030312d3030303220766f6e20537570657261646d696e20616e20467265646479207665726c696568656e223b693a313b4e3b7d),
('c9ab49711327e1debbc315336bd4cb47', 2147483647, 0x613a323a7b693a303b733a3132303a2241646d696e2057617265686f7573652c20616b756e20416e646120746964616b206d656d696c696b6920677564616e672079616e6720646974657461706b616e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('cae8a4b06016e5fa15a280cf9c6db60d', 1735093314, 0x613a323a7b693a303b733a32333a224e6575657320456c656d656e742065696e66c3bc67656e223b693a313b4e3b7d),
('cba6193d8cd2757b8d9aac05c0228faa', 2147483647, 0x613a323a7b693a303b733a32373a224d69746172626569746572206767662e2061757377c3a4686c656e223b693a313b4e3b7d),
('cc2d89e5c96b92c7a103a6a74a8ef79c', 2147483647, 0x613a323a7b693a303b733a333a224c6f67223b693a313b4e3b7d),
('cc9ba9d68254321701faaada4e1d0a4c', 2147483647, 0x613a323a7b693a303b733a32333a224361746174616e205065726261696b616e20756e74756b223b693a313b4e3b7d),
('cca73bbf7d8e28da98fbf5c23d7c198e', 2147483647, 0x613a323a7b693a303b733a32373a22496b6c616e20626572686173696c2064692070657262617275692e223b693a313b4e3b7d),
('cd8286ea7344eb5d55464e61ecd7342e', 2147483647, 0x613a323a7b693a303b733a33393a22e18095e18085e180b9e18085e1808ae180bae180b8e18085e180ace1809be18084e180bae180b8223b693a313b4e3b7d),
('ce150ecb2ac19bd33b2c728906e21269', 2147483647, 0x613a323a7b693a303b733a32333a2250657262617275692064617461204b6172796177616e3a223b693a313b4e3b7d),
('ce6bc695843f4d77e3c77175c859ff00', 2147483647, 0x613a323a7b693a303b733a353a22546168756e223b693a313b4e3b7d),
('ce707da9cae21e45d08f6558929cf8d3', 2147483647, 0x613a323a7b693a303b733a31383a2245696e686569742061757377c3a4686c656e223b693a313b4e3b7d),
('ce8c2321908091cc6d3c8ce147a96789', 2147483647, 0x613a323a7b693a303b733a31363a2244616c616d2050656e6767756e61616e223b693a313b4e3b7d),
('cedbff080e517f86d88f7c707736e46f', 2147483647, 0x613a323a7b693a303b733a37373a224b6172796177616e20746964616b20646170617420646968617075732e204974656d2079616e67206d6173696820646970696e6a616d6b616e206b6570616461206b6172796177616e20696e69223b693a313b4e3b7d),
('cf041f0022e6a8808d726256ad403455', 2147483647, 0x613a323a7b693a303b733a393a224e616d61204974656d223b693a313b4e3b7d),
('d0607ccb1ca7952bd604d322aaae400d', 2147483647, 0x613a323a7b693a303b733a31303a2250696c69682074697065223b693a313b4e3b7d),
('d0da55f18315c2610d4be49246d29276', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('d105c306dd2db8d9b9fd36443aaf5e11', 2147483647, 0x613a323a7b693a303b733a36313a22556e697420564441202d30303031202d303030322064696b6972696d20756e74756b2064697065726261696b69206f6c656820737570657261646d696e223b693a313b4e3b7d),
('d17f5dd2ba1e276497ff9610ef128199', 2147483647, 0x613a323a7b693a303b733a36323a224772c3b6c39f65726520536368c3a464656e202866756e6b74696f6e73756e66c3a46869672c20526570617261747572206572666f726465726c69636829223b693a313b4e3b7d),
('d1be7b2bc987a263ca5cf831fda04d2c', 2147483647, 0x613a323a7b693a303b733a33363a22416e64612079616b696e20616b616e206d656e67686170757320627574697220696e693f223b693a313b4e3b7d),
('d26ebac2cc9749953f8f789f3a87164b', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('d29d55fb54182c2fa4b6e0d9bae9968d', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('d2a67a5851b2e3d0a3efe320b9775288', 2147483647, 0x613a323a7b693a303b733a31393a224b6174612073616e6469207361617420696e69223b693a313b4e3b7d),
('d2adfe53ae3612d1a19e665076ac873c', 2147483647, 0x613a323a7b693a303b733a31383a22556e6974c3a920656e646f6d6d6167c3a965223b693a313b4e3b7d),
('d2b5a538cef375d37a8f08c1a72e0fd2', 2147483647, 0x613a323a7b693a303b733a35343a2245696e68656974205041412d303030322d3030303220766f6e20537570657261646d696e20616e204f6c6567207665726c696568656e223b693a313b4e3b7d),
('d35bb13061f786aae9cbfbbe48388594', 2147483647, 0x613a323a7b693a303b733a36343a22e1809ae180b0e18094e18085e180bae18080e180ade180af20e18085e180aee18099e180b6e18081e18094e180b7e180bae18081e180bde180b2e18095e180ab223b693a313b4e3b7d),
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
('dae026ea7bf7112e2ed54a0f2850f669', 2147483647, 0x613a323a7b693a303b733a32383a225065726261696b616e20736564616e67206265726c616e6773756e67223b693a313b4e3b7d),
('db10dba5e9a9ea34ce366a14e2858d83', 2147483647, 0x613a323a7b693a303b733a3132363a2241646d696e2057617265686f7573652c20616b756e20416e646120746964616b206d656d696c696b692057617265686f7573652079616e6720646974756761736b616e206b652e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('db4e139ab9f95c60e7c9f2e61cc89973', 1735093404, 0x613a323a7b693a303b733a31363a22526977617961742050696e6a616d616e223b693a313b4e3b7d),
('dc90435136bbfc89db4de99f2eeda113', 2147483647, 0x613a323a7b693a303b733a35373a2245696e68656974205041412d303030312d3030303220766f6e20537570657261646d696e20616e205368696f72696e207665726c696568656e223b693a313b4e3b7d),
('dc9cf78cf46dffa65511c8eaa9928f3c', 2147483647, 0x613a323a7b693a303b733a34363a22477564616e67206d61736968206d656d696c696b6920756e697420626172616e672064692064616c616d6e79612e223b693a313b4e3b7d),
('dd3591b347b95895cbe45b4670291a9a', 1735093337, 0x613a323a7b693a303b733a31373a2245696e686569742076657277616c74656e223b693a313b4e3b7d),
('dd62251a64ad31d66e93680359e9c3c3', 2147483647, 0x613a323a7b693a303b733a34393a224b6f6d656e7461722068617275732062657275706120696e666f726d6173692074656e74616e67207065726261696b616e223b693a313b4e3b7d),
('dddecbd4156fbe17f772bc798c086d08', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
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
('e33dbd46d7244ab6a37bb6a18d268729', 2147483647, 0x613a323a7b693a303b733a333a224d6569223b693a313b4e3b7d),
('e44c5541afc68b507787a385dac546cc', 1735093388, 0x613a323a7b693a303b733a343a22416b7369223b693a313b4e3b7d),
('e4b5864af7e4d833dbabd26000113276', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('e5e8e5a84cb194e533bbb3c284054393', 2147483647, 0x613a323a7b693a303b733a323a224f4b223b693a313b4e3b7d),
('e6ea6e63bfcc83832cd8df924614bdd7', 2147483647, 0x613a323a7b693a303b733a35373a2245696e68656974205055412d303030312d3030303320766f6e20537570657261646d696e20616e205368696f72696e207665726c696568656e223b693a313b4e3b7d),
('e7db493e45945b03fe7bd35c17198e70', 2147483647, 0x613a323a7b693a303b733a37303a22e18085e18080e180ace180b8e1809de180bee18080e180bae18080e180ade180af20e18095e180bce180b1e180ace18084e180bae180b8e1809ce180b2e1809be18094e180ba223b693a313b4e3b7d),
('e857e4a3edcf378bc151f67f2826f25f', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('e985c97193aa9ef0f35adcb7fdae9b39', 2147483647, 0x613a323a7b693a303b733a31383a22436174c3a9676f7269652041727469636c65223b693a313b4e3b7d),
('ea02c89b55a39edd6572e00db3b17745', 2147483647, 0x613a323a7b693a303b733a37323a22556e697420506161202d30303031202d303030322064696b656d62616c696b616e206f6c6568205368696f72696e2c206469746572696d61206f6c656820737570657261646d696e223b693a313b4e3b7d),
('eb058b65a6b3bc628af148cfabcb5dcf', 2147483647, 0x613a323a7b693a303b733a32323a224c6f67204b756e6a756e67616e2050656e6767756e61223b693a313b4e3b7d),
('eb586cb1350f1e58eae87797489a2804', 2147483647, 0x613a323a7b693a303b733a393a22436172692044617461223b693a313b4e3b7d),
('eb5dfca35aa70d3be49a7e06def3fe50', 2147483647, 0x613a323a7b693a303b733a34323a22507265666572656e736920416e64612074656c616820626572686173696c20646970657262617275692e223b693a313b4e3b7d),
('eb616fe6de7c005997c0aa3cd92fbe9f', 2147483647, 0x613a323a7b693a303b733a393a2244617465696e616d65223b693a313b4e3b7d),
('ebc358c823def4500744e6c805af803f', 1735093414, 0x613a323a7b693a303b733a31303a22556e697420527573616b223b693a313b4e3b7d),
('ebdc9bceae886746aff898cdbbe77b33', 2147483647, 0x613a323a7b693a303b733a32313a224d656d627561742050656e6767756e612042617275223b693a313b4e3b7d),
('ed05dc99586e6bdbf26d8c74976e1cc3', 2147483647, 0x613a323a7b693a303b733a32333a2252696e676b6173616e204c6f67205065726261696b616e223b693a313b4e3b7d),
('ed156925fd1825ae318fa9e5d14d304d', 2147483647, 0x613a323a7b693a303b733a36373a22556e697420564441202d30303031202d303030322064696b656d62616c696b616e206f6c6568204f6c65672c206469746572696d61206f6c65682061707061646d696e223b693a313b4e3b7d),
('ed33d3ef03b7dfe6f3984819db56c400', 1735093374, 0x613a323a7b693a303b733a31363a22496e76656e746172697320496e64756b223b693a313b4e3b7d),
('edb756ea04b487dfb0dfd81a1e5500e4', 1735093395, 0x613a323a7b693a303b733a31333a224b617465676f7269204974656d223b693a313b4e3b7d),
('edc2b2d8a4947af5aea3e660adb624de', 2147483647, 0x613a323a7b693a303b733a3130383a2241646d696e2057617265686f7573652e20546964616b206164612057617265686f7573652079616e6720646974756761736b616e2e20487562756e67692041646d696e2041706c696b61736920756e74756b206d656e657461706b616e20416e6461206b6520677564616e67223b693a313b4e3b7d),
('ee1931240e4494d241891500cfa394df', 2147483647, 0x613a323a7b693a303b733a31363a22526170706f7274206465207072c3aa74223b693a313b4e3b7d),
('ee9cba4a0cf94a324344874924358636', 2147483647, 0x613a323a7b693a303b733a32383a22c3846c74657220616c732033302054616765202831204d6f6e617429223b693a313b4e3b7d),
('eebcc162c5e5754b0d1cddbcd44e7823', 2147483647, 0x613a323a7b693a303b733a37363a22e180a1e1809ee180afe180b6e180b8e18095e180bce180afe1809ee180b020e1809be180bde180b1e180b8e18081e180bbe1809ae180bae18085e1809be180ace18099e180bbe180ace180b8223b693a313b4e3b7d),
('efb58d91b80b6d6af968b4c7498a081b', 2147483647, 0x613a323a7b693a303b733a393a22556e6974204974656d223b693a313b4e3b7d),
('f00c592eda5bf336473477ebb069f153', 1735093325, 0x613a323a7b693a303b733a31333a22496e205265706172617475723a223b693a313b4e3b7d),
('f0874aec48500f2949c1a1c4985e1763', 2147483647, 0x613a323a7b693a303b733a353a22417072696c223b693a313b4e3b7d),
('f320358d967529fd2aa4ebce1a428199', 2147483647, 0x613a323a7b693a303b733a31343a2250696c6968204b6172796177616e223b693a313b4e3b7d),
('f397a91c9afd8d018667cd4aa1808618', 1735093393, 0x613a323a7b693a303b733a31303a22496e76656e7461726973223b693a313b4e3b7d),
('f45627865e18e66ae843a314721b3aa5', 1735093430, 0x613a323a7b693a303b733a383a224b6172796177616e223b693a313b4e3b7d),
('f45b7a3995b132a8d79fcfbe58f91771', 2147483647, 0x613a323a7b693a303b733a373a224a616e75617269223b693a313b4e3b7d),
('f45c00e4bc1357a650acdb7d3f0c861d', 1735093332, 0x613a323a7b693a303b733a32313a224163636f756e742d45696e7374656c6c756e67656e223b693a313b4e3b7d),
('f47e62f133d5142b6f4bd9fe4525ba62', 2147483647, 0x613a323a7b693a303b733a35363a22556e697420564441202d30303031202d3030303220646970696e6a616d6b616e206b65204f6c6567206f6c656820737570657261646d696e223b693a313b4e3b7d),
('f4f1049cd425ca8557e924d28f6cdbab', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('f52773e070cbed2a4038323c2da5adc4', 2147483647, 0x613a323a7b693a303b733a32323a2256616c69646173692067616d62617220676167616c2e223b693a313b4e3b7d),
('f5bb049d9a3dc1b4d4a9f00ce155e650', 2147483647, 0x613a323a7b693a303b733a3131333a22e18082e180ade180afe18092e180b1e180abe18084e180ba20e18085e180aee18099e180b6e18081e18094e180b7e180bae18081e180bde180b2e1809ee180b0e18080e180ade180af20e18090e180ace1809de18094e180bae18095e180b1e180b8e180a1e18095e180bae18095e180ab223b693a313b4e3b7d),
('f64802096e7e1d2cd4fbc449488dc1b5', 2147483647, 0x613a323a7b693a303b733a32343a2254657461706b616e2041646d696e206b6520477564616e67223b693a313b4e3b7d),
('f6ee1dfbf56293506160b18c1d5605e8', 2147483647, 0x613a323a7b693a303b733a36343a22e18095e180bce180afe18095e180bce18084e180bae18099e180bee180af20e180a1e18080e180bbe18089e180bae180b8e18081e180bbe180afe18095e180ba223b693a313b4e3b7d),
('f7763f4822688848a943f5d067cad96d', 2147483647, 0x613a323a7b693a303b733a31333a224b617465676f7269204974656d223b693a313b4e3b7d),
('f833d5bfe71d0bf698ba4922ddfc9987', 2147483647, 0x613a323a7b693a303b733a34323a22e180a1e1809ee180afe180b6e180b8e18095e180bce180afe1809ee180b0e18099e180bbe180ace180b8223b693a313b4e3b7d),
('f87f9bc55ce5ce392776a0bcec10a73d', 2147483647, 0x613a323a7b693a303b733a33363a225065726261696b616e2073656c657361692e205065726261696b616e2044697475747570223b693a313b4e3b7d),
('f89673e9f7685be6197c92d53b2e421d', 2147483647, 0x613a323a7b693a303b733a33393a22556e697420626572686173696c2064696b6972696d20756e74756b2064697065726261696b692e223b693a313b4e3b7d),
('f918fbc422d2a582f77a00085fd64f90', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d);
INSERT INTO `cache` (`id`, `expire`, `data`) VALUES
('fa1c09aa5802944c3d63c75c74a33a01', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
('fa33197ca8982a097b3f8c5ded90e46b', 2147483647, 0x613a323a7b693a303b733a31313a225361757665676172646572223b693a313b4e3b7d),
('fa846bd54179309d2a304a5bf602e613', 2147483647, 0x613a323a7b693a303b733a383a224665627275617269223b693a313b4e3b7d),
('fca0bf85e9ffb44f4a3e8d048ac22cbf', 2147483647, 0x613a323a7b693a303b733a35393a22556e697420506161202d30303031202d3030303220646970696e6a616d6b616e206b65205368696f72696e206f6c656820737570657261646d696e223b693a313b4e3b7d),
('fcc42a5e2efcba3ac8d689721ce97ceb', 2147483647, 0x613a323a7b693a303b733a31353a2243617269204e6f6d6f722053657269223b693a313b4e3b7d),
('fcdb799c4e4cd92e73a603d497987fdc', 2147483647, 0x613a323a7b693a303b733a32333a22416c746520446f6b756d656e7465206cc3b6736368656e223b693a313b4e3b7d),
('fd3a67e2aa4416817a5afa41e2817f20', 2147483647, 0x613a323a7b693a303b733a31303a225265706172696572656e223b693a313b4e3b7d),
('fdbd5ef7e2e3ee8535b90daf89217ef9', 2147483647, 0x613a323a7b693a303b733a31343a22556e6475682054656d706c617465223b693a313b4e3b7d),
('fe01f763ffc9853bf233b144b247a4f9', 1735093318, 0x613a323a7b693a303b733a31313a22417274696b656c6e616d65223b693a313b4e3b7d),
('ff2c7ee8e5926a02a15c93a2a1fae527', 2147483647, 0x613a323a7b693a303b733a32373a22556e697420626572686173696c2064696b656d62616c696b616e2e223b693a313b4e3b7d),
('ff66b1fdddd78c6232d809cb8fd63cdc', 2147483647, 0x613a323a7b693a303b733a3135383a22494e56414c4944204c414e47554147452050414952205350454349464945442e204558414d504c453a204c414e47504149523d454e7c4954205553494e472032204c45545445522049534f204f522052464333303636204c494b45205a482d434e2e20414c4d4f535420414c4c204c414e47554147455320535550504f525445442042555420534f4d45204d41592048415645204e4f20434f4e54454e54223b693a313b4e3b7d),
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
(43, 'bulk_unit613_1732757427.xlsx', '2024-11-28 08:30:27.00', 14),
(44, 'bulk_unit207_1732757517.xlsx', '2024-11-28 08:31:57.00', 14),
(45, 'bulk_unit127_1732757518.xlsx', '2024-11-28 08:31:58.00', 14),
(46, 'bulk_unit946_1732757518.xlsx', '2024-11-28 08:31:58.00', 14),
(47, 'bulk_unit873_1732757519.xlsx', '2024-11-28 08:31:59.00', 14),
(48, 'bulk_unit531_1732757520.xlsx', '2024-11-28 08:32:00.00', 14),
(49, 'bulk_unit121_1732757520.xlsx', '2024-11-28 08:32:00.00', 14),
(50, 'bulk_unit775_1732757521.xlsx', '2024-11-28 08:32:01.00', 14),
(51, 'bulk_unit573_1732757521.xlsx', '2024-11-28 08:32:01.00', 14),
(52, 'bulk_unit249_1732757522.xlsx', '2024-11-28 08:32:02.00', 14),
(53, 'bulk_unit707_1732757523.xlsx', '2024-11-28 08:32:03.00', 14),
(54, 'bulk_unit112_1732757523.xlsx', '2024-11-28 08:32:03.00', 14),
(55, 'bulk_unit991_1732757524.xlsx', '2024-11-28 08:32:04.00', 14),
(56, 'bulk_unit755_1732757524.xlsx', '2024-11-28 08:32:04.00', 14),
(57, 'bulk_unit511_1732757525.xlsx', '2024-11-28 08:32:05.00', 14),
(58, 'bulk_unit210_1732757525.xlsx', '2024-11-28 08:32:05.00', 14),
(59, 'bulk_unit940_1732757590.xlsx', '2024-11-28 08:33:10.00', 14),
(60, 'bulk_unit742_1732757590.xlsx', '2024-11-28 08:33:10.00', 14),
(61, 'bulk_unit493_1732757600.xlsx', '2024-11-28 08:33:20.00', 14),
(62, 'bulk_unit866_1732757612.xlsx', '2024-11-28 08:33:32.00', 14),
(63, 'bulk_unit700_1732757624.xlsx', '2024-11-28 08:33:44.00', 14),
(64, 'bulk_unit803_1732757636.xlsx', '2024-11-28 08:33:56.00', 14),
(65, 'bulk_unit503_1732757648.xlsx', '2024-11-28 08:34:08.00', 14),
(66, 'bulk_unit919_1732757658.xlsx', '2024-11-28 08:34:18.00', 14),
(67, 'bulk_unit118_1732757667.xlsx', '2024-11-28 08:34:27.00', 14),
(68, 'bulk_unit524_1732757679.xlsx', '2024-11-28 08:34:39.00', 14),
(69, 'bulk_unit658_1732757689.xlsx', '2024-11-28 08:34:49.00', 14),
(70, 'bulk_unit914_1732757699.xlsx', '2024-11-28 08:34:59.00', 14),
(71, 'bulk_unit131_1732757713.xlsx', '2024-11-28 08:35:13.00', 14),
(72, 'bulk_unit229_1732757729.xlsx', '2024-11-28 08:35:29.00', 14),
(73, 'bulk_unit614_1732757738.xlsx', '2024-11-28 08:35:38.00', 14),
(74, 'bulk_unit528_1732765464.xlsx', '2024-11-28 10:44:24.00', 5),
(75, 'bulk_unit456_1732765579.xlsx', '2024-11-28 10:46:19.00', 5),
(76, 'bulk_unit313_1732765621.xlsx', '2024-11-28 10:47:01.00', 5),
(77, 'bulk_unit853_1732765648.xlsx', '2024-11-28 10:47:28.00', 5),
(78, 'bulk_unit649_1732765775.xlsx', '2024-11-28 10:49:35.00', 5),
(79, 'bulk_unit625_1732777053.xlsx', '2024-11-28 13:57:33.00', 5);

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
(11, 'Logitech Signature Slim Keyboard K950', 'PA24-0001', '736_1731394912.webp', 1),
(12, 'Logitech MX Anywhere 3S', 'PA24-0002', '304_1731394932.webp', 1),
(13, 'ThinkPad T14s Gen 4 (14″ AMD)', 'PC24-0001', '859_1731395020.jpg', 3),
(14, 'Generic Mousepad Small', 'PA24-0003', '409_1731395120.jpeg', 1),
(15, 'Sennheisser HD600', 'VD24-0001', '959_1731395082.jpeg', 2),
(16, 'Shure SM7B', 'VD24-0002', '121_1731395169.jpeg', 2),
(18, 'TC-Helicon GOXLR', 'VD24-0003', '903_1731395204.jpeg', 2),
(25, 'USB-C Hub Multi Dongle', 'PA24-0004', '624_1731395239.jpeg', 1),
(26, 'Macbook Air M3', 'PC24-0002', '116_1731395279.jpeg', 3),
(27, 'Sony A7 iv', 'VD24-0004', '302_1731460840.webp', 2),
(28, 'Test FlakPz Gepard', 'TC24-0001', '945_1732075232.jpeg', 4),
(29, 'Test Item 1', 'TC24-0002', '382_1732155439.jpeg', 4),
(30, 'Test G1', 'TC24-0003', '744_1732155555.jpg', 4),
(31, 'Laptop Backpack M24', 'PU24-0001', '646_1732515992.jpeg', 7),
(32, 'Suffers Mk1', 'TC24-0004', '476_1732519661.jpeg', 4),
(33, 'Computer Desk Mk1 M2024', 'DK24-0001', '423_1732606553.jpeg', 9);

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
(7, 'Personal Utility Item', 'PU'),
(9, 'Desk', 'DK');

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
(1, 11, 1, 5, 'new data after purge', 'PA24-0001-0001', 1, 14),
(2, 11, 1, 6, 'new data after purge', 'PA24-0001-0002', 1, 14),
(3, 11, 1, 7, 'new data after purge', 'PA24-0001-0003', 1, 14),
(4, 11, 1, 8, 'new data after purge', 'PA24-0001-0004', 1, 14),
(5, 11, 1, 9, 'new data after purge', 'PA24-0001-0005', 1, 14),
(6, 11, 1, 10, 'new data after purge', 'PA24-0001-0006', 1, 14),
(7, 11, 1, 11, 'new data after purge', 'PA24-0001-0007', 1, 14),
(8, 11, 1, 13, 'new data after purge', 'PA24-0001-0008', 1, 14),
(9, 11, 1, 5, 'new data after purge', 'PA24-0001-0009', 1, 14),
(10, 11, 1, 6, 'new data after purge', 'PA24-0001-0010', 1, 14),
(11, 11, 1, 7, 'new data after purge', 'PA24-0001-0011', 1, 14),
(12, 11, 1, 8, 'new data after purge', 'PA24-0001-0012', 1, 14),
(13, 11, 1, 9, 'new data after purge', 'PA24-0001-0013', 1, 14),
(14, 11, 1, 10, 'new data after purge', 'PA24-0001-0014', 1, 14),
(15, 11, 1, 11, 'new data after purge', 'PA24-0001-0015', 1, 14),
(16, 11, 1, 13, 'new data after purge', 'PA24-0001-0016', 1, 14),
(17, 11, 1, 5, 'new data after purge', 'PA24-0001-0017', 1, 14),
(18, 11, 1, 6, 'new data after purge', 'PA24-0001-0018', 1, 14),
(19, 11, 1, 7, 'new data after purge', 'PA24-0001-0019', 1, 14),
(20, 11, 1, 8, 'new data after purge', 'PA24-0001-0020', 1, 14),
(21, 11, 1, 9, 'new data after purge', 'PA24-0001-0021', 1, 14),
(22, 11, 1, 10, 'new data after purge', 'PA24-0001-0022', 1, 14),
(23, 11, 1, 11, 'new data after purge', 'PA24-0001-0023', 1, 14),
(24, 11, 1, 13, 'new data after purge', 'PA24-0001-0024', 1, 14),
(25, 11, 1, 5, 'new data after purge', 'PA24-0001-0025', 1, 14),
(26, 11, 1, 6, 'new data after purge', 'PA24-0001-0026', 1, 14),
(27, 11, 1, 7, 'new data after purge', 'PA24-0001-0027', 1, 14),
(28, 11, 1, 8, 'new data after purge', 'PA24-0001-0028', 1, 14),
(29, 11, 1, 9, 'new data after purge', 'PA24-0001-0029', 1, 14),
(30, 11, 1, 10, 'new data after purge', 'PA24-0001-0030', 1, 14),
(31, 11, 1, 11, 'new data after purge', 'PA24-0001-0031', 1, 14),
(32, 11, 1, 13, 'new data after purge', 'PA24-0001-0032', 1, 14),
(33, 11, 1, 5, 'new data after purge', 'PA24-0001-0033', 1, 14),
(34, 11, 1, 6, 'new data after purge', 'PA24-0001-0034', 1, 14),
(35, 11, 1, 7, 'new data after purge', 'PA24-0001-0035', 1, 14),
(36, 11, 1, 8, 'new data after purge', 'PA24-0001-0036', 1, 14),
(37, 11, 1, 9, 'new data after purge', 'PA24-0001-0037', 1, 14),
(38, 11, 1, 10, 'new data after purge', 'PA24-0001-0038', 1, 14),
(39, 11, 1, 11, 'new data after purge', 'PA24-0001-0039', 1, 14),
(40, 11, 1, 13, 'new data after purge', 'PA24-0001-0040', 1, 14),
(41, 11, 1, 5, 'new data after purge', 'PA24-0001-0041', 1, 14),
(42, 11, 1, 6, 'new data after purge', 'PA24-0001-0042', 1, 14),
(43, 11, 1, 7, 'new data after purge', 'PA24-0001-0043', 1, 14),
(44, 11, 1, 8, 'new data after purge', 'PA24-0001-0044', 1, 14),
(45, 11, 1, 9, 'new data after purge', 'PA24-0001-0045', 1, 14),
(46, 11, 1, 10, 'new data after purge', 'PA24-0001-0046', 1, 14),
(47, 11, 1, 11, 'new data after purge', 'PA24-0001-0047', 1, 14),
(48, 11, 1, 13, 'new data after purge', 'PA24-0001-0048', 1, 14),
(49, 11, 1, 5, 'new data after purge', 'PA24-0001-0049', 1, 14),
(50, 11, 1, 6, 'new data after purge', 'PA24-0001-0050', 1, 14),
(51, 11, 1, 7, 'new data after purge', 'PA24-0001-0051', 1, 14),
(52, 11, 1, 8, 'new data after purge', 'PA24-0001-0052', 1, 14),
(53, 11, 1, 9, 'new data after purge', 'PA24-0001-0053', 1, 14),
(54, 11, 1, 10, 'new data after purge', 'PA24-0001-0054', 1, 14),
(55, 11, 1, 11, 'new data after purge', 'PA24-0001-0055', 1, 14),
(56, 11, 1, 13, 'new data after purge', 'PA24-0001-0056', 1, 14),
(57, 11, 1, 5, 'new data after purge', 'PA24-0001-0057', 1, 14),
(58, 11, 1, 6, 'new data after purge', 'PA24-0001-0058', 1, 14),
(59, 11, 1, 7, 'new data after purge', 'PA24-0001-0059', 1, 14),
(60, 11, 1, 8, 'new data after purge', 'PA24-0001-0060', 1, 14),
(61, 11, 1, 9, 'new data after purge', 'PA24-0001-0061', 1, 14),
(62, 11, 1, 10, 'new data after purge', 'PA24-0001-0062', 1, 14),
(63, 11, 1, 11, 'new data after purge', 'PA24-0001-0063', 1, 14),
(64, 11, 1, 13, 'new data after purge', 'PA24-0001-0064', 1, 14),
(65, 33, 1, 5, 'new data after purge', 'DK24-0001-0001', 1, 14),
(66, 33, 2, 6, 'new data after purge', 'DK24-0001-0002', 1, 14),
(67, 33, 1, 7, 'new data after purge', 'DK24-0001-0003', 1, 14),
(68, 33, 1, 8, 'new data after purge', 'DK24-0001-0004', 1, 14),
(69, 33, 1, 9, 'new data after purge', 'DK24-0001-0005', 1, 14),
(70, 33, 1, 10, 'new data after purge', 'DK24-0001-0006', 1, 14),
(71, 33, 1, 11, 'new data after purge', 'DK24-0001-0007', 1, 14),
(72, 33, 1, 13, 'new data after purge', 'DK24-0001-0008', 1, 14),
(73, 33, 1, 5, 'new data after purge', 'DK24-0001-0009', 1, 14),
(74, 33, 1, 6, 'new data after purge', 'DK24-0001-0010', 1, 14),
(75, 33, 1, 7, 'new data after purge', 'DK24-0001-0011', 1, 14),
(76, 33, 1, 8, 'new data after purge', 'DK24-0001-0012', 1, 14),
(77, 33, 1, 9, 'new data after purge', 'DK24-0001-0013', 1, 14),
(78, 33, 1, 10, 'new data after purge', 'DK24-0001-0014', 1, 14),
(79, 33, 1, 11, 'new data after purge', 'DK24-0001-0015', 1, 14),
(80, 33, 1, 13, 'new data after purge', 'DK24-0001-0016', 1, 14),
(81, 33, 1, 5, 'new data after purge', 'DK24-0001-0017', 1, 14),
(82, 33, 1, 6, 'new data after purge', 'DK24-0001-0018', 1, 14),
(83, 33, 1, 7, 'new data after purge', 'DK24-0001-0019', 1, 14),
(84, 33, 1, 8, 'new data after purge', 'DK24-0001-0020', 1, 14),
(85, 33, 1, 9, 'new data after purge', 'DK24-0001-0021', 1, 14),
(86, 33, 1, 10, 'new data after purge', 'DK24-0001-0022', 1, 14),
(87, 33, 1, 11, 'new data after purge', 'DK24-0001-0023', 1, 14),
(88, 33, 1, 13, 'new data after purge', 'DK24-0001-0024', 1, 14),
(89, 33, 1, 5, 'new data after purge', 'DK24-0001-0025', 1, 14),
(90, 33, 1, 6, 'new data after purge', 'DK24-0001-0026', 1, 14),
(91, 33, 1, 7, 'new data after purge', 'DK24-0001-0027', 1, 14),
(92, 33, 1, 8, 'new data after purge', 'DK24-0001-0028', 1, 14),
(93, 33, 1, 9, 'new data after purge', 'DK24-0001-0029', 1, 14),
(94, 33, 1, 10, 'new data after purge', 'DK24-0001-0030', 1, 14),
(95, 33, 1, 11, 'new data after purge', 'DK24-0001-0031', 1, 14),
(96, 33, 1, 13, 'new data after purge', 'DK24-0001-0032', 1, 14),
(97, 33, 1, 5, 'new data after purge', 'DK24-0001-0033', 1, 14),
(98, 33, 1, 6, 'new data after purge', 'DK24-0001-0034', 1, 14),
(99, 33, 1, 7, 'new data after purge', 'DK24-0001-0035', 1, 14),
(100, 33, 1, 8, 'new data after purge', 'DK24-0001-0036', 1, 14),
(101, 33, 1, 9, 'new data after purge', 'DK24-0001-0037', 1, 14),
(102, 33, 1, 10, 'new data after purge', 'DK24-0001-0038', 1, 14),
(103, 33, 1, 11, 'new data after purge', 'DK24-0001-0039', 1, 14),
(104, 33, 1, 13, 'new data after purge', 'DK24-0001-0040', 1, 14),
(105, 33, 1, 5, 'new data after purge', 'DK24-0001-0041', 1, 14),
(106, 33, 1, 6, 'new data after purge', 'DK24-0001-0042', 1, 14),
(107, 33, 1, 7, 'new data after purge', 'DK24-0001-0043', 1, 14),
(108, 33, 1, 8, 'new data after purge', 'DK24-0001-0044', 1, 14),
(109, 33, 1, 9, 'new data after purge', 'DK24-0001-0045', 1, 14),
(110, 33, 1, 10, 'new data after purge', 'DK24-0001-0046', 1, 14),
(111, 33, 1, 11, 'new data after purge', 'DK24-0001-0047', 1, 14),
(112, 33, 1, 13, 'new data after purge', 'DK24-0001-0048', 1, 14),
(113, 33, 1, 5, 'new data after purge', 'DK24-0001-0049', 1, 14),
(114, 33, 1, 6, 'new data after purge', 'DK24-0001-0050', 1, 14),
(115, 33, 1, 7, 'new data after purge', 'DK24-0001-0051', 1, 14),
(116, 33, 1, 8, 'new data after purge', 'DK24-0001-0052', 1, 14),
(117, 33, 1, 9, 'new data after purge', 'DK24-0001-0053', 1, 14),
(118, 33, 1, 10, 'new data after purge', 'DK24-0001-0054', 1, 14),
(119, 33, 1, 11, 'new data after purge', 'DK24-0001-0055', 1, 14),
(120, 33, 1, 13, 'new data after purge', 'DK24-0001-0056', 1, 14),
(121, 33, 1, 5, 'new data after purge', 'DK24-0001-0057', 1, 14),
(122, 33, 1, 6, 'new data after purge', 'DK24-0001-0058', 1, 14),
(123, 33, 1, 7, 'new data after purge', 'DK24-0001-0059', 1, 14),
(124, 33, 1, 8, 'new data after purge', 'DK24-0001-0060', 1, 14),
(125, 33, 1, 9, 'new data after purge', 'DK24-0001-0061', 1, 14),
(126, 33, 1, 10, 'new data after purge', 'DK24-0001-0062', 1, 14),
(127, 33, 1, 11, 'new data after purge', 'DK24-0001-0063', 1, 14),
(128, 33, 1, 13, 'new data after purge', 'DK24-0001-0064', 1, 14),
(129, 12, 1, 13, 'rep sample', 'PA24-0002-0001', 2, 1),
(130, 12, 1, 6, 'new data after purge', 'PA24-0002-0002', 1, 14),
(131, 12, 1, 7, 'new data after purge', 'PA24-0002-0003', 1, 14),
(132, 12, 1, 8, 'new data after purge', 'PA24-0002-0004', 1, 14),
(133, 12, 1, 9, 'new data after purge', 'PA24-0002-0005', 1, 14),
(134, 12, 1, 10, 'new data after purge', 'PA24-0002-0006', 1, 14),
(135, 12, 1, 11, 'new data after purge', 'PA24-0002-0007', 1, 14),
(136, 12, 1, 13, 'new data after purge', 'PA24-0002-0008', 1, 14),
(137, 12, 1, 5, 'new data after purge', 'PA24-0002-0009', 1, 14),
(138, 12, 1, 6, 'new data after purge', 'PA24-0002-0010', 1, 14),
(139, 12, 1, 7, 'new data after purge', 'PA24-0002-0011', 1, 14),
(140, 12, 1, 8, 'new data after purge', 'PA24-0002-0012', 1, 14),
(141, 12, 1, 9, 'new data after purge', 'PA24-0002-0013', 1, 14),
(142, 12, 1, 10, 'new data after purge', 'PA24-0002-0014', 1, 14),
(143, 12, 1, 11, 'new data after purge', 'PA24-0002-0015', 1, 14),
(144, 12, 1, 13, 'new data after purge', 'PA24-0002-0016', 1, 14),
(145, 12, 1, 5, 'new data after purge', 'PA24-0002-0017', 1, 14),
(146, 12, 1, 6, 'new data after purge', 'PA24-0002-0018', 1, 14),
(147, 12, 1, 7, 'new data after purge', 'PA24-0002-0019', 1, 14),
(148, 12, 1, 8, 'new data after purge', 'PA24-0002-0020', 1, 14),
(149, 12, 1, 9, 'new data after purge', 'PA24-0002-0021', 1, 14),
(150, 12, 1, 10, 'new data after purge', 'PA24-0002-0022', 1, 14),
(151, 12, 1, 11, 'new data after purge', 'PA24-0002-0023', 1, 14),
(152, 12, 1, 13, 'new data after purge', 'PA24-0002-0024', 1, 14),
(153, 12, 1, 5, 'new data after purge', 'PA24-0002-0025', 1, 14),
(154, 12, 1, 6, 'new data after purge', 'PA24-0002-0026', 1, 14),
(155, 12, 1, 7, 'new data after purge', 'PA24-0002-0027', 1, 14),
(156, 12, 1, 8, 'new data after purge', 'PA24-0002-0028', 1, 14),
(157, 12, 1, 9, 'new data after purge', 'PA24-0002-0029', 1, 14),
(158, 12, 1, 10, 'new data after purge', 'PA24-0002-0030', 1, 14),
(159, 12, 1, 11, 'new data after purge', 'PA24-0002-0031', 1, 14),
(160, 12, 1, 13, 'new data after purge', 'PA24-0002-0032', 1, 14),
(161, 12, 1, 5, 'new data after purge', 'PA24-0002-0033', 1, 14),
(162, 12, 1, 6, 'new data after purge', 'PA24-0002-0034', 1, 14),
(163, 12, 1, 7, 'new data after purge', 'PA24-0002-0035', 1, 14),
(164, 12, 1, 8, 'new data after purge', 'PA24-0002-0036', 1, 14),
(165, 12, 1, 9, 'new data after purge', 'PA24-0002-0037', 1, 14),
(166, 12, 1, 10, 'new data after purge', 'PA24-0002-0038', 1, 14),
(167, 12, 1, 11, 'new data after purge', 'PA24-0002-0039', 1, 14),
(168, 12, 1, 13, 'new data after purge', 'PA24-0002-0040', 1, 14),
(169, 12, 1, 5, 'new data after purge', 'PA24-0002-0041', 1, 14),
(170, 12, 1, 6, 'new data after purge', 'PA24-0002-0042', 1, 14),
(171, 12, 1, 7, 'new data after purge', 'PA24-0002-0043', 1, 14),
(172, 12, 1, 8, 'new data after purge', 'PA24-0002-0044', 1, 14),
(173, 12, 1, 9, 'new data after purge', 'PA24-0002-0045', 1, 14),
(174, 12, 1, 10, 'new data after purge', 'PA24-0002-0046', 1, 14),
(175, 12, 1, 11, 'new data after purge', 'PA24-0002-0047', 1, 14),
(176, 12, 1, 13, 'new data after purge', 'PA24-0002-0048', 1, 14),
(177, 12, 1, 5, 'new data after purge', 'PA24-0002-0049', 1, 14),
(178, 12, 1, 6, 'new data after purge', 'PA24-0002-0050', 1, 14),
(179, 12, 1, 7, 'new data after purge', 'PA24-0002-0051', 1, 14),
(180, 12, 1, 8, 'new data after purge', 'PA24-0002-0052', 1, 14),
(181, 12, 1, 9, 'new data after purge', 'PA24-0002-0053', 1, 14),
(182, 12, 1, 10, 'new data after purge', 'PA24-0002-0054', 1, 14),
(183, 12, 1, 11, 'new data after purge', 'PA24-0002-0055', 1, 14),
(184, 12, 1, 13, 'new data after purge', 'PA24-0002-0056', 1, 14),
(185, 12, 1, 5, 'new data after purge', 'PA24-0002-0057', 1, 14),
(186, 12, 1, 6, 'new data after purge', 'PA24-0002-0058', 1, 14),
(187, 12, 1, 7, 'new data after purge', 'PA24-0002-0059', 1, 14),
(188, 12, 1, 8, 'new data after purge', 'PA24-0002-0060', 1, 14),
(189, 12, 1, 9, 'new data after purge', 'PA24-0002-0061', 1, 14),
(190, 12, 1, 10, 'new data after purge', 'PA24-0002-0062', 1, 14),
(191, 12, 1, 11, 'new data after purge', 'PA24-0002-0063', 1, 14),
(192, 12, 1, 13, 'new data after purge', 'PA24-0002-0064', 1, 14),
(193, 13, 1, 5, 'rep sample', 'PC24-0001-0001', 2, 14),
(194, 13, 1, 6, 'new data after purge', 'PC24-0001-0002', 1, 14),
(195, 13, 1, 7, 'new data after purge', 'PC24-0001-0003', 1, 14),
(196, 13, 1, 8, 'new data after purge', 'PC24-0001-0004', 1, 14),
(197, 13, 1, 9, 'new data after purge', 'PC24-0001-0005', 1, 14),
(198, 13, 1, 10, 'new data after purge', 'PC24-0001-0006', 1, 14),
(199, 13, 1, 11, 'new data after purge', 'PC24-0001-0007', 1, 14),
(200, 13, 1, 13, 'new data after purge', 'PC24-0001-0008', 1, 14),
(201, 13, 1, 5, 'new data after purge', 'PC24-0001-0009', 1, 14),
(202, 13, 1, 6, 'new data after purge', 'PC24-0001-0010', 1, 14),
(203, 13, 1, 7, 'new data after purge', 'PC24-0001-0011', 1, 14),
(204, 13, 1, 8, 'new data after purge', 'PC24-0001-0012', 1, 14),
(205, 13, 1, 9, 'new data after purge', 'PC24-0001-0013', 1, 14),
(206, 13, 1, 10, 'new data after purge', 'PC24-0001-0014', 1, 14),
(207, 13, 1, 11, 'new data after purge', 'PC24-0001-0015', 1, 14),
(208, 13, 1, 13, 'new data after purge', 'PC24-0001-0016', 1, 14),
(209, 13, 1, 5, 'new data after purge', 'PC24-0001-0017', 1, 14),
(210, 13, 1, 6, 'new data after purge', 'PC24-0001-0018', 1, 14),
(211, 13, 1, 7, 'new data after purge', 'PC24-0001-0019', 1, 14),
(212, 13, 1, 8, 'new data after purge', 'PC24-0001-0020', 1, 14),
(213, 13, 1, 9, 'new data after purge', 'PC24-0001-0021', 1, 14),
(214, 13, 1, 10, 'new data after purge', 'PC24-0001-0022', 1, 14),
(215, 13, 1, 11, 'new data after purge', 'PC24-0001-0023', 1, 14),
(216, 13, 1, 13, 'new data after purge', 'PC24-0001-0024', 1, 14),
(217, 13, 1, 5, 'new data after purge', 'PC24-0001-0025', 1, 14),
(218, 13, 1, 6, 'new data after purge', 'PC24-0001-0026', 1, 14),
(219, 13, 1, 7, 'new data after purge', 'PC24-0001-0027', 1, 14),
(220, 13, 1, 8, 'new data after purge', 'PC24-0001-0028', 1, 14),
(221, 13, 1, 9, 'new data after purge', 'PC24-0001-0029', 1, 14),
(222, 13, 1, 10, 'new data after purge', 'PC24-0001-0030', 1, 14),
(223, 13, 1, 11, 'new data after purge', 'PC24-0001-0031', 1, 14),
(224, 13, 1, 13, 'new data after purge', 'PC24-0001-0032', 1, 14),
(225, 13, 1, 5, 'new data after purge', 'PC24-0001-0033', 1, 14),
(226, 13, 1, 6, 'new data after purge', 'PC24-0001-0034', 1, 14),
(227, 13, 1, 7, 'new data after purge', 'PC24-0001-0035', 1, 14),
(228, 13, 1, 8, 'new data after purge', 'PC24-0001-0036', 1, 14),
(229, 13, 1, 9, 'new data after purge', 'PC24-0001-0037', 1, 14),
(230, 13, 1, 10, 'new data after purge', 'PC24-0001-0038', 1, 14),
(231, 13, 1, 11, 'new data after purge', 'PC24-0001-0039', 1, 14),
(232, 13, 1, 13, 'new data after purge', 'PC24-0001-0040', 1, 14),
(233, 13, 1, 5, 'new data after purge', 'PC24-0001-0041', 1, 14),
(234, 13, 1, 6, 'new data after purge', 'PC24-0001-0042', 1, 14),
(235, 13, 1, 7, 'new data after purge', 'PC24-0001-0043', 1, 14),
(236, 13, 1, 8, 'new data after purge', 'PC24-0001-0044', 1, 14),
(237, 13, 1, 9, 'new data after purge', 'PC24-0001-0045', 1, 14),
(238, 13, 1, 10, 'new data after purge', 'PC24-0001-0046', 1, 14),
(239, 13, 1, 11, 'new data after purge', 'PC24-0001-0047', 1, 14),
(240, 13, 1, 13, 'new data after purge', 'PC24-0001-0048', 1, 14),
(241, 13, 1, 5, 'new data after purge', 'PC24-0001-0049', 1, 14),
(242, 13, 1, 6, 'new data after purge', 'PC24-0001-0050', 1, 14),
(243, 13, 1, 7, 'new data after purge', 'PC24-0001-0051', 1, 14),
(244, 13, 1, 8, 'new data after purge', 'PC24-0001-0052', 1, 14),
(245, 13, 1, 9, 'new data after purge', 'PC24-0001-0053', 1, 14),
(246, 13, 1, 10, 'new data after purge', 'PC24-0001-0054', 1, 14),
(247, 13, 1, 11, 'new data after purge', 'PC24-0001-0055', 1, 14),
(248, 13, 1, 13, 'new data after purge', 'PC24-0001-0056', 1, 14),
(249, 13, 1, 5, 'new data after purge', 'PC24-0001-0057', 1, 14),
(250, 13, 1, 6, 'new data after purge', 'PC24-0001-0058', 1, 14),
(251, 13, 1, 7, 'new data after purge', 'PC24-0001-0059', 1, 14),
(252, 13, 1, 8, 'new data after purge', 'PC24-0001-0060', 1, 14),
(253, 13, 1, 9, 'new data after purge', 'PC24-0001-0061', 1, 14),
(254, 13, 1, 10, 'new data after purge', 'PC24-0001-0062', 1, 14),
(255, 13, 1, 11, 'new data after purge', 'PC24-0001-0063', 1, 14),
(256, 13, 1, 13, 'new data after purge', 'PC24-0001-0064', 1, 14),
(257, 14, 1, 7, 'rep sample', 'PA24-0003-0001', 2, 14),
(258, 14, 1, 6, 'new data after purge', 'PA24-0003-0002', 1, 14),
(259, 14, 1, 7, 'new data after purge', 'PA24-0003-0003', 1, 14),
(260, 14, 1, 8, 'new data after purge', 'PA24-0003-0004', 1, 14),
(261, 14, 1, 9, 'new data after purge', 'PA24-0003-0005', 1, 14),
(262, 14, 1, 10, 'new data after purge', 'PA24-0003-0006', 1, 14),
(263, 14, 1, 11, 'new data after purge', 'PA24-0003-0007', 1, 14),
(264, 14, 1, 13, 'new data after purge', 'PA24-0003-0008', 1, 14),
(265, 14, 1, 5, 'new data after purge', 'PA24-0003-0009', 1, 14),
(266, 14, 1, 6, 'new data after purge', 'PA24-0003-0010', 1, 14),
(267, 14, 1, 7, 'new data after purge', 'PA24-0003-0011', 1, 14),
(268, 14, 1, 8, 'new data after purge', 'PA24-0003-0012', 1, 14),
(269, 14, 1, 9, 'new data after purge', 'PA24-0003-0013', 1, 14),
(270, 14, 1, 10, 'new data after purge', 'PA24-0003-0014', 1, 14),
(271, 14, 1, 11, 'new data after purge', 'PA24-0003-0015', 1, 14),
(272, 14, 1, 13, 'new data after purge', 'PA24-0003-0016', 1, 14),
(273, 14, 1, 5, 'new data after purge', 'PA24-0003-0017', 1, 14),
(274, 14, 1, 6, 'new data after purge', 'PA24-0003-0018', 1, 14),
(275, 14, 1, 7, 'new data after purge', 'PA24-0003-0019', 1, 14),
(276, 14, 1, 8, 'new data after purge', 'PA24-0003-0020', 1, 14),
(277, 14, 1, 9, 'new data after purge', 'PA24-0003-0021', 1, 14),
(278, 14, 1, 10, 'new data after purge', 'PA24-0003-0022', 1, 14),
(279, 14, 1, 11, 'new data after purge', 'PA24-0003-0023', 1, 14),
(280, 14, 1, 13, 'new data after purge', 'PA24-0003-0024', 1, 14),
(281, 14, 1, 5, 'new data after purge', 'PA24-0003-0025', 1, 14),
(282, 14, 1, 6, 'new data after purge', 'PA24-0003-0026', 1, 14),
(283, 14, 1, 7, 'new data after purge', 'PA24-0003-0027', 1, 14),
(284, 14, 1, 8, 'new data after purge', 'PA24-0003-0028', 1, 14),
(285, 14, 1, 9, 'new data after purge', 'PA24-0003-0029', 1, 14),
(286, 14, 1, 10, 'new data after purge', 'PA24-0003-0030', 1, 14),
(287, 14, 1, 11, 'new data after purge', 'PA24-0003-0031', 1, 14),
(288, 14, 1, 13, 'new data after purge', 'PA24-0003-0032', 1, 14),
(289, 14, 1, 5, 'new data after purge', 'PA24-0003-0033', 1, 14),
(290, 14, 1, 6, 'new data after purge', 'PA24-0003-0034', 1, 14),
(291, 14, 1, 7, 'new data after purge', 'PA24-0003-0035', 1, 14),
(292, 14, 1, 8, 'new data after purge', 'PA24-0003-0036', 1, 14),
(293, 14, 1, 9, 'new data after purge', 'PA24-0003-0037', 1, 14),
(294, 14, 1, 10, 'new data after purge', 'PA24-0003-0038', 1, 14),
(295, 14, 1, 11, 'new data after purge', 'PA24-0003-0039', 1, 14),
(296, 14, 1, 13, 'new data after purge', 'PA24-0003-0040', 1, 14),
(297, 14, 1, 5, 'new data after purge', 'PA24-0003-0041', 1, 14),
(298, 14, 1, 6, 'new data after purge', 'PA24-0003-0042', 1, 14),
(299, 14, 1, 7, 'new data after purge', 'PA24-0003-0043', 1, 14),
(300, 14, 1, 8, 'new data after purge', 'PA24-0003-0044', 1, 14),
(301, 14, 1, 9, 'new data after purge', 'PA24-0003-0045', 1, 14),
(302, 14, 1, 10, 'new data after purge', 'PA24-0003-0046', 1, 14),
(303, 14, 1, 11, 'new data after purge', 'PA24-0003-0047', 1, 14),
(304, 14, 1, 13, 'new data after purge', 'PA24-0003-0048', 1, 14),
(305, 14, 1, 5, 'new data after purge', 'PA24-0003-0049', 1, 14),
(306, 14, 1, 6, 'new data after purge', 'PA24-0003-0050', 1, 14),
(307, 14, 1, 7, 'new data after purge', 'PA24-0003-0051', 1, 14),
(308, 14, 1, 8, 'new data after purge', 'PA24-0003-0052', 1, 14),
(309, 14, 1, 9, 'new data after purge', 'PA24-0003-0053', 1, 14),
(310, 14, 1, 10, 'new data after purge', 'PA24-0003-0054', 1, 14),
(311, 14, 1, 11, 'new data after purge', 'PA24-0003-0055', 1, 14),
(312, 14, 1, 13, 'new data after purge', 'PA24-0003-0056', 1, 14),
(313, 14, 1, 5, 'new data after purge', 'PA24-0003-0057', 1, 14),
(314, 14, 1, 6, 'new data after purge', 'PA24-0003-0058', 1, 14),
(315, 14, 1, 7, 'new data after purge', 'PA24-0003-0059', 1, 14),
(316, 14, 1, 8, 'new data after purge', 'PA24-0003-0060', 1, 14),
(317, 14, 1, 9, 'new data after purge', 'PA24-0003-0061', 1, 14),
(318, 14, 1, 10, 'new data after purge', 'PA24-0003-0062', 1, 14),
(319, 14, 1, 11, 'new data after purge', 'PA24-0003-0063', 1, 14),
(320, 14, 1, 13, 'new data after purge', 'PA24-0003-0064', 1, 14),
(321, 15, 3, NULL, 'rep sample', 'VD24-0001-0001', 2, 14),
(322, 15, 1, 6, 'new data after purge', 'VD24-0001-0002', 1, 14),
(323, 15, 1, 7, 'new data after purge', 'VD24-0001-0003', 1, 14),
(324, 15, 1, 8, 'new data after purge', 'VD24-0001-0004', 1, 14),
(325, 15, 1, 9, 'new data after purge', 'VD24-0001-0005', 1, 14),
(326, 15, 1, 10, 'new data after purge', 'VD24-0001-0006', 1, 14),
(327, 15, 1, 11, 'new data after purge', 'VD24-0001-0007', 1, 14),
(328, 15, 1, 13, 'new data after purge', 'VD24-0001-0008', 1, 14),
(329, 15, 1, 5, 'new data after purge', 'VD24-0001-0009', 1, 14),
(330, 15, 1, 6, 'new data after purge', 'VD24-0001-0010', 1, 14),
(331, 15, 1, 7, 'new data after purge', 'VD24-0001-0011', 1, 14),
(332, 15, 1, 8, 'new data after purge', 'VD24-0001-0012', 1, 14),
(333, 15, 1, 9, 'new data after purge', 'VD24-0001-0013', 1, 14),
(334, 15, 1, 10, 'new data after purge', 'VD24-0001-0014', 1, 14),
(335, 15, 1, 11, 'new data after purge', 'VD24-0001-0015', 1, 14),
(336, 15, 1, 13, 'new data after purge', 'VD24-0001-0016', 1, 14),
(337, 15, 1, 5, 'new data after purge', 'VD24-0001-0017', 1, 14),
(338, 15, 1, 6, 'new data after purge', 'VD24-0001-0018', 1, 14),
(339, 15, 1, 7, 'new data after purge', 'VD24-0001-0019', 1, 14),
(340, 15, 1, 8, 'new data after purge', 'VD24-0001-0020', 1, 14),
(341, 15, 1, 9, 'new data after purge', 'VD24-0001-0021', 1, 14),
(342, 15, 1, 10, 'new data after purge', 'VD24-0001-0022', 1, 14),
(343, 15, 1, 11, 'new data after purge', 'VD24-0001-0023', 1, 14),
(344, 15, 1, 13, 'new data after purge', 'VD24-0001-0024', 1, 14),
(345, 15, 1, 5, 'new data after purge', 'VD24-0001-0025', 1, 14),
(346, 15, 1, 6, 'new data after purge', 'VD24-0001-0026', 1, 14),
(347, 15, 1, 7, 'new data after purge', 'VD24-0001-0027', 1, 14),
(348, 15, 1, 8, 'new data after purge', 'VD24-0001-0028', 1, 14),
(349, 15, 1, 9, 'new data after purge', 'VD24-0001-0029', 1, 14),
(350, 15, 1, 10, 'new data after purge', 'VD24-0001-0030', 1, 14),
(351, 15, 1, 11, 'new data after purge', 'VD24-0001-0031', 1, 14),
(352, 15, 1, 13, 'new data after purge', 'VD24-0001-0032', 1, 14),
(353, 15, 1, 5, 'new data after purge', 'VD24-0001-0033', 1, 14),
(354, 15, 1, 6, 'new data after purge', 'VD24-0001-0034', 1, 14),
(355, 15, 1, 7, 'new data after purge', 'VD24-0001-0035', 1, 14),
(356, 15, 1, 8, 'new data after purge', 'VD24-0001-0036', 1, 14),
(357, 15, 1, 9, 'new data after purge', 'VD24-0001-0037', 1, 14),
(358, 15, 1, 10, 'new data after purge', 'VD24-0001-0038', 1, 14),
(359, 15, 1, 11, 'new data after purge', 'VD24-0001-0039', 1, 14),
(360, 15, 1, 13, 'new data after purge', 'VD24-0001-0040', 1, 14),
(361, 15, 1, 5, 'new data after purge', 'VD24-0001-0041', 1, 14),
(362, 15, 1, 6, 'new data after purge', 'VD24-0001-0042', 1, 14),
(363, 15, 1, 7, 'new data after purge', 'VD24-0001-0043', 1, 14),
(364, 15, 1, 8, 'new data after purge', 'VD24-0001-0044', 1, 14),
(365, 15, 1, 9, 'new data after purge', 'VD24-0001-0045', 1, 14),
(366, 15, 1, 10, 'new data after purge', 'VD24-0001-0046', 1, 14),
(367, 15, 1, 11, 'new data after purge', 'VD24-0001-0047', 1, 14),
(368, 15, 1, 13, 'new data after purge', 'VD24-0001-0048', 1, 14),
(369, 15, 1, 5, 'new data after purge', 'VD24-0001-0049', 1, 14),
(370, 15, 1, 6, 'new data after purge', 'VD24-0001-0050', 1, 14),
(371, 15, 1, 7, 'new data after purge', 'VD24-0001-0051', 1, 14),
(372, 15, 1, 8, 'new data after purge', 'VD24-0001-0052', 1, 14),
(373, 15, 1, 9, 'new data after purge', 'VD24-0001-0053', 1, 14),
(374, 15, 1, 10, 'new data after purge', 'VD24-0001-0054', 1, 14),
(375, 15, 1, 11, 'new data after purge', 'VD24-0001-0055', 1, 14),
(376, 15, 1, 13, 'new data after purge', 'VD24-0001-0056', 1, 14),
(377, 15, 1, 5, 'new data after purge', 'VD24-0001-0057', 1, 14),
(378, 15, 1, 6, 'new data after purge', 'VD24-0001-0058', 1, 14),
(379, 15, 1, 7, 'new data after purge', 'VD24-0001-0059', 1, 14),
(380, 15, 1, 8, 'new data after purge', 'VD24-0001-0060', 1, 14),
(381, 15, 1, 9, 'new data after purge', 'VD24-0001-0061', 1, 14),
(382, 15, 1, 10, 'new data after purge', 'VD24-0001-0062', 1, 14),
(383, 15, 1, 11, 'new data after purge', 'VD24-0001-0063', 1, 14),
(384, 15, 1, 13, 'new data after purge', 'VD24-0001-0064', 1, 14),
(385, 16, 3, NULL, 'rep sample', 'VD24-0002-0001', 2, 14),
(386, 16, 1, 6, 'new data after purge', 'VD24-0002-0002', 1, 14),
(387, 16, 1, 7, 'new data after purge', 'VD24-0002-0003', 1, 14),
(388, 16, 1, 8, 'new data after purge', 'VD24-0002-0004', 1, 14),
(389, 16, 1, 9, 'new data after purge', 'VD24-0002-0005', 1, 14),
(390, 16, 1, 10, 'new data after purge', 'VD24-0002-0006', 1, 14),
(391, 16, 1, 11, 'new data after purge', 'VD24-0002-0007', 1, 14),
(392, 16, 1, 13, 'new data after purge', 'VD24-0002-0008', 1, 14),
(393, 16, 1, 5, 'new data after purge', 'VD24-0002-0009', 1, 14),
(394, 16, 1, 6, 'new data after purge', 'VD24-0002-0010', 1, 14),
(395, 16, 1, 7, 'new data after purge', 'VD24-0002-0011', 1, 14),
(396, 16, 1, 8, 'new data after purge', 'VD24-0002-0012', 1, 14),
(397, 16, 1, 9, 'new data after purge', 'VD24-0002-0013', 1, 14),
(398, 16, 1, 10, 'new data after purge', 'VD24-0002-0014', 1, 14),
(399, 16, 1, 11, 'new data after purge', 'VD24-0002-0015', 1, 14),
(400, 16, 1, 13, 'new data after purge', 'VD24-0002-0016', 1, 14),
(401, 16, 1, 5, 'new data after purge', 'VD24-0002-0017', 1, 14),
(402, 16, 1, 6, 'new data after purge', 'VD24-0002-0018', 1, 14),
(403, 16, 1, 7, 'new data after purge', 'VD24-0002-0019', 1, 14),
(404, 16, 1, 8, 'new data after purge', 'VD24-0002-0020', 1, 14),
(405, 16, 1, 9, 'new data after purge', 'VD24-0002-0021', 1, 14),
(406, 16, 1, 10, 'new data after purge', 'VD24-0002-0022', 1, 14),
(407, 16, 1, 11, 'new data after purge', 'VD24-0002-0023', 1, 14),
(408, 16, 1, 13, 'new data after purge', 'VD24-0002-0024', 1, 14),
(409, 16, 1, 5, 'new data after purge', 'VD24-0002-0025', 1, 14),
(410, 16, 1, 6, 'new data after purge', 'VD24-0002-0026', 1, 14),
(411, 16, 1, 7, 'new data after purge', 'VD24-0002-0027', 1, 14),
(412, 16, 1, 8, 'new data after purge', 'VD24-0002-0028', 1, 14),
(413, 16, 1, 9, 'new data after purge', 'VD24-0002-0029', 1, 14),
(414, 16, 1, 10, 'new data after purge', 'VD24-0002-0030', 1, 14),
(415, 16, 1, 11, 'new data after purge', 'VD24-0002-0031', 1, 14),
(416, 16, 1, 13, 'new data after purge', 'VD24-0002-0032', 1, 14),
(417, 16, 1, 5, 'new data after purge', 'VD24-0002-0033', 1, 14),
(418, 16, 1, 6, 'new data after purge', 'VD24-0002-0034', 1, 14),
(419, 16, 1, 7, 'new data after purge', 'VD24-0002-0035', 1, 14),
(420, 16, 1, 8, 'new data after purge', 'VD24-0002-0036', 1, 14),
(421, 16, 1, 9, 'new data after purge', 'VD24-0002-0037', 1, 14),
(422, 16, 1, 10, 'new data after purge', 'VD24-0002-0038', 1, 14),
(423, 16, 1, 11, 'new data after purge', 'VD24-0002-0039', 1, 14),
(424, 16, 1, 13, 'new data after purge', 'VD24-0002-0040', 1, 14),
(425, 16, 1, 5, 'new data after purge', 'VD24-0002-0041', 1, 14),
(426, 16, 1, 6, 'new data after purge', 'VD24-0002-0042', 1, 14),
(427, 16, 1, 7, 'new data after purge', 'VD24-0002-0043', 1, 14),
(428, 16, 1, 8, 'new data after purge', 'VD24-0002-0044', 1, 14),
(429, 16, 1, 9, 'new data after purge', 'VD24-0002-0045', 1, 14),
(430, 16, 1, 10, 'new data after purge', 'VD24-0002-0046', 1, 14),
(431, 16, 1, 11, 'new data after purge', 'VD24-0002-0047', 1, 14),
(432, 16, 1, 13, 'new data after purge', 'VD24-0002-0048', 1, 14),
(433, 16, 1, 5, 'new data after purge', 'VD24-0002-0049', 1, 14),
(434, 16, 1, 6, 'new data after purge', 'VD24-0002-0050', 1, 14),
(435, 16, 1, 7, 'new data after purge', 'VD24-0002-0051', 1, 14),
(436, 16, 1, 8, 'new data after purge', 'VD24-0002-0052', 1, 14),
(437, 16, 1, 9, 'new data after purge', 'VD24-0002-0053', 1, 14),
(438, 16, 1, 10, 'new data after purge', 'VD24-0002-0054', 1, 14),
(439, 16, 1, 11, 'new data after purge', 'VD24-0002-0055', 1, 14),
(440, 16, 1, 13, 'new data after purge', 'VD24-0002-0056', 1, 14),
(441, 16, 1, 5, 'new data after purge', 'VD24-0002-0057', 1, 14),
(442, 16, 1, 6, 'new data after purge', 'VD24-0002-0058', 1, 14),
(443, 16, 1, 7, 'new data after purge', 'VD24-0002-0059', 1, 14),
(444, 16, 1, 8, 'new data after purge', 'VD24-0002-0060', 1, 14),
(445, 16, 1, 9, 'new data after purge', 'VD24-0002-0061', 1, 14),
(446, 16, 1, 10, 'new data after purge', 'VD24-0002-0062', 1, 14),
(447, 16, 1, 11, 'new data after purge', 'VD24-0002-0063', 1, 14),
(448, 16, 1, 13, 'new data after purge', 'VD24-0002-0064', 1, 14),
(449, 18, 1, 5, 'new data after purge', 'VD24-0003-0001', 1, 14),
(450, 18, 2, 6, 'new data after purge', 'VD24-0003-0002', 1, 14),
(451, 18, 1, 7, 'new data after purge', 'VD24-0003-0003', 1, 14),
(452, 18, 1, 8, 'new data after purge', 'VD24-0003-0004', 1, 14),
(453, 18, 1, 9, 'new data after purge', 'VD24-0003-0005', 1, 14),
(454, 18, 1, 10, 'new data after purge', 'VD24-0003-0006', 1, 14),
(455, 18, 1, 11, 'new data after purge', 'VD24-0003-0007', 1, 14),
(456, 18, 1, 13, 'new data after purge', 'VD24-0003-0008', 1, 14),
(457, 18, 1, 5, 'new data after purge', 'VD24-0003-0009', 1, 14),
(458, 18, 1, 6, 'new data after purge', 'VD24-0003-0010', 1, 14),
(459, 18, 1, 7, 'new data after purge', 'VD24-0003-0011', 1, 14),
(460, 18, 1, 8, 'new data after purge', 'VD24-0003-0012', 1, 14),
(461, 18, 1, 9, 'new data after purge', 'VD24-0003-0013', 1, 14),
(462, 18, 1, 10, 'new data after purge', 'VD24-0003-0014', 1, 14),
(463, 18, 1, 11, 'new data after purge', 'VD24-0003-0015', 1, 14),
(464, 18, 1, 13, 'new data after purge', 'VD24-0003-0016', 1, 14),
(465, 18, 1, 5, 'new data after purge', 'VD24-0003-0017', 1, 14),
(466, 18, 1, 6, 'new data after purge', 'VD24-0003-0018', 1, 14),
(467, 18, 1, 7, 'new data after purge', 'VD24-0003-0019', 1, 14),
(468, 18, 1, 8, 'new data after purge', 'VD24-0003-0020', 1, 14),
(469, 18, 1, 9, 'new data after purge', 'VD24-0003-0021', 1, 14),
(470, 18, 1, 10, 'new data after purge', 'VD24-0003-0022', 1, 14),
(471, 18, 1, 11, 'new data after purge', 'VD24-0003-0023', 1, 14),
(472, 18, 1, 13, 'new data after purge', 'VD24-0003-0024', 1, 14),
(473, 18, 1, 5, 'new data after purge', 'VD24-0003-0025', 1, 14),
(474, 18, 1, 6, 'new data after purge', 'VD24-0003-0026', 1, 14),
(475, 18, 1, 7, 'new data after purge', 'VD24-0003-0027', 1, 14),
(476, 18, 1, 8, 'new data after purge', 'VD24-0003-0028', 1, 14),
(477, 18, 1, 9, 'new data after purge', 'VD24-0003-0029', 1, 14),
(478, 18, 1, 10, 'new data after purge', 'VD24-0003-0030', 1, 14),
(479, 18, 1, 11, 'new data after purge', 'VD24-0003-0031', 1, 14),
(480, 18, 1, 13, 'new data after purge', 'VD24-0003-0032', 1, 14),
(481, 18, 1, 5, 'new data after purge', 'VD24-0003-0033', 1, 14),
(482, 18, 1, 6, 'new data after purge', 'VD24-0003-0034', 1, 14),
(483, 18, 1, 7, 'new data after purge', 'VD24-0003-0035', 1, 14),
(484, 18, 1, 8, 'new data after purge', 'VD24-0003-0036', 1, 14),
(485, 18, 1, 9, 'new data after purge', 'VD24-0003-0037', 1, 14),
(486, 18, 1, 10, 'new data after purge', 'VD24-0003-0038', 1, 14),
(487, 18, 1, 11, 'new data after purge', 'VD24-0003-0039', 1, 14),
(488, 18, 1, 13, 'new data after purge', 'VD24-0003-0040', 1, 14),
(489, 18, 1, 5, 'new data after purge', 'VD24-0003-0041', 1, 14),
(490, 18, 1, 6, 'new data after purge', 'VD24-0003-0042', 1, 14),
(491, 18, 1, 7, 'new data after purge', 'VD24-0003-0043', 1, 14),
(492, 18, 1, 8, 'new data after purge', 'VD24-0003-0044', 1, 14),
(493, 18, 1, 9, 'new data after purge', 'VD24-0003-0045', 1, 14),
(494, 18, 1, 10, 'new data after purge', 'VD24-0003-0046', 1, 14),
(495, 18, 1, 11, 'new data after purge', 'VD24-0003-0047', 1, 14),
(496, 18, 1, 13, 'new data after purge', 'VD24-0003-0048', 1, 14),
(497, 18, 1, 5, 'new data after purge', 'VD24-0003-0049', 1, 14),
(498, 18, 1, 6, 'new data after purge', 'VD24-0003-0050', 1, 14),
(499, 18, 1, 7, 'new data after purge', 'VD24-0003-0051', 1, 14),
(500, 18, 1, 8, 'new data after purge', 'VD24-0003-0052', 1, 14),
(501, 18, 1, 9, 'new data after purge', 'VD24-0003-0053', 1, 14),
(502, 18, 1, 10, 'new data after purge', 'VD24-0003-0054', 1, 14),
(503, 18, 1, 11, 'new data after purge', 'VD24-0003-0055', 1, 14),
(504, 18, 1, 13, 'new data after purge', 'VD24-0003-0056', 1, 14),
(505, 18, 1, 5, 'new data after purge', 'VD24-0003-0057', 1, 14),
(506, 18, 1, 6, 'new data after purge', 'VD24-0003-0058', 1, 14),
(507, 18, 1, 7, 'new data after purge', 'VD24-0003-0059', 1, 14),
(508, 18, 1, 8, 'new data after purge', 'VD24-0003-0060', 1, 14),
(509, 18, 1, 9, 'new data after purge', 'VD24-0003-0061', 1, 14),
(510, 18, 1, 10, 'new data after purge', 'VD24-0003-0062', 1, 14),
(511, 18, 1, 11, 'new data after purge', 'VD24-0003-0063', 1, 14),
(512, 18, 1, 13, 'new data after purge', 'VD24-0003-0064', 1, 14),
(513, 25, 3, NULL, 'new data after purge', 'PA24-0004-0001', 2, 5),
(514, 25, 1, 6, 'new data after purge', 'PA24-0004-0002', 1, 14),
(515, 25, 1, 7, 'new data after purge', 'PA24-0004-0003', 1, 14),
(516, 25, 1, 8, 'new data after purge', 'PA24-0004-0004', 1, 14),
(517, 25, 1, 9, 'new data after purge', 'PA24-0004-0005', 1, 14),
(518, 25, 1, 10, 'new data after purge', 'PA24-0004-0006', 1, 14),
(519, 25, 1, 11, 'new data after purge', 'PA24-0004-0007', 1, 14),
(520, 25, 1, 13, 'new data after purge', 'PA24-0004-0008', 1, 14),
(521, 25, 1, 5, 'new data after purge', 'PA24-0004-0009', 1, 14),
(522, 25, 1, 6, 'new data after purge', 'PA24-0004-0010', 1, 14),
(523, 25, 1, 7, 'new data after purge', 'PA24-0004-0011', 1, 14),
(524, 25, 1, 8, 'new data after purge', 'PA24-0004-0012', 1, 14),
(525, 25, 1, 9, 'new data after purge', 'PA24-0004-0013', 1, 14),
(526, 25, 1, 10, 'new data after purge', 'PA24-0004-0014', 1, 14),
(527, 25, 1, 11, 'new data after purge', 'PA24-0004-0015', 1, 14),
(528, 25, 1, 13, 'new data after purge', 'PA24-0004-0016', 1, 14),
(529, 25, 1, 5, 'new data after purge', 'PA24-0004-0017', 1, 14),
(530, 25, 1, 6, 'new data after purge', 'PA24-0004-0018', 1, 14),
(531, 25, 1, 7, 'new data after purge', 'PA24-0004-0019', 1, 14),
(532, 25, 1, 8, 'new data after purge', 'PA24-0004-0020', 1, 14),
(533, 25, 1, 9, 'new data after purge', 'PA24-0004-0021', 1, 14),
(534, 25, 1, 10, 'new data after purge', 'PA24-0004-0022', 1, 14),
(535, 25, 1, 11, 'new data after purge', 'PA24-0004-0023', 1, 14),
(536, 25, 1, 13, 'new data after purge', 'PA24-0004-0024', 1, 14),
(537, 25, 1, 5, 'new data after purge', 'PA24-0004-0025', 1, 14),
(538, 25, 1, 6, 'new data after purge', 'PA24-0004-0026', 1, 14),
(539, 25, 1, 7, 'new data after purge', 'PA24-0004-0027', 1, 14),
(540, 25, 1, 8, 'new data after purge', 'PA24-0004-0028', 1, 14),
(541, 25, 1, 9, 'new data after purge', 'PA24-0004-0029', 1, 14),
(542, 25, 1, 10, 'new data after purge', 'PA24-0004-0030', 1, 14),
(543, 25, 1, 11, 'new data after purge', 'PA24-0004-0031', 1, 14),
(544, 25, 1, 13, 'new data after purge', 'PA24-0004-0032', 1, 14),
(545, 25, 1, 5, 'new data after purge', 'PA24-0004-0033', 1, 14),
(546, 25, 1, 6, 'new data after purge', 'PA24-0004-0034', 1, 14),
(547, 25, 1, 7, 'new data after purge', 'PA24-0004-0035', 1, 14),
(548, 25, 1, 8, 'new data after purge', 'PA24-0004-0036', 1, 14),
(549, 25, 1, 9, 'new data after purge', 'PA24-0004-0037', 1, 14),
(550, 25, 1, 10, 'new data after purge', 'PA24-0004-0038', 1, 14),
(551, 25, 1, 11, 'new data after purge', 'PA24-0004-0039', 1, 14),
(552, 25, 1, 13, 'new data after purge', 'PA24-0004-0040', 1, 14),
(553, 25, 1, 5, 'new data after purge', 'PA24-0004-0041', 1, 14),
(554, 25, 1, 6, 'new data after purge', 'PA24-0004-0042', 1, 14),
(555, 25, 1, 7, 'new data after purge', 'PA24-0004-0043', 1, 14),
(556, 25, 1, 8, 'new data after purge', 'PA24-0004-0044', 1, 14),
(557, 25, 1, 9, 'new data after purge', 'PA24-0004-0045', 1, 14),
(558, 25, 1, 10, 'new data after purge', 'PA24-0004-0046', 1, 14),
(559, 25, 1, 11, 'new data after purge', 'PA24-0004-0047', 1, 14),
(560, 25, 1, 13, 'new data after purge', 'PA24-0004-0048', 1, 14),
(561, 25, 1, 5, 'new data after purge', 'PA24-0004-0049', 1, 14),
(562, 25, 1, 6, 'new data after purge', 'PA24-0004-0050', 1, 14),
(563, 25, 1, 7, 'new data after purge', 'PA24-0004-0051', 1, 14),
(564, 25, 1, 8, 'new data after purge', 'PA24-0004-0052', 1, 14),
(565, 25, 1, 9, 'new data after purge', 'PA24-0004-0053', 1, 14),
(566, 25, 1, 10, 'new data after purge', 'PA24-0004-0054', 1, 14),
(567, 25, 1, 11, 'new data after purge', 'PA24-0004-0055', 1, 14),
(568, 25, 1, 13, 'new data after purge', 'PA24-0004-0056', 1, 14),
(569, 25, 1, 5, 'new data after purge', 'PA24-0004-0057', 1, 14),
(570, 25, 1, 6, 'new data after purge', 'PA24-0004-0058', 1, 14),
(571, 25, 1, 7, 'new data after purge', 'PA24-0004-0059', 1, 14),
(572, 25, 1, 8, 'new data after purge', 'PA24-0004-0060', 1, 14),
(573, 25, 1, 9, 'new data after purge', 'PA24-0004-0061', 1, 14),
(574, 25, 1, 10, 'new data after purge', 'PA24-0004-0062', 1, 14),
(575, 25, 1, 11, 'new data after purge', 'PA24-0004-0063', 1, 14),
(576, 25, 1, 13, 'new data after purge', 'PA24-0004-0064', 1, 14),
(577, 26, 2, 5, 'new data after purge', 'PC24-0002-0001', 1, 14),
(578, 26, 1, 6, 'new data after purge', 'PC24-0002-0002', 1, 14),
(579, 26, 1, 7, 'new data after purge', 'PC24-0002-0003', 1, 14),
(580, 26, 1, 8, 'new data after purge', 'PC24-0002-0004', 1, 14),
(581, 26, 1, 9, 'new data after purge', 'PC24-0002-0005', 1, 14),
(582, 26, 1, 10, 'new data after purge', 'PC24-0002-0006', 1, 14),
(583, 26, 1, 11, 'new data after purge', 'PC24-0002-0007', 1, 14),
(584, 26, 1, 13, 'new data after purge', 'PC24-0002-0008', 1, 14),
(585, 26, 1, 5, 'new data after purge', 'PC24-0002-0009', 1, 14),
(586, 26, 1, 6, 'new data after purge', 'PC24-0002-0010', 1, 14),
(587, 26, 1, 7, 'new data after purge', 'PC24-0002-0011', 1, 14),
(588, 26, 1, 8, 'new data after purge', 'PC24-0002-0012', 1, 14),
(589, 26, 1, 9, 'new data after purge', 'PC24-0002-0013', 1, 14),
(590, 26, 1, 10, 'new data after purge', 'PC24-0002-0014', 1, 14),
(591, 26, 1, 11, 'new data after purge', 'PC24-0002-0015', 1, 14),
(592, 26, 1, 13, 'new data after purge', 'PC24-0002-0016', 1, 14),
(593, 26, 1, 5, 'new data after purge', 'PC24-0002-0017', 1, 14),
(594, 26, 1, 6, 'new data after purge', 'PC24-0002-0018', 1, 14),
(595, 26, 1, 7, 'new data after purge', 'PC24-0002-0019', 1, 14),
(596, 26, 1, 8, 'new data after purge', 'PC24-0002-0020', 1, 14),
(597, 26, 1, 9, 'new data after purge', 'PC24-0002-0021', 1, 14),
(598, 26, 1, 10, 'new data after purge', 'PC24-0002-0022', 1, 14),
(599, 26, 1, 11, 'new data after purge', 'PC24-0002-0023', 1, 14),
(600, 26, 1, 13, 'new data after purge', 'PC24-0002-0024', 1, 14),
(601, 26, 1, 5, 'new data after purge', 'PC24-0002-0025', 1, 14),
(602, 26, 1, 6, 'new data after purge', 'PC24-0002-0026', 1, 14),
(603, 26, 1, 7, 'new data after purge', 'PC24-0002-0027', 1, 14),
(604, 26, 1, 8, 'new data after purge', 'PC24-0002-0028', 1, 14),
(605, 26, 1, 9, 'new data after purge', 'PC24-0002-0029', 1, 14),
(606, 26, 1, 10, 'new data after purge', 'PC24-0002-0030', 1, 14),
(607, 26, 1, 11, 'new data after purge', 'PC24-0002-0031', 1, 14),
(608, 26, 1, 13, 'new data after purge', 'PC24-0002-0032', 1, 14),
(609, 26, 1, 5, 'new data after purge', 'PC24-0002-0033', 1, 14),
(610, 26, 1, 6, 'new data after purge', 'PC24-0002-0034', 1, 14),
(611, 26, 1, 7, 'new data after purge', 'PC24-0002-0035', 1, 14),
(612, 26, 1, 8, 'new data after purge', 'PC24-0002-0036', 1, 14),
(613, 26, 1, 9, 'new data after purge', 'PC24-0002-0037', 1, 14),
(614, 26, 1, 10, 'new data after purge', 'PC24-0002-0038', 1, 14),
(615, 26, 1, 11, 'new data after purge', 'PC24-0002-0039', 1, 14),
(616, 26, 1, 13, 'new data after purge', 'PC24-0002-0040', 1, 14),
(617, 26, 1, 5, 'new data after purge', 'PC24-0002-0041', 1, 14),
(618, 26, 1, 6, 'new data after purge', 'PC24-0002-0042', 1, 14),
(619, 26, 1, 7, 'new data after purge', 'PC24-0002-0043', 1, 14),
(620, 26, 1, 8, 'new data after purge', 'PC24-0002-0044', 1, 14),
(621, 26, 1, 9, 'new data after purge', 'PC24-0002-0045', 1, 14),
(622, 26, 1, 10, 'new data after purge', 'PC24-0002-0046', 1, 14),
(623, 26, 1, 11, 'new data after purge', 'PC24-0002-0047', 1, 14),
(624, 26, 1, 13, 'new data after purge', 'PC24-0002-0048', 1, 14),
(625, 26, 1, 5, 'new data after purge', 'PC24-0002-0049', 1, 14),
(626, 26, 1, 6, 'new data after purge', 'PC24-0002-0050', 1, 14),
(627, 26, 1, 7, 'new data after purge', 'PC24-0002-0051', 1, 14),
(628, 26, 1, 8, 'new data after purge', 'PC24-0002-0052', 1, 14),
(629, 26, 1, 9, 'new data after purge', 'PC24-0002-0053', 1, 14),
(630, 26, 1, 10, 'new data after purge', 'PC24-0002-0054', 1, 14),
(631, 26, 1, 11, 'new data after purge', 'PC24-0002-0055', 1, 14),
(632, 26, 1, 13, 'new data after purge', 'PC24-0002-0056', 1, 14),
(633, 26, 1, 5, 'new data after purge', 'PC24-0002-0057', 1, 14),
(634, 26, 1, 6, 'new data after purge', 'PC24-0002-0058', 1, 14),
(635, 26, 1, 7, 'new data after purge', 'PC24-0002-0059', 1, 14),
(636, 26, 1, 8, 'new data after purge', 'PC24-0002-0060', 1, 14),
(637, 26, 1, 9, 'new data after purge', 'PC24-0002-0061', 1, 14),
(638, 26, 1, 10, 'new data after purge', 'PC24-0002-0062', 1, 14),
(639, 26, 1, 11, 'new data after purge', 'PC24-0002-0063', 1, 14),
(640, 26, 1, 13, 'new data after purge', 'PC24-0002-0064', 1, 14),
(641, 27, 2, 5, 'new data after purge', 'VD24-0004-0001', 1, 14),
(642, 27, 1, 6, 'new data after purge', 'VD24-0004-0002', 1, 14),
(643, 27, 1, 7, 'new data after purge', 'VD24-0004-0003', 1, 14),
(644, 27, 1, 8, 'new data after purge', 'VD24-0004-0004', 1, 14),
(645, 27, 1, 9, 'new data after purge', 'VD24-0004-0005', 1, 14),
(646, 27, 1, 10, 'new data after purge', 'VD24-0004-0006', 1, 14),
(647, 27, 1, 11, 'new data after purge', 'VD24-0004-0007', 1, 14),
(648, 27, 1, 13, 'new data after purge', 'VD24-0004-0008', 1, 14),
(649, 27, 1, 5, 'new data after purge', 'VD24-0004-0009', 1, 14),
(650, 27, 1, 6, 'new data after purge', 'VD24-0004-0010', 1, 14),
(651, 27, 1, 7, 'new data after purge', 'VD24-0004-0011', 1, 14),
(652, 27, 1, 8, 'new data after purge', 'VD24-0004-0012', 1, 14),
(653, 27, 1, 9, 'new data after purge', 'VD24-0004-0013', 1, 14),
(654, 27, 1, 10, 'new data after purge', 'VD24-0004-0014', 1, 14),
(655, 27, 1, 11, 'new data after purge', 'VD24-0004-0015', 1, 14),
(656, 27, 1, 13, 'new data after purge', 'VD24-0004-0016', 1, 14),
(657, 27, 1, 5, 'new data after purge', 'VD24-0004-0017', 1, 14),
(658, 27, 1, 6, 'new data after purge', 'VD24-0004-0018', 1, 14),
(659, 27, 1, 7, 'new data after purge', 'VD24-0004-0019', 1, 14),
(660, 27, 1, 8, 'new data after purge', 'VD24-0004-0020', 1, 14),
(661, 27, 1, 9, 'new data after purge', 'VD24-0004-0021', 1, 14),
(662, 27, 1, 10, 'new data after purge', 'VD24-0004-0022', 1, 14),
(663, 27, 1, 11, 'new data after purge', 'VD24-0004-0023', 1, 14),
(664, 27, 1, 13, 'new data after purge', 'VD24-0004-0024', 1, 14),
(665, 27, 1, 5, 'new data after purge', 'VD24-0004-0025', 1, 14),
(666, 27, 1, 6, 'new data after purge', 'VD24-0004-0026', 1, 14),
(667, 27, 1, 7, 'new data after purge', 'VD24-0004-0027', 1, 14),
(668, 27, 1, 8, 'new data after purge', 'VD24-0004-0028', 1, 14),
(669, 27, 1, 9, 'new data after purge', 'VD24-0004-0029', 1, 14),
(670, 27, 1, 10, 'new data after purge', 'VD24-0004-0030', 1, 14),
(671, 27, 1, 11, 'new data after purge', 'VD24-0004-0031', 1, 14),
(672, 27, 1, 13, 'new data after purge', 'VD24-0004-0032', 1, 14),
(673, 27, 1, 5, 'new data after purge', 'VD24-0004-0033', 1, 14),
(674, 27, 1, 6, 'new data after purge', 'VD24-0004-0034', 1, 14),
(675, 27, 1, 7, 'new data after purge', 'VD24-0004-0035', 1, 14),
(676, 27, 1, 8, 'new data after purge', 'VD24-0004-0036', 1, 14),
(677, 27, 1, 9, 'new data after purge', 'VD24-0004-0037', 1, 14),
(678, 27, 1, 10, 'new data after purge', 'VD24-0004-0038', 1, 14),
(679, 27, 1, 11, 'new data after purge', 'VD24-0004-0039', 1, 14),
(680, 27, 1, 13, 'new data after purge', 'VD24-0004-0040', 1, 14),
(681, 27, 1, 5, 'new data after purge', 'VD24-0004-0041', 1, 14),
(682, 27, 1, 6, 'new data after purge', 'VD24-0004-0042', 1, 14),
(683, 27, 1, 7, 'new data after purge', 'VD24-0004-0043', 1, 14),
(684, 27, 1, 8, 'new data after purge', 'VD24-0004-0044', 1, 14),
(685, 27, 1, 9, 'new data after purge', 'VD24-0004-0045', 1, 14),
(686, 27, 1, 10, 'new data after purge', 'VD24-0004-0046', 1, 14),
(687, 27, 1, 11, 'new data after purge', 'VD24-0004-0047', 1, 14),
(688, 27, 1, 13, 'new data after purge', 'VD24-0004-0048', 1, 14),
(689, 27, 1, 5, 'new data after purge', 'VD24-0004-0049', 1, 14),
(690, 27, 1, 6, 'new data after purge', 'VD24-0004-0050', 1, 14),
(691, 27, 1, 7, 'new data after purge', 'VD24-0004-0051', 1, 14),
(692, 27, 1, 8, 'new data after purge', 'VD24-0004-0052', 1, 14),
(693, 27, 1, 9, 'new data after purge', 'VD24-0004-0053', 1, 14),
(694, 27, 1, 10, 'new data after purge', 'VD24-0004-0054', 1, 14),
(695, 27, 1, 11, 'new data after purge', 'VD24-0004-0055', 1, 14),
(696, 27, 1, 13, 'new data after purge', 'VD24-0004-0056', 1, 14),
(697, 27, 1, 5, 'new data after purge', 'VD24-0004-0057', 1, 14),
(698, 27, 1, 6, 'new data after purge', 'VD24-0004-0058', 1, 14),
(699, 27, 1, 7, 'new data after purge', 'VD24-0004-0059', 1, 14),
(700, 27, 1, 8, 'new data after purge', 'VD24-0004-0060', 1, 14),
(701, 27, 1, 9, 'new data after purge', 'VD24-0004-0061', 1, 14),
(702, 27, 1, 10, 'new data after purge', 'VD24-0004-0062', 1, 14),
(703, 27, 1, 11, 'new data after purge', 'VD24-0004-0063', 1, 14),
(704, 27, 1, 13, 'new data after purge', 'VD24-0004-0064', 1, 14),
(705, 28, 2, 5, 'new data after purge', 'TC24-0001-0001', 1, 14),
(706, 28, 1, 6, 'new data after purge', 'TC24-0001-0002', 1, 14),
(707, 28, 1, 7, 'new data after purge', 'TC24-0001-0003', 1, 14),
(708, 28, 1, 8, 'new data after purge', 'TC24-0001-0004', 1, 14),
(709, 28, 1, 9, 'new data after purge', 'TC24-0001-0005', 1, 14),
(710, 28, 1, 10, 'new data after purge', 'TC24-0001-0006', 1, 14),
(711, 28, 1, 11, 'new data after purge', 'TC24-0001-0007', 1, 14),
(712, 28, 1, 13, 'new data after purge', 'TC24-0001-0008', 1, 14),
(713, 28, 1, 5, 'new data after purge', 'TC24-0001-0009', 1, 14),
(714, 28, 1, 6, 'new data after purge', 'TC24-0001-0010', 1, 14),
(715, 28, 1, 7, 'new data after purge', 'TC24-0001-0011', 1, 14),
(716, 28, 1, 8, 'new data after purge', 'TC24-0001-0012', 1, 14),
(717, 28, 1, 9, 'new data after purge', 'TC24-0001-0013', 1, 14),
(718, 28, 1, 10, 'new data after purge', 'TC24-0001-0014', 1, 14),
(719, 28, 1, 11, 'new data after purge', 'TC24-0001-0015', 1, 14),
(720, 28, 1, 13, 'new data after purge', 'TC24-0001-0016', 1, 14),
(721, 28, 1, 5, 'new data after purge', 'TC24-0001-0017', 1, 14),
(722, 28, 1, 6, 'new data after purge', 'TC24-0001-0018', 1, 14),
(723, 28, 1, 7, 'new data after purge', 'TC24-0001-0019', 1, 14),
(724, 28, 1, 8, 'new data after purge', 'TC24-0001-0020', 1, 14),
(725, 28, 1, 9, 'new data after purge', 'TC24-0001-0021', 1, 14),
(726, 28, 1, 10, 'new data after purge', 'TC24-0001-0022', 1, 14),
(727, 28, 1, 11, 'new data after purge', 'TC24-0001-0023', 1, 14),
(728, 28, 1, 13, 'new data after purge', 'TC24-0001-0024', 1, 14),
(729, 28, 1, 5, 'new data after purge', 'TC24-0001-0025', 1, 14),
(730, 28, 1, 6, 'new data after purge', 'TC24-0001-0026', 1, 14),
(731, 28, 1, 7, 'new data after purge', 'TC24-0001-0027', 1, 14),
(732, 28, 1, 8, 'new data after purge', 'TC24-0001-0028', 1, 14),
(733, 28, 1, 9, 'new data after purge', 'TC24-0001-0029', 1, 14),
(734, 28, 1, 10, 'new data after purge', 'TC24-0001-0030', 1, 14),
(735, 28, 1, 11, 'new data after purge', 'TC24-0001-0031', 1, 14),
(736, 28, 1, 13, 'new data after purge', 'TC24-0001-0032', 1, 14),
(737, 28, 1, 5, 'new data after purge', 'TC24-0001-0033', 1, 14),
(738, 28, 1, 6, 'new data after purge', 'TC24-0001-0034', 1, 14),
(739, 28, 1, 7, 'new data after purge', 'TC24-0001-0035', 1, 14),
(740, 28, 1, 8, 'new data after purge', 'TC24-0001-0036', 1, 14),
(741, 28, 1, 9, 'new data after purge', 'TC24-0001-0037', 1, 14),
(742, 28, 1, 10, 'new data after purge', 'TC24-0001-0038', 1, 14),
(743, 28, 1, 11, 'new data after purge', 'TC24-0001-0039', 1, 14),
(744, 28, 1, 13, 'new data after purge', 'TC24-0001-0040', 1, 14),
(745, 28, 1, 5, 'new data after purge', 'TC24-0001-0041', 1, 14),
(746, 28, 1, 6, 'new data after purge', 'TC24-0001-0042', 1, 14),
(747, 28, 1, 7, 'new data after purge', 'TC24-0001-0043', 1, 14),
(748, 28, 1, 8, 'new data after purge', 'TC24-0001-0044', 1, 14),
(749, 28, 1, 9, 'new data after purge', 'TC24-0001-0045', 1, 14),
(750, 28, 1, 10, 'new data after purge', 'TC24-0001-0046', 1, 14),
(751, 28, 1, 11, 'new data after purge', 'TC24-0001-0047', 1, 14),
(752, 28, 1, 13, 'new data after purge', 'TC24-0001-0048', 1, 14),
(753, 28, 1, 5, 'new data after purge', 'TC24-0001-0049', 1, 14),
(754, 28, 1, 6, 'new data after purge', 'TC24-0001-0050', 1, 14),
(755, 28, 1, 7, 'new data after purge', 'TC24-0001-0051', 1, 14),
(756, 28, 1, 8, 'new data after purge', 'TC24-0001-0052', 1, 14),
(757, 28, 1, 9, 'new data after purge', 'TC24-0001-0053', 1, 14),
(758, 28, 1, 10, 'new data after purge', 'TC24-0001-0054', 1, 14),
(759, 28, 1, 11, 'new data after purge', 'TC24-0001-0055', 1, 14),
(760, 28, 1, 13, 'new data after purge', 'TC24-0001-0056', 1, 14),
(761, 28, 1, 5, 'new data after purge', 'TC24-0001-0057', 1, 14),
(762, 28, 1, 6, 'new data after purge', 'TC24-0001-0058', 1, 14),
(763, 28, 1, 7, 'new data after purge', 'TC24-0001-0059', 1, 14),
(764, 28, 1, 8, 'new data after purge', 'TC24-0001-0060', 1, 14),
(765, 28, 1, 9, 'new data after purge', 'TC24-0001-0061', 1, 14),
(766, 28, 1, 10, 'new data after purge', 'TC24-0001-0062', 1, 14),
(767, 28, 1, 11, 'new data after purge', 'TC24-0001-0063', 1, 14),
(768, 28, 1, 13, 'new data after purge', 'TC24-0001-0064', 1, 14),
(769, 29, 2, 5, 'new data after purge', 'TC24-0002-0001', 1, 14),
(770, 29, 1, 6, 'new data after purge', 'TC24-0002-0002', 1, 14),
(771, 29, 1, 7, 'new data after purge', 'TC24-0002-0003', 1, 14),
(772, 29, 1, 8, 'new data after purge', 'TC24-0002-0004', 1, 14),
(773, 29, 1, 9, 'new data after purge', 'TC24-0002-0005', 1, 14),
(774, 29, 1, 10, 'new data after purge', 'TC24-0002-0006', 1, 14),
(775, 29, 1, 11, 'new data after purge', 'TC24-0002-0007', 1, 14),
(776, 29, 1, 13, 'new data after purge', 'TC24-0002-0008', 1, 14),
(777, 29, 1, 5, 'new data after purge', 'TC24-0002-0009', 1, 14);
INSERT INTO `item_unit` (`id_unit`, `id_item`, `status`, `id_wh`, `comment`, `serial_number`, `condition`, `updated_by`) VALUES
(778, 29, 1, 6, 'new data after purge', 'TC24-0002-0010', 1, 14),
(779, 29, 1, 7, 'new data after purge', 'TC24-0002-0011', 1, 14),
(780, 29, 1, 8, 'new data after purge', 'TC24-0002-0012', 1, 14),
(781, 29, 1, 9, 'new data after purge', 'TC24-0002-0013', 1, 14),
(782, 29, 1, 10, 'new data after purge', 'TC24-0002-0014', 1, 14),
(783, 29, 1, 11, 'new data after purge', 'TC24-0002-0015', 1, 14),
(784, 29, 1, 13, 'new data after purge', 'TC24-0002-0016', 1, 14),
(785, 29, 1, 5, 'new data after purge', 'TC24-0002-0017', 1, 14),
(786, 29, 1, 6, 'new data after purge', 'TC24-0002-0018', 1, 14),
(787, 29, 1, 7, 'new data after purge', 'TC24-0002-0019', 1, 14),
(788, 29, 1, 8, 'new data after purge', 'TC24-0002-0020', 1, 14),
(789, 29, 1, 9, 'new data after purge', 'TC24-0002-0021', 1, 14),
(790, 29, 1, 10, 'new data after purge', 'TC24-0002-0022', 1, 14),
(791, 29, 1, 11, 'new data after purge', 'TC24-0002-0023', 1, 14),
(792, 29, 1, 13, 'new data after purge', 'TC24-0002-0024', 1, 14),
(793, 29, 1, 5, 'new data after purge', 'TC24-0002-0025', 1, 14),
(794, 29, 1, 6, 'new data after purge', 'TC24-0002-0026', 1, 14),
(795, 29, 1, 7, 'new data after purge', 'TC24-0002-0027', 1, 14),
(796, 29, 1, 8, 'new data after purge', 'TC24-0002-0028', 1, 14),
(797, 29, 1, 9, 'new data after purge', 'TC24-0002-0029', 1, 14),
(798, 29, 1, 10, 'new data after purge', 'TC24-0002-0030', 1, 14),
(799, 29, 1, 11, 'new data after purge', 'TC24-0002-0031', 1, 14),
(800, 29, 1, 13, 'new data after purge', 'TC24-0002-0032', 1, 14),
(801, 29, 1, 5, 'new data after purge', 'TC24-0002-0033', 1, 14),
(802, 29, 1, 6, 'new data after purge', 'TC24-0002-0034', 1, 14),
(803, 29, 1, 7, 'new data after purge', 'TC24-0002-0035', 1, 14),
(804, 29, 1, 8, 'new data after purge', 'TC24-0002-0036', 1, 14),
(805, 29, 1, 9, 'new data after purge', 'TC24-0002-0037', 1, 14),
(806, 29, 1, 10, 'new data after purge', 'TC24-0002-0038', 1, 14),
(807, 29, 1, 11, 'new data after purge', 'TC24-0002-0039', 1, 14),
(808, 29, 1, 13, 'new data after purge', 'TC24-0002-0040', 1, 14),
(809, 29, 1, 5, 'new data after purge', 'TC24-0002-0041', 1, 14),
(810, 29, 1, 6, 'new data after purge', 'TC24-0002-0042', 1, 14),
(811, 29, 1, 7, 'new data after purge', 'TC24-0002-0043', 1, 14),
(812, 29, 1, 8, 'new data after purge', 'TC24-0002-0044', 1, 14),
(813, 29, 1, 9, 'new data after purge', 'TC24-0002-0045', 1, 14),
(814, 29, 1, 10, 'new data after purge', 'TC24-0002-0046', 1, 14),
(815, 29, 1, 11, 'new data after purge', 'TC24-0002-0047', 1, 14),
(816, 29, 1, 13, 'new data after purge', 'TC24-0002-0048', 1, 14),
(817, 29, 1, 5, 'new data after purge', 'TC24-0002-0049', 1, 14),
(818, 29, 1, 6, 'new data after purge', 'TC24-0002-0050', 1, 14),
(819, 29, 1, 7, 'new data after purge', 'TC24-0002-0051', 1, 14),
(820, 29, 1, 8, 'new data after purge', 'TC24-0002-0052', 1, 14),
(821, 29, 1, 9, 'new data after purge', 'TC24-0002-0053', 1, 14),
(822, 29, 1, 10, 'new data after purge', 'TC24-0002-0054', 1, 14),
(823, 29, 1, 11, 'new data after purge', 'TC24-0002-0055', 1, 14),
(824, 29, 1, 13, 'new data after purge', 'TC24-0002-0056', 1, 14),
(825, 29, 1, 5, 'new data after purge', 'TC24-0002-0057', 1, 14),
(826, 29, 1, 6, 'new data after purge', 'TC24-0002-0058', 1, 14),
(827, 29, 1, 7, 'new data after purge', 'TC24-0002-0059', 1, 14),
(828, 29, 1, 8, 'new data after purge', 'TC24-0002-0060', 1, 14),
(829, 29, 1, 9, 'new data after purge', 'TC24-0002-0061', 1, 14),
(830, 29, 1, 10, 'new data after purge', 'TC24-0002-0062', 1, 14),
(831, 29, 1, 11, 'new data after purge', 'TC24-0002-0063', 1, 14),
(832, 29, 1, 13, 'new data after purge', 'TC24-0002-0064', 1, 14),
(833, 30, 2, 5, 'new data after purge', 'TC24-0003-0001', 1, 14),
(834, 30, 1, 6, 'new data after purge', 'TC24-0003-0002', 1, 14),
(835, 30, 1, 7, 'new data after purge', 'TC24-0003-0003', 1, 14),
(836, 30, 1, 8, 'new data after purge', 'TC24-0003-0004', 1, 14),
(837, 30, 1, 9, 'new data after purge', 'TC24-0003-0005', 1, 14),
(838, 30, 1, 10, 'new data after purge', 'TC24-0003-0006', 1, 14),
(839, 30, 1, 11, 'new data after purge', 'TC24-0003-0007', 1, 14),
(840, 30, 1, 13, 'new data after purge', 'TC24-0003-0008', 1, 14),
(841, 30, 1, 5, 'new data after purge', 'TC24-0003-0009', 1, 14),
(842, 30, 1, 6, 'new data after purge', 'TC24-0003-0010', 1, 14),
(843, 30, 1, 7, 'new data after purge', 'TC24-0003-0011', 1, 14),
(844, 30, 1, 8, 'new data after purge', 'TC24-0003-0012', 1, 14),
(845, 30, 1, 9, 'new data after purge', 'TC24-0003-0013', 1, 14),
(846, 30, 1, 10, 'new data after purge', 'TC24-0003-0014', 1, 14),
(847, 30, 1, 11, 'new data after purge', 'TC24-0003-0015', 1, 14),
(848, 30, 1, 13, 'new data after purge', 'TC24-0003-0016', 1, 14),
(849, 30, 1, 5, 'new data after purge', 'TC24-0003-0017', 1, 14),
(850, 30, 1, 6, 'new data after purge', 'TC24-0003-0018', 1, 14),
(851, 30, 1, 7, 'new data after purge', 'TC24-0003-0019', 1, 14),
(852, 30, 1, 8, 'new data after purge', 'TC24-0003-0020', 1, 14),
(853, 30, 1, 9, 'new data after purge', 'TC24-0003-0021', 1, 14),
(854, 30, 1, 10, 'new data after purge', 'TC24-0003-0022', 1, 14),
(855, 30, 1, 11, 'new data after purge', 'TC24-0003-0023', 1, 14),
(856, 30, 1, 13, 'new data after purge', 'TC24-0003-0024', 1, 14),
(857, 30, 1, 5, 'new data after purge', 'TC24-0003-0025', 1, 14),
(858, 30, 1, 6, 'new data after purge', 'TC24-0003-0026', 1, 14),
(859, 30, 1, 7, 'new data after purge', 'TC24-0003-0027', 1, 14),
(860, 30, 1, 8, 'new data after purge', 'TC24-0003-0028', 1, 14),
(861, 30, 1, 9, 'new data after purge', 'TC24-0003-0029', 1, 14),
(862, 30, 1, 10, 'new data after purge', 'TC24-0003-0030', 1, 14),
(863, 30, 1, 11, 'new data after purge', 'TC24-0003-0031', 1, 14),
(864, 30, 1, 13, 'new data after purge', 'TC24-0003-0032', 1, 14),
(865, 30, 1, 5, 'new data after purge', 'TC24-0003-0033', 1, 14),
(866, 30, 1, 6, 'new data after purge', 'TC24-0003-0034', 1, 14),
(867, 30, 1, 7, 'new data after purge', 'TC24-0003-0035', 1, 14),
(868, 30, 1, 8, 'new data after purge', 'TC24-0003-0036', 1, 14),
(869, 30, 1, 9, 'new data after purge', 'TC24-0003-0037', 1, 14),
(870, 30, 1, 10, 'new data after purge', 'TC24-0003-0038', 1, 14),
(871, 30, 1, 11, 'new data after purge', 'TC24-0003-0039', 1, 14),
(872, 30, 1, 13, 'new data after purge', 'TC24-0003-0040', 1, 14),
(873, 30, 1, 5, 'new data after purge', 'TC24-0003-0041', 1, 14),
(874, 30, 1, 6, 'new data after purge', 'TC24-0003-0042', 1, 14),
(875, 30, 1, 7, 'new data after purge', 'TC24-0003-0043', 1, 14),
(876, 30, 1, 8, 'new data after purge', 'TC24-0003-0044', 1, 14),
(877, 30, 1, 9, 'new data after purge', 'TC24-0003-0045', 1, 14),
(878, 30, 1, 10, 'new data after purge', 'TC24-0003-0046', 1, 14),
(879, 30, 1, 11, 'new data after purge', 'TC24-0003-0047', 1, 14),
(880, 30, 1, 13, 'new data after purge', 'TC24-0003-0048', 1, 14),
(881, 30, 1, 5, 'new data after purge', 'TC24-0003-0049', 1, 14),
(882, 30, 1, 6, 'new data after purge', 'TC24-0003-0050', 1, 14),
(883, 30, 1, 7, 'new data after purge', 'TC24-0003-0051', 1, 14),
(884, 30, 1, 8, 'new data after purge', 'TC24-0003-0052', 1, 14),
(885, 30, 1, 9, 'new data after purge', 'TC24-0003-0053', 1, 14),
(886, 30, 1, 10, 'new data after purge', 'TC24-0003-0054', 1, 14),
(887, 30, 1, 11, 'new data after purge', 'TC24-0003-0055', 1, 14),
(888, 30, 1, 13, 'new data after purge', 'TC24-0003-0056', 1, 14),
(889, 30, 1, 5, 'new data after purge', 'TC24-0003-0057', 1, 14),
(890, 30, 1, 6, 'new data after purge', 'TC24-0003-0058', 1, 14),
(891, 30, 1, 7, 'new data after purge', 'TC24-0003-0059', 1, 14),
(892, 30, 1, 8, 'new data after purge', 'TC24-0003-0060', 1, 14),
(893, 30, 1, 9, 'new data after purge', 'TC24-0003-0061', 1, 14),
(894, 30, 1, 10, 'new data after purge', 'TC24-0003-0062', 1, 14),
(895, 30, 1, 11, 'new data after purge', 'TC24-0003-0063', 1, 14),
(896, 30, 1, 13, 'new data after purge', 'TC24-0003-0064', 1, 14),
(897, 31, 2, 5, 'new data after purge', 'PU24-0001-0001', 1, 14),
(898, 31, 1, 6, 'new data after purge', 'PU24-0001-0002', 1, 14),
(899, 31, 1, 7, 'new data after purge', 'PU24-0001-0003', 1, 14),
(900, 31, 1, 8, 'new data after purge', 'PU24-0001-0004', 1, 14),
(901, 31, 1, 9, 'new data after purge', 'PU24-0001-0005', 1, 14),
(902, 31, 1, 10, 'new data after purge', 'PU24-0001-0006', 1, 14),
(903, 31, 1, 11, 'new data after purge', 'PU24-0001-0007', 1, 14),
(904, 31, 1, 13, 'new data after purge', 'PU24-0001-0008', 1, 14),
(905, 31, 1, 5, 'new data after purge', 'PU24-0001-0009', 1, 14),
(906, 31, 1, 6, 'new data after purge', 'PU24-0001-0010', 1, 14),
(907, 31, 1, 7, 'new data after purge', 'PU24-0001-0011', 1, 14),
(908, 31, 1, 8, 'new data after purge', 'PU24-0001-0012', 1, 14),
(909, 31, 1, 9, 'new data after purge', 'PU24-0001-0013', 1, 14),
(910, 31, 1, 10, 'new data after purge', 'PU24-0001-0014', 1, 14),
(911, 31, 1, 11, 'new data after purge', 'PU24-0001-0015', 1, 14),
(912, 31, 1, 13, 'new data after purge', 'PU24-0001-0016', 1, 14),
(913, 31, 1, 5, 'new data after purge', 'PU24-0001-0017', 1, 14),
(914, 31, 1, 6, 'new data after purge', 'PU24-0001-0018', 1, 14),
(915, 31, 1, 7, 'new data after purge', 'PU24-0001-0019', 1, 14),
(916, 31, 1, 8, 'new data after purge', 'PU24-0001-0020', 1, 14),
(917, 31, 1, 9, 'new data after purge', 'PU24-0001-0021', 1, 14),
(918, 31, 1, 10, 'new data after purge', 'PU24-0001-0022', 1, 14),
(919, 31, 1, 11, 'new data after purge', 'PU24-0001-0023', 1, 14),
(920, 31, 1, 13, 'new data after purge', 'PU24-0001-0024', 1, 14),
(921, 31, 1, 5, 'new data after purge', 'PU24-0001-0025', 1, 14),
(922, 31, 1, 6, 'new data after purge', 'PU24-0001-0026', 1, 14),
(923, 31, 1, 7, 'new data after purge', 'PU24-0001-0027', 1, 14),
(924, 31, 1, 8, 'new data after purge', 'PU24-0001-0028', 1, 14),
(925, 31, 1, 9, 'new data after purge', 'PU24-0001-0029', 1, 14),
(926, 31, 1, 10, 'new data after purge', 'PU24-0001-0030', 1, 14),
(927, 31, 1, 11, 'new data after purge', 'PU24-0001-0031', 1, 14),
(928, 31, 1, 13, 'new data after purge', 'PU24-0001-0032', 1, 14),
(929, 31, 1, 5, 'new data after purge', 'PU24-0001-0033', 1, 14),
(930, 31, 1, 6, 'new data after purge', 'PU24-0001-0034', 1, 14),
(931, 31, 1, 7, 'new data after purge', 'PU24-0001-0035', 1, 14),
(932, 31, 1, 8, 'new data after purge', 'PU24-0001-0036', 1, 14),
(933, 31, 1, 9, 'new data after purge', 'PU24-0001-0037', 1, 14),
(934, 31, 1, 10, 'new data after purge', 'PU24-0001-0038', 1, 14),
(935, 31, 1, 11, 'new data after purge', 'PU24-0001-0039', 1, 14),
(936, 31, 1, 13, 'new data after purge', 'PU24-0001-0040', 1, 14),
(937, 31, 1, 5, 'new data after purge', 'PU24-0001-0041', 1, 14),
(938, 31, 1, 6, 'new data after purge', 'PU24-0001-0042', 1, 14),
(939, 31, 1, 7, 'new data after purge', 'PU24-0001-0043', 1, 14),
(940, 31, 1, 8, 'new data after purge', 'PU24-0001-0044', 1, 14),
(941, 31, 1, 9, 'new data after purge', 'PU24-0001-0045', 1, 14),
(942, 31, 1, 10, 'new data after purge', 'PU24-0001-0046', 1, 14),
(943, 31, 1, 11, 'new data after purge', 'PU24-0001-0047', 1, 14),
(944, 31, 1, 13, 'new data after purge', 'PU24-0001-0048', 1, 14),
(945, 31, 1, 5, 'new data after purge', 'PU24-0001-0049', 1, 14),
(946, 31, 1, 6, 'new data after purge', 'PU24-0001-0050', 1, 14),
(947, 31, 1, 7, 'new data after purge', 'PU24-0001-0051', 1, 14),
(948, 31, 1, 8, 'new data after purge', 'PU24-0001-0052', 1, 14),
(949, 31, 1, 9, 'new data after purge', 'PU24-0001-0053', 1, 14),
(950, 31, 1, 10, 'new data after purge', 'PU24-0001-0054', 1, 14),
(951, 31, 1, 11, 'new data after purge', 'PU24-0001-0055', 1, 14),
(952, 31, 1, 13, 'new data after purge', 'PU24-0001-0056', 1, 14),
(953, 31, 1, 5, 'new data after purge', 'PU24-0001-0057', 1, 14),
(954, 31, 1, 6, 'new data after purge', 'PU24-0001-0058', 1, 14),
(955, 31, 1, 7, 'new data after purge', 'PU24-0001-0059', 1, 14),
(956, 31, 1, 8, 'new data after purge', 'PU24-0001-0060', 1, 14),
(957, 31, 1, 9, 'new data after purge', 'PU24-0001-0061', 1, 14),
(958, 31, 1, 10, 'new data after purge', 'PU24-0001-0062', 1, 14),
(959, 31, 1, 11, 'new data after purge', 'PU24-0001-0063', 1, 14),
(960, 31, 1, 13, 'new data after purge', 'PU24-0001-0064', 1, 14),
(961, 32, 2, 5, 'new data after purge', 'TC24-0004-0001', 1, 14),
(962, 32, 1, 6, 'new data after purge', 'TC24-0004-0002', 1, 14),
(963, 32, 1, 7, 'new data after purge', 'TC24-0004-0003', 1, 14),
(964, 32, 1, 8, 'new data after purge', 'TC24-0004-0004', 1, 14),
(965, 32, 1, 9, 'new data after purge', 'TC24-0004-0005', 1, 14),
(966, 32, 1, 10, 'new data after purge', 'TC24-0004-0006', 1, 14),
(967, 32, 1, 11, 'new data after purge', 'TC24-0004-0007', 1, 14),
(968, 32, 1, 13, 'new data after purge', 'TC24-0004-0008', 1, 14),
(969, 32, 1, 5, 'new data after purge', 'TC24-0004-0009', 1, 14),
(970, 32, 1, 6, 'new data after purge', 'TC24-0004-0010', 1, 14),
(971, 32, 1, 7, 'new data after purge', 'TC24-0004-0011', 1, 14),
(972, 32, 1, 8, 'new data after purge', 'TC24-0004-0012', 1, 14),
(973, 32, 1, 9, 'new data after purge', 'TC24-0004-0013', 1, 14),
(974, 32, 1, 10, 'new data after purge', 'TC24-0004-0014', 1, 14),
(975, 32, 1, 11, 'new data after purge', 'TC24-0004-0015', 1, 14),
(976, 32, 1, 13, 'new data after purge', 'TC24-0004-0016', 1, 14),
(977, 32, 1, 5, 'new data after purge', 'TC24-0004-0017', 1, 14),
(978, 32, 1, 6, 'new data after purge', 'TC24-0004-0018', 1, 14),
(979, 32, 1, 7, 'new data after purge', 'TC24-0004-0019', 1, 14),
(980, 32, 1, 8, 'new data after purge', 'TC24-0004-0020', 1, 14),
(981, 32, 1, 9, 'new data after purge', 'TC24-0004-0021', 1, 14),
(982, 32, 1, 10, 'new data after purge', 'TC24-0004-0022', 1, 14),
(983, 32, 1, 11, 'new data after purge', 'TC24-0004-0023', 1, 14),
(984, 32, 1, 13, 'new data after purge', 'TC24-0004-0024', 1, 14),
(985, 32, 1, 5, 'new data after purge', 'TC24-0004-0025', 1, 14),
(986, 32, 1, 6, 'new data after purge', 'TC24-0004-0026', 1, 14),
(987, 32, 1, 7, 'new data after purge', 'TC24-0004-0027', 1, 14),
(988, 32, 1, 8, 'new data after purge', 'TC24-0004-0028', 1, 14),
(989, 32, 1, 9, 'new data after purge', 'TC24-0004-0029', 1, 14),
(990, 32, 1, 10, 'new data after purge', 'TC24-0004-0030', 1, 14),
(991, 32, 1, 11, 'new data after purge', 'TC24-0004-0031', 1, 14),
(992, 32, 1, 13, 'new data after purge', 'TC24-0004-0032', 1, 14),
(993, 32, 1, 5, 'new data after purge', 'TC24-0004-0033', 1, 14),
(994, 32, 1, 6, 'new data after purge', 'TC24-0004-0034', 1, 14),
(995, 32, 1, 7, 'new data after purge', 'TC24-0004-0035', 1, 14),
(996, 32, 1, 8, 'new data after purge', 'TC24-0004-0036', 1, 14),
(997, 32, 1, 9, 'new data after purge', 'TC24-0004-0037', 1, 14),
(998, 32, 1, 10, 'new data after purge', 'TC24-0004-0038', 1, 14),
(999, 32, 1, 11, 'new data after purge', 'TC24-0004-0039', 1, 14),
(1000, 32, 1, 13, 'new data after purge', 'TC24-0004-0040', 1, 14),
(1001, 32, 1, 5, 'new data after purge', 'TC24-0004-0041', 1, 14),
(1002, 32, 1, 6, 'new data after purge', 'TC24-0004-0042', 1, 14),
(1003, 32, 1, 7, 'new data after purge', 'TC24-0004-0043', 1, 14),
(1004, 32, 1, 8, 'new data after purge', 'TC24-0004-0044', 1, 14),
(1005, 32, 1, 9, 'new data after purge', 'TC24-0004-0045', 1, 14),
(1006, 32, 1, 10, 'new data after purge', 'TC24-0004-0046', 1, 14),
(1007, 32, 1, 11, 'new data after purge', 'TC24-0004-0047', 1, 14),
(1008, 32, 1, 13, 'new data after purge', 'TC24-0004-0048', 1, 14),
(1009, 32, 1, 5, 'new data after purge', 'TC24-0004-0049', 1, 14),
(1010, 32, 1, 6, 'new data after purge', 'TC24-0004-0050', 1, 14),
(1011, 32, 1, 7, 'new data after purge', 'TC24-0004-0051', 1, 14),
(1012, 32, 1, 8, 'new data after purge', 'TC24-0004-0052', 1, 14),
(1013, 32, 1, 9, 'new data after purge', 'TC24-0004-0053', 1, 14),
(1014, 32, 1, 10, 'new data after purge', 'TC24-0004-0054', 1, 14),
(1015, 32, 1, 11, 'new data after purge', 'TC24-0004-0055', 1, 14),
(1016, 32, 1, 13, 'new data after purge', 'TC24-0004-0056', 1, 14),
(1017, 32, 1, 5, 'new data after purge', 'TC24-0004-0057', 1, 14),
(1018, 32, 1, 6, 'new data after purge', 'TC24-0004-0058', 1, 14),
(1019, 32, 1, 7, 'new data after purge', 'TC24-0004-0059', 1, 14),
(1020, 32, 1, 8, 'new data after purge', 'TC24-0004-0060', 1, 14),
(1021, 32, 1, 9, 'new data after purge', 'TC24-0004-0061', 1, 14),
(1022, 32, 1, 10, 'new data after purge', 'TC24-0004-0062', 1, 14),
(1023, 32, 1, 11, 'new data after purge', 'TC24-0004-0063', 1, 14),
(1024, 32, 1, 13, 'new data after purge', 'TC24-0004-0064', 1, 14),
(1025, 11, 1, 13, 'test lock. Wh admin tie to a wh bulk add unit', 'PA24-0001-0065', 1, 5),
(1026, 11, 1, 13, 'test lock. Wh admin tie to a wh bulk add unit', 'PA24-0001-0066', 1, 5),
(1027, 11, 1, 13, 'test lock. Wh admin tie to a wh bulk add unit', 'PA24-0001-0067', 1, 5),
(1028, 11, 1, 13, 'test lock. Wh admin tie to a wh bulk add unit', 'PA24-0001-0068', 1, 5),
(1029, 11, 1, 13, 'test lock. Wh admin tie to a wh bulk add unit', 'PA24-0001-0069', 1, 5);

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
(1, 1, 14, 1, 2, '2024-11-28', '357_1732758351.jpeg', '858_1732758711.jpeg'),
(2, 129, 14, 2, 2, '2024-11-28', '203_1732758360.jpeg', '759_1732758720.jpeg'),
(3, 193, 14, 3, 2, '2024-11-28', '884_1732758368.jpeg', '135_1732758731.jpeg'),
(4, 257, 14, 4, 2, '2024-11-28', '803_1732758376.jpeg', '282_1732758740.jpeg'),
(5, 321, 14, 5, 2, '2024-11-28', '716_1732758386.jpeg', '281_1732758755.jpeg'),
(6, 385, 14, 7, 2, '2024-11-28', '742_1732758394.jpeg', '410_1732758763.jpeg'),
(7, 450, 14, 8, 1, '2024-11-28', '118_1732758403.jpeg', ''),
(8, 513, 14, 8, 2, '2024-11-28', '375_1732758449.jpeg', '864_1732766351.jpeg'),
(9, 577, 14, 1, 1, '2024-11-28', '840_1732758459.jpeg', ''),
(10, 641, 14, 2, 1, '2024-11-28', '789_1732758469.webp', ''),
(11, 705, 14, 2, 1, '2024-11-28', '100_1732758484.jpeg', ''),
(12, 769, 14, 4, 1, '2024-11-28', '139_1732758494.gif', ''),
(13, 833, 14, 5, 1, '2024-11-28', '666_1732758504.gif', ''),
(14, 897, 14, 8, 1, '2024-11-28', '682_1732758515.jpeg', ''),
(15, 961, 14, 4, 1, '2024-11-28', '792_1732758525.jpeg', ''),
(16, 961, 14, 4, 1, '2024-11-28', '472_1732758525.jpeg', ''),
(17, 66, 14, 2, 1, '2024-11-28', '777_1732758537.jpeg', '');

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
(1, 129, 'PA24-0002-0001. rep sample', 1, '2024-11-28 08:52:58.00'),
(2, 193, 'PC24-0001-0001. rep sample', 1, '2024-11-28 08:53:02.00'),
(3, 257, 'PA24-0003-0001. rep sample', 1, '2024-11-28 08:53:06.00'),
(4, 321, 'VD24-0001-0001. rep sample', 1, '2024-11-28 08:53:11.00'),
(5, 385, 'VD24-0002-0001. rep sample', 1, '2024-11-28 08:53:16.00'),
(6, 193, 'PC24-0001-0001. rep sample', 2, '2024-11-28 08:53:29.00'),
(7, 257, 'PA24-0003-0001. rep sample', 2, '2024-11-28 08:53:39.00'),
(8, 487, 'Repair started for unit 487', 1, '2024-01-17 00:21:00.00'),
(9, 487, 'Repair completed for unit 487', 2, '2024-01-20 00:21:00.00'),
(10, 303, 'Repair started for unit 303', 1, '2024-01-23 05:44:00.00'),
(11, 303, 'Repair completed for unit 303', 2, '2024-01-27 05:44:00.00'),
(12, 348, 'Repair started for unit 348', 1, '2024-01-15 13:13:00.00'),
(13, 348, 'Repair completed for unit 348', 2, '2024-01-17 13:13:00.00'),
(14, 302, 'Repair started for unit 302', 1, '2024-01-18 09:04:00.00'),
(15, 302, 'Repair completed for unit 302', 2, '2024-01-18 09:04:00.00'),
(16, 271, 'Repair started for unit 271', 1, '2024-02-08 15:28:00.00'),
(17, 271, 'Repair completed for unit 271', 2, '2024-02-10 15:28:00.00'),
(18, 356, 'Repair started for unit 356', 1, '2024-02-08 05:20:00.00'),
(19, 356, 'Repair completed for unit 356', 2, '2024-02-08 05:20:00.00'),
(20, 96, 'Repair started for unit 96', 1, '2024-02-23 11:54:00.00'),
(21, 96, 'Repair completed for unit 96', 2, '2024-02-23 11:54:00.00'),
(22, 64, 'Repair started for unit 64', 1, '2024-02-04 04:34:00.00'),
(23, 64, 'Repair completed for unit 64', 2, '2024-02-05 04:34:00.00'),
(24, 495, 'Repair started for unit 495', 1, '2024-03-26 14:13:00.00'),
(25, 495, 'Repair completed for unit 495', 2, '2024-03-27 14:13:00.00'),
(26, 474, 'Repair started for unit 474', 1, '2024-03-22 00:50:00.00'),
(27, 474, 'Repair completed for unit 474', 2, '2024-03-22 00:50:00.00'),
(28, 70, 'Repair started for unit 70', 1, '2024-03-09 00:12:00.00'),
(29, 70, 'Repair completed for unit 70', 2, '2024-03-09 00:12:00.00'),
(30, 207, 'Repair started for unit 207', 1, '2024-03-02 23:44:00.00'),
(31, 207, 'Repair completed for unit 207', 2, '2024-03-05 23:44:00.00'),
(32, 351, 'Repair started for unit 351', 1, '2024-04-05 15:42:00.00'),
(33, 351, 'Repair completed for unit 351', 2, '2024-04-08 15:42:00.00'),
(34, 97, 'Repair started for unit 97', 1, '2024-04-28 06:30:00.00'),
(35, 97, 'Repair completed for unit 97', 2, '2024-05-01 06:30:00.00'),
(36, 383, 'Repair started for unit 383', 1, '2024-04-25 00:35:00.00'),
(37, 383, 'Repair completed for unit 383', 2, '2024-04-29 00:35:00.00'),
(38, 279, 'Repair started for unit 279', 1, '2024-04-05 05:30:00.00'),
(39, 279, 'Repair completed for unit 279', 2, '2024-04-09 05:30:00.00'),
(40, 113, 'Repair started for unit 113', 1, '2024-05-08 15:23:00.00'),
(41, 113, 'Repair completed for unit 113', 2, '2024-05-08 15:23:00.00'),
(42, 70, 'Repair started for unit 70', 1, '2024-05-15 02:59:00.00'),
(43, 70, 'Repair completed for unit 70', 2, '2024-05-18 02:59:00.00'),
(44, 221, 'Repair started for unit 221', 1, '2024-05-04 09:30:00.00'),
(45, 221, 'Repair completed for unit 221', 2, '2024-05-05 09:30:00.00'),
(46, 127, 'Repair started for unit 127', 1, '2024-05-06 07:51:00.00'),
(47, 127, 'Repair completed for unit 127', 2, '2024-05-07 07:51:00.00'),
(48, 161, 'Repair started for unit 161', 1, '2024-06-14 09:36:00.00'),
(49, 161, 'Repair completed for unit 161', 2, '2024-06-18 09:36:00.00'),
(50, 165, 'Repair started for unit 165', 1, '2024-06-05 18:18:00.00'),
(51, 165, 'Repair completed for unit 165', 2, '2024-06-06 18:18:00.00'),
(52, 289, 'Repair started for unit 289', 1, '2024-06-28 03:51:00.00'),
(53, 289, 'Repair completed for unit 289', 2, '2024-07-02 03:51:00.00'),
(54, 314, 'Repair started for unit 314', 1, '2024-06-17 03:49:00.00'),
(55, 314, 'Repair completed for unit 314', 2, '2024-06-20 03:49:00.00'),
(56, 124, 'Repair started for unit 124', 1, '2024-07-01 06:19:00.00'),
(57, 124, 'Repair completed for unit 124', 2, '2024-07-05 06:19:00.00'),
(58, 59, 'Repair started for unit 59', 1, '2024-07-04 08:17:00.00'),
(59, 59, 'Repair completed for unit 59', 2, '2024-07-06 08:17:00.00'),
(60, 86, 'Repair started for unit 86', 1, '2024-07-18 16:29:00.00'),
(61, 86, 'Repair completed for unit 86', 2, '2024-07-20 16:29:00.00'),
(62, 325, 'Repair started for unit 325', 1, '2024-07-28 21:33:00.00'),
(63, 325, 'Repair completed for unit 325', 2, '2024-07-28 21:33:00.00'),
(64, 15, 'Repair started for unit 15', 1, '2024-08-20 10:05:00.00'),
(65, 15, 'Repair completed for unit 15', 2, '2024-08-20 10:05:00.00'),
(66, 255, 'Repair started for unit 255', 1, '2024-08-02 18:43:00.00'),
(67, 255, 'Repair completed for unit 255', 2, '2024-08-03 18:43:00.00'),
(68, 116, 'Repair started for unit 116', 1, '2024-08-09 20:18:00.00'),
(69, 116, 'Repair completed for unit 116', 2, '2024-08-13 20:18:00.00'),
(70, 28, 'Repair started for unit 28', 1, '2024-08-09 06:35:00.00'),
(71, 28, 'Repair completed for unit 28', 2, '2024-08-09 06:35:00.00'),
(72, 234, 'Repair started for unit 234', 1, '2024-09-06 14:25:00.00'),
(73, 234, 'Repair completed for unit 234', 2, '2024-09-07 14:25:00.00'),
(74, 118, 'Repair started for unit 118', 1, '2024-09-08 15:23:00.00'),
(75, 118, 'Repair completed for unit 118', 2, '2024-09-08 15:23:00.00'),
(76, 494, 'Repair started for unit 494', 1, '2024-09-24 06:46:00.00'),
(77, 494, 'Repair completed for unit 494', 2, '2024-09-24 06:46:00.00'),
(78, 68, 'Repair started for unit 68', 1, '2024-09-12 13:41:00.00'),
(79, 68, 'Repair completed for unit 68', 2, '2024-09-15 13:41:00.00'),
(80, 270, 'Repair started for unit 270', 1, '2024-10-15 00:32:00.00'),
(81, 270, 'Repair completed for unit 270', 2, '2024-10-18 00:32:00.00'),
(82, 312, 'Repair started for unit 312', 1, '2024-10-05 21:05:00.00'),
(83, 312, 'Repair completed for unit 312', 2, '2024-10-08 21:05:00.00'),
(84, 173, 'Repair started for unit 173', 1, '2024-10-16 17:59:00.00'),
(85, 173, 'Repair completed for unit 173', 2, '2024-10-20 17:59:00.00'),
(86, 6, 'Repair started for unit 6', 1, '2024-10-19 05:09:00.00'),
(87, 6, 'Repair completed for unit 6', 2, '2024-10-19 05:09:00.00'),
(88, 1, 'Repair started for unit 1', 1, '2024-11-21 15:06:00.00'),
(89, 1, 'Repair completed for unit 1', 2, '2024-11-23 15:06:00.00'),
(90, 222, 'Repair started for unit 222', 1, '2024-11-16 11:37:00.00'),
(91, 222, 'Repair completed for unit 222', 2, '2024-11-19 11:37:00.00'),
(92, 465, 'Repair started for unit 465', 1, '2024-11-10 23:53:00.00'),
(93, 465, 'Repair completed for unit 465', 2, '2024-11-12 23:53:00.00'),
(94, 435, 'Repair started for unit 435', 1, '2024-11-23 10:44:00.00'),
(95, 435, 'Repair completed for unit 435', 2, '2024-11-25 10:44:00.00'),
(104, 513, 'PA24-0004-0001. new data after purge', 1, '2024-11-28 10:59:19.00'),
(105, 129, 'PA24-0002-0001. rep sample', 2, '2024-11-28 14:12:46.00');

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
(1, 'Repair Started. Repair opened'),
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
(1, 1, 'Unit PA24-0001-0001 lent to Johan by admin_en', '2024-11-28 08:45:51.000000'),
(2, 129, 'Unit PA24-0002-0001 lent to Emma by admin_en', '2024-11-28 08:46:00.000000'),
(3, 193, 'Unit PC24-0001-0001 lent to Oleg by admin_en', '2024-11-28 08:46:08.000000'),
(4, 257, 'Unit PA24-0003-0001 lent to Freddy by admin_en', '2024-11-28 08:46:16.000000'),
(5, 321, 'Unit VD24-0001-0001 lent to Shiorin by admin_en', '2024-11-28 08:46:26.000000'),
(6, 385, 'Unit VD24-0002-0001 lent to Mark by admin_en', '2024-11-28 08:46:34.000000'),
(7, 450, 'Unit VD24-0003-0002 lent to Manfred Albrecht Freiherr von Richthofen by admin_en', '2024-11-28 08:46:43.000000'),
(8, 513, 'Unit PA24-0004-0001 lent to Manfred Albrecht Freiherr von Richthofen by admin_en', '2024-11-28 08:47:29.000000'),
(9, 577, 'Unit PC24-0002-0001 lent to Johan by admin_en', '2024-11-28 08:47:39.000000'),
(10, 641, 'Unit VD24-0004-0001 lent to Emma by admin_en', '2024-11-28 08:47:49.000000'),
(11, 705, 'Unit TC24-0001-0001 lent to Emma by admin_en', '2024-11-28 08:48:04.000000'),
(12, 769, 'Unit TC24-0002-0001 lent to Freddy by admin_en', '2024-11-28 08:48:14.000000'),
(13, 833, 'Unit TC24-0003-0001 lent to Shiorin by admin_en', '2024-11-28 08:48:24.000000'),
(14, 897, 'Unit PU24-0001-0001 lent to Manfred Albrecht Freiherr von Richthofen by admin_en', '2024-11-28 08:48:35.000000'),
(15, 961, 'Unit TC24-0004-0001 lent to Freddy by admin_en', '2024-11-28 08:48:45.000000'),
(16, 961, 'Unit TC24-0004-0001 lent to Freddy by admin_en', '2024-11-28 08:48:45.000000'),
(17, 66, 'Unit DK24-0001-0002 lent to Emma by admin_en', '2024-11-28 08:48:57.000000'),
(18, 1, 'Unit PA24-0001-0001 returned by Johan, recieved by admin_en', '2024-11-28 08:51:51.000000'),
(19, 129, 'Unit PA24-0002-0001 returned by Emma, recieved by admin_en', '2024-11-28 08:52:00.000000'),
(20, 193, 'Unit PC24-0001-0001 returned by Oleg, recieved by admin_en', '2024-11-28 08:52:11.000000'),
(21, 257, 'Unit PA24-0003-0001 returned by Freddy, recieved by admin_en', '2024-11-28 08:52:20.000000'),
(22, 321, 'Unit VD24-0001-0001 returned by Shiorin, recieved by admin_en', '2024-11-28 08:52:35.000000'),
(23, 385, 'Unit VD24-0002-0001 returned by Mark, recieved by admin_en', '2024-11-28 08:52:43.000000'),
(24, 129, 'Unit PA24-0002-0001 sent to repair by admin_en', '2024-11-28 08:52:58.000000'),
(25, 193, 'Unit PC24-0001-0001 sent to repair by admin_en', '2024-11-28 08:53:02.000000'),
(26, 257, 'Unit PA24-0003-0001 sent to repair by admin_en', '2024-11-28 08:53:06.000000'),
(27, 321, 'Unit VD24-0001-0001 sent to repair by admin_en', '2024-11-28 08:53:11.000000'),
(28, 385, 'Unit VD24-0002-0001 sent to repair by admin_en', '2024-11-28 08:53:16.000000'),
(29, 193, 'Unit PC24-0001-0001 repaired. Taken to warehouse by admin_en', '2024-11-28 08:53:29.000000'),
(30, 257, 'Unit PA24-0003-0001 repaired. Taken to warehouse by admin_en', '2024-11-28 08:53:39.000000'),
(31, 513, 'Unit PA24-0004-0001 returned by Manfred Albrecht Freiherr von Richthofen, recieved by franzferdinand', '2024-11-28 10:59:11.000000'),
(32, 513, 'Unit PA24-0004-0001 sent to repair by franzferdinand', '2024-11-28 10:59:19.000000'),
(33, 129, 'Unit PA24-0002-0001 repaired. Taken to warehouse by superadmin', '2024-11-28 14:12:46.000000');

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
(1, 'superadmin', '$2y$13$bp2w2.mTeJ/ORRVlEjA.jOHw0o49vwAJ.A15RTPjnSyk05M.20ZyS', 1, 1, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', NULL, 'super@mail.com', 'OtBMG-3O_ULHaEMKmM_pZIPvia1k_js_', '', 1, '', 5, 'id'),
(4, 'appadmin', '$2y$13$.X94ue5lX8Yt10motmlym.HyhumhiBXBZ7leukSITV7e9sTgLjNrK', 1, 0, '2024-10-28 13:20:22.00', '0000-00-00 00:00:00.00', '::1', 'bogosbinted@mail.com', 'pUwr74uXpIAq5h1XQU-3y3PuplNbm2P8', '', 1, '', 5, NULL),
(5, 'franzferdinand', '$2y$13$QEUqv2hQRuKQ2uFtNfXbcuPoiz2pyiZsn1kpv3RfboEQEdA8MZC9e', 1, 0, '2024-10-28 14:32:42.00', '0000-00-00 00:00:00.00', '::1', 'ferdinand@mail.com', 'LZN0hVpdM-xAb6SA0AEALIcxiVeCAS5H', '', 1, '', 13, 'id'),
(8, 'warehouse@mail.com', '$2y$13$XZ6TofHa8d5cAMutTqSMs.QzdqeRCGMeRs3ZfqoMQCWveNyOjdTs2', 1, 0, '2024-10-30 08:40:40.00', '0000-00-00 00:00:00.00', '::1', 'fred@mail.com', 'JGU2pLcVye5PBUUqBlGuB7h1M8c6gkrx', '', 1, '', 5, NULL),
(9, 'bobtherepairman', '$2y$13$0FJ7ZV.5Th2sydV4mDEP2u81kx56ocrbVEFZomEzdjK6xPfRt0xGa', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'bobrepair@mail.com', 'MbIXLNVCI6OHZFAZgwzyyLXTeiaVd6At', '', 1, '', 5, 'en'),
(10, 'bogosbinted', '$2y$13$byH/Orep9xl5ZWDL1IMtH.1NRxOm2IK/s9vDxODkiEp7o2gJ9TuZ2', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'bogosbinted@alien.com', 'LMStQ2EH_AMPtTfWSbwc9Li493FfLSTY', '', 1, '', 5, NULL),
(11, 'manfred', '$2y$13$S.Pu6X0K3VWvc/kr2atfyuWdDK9xYc1BMFyvHBnjKWMjJCZuUwKRG', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'redbaron@mail.com', 'E8fnjVCzTMoHqvXiFnfAyEEw7aU80X5W', '', 1, '', 5, 'de'),
(12, 'hugh', '$2y$13$iREFX85Oa9udbjkKDslyy.46GR1OLNOKYh6JaiZ03pfwS59xaCnUS', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'hugh@mail.com', '-R2PpAC6v4_aTMieMxphBxZ3l_tgVRez', '', 1, '', 5, NULL),
(14, 'admin_en', '$2y$13$NHfn.C7OGhaRG5/7IIHy/.Wj7q0jNKBOznQAz9kjlnCtDNJP0G3IG', 1, 1, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'admin_en@mail.com', '9YMT5b8a1ZCf18Sa01GV9z_YC4o7tLzI', '', 1, NULL, NULL, 'en'),
(15, 'ayylmao', '$2y$13$x0QphLkVQfC3H0emEqg...BIYV/WcQ3BgnkfjBDH9EBxRw6D91sIK', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'ayylmao@mail.com', 'qCfi3ew0w3uCaGeSUCTXCGiWsnyHhiOI', '', 1, NULL, 9, NULL),
(16, 'wilhelm', '$2y$13$blFp7hYsLyNBWP24NbxLxuSS8uVGcW/iSaKgnmfekmCy5rB6fYp3.', 1, 0, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00', '::1', 'kaiser@mail.com', 'JZ1mfkN_QMtMh9X1Gwf3IHatXo1DqOVB', '', 1, NULL, 10, 'id'),
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
(116, '6745225402f54', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 4, 1732605620, 'Firefox', 'Windows'),
(117, '674526a7d2dac', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 5, 1732606727, 'Firefox', 'Windows'),
(118, '674533031726b', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 1, 1732609891, 'Chrome', 'Windows'),
(119, '6745359f1ca3a', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 14, 1732610559, 'Chrome', 'Windows'),
(120, '6745385b07f9e', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 9, 1732611259, 'Chrome', 'Windows'),
(121, '674538636b512', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 14, 1732611267, 'Chrome', 'Windows'),
(122, '6745789e7baaf', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 1, 1732627710, 'Chrome', 'Windows'),
(123, '67457eaace6b0', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 16, 1732629258, 'Chrome', 'Windows'),
(124, '67457f3baf2db', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 14, 1732629403, 'Chrome', 'Windows'),
(125, '6747c66364a5e', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 14, 1732778691, 'Chrome', 'Windows'),
(126, '6747dba523bf7', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732784133, 'Chrome', 'Windows'),
(127, '6747dba60b4a2', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732784134, 'Chrome', 'Windows'),
(128, '6747e3caed14b', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 5, 1732786218, 'Chrome', 'Windows'),
(129, '674814093f8c7', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 5, 1732798569, 'Chrome', 'Windows'),
(130, '674914be85960', '::1', 'id', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 1, 1732864286, 'Chrome', 'Windows');

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
  MODIFY `id_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id_category` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `item_unit`
--
ALTER TABLE `item_unit`
  MODIFY `id_unit` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1030;

--
-- AUTO_INCREMENT for table `lending`
--
ALTER TABLE `lending`
  MODIFY `id_lending` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `lending_type_lookup`
--
ALTER TABLE `lending_type_lookup`
  MODIFY `id_type` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `repair_log`
--
ALTER TABLE `repair_log`
  MODIFY `id_repair` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

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
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_visit_log`
--
ALTER TABLE `user_visit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

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

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2021 at 03:13 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `berp3`
--

-- --------------------------------------------------------

--
-- Table structure for table `erp_accounting_account`
--

CREATE TABLE `erp_accounting_account` (
  `rowid` bigint(20) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_pcg_version` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pcg_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_parent` int(11) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `labelshort` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_accounting_category` int(11) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `reconcilable` tinyint(4) NOT NULL DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_accounting_bookkeeping`
--

CREATE TABLE `erp_accounting_bookkeeping` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `piece_num` int(11) NOT NULL,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_ref` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subledger_account` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subledger_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_compte` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_compte` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_operation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) DEFAULT NULL,
  `sens` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lettering_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `journal_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_export` datetime DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_accounting_bookkeeping_tmp`
--

CREATE TABLE `erp_accounting_bookkeeping_tmp` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_ref` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subledger_account` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subledger_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_compte` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_compte` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_operation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) NOT NULL,
  `sens` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lettering_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `journal_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piece_num` int(11) NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_accounting_fiscalyear`
--

CREATE TABLE `erp_accounting_fiscalyear` (
  `rowid` int(11) NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_accounting_groups_account`
--

CREATE TABLE `erp_accounting_groups_account` (
  `rowid` int(11) NOT NULL,
  `fk_accounting_account` int(11) NOT NULL,
  `fk_c_accounting_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_accounting_journal`
--

CREATE TABLE `erp_accounting_journal` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nature` smallint(6) NOT NULL DEFAULT 1,
  `active` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_accounting_journal`
--

INSERT INTO `erp_accounting_journal` (`rowid`, `entity`, `code`, `label`, `nature`, `active`) VALUES
(1, 1, 'VT', 'ACCOUNTING_SELL_JOURNAL', 2, 1),
(2, 1, 'AC', 'ACCOUNTING_PURCHASE_JOURNAL', 3, 1),
(3, 1, 'BQ', 'FinanceJournal', 4, 1),
(4, 1, 'OD', 'ACCOUNTING_MISCELLANEOUS_JOURNAL', 1, 1),
(5, 1, 'AN', 'ACCOUNTING_HAS_NEW_JOURNAL', 9, 1),
(6, 1, 'ER', 'ExpenseReportsJournal', 5, 1),
(7, 1, 'INV', 'InventoryJournal', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_accounting_system`
--

CREATE TABLE `erp_accounting_system` (
  `rowid` int(11) NOT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `pcg_version` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_accounting_system`
--

INSERT INTO `erp_accounting_system` (`rowid`, `fk_country`, `pcg_version`, `label`, `active`) VALUES
(1, 1, 'PCG99-ABREGE', 'The simple accountancy french plan', 1),
(2, 1, 'PCG99-BASE', 'The base accountancy french plan', 1),
(3, 1, 'PCG14-DEV', 'The developed accountancy french plan 2014', 1),
(4, 1, 'PCG18-ASSOC', 'French foundation chart of accounts 2018', 1),
(5, 1, 'PCGAFR14-DEV', 'The developed farm accountancy french plan 2014', 1),
(6, 2, 'PCMN-BASE', 'The base accountancy belgium plan', 1),
(7, 4, 'PCG08-PYME', 'The PYME accountancy spanish plan', 1),
(8, 5, 'SKR03', 'Standardkontenrahmen SKR 03', 1),
(9, 5, 'SKR04', 'Standardkontenrahmen SKR 04', 1),
(10, 6, 'PCG_SUISSE', 'Switzerland plan', 1),
(11, 7, 'ENG-BASE', 'England plan', 1),
(12, 10, 'PCT', 'The Tunisia plan', 1),
(13, 12, 'PCG', 'The Moroccan chart of accounts', 1),
(14, 13, 'NSCF', 'Nouveau systĂ¨me comptable financier', 1),
(15, 17, 'NL-VERKORT', 'Verkort rekeningschema', 1),
(16, 20, 'BAS-K1-MINI', 'The Swedish mini chart of accounts', 1),
(17, 41, 'AT-BASE', 'Plan Austria', 1),
(18, 67, 'PC-MIPYME', 'The PYME accountancy Chile plan', 1),
(19, 80, 'DK-STD', 'Standardkontoplan fra SKAT', 1),
(20, 84, 'EC-SUPERCIAS', 'Plan de cuentas Ecuador', 1),
(21, 140, 'PCN-LUXEMBURG', 'Plan comptable normalisĂ© Luxembourgeois', 1),
(22, 188, 'RO-BASE', 'Plan de conturi romanesc', 1),
(23, 49, 'SYSCOHADA-BJ', 'Plan comptable Ouest-Africain', 1),
(24, 60, 'SYSCOHADA-BF', 'Plan comptable Ouest-Africain', 1),
(25, 73, 'SYSCOHADA-CD', 'Plan comptable Ouest-Africain', 1),
(26, 65, 'SYSCOHADA-CF', 'Plan comptable Ouest-Africain', 1),
(27, 72, 'SYSCOHADA-CG', 'Plan comptable Ouest-Africain', 1),
(28, 21, 'SYSCOHADA-CI', 'Plan comptable Ouest-Africain', 1),
(29, 24, 'SYSCOHADA-CM', 'Plan comptable Ouest-Africain', 1),
(30, 16, 'SYSCOHADA-GA', 'Plan comptable Ouest-Africain', 1),
(31, 87, 'SYSCOHADA-GQ', 'Plan comptable Ouest-Africain', 1),
(32, 71, 'SYSCOHADA-KM', 'Plan comptable Ouest-Africain', 1),
(33, 147, 'SYSCOHADA-ML', 'Plan comptable Ouest-Africain', 1),
(34, 168, 'SYSCOHADA-NE', 'Plan comptable Ouest-Africain', 1),
(35, 22, 'SYSCOHADA-SN', 'Plan comptable Ouest-Africain', 1),
(36, 66, 'SYSCOHADA-TD', 'Plan comptable Ouest-Africain', 1),
(37, 15, 'SYSCOHADA-TG', 'Plan comptable Ouest-Africain', 1),
(38, 11, 'US-BASE', 'USA basic chart of accounts', 1),
(39, 14, 'CA-ENG-BASE', 'Canadian basic chart of accounts - English', 1),
(40, 154, 'SAT/24-2019', 'Catalogo y codigo agrupador fiscal del 2019', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_actioncomm`
--

CREATE TABLE `erp_actioncomm` (
  `id` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datep` datetime DEFAULT NULL,
  `datep2` datetime DEFAULT NULL,
  `fk_action` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `fk_user_action` int(11) DEFAULT NULL,
  `fk_user_done` int(11) DEFAULT NULL,
  `transparency` int(11) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `visibility` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `fulldayevent` smallint(6) NOT NULL DEFAULT 0,
  `percent` smallint(6) NOT NULL DEFAULT 0,
  `location` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `durationp` double DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calling_duration` int(11) DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_msgid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_tocc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_tobcc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `errors_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurid` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurrule` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurdateend` datetime DEFAULT NULL,
  `num_vote` int(11) DEFAULT NULL,
  `event_paid` smallint(6) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `fk_element` int(11) DEFAULT NULL,
  `elementtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_actioncomm`
--

INSERT INTO `erp_actioncomm` (`id`, `ref`, `ref_ext`, `entity`, `datep`, `datep2`, `fk_action`, `code`, `datec`, `tms`, `fk_user_author`, `fk_user_mod`, `fk_project`, `fk_soc`, `fk_contact`, `fk_parent`, `fk_user_action`, `fk_user_done`, `transparency`, `priority`, `visibility`, `fulldayevent`, `percent`, `location`, `durationp`, `label`, `note`, `calling_duration`, `email_subject`, `email_msgid`, `email_from`, `email_sender`, `email_to`, `email_tocc`, `email_tobcc`, `errors_to`, `reply_to`, `recurid`, `recurrule`, `recurdateend`, `num_vote`, `event_paid`, `status`, `fk_element`, `elementtype`, `import_key`, `extraparams`) VALUES
(1, '1', NULL, 1, '2021-12-08 11:30:23', '2021-12-08 11:30:23', 40, 'AC_COMPANY_CREATE', '2021-12-08 11:30:23', '2021-12-08 11:30:23', 1, NULL, NULL, 4, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Third party Prospect Test created', 'Author: admin\nThird party Prospect Test created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(2, '2', NULL, 1, '2021-12-08 11:35:25', '2021-12-08 11:35:25', 40, 'AC_PRODUCT_CREATE', '2021-12-08 11:35:25', '2021-12-08 11:35:25', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Product 09112021_BLU created', 'Author: admin\nProduct 09112021_BLU created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 6, 'product', NULL, NULL),
(3, '3', NULL, 1, '2021-12-08 11:35:25', '2021-12-08 11:35:25', 40, 'AC_PRODUCT_MODIFY', '2021-12-08 11:35:25', '2021-12-08 11:35:25', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Product 09112021_BLU modified', 'Author: admin\nProduct 09112021_BLU modified', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 6, 'product', NULL, NULL),
(4, '4', NULL, 1, '2021-12-08 11:52:34', '2021-12-08 11:52:34', 40, 'AC_BOM_VALIDATE', '2021-12-08 11:52:34', '2021-12-08 11:52:34', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM validated', 'Author: admin\nBOM validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, 'bom', NULL, NULL),
(5, '5', NULL, 1, '2021-12-08 11:54:20', '2021-12-08 11:54:20', 40, 'AC_MRP_MO_VALIDATE', '2021-12-08 11:54:20', '2021-12-08 11:54:20', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'MO validated', 'Author: admin\nMO validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, 'mo', NULL, NULL),
(6, '6', NULL, 1, '2021-12-08 11:56:14', '2021-12-08 11:56:14', 40, 'AC_MRP_MO_PRODUCED', '2021-12-08 11:56:14', '2021-12-08 11:56:14', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'MO produced', 'Author: admin\nMO produced', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, 'mo', NULL, NULL),
(7, '7', NULL, 1, '2021-12-08 11:56:34', '2021-12-08 11:56:34', 40, 'AC_MRP_MO_PRODUCED', '2021-12-08 11:56:34', '2021-12-08 11:56:34', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'MO produced', 'Author: admin\nMO produced', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, 'mo', NULL, NULL),
(8, '8', NULL, 1, '2021-12-08 13:23:44', '2021-12-08 13:23:44', 40, 'AC_BILL_VALIDATE', '2021-12-08 13:23:44', '2021-12-08 13:23:44', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice TC1-2112-0002 validated', 'Author: admin\nInvoice TC1-2112-0002 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16, 'invoice', NULL, NULL),
(9, '9', NULL, 1, '2021-12-09 04:48:12', '2021-12-09 04:48:12', 40, 'AC_BILL_DELETE', '2021-12-09 04:48:12', '2021-12-09 04:48:12', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 17, 'invoice', NULL, NULL),
(10, '10', NULL, 1, '2021-12-09 05:00:49', '2021-12-09 05:00:49', 40, 'AC_BILL_DELETE', '2021-12-09 05:00:49', '2021-12-09 05:00:49', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 21, 'invoice', NULL, NULL),
(11, '11', NULL, 1, '2021-12-09 05:00:54', '2021-12-09 05:00:54', 40, 'AC_BILL_DELETE', '2021-12-09 05:00:54', '2021-12-09 05:00:54', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 20, 'invoice', NULL, NULL),
(12, '12', NULL, 1, '2021-12-09 05:00:57', '2021-12-09 05:00:57', 40, 'AC_BILL_DELETE', '2021-12-09 05:00:57', '2021-12-09 05:00:57', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 19, 'invoice', NULL, NULL),
(13, '13', NULL, 1, '2021-12-09 05:00:59', '2021-12-09 05:00:59', 40, 'AC_BILL_DELETE', '2021-12-09 05:00:59', '2021-12-09 05:00:59', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 18, 'invoice', NULL, NULL),
(14, '14', NULL, 1, '2021-12-09 05:01:44', '2021-12-09 05:01:44', 40, 'AC_BILL_DELETE', '2021-12-09 05:01:44', '2021-12-09 05:01:44', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 22, 'invoice', NULL, NULL),
(15, '15', NULL, 1, '2021-12-09 06:54:40', '2021-12-09 06:54:40', 40, 'AC_BILL_DELETE', '2021-12-09 06:54:40', '2021-12-09 06:54:40', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 23, 'invoice', NULL, NULL),
(16, '16', NULL, 1, '2021-12-09 06:54:46', '2021-12-09 06:54:46', 40, 'AC_BILL_DELETE', '2021-12-09 06:54:46', '2021-12-09 06:54:46', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 26, 'invoice', NULL, NULL),
(17, '17', NULL, 1, '2021-12-09 06:54:52', '2021-12-09 06:54:52', 40, 'AC_BILL_DELETE', '2021-12-09 06:54:52', '2021-12-09 06:54:52', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 25, 'invoice', NULL, NULL),
(18, '18', NULL, 1, '2021-12-09 06:54:55', '2021-12-09 06:54:55', 40, 'AC_BILL_DELETE', '2021-12-09 06:54:55', '2021-12-09 06:54:55', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 24, 'invoice', NULL, NULL),
(19, '19', NULL, 1, '2021-12-09 06:56:41', '2021-12-09 06:56:41', 40, 'AC_BILL_VALIDATE', '2021-12-09 06:56:41', '2021-12-09 06:56:41', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice TC1-2112-0003 validated', 'Author: admin\nInvoice TC1-2112-0003 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 27, 'invoice', NULL, NULL),
(20, '20', NULL, 1, '2021-12-09 06:56:41', '2021-12-09 06:56:41', 40, 'AC_BILL_PAYED', '2021-12-09 06:56:41', '2021-12-09 06:56:41', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice TC1-2112-0003 changed to paid', 'Author: admin\nInvoice TC1-2112-0003 changed to paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 27, 'invoice', NULL, NULL),
(21, '21', NULL, 1, '2021-12-09 07:17:21', '2021-12-09 07:17:21', 40, 'AC_BILL_DELETE', '2021-12-09 07:17:21', '2021-12-09 07:17:21', 1, NULL, NULL, 1, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice deleted', 'Author: admin\nInvoice deleted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 29, 'invoice', NULL, NULL),
(22, '22', NULL, 1, '2021-12-10 14:50:59', '2021-12-10 14:50:59', 40, 'AC_COMPANY_CREATE', '2021-12-10 14:50:59', '2021-12-10 14:50:59', 1, NULL, NULL, 5, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Third party Abc Pte Ltd created', 'Author: admin\nThird party Abc Pte Ltd created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(23, '23', NULL, 1, '2021-12-12 11:59:52', '2021-12-12 11:59:52', 40, 'AC_CONTACT_CREATE', '2021-12-12 11:59:52', '2021-12-12 11:59:52', 1, NULL, NULL, 5, 2, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contact Person A created', 'Author: admin\nContact Person A created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(24, '24', NULL, 1, '2021-12-12 12:14:02', '2021-12-12 12:14:02', 40, 'AC_COMPANY_CREATE', '2021-12-12 12:14:02', '2021-12-12 12:14:02', 1, NULL, NULL, 6, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Third party Customer Pte Ltd created', 'Author: admin\nThird party Customer Pte Ltd created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(25, '25', NULL, 1, '2021-12-12 12:15:24', '2021-12-12 12:15:24', 40, 'AC_CONTACT_CREATE', '2021-12-12 12:15:24', '2021-12-12 12:15:24', 1, NULL, NULL, 6, 3, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contact Warehouse 1 created', 'Author: admin\nContact Warehouse 1 created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(26, '26', NULL, 1, '2021-12-12 12:15:28', '2021-12-12 12:15:28', 40, 'AC_CONTACT_CREATE', '2021-12-12 12:15:28', '2021-12-12 12:15:28', 1, NULL, NULL, 6, 4, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contact Warehouse 2 created', 'Author: admin\nContact Warehouse 2 created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(27, '27', NULL, 1, '2021-12-12 12:21:41', '2021-12-12 12:21:41', 40, 'AC_PRODUCT_CREATE', '2021-12-12 12:21:41', '2021-12-12 12:21:41', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Product 001 created', 'Author: admin\nProduct 001 created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 7, 'product', NULL, NULL),
(28, '28', NULL, 1, '2021-12-12 12:22:06', '2021-12-12 12:22:06', 40, 'AC_PRODUCT_MODIFY', '2021-12-12 12:22:06', '2021-12-12 12:22:06', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Product 001 modified', 'Author: admin\nProduct 001 modified', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 7, 'product', NULL, NULL),
(29, '29', NULL, 1, '2021-12-12 12:40:33', '2021-12-12 12:40:33', 40, 'AC_PRODUCT_CREATE', '2021-12-12 12:40:33', '2021-12-12 12:40:33', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Product 002 created', 'Author: admin\nProduct 002 created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 8, 'product', NULL, NULL),
(30, '30', NULL, 1, '2021-12-12 12:47:03', '2021-12-12 12:47:03', 40, 'AC_BOM_UNVALIDATE', '2021-12-12 12:47:03', '2021-12-12 12:47:03', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM unvalidated', 'Author: admin\nBOM unvalidated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(31, '31', NULL, 1, '2021-12-12 12:47:30', '2021-12-12 12:47:30', 40, 'AC_BOM_VALIDATE', '2021-12-12 12:47:30', '2021-12-12 12:47:30', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM validated', 'Author: admin\nBOM validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(32, '32', NULL, 1, '2021-12-12 12:52:38', '2021-12-12 12:52:38', 40, 'AC_BOM_UNVALIDATE', '2021-12-12 12:52:38', '2021-12-12 12:52:38', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM unvalidated', 'Author: admin\nBOM unvalidated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(33, '33', NULL, 1, '2021-12-12 12:52:51', '2021-12-12 12:52:51', 40, 'AC_BOM_VALIDATE', '2021-12-12 12:52:51', '2021-12-12 12:52:51', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM validated', 'Author: admin\nBOM validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(34, '34', NULL, 1, '2021-12-12 12:53:30', '2021-12-12 12:53:30', 40, 'AC_BOM_UNVALIDATE', '2021-12-12 12:53:30', '2021-12-12 12:53:30', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM unvalidated', 'Author: admin\nBOM unvalidated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(35, '35', NULL, 1, '2021-12-12 12:53:38', '2021-12-12 12:53:38', 40, 'AC_BOM_VALIDATE', '2021-12-12 12:53:38', '2021-12-12 12:53:38', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM validated', 'Author: admin\nBOM validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(36, '36', NULL, 1, '2021-12-12 12:53:54', '2021-12-12 12:53:54', 40, 'AC_BOM_UNVALIDATE', '2021-12-12 12:53:54', '2021-12-12 12:53:54', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM unvalidated', 'Author: admin\nBOM unvalidated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(37, '37', NULL, 1, '2021-12-12 12:53:58', '2021-12-12 12:53:58', 40, 'AC_BOM_VALIDATE', '2021-12-12 12:53:58', '2021-12-12 12:53:58', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM validated', 'Author: admin\nBOM validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(38, '38', NULL, 1, '2021-12-12 12:54:09', '2021-12-12 12:54:09', 40, 'AC_BOM_UNVALIDATE', '2021-12-12 12:54:09', '2021-12-12 12:54:09', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM unvalidated', 'Author: admin\nBOM unvalidated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(39, '39', NULL, 1, '2021-12-12 12:54:18', '2021-12-12 12:54:18', 40, 'AC_BOM_VALIDATE', '2021-12-12 12:54:18', '2021-12-12 12:54:18', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM validated', 'Author: admin\nBOM validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(40, '40', NULL, 1, '2021-12-12 12:54:46', '2021-12-12 12:54:46', 40, 'AC_BOM_UNVALIDATE', '2021-12-12 12:54:46', '2021-12-12 12:54:46', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM unvalidated', 'Author: admin\nBOM unvalidated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(41, '41', NULL, 1, '2021-12-12 12:55:41', '2021-12-12 12:55:41', 40, 'AC_BOM_VALIDATE', '2021-12-12 12:55:41', '2021-12-12 12:55:41', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'BOM validated', 'Author: admin\nBOM validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'bom', NULL, NULL),
(42, '42', NULL, 1, '2021-12-13 14:21:56', '2021-12-13 14:21:56', 40, 'AC_PROJECT_CREATE', '2021-12-13 14:21:56', '2021-12-13 14:21:56', 1, NULL, 1, 5, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Project PJ2112-0001 created', 'Author: admin\nProject PJ2112-0001 created\nProject: PJ2112-0001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(43, '43', NULL, 1, '2021-12-13 14:23:22', '2021-12-13 14:23:22', 40, 'AC_PROJECT_MODIFY', '2021-12-13 14:23:22', '2021-12-13 14:23:22', 1, NULL, 1, 5, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Project PJ2112-0001 modified', 'Author: admin\nProject PJ2112-0001 modified\nLead status:  -> -1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(44, '44', NULL, 1, '2021-12-13 14:24:58', '2021-12-13 14:24:58', 40, 'AC_PROJECT_VALIDATE', '2021-12-13 14:24:58', '2021-12-13 14:24:58', 1, NULL, 1, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Project PJ2112-0001 validated', 'Author: admin\nProject PJ2112-0001 validated\nProject: PJ2112-0001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(45, '45', NULL, 1, '2021-12-13 14:26:24', '2021-12-13 14:26:24', 40, 'AC_PROJECT_CREATE', '2021-12-13 14:26:24', '2021-12-13 14:26:24', 1, NULL, 2, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Project PJ2112-0002 created', 'Author: admin\nProject PJ2112-0002 created\nProject: PJ2112-0002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(46, '46', NULL, 1, '2021-12-13 14:26:55', '2021-12-13 14:26:55', 40, 'AC_PROJECT_MODIFY', '2021-12-13 14:26:55', '2021-12-13 14:26:55', 1, NULL, 1, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Project PJ2112-0001 modified', 'Author: admin\nProject PJ2112-0001 modified\nLead status:  -> -1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(47, '47', NULL, 1, '2021-12-13 14:27:29', '2021-12-13 14:27:29', 40, 'AC_PROJECT_MODIFY', '2021-12-13 14:27:29', '2021-12-13 14:27:29', 1, NULL, 1, 6, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Project PJ2112-0001 modified', 'Author: admin\nProject PJ2112-0001 modified\nLead status:  -> -1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(48, '48', NULL, 1, '2021-12-13 14:29:12', '2021-12-13 14:29:12', 40, 'AC_PRODUCT_MODIFY', '2021-12-13 14:29:12', '2021-12-13 14:29:12', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Product 002 modified', 'Author: admin\nProduct 002 modified', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 8, 'product', NULL, NULL),
(49, '49', NULL, 1, '2021-12-17 09:13:31', '2021-12-17 09:13:31', 40, 'AC_ORDER_VALIDATE', '2021-12-17 09:13:31', '2021-12-17 09:13:31', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0005 validated', 'Author: admin\nOrder CO2112-0005 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 9, 'order', NULL, NULL),
(50, '50', NULL, 1, '2021-12-17 09:14:20', '2021-12-17 09:14:20', 40, 'AC_PROPAL_VALIDATE', '2021-12-17 09:14:20', '2021-12-17 09:14:20', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Proposal PR2112-0001 validated', 'Author: admin\nProposal PR2112-0001 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'propal', NULL, NULL),
(51, '51', NULL, 1, '2021-12-17 09:14:33', '2021-12-17 09:14:33', 40, 'AC_PROPAL_CLOSE_SIGNED', '2021-12-17 09:14:33', '2021-12-17 09:14:33', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Proposal PR2112-0001 signed', 'Author: admin\nProposal PR2112-0001 signed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'propal', NULL, NULL),
(52, '52', NULL, 1, '2021-12-17 09:18:42', '2021-12-17 09:18:42', 40, 'AC_ORDER_VALIDATE', '2021-12-17 09:18:42', '2021-12-17 09:18:42', 1, NULL, NULL, 4, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0006 validated', 'Author: admin\nOrder CO2112-0006 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 11, 'order', NULL, NULL),
(53, '53', NULL, 1, '2021-12-17 09:25:44', '2021-12-17 09:25:44', 40, 'AC_CONTACT_CREATE', '2021-12-17 09:25:44', '2021-12-17 09:25:44', 1, NULL, NULL, NULL, 5, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contact lim Han created', 'Author: admin\nContact lim Han created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(54, '54', NULL, 1, '2021-12-17 09:26:36', '2021-12-17 09:26:36', 40, 'AC_CONTACT_CREATE', '2021-12-17 09:26:36', '2021-12-17 09:26:36', 1, NULL, NULL, NULL, 6, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contact Fiona Kok created', 'Author: admin\nContact Fiona Kok created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(55, '55', NULL, 1, '2021-12-17 09:27:53', '2021-12-17 09:27:53', 40, 'AC_CONTACT_CREATE', '2021-12-17 09:27:53', '2021-12-17 09:27:53', 1, NULL, NULL, 5, 7, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contact See Gin Foo created', 'Author: admin\nContact See Gin Foo created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(56, '56', NULL, 1, '2021-12-17 09:29:31', '2021-12-17 09:29:31', 40, 'AC_CONTACT_CREATE', '2021-12-17 09:29:31', '2021-12-17 09:29:31', 1, NULL, NULL, NULL, 8, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contact Andrew Yek created', 'Author: admin\nContact Andrew Yek created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(57, '57', NULL, 1, '2021-12-17 09:31:22', '2021-12-17 09:31:22', 40, 'AC_CONTACT_CREATE', '2021-12-17 09:31:22', '2021-12-17 09:31:22', 1, NULL, NULL, 3, 9, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contact Fiona Kok created', 'Author: admin\nContact Fiona Kok created', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(58, '58', NULL, 1, '2021-12-17 09:32:27', '2021-12-17 09:32:27', 40, 'AC_CONTACT_MODIFY', '2021-12-17 09:32:27', '2021-12-17 09:32:27', 1, NULL, NULL, 3, 9, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contact  modified', 'Author: admin\nContact  modified', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(59, '59', NULL, 1, '2021-12-17 09:36:04', '2021-12-17 09:36:04', 40, 'AC_CONTACT_MODIFY', '2021-12-17 09:36:04', '2021-12-17 09:36:04', 1, NULL, NULL, 3, 9, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contact  modified', 'Author: admin\nContact  modified', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(60, '60', NULL, 1, '2021-12-17 09:37:00', '2021-12-17 09:37:00', 40, 'AC_COMPANY_MODIFY', '2021-12-17 09:37:00', '2021-12-17 09:37:00', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Third party Nana modified', 'Author: admin\nThird party Nana modified', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(61, '61', NULL, 1, '2021-12-17 09:39:15', '2021-12-17 09:39:15', 40, 'AC_ORDER_VALIDATE', '2021-12-17 09:39:15', '2021-12-17 09:39:15', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0007 validated', 'Author: admin\nOrder CO2112-0007 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 12, 'order', NULL, NULL),
(62, '62', NULL, 1, '2021-12-17 09:41:00', '2021-12-17 09:41:00', 40, 'AC_ORDER_VALIDATE', '2021-12-17 09:41:00', '2021-12-17 09:41:00', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0007 validated', 'Author: admin\nOrder CO2112-0007 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 12, 'order', NULL, NULL),
(63, '63', NULL, 1, '2021-12-17 09:41:39', '2021-12-17 09:41:39', 40, 'AC_SHIPPING_VALIDATE', '2021-12-17 09:41:39', '2021-12-17 09:41:39', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Shipment SH2112-0001 validated', 'Author: admin\nShipment SH2112-0001 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, 'shipping', NULL, NULL),
(64, '64', NULL, 1, '2021-12-17 09:42:05', '2021-12-17 09:42:05', 40, 'AC_ORDER_CLOSE', '2021-12-17 09:42:05', '2021-12-17 09:42:05', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0007 classified delivered', 'Author: admin\nOrder CO2112-0007 classified delivered', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 12, 'order', NULL, NULL),
(65, '65', NULL, 1, '2021-12-17 09:42:34', '2021-12-17 09:42:34', 40, 'AC_BILL_VALIDATE', '2021-12-17 09:42:34', '2021-12-17 09:42:34', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice FA2112-0005 validated', 'Author: admin\nInvoice FA2112-0005 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 34, 'invoice', NULL, NULL),
(66, '66', NULL, 1, '2021-12-17 09:43:55', '2021-12-17 09:43:55', 40, 'AC_ORDER_VALIDATE', '2021-12-17 09:43:55', '2021-12-17 09:43:55', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0008 validated', 'Author: admin\nOrder CO2112-0008 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 13, 'order', NULL, NULL),
(67, '67', NULL, 1, '2021-12-17 09:44:20', '2021-12-17 09:44:20', 40, 'AC_BILL_VALIDATE', '2021-12-17 09:44:20', '2021-12-17 09:44:20', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice FA2112-0006 validated', 'Author: admin\nInvoice FA2112-0006 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 35, 'invoice', NULL, NULL),
(68, '68', NULL, 1, '2021-12-17 09:45:44', '2021-12-17 09:45:44', 40, 'AC_SHIPPING_VALIDATE', '2021-12-17 09:45:44', '2021-12-17 09:45:44', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Shipment SH2112-0002 validated', 'Author: admin\nShipment SH2112-0002 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 3, 'shipping', NULL, NULL),
(69, '69', NULL, 1, '2021-12-17 09:47:00', '2021-12-17 09:47:00', 40, 'AC_BILL_VALIDATE', '2021-12-17 09:47:00', '2021-12-17 09:47:00', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice FA2112-0007 validated', 'Author: admin\nInvoice FA2112-0007 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 36, 'invoice', NULL, NULL),
(70, '70', NULL, 1, '2021-12-17 09:48:25', '2021-12-17 09:48:25', 40, 'AC_BILL_PAYED', '2021-12-17 09:48:25', '2021-12-17 09:48:25', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice FA2112-0006 changed to paid', 'Author: admin\nInvoice FA2112-0006 changed to paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 35, 'invoice', NULL, NULL),
(71, '71', NULL, 1, '2021-12-17 09:49:07', '2021-12-17 09:49:07', 40, 'AC_BILL_PAYED', '2021-12-17 09:49:07', '2021-12-17 09:49:07', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice FA2112-0007 changed to paid', 'Author: admin\nInvoice FA2112-0007 changed to paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 36, 'invoice', NULL, NULL),
(72, '72', NULL, 1, '2021-12-17 09:49:59', '2021-12-17 09:49:59', 40, 'AC_ORDER_CLOSE', '2021-12-17 09:49:59', '2021-12-17 09:49:59', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0008 classified delivered', 'Author: admin\nOrder CO2112-0008 classified delivered', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 13, 'order', NULL, NULL),
(73, '73', NULL, 1, '2021-12-19 13:28:37', '2021-12-19 13:28:37', 40, 'AC_CONTRACT_VALIDATE', '2021-12-19 13:28:37', '2021-12-19 13:28:37', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Contract CT2112-0001 validated', 'Author: admin\nContract CT2112-0001 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'contract', NULL, NULL),
(74, '74', NULL, 1, '2021-12-19 13:35:01', '2021-12-19 13:35:01', 40, 'AC_ORDER_VALIDATE', '2021-12-19 13:35:01', '2021-12-19 13:35:01', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0009 validated', 'Author: admin\nOrder CO2112-0009 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10, 'order', NULL, NULL),
(75, '75', NULL, 1, '2021-12-19 13:39:06', '2021-12-19 13:39:06', 40, 'AC_ORDER_VALIDATE', '2021-12-19 13:39:06', '2021-12-19 13:39:06', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0009 validated', 'Author: admin\nOrder CO2112-0009 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10, 'order', NULL, NULL),
(76, '76', NULL, 1, '2021-12-19 13:40:24', '2021-12-19 13:40:24', 40, 'AC_BILL_VALIDATE', '2021-12-19 13:40:24', '2021-12-19 13:40:24', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice FA2112-0008 validated', 'Author: admin\nInvoice FA2112-0008 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 38, 'invoice', NULL, NULL),
(77, '77', NULL, 1, '2021-12-19 13:40:42', '2021-12-19 13:40:42', 40, 'AC_ORDER_CLASSIFY_BILLED', '2021-12-19 13:40:42', '2021-12-19 13:40:42', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0009 classified billed', 'Author: admin\nOrder CO2112-0009 classified billed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10, 'order', NULL, NULL),
(78, '78', NULL, 1, '2021-12-19 13:43:15', '2021-12-19 13:43:15', 40, 'AC_ORDER_VALIDATE', '2021-12-19 13:43:15', '2021-12-19 13:43:15', 1, NULL, NULL, 6, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0010 validated', 'Author: admin\nOrder CO2112-0010 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 14, 'order', NULL, NULL),
(79, '79', NULL, 1, '2021-12-19 13:43:39', '2021-12-19 13:43:39', 40, 'AC_BILL_VALIDATE', '2021-12-19 13:43:39', '2021-12-19 13:43:39', 1, NULL, NULL, 6, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice AC2112-0001 validated', 'Author: admin\nInvoice AC2112-0001 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 39, 'invoice', NULL, NULL),
(80, '80', NULL, 1, '2021-12-19 13:45:28', '2021-12-19 13:45:28', 40, 'AC_ORDER_VALIDATE', '2021-12-19 13:45:28', '2021-12-19 13:45:28', 1, NULL, NULL, 6, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0010 validated', 'Author: admin\nOrder CO2112-0010 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 14, 'order', NULL, NULL),
(81, '81', NULL, 1, '2021-12-19 13:45:51', '2021-12-19 13:45:51', 40, 'AC_ORDER_CLOSE', '2021-12-19 13:45:51', '2021-12-19 13:45:51', 1, NULL, NULL, 3, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Order CO2112-0009 classified delivered', 'Author: admin\nOrder CO2112-0009 classified delivered', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10, 'order', NULL, NULL),
(82, '82', NULL, 1, '2021-12-19 13:46:40', '2021-12-19 13:46:40', 40, 'AC_BILL_UNVALIDATE', '2021-12-19 13:46:40', '2021-12-19 13:46:40', 1, NULL, NULL, 6, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice AC2112-0001 go back to draft status', 'Author: admin\nInvoice AC2112-0001 go back to draft status', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 39, 'invoice', NULL, NULL),
(83, '83', NULL, 1, '2021-12-19 13:49:55', '2021-12-19 13:49:55', 40, 'AC_SHIPPING_VALIDATE', '2021-12-19 13:49:55', '2021-12-19 13:49:55', 1, NULL, NULL, 6, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Shipment SH2112-0003 validated', 'Author: admin\nShipment SH2112-0003 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 4, 'shipping', NULL, NULL),
(84, '84', NULL, 1, '2021-12-19 13:50:08', '2021-12-19 13:50:08', 40, 'AC_BILL_VALIDATE', '2021-12-19 13:50:08', '2021-12-19 13:50:08', 1, NULL, NULL, 6, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice FA2112-0009 validated', 'Author: admin\nInvoice FA2112-0009 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 40, 'invoice', NULL, NULL),
(85, '85', NULL, 1, '2021-12-19 13:50:23', '2021-12-19 13:50:23', 40, 'AC_BILL_VALIDATE', '2021-12-19 13:50:23', '2021-12-19 13:50:23', 1, NULL, NULL, 6, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Invoice AC2112-0001 validated', 'Author: admin\nInvoice AC2112-0001 validated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 39, 'invoice', NULL, NULL),
(86, '86', NULL, 1, '2021-12-20 03:19:53', '2021-12-20 03:19:53', 40, 'AC_USER_SENTBYMAIL', '2021-12-20 03:19:53', '2021-12-20 03:19:53', 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 'default', 0, -1, '', NULL, 'Email sent by SuperAdmin to SuperAdmin', 'Author: admin<br>\nSender: SuperAdmin &lt;nhanh.ngo@tangiaba.com&gt;<br>\nReceiver(s): SuperAdmin &lt;nhanh.ngo@tangiaba.com&gt;<br>\nEmail subject: Information<br>\nEmail body:<br>\nHello<br>\r\n<br>\r\n<br>\r\nSincerely', NULL, 'Information', '1639970393.phpmail-berp3-use1@e00c4204576270a0fb4cba99ee7648fa', 'SuperAdmin <nhanh.ngo@tangiaba.com>', NULL, 'SuperAdmin <nhanh.ngo@tangiaba.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_actioncomm_extrafields`
--

CREATE TABLE `erp_actioncomm_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_actioncomm_reminder`
--

CREATE TABLE `erp_actioncomm_reminder` (
  `rowid` int(11) NOT NULL,
  `dateremind` datetime NOT NULL,
  `typeremind` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_user` int(11) NOT NULL,
  `offsetvalue` int(11) NOT NULL,
  `offsetunit` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `lasterror` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_actioncomm` int(11) NOT NULL,
  `fk_email_template` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_actioncomm_resources`
--

CREATE TABLE `erp_actioncomm_resources` (
  `rowid` int(11) NOT NULL,
  `fk_actioncomm` int(11) NOT NULL,
  `element_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_element` int(11) NOT NULL,
  `answer_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mandatory` smallint(6) DEFAULT NULL,
  `transparency` smallint(6) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_actioncomm_resources`
--

INSERT INTO `erp_actioncomm_resources` (`rowid`, `fk_actioncomm`, `element_type`, `fk_element`, `answer_status`, `mandatory`, `transparency`) VALUES
(1, 1, 'user', 1, '0', 0, 0),
(2, 2, 'user', 1, '0', 0, 0),
(3, 3, 'user', 1, '0', 0, 0),
(4, 4, 'user', 1, '0', 0, 0),
(5, 5, 'user', 1, '0', 0, 0),
(6, 6, 'user', 1, '0', 0, 0),
(7, 7, 'user', 1, '0', 0, 0),
(8, 8, 'user', 1, '0', 0, 0),
(9, 9, 'user', 1, '0', 0, 0),
(10, 10, 'user', 1, '0', 0, 0),
(11, 11, 'user', 1, '0', 0, 0),
(12, 12, 'user', 1, '0', 0, 0),
(13, 13, 'user', 1, '0', 0, 0),
(14, 14, 'user', 1, '0', 0, 0),
(15, 15, 'user', 1, '0', 0, 0),
(16, 16, 'user', 1, '0', 0, 0),
(17, 17, 'user', 1, '0', 0, 0),
(18, 18, 'user', 1, '0', 0, 0),
(19, 19, 'user', 1, '0', 0, 0),
(20, 20, 'user', 1, '0', 0, 0),
(21, 21, 'user', 1, '0', 0, 0),
(22, 22, 'user', 1, '0', 0, 0),
(23, 23, 'user', 1, '0', 0, 0),
(24, 23, 'socpeople', 2, '0', 0, 0),
(25, 24, 'user', 1, '0', 0, 0),
(26, 25, 'user', 1, '0', 0, 0),
(27, 25, 'socpeople', 3, '0', 0, 0),
(28, 26, 'user', 1, '0', 0, 0),
(29, 26, 'socpeople', 4, '0', 0, 0),
(30, 27, 'user', 1, '0', 0, 0),
(31, 28, 'user', 1, '0', 0, 0),
(32, 29, 'user', 1, '0', 0, 0),
(33, 30, 'user', 1, '0', 0, 0),
(34, 31, 'user', 1, '0', 0, 0),
(35, 32, 'user', 1, '0', 0, 0),
(36, 33, 'user', 1, '0', 0, 0),
(37, 34, 'user', 1, '0', 0, 0),
(38, 35, 'user', 1, '0', 0, 0),
(39, 36, 'user', 1, '0', 0, 0),
(40, 37, 'user', 1, '0', 0, 0),
(41, 38, 'user', 1, '0', 0, 0),
(42, 39, 'user', 1, '0', 0, 0),
(43, 40, 'user', 1, '0', 0, 0),
(44, 41, 'user', 1, '0', 0, 0),
(45, 42, 'user', 1, '0', 0, 0),
(46, 43, 'user', 1, '0', 0, 0),
(47, 44, 'user', 1, '0', 0, 0),
(48, 45, 'user', 1, '0', 0, 0),
(49, 46, 'user', 1, '0', 0, 0),
(50, 47, 'user', 1, '0', 0, 0),
(51, 48, 'user', 1, '0', 0, 0),
(52, 49, 'user', 1, '0', 0, 0),
(53, 50, 'user', 1, '0', 0, 0),
(54, 51, 'user', 1, '0', 0, 0),
(55, 52, 'user', 1, '0', 0, 0),
(56, 53, 'user', 1, '0', 0, 0),
(57, 53, 'socpeople', 5, '0', 0, 0),
(58, 54, 'user', 1, '0', 0, 0),
(59, 54, 'socpeople', 6, '0', 0, 0),
(60, 55, 'user', 1, '0', 0, 0),
(61, 55, 'socpeople', 7, '0', 0, 0),
(62, 56, 'user', 1, '0', 0, 0),
(63, 56, 'socpeople', 8, '0', 0, 0),
(64, 57, 'user', 1, '0', 0, 0),
(65, 57, 'socpeople', 9, '0', 0, 0),
(66, 58, 'user', 1, '0', 0, 0),
(67, 58, 'socpeople', 9, '0', 0, 0),
(68, 59, 'user', 1, '0', 0, 0),
(69, 59, 'socpeople', 9, '0', 0, 0),
(70, 60, 'user', 1, '0', 0, 0),
(71, 61, 'user', 1, '0', 0, 0),
(72, 62, 'user', 1, '0', 0, 0),
(73, 63, 'user', 1, '0', 0, 0),
(74, 64, 'user', 1, '0', 0, 0),
(75, 65, 'user', 1, '0', 0, 0),
(76, 66, 'user', 1, '0', 0, 0),
(77, 67, 'user', 1, '0', 0, 0),
(78, 68, 'user', 1, '0', 0, 0),
(79, 69, 'user', 1, '0', 0, 0),
(80, 70, 'user', 1, '0', 0, 0),
(81, 71, 'user', 1, '0', 0, 0),
(82, 72, 'user', 1, '0', 0, 0),
(83, 73, 'user', 1, '0', 0, 0),
(84, 74, 'user', 1, '0', 0, 0),
(85, 75, 'user', 1, '0', 0, 0),
(86, 76, 'user', 1, '0', 0, 0),
(87, 77, 'user', 1, '0', 0, 0),
(88, 78, 'user', 1, '0', 0, 0),
(89, 79, 'user', 1, '0', 0, 0),
(90, 80, 'user', 1, '0', 0, 0),
(91, 81, 'user', 1, '0', 0, 0),
(92, 82, 'user', 1, '0', 0, 0),
(93, 83, 'user', 1, '0', 0, 0),
(94, 84, 'user', 1, '0', 0, 0),
(95, 85, 'user', 1, '0', 0, 0),
(96, 86, 'user', 1, '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_adherent`
--

CREATE TABLE `erp_adherent` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `civility` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_crypted` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_adherent_type` int(11) NOT NULL,
  `morphy` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `societe` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialnetworks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_perso` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `public` smallint(6) NOT NULL DEFAULT 0,
  `datefin` datetime DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datevalid` datetime DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `canvas` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_adherent_extrafields`
--

CREATE TABLE `erp_adherent_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_adherent_type`
--

CREATE TABLE `erp_adherent_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `morphy` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `amount` double(24,8) DEFAULT NULL,
  `vote` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_valid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_adherent_type_extrafields`
--

CREATE TABLE `erp_adherent_type_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_adherent_type_lang`
--

CREATE TABLE `erp_adherent_type_lang` (
  `rowid` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_advtargetemailing`
--

CREATE TABLE `erp_advtargetemailing` (
  `rowid` int(11) NOT NULL,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_element` int(11) NOT NULL,
  `type_element` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filtervalue` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_asset`
--

CREATE TABLE `erp_asset` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_ht` double(24,8) DEFAULT NULL,
  `amount_vat` double(24,8) DEFAULT NULL,
  `fk_asset_type` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_asset_extrafields`
--

CREATE TABLE `erp_asset_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_asset_type`
--

CREATE TABLE `erp_asset_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountancy_code_asset` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_depreciation_asset` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_depreciation_expense` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_asset_type_extrafields`
--

CREATE TABLE `erp_asset_type_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_bank`
--

CREATE TABLE `erp_bank` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datev` date DEFAULT NULL,
  `dateo` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_rappro` int(11) DEFAULT NULL,
  `fk_type` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_releve` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_chq` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_compte` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rappro` tinyint(4) DEFAULT 0,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bordereau` int(11) DEFAULT 0,
  `banque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emetteur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `origin_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_bank`
--

INSERT INTO `erp_bank` (`rowid`, `datec`, `tms`, `datev`, `dateo`, `amount`, `label`, `fk_account`, `fk_user_author`, `fk_user_rappro`, `fk_type`, `num_releve`, `num_chq`, `numero_compte`, `rappro`, `note`, `fk_bordereau`, `banque`, `emetteur`, `author`, `origin_id`, `origin_type`, `import_key`) VALUES
(1, '2021-11-11 06:26:50', '2021-11-11 06:26:50', '2021-11-11', '2021-11-11', 0.00000000, '(Initial balance)', 1, 1, NULL, 'SOLD', NULL, NULL, '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2021-11-11 06:28:23', '2021-11-11 06:28:23', '2021-11-11', '2021-11-11', 0.00000000, '(Initial balance)', 2, 1, NULL, 'SOLD', NULL, NULL, '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2021-11-11 06:30:10', '2021-11-11 06:30:10', '2021-11-11', '2021-11-11', 279.37000000, '(CustomerInvoicePayment)', 2, 1, NULL, 'LIQ', NULL, 'TC1-2111-0001', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2021-11-12 09:26:58', '2021-11-12 09:26:58', '2021-11-12', '2021-11-12', 821.00000000, '(CustomerInvoicePayment)', 1, 1, NULL, 'LIQ', NULL, NULL, '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2021-12-09 06:56:41', '2021-12-09 06:56:41', '2021-12-09', '2021-12-09', 25.90000000, '(CustomerInvoicePayment)', 2, 1, NULL, 'LIQ', NULL, 'TC1-2112-0003', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2021-12-17 09:48:25', '2021-12-17 09:48:25', '2021-12-17', '2021-12-17', 214.00000000, '(CustomerInvoicePayment)', 1, 1, NULL, 'VIR', NULL, NULL, '', 0, NULL, 0, NULL, 'Nana', NULL, NULL, NULL, NULL),
(7, '2021-12-17 09:49:07', '2021-12-17 09:49:07', '2021-12-17', '2021-12-17', 214.00000000, '(CustomerInvoicePayment)', 1, 1, NULL, 'VIR', NULL, NULL, '', 0, NULL, 0, NULL, 'Nana', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_bank_account`
--

CREATE TABLE `erp_bank_account` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `bank` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_banque` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_guichet` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_rib` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bic` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban_prefix` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_iban` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_iban` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domiciliation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `proprio` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courant` smallint(6) NOT NULL DEFAULT 0,
  `clos` smallint(6) NOT NULL DEFAULT 0,
  `rappro` smallint(6) DEFAULT 1,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_accountancy_journal` int(11) DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_allowed` int(11) DEFAULT 0,
  `min_desired` int(11) DEFAULT 0,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ics` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ics_transfer` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_bank_account`
--

INSERT INTO `erp_bank_account` (`rowid`, `datec`, `tms`, `ref`, `label`, `entity`, `fk_user_author`, `fk_user_modif`, `bank`, `code_banque`, `code_guichet`, `number`, `cle_rib`, `bic`, `iban_prefix`, `country_iban`, `cle_iban`, `domiciliation`, `state_id`, `fk_pays`, `proprio`, `owner_address`, `courant`, `clos`, `rappro`, `url`, `account_number`, `fk_accountancy_journal`, `currency_code`, `min_allowed`, `min_desired`, `comment`, `note_public`, `model_pdf`, `import_key`, `extraparams`, `ics`, `ics_transfer`) VALUES
(1, '2021-11-11 06:26:50', '2021-11-11 06:28:11', 'bank1', 'bank1', 1, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', NULL, 29, '', '', 1, 0, 1, NULL, '', NULL, 'SGD', NULL, NULL, '', NULL, NULL, NULL, NULL, '', ''),
(2, '2021-11-11 06:28:23', '2021-11-11 06:28:23', 'cash1', 'cash1', 1, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', NULL, 29, '', '', 2, 0, 1, NULL, '', NULL, 'SGD', NULL, NULL, '', NULL, NULL, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `erp_bank_account_extrafields`
--

CREATE TABLE `erp_bank_account_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_bank_categ`
--

CREATE TABLE `erp_bank_categ` (
  `rowid` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_bank_class`
--

CREATE TABLE `erp_bank_class` (
  `lineid` int(11) NOT NULL,
  `fk_categ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_bank_url`
--

CREATE TABLE `erp_bank_url` (
  `rowid` int(11) NOT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_bank_url`
--

INSERT INTO `erp_bank_url` (`rowid`, `fk_bank`, `url_id`, `url`, `label`, `type`) VALUES
(1, 3, 1, '/user5/erp_crm/compta/paiement/card.php?id=', '(paiement)', 'payment'),
(2, 3, 1, '/user5/erp_crm/comm/card.php?socid=', 'Rose Ltd', 'company'),
(3, 4, 2, '/user5/erp_crm/compta/paiement/card.php?id=', '(paiement)', 'payment'),
(4, 4, 1, '/user5/erp_crm/comm/card.php?socid=', 'Rose Ltd', 'company'),
(5, 5, 3, '/user5/berp3/compta/paiement/card.php?id=', '(paiement)', 'payment'),
(6, 5, 1, '/user5/berp3/comm/card.php?socid=', 'Rose Ltd', 'company'),
(7, 6, 4, '/user5/berp3/compta/paiement/card.php?id=', '(paiement)', 'payment'),
(8, 6, 3, '/user5/berp3/comm/card.php?socid=', 'Nana', 'company'),
(9, 7, 5, '/user5/berp3/compta/paiement/card.php?id=', '(paiement)', 'payment'),
(10, 7, 3, '/user5/berp3/comm/card.php?socid=', 'Nana', 'company');

-- --------------------------------------------------------

--
-- Table structure for table `erp_blockedlog`
--

CREATE TABLE `erp_blockedlog` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `action` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amounts` double(24,8) NOT NULL,
  `element` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `user_fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `ref_object` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_object` datetime DEFAULT NULL,
  `signature` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature_line` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `certified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_blockedlog_authority`
--

CREATE TABLE `erp_blockedlog_authority` (
  `rowid` int(11) NOT NULL,
  `blockchain` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_bom_bom`
--

CREATE TABLE `erp_bom_bom` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bomtype` int(11) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `qty` double(24,8) DEFAULT NULL,
  `efficiency` double(24,8) DEFAULT 1.00000000,
  `duration` double(24,8) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_bom_bom`
--

INSERT INTO `erp_bom_bom` (`rowid`, `entity`, `ref`, `bomtype`, `label`, `fk_product`, `description`, `note_public`, `note_private`, `fk_warehouse`, `qty`, `efficiency`, `duration`, `date_creation`, `date_valid`, `tms`, `fk_user_creat`, `fk_user_modif`, `fk_user_valid`, `import_key`, `model_pdf`, `status`) VALUES
(1, 1, 'BOM2111-0001', 0, 'Finished Goods A', 3, NULL, NULL, NULL, 1, 1.00000000, 1.00000000, NULL, '2021-11-12 09:37:17', '2021-12-12 12:55:41', '2021-12-12 12:55:41', 1, NULL, 1, NULL, NULL, 1),
(2, 1, 'BOM2112-0002', 0, 'Test 1', 1, NULL, NULL, NULL, NULL, 1.00000000, 1.00000000, NULL, '2021-12-08 11:51:04', '2021-12-08 11:52:34', '2021-12-08 11:52:34', 1, 1, 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_bom_bomline`
--

CREATE TABLE `erp_bom_bomline` (
  `rowid` int(11) NOT NULL,
  `fk_bom` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_bom_child` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double(24,8) NOT NULL,
  `qty_frozen` smallint(6) DEFAULT 0,
  `disable_stock_change` smallint(6) DEFAULT 0,
  `efficiency` double(24,8) NOT NULL DEFAULT 1.00000000,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_bom_bomline`
--

INSERT INTO `erp_bom_bomline` (`rowid`, `fk_bom`, `fk_product`, `fk_bom_child`, `description`, `import_key`, `qty`, `qty_frozen`, `disable_stock_change`, `efficiency`, `position`) VALUES
(1, 1, 1, NULL, NULL, NULL, 1.00000000, 0, 0, 1.00000000, 2),
(2, 1, 2, NULL, NULL, NULL, 1.00000000, 0, 0, 1.00000000, 4),
(3, 2, 3, NULL, NULL, NULL, 1.00000000, 0, 0, 1.00000000, 2),
(4, 2, 4, NULL, NULL, NULL, 1.00000000, 0, 0, 1.00000000, 4),
(5, 1, 7, NULL, NULL, NULL, 1.00000000, 0, 0, 1.00000000, 6);

-- --------------------------------------------------------

--
-- Table structure for table `erp_bom_bomline_extrafields`
--

CREATE TABLE `erp_bom_bomline_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_bom_bom_extrafields`
--

CREATE TABLE `erp_bom_bom_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_bookmark`
--

CREATE TABLE `erp_bookmark` (
  `rowid` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `dateb` datetime DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_bordereau_cheque`
--

CREATE TABLE `erp_bordereau_cheque` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime NOT NULL,
  `date_bordereau` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `nbcheque` smallint(6) NOT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_boxes`
--

CREATE TABLE `erp_boxes` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `box_id` int(11) NOT NULL,
  `position` smallint(6) NOT NULL,
  `box_order` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `maxline` int(11) DEFAULT NULL,
  `params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_boxes`
--

INSERT INTO `erp_boxes` (`rowid`, `entity`, `box_id`, `position`, `box_order`, `fk_user`, `maxline`, `params`) VALUES
(1, 1, 1, 0, 'A11', 0, NULL, NULL),
(2, 1, 2, 0, 'A27', 0, NULL, NULL),
(3, 1, 3, 0, 'A31', 0, NULL, NULL),
(6, 1, 10, 0, 'B14', 0, NULL, NULL),
(7, 1, 11, 0, 'A29', 0, NULL, NULL),
(8, 1, 12, 0, 'A13', 0, NULL, NULL),
(9, 1, 13, 0, 'B28', 0, NULL, NULL),
(10, 1, 14, 0, 'B12', 0, NULL, NULL),
(11, 1, 15, 0, 'B16', 0, NULL, NULL),
(12, 1, 16, 0, 'B36', 0, NULL, NULL),
(13, 1, 17, 0, 'B20', 0, NULL, NULL),
(14, 1, 18, 0, 'A35', 0, NULL, NULL),
(15, 1, 19, 0, 'A19', 0, NULL, NULL),
(16, 1, 20, 0, 'B34', 0, NULL, NULL),
(17, 1, 21, 0, 'B18', 0, NULL, NULL),
(18, 1, 22, 0, 'A33', 0, NULL, NULL),
(19, 1, 23, 0, 'A17', 0, NULL, NULL),
(20, 1, 24, 0, 'B32', 0, NULL, NULL),
(21, 1, 25, 0, 'B26', 0, NULL, NULL),
(22, 1, 26, 0, 'B10', 0, NULL, NULL),
(23, 1, 27, 0, 'A07', 0, NULL, NULL),
(24, 1, 28, 0, 'A23', 0, NULL, NULL),
(25, 1, 29, 0, 'B06', 0, NULL, NULL),
(26, 1, 30, 0, 'B22', 0, NULL, NULL),
(27, 1, 31, 0, 'A05', 0, NULL, NULL),
(28, 1, 32, 0, 'A21', 0, NULL, NULL),
(29, 1, 33, 0, 'B04', 0, NULL, NULL),
(31, 1, 37, 0, 'B24', 0, NULL, NULL),
(32, 1, 38, 0, 'B08', 0, NULL, NULL),
(33, 1, 38, 1, 'A37', 0, NULL, NULL),
(34, 1, 38, 2, 'B38', 0, NULL, NULL),
(35, 1, 38, 3, 'A39', 0, NULL, NULL),
(36, 1, 38, 11, 'B40', 0, NULL, NULL),
(37, 1, 38, 27, 'A41', 0, NULL, NULL),
(38, 1, 39, 0, 'A25', 0, NULL, NULL),
(39, 1, 40, 0, 'A09', 0, NULL, NULL),
(49, 1, 56, 0, 'B02', 0, NULL, NULL),
(50, 1, 57, 0, 'A01', 0, NULL, NULL),
(251, 1, 31, 0, 'A01', 1, NULL, NULL),
(252, 1, 27, 0, 'A02', 1, NULL, NULL),
(253, 1, 40, 0, 'A03', 1, NULL, NULL),
(254, 1, 1, 0, 'A04', 1, NULL, NULL),
(255, 1, 12, 0, 'A05', 1, NULL, NULL),
(257, 1, 23, 0, 'A07', 1, NULL, NULL),
(258, 1, 19, 0, 'A08', 1, NULL, NULL),
(259, 1, 32, 0, 'A09', 1, NULL, NULL),
(260, 1, 28, 0, 'A10', 1, NULL, NULL),
(261, 1, 39, 0, 'A11', 1, NULL, NULL),
(262, 1, 2, 0, 'A12', 1, NULL, NULL),
(263, 1, 11, 0, 'A13', 1, NULL, NULL),
(264, 1, 3, 0, 'A14', 1, NULL, NULL),
(265, 1, 18, 0, 'A15', 1, NULL, NULL),
(266, 1, 56, 0, 'B01', 1, NULL, NULL),
(267, 1, 33, 0, 'B02', 1, NULL, NULL),
(268, 1, 29, 0, 'B03', 1, NULL, NULL),
(269, 1, 38, 0, 'B04', 1, NULL, NULL),
(270, 1, 26, 0, 'B05', 1, NULL, NULL),
(271, 1, 14, 0, 'B06', 1, NULL, NULL),
(272, 1, 10, 0, 'B07', 1, NULL, NULL),
(273, 1, 21, 0, 'B08', 1, NULL, NULL),
(274, 1, 17, 0, 'B09', 1, NULL, NULL),
(275, 1, 30, 0, 'B10', 1, NULL, NULL),
(276, 1, 37, 0, 'B11', 1, NULL, NULL),
(277, 1, 25, 0, 'B12', 1, NULL, NULL),
(278, 1, 13, 0, 'B13', 1, NULL, NULL),
(280, 1, 24, 0, 'B15', 1, NULL, NULL),
(281, 1, 20, 0, 'B16', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_boxes_def`
--

CREATE TABLE `erp_boxes_def` (
  `rowid` int(11) NOT NULL,
  `file` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_boxes_def`
--

INSERT INTO `erp_boxes_def` (`rowid`, `file`, `entity`, `tms`, `note`) VALUES
(1, 'box_lastlogin.php', 1, '2021-11-09 04:37:28', NULL),
(2, 'box_birthdays.php', 1, '2021-11-09 04:37:28', NULL),
(3, 'box_berp3_state_board', 1, '2021-12-09 08:00:46', NULL),
(10, 'box_commandes.php', 1, '2021-11-09 04:39:16', NULL),
(11, 'box_graph_orders_permonth.php', 1, '2021-11-09 04:39:16', NULL),
(12, 'box_clients.php', 1, '2021-11-09 04:39:16', NULL),
(13, 'box_prospect.php', 1, '2021-11-09 04:39:16', NULL),
(14, 'box_contacts.php', 1, '2021-11-09 04:39:16', NULL),
(15, 'box_activity.php', 1, '2021-11-09 04:39:16', '(WarningUsingThisBoxSlowDown)'),
(16, 'box_goodcustomers.php', 1, '2021-11-09 04:39:16', '(WarningUsingThisBoxSlowDown)'),
(17, 'box_ficheinter.php', 1, '2021-11-09 04:39:22', NULL),
(18, 'box_graph_propales_permonth.php', 1, '2021-11-09 04:39:28', NULL),
(19, 'box_propales.php', 1, '2021-11-09 04:39:28', NULL),
(20, 'box_shipments.php', 1, '2021-11-09 04:39:31', NULL),
(21, 'box_contracts.php', 1, '2021-11-09 04:39:34', NULL),
(22, 'box_services_expired.php', 1, '2021-11-09 04:39:34', NULL),
(23, 'box_graph_invoices_supplier_permonth.php', 1, '2021-11-09 04:39:39', NULL),
(24, 'box_graph_orders_supplier_permonth.php', 1, '2021-11-09 04:39:39', NULL),
(25, 'box_fournisseurs.php', 1, '2021-11-09 04:39:39', NULL),
(26, 'box_factures_fourn_imp.php', 1, '2021-11-09 04:39:39', NULL),
(27, 'box_factures_fourn.php', 1, '2021-11-09 04:39:39', NULL),
(28, 'box_supplier_orders.php', 1, '2021-11-09 04:39:39', NULL),
(29, 'box_supplier_orders_awaiting_reception.php', 1, '2021-11-09 04:39:39', NULL),
(30, 'box_factures_imp.php', 1, '2021-11-09 04:39:50', NULL),
(31, 'box_factures.php', 1, '2021-11-09 04:39:50', NULL),
(32, 'box_graph_invoices_permonth.php', 1, '2021-11-09 04:39:50', NULL),
(33, 'box_customers_outstanding_bill_reached.php', 1, '2021-11-09 04:39:50', NULL),
(37, 'box_produits.php', 1, '2021-11-09 04:40:29', NULL),
(38, 'box_produits_alerte_stock.php', 1, '2021-11-09 04:40:29', NULL),
(39, 'box_graph_product_distribution.php', 1, '2021-11-09 04:40:29', NULL),
(40, 'box_services_contracts.php', 1, '2021-11-09 04:40:35', NULL),
(56, 'box_comptes.php', 1, '2021-11-11 06:24:53', NULL),
(57, 'box_boms.php', 1, '2021-11-12 09:30:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_budget`
--

CREATE TABLE `erp_budget` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_budget_lines`
--

CREATE TABLE `erp_budget_lines` (
  `rowid` int(11) NOT NULL,
  `fk_budget` int(11) NOT NULL,
  `fk_project_ids` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(24,8) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie`
--

CREATE TABLE `erp_categorie` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `label` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_categorie`
--

INSERT INTO `erp_categorie` (`rowid`, `entity`, `fk_parent`, `label`, `ref_ext`, `type`, `description`, `color`, `fk_soc`, `visible`, `date_creation`, `tms`, `fk_user_creat`, `fk_user_modif`, `import_key`) VALUES
(1, 1, 0, '1', NULL, 9, 'Cat1', '', NULL, 0, '2021-11-11 04:56:19', '2021-11-11 04:56:19', 1, NULL, NULL),
(2, 1, 0, 'c1', NULL, 0, 'cat1', '', NULL, 0, '2021-11-11 04:57:12', '2021-11-11 04:57:12', 1, NULL, NULL),
(3, 1, 0, '44444', NULL, 1, '44444', '', NULL, 0, '2021-12-22 04:09:39', '2021-12-22 03:09:39', 1, NULL, NULL),
(4, 1, 0, '88888', NULL, 4, '', '', NULL, 0, '2021-12-22 04:14:40', '2021-12-22 03:14:40', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_categories_extrafields`
--

CREATE TABLE `erp_categories_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_account`
--

CREATE TABLE `erp_categorie_account` (
  `fk_categorie` int(11) NOT NULL,
  `fk_account` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_actioncomm`
--

CREATE TABLE `erp_categorie_actioncomm` (
  `fk_categorie` int(11) NOT NULL,
  `fk_actioncomm` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_contact`
--

CREATE TABLE `erp_categorie_contact` (
  `fk_categorie` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_fournisseur`
--

CREATE TABLE `erp_categorie_fournisseur` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_knowledgemanagement`
--

CREATE TABLE `erp_categorie_knowledgemanagement` (
  `fk_categorie` int(11) NOT NULL,
  `fk_knowledgemanagement` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_lang`
--

CREATE TABLE `erp_categorie_lang` (
  `rowid` int(11) NOT NULL,
  `fk_category` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_member`
--

CREATE TABLE `erp_categorie_member` (
  `fk_categorie` int(11) NOT NULL,
  `fk_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_product`
--

CREATE TABLE `erp_categorie_product` (
  `fk_categorie` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_categorie_product`
--

INSERT INTO `erp_categorie_product` (`fk_categorie`, `fk_product`, `import_key`) VALUES
(2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_project`
--

CREATE TABLE `erp_categorie_project` (
  `fk_categorie` int(11) NOT NULL,
  `fk_project` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_societe`
--

CREATE TABLE `erp_categorie_societe` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_ticket`
--

CREATE TABLE `erp_categorie_ticket` (
  `fk_categorie` int(11) NOT NULL,
  `fk_ticket` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_user`
--

CREATE TABLE `erp_categorie_user` (
  `fk_categorie` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_warehouse`
--

CREATE TABLE `erp_categorie_warehouse` (
  `fk_categorie` int(11) NOT NULL,
  `fk_warehouse` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_categorie_website_page`
--

CREATE TABLE `erp_categorie_website_page` (
  `fk_categorie` int(11) NOT NULL,
  `fk_website_page` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_chargesociales`
--

CREATE TABLE `erp_chargesociales` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_ech` datetime NOT NULL,
  `libelle` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `periode` date DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_commande`
--

CREATE TABLE `erp_commande` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `source` smallint(6) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `amount_ht` double(24,8) DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facture` tinyint(4) DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_commande`
--

INSERT INTO `erp_commande` (`rowid`, `ref`, `entity`, `ref_ext`, `ref_int`, `ref_client`, `fk_soc`, `fk_projet`, `tms`, `date_creation`, `date_valid`, `date_cloture`, `date_commande`, `fk_user_author`, `fk_user_modif`, `fk_user_valid`, `fk_user_cloture`, `source`, `fk_statut`, `amount_ht`, `remise_percent`, `remise_absolue`, `remise`, `total_tva`, `localtax1`, `localtax2`, `total_ht`, `total_ttc`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `module_source`, `pos_source`, `facture`, `fk_account`, `fk_currency`, `fk_cond_reglement`, `fk_mode_reglement`, `date_livraison`, `fk_shipping_method`, `fk_warehouse`, `fk_availability`, `fk_input_reason`, `fk_delivery_address`, `fk_incoterms`, `location_incoterms`, `import_key`, `extraparams`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES
(1, 'CO2111-0001', 1, NULL, NULL, NULL, 1, NULL, '2021-11-12 07:35:10', '2021-11-09 09:59:02', '2021-11-12 07:35:10', NULL, '2021-11-09', 1, NULL, 1, NULL, NULL, 1, 0.00000000, 0, NULL, 0, 0.00000000, 0.00000000, 0.00000000, 26.90000000, 26.90000000, '', '', 'einstein', 'commande/CO2111-0001/CO2111-0001.pdf', NULL, NULL, 0, NULL, NULL, 2, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 26.90000000, 0.00000000, 26.90000000),
(2, '(PROV2)', 1, NULL, NULL, NULL, 1, NULL, '2021-11-11 04:44:33', '2021-11-11 04:42:02', NULL, NULL, '2021-11-11', 1, NULL, NULL, NULL, NULL, 0, 0.00000000, 0, NULL, 0, 1.88000000, 0.00000000, 0.00000000, 26.90000000, 28.78000000, '', '', 'einstein', 'commande/(PROV2)/(PROV2).pdf', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 1, 'EUR', 1.00000000, 26.90000000, 1.88000000, 28.78000000),
(3, '(PROV3)', 1, NULL, NULL, NULL, 1, NULL, '2021-11-11 04:47:29', '2021-11-11 04:47:17', NULL, NULL, '2021-11-11', 1, NULL, NULL, NULL, NULL, 0, 0.00000000, 0, NULL, 0, 1.88000000, 0.00000000, 0.00000000, 26.90000000, 28.78000000, '', '', 'einstein', 'commande/(PROV3)/(PROV3).pdf', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 26.90000000, 1.88000000, 28.78000000),
(4, 'CO2111-0002', 1, NULL, NULL, '1234', 1, NULL, '2021-11-12 07:30:18', '2021-11-12 07:22:49', '2021-11-12 07:27:06', NULL, '2021-11-12', 1, NULL, 1, NULL, NULL, 1, 0.00000000, 0, NULL, 0, 21.00000000, 0.00000000, 0.00000000, 300.00000000, 321.00000000, '', '', 'einstein', 'commande/CO2111-0002/CO2111-0002.pdf', NULL, NULL, 0, NULL, NULL, 2, 2, NULL, 5, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 300.00000000, 21.00000000, 321.00000000),
(5, 'CO2111-0003', 1, NULL, NULL, NULL, 1, NULL, '2021-11-12 09:23:09', '2021-11-12 09:20:13', '2021-11-12 09:23:09', NULL, '2021-11-12', 1, NULL, 1, NULL, NULL, 1, 0.00000000, 0, NULL, 0, 70.00000000, 0.00000000, 0.00000000, 1000.00000000, 1070.00000000, '', '', 'einstein', 'commande/CO2111-0003/CO2111-0003.pdf', NULL, NULL, 0, NULL, NULL, 2, NULL, '2021-11-16 00:00:00', 5, NULL, NULL, 8, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 1000.00000000, 70.00000000, 1070.00000000),
(6, 'CO2111-0004', 1, NULL, NULL, NULL, 1, NULL, '2021-11-12 09:45:08', '2021-11-12 09:44:55', '2021-11-12 09:45:08', NULL, '2021-11-12', 1, NULL, 1, NULL, NULL, 1, 0.00000000, 0, NULL, 0, 70.00000000, 0.00000000, 0.00000000, 1000.00000000, 1070.00000000, '', '', 'einstein', 'commande/CO2111-0004/CO2111-0004.pdf', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '200021', NULL, NULL, 0, 'SGD', 1.00000000, 1000.00000000, 70.00000000, 1070.00000000),
(7, '(PROV7)', 1, NULL, NULL, NULL, 3, NULL, '2021-11-22 08:39:09', '2021-11-22 08:39:09', NULL, NULL, '2021-11-22', 1, NULL, NULL, NULL, NULL, 0, 0.00000000, 0, NULL, 0, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '', '', 'einstein', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 0.00000000, 0.00000000, 0.00000000),
(8, '(PROV8)', 1, NULL, NULL, NULL, 3, NULL, '2021-11-22 08:40:33', '2021-11-22 08:40:33', NULL, NULL, '2021-11-22', 1, NULL, NULL, NULL, NULL, 0, 0.00000000, 0, NULL, 0, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '', '', 'einstein', NULL, NULL, NULL, 0, NULL, NULL, 1, 4, '2021-11-30 00:00:00', 1, NULL, 2, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 0.00000000, 0.00000000, 0.00000000),
(9, 'CO2112-0005', 1, NULL, NULL, NULL, 3, NULL, '2021-12-17 09:13:31', '2021-12-17 09:10:04', '2021-12-17 09:13:31', NULL, '2021-12-17', 1, NULL, 1, NULL, NULL, 1, 0.00000000, 0, NULL, 0, 7.00000000, 0.00000000, 0.00000000, 100.00000000, 107.00000000, '', '', 'einstein', 'commande/CO2112-0005/CO2112-0005.pdf', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 100.00000000, 7.00000000, 107.00000000),
(10, 'CO2112-0009', 1, NULL, NULL, NULL, 3, NULL, '2021-12-19 13:45:51', '2021-12-17 09:14:54', '2021-12-19 13:39:06', '2021-12-19 13:45:51', '2021-12-17', 1, NULL, 1, 1, NULL, 3, 0.00000000, 0, NULL, 0, 7.70000000, 0.00000000, 0.00000000, 110.00000000, 117.70000000, '', '', 'einstein', 'commande/CO2112-0009/CO2112-0009.pdf', NULL, NULL, 1, NULL, NULL, 2, NULL, '2021-12-17 00:00:00', NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 110.00000000, 7.70000000, 117.70000000),
(11, 'CO2112-0006', 1, NULL, NULL, NULL, 4, NULL, '2021-12-17 09:18:42', '2021-12-17 09:18:30', '2021-12-17 09:18:42', NULL, '2021-12-17', 1, NULL, 1, NULL, NULL, 1, 0.00000000, 0, NULL, 0, 7.00000000, 0.00000000, 0.00000000, 100.00000000, 107.00000000, '', '', 'einstein', 'commande/CO2112-0006/CO2112-0006.pdf', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 100.00000000, 7.00000000, 107.00000000),
(12, 'CO2112-0007', 1, NULL, NULL, NULL, 3, NULL, '2021-12-17 09:42:05', '2021-12-17 09:38:30', '2021-12-17 09:41:00', '2021-12-17 09:42:05', '2021-12-17', 1, NULL, 1, 1, NULL, 3, 0.00000000, 0, NULL, 0, 7.00000000, 0.00000000, 0.00000000, 100.00000000, 107.00000000, '', '', 'einstein', 'commande/CO2112-0007/CO2112-0007.pdf', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 100.00000000, 7.00000000, 107.00000000),
(13, 'CO2112-0008', 1, NULL, NULL, NULL, 3, NULL, '2021-12-17 09:49:59', '2021-12-17 09:43:42', '2021-12-17 09:43:55', '2021-12-17 09:49:59', '2021-12-17', 1, NULL, 1, 1, NULL, 3, 0.00000000, 0, NULL, 0, 14.00000000, 0.00000000, 0.00000000, 200.00000000, 214.00000000, '', '', 'einstein', 'commande/CO2112-0008/CO2112-0008.pdf', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 200.00000000, 14.00000000, 214.00000000),
(14, 'CO2112-0010', 1, NULL, NULL, NULL, 6, NULL, '2021-12-19 13:49:55', '2021-12-19 13:43:06', '2021-12-19 13:45:28', NULL, '2021-12-19', 1, NULL, 1, NULL, NULL, 2, 0.00000000, 0, NULL, 0, 1.88000000, 0.00000000, 0.00000000, 26.90000000, 28.78000000, '', '', 'einstein', 'commande/CO2112-0010/CO2112-0010.pdf', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 26.90000000, 1.88000000, 28.78000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_commandedet`
--

CREATE TABLE `erp_commandedet` (
  `rowid` int(11) NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_commandedet`
--

INSERT INTO `erp_commandedet` (`rowid`, `fk_commande`, `fk_parent_line`, `fk_product`, `label`, `description`, `vat_src_code`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `qty`, `remise_percent`, `remise`, `fk_remise_except`, `price`, `subprice`, `total_ht`, `total_tva`, `total_localtax1`, `total_localtax2`, `total_ttc`, `product_type`, `date_start`, `date_end`, `info_bits`, `buy_price_ht`, `fk_product_fournisseur_price`, `special_code`, `rang`, `fk_unit`, `import_key`, `ref_ext`, `fk_commandefourndet`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_subprice`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES
(1, 1, NULL, 1, NULL, 'Product A', '', 0.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.9, 26.90000000, 26.90000000, 0.00000000, 0.00000000, 0.00000000, 26.90000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 26.90000000, 26.90000000, 0.00000000, 26.90000000),
(2, 2, NULL, 1, NULL, 'Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.9, 26.90000000, 26.90000000, 1.88000000, 0.00000000, 0.00000000, 28.78000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, '', NULL, 1, 'EUR', 26.90000000, 26.90000000, 1.88000000, 28.78000000),
(3, 3, NULL, 1, NULL, 'Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.9, 26.90000000, 26.90000000, 1.88000000, 0.00000000, 0.00000000, 28.78000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 26.90000000, 26.90000000, 1.88000000, 28.78000000),
(4, 4, NULL, 2, NULL, 'This is a test product\n(Country of origin: Singapore)', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 100, 100.00000000, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000),
(5, 4, NULL, NULL, NULL, 'Supply and Install', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 200, 200.00000000, 200.00000000, 14.00000000, 0.00000000, 0.00000000, 214.00000000, 1, NULL, NULL, 0, 0.00000000, NULL, 0, 2, NULL, NULL, '', NULL, NULL, 'SGD', 200.00000000, 200.00000000, 14.00000000, 214.00000000),
(6, 5, NULL, 4, NULL, 'This is a test product 2', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 1000, 1000.00000000, 1000.00000000, 70.00000000, 0.00000000, 0.00000000, 1070.00000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 1000.00000000, 1000.00000000, 70.00000000, 1070.00000000),
(7, 5, NULL, NULL, NULL, 'Supply and Install sample', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 0, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 1, NULL, NULL, 0, 0.00000000, NULL, 0, 2, NULL, NULL, '', NULL, NULL, 'SGD', 0.00000000, 0.00000000, 0.00000000, 0.00000000),
(8, 6, NULL, 4, NULL, 'This is a test product 2', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 1000, 1000.00000000, 1000.00000000, 70.00000000, 0.00000000, 0.00000000, 1070.00000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 1000.00000000, 1000.00000000, 70.00000000, 1070.00000000),
(9, 9, NULL, 2, NULL, 'This is a test product\n(Country of origin: Singapore)', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 100, 100.00000000, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000),
(10, 10, NULL, 5, NULL, '', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 10, 10.00000000, 10.00000000, 0.70000000, 0.00000000, 0.00000000, 10.70000000, 0, NULL, NULL, 0, 5.00000000, NULL, 0, 2, NULL, NULL, '', NULL, NULL, 'SGD', 10.00000000, 10.00000000, 0.70000000, 10.70000000),
(11, 11, NULL, 2, NULL, 'This is a test product\n(Country of origin: Singapore)', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 100, 100.00000000, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000),
(12, 12, NULL, 2, NULL, 'This is a test product\n(Country of origin: Singapore)', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 100, 100.00000000, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000),
(13, 13, NULL, 3, NULL, '', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 200, 200.00000000, 200.00000000, 14.00000000, 0.00000000, 0.00000000, 214.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 200.00000000, 200.00000000, 14.00000000, 214.00000000),
(14, 10, NULL, 2, NULL, 'This is a test product\n(Country of origin: Singapore)', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 100, 100.00000000, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000),
(16, 14, NULL, 1, NULL, 'Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.9, 26.90000000, 26.90000000, 1.88000000, 0.00000000, 0.00000000, 28.78000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, '', NULL, NULL, 'SGD', 26.90000000, 26.90000000, 1.88000000, 28.78000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_commandedet_extrafields`
--

CREATE TABLE `erp_commandedet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_commande_extrafields`
--

CREATE TABLE `erp_commande_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_commande_fournisseur`
--

CREATE TABLE `erp_commande_fournisseur` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_approve2` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_approve2` int(11) DEFAULT NULL,
  `source` smallint(6) NOT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `amount_ht` double(24,8) DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `fk_input_method` int(11) DEFAULT 0,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_commande_fournisseur`
--

INSERT INTO `erp_commande_fournisseur` (`rowid`, `ref`, `entity`, `ref_ext`, `ref_supplier`, `fk_soc`, `fk_projet`, `tms`, `date_creation`, `date_valid`, `date_approve`, `date_approve2`, `date_commande`, `fk_user_author`, `fk_user_modif`, `fk_user_valid`, `fk_user_approve`, `fk_user_approve2`, `source`, `fk_statut`, `billed`, `amount_ht`, `remise_percent`, `remise`, `total_tva`, `localtax1`, `localtax2`, `total_ht`, `total_ttc`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `date_livraison`, `fk_account`, `fk_cond_reglement`, `fk_mode_reglement`, `fk_input_method`, `fk_incoterms`, `location_incoterms`, `import_key`, `extraparams`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES
(1, 'PO2111-0001', 1, NULL, '', 2, NULL, '2021-11-12 09:43:43', '2021-11-12 09:42:09', '2021-11-12 09:42:29', '2021-11-12 09:42:29', NULL, '2021-11-12', 1, NULL, 1, 1, NULL, 0, 5, 0, 0.00000000, 0, 0, 7.00000000, 0.00000000, 0.00000000, 100.00000000, 107.00000000, '', '', 'muscadet', 'fournisseur/commande/PO2111-0001/PO2111-0001.pdf', NULL, NULL, 1, 4, 1, 5, '10001', NULL, NULL, 0, 'SGD', 1.00000000, 100.00000000, 7.00000000, 107.00000000),
(2, '(PROV2)', 1, NULL, '', 2, NULL, '2021-11-22 08:27:01', '2021-11-22 08:27:01', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 42, 0, 0, 0.00000000, 0, 0, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '', '', 'muscadet', NULL, NULL, NULL, NULL, NULL, 0, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 0.00000000, 0.00000000, 0.00000000),
(3, 'PO2111-0002', 1, NULL, '', 2, NULL, '2021-11-22 08:41:48', '2021-11-22 08:41:13', '2021-11-22 08:41:48', '2021-11-22 08:41:48', NULL, NULL, 1, NULL, 1, 1, NULL, 0, 2, 0, 0.00000000, 0, 0, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '', '', 'muscadet', 'fournisseur/commande/PO2111-0002/PO2111-0002.pdf', '2021-11-22 00:00:00', NULL, 1, 4, 0, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 0.00000000, 0.00000000, 0.00000000),
(4, '(PROV4)', 1, NULL, '', 5, NULL, '2021-12-10 14:54:40', '2021-12-10 14:51:35', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0.00000000, 0, 0, 7.00000000, 0.00000000, 0.00000000, 200.00000000, 207.00000000, '', '', 'muscadet', 'fournisseur/commande/(PROV4)/(PROV4).pdf', NULL, NULL, 1, NULL, 0, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 200.00000000, 7.00000000, 207.00000000),
(5, '(PROV5)', 1, NULL, '', 5, NULL, '2021-12-12 12:39:59', '2021-12-12 12:39:50', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0.00000000, 0, 0, 0.00000000, 0.00000000, 0.00000000, 10.00000000, 10.00000000, '', '', 'muscadet', 'fournisseur/commande/(PROV5)/(PROV5).pdf', NULL, NULL, 1, NULL, 0, 0, '', NULL, NULL, 0, 'SGD', 1.00000000, 10.00000000, 0.00000000, 10.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_commande_fournisseurdet`
--

CREATE TABLE `erp_commande_fournisseurdet` (
  `rowid` int(11) NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_commande_fournisseurdet`
--

INSERT INTO `erp_commande_fournisseurdet` (`rowid`, `fk_commande`, `fk_parent_line`, `fk_product`, `ref`, `label`, `description`, `vat_src_code`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `qty`, `remise_percent`, `remise`, `subprice`, `total_ht`, `total_tva`, `total_localtax1`, `total_localtax2`, `total_ttc`, `product_type`, `date_start`, `date_end`, `info_bits`, `special_code`, `rang`, `import_key`, `fk_unit`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_subprice`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES
(1, 1, NULL, 2, 'XYZ123', '', 'This is a test product', '', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, 100.00000000, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 0, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000),
(2, 2, NULL, 5, 'Test123', '', '', '', 15.0000, 0.0000, '0', 0.0000, '0', 20, 0, 0, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, 'SGD', 0.00000000, 0.00000000, 0.00000000, 0.00000000),
(3, 3, NULL, 5, 'Test123', '', '', '', 15.0000, 0.0000, '0', 0.0000, '0', 20, 0, 0, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, 'SGD', 0.00000000, 0.00000000, 0.00000000, 0.00000000),
(4, 4, NULL, 5, '', '', '', '', 0.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, 100.00000000, 100.00000000, 0.00000000, 0.00000000, 0.00000000, 100.00000000, 0, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, 'SGD', 100.00000000, 100.00000000, 0.00000000, 100.00000000),
(6, 4, NULL, NULL, '', '', 'test', '7', 7.0000, 0.0000, '', 0.0000, '', 1, 0, 0, 100.00000000, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 1, NULL, NULL, 0, 0, 2, NULL, NULL, NULL, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000),
(7, 5, NULL, 7, 'ABC001', '', '', '', 0.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, 10.00000000, 10.00000000, 0.00000000, 0.00000000, 0.00000000, 10.00000000, 0, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, 'SGD', 10.00000000, 10.00000000, 0.00000000, 10.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_commande_fournisseurdet_extrafields`
--

CREATE TABLE `erp_commande_fournisseurdet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_commande_fournisseur_dispatch`
--

CREATE TABLE `erp_commande_fournisseur_dispatch` (
  `rowid` int(11) NOT NULL,
  `fk_commande` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_reception` int(11) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cost_price` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_commande_fournisseur_dispatch`
--

INSERT INTO `erp_commande_fournisseur_dispatch` (`rowid`, `fk_commande`, `fk_product`, `fk_commandefourndet`, `fk_projet`, `fk_reception`, `qty`, `fk_entrepot`, `fk_user`, `comment`, `batch`, `eatby`, `sellby`, `status`, `datec`, `tms`, `cost_price`) VALUES
(1, 1, 2, 1, NULL, NULL, 1, 1, 1, 'Receiving purchase order PO2111-0001', NULL, NULL, NULL, 1, '2021-11-12 09:43:43', '2021-11-12 09:43:43', 0.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_commande_fournisseur_dispatch_extrafields`
--

CREATE TABLE `erp_commande_fournisseur_dispatch_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_commande_fournisseur_extrafields`
--

CREATE TABLE `erp_commande_fournisseur_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_commande_fournisseur_log`
--

CREATE TABLE `erp_commande_fournisseur_log` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datelog` datetime NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_statut` smallint(6) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_comment`
--

CREATE TABLE `erp_comment` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `element_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `import_key` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_const`
--

CREATE TABLE `erp_const` (
  `rowid` int(11) NOT NULL,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT 'string',
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_const`
--

INSERT INTO `erp_const` (`rowid`, `name`, `entity`, `value`, `type`, `visible`, `note`, `tms`) VALUES
(2, 'MAIN_FEATURES_LEVEL', 0, '0', 'chaine', 1, 'Level of features to show: -1=stable+deprecated, 0=stable only (default), 1=stable+experimental, 2=stable+experimental+development', '2021-11-09 04:36:56'),
(3, 'MAILING_LIMIT_SENDBYWEB', 0, '25', 'chaine', 1, 'Number of targets to defined packet size when sending mass email', '2021-11-09 04:36:56'),
(4, 'MAIN_ENABLE_LOG_TO_HTML', 0, '0', 'chaine', 1, 'If this option is set to 1, it is possible to see log output at end of HTML sources by adding paramater logtohtml=1 on URL. Module log must also be enabled.', '2021-11-09 04:36:56'),
(5, 'MAIN_SECURITY_CSRF_WITH_TOKEN', 0, '0', 'chaine', 1, 'If this option is set to 1, a CSRF protection using an antiCSRF token is added.', '2021-11-09 04:36:56'),
(6, 'SYSLOG_HANDLERS', 0, '[\"mod_syslog_file\"]', 'chaine', 0, 'Which logger to use', '2021-11-09 04:36:56'),
(7, 'SYSLOG_FILE', 0, 'DOL_DATA_ROOT/dolibarr.log', 'chaine', 0, 'Directory where to write log file', '2021-11-09 04:36:56'),
(8, 'SYSLOG_LEVEL', 0, '7', 'chaine', 0, 'Level of debug info to show', '2021-11-09 04:36:56'),
(9, 'MAIN_UPLOAD_DOC', 0, '2048', 'chaine', 0, 'Max size for file upload (0 means no upload allowed)', '2021-11-09 04:36:56'),
(11, 'MAIN_ENABLE_DEFAULT_VALUES', 1, '1', 'chaine', 0, 'Enable default value overwrite', '2021-11-09 04:36:56'),
(13, 'MAIN_MAIL_SMTP_SERVER', 1, '', 'chaine', 0, 'Host or ip address for SMTP server', '2021-11-09 04:36:56'),
(14, 'MAIN_MAIL_SMTP_PORT', 1, '', 'chaine', 0, 'Port for SMTP server', '2021-11-09 04:36:56'),
(15, 'MAIN_MAIL_EMAIL_FROM', 1, 'robot@domain.com', 'chaine', 0, 'email emitter for Dolibarr automatic emails', '2021-11-09 04:36:56'),
(16, 'MAIN_SIZE_LISTE_LIMIT', 0, '20', 'chaine', 0, 'Maximum length of lists', '2021-11-09 04:36:56'),
(17, 'MAIN_SIZE_SHORTLIST_LIMIT', 0, '3', 'chaine', 0, 'Maximum length of short lists', '2021-11-09 04:36:56'),
(18, 'MAIN_MENU_STANDARD', 0, 'eldy_menu.php', 'chaine', 0, 'Menu manager for internal users', '2021-11-09 04:36:56'),
(19, 'MAIN_MENUFRONT_STANDARD', 0, 'eldy_menu.php', 'chaine', 0, 'Menu manager for external users', '2021-11-09 04:36:56'),
(20, 'MAIN_MENU_SMARTPHONE', 0, 'eldy_menu.php', 'chaine', 0, 'Menu manager for internal users using smartphones', '2021-11-09 04:36:56'),
(21, 'MAIN_MENUFRONT_SMARTPHONE', 0, 'eldy_menu.php', 'chaine', 0, 'Menu manager for external users using smartphones', '2021-11-09 04:36:56'),
(22, 'MAIN_DELAY_ACTIONS_TODO', 1, '7', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur actions planifiĂ©es non rĂ©alisĂ©es', '2021-11-09 04:36:56'),
(23, 'MAIN_DELAY_ORDERS_TO_PROCESS', 1, '2', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur commandes clients non traitĂ©es', '2021-11-09 04:36:56'),
(24, 'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS', 1, '7', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur commandes fournisseurs non traitĂ©es', '2021-11-09 04:36:56'),
(25, 'MAIN_DELAY_PROPALS_TO_CLOSE', 1, '31', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur propales Ă  cloturer', '2021-11-09 04:36:56'),
(26, 'MAIN_DELAY_PROPALS_TO_BILL', 1, '7', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur propales non facturĂ©es', '2021-11-09 04:36:56'),
(27, 'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED', 1, '31', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur factures client impayĂ©es', '2021-11-09 04:36:56'),
(28, 'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY', 1, '2', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur factures fournisseur impayĂ©es', '2021-11-09 04:36:56'),
(29, 'MAIN_DELAY_NOT_ACTIVATED_SERVICES', 1, '0', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur services Ă  activer', '2021-11-09 04:36:56'),
(30, 'MAIN_DELAY_RUNNING_SERVICES', 1, '0', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur services expirĂ©s', '2021-11-09 04:36:56'),
(31, 'MAIN_DELAY_MEMBERS', 1, '31', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur cotisations adhĂ©rent en retard', '2021-11-09 04:36:56'),
(32, 'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE', 1, '62', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur rapprochements bancaires Ă  faire', '2021-11-09 04:36:56'),
(33, 'MAIN_DELAY_EXPENSEREPORTS_TO_PAY', 1, '31', 'chaine', 0, 'TolĂ©rance de retard avant alerte (en jours) sur les notes de frais impayĂ©es', '2021-11-09 04:36:56'),
(34, 'MAILING_EMAIL_FROM', 1, 'no-reply@mydomain.com', 'chaine', 0, 'EMail emmetteur pour les envois d emailings', '2021-11-09 04:36:56'),
(35, 'PRODUCT_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/products', 'chaine', 0, NULL, '2021-11-09 04:36:56'),
(36, 'CONTRACT_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/contracts', 'chaine', 0, NULL, '2021-11-09 04:36:56'),
(37, 'USERGROUP_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/usergroups', 'chaine', 0, NULL, '2021-11-09 04:36:56'),
(38, 'USER_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/users', 'chaine', 0, NULL, '2021-11-09 04:36:56'),
(39, 'PRODUCT_PRICE_BASE_TYPE', 0, 'HT', 'string', 0, NULL, '2021-11-09 04:36:56'),
(40, 'ADHERENT_LOGIN_NOT_REQUIRED', 0, '1', 'string', 0, NULL, '2021-11-09 04:36:56'),
(41, 'MAIN_MODULE_USER', 0, '1', 'string', 0, '{\"authorid\":0,\"ip\":\"171.239.155.99\"}', '2021-11-09 04:37:28'),
(42, 'DATABASE_PWD_ENCRYPTED', 1, '1', 'chaine', 0, '', '2021-11-09 04:37:28'),
(43, 'MAIN_SECURITY_SALT', 0, '20211109043728', 'chaine', 0, '', '2021-11-09 04:37:28'),
(44, 'MAIN_SECURITY_HASH_ALGO', 0, 'password_hash', 'chaine', 0, '', '2021-11-09 04:37:28'),
(45, 'MAIN_VERSION_FIRST_INSTALL', 0, '15.0.0-alpha', 'chaine', 0, 'Dolibarr version when first install', '2021-11-09 04:37:28'),
(46, 'MAIN_VERSION_LAST_INSTALL', 0, '15.0.0-alpha', 'chaine', 0, 'Dolibarr version when last install', '2021-11-09 04:37:28'),
(60, 'HOLIDAY_ADDON', 1, 'mod_holiday_madonna', 'chaine', 0, 'Nom du gestionnaire de numerotation des congĂ©s', '2021-11-09 04:38:58'),
(61, 'HOLIDAY_ADDON_PDF', 1, 'celebrate', 'chaine', 0, 'Name of PDF model of holiday', '2021-11-09 04:38:58'),
(62, 'HOLIDAY_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/holiday', 'chaine', 0, NULL, '2021-11-09 04:38:58'),
(65, 'EXPENSEREPORT_ADDON_PDF', 1, 'standard', 'chaine', 0, 'Name of manager to build PDF expense reports documents', '2021-11-09 04:39:03'),
(66, 'EXPENSEREPORT_ADDON', 1, 'mod_expensereport_jade', 'chaine', 0, 'Name of manager to generate expense report ref number', '2021-11-09 04:39:03'),
(67, 'MAIN_DELAY_EXPENSEREPORTS', 1, '15', 'chaine', 0, 'Tolerance delay (in days) before alert for expense reports to approve', '2021-11-09 04:39:03'),
(70, 'ADHERENT_ADDON_PDF', 1, 'standard', 'chaine', 0, 'Name of PDF model of member', '2021-11-09 04:39:08'),
(71, 'ADHERENT_MAIL_FROM', 1, '', 'chaine', 0, 'From des mails', '2021-11-09 04:39:08'),
(72, 'ADHERENT_EMAIL_TEMPLATE_AUTOREGISTER', 1, '(SendingEmailOnAutoSubscription)', 'emailtemplate:member', 0, NULL, '2021-11-09 04:39:08'),
(73, 'ADHERENT_EMAIL_TEMPLATE_SUBSCRIPTION', 1, '(SendingEmailOnNewSubscription)', 'emailtemplate:member', 0, NULL, '2021-11-09 04:39:08'),
(74, 'ADHERENT_EMAIL_TEMPLATE_REMIND_EXPIRATION', 1, '(SendingReminderForExpiredSubscription)', 'emailtemplate:member', 0, NULL, '2021-11-09 04:39:08'),
(75, 'ADHERENT_EMAIL_TEMPLATE_CANCELATION', 1, '(SendingEmailOnCancelation)', 'emailtemplate:member', 0, NULL, '2021-11-09 04:39:08'),
(76, 'ADHERENT_CARD_HEADER_TEXT', 1, '__YEAR__', 'chaine', 0, 'Texte imprimĂ© sur le haut de la carte adhĂ©rent', '2021-11-09 04:39:08'),
(77, 'ADHERENT_CARD_FOOTER_TEXT', 1, '__COMPANY__', 'chaine', 0, 'Texte imprimĂ© sur le bas de la carte adhĂ©rent', '2021-11-09 04:39:08'),
(78, 'ADHERENT_CARD_TEXT', 1, '__FULLNAME__\r\nID: __ID__\r\n__EMAIL__\r\n__ADDRESS__\r\n__ZIP__ __TOWN__\r\n__COUNTRY__', 'texte', 0, 'Text to print on member cards', '2021-11-09 04:39:08'),
(79, 'ADHERENT_MAILMAN_ADMINPW', 1, '', 'chaine', 0, 'Mot de passe Admin des liste mailman', '2021-11-09 04:39:08'),
(80, 'ADHERENT_ETIQUETTE_TYPE', 1, 'L7163', 'chaine', 0, 'Type of address sheets', '2021-11-09 04:39:08'),
(81, 'ADHERENT_ETIQUETTE_TEXT', 1, '__FULLNAME__\n__ADDRESS__\n__ZIP__ __TOWN__\n__COUNTRY%', 'texte', 0, 'Text to print on member address sheets', '2021-11-09 04:39:08'),
(82, 'ADHERENT_BANK_ACCOUNT', 1, '', 'chaine', 0, 'ID of bank account to use', '2021-11-09 04:39:08'),
(83, 'ADHERENT_BANK_CATEGORIE', 1, '', 'chaine', 0, 'ID of bank transaction category to use', '2021-11-09 04:39:08'),
(84, 'MEMBER_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/members', 'chaine', 0, NULL, '2021-11-09 04:39:08'),
(97, 'MAIN_MODULE_COMMANDE', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:39:16'),
(98, 'COMMANDE_ADDON_PDF', 1, 'einstein', 'chaine', 0, 'Name of PDF model of order', '2021-11-09 04:39:16'),
(99, 'COMMANDE_ADDON', 1, 'mod_commande_marbre', 'chaine', 0, 'Name of numbering numerotation rules of order', '2021-11-09 04:39:16'),
(100, 'COMMANDE_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/orders', 'chaine', 0, NULL, '2021-11-09 04:39:16'),
(101, 'MAIN_MODULE_SOCIETE', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:39:16'),
(102, 'SOCIETE_CODECLIENT_ADDON', 1, 'mod_codeclient_monkey', 'chaine', 0, 'Module to control third parties codes', '2021-11-09 04:39:16'),
(103, 'SOCIETE_CODECOMPTA_ADDON', 1, 'mod_codecompta_panicum', 'chaine', 0, 'Module to control third parties codes', '2021-11-09 04:39:16'),
(104, 'COMPANY_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/thirdparties', 'chaine', 0, NULL, '2021-11-09 04:39:16'),
(105, 'SOCIETE_ADD_REF_IN_LIST', 1, '0', 'yesno', 0, 'Display customer ref into select list', '2021-11-09 04:39:16'),
(107, 'MAIN_MODULE_FICHEINTER', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:39:22'),
(108, 'FICHEINTER_ADDON_PDF', 1, 'soleil', 'chaine', 0, NULL, '2021-11-09 04:39:22'),
(109, 'FICHEINTER_ADDON', 1, 'pacific', 'chaine', 0, NULL, '2021-11-09 04:39:22'),
(111, 'MAIN_MODULE_PROPALE', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:39:28'),
(112, 'PROPALE_ADDON_PDF', 1, 'azur', 'chaine', 0, 'Name of the proposal generation manager in PDF format', '2021-11-09 04:39:28'),
(113, 'PROPALE_ADDON', 1, 'mod_propale_marbre', 'chaine', 0, 'Name of proposal numbering manager', '2021-11-09 04:39:28'),
(114, 'PROPALE_VALIDITY_DURATION', 1, '15', 'chaine', 0, 'Duration of validity of business proposals', '2021-11-09 04:39:28'),
(115, 'PROPALE_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/proposals', 'chaine', 0, NULL, '2021-11-09 04:39:28'),
(117, 'MAIN_MODULE_EXPEDITION', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:39:31'),
(118, 'EXPEDITION_ADDON_PDF', 1, 'rouget', 'chaine', 0, 'Nom du gestionnaire de generation des bons expeditions en PDF', '2021-11-09 04:39:31'),
(119, 'EXPEDITION_ADDON_NUMBER', 1, 'mod_expedition_safor', 'chaine', 0, 'Name for numbering manager for shipments', '2021-11-09 04:39:31'),
(120, 'EXPEDITION_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/shipments', 'chaine', 0, NULL, '2021-11-09 04:39:31'),
(121, 'DELIVERY_ADDON_PDF', 1, 'typhon', 'chaine', 0, 'Nom du gestionnaire de generation des bons de reception en PDF', '2021-11-09 04:39:31'),
(122, 'DELIVERY_ADDON_NUMBER', 1, 'mod_delivery_jade', 'chaine', 0, 'Nom du gestionnaire de numerotation des bons de reception', '2021-11-09 04:39:31'),
(123, 'DELIVERY_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/deliveries', 'chaine', 0, NULL, '2021-11-09 04:39:31'),
(124, 'MAIN_SUBMODULE_EXPEDITION', 1, '1', 'chaine', 0, 'Enable delivery receipts', '2021-11-09 04:39:31'),
(126, 'MAIN_MODULE_CONTRAT', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:39:34'),
(127, 'CONTRACT_ADDON', 1, 'mod_contract_serpis', 'chaine', 0, 'Nom du gestionnaire de numerotation des contrats', '2021-11-09 04:39:34'),
(128, 'CONTRACT_ADDON_PDF', 1, 'strato', 'chaine', 0, 'Name of PDF model of contract', '2021-11-09 04:39:34'),
(130, 'MAIN_MODULE_FOURNISSEUR', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:39:39'),
(131, 'COMMANDE_SUPPLIER_ADDON_PDF', 1, 'muscadet', 'chaine', 0, 'Nom du gestionnaire de generation des bons de commande en PDF', '2021-11-09 04:39:39'),
(132, 'COMMANDE_SUPPLIER_ADDON_NUMBER', 1, 'mod_commande_fournisseur_muguet', 'chaine', 0, 'Nom du gestionnaire de numerotation des commandes fournisseur', '2021-11-09 04:39:39'),
(133, 'INVOICE_SUPPLIER_ADDON_NUMBER', 1, 'mod_facture_fournisseur_cactus', 'chaine', 0, 'Nom du gestionnaire de numerotation des factures fournisseur', '2021-11-09 04:39:39'),
(134, 'SUPPLIER_ORDER_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/supplier_orders', 'chaine', 0, NULL, '2021-11-09 04:39:39'),
(136, 'MAIN_MODULE_SUPPLIERPROPOSAL', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:39:43'),
(137, 'SUPPLIER_PROPOSAL_ADDON_PDF', 1, 'aurore', 'chaine', 0, 'Name of submodule to generate PDF for supplier quotation request', '2021-11-09 04:39:43'),
(138, 'SUPPLIER_PROPOSAL_ADDON', 1, 'mod_supplier_proposal_marbre', 'chaine', 0, 'Name of submodule to number supplier quotation request', '2021-11-09 04:39:43'),
(139, 'SUPPLIER_PROPOSAL_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/supplier_proposals', 'chaine', 0, NULL, '2021-11-09 04:39:43'),
(141, 'MAIN_MODULE_FACTURE', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:39:50'),
(142, 'FACTURE_ADDON', 1, 'mod_facture_terre', 'chaine', 0, 'Name of numbering numerotation rules of invoice', '2021-11-09 04:39:50'),
(143, 'FACTURE_ADDON_PDF', 1, 'crabe', 'chaine', 0, 'Name of PDF model of invoice', '2021-11-09 04:39:50'),
(144, 'FACTURE_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/invoices', 'chaine', 0, NULL, '2021-11-09 04:39:50'),
(146, 'MAIN_MODULE_TAX', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:40:02'),
(149, 'SALARIES_ACCOUNTING_ACCOUNT_PAYMENT', 1, '421', 'chaine', 0, NULL, '2021-11-09 04:40:06'),
(150, 'SALARIES_ACCOUNTING_ACCOUNT_CHARGE', 1, '641', 'chaine', 0, NULL, '2021-11-09 04:40:06'),
(155, 'LOAN_ACCOUNTING_ACCOUNT_CAPITAL', 1, '164', 'chaine', 0, NULL, '2021-11-09 04:40:14'),
(156, 'LOAN_ACCOUNTING_ACCOUNT_INSURANCE', 1, '6162', 'chaine', 0, NULL, '2021-11-09 04:40:14'),
(161, 'BANK_ADDON_PDF', 1, 'sepamandate', 'chaine', 0, 'Name of manager to generate SEPA mandate', '2021-11-09 04:40:20'),
(168, 'ACCOUNTING_ACCOUNT_SUSPENSE', 1, '471', 'chaine', 0, NULL, '2021-11-09 04:40:25'),
(169, 'ACCOUNTING_ACCOUNT_TRANSFER_CASH', 1, '58', 'chaine', 0, NULL, '2021-11-09 04:40:25'),
(170, 'CHARTOFACCOUNTS', 1, '2', 'chaine', 0, NULL, '2021-11-09 04:40:25'),
(171, 'ACCOUNTING_EXPORT_MODELCSV', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:25'),
(172, 'ACCOUNTING_LENGTH_GACCOUNT', 1, '', 'chaine', 0, NULL, '2021-11-09 04:40:25'),
(173, 'ACCOUNTING_LENGTH_AACCOUNT', 1, '', 'chaine', 0, NULL, '2021-11-09 04:40:25'),
(174, 'ACCOUNTING_LIST_SORT_VENTILATION_TODO', 1, '1', 'yesno', 0, NULL, '2021-11-09 04:40:25'),
(175, 'ACCOUNTING_LIST_SORT_VENTILATION_DONE', 1, '1', 'yesno', 0, NULL, '2021-11-09 04:40:25'),
(176, 'ACCOUNTING_EXPORT_DATE', 1, '%d%m%Y', 'chaine', 0, NULL, '2021-11-09 04:40:25'),
(177, 'ACCOUNTING_EXPORT_SEPARATORCSV', 1, ',', 'string', 0, NULL, '2021-11-09 04:40:25'),
(178, 'ACCOUNTING_EXPORT_FORMAT', 1, 'csv', 'chaine', 0, NULL, '2021-11-09 04:40:25'),
(180, 'MAIN_MODULE_PRODUCT', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:40:29'),
(181, 'PRODUCT_CODEPRODUCT_ADDON', 1, 'mod_codeproduct_leopard', 'chaine', 0, 'Module to control product codes', '2021-11-09 04:40:29'),
(182, 'PRODUCT_PRICE_UNIQ', 1, '1', 'chaine', 0, 'pricing rule by default', '2021-11-09 04:40:29'),
(184, 'MAIN_MODULE_PRODUCTBATCH', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:40:32'),
(185, 'PRODUCTBATCH_LOT_ADDON', 1, 'mod_lot_free', 'chaine', 0, 'Module to control lot number', '2021-11-09 04:40:32'),
(186, 'PRODUCTBATCH_SN_ADDON', 1, 'mod_sn_free', 'chaine', 0, 'Module to control serial number', '2021-11-09 04:40:32'),
(187, 'MAIN_MODULE_STOCK', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:40:32'),
(188, 'STOCK_ALLOW_NEGATIVE_TRANSFER', 1, '1', 'chaine', 1, NULL, '2021-11-09 04:40:32'),
(189, 'STOCK_ADDON_PDF', 1, 'standard', 'chaine', 0, 'Name of PDF model of stock', '2021-11-09 04:40:32'),
(190, 'MOUVEMENT_ADDON_PDF', 1, 'stdmovement', 'chaine', 0, 'Name of PDF model of stock mouvement', '2021-11-09 04:40:32'),
(191, 'STOCK_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/stocks', 'chaine', 0, NULL, '2021-11-09 04:40:32'),
(192, 'MOUVEMENT_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/stocks/mouvements', 'chaine', 0, NULL, '2021-11-09 04:40:32'),
(194, 'MAIN_MODULE_SERVICE', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:40:35'),
(196, 'MAIN_MODULE_VARIANTS', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 04:40:39'),
(199, 'BOM_ADDON_PDF', 1, 'generic_bom_odt', 'chaine', 0, 'Name of PDF model of BOM', '2021-11-09 04:40:42'),
(200, 'BOM_ADDON', 1, 'mod_bom_standard', 'chaine', 0, 'Name of numbering rules of BOM', '2021-11-09 04:40:42'),
(201, 'BOM_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/boms', 'chaine', 0, NULL, '2021-11-09 04:40:42'),
(213, 'MRP_MO_ADDON_PDF', 1, 'alpha', 'chaine', 0, 'Name of PDF model of MO', '2021-11-09 04:40:44'),
(214, 'MRP_MO_ADDON', 1, 'mod_mo_standard', 'chaine', 0, 'Name of numbering rules of MO', '2021-11-09 04:40:44'),
(215, 'MRP_MO_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/mrps', 'chaine', 0, NULL, '2021-11-09 04:40:44'),
(220, 'MAIN_AGENDA_ACTIONAUTO_COMPANY_CREATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(221, 'MAIN_AGENDA_ACTIONAUTO_COMPANY_MODIFY', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(222, 'MAIN_AGENDA_ACTIONAUTO_COMPANY_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(223, 'MAIN_AGENDA_ACTIONAUTO_COMPANY_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(224, 'MAIN_AGENDA_ACTIONAUTO_PROPAL_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(225, 'MAIN_AGENDA_ACTIONAUTO_PROPAL_CLOSE_SIGNED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(226, 'MAIN_AGENDA_ACTIONAUTO_PROPAL_CLOSE_REFUSED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(227, 'MAIN_AGENDA_ACTIONAUTO_PROPAL_CLASSIFY_BILLED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(228, 'MAIN_AGENDA_ACTIONAUTO_PROPAL_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(229, 'MAIN_AGENDA_ACTIONAUTO_PROPAL_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(230, 'MAIN_AGENDA_ACTIONAUTO_ORDER_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(231, 'MAIN_AGENDA_ACTIONAUTO_ORDER_CLOSE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(232, 'MAIN_AGENDA_ACTIONAUTO_ORDER_CLASSIFY_BILLED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(233, 'MAIN_AGENDA_ACTIONAUTO_ORDER_CANCEL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(234, 'MAIN_AGENDA_ACTIONAUTO_ORDER_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(235, 'MAIN_AGENDA_ACTIONAUTO_ORDER_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(236, 'MAIN_AGENDA_ACTIONAUTO_BILL_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(237, 'MAIN_AGENDA_ACTIONAUTO_BILL_PAYED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(238, 'MAIN_AGENDA_ACTIONAUTO_BILL_CANCEL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(239, 'MAIN_AGENDA_ACTIONAUTO_BILL_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(240, 'MAIN_AGENDA_ACTIONAUTO_BILL_UNVALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(241, 'MAIN_AGENDA_ACTIONAUTO_BILL_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(242, 'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(243, 'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(244, 'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_CLOSE_SIGNED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(245, 'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_CLOSE_REFUSED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(246, 'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(247, 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(248, 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_APPROVE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(249, 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_SUBMIT', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(250, 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_RECEIVE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(251, 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_REFUSE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(252, 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_CANCEL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(253, 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(254, 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_CLASSIFY_BILLED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(255, 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(256, 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(257, 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_UNVALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(258, 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_PAYED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(259, 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(260, 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_CANCELED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(261, 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(262, 'MAIN_AGENDA_ACTIONAUTO_CONTRACT_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(263, 'MAIN_AGENDA_ACTIONAUTO_CONTRACT_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(264, 'MAIN_AGENDA_ACTIONAUTO_CONTRACT_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(265, 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_MODIFY', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(266, 'MAIN_AGENDA_ACTIONAUTO_SHIPPING_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(267, 'MAIN_AGENDA_ACTIONAUTO_SHIPPING_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(268, 'MAIN_AGENDA_ACTIONAUTO_SHIPPING_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(269, 'MAIN_AGENDA_ACTIONAUTO_RECEPTION_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(270, 'MAIN_AGENDA_ACTIONAUTO_RECEPTION_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(271, 'MAIN_AGENDA_ACTIONAUTO_MEMBER_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(272, 'MAIN_AGENDA_ACTIONAUTO_MEMBER_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(273, 'MAIN_AGENDA_ACTIONAUTO_MEMBER_MODIFY', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(274, 'MAIN_AGENDA_ACTIONAUTO_MEMBER_SUBSCRIPTION_CREATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(275, 'MAIN_AGENDA_ACTIONAUTO_MEMBER_SUBSCRIPTION_MODIFY', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(276, 'MAIN_AGENDA_ACTIONAUTO_MEMBER_SUBSCRIPTION_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(277, 'MAIN_AGENDA_ACTIONAUTO_MEMBER_RESILIATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(278, 'MAIN_AGENDA_ACTIONAUTO_MEMBER_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(279, 'MAIN_AGENDA_ACTIONAUTO_MEMBER_EXCLUDE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(280, 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(281, 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_CLASSIFY_BILLED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(282, 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_CLASSIFY_UNBILLED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(283, 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_REOPEN', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(284, 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(285, 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(286, 'MAIN_AGENDA_ACTIONAUTO_PRODUCT_CREATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(287, 'MAIN_AGENDA_ACTIONAUTO_PRODUCT_MODIFY', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(288, 'MAIN_AGENDA_ACTIONAUTO_PRODUCT_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(289, 'MAIN_AGENDA_ACTIONAUTO_CONTACT_CREATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(290, 'MAIN_AGENDA_ACTIONAUTO_CONTACT_MODIFY', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(291, 'MAIN_AGENDA_ACTIONAUTO_CONTACT_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(292, 'MAIN_AGENDA_ACTIONAUTO_CONTACT_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(293, 'MAIN_AGENDA_ACTIONAUTO_PROJECT_CREATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(294, 'MAIN_AGENDA_ACTIONAUTO_PROJECT_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(295, 'MAIN_AGENDA_ACTIONAUTO_PROJECT_MODIFY', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(296, 'MAIN_AGENDA_ACTIONAUTO_PROJECT_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(297, 'MAIN_AGENDA_ACTIONAUTO_TICKET_CREATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(298, 'MAIN_AGENDA_ACTIONAUTO_TICKET_MODIFY', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(299, 'MAIN_AGENDA_ACTIONAUTO_TICKET_ASSIGNED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(300, 'MAIN_AGENDA_ACTIONAUTO_TICKET_CLOSE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(301, 'MAIN_AGENDA_ACTIONAUTO_TICKET_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(302, 'MAIN_AGENDA_ACTIONAUTO_TICKET_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(303, 'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_CREATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(304, 'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(305, 'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_APPROVE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(306, 'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_PAID', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(307, 'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(308, 'MAIN_AGENDA_ACTIONAUTO_HOLIDAY_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(309, 'MAIN_AGENDA_ACTIONAUTO_HOLIDAY_APPROVE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(310, 'MAIN_AGENDA_ACTIONAUTO_USER_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(311, 'MAIN_AGENDA_ACTIONAUTO_BOM_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(312, 'MAIN_AGENDA_ACTIONAUTO_BOM_UNVALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(313, 'MAIN_AGENDA_ACTIONAUTO_BOM_CLOSE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(314, 'MAIN_AGENDA_ACTIONAUTO_BOM_REOPEN', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(315, 'MAIN_AGENDA_ACTIONAUTO_BOM_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(316, 'MAIN_AGENDA_ACTIONAUTO_MRP_MO_VALIDATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(317, 'MAIN_AGENDA_ACTIONAUTO_MRP_MO_PRODUCED', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(318, 'MAIN_AGENDA_ACTIONAUTO_MRP_MO_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(319, 'MAIN_AGENDA_ACTIONAUTO_MRP_MO_CANCEL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(320, 'MAIN_AGENDA_ACTIONAUTO_ACTION_CREATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(321, 'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTJOBPOSITION_CREATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(322, 'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTJOBPOSITION_MODIFY', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(323, 'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTJOBPOSITION_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(324, 'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTJOBPOSITION_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(325, 'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTCANDIDATURE_CREATE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(326, 'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTCANDIDATURE_MODIFY', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(327, 'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTCANDIDATURE_SENTBYMAIL', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(328, 'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTCANDIDATURE_DELETE', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:54'),
(331, 'PROJECT_ADDON_PDF', 1, 'baleine', 'chaine', 0, 'Name of PDF/ODT project manager class', '2021-11-09 04:40:56'),
(332, 'PROJECT_ADDON', 1, 'mod_project_simple', 'chaine', 0, 'Name of Numbering Rule project manager class', '2021-11-09 04:40:56'),
(333, 'PROJECT_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/projects', 'chaine', 0, NULL, '2021-11-09 04:40:56'),
(334, 'PROJECT_TASK_ADDON_PDF', 1, '', 'chaine', 0, 'Name of PDF/ODT tasks manager class', '2021-11-09 04:40:56'),
(335, 'PROJECT_TASK_ADDON', 1, 'mod_task_simple', 'chaine', 0, 'Name of Numbering Rule task manager class', '2021-11-09 04:40:56'),
(336, 'PROJECT_TASK_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/tasks', 'chaine', 0, NULL, '2021-11-09 04:40:56'),
(337, 'PROJECT_USE_OPPORTUNITIES', 1, '1', 'chaine', 0, NULL, '2021-11-09 04:40:56'),
(338, 'MAIN_DELAY_PROJECT_TO_CLOSE', 1, '7', 'chaine', 0, NULL, '2021-11-09 04:40:56'),
(339, 'MAIN_DELAY_TASKS_TODO', 1, '7', 'chaine', 0, NULL, '2021-11-09 04:40:56'),
(346, 'TICKET_ENABLE_PUBLIC_INTERFACE', 1, '0', 'chaine', 0, 'Enable ticket public interface', '2021-11-09 09:20:24'),
(347, 'TICKET_ADDON', 1, 'mod_ticket_simple', 'chaine', 0, 'Ticket ref module', '2021-11-09 09:20:24'),
(348, 'TICKET_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/tickets', 'chaine', 0, 'Ticket templates ODT/ODS directory for templates', '2021-11-09 09:20:24'),
(353, 'MARGIN_TYPE', 1, 'costprice', 'chaine', 0, 'Rule for margin calculation by default', '2021-11-09 09:20:39'),
(361, 'MAIN_MODULE_BARCODE', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 09:21:02'),
(363, 'TAKEPOS_PRINT_METHOD', 1, 'browser', 'chaine', 0, '', '2021-11-09 09:21:10'),
(374, 'CATEGORIE_RECURSIV_ADD', 1, '0', 'yesno', 0, 'Affect parent categories', '2021-11-09 09:21:10'),
(378, 'FCKEDITOR_ENABLE_SOCIETE', 1, '1', 'yesno', 0, 'WYSIWIG for description and note (except products/services)', '2021-11-09 09:21:35'),
(379, 'FCKEDITOR_ENABLE_PRODUCTDESC', 1, '1', 'yesno', 0, 'WYSIWIG for products/services description and note', '2021-11-09 09:21:35'),
(380, 'FCKEDITOR_ENABLE_MAILING', 1, '1', 'yesno', 0, 'WYSIWIG for mass emailings', '2021-11-09 09:21:35'),
(381, 'FCKEDITOR_ENABLE_DETAILS', 1, '1', 'yesno', 0, 'WYSIWIG for products details lines for all entities', '2021-11-09 09:21:35'),
(382, 'FCKEDITOR_ENABLE_USERSIGN', 1, '1', 'yesno', 0, 'WYSIWIG for user signature', '2021-11-09 09:21:35'),
(383, 'FCKEDITOR_ENABLE_MAIL', 1, '1', 'yesno', 0, 'WYSIWIG for products details lines for all entities', '2021-11-09 09:21:35'),
(384, 'FCKEDITOR_SKIN', 1, 'moono-lisa', 'string', 0, 'Skin by default for fckeditor', '2021-11-09 09:21:35'),
(386, 'MAIN_MODULE_MULTICURRENCY', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-09 09:21:41'),
(394, 'MAIN_INFO_SOCIETE_LOGO', 1, 'bona-logo-2021-1.png', 'chaine', 0, '', '2021-11-09 09:27:32'),
(395, 'MAIN_INFO_SOCIETE_LOGO_SMALL', 1, 'bona-logo-2021-1_small.png', 'chaine', 0, '', '2021-11-09 09:27:32'),
(396, 'MAIN_INFO_SOCIETE_LOGO_MINI', 1, 'bona-logo-2021-1_mini.png', 'chaine', 0, '', '2021-11-09 09:27:32'),
(420, 'MAIN_LANG_DEFAULT', 1, 'en_SG', 'chaine', 0, '', '2021-11-09 09:28:54'),
(422, 'MAIN_SIZE_LISTE_LIMIT', 1, '20', 'chaine', 0, '', '2021-11-09 09:28:54'),
(423, 'MAIN_SIZE_SHORTLIST_LIMIT', 1, '3', 'chaine', 0, '', '2021-11-09 09:28:54'),
(424, 'MAIN_START_WEEK', 1, '1', 'chaine', 0, '', '2021-11-09 09:28:54'),
(425, 'MAIN_DEFAULT_WORKING_DAYS', 1, '1-5', 'chaine', 0, '', '2021-11-09 09:28:54'),
(426, 'MAIN_DEFAULT_WORKING_HOURS', 1, '9-18', 'chaine', 0, '', '2021-11-09 09:28:54'),
(427, 'MAIN_FIRSTNAME_NAME_POSITION', 1, '0', 'chaine', 0, '', '2021-11-09 09:28:54'),
(428, 'MAIN_SHOW_LOGO', 1, '1', 'chaine', 0, '', '2021-11-09 09:29:10'),
(452, 'CREATE_NEW_VAT_WITHOUT_AUTO_PAYMENT', 1, '1', 'chaine', 0, '', '2021-11-09 09:52:34'),
(453, 'TAX_MODE', 1, '0', 'chaine', 0, '', '2021-11-09 09:52:38'),
(454, 'TAX_MODE_SELL_PRODUCT', 1, 'invoice', 'chaine', 0, '', '2021-11-09 09:52:38'),
(455, 'TAX_MODE_BUY_PRODUCT', 1, 'invoice', 'chaine', 0, '', '2021-11-09 09:52:38'),
(456, 'TAX_MODE_SELL_SERVICE', 1, 'payment', 'chaine', 0, '', '2021-11-09 09:52:38'),
(457, 'TAX_MODE_BUY_SERVICE', 1, 'payment', 'chaine', 0, '', '2021-11-09 09:52:38'),
(458, 'MAIN_INFO_VAT_RETURN', 1, '1', 'chaine', 0, '', '2021-11-09 09:52:38'),
(466, 'MAIN_MODULE_CATEGORIE', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-11 04:53:52'),
(495, 'TAKEPOS_REF_ADDON', 1, 'mod_takepos_ref_simple', 'chaine', 0, '', '2021-11-11 05:00:42'),
(511, 'TAKEPOS_ROOT_CATEGORY_ID', 1, '-1', 'chaine', 0, '', '2021-11-11 06:11:10'),
(512, 'TAKEPOS_NUMPAD', 1, '0', 'chaine', 0, '', '2021-11-11 06:11:10'),
(513, 'TAKEPOS_SORTPRODUCTFIELD', 1, 'rowid', 'chaine', 0, '', '2021-11-11 06:11:10'),
(514, 'TAKEPOS_NUM_TERMINALS', 1, '1', 'chaine', 0, '', '2021-11-11 06:11:10'),
(515, 'TAKEPOS_EMAIL_TEMPLATE_INVOICE', 1, '-1', 'chaine', 0, '', '2021-11-11 06:11:10'),
(517, 'MAIN_MODULE_BANQUE', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-11 06:24:53'),
(519, 'TAKEPOS_DIRECT_PAYMENT', 1, '1', 'chaine', 0, '', '2021-11-11 06:25:25'),
(520, 'MAIN_MODULE_PAYMENTBYBANKTRANSFER', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"171.239.155.99\"}', '2021-11-11 06:26:24'),
(522, 'CASHDESK_ID_THIRDPARTY1', 1, '1', 'chaine', 0, '', '2021-11-11 06:28:36'),
(523, 'CASHDESK_ID_BANKACCOUNT_CASH1', 1, '2', 'chaine', 0, '', '2021-11-11 06:28:36'),
(524, 'CASHDESK_ID_BANKACCOUNT_CHEQUE1', 1, '1', 'chaine', 0, '', '2021-11-11 06:28:36'),
(525, 'CASHDESK_ID_BANKACCOUNT_CB1', 1, '1', 'chaine', 0, '', '2021-11-11 06:28:36'),
(526, 'CASHDESK_ID_BANKACCOUNT_PRE1', 1, '1', 'chaine', 0, '', '2021-11-11 06:28:36'),
(527, 'CASHDESK_ID_BANKACCOUNT_VIR1', 1, '1', 'chaine', 0, '', '2021-11-11 06:28:36'),
(528, 'CASHDESK_READER_KEYCODE_FOR_ENTER1', 1, '13', 'chaine', 0, '', '2021-11-11 06:28:36'),
(529, 'TAKEPOS_HEADER1', 1, 'a', 'chaine', 0, '', '2021-11-11 06:28:36'),
(530, 'TAKEPOS_FOOTER1', 1, 'a', 'chaine', 0, '', '2021-11-11 06:28:36'),
(531, 'CASHDESK_NO_DECREASE_STOCK1', 1, '1', 'chaine', 0, '', '2021-11-11 06:28:36'),
(532, 'TAKEPOS_COLOR_THEME', 1, '0', 'chaine', 0, '', '2021-11-11 06:32:08'),
(533, 'TAKEPOS_LINES_TO_SHOW', 1, '2', 'chaine', 0, '', '2021-11-11 06:32:08'),
(534, 'MAIN_HELPCENTER_DISABLELINK', 1, '1', 'chaine', 0, '', '2021-11-11 06:38:04'),
(544, 'OBLYON_COLOR_MAIN', 0, '#0083A2', 'chaine', 1, 'Oblyon maincolor', '2021-11-11 06:39:10'),
(545, 'OBLYON_COLOR_TOPMENU_BCKGRD', 0, '#333333', 'chaine', 1, 'Oblyon background topmenu color', '2021-11-11 06:39:10'),
(546, 'OBLYON_COLOR_TOPMENU_BCKGRD_HOVER', 0, '#0083A2', 'chaine', 1, 'Oblyon background topmenu hover color', '2021-11-11 06:39:10'),
(547, 'OBLYON_COLOR_TOPMENU_TXT', 0, '#F4F4F4', 'chaine', 1, 'Oblyon topmenu text color', '2021-11-11 06:39:10'),
(548, 'OBLYON_COLOR_LEFTMENU_BCKGRD', 0, '#333333', 'chaine', 1, 'Oblyon background leftmenu color', '2021-11-11 06:39:10'),
(549, 'OBLYON_COLOR_LEFTMENU_BCKGRD_HOVER', 0, '#0083A2', 'chaine', 1, 'Oblyon background leftmenu hover color', '2021-11-11 06:39:10'),
(550, 'OBLYON_COLOR_LEFTMENU_TXT', 0, '#F4F4F4', 'chaine', 1, 'Oblyon foreground leftmenu color', '2021-11-11 06:39:10'),
(551, 'OBLYON_EFFECT_LEFTMENU', 0, 'slide', 'chaine', 1, 'Oblyon leftmenu effect behavior', '2021-11-11 06:39:10'),
(552, 'OBLYON_COLOR_BCKGRD', 0, '#F4F4F4', 'chaine', 1, 'Oblyon background color', '2021-11-11 06:39:10'),
(553, 'OBLYON_COLOR_LOGO_BCKGRD', 0, '#FFFFFF', 'chaine', 1, 'Oblyon background logo color', '2021-11-11 06:39:10'),
(554, 'OBLYON_COLOR_LOGIN_BCKGRD', 0, '#F4F4F4', 'chaine', 1, 'Oblyon background login color', '2021-11-11 06:39:10'),
(555, 'OBLYON_COLOR_BLINE', 0, '#FFFFFF', 'chaine', 1, 'Oblyon background line color', '2021-11-11 06:39:10'),
(556, 'OBLYON_COLOR_FLINE', 0, '#444444', 'chaine', 1, 'Oblyon text line color', '2021-11-11 06:39:10'),
(557, 'OBLYON_COLOR_FLINE_HOVER', 0, '#222222', 'chaine', 1, 'Oblyon text line color', '2021-11-11 06:39:10'),
(558, 'OBLYON_COLOR_BUTTON_ACTION1', 0, '#0083A2', 'chaine', 1, 'Oblyon button action color 1', '2021-11-11 06:39:10'),
(559, 'OBLYON_COLOR_BUTTON_ACTION2', 0, '#0063A2', 'chaine', 1, 'Oblyon button action color 2', '2021-11-11 06:39:10'),
(560, 'OBLYON_COLOR_BUTTON_DELETE1', 0, '#cc8800', 'chaine', 1, 'Oblyon button delete color 1', '2021-11-11 06:39:10'),
(561, 'OBLYON_COLOR_BUTTON_DELETE2', 0, '#cc4400', 'chaine', 1, 'Oblyon button delete color 2', '2021-11-11 06:39:10'),
(562, 'OBLYON_INFOXBOX_PROJECT_COLOR', 0, '#6c6a98', 'chaine', 1, 'Oblyon Dashboard project background color', '2021-11-11 06:39:10'),
(563, 'OBLYON_INFOXBOX_ACTION_COLOR', 0, '#b46080', 'chaine', 1, 'Oblyon Dashboard action background color', '2021-11-11 06:39:10'),
(564, 'OBLYON_INFOXBOX_CUSTOMER_COLOR', 0, '#99a17d', 'chaine', 1, 'Oblyon Dashboard customer background color', '2021-11-11 06:39:10'),
(565, 'OBLYON_INFOXBOX_SUPPLIER_COLOR', 0, '#599caf', 'chaine', 1, 'Oblyon Dashboard supplier background color', '2021-11-11 06:39:10'),
(566, 'OBLYON_INFOXBOX_CONTRAT_COLOR', 0, '#469686', 'chaine', 1, 'Oblyon Dashboard contract background color', '2021-11-11 06:39:10'),
(567, 'OBLYON_INFOXBOX_BANK_COLOR', 0, '#469686', 'chaine', 1, 'Oblyon Dashboard bank background color', '2021-11-11 06:39:10'),
(568, 'OBLYON_INFOXBOX_ADHERENT_COLOR', 0, '#79633f', 'chaine', 1, 'Oblyon Dashboard member background color', '2021-11-11 06:39:10'),
(569, 'OBLYON_INFOXBOX_EXPENSEREPORT_COLOR', 0, '#79633f', 'chaine', 1, 'Oblyon Dashboard expense report background color', '2021-11-11 06:39:10'),
(570, 'OBLYON_INFOXBOX_HOLIDAY_COLOR', 0, '#755114', 'chaine', 1, 'Oblyon Dashboard holiday background color', '2021-11-11 06:39:10'),
(573, 'MAIN_MENU_INVERT', 1, '0', 'chaine', 0, '', '2021-11-11 06:39:20'),
(576, 'INCOTERM_ACTIVATE', 1, '', 'chaine', 0, 'Description de INCOTERM_ACTIVATE', '2021-11-12 09:29:59'),
(580, 'MAIN_MODULE_BOM', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"128.106.127.230\"}', '2021-11-12 09:30:11'),
(598, 'MAIN_LAST_PING_KO_DATE', 1, '20211208042451', 'chaine', 0, '', '2021-12-08 04:24:51'),
(599, 'MAIN_REMOVE_INSTALL_WARNING', 1, '1', 'chaine', 1, '', '2021-12-08 04:28:10'),
(630, 'USER_PASSWORD_PATTERN', 1, '12;1;1;1;3;1', 'chaine', 0, '', '2021-12-08 09:48:39'),
(631, 'MAIN_THEME', 1, 'eldy', 'chaine', 0, '', '2021-12-08 10:04:20'),
(632, 'THEME_ELDY_TOPMENU_BACK1', 1, '85,85,85', 'chaine', 0, '', '2021-12-08 10:04:20'),
(633, 'MAIN_INFO_SOCIETE_COUNTRY', 1, '29:SG:Singapore', 'chaine', 0, '', '2021-12-08 10:23:52'),
(634, 'MAIN_INFO_SOCIETE_NOM', 1, 'Alex Smith', 'chaine', 0, '', '2021-12-08 10:23:52'),
(635, 'MAIN_INFO_SOCIETE_ADDRESS', 1, 'International Plaza', 'chaine', 0, '', '2021-12-08 10:23:52'),
(636, 'MAIN_INFO_SOCIETE_TOWN', 1, 'Central Singapore', 'chaine', 0, '', '2021-12-08 10:23:52'),
(637, 'MAIN_INFO_SOCIETE_ZIP', 1, '787541', 'chaine', 0, '', '2021-12-08 10:23:52'),
(638, 'MAIN_MONNAIE', 1, 'SGD', 'chaine', 0, '', '2021-12-08 10:23:52'),
(639, 'MAIN_INFO_SOCIETE_TEL', 1, '64575686', 'chaine', 0, '', '2021-12-08 10:23:52'),
(640, 'MAIN_INFO_SOCIETE_MAIL', 1, 'rose@bona.com.sg', 'chaine', 0, '', '2021-12-08 10:23:52'),
(641, 'MAIN_INFO_SOCIETE_WEB', 1, 'bona.com.sg', 'chaine', 0, '', '2021-12-08 10:23:52'),
(642, 'MAIN_INFO_SOCIETE_LOGO_SQUARRED', 1, 'berp3.jpg', 'chaine', 0, '', '2021-12-08 10:23:52'),
(643, 'MAIN_INFO_SOCIETE_LOGO_SQUARRED_SMALL', 1, 'berp3_small.jpg', 'chaine', 0, '', '2021-12-08 10:23:52'),
(644, 'MAIN_INFO_SOCIETE_LOGO_SQUARRED_MINI', 1, 'berp3_mini.jpg', 'chaine', 0, '', '2021-12-08 10:23:52'),
(645, 'MAIN_INFO_SOCIETE_FORME_JURIDIQUE', 1, '0', 'chaine', 0, '', '2021-12-08 10:23:52'),
(646, 'SOCIETE_FISCAL_MONTH_START', 1, '1', 'chaine', 0, '', '2021-12-08 10:23:52'),
(647, 'FACTURE_TVAOPTION', 1, '1', 'chaine', 0, '', '2021-12-08 10:23:52'),
(666, 'MAIN_MODULE_RESOURCE', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"118.201.247.249\"}', '2021-12-08 11:26:28'),
(669, 'MAIN_MODULE_EXPORT', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"118.201.247.249\"}', '2021-12-08 11:27:05'),
(692, 'MAIN_MODULE_IMPORT', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"42.112.90.203\"}', '2021-12-09 02:17:15'),
(700, 'MAIN_IHM_PARAMS_REV', 1, '101', 'chaine', 0, '', '2021-12-21 09:29:14'),
(721, 'MAIN_MENU_STANDARD', 1, 'auguria_menu.php', 'chaine', 0, '', '2021-12-22 02:36:25'),
(722, 'MAIN_MENU_SMARTPHONE', 1, 'eldy_menu.php', 'chaine', 0, '', '2021-12-22 02:36:25'),
(723, 'MAIN_MENUFRONT_STANDARD', 1, 'eldy_menu.php', 'chaine', 0, '', '2021-12-22 02:36:25'),
(724, 'MAIN_MENUFRONT_SMARTPHONE', 1, 'eldy_menu.php', 'chaine', 0, '', '2021-12-22 02:36:25'),
(728, 'MAIN_ENABLE_OVERWRITE_TRANSLATION', 1, '1', 'chaine', 0, '', '2021-12-22 08:36:34');

-- --------------------------------------------------------

--
-- Table structure for table `erp_contrat`
--

CREATE TABLE `erp_contrat` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_contrat` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_commercial_signature` int(11) DEFAULT NULL,
  `fk_commercial_suivi` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT 0,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_contrat`
--

INSERT INTO `erp_contrat` (`rowid`, `ref`, `ref_customer`, `ref_supplier`, `ref_ext`, `entity`, `tms`, `datec`, `date_contrat`, `statut`, `fin_validite`, `date_cloture`, `fk_soc`, `fk_projet`, `fk_commercial_signature`, `fk_commercial_suivi`, `fk_user_author`, `fk_user_modif`, `fk_user_cloture`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `import_key`, `extraparams`) VALUES
(1, 'CT2112-0001', NULL, NULL, NULL, 1, '2021-12-19 13:28:37', '2021-12-19 13:27:30', '2021-12-19 00:00:00', 1, NULL, NULL, 3, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 'contract/(PROV1)/(PROV1).pdf', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_contratdet`
--

CREATE TABLE `erp_contratdet` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contrat` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `label` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `date_ouverture_prevue` datetime DEFAULT NULL,
  `date_ouverture` datetime DEFAULT NULL,
  `date_fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL,
  `remise_percent` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `price_ht` double DEFAULT NULL,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 1,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT NULL,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT 0,
  `fk_user_ouverture` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `commentaire` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_contratdet`
--

INSERT INTO `erp_contratdet` (`rowid`, `tms`, `fk_contrat`, `fk_product`, `statut`, `label`, `description`, `fk_remise_except`, `date_commande`, `date_ouverture_prevue`, `date_ouverture`, `date_fin_validite`, `date_cloture`, `vat_src_code`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `qty`, `remise_percent`, `subprice`, `price_ht`, `remise`, `total_ht`, `total_tva`, `total_localtax1`, `total_localtax2`, `total_ttc`, `product_type`, `info_bits`, `buy_price_ht`, `fk_product_fournisseur_price`, `fk_user_author`, `fk_user_ouverture`, `fk_user_cloture`, `commentaire`, `fk_unit`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_subprice`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES
(1, '2021-12-19 13:28:37', 1, NULL, 4, '', 'test', NULL, NULL, NULL, '2021-12-19 13:28:37', NULL, NULL, '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0.00000000, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 1, 0, 0.00000000, NULL, 0, 1, 1, '', NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
(2, '2021-12-19 13:28:37', 1, 8, 4, '', '', NULL, NULL, NULL, '2021-12-19 13:28:37', NULL, NULL, '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0.00000000, 0, 0, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 1, 0, 0.00000000, NULL, 0, 1, NULL, '', NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_contratdet_extrafields`
--

CREATE TABLE `erp_contratdet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_contratdet_log`
--

CREATE TABLE `erp_contratdet_log` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contratdet` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `statut` smallint(6) NOT NULL,
  `fk_user_author` int(11) NOT NULL,
  `commentaire` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_contrat_extrafields`
--

CREATE TABLE `erp_contrat_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_cronjob`
--

CREATE TABLE `erp_cronjob` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `jobtype` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `command` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `classesname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objectname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `methodename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `md5params` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT 0,
  `datelastrun` datetime DEFAULT NULL,
  `datenextrun` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `datelastresult` datetime DEFAULT NULL,
  `lastresult` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastoutput` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unitfrequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3600',
  `frequency` int(11) NOT NULL DEFAULT 0,
  `maxrun` int(11) NOT NULL DEFAULT 0,
  `nbrun` int(11) DEFAULT NULL,
  `autodelete` int(11) DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `processing` int(11) NOT NULL DEFAULT 0,
  `test` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_mailing` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_cronjob`
--

INSERT INTO `erp_cronjob` (`rowid`, `tms`, `datec`, `jobtype`, `label`, `command`, `classesname`, `objectname`, `methodename`, `params`, `md5params`, `module_name`, `priority`, `datelastrun`, `datenextrun`, `datestart`, `dateend`, `datelastresult`, `lastresult`, `lastoutput`, `unitfrequency`, `frequency`, `maxrun`, `nbrun`, `autodelete`, `status`, `processing`, `test`, `fk_user_author`, `fk_user_mod`, `fk_mailing`, `note`, `libname`, `entity`) VALUES
(1, '2021-11-09 04:38:58', '2021-11-09 04:38:58', 'method', 'HolidayBalanceMonthlyUpdate', NULL, 'holiday/class/holiday.class.php', 'Holiday', 'updateBalance', NULL, NULL, 'holiday', 50, NULL, NULL, '2021-11-09 04:00:00', NULL, NULL, NULL, NULL, '86400', 1, 0, NULL, 0, 1, 0, '$conf->holiday->enabled', NULL, NULL, NULL, 'Update holiday balance every month', NULL, 1),
(2, '2021-11-09 04:39:08', '2021-11-09 04:39:08', 'method', 'SendReminderForExpiredSubscriptionTitle', NULL, 'adherents/class/adherent.class.php', 'Adherent', 'sendReminderForExpiredSubscription', '10;0', NULL, 'adherent', 50, NULL, NULL, '2021-11-09 22:00:00', NULL, NULL, NULL, NULL, '86400', 1, 0, NULL, 0, 1, 0, '$conf->adherent->enabled', NULL, NULL, NULL, 'SendReminderForExpiredSubscription', NULL, 1),
(3, '2021-11-09 04:39:50', '2021-11-09 04:39:50', 'method', 'RecurringInvoices', NULL, 'compta/facture/class/facture-rec.class.php', 'FactureRec', 'createRecurringInvoices', NULL, NULL, 'facture', 50, NULL, NULL, '2021-11-09 23:00:00', NULL, NULL, NULL, NULL, '86400', 1, 0, NULL, 0, 1, 0, '$conf->facture->enabled', NULL, NULL, NULL, 'Generate recurring invoices', NULL, 1),
(4, '2021-11-09 04:39:50', '2021-11-09 04:39:50', 'method', 'SendEmailsRemindersOnInvoiceDueDate', NULL, 'compta/facture/class/facture.class.php', 'Facture', 'sendEmailsRemindersOnInvoiceDueDate', '10,all,EmailTemplateCode', NULL, 'facture', 50, NULL, NULL, '2021-11-09 23:00:00', NULL, NULL, NULL, NULL, '86400', 1, 0, NULL, 0, 0, 0, '$conf->facture->enabled', NULL, NULL, NULL, 'Send an emails when the unpaid invoices reach a due date + n days = today. First param is the offset n of days, second parameter is \"all\" or a payment mode code, last parameter is the code of email template to use (an email template with EmailTemplateCode must exists. the version in the language of the thirdparty will be used in priority).', NULL, 1),
(5, '2021-11-09 04:40:54', '2021-11-09 04:40:54', 'method', 'SendEmailsReminders', NULL, 'comm/action/class/actioncomm.class.php', 'ActionComm', 'sendEmailsReminder', NULL, NULL, 'agenda', 10, NULL, NULL, '2021-11-09 04:40:54', NULL, NULL, NULL, NULL, '60', 5, 0, NULL, 0, 1, 0, '$conf->agenda->enabled', NULL, NULL, NULL, 'SendEMailsReminder', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_accounting_category`
--

CREATE TABLE `erp_c_accounting_category` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `range_account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sens` tinyint(4) NOT NULL DEFAULT 0,
  `category_type` tinyint(4) NOT NULL DEFAULT 0,
  `formula` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_accounting_category`
--

INSERT INTO `erp_c_accounting_category` (`rowid`, `entity`, `code`, `label`, `range_account`, `sens`, `category_type`, `formula`, `position`, `fk_country`, `active`) VALUES
(1, 1, 'INCOMES', 'Income of products/services', 'Example: 7xxxxx', 0, 0, '', 10, 0, 1),
(2, 1, 'EXPENSES', 'Expenses of products/services', 'Example: 6xxxxx', 0, 0, '', 20, 0, 1),
(3, 1, 'PROFIT', 'Balance', '', 0, 1, 'INCOMES+EXPENSES', 30, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_actioncomm`
--

CREATE TABLE `erp_c_actioncomm` (
  `id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'system',
  `libelle` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `todo` tinyint(4) DEFAULT NULL,
  `color` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picto` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_actioncomm`
--

INSERT INTO `erp_c_actioncomm` (`id`, `code`, `type`, `libelle`, `module`, `active`, `todo`, `color`, `picto`, `position`) VALUES
(1, 'AC_TEL', 'system', 'Phone call', NULL, 1, NULL, NULL, NULL, 2),
(2, 'AC_FAX', 'system', 'Send Fax', NULL, 1, NULL, NULL, NULL, 3),
(4, 'AC_EMAIL', 'system', 'Send Email', NULL, 1, NULL, NULL, NULL, 4),
(5, 'AC_RDV', 'system', 'Rendez-vous', NULL, 1, NULL, NULL, NULL, 1),
(6, 'AC_EMAIL_IN', 'system', 'reception Email', NULL, 1, NULL, NULL, NULL, 4),
(11, 'AC_INT', 'system', 'Intervention on site', NULL, 1, NULL, NULL, NULL, 4),
(40, 'AC_OTH_AUTO', 'systemauto', 'Other (automatically inserted events)', NULL, 1, NULL, NULL, NULL, 20),
(50, 'AC_OTH', 'systemauto', 'Other (manually inserted events)', NULL, 1, NULL, NULL, NULL, 5),
(60, 'AC_EO_ONLINECONF', 'module', 'Online/Virtual conference', 'conference@eventorganization', 1, NULL, NULL, NULL, 60),
(61, 'AC_EO_INDOORCONF', 'module', 'Indoor conference', 'conference@eventorganization', 1, NULL, NULL, NULL, 61),
(62, 'AC_EO_ONLINEBOOTH', 'module', 'Online/Virtual booth', 'booth@eventorganization', 1, NULL, NULL, NULL, 62),
(63, 'AC_EO_INDOORBOOTH', 'module', 'Indoor booth', 'booth@eventorganization', 1, NULL, NULL, NULL, 63);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_action_trigger`
--

CREATE TABLE `erp_c_action_trigger` (
  `rowid` int(11) NOT NULL,
  `elementtype` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_action_trigger`
--

INSERT INTO `erp_c_action_trigger` (`rowid`, `elementtype`, `code`, `label`, `description`, `rang`) VALUES
(1, 'societe', 'COMPANY_CREATE', 'Third party created', 'Executed when a third party is created', 1),
(2, 'societe', 'COMPANY_MODIFY', 'Third party update', 'Executed when you update third party', 1),
(3, 'societe', 'COMPANY_SENTBYMAIL', 'Mails sent from third party card', 'Executed when you send email from third party card', 1),
(4, 'societe', 'COMPANY_DELETE', 'Third party deleted', 'Executed when you delete third party', 1),
(5, 'propal', 'PROPAL_VALIDATE', 'Customer proposal validated', 'Executed when a commercial proposal is validated', 2),
(6, 'propal', 'PROPAL_SENTBYMAIL', 'Commercial proposal sent by mail', 'Executed when a commercial proposal is sent by mail', 3),
(7, 'propal', 'PROPAL_CLOSE_SIGNED', 'Customer proposal closed signed', 'Executed when a customer proposal is closed signed', 2),
(8, 'propal', 'PROPAL_CLOSE_REFUSED', 'Customer proposal closed refused', 'Executed when a customer proposal is closed refused', 2),
(9, 'propal', 'PROPAL_CLASSIFY_BILLED', 'Customer proposal set billed', 'Executed when a customer proposal is set to billed', 2),
(10, 'propal', 'PROPAL_DELETE', 'Customer proposal deleted', 'Executed when a customer proposal is deleted', 2),
(11, 'commande', 'ORDER_VALIDATE', 'Customer order validate', 'Executed when a customer order is validated', 4),
(12, 'commande', 'ORDER_CLOSE', 'Customer order classify delivered', 'Executed when a customer order is set delivered', 5),
(13, 'commande', 'ORDER_CLASSIFY_BILLED', 'Customer order classify billed', 'Executed when a customer order is set to billed', 5),
(14, 'commande', 'ORDER_CANCEL', 'Customer order canceled', 'Executed when a customer order is canceled', 5),
(15, 'commande', 'ORDER_SENTBYMAIL', 'Customer order sent by mail', 'Executed when a customer order is sent by mail ', 5),
(16, 'commande', 'ORDER_DELETE', 'Customer order deleted', 'Executed when a customer order is deleted', 5),
(17, 'facture', 'BILL_VALIDATE', 'Customer invoice validated', 'Executed when a customer invoice is approved', 6),
(18, 'facture', 'BILL_PAYED', 'Customer invoice payed', 'Executed when a customer invoice is payed', 7),
(19, 'facture', 'BILL_CANCEL', 'Customer invoice canceled', 'Executed when a customer invoice is conceled', 8),
(20, 'facture', 'BILL_SENTBYMAIL', 'Customer invoice sent by mail', 'Executed when a customer invoice is sent by mail', 9),
(21, 'facture', 'BILL_UNVALIDATE', 'Customer invoice unvalidated', 'Executed when a customer invoice status set back to draft', 9),
(22, 'facture', 'BILL_DELETE', 'Customer invoice deleted', 'Executed when a customer invoice is deleted', 9),
(23, 'proposal_supplier', 'PROPOSAL_SUPPLIER_VALIDATE', 'Price request validated', 'Executed when a commercial proposal is validated', 10),
(24, 'proposal_supplier', 'PROPOSAL_SUPPLIER_SENTBYMAIL', 'Price request sent by mail', 'Executed when a commercial proposal is sent by mail', 10),
(25, 'proposal_supplier', 'PROPOSAL_SUPPLIER_CLOSE_SIGNED', 'Price request closed signed', 'Executed when a customer proposal is closed signed', 10),
(26, 'proposal_supplier', 'PROPOSAL_SUPPLIER_CLOSE_REFUSED', 'Price request closed refused', 'Executed when a customer proposal is closed refused', 10),
(27, 'proposal_supplier', 'PROPOSAL_SUPPLIER_DELETE', 'Price request deleted', 'Executed when a customer proposal delete', 10),
(28, 'order_supplier', 'ORDER_SUPPLIER_VALIDATE', 'Supplier order validated', 'Executed when a supplier order is validated', 12),
(29, 'order_supplier', 'ORDER_SUPPLIER_APPROVE', 'Supplier order request approved', 'Executed when a supplier order is approved', 13),
(30, 'order_supplier', 'ORDER_SUPPLIER_SUBMIT', 'Supplier order request submited', 'Executed when a supplier order is approved', 13),
(31, 'order_supplier', 'ORDER_SUPPLIER_RECEIVE', 'Supplier order request received', 'Executed when a supplier order is received', 13),
(32, 'order_supplier', 'ORDER_SUPPLIER_REFUSE', 'Supplier order request refused', 'Executed when a supplier order is refused', 13),
(33, 'order_supplier', 'ORDER_SUPPLIER_CANCEL', 'Supplier order request canceled', 'Executed when a supplier order is canceled', 13),
(34, 'order_supplier', 'ORDER_SUPPLIER_SENTBYMAIL', 'Supplier order sent by mail', 'Executed when a supplier order is sent by mail', 14),
(35, 'order_supplier', 'ORDER_SUPPLIER_CLASSIFY_BILLED', 'Supplier order set billed', 'Executed when a supplier order is set as billed', 14),
(36, 'order_supplier', 'ORDER_SUPPLIER_DELETE', 'Supplier order deleted', 'Executed when a supplier order is deleted', 14),
(37, 'invoice_supplier', 'BILL_SUPPLIER_VALIDATE', 'Supplier invoice validated', 'Executed when a supplier invoice is validated', 15),
(38, 'invoice_supplier', 'BILL_SUPPLIER_UNVALIDATE', 'Supplier invoice unvalidated', 'Executed when a supplier invoice status is set back to draft', 15),
(39, 'invoice_supplier', 'BILL_SUPPLIER_PAYED', 'Supplier invoice payed', 'Executed when a supplier invoice is payed', 16),
(40, 'invoice_supplier', 'BILL_SUPPLIER_SENTBYMAIL', 'Supplier invoice sent by mail', 'Executed when a supplier invoice is sent by mail', 17),
(41, 'invoice_supplier', 'BILL_SUPPLIER_CANCELED', 'Supplier invoice cancelled', 'Executed when a supplier invoice is cancelled', 17),
(42, 'invoice_supplier', 'BILL_SUPPLIER_DELETE', 'Supplier invoice deleted', 'Executed when a supplier invoice is deleted', 17),
(43, 'contrat', 'CONTRACT_VALIDATE', 'Contract validated', 'Executed when a contract is validated', 18),
(44, 'contrat', 'CONTRACT_SENTBYMAIL', 'Contract sent by mail', 'Executed when a contract is sent by mail', 18),
(45, 'contrat', 'CONTRACT_DELETE', 'Contract deleted', 'Executed when a contract is deleted', 18),
(46, 'shipping', 'SHIPPING_VALIDATE', 'Shipping validated', 'Executed when a shipping is validated', 20),
(47, 'shipping', 'SHIPPING_SENTBYMAIL', 'Shipping sent by mail', 'Executed when a shipping is sent by mail', 21),
(48, 'shipping', 'SHIPPING_DELETE', 'Shipping sent is deleted', 'Executed when a shipping is deleted', 21),
(49, 'reception', 'RECEPTION_VALIDATE', 'Reception validated', 'Executed when a reception is validated', 22),
(50, 'reception', 'RECEPTION_SENTBYMAIL', 'Reception sent by mail', 'Executed when a reception is sent by mail', 22),
(51, 'member', 'MEMBER_VALIDATE', 'Member validated', 'Executed when a member is validated', 22),
(52, 'member', 'MEMBER_SENTBYMAIL', 'Mails sent from member card', 'Executed when you send email from member card', 23),
(53, 'member', 'MEMBER_SUBSCRIPTION_CREATE', 'Member subscribtion recorded', 'Executed when a member subscribtion is deleted', 24),
(54, 'member', 'MEMBER_SUBSCRIPTION_MODIFY', 'Member subscribtion modified', 'Executed when a member subscribtion is modified', 24),
(55, 'member', 'MEMBER_SUBSCRIPTION_DELETE', 'Member subscribtion deleted', 'Executed when a member subscribtion is deleted', 24),
(56, 'member', 'MEMBER_RESILIATE', 'Member resiliated', 'Executed when a member is resiliated', 25),
(57, 'member', 'MEMBER_DELETE', 'Member deleted', 'Executed when a member is deleted', 26),
(58, 'member', 'MEMBER_EXCLUDE', 'Member excluded', 'Executed when a member is excluded', 27),
(59, 'ficheinter', 'FICHINTER_VALIDATE', 'Intervention validated', 'Executed when a intervention is validated', 30),
(60, 'ficheinter', 'FICHINTER_CLASSIFY_BILLED', 'Intervention set billed', 'Executed when a intervention is set to billed (when option FICHINTER_CLASSIFY_BILLED is set)', 32),
(61, 'ficheinter', 'FICHINTER_CLASSIFY_UNBILLED', 'Intervention set unbilled', 'Executed when a intervention is set to unbilled (when option FICHINTER_CLASSIFY_BILLED is set)', 33),
(62, 'ficheinter', 'FICHINTER_REOPEN', 'Intervention opened', 'Executed when a intervention is re-opened', 34),
(63, 'ficheinter', 'FICHINTER_SENTBYMAIL', 'Intervention sent by mail', 'Executed when a intervention is sent by mail', 35),
(64, 'ficheinter', 'FICHINTER_DELETE', 'Intervention is deleted', 'Executed when a intervention is deleted', 35),
(65, 'product', 'PRODUCT_CREATE', 'Product or service created', 'Executed when a product or sevice is created', 40),
(66, 'product', 'PRODUCT_DELETE', 'Product or service deleted', 'Executed when a product or sevice is deleted', 42),
(67, 'expensereport', 'EXPENSE_REPORT_CREATE', 'Expense report created', 'Executed when an expense report is created', 201),
(68, 'expensereport', 'EXPENSE_REPORT_VALIDATE', 'Expense report validated', 'Executed when an expense report is validated', 202),
(69, 'expensereport', 'EXPENSE_REPORT_APPROVE', 'Expense report approved', 'Executed when an expense report is approved', 203),
(70, 'expensereport', 'EXPENSE_REPORT_PAID', 'Expense report billed', 'Executed when an expense report is set as billed', 204),
(71, 'expensereport', 'EXPENSE_REPORT_DELETE', 'Expense report deleted', 'Executed when an expense report is deleted', 205),
(72, 'expensereport', 'HOLIDAY_VALIDATE', 'Expense report validated', 'Executed when an expense report is validated', 211),
(73, 'expensereport', 'HOLIDAY_APPROVE', 'Expense report approved', 'Executed when an expense report is approved', 212),
(74, 'project', 'PROJECT_VALIDATE', 'Project validation', 'Executed when a project is validated', 141),
(75, 'project', 'PROJECT_DELETE', 'Project deleted', 'Executed when a project is deleted', 143),
(76, 'ticket', 'TICKET_CREATE', 'Ticket created', 'Executed when a ticket is created', 161),
(77, 'ticket', 'TICKET_MODIFY', 'Ticket modified', 'Executed when a ticket is modified', 163),
(78, 'ticket', 'TICKET_ASSIGNED', 'Ticket assigned', 'Executed when a ticket is modified', 164),
(79, 'ticket', 'TICKET_CLOSE', 'Ticket closed', 'Executed when a ticket is closed', 165),
(80, 'ticket', 'TICKET_SENTBYMAIL', 'Ticket message sent by email', 'Executed when a message is sent from the ticket record', 166),
(81, 'ticket', 'TICKET_DELETE', 'Ticket deleted', 'Executed when a ticket is deleted', 167),
(82, 'user', 'USER_SENTBYMAIL', 'Email sent', 'Executed when an email is sent from user card', 300),
(83, 'product', 'PRODUCT_MODIFY', 'Product or service modified', 'Executed when a product or sevice is modified', 41),
(84, 'member', 'MEMBER_MODIFY', 'Member modified', 'Executed when a member is modified', 23),
(85, 'ficheinter', 'FICHINTER_MODIFY', 'Intervention modified', 'Executed when a intervention is modified', 19),
(86, 'project', 'PROJECT_CREATE', 'Project creation', 'Executed when a project is created', 140),
(87, 'project', 'PROJECT_MODIFY', 'Project modified', 'Executed when a project is modified', 142),
(88, 'bom', 'BOM_VALIDATE', 'BOM validated', 'Executed when a BOM is validated', 650),
(89, 'bom', 'BOM_UNVALIDATE', 'BOM unvalidated', 'Executed when a BOM is unvalidated', 651),
(90, 'bom', 'BOM_CLOSE', 'BOM disabled', 'Executed when a BOM is disabled', 652),
(91, 'bom', 'BOM_REOPEN', 'BOM reopen', 'Executed when a BOM is re-open', 653),
(92, 'bom', 'BOM_DELETE', 'BOM deleted', 'Executed when a BOM deleted', 654),
(93, 'mrp', 'MRP_MO_VALIDATE', 'MO validated', 'Executed when a MO is validated', 660),
(94, 'mrp', 'MRP_MO_PRODUCED', 'MO produced', 'Executed when a MO is produced', 661),
(95, 'mrp', 'MRP_MO_DELETE', 'MO deleted', 'Executed when a MO is deleted', 662),
(96, 'mrp', 'MRP_MO_CANCEL', 'MO canceled', 'Executed when a MO is canceled', 663),
(97, 'contact', 'CONTACT_CREATE', 'Contact address created', 'Executed when a contact is created', 50),
(98, 'contact', 'CONTACT_MODIFY', 'Contact address update', 'Executed when a contact is updated', 51),
(99, 'contact', 'CONTACT_SENTBYMAIL', 'Mails sent from third party card', 'Executed when you send email from contact address record', 52),
(100, 'contact', 'CONTACT_DELETE', 'Contact address deleted', 'Executed when a contact is deleted', 53),
(101, 'recruitment', 'RECRUITMENTJOBPOSITION_CREATE', 'Job created', 'Executed when a job is created', 7500),
(102, 'recruitment', 'RECRUITMENTJOBPOSITION_MODIFY', 'Job modified', 'Executed when a job is modified', 7502),
(103, 'recruitment', 'RECRUITMENTJOBPOSITION_SENTBYMAIL', 'Mails sent from job record', 'Executed when you send email from job record', 7504),
(104, 'recruitment', 'RECRUITMENTJOBPOSITION_DELETE', 'Job deleted', 'Executed when a job is deleted', 7506),
(105, 'recruitment', 'RECRUITMENTCANDIDATURE_CREATE', 'Candidature created', 'Executed when a candidature is created', 7510),
(106, 'recruitment', 'RECRUITMENTCANDIDATURE_MODIFY', 'Candidature modified', 'Executed when a candidature is modified', 7512),
(107, 'recruitment', 'RECRUITMENTCANDIDATURE_SENTBYMAIL', 'Mails sent from candidature record', 'Executed when you send email from candidature record', 7514),
(108, 'recruitment', 'RECRUITMENTCANDIDATURE_DELETE', 'Candidature deleted', 'Executed when a candidature is deleted', 7516),
(109, 'project', 'TASK_CREATE', 'Task created', 'Executed when a project task is created', 150),
(110, 'project', 'TASK_MODIFY', 'Task modified', 'Executed when a project task is modified', 151),
(111, 'project', 'TASK_DELETE', 'Task deleted', 'Executed when a project task is deleted', 152),
(112, 'agenda', 'ACTION_CREATE', 'Action added', 'Executed when an action is added to the agenda', 700);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_availability`
--

CREATE TABLE `erp_c_availability` (
  `rowid` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_availability`
--

INSERT INTO `erp_c_availability` (`rowid`, `code`, `label`, `active`, `position`) VALUES
(1, 'AV_NOW', 'Immediate', 1, 10),
(2, 'AV_1W', '1 week', 1, 20),
(3, 'AV_2W', '2 weeks', 1, 30),
(4, 'AV_3W', '3 weeks', 1, 40),
(5, 'AV_4W', '4 weeks', 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_barcode_type`
--

CREATE TABLE `erp_c_barcode_type` (
  `rowid` int(11) NOT NULL,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coder` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `example` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_barcode_type`
--

INSERT INTO `erp_c_barcode_type` (`rowid`, `code`, `entity`, `libelle`, `coder`, `example`) VALUES
(1, 'EAN8', 1, 'EAN8', '0', '1234567'),
(2, 'EAN13', 1, 'EAN13', '0', '123456789012'),
(3, 'UPC', 1, 'UPC', '0', '123456789012'),
(4, 'ISBN', 1, 'ISBN', '0', '123456789'),
(5, 'C39', 1, 'Code 39', '0', '1234567890'),
(6, 'C128', 1, 'Code 128', '0', 'ABCD1234567890'),
(7, 'DATAMATRIX', 1, 'Datamatrix', '0', '1234567xyz'),
(8, 'QRCODE', 1, 'Qr Code', '0', 'www.dolibarr.org');

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_chargesociales`
--

CREATE TABLE `erp_c_chargesociales` (
  `id` int(11) NOT NULL,
  `libelle` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deductible` smallint(6) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountancy_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_chargesociales`
--

INSERT INTO `erp_c_chargesociales` (`id`, `libelle`, `deductible`, `active`, `code`, `accountancy_code`, `fk_pays`, `module`) VALUES
(1, 'Securite sociale (URSSAF / MSA)', 1, 1, 'TAXSECU', NULL, 1, NULL),
(2, 'Securite sociale des indĂ©pendants (URSSAF)', 1, 1, 'TAXSSI', NULL, 1, NULL),
(10, 'Taxe apprentissage', 1, 1, 'TAXAPP', NULL, 1, NULL),
(11, 'Formation professionnelle continue', 1, 1, 'TAXFPC', NULL, 1, NULL),
(12, 'Cotisation fonciere des entreprises (CFE)', 1, 1, 'TAXCFE', NULL, 1, NULL),
(13, 'Cotisation sur la valeur ajoutee des entreprises (CVAE)', 1, 1, 'TAXCVAE', NULL, 1, NULL),
(20, 'Taxe fonciere', 1, 1, 'TAXFON', NULL, 1, NULL),
(25, 'Prelevement Ă  la source (PAS)', 0, 1, 'TAXPAS', NULL, 1, NULL),
(30, 'Prevoyance', 1, 1, 'TAXPREV', NULL, 1, NULL),
(40, 'Mutuelle', 1, 1, 'TAXMUT', NULL, 1, NULL),
(50, 'Retraite', 1, 1, 'TAXRET', NULL, 1, NULL),
(60, 'Taxe sur vehicule societe (TVS)', 0, 1, 'TAXTVS', NULL, 1, NULL),
(70, 'impĂ´ts sur les sociĂ©tĂ©s (IS)', 0, 1, 'TAXIS', NULL, 1, NULL),
(201, 'ONSS', 1, 1, 'TAXBEONSS', NULL, 2, NULL),
(210, 'Precompte professionnel', 1, 1, 'TAXBEPREPRO', NULL, 2, NULL),
(220, 'Prime existence', 1, 1, 'TAXBEPRIEXI', NULL, 2, NULL),
(230, 'Precompte immobilier', 1, 1, 'TAXBEPREIMMO', NULL, 2, NULL),
(4101, 'Krankenversicherung', 1, 1, 'TAXATKV', NULL, 41, NULL),
(4102, 'Unfallversicherung', 1, 1, 'TAXATUV', NULL, 41, NULL),
(4103, 'Pensionsversicherung', 1, 1, 'TAXATPV', NULL, 41, NULL),
(4104, 'Arbeitslosenversicherung', 1, 1, 'TAXATAV', NULL, 41, NULL),
(4105, 'Insolvenzentgeltsicherungsfond', 1, 1, 'TAXATIESG', NULL, 41, NULL),
(4106, 'WohnbaufĂ¶rderung', 1, 1, 'TAXATWF', NULL, 41, NULL),
(4107, 'Arbeiterkammerumlage', 1, 1, 'TAXATAK', NULL, 41, NULL),
(4108, 'Mitarbeitervorsorgekasse', 1, 1, 'TAXATMVK', NULL, 41, NULL),
(4109, 'Familienlastenausgleichsfond', 1, 1, 'TAXATFLAF', NULL, 41, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_civility`
--

CREATE TABLE `erp_c_civility` (
  `rowid` int(11) NOT NULL,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_civility`
--

INSERT INTO `erp_c_civility` (`rowid`, `code`, `label`, `active`, `module`) VALUES
(1, 'MME', 'Madame', 1, NULL),
(3, 'MR', 'Monsieur', 1, NULL),
(5, 'MLE', 'Mademoiselle', 1, NULL),
(7, 'MTRE', 'MaĂ®tre', 1, NULL),
(8, 'DR', 'Docteur', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_country`
--

CREATE TABLE `erp_c_country` (
  `rowid` int(11) NOT NULL,
  `code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_iso` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eec` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `favorite` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_country`
--

INSERT INTO `erp_c_country` (`rowid`, `code`, `code_iso`, `label`, `eec`, `active`, `favorite`) VALUES
(0, '', NULL, '-', NULL, 1, 1),
(1, 'FR', 'FRA', 'France', 1, 1, 0),
(2, 'BE', 'BEL', 'Belgium', 1, 1, 0),
(3, 'IT', 'ITA', 'Italy', 1, 1, 0),
(4, 'ES', 'ESP', 'Spain', 1, 1, 0),
(5, 'DE', 'DEU', 'Germany', 1, 1, 0),
(6, 'CH', 'CHE', 'Switzerland', NULL, 1, 0),
(7, 'GB', 'GBR', 'United Kingdom', NULL, 1, 0),
(8, 'IE', 'IRL', 'Ireland', 1, 1, 0),
(9, 'CN', 'CHN', 'China', NULL, 1, 0),
(10, 'TN', 'TUN', 'Tunisia', NULL, 1, 0),
(11, 'US', 'USA', 'United States', NULL, 1, 0),
(12, 'MA', 'MAR', 'Morocco', NULL, 1, 0),
(13, 'DZ', 'DZA', 'Algeria', NULL, 1, 0),
(14, 'CA', 'CAN', 'Canada', NULL, 1, 0),
(15, 'TG', 'TGO', 'Togo', NULL, 1, 0),
(16, 'GA', 'GAB', 'Gabon', NULL, 1, 0),
(17, 'NL', 'NLD', 'Netherlands', 1, 1, 0),
(18, 'HU', 'HUN', 'Hungary', 1, 1, 0),
(19, 'RU', 'RUS', 'Russia', NULL, 1, 0),
(20, 'SE', 'SWE', 'Sweden', 1, 1, 0),
(21, 'CI', 'CIV', 'CĂ´te d\'Ivoire', NULL, 1, 0),
(22, 'SN', 'SEN', 'Senegal', NULL, 1, 0),
(23, 'AR', 'ARG', 'Argentina', NULL, 1, 0),
(24, 'CM', 'CMR', 'Cameroun', NULL, 1, 0),
(25, 'PT', 'PRT', 'Portugal', 1, 1, 0),
(26, 'SA', 'SAU', 'Saudi Arabia', NULL, 1, 0),
(27, 'MC', 'MCO', 'Monaco', 1, 1, 0),
(28, 'AU', 'AUS', 'Australia', NULL, 1, 0),
(29, 'SG', 'SGP', 'Singapore', NULL, 1, 0),
(30, 'AF', 'AFG', 'Afghanistan', NULL, 1, 0),
(31, 'AX', 'ALA', 'Ă…land Island', NULL, 1, 0),
(32, 'AL', 'ALB', 'Albania', NULL, 1, 0),
(33, 'AS', 'ASM', 'American Samoa', NULL, 1, 0),
(34, 'AD', 'AND', 'Andorra', NULL, 1, 0),
(35, 'AO', 'AGO', 'Angola', NULL, 1, 0),
(36, 'AI', 'AIA', 'Anguilla', NULL, 1, 0),
(37, 'AQ', 'ATA', 'Antarctica', NULL, 1, 0),
(38, 'AG', 'ATG', 'Antigua and Barbuda', NULL, 1, 0),
(39, 'AM', 'ARM', 'Armenia', NULL, 1, 0),
(40, 'AW', 'ABW', 'Aruba', NULL, 1, 0),
(41, 'AT', 'AUT', 'Austria', 1, 1, 0),
(42, 'AZ', 'AZE', 'Azerbaijan', NULL, 1, 0),
(43, 'BS', 'BHS', 'Bahamas', NULL, 1, 0),
(44, 'BH', 'BHR', 'BahreĂ¯n', NULL, 1, 0),
(45, 'BD', 'BGD', 'Bangladesh', NULL, 1, 0),
(46, 'BB', 'BRB', 'Barbade', NULL, 1, 0),
(47, 'BY', 'BLR', 'Belarus', NULL, 1, 0),
(48, 'BZ', 'BLZ', 'Belize', NULL, 1, 0),
(49, 'BJ', 'BEN', 'BĂ©nin', NULL, 1, 0),
(50, 'BM', 'BMU', 'Bermudes', NULL, 1, 0),
(51, 'BT', 'BTN', 'Bhoutan', NULL, 1, 0),
(52, 'BO', 'BOL', 'Bolivie', NULL, 1, 0),
(53, 'BA', 'BIH', 'Bosnie-HerzĂ©govine', NULL, 1, 0),
(54, 'BW', 'BWA', 'Botswana', NULL, 1, 0),
(55, 'BV', 'BVT', 'Ile Bouvet', NULL, 1, 0),
(56, 'BR', 'BRA', 'Brazil', NULL, 1, 0),
(57, 'IO', 'IOT', 'Territoire britannique de l\'OcĂ©an Indien', NULL, 1, 0),
(58, 'BN', 'BRN', 'Brunei', NULL, 1, 0),
(59, 'BG', 'BGR', 'Bulgarie', 1, 1, 0),
(60, 'BF', 'BFA', 'Burkina Faso', NULL, 1, 0),
(61, 'BI', 'BDI', 'Burundi', NULL, 1, 0),
(62, 'KH', 'KHM', 'Cambodge', NULL, 1, 0),
(63, 'CV', 'CPV', 'Cap-Vert', NULL, 1, 0),
(64, 'KY', 'CYM', 'Iles Cayman', NULL, 1, 0),
(65, 'CF', 'CAF', 'RĂ©publique centrafricaine', NULL, 1, 0),
(66, 'TD', 'TCD', 'Tchad', NULL, 1, 0),
(67, 'CL', 'CHL', 'Chili', NULL, 1, 0),
(68, 'CX', 'CXR', 'Ile Christmas', NULL, 1, 0),
(69, 'CC', 'CCK', 'Iles des Cocos (Keeling)', NULL, 1, 0),
(70, 'CO', 'COL', 'Colombie', NULL, 1, 0),
(71, 'KM', 'COM', 'Comores', NULL, 1, 0),
(72, 'CG', 'COG', 'Congo', NULL, 1, 0),
(73, 'CD', 'COD', 'RĂ©publique dĂ©mocratique du Congo', NULL, 1, 0),
(74, 'CK', 'COK', 'Iles Cook', NULL, 1, 0),
(75, 'CR', 'CRI', 'Costa Rica', NULL, 1, 0),
(76, 'HR', 'HRV', 'Croatie', 1, 1, 0),
(77, 'CU', 'CUB', 'Cuba', NULL, 1, 0),
(78, 'CY', 'CYP', 'Cyprus', 1, 1, 0),
(79, 'CZ', 'CZE', 'Czech Republic', 1, 1, 0),
(80, 'DK', 'DNK', 'Denmark', 1, 1, 0),
(81, 'DJ', 'DJI', 'Djibouti', NULL, 1, 0),
(82, 'DM', 'DMA', 'Dominica', NULL, 1, 0),
(83, 'DO', 'DOM', 'Dominican Republic', NULL, 1, 0),
(84, 'EC', 'ECU', 'Republic of Ecuador', NULL, 1, 0),
(85, 'EG', 'EGY', 'Egypt', NULL, 1, 0),
(86, 'SV', 'SLV', 'El Salvador', NULL, 1, 0),
(87, 'GQ', 'GNQ', 'Equatorial Guinea', NULL, 1, 0),
(88, 'ER', 'ERI', 'Eritrea', NULL, 1, 0),
(89, 'EE', 'EST', 'Estonia', 1, 1, 0),
(90, 'ET', 'ETH', 'Ethiopia', NULL, 1, 0),
(91, 'FK', 'FLK', 'Falkland Islands', NULL, 1, 0),
(92, 'FO', 'FRO', 'Faroe Islands', NULL, 1, 0),
(93, 'FJ', 'FJI', 'Fidji Islands', NULL, 1, 0),
(94, 'FI', 'FIN', 'Finland', 1, 1, 0),
(95, 'GF', 'GUF', 'French Guiana', NULL, 1, 0),
(96, 'PF', 'PYF', 'French Polynesia', NULL, 1, 0),
(97, 'TF', 'ATF', 'Terres australes franĂ§aises', NULL, 1, 0),
(98, 'GM', 'GMB', 'Gambie', NULL, 1, 0),
(99, 'GE', 'GEO', 'Georgia', NULL, 1, 0),
(100, 'GH', 'GHA', 'Ghana', NULL, 1, 0),
(101, 'GI', 'GIB', 'Gibraltar', NULL, 1, 0),
(102, 'GR', 'GRC', 'Greece', 1, 1, 0),
(103, 'GL', 'GRL', 'Groenland', NULL, 1, 0),
(104, 'GD', 'GRD', 'Grenade', NULL, 1, 0),
(106, 'GU', 'GUM', 'Guam', NULL, 1, 0),
(107, 'GT', 'GTM', 'Guatemala', NULL, 1, 0),
(108, 'GN', 'GIN', 'Guinea', NULL, 1, 0),
(109, 'GW', 'GNB', 'Guinea-Bissao', NULL, 1, 0),
(111, 'HT', 'HTI', 'Haiti', NULL, 1, 0),
(112, 'HM', 'HMD', 'Iles Heard et McDonald', NULL, 1, 0),
(113, 'VA', 'VAT', 'Saint-SiĂ¨ge (Vatican)', NULL, 1, 0),
(114, 'HN', 'HND', 'Honduras', NULL, 1, 0),
(115, 'HK', 'HKG', 'Hong Kong', NULL, 1, 0),
(116, 'IS', 'ISL', 'Islande', NULL, 1, 0),
(117, 'IN', 'IND', 'India', NULL, 1, 0),
(118, 'ID', 'IDN', 'IndonĂ©sie', NULL, 1, 0),
(119, 'IR', 'IRN', 'Iran', NULL, 1, 0),
(120, 'IQ', 'IRQ', 'Iraq', NULL, 1, 0),
(121, 'IL', 'ISR', 'Israel', NULL, 1, 0),
(122, 'JM', 'JAM', 'JamaĂ¯que', NULL, 1, 0),
(123, 'JP', 'JPN', 'Japon', NULL, 1, 0),
(124, 'JO', 'JOR', 'Jordanie', NULL, 1, 0),
(125, 'KZ', 'KAZ', 'Kazakhstan', NULL, 1, 0),
(126, 'KE', 'KEN', 'Kenya', NULL, 1, 0),
(127, 'KI', 'KIR', 'Kiribati', NULL, 1, 0),
(128, 'KP', 'PRK', 'North Corea', NULL, 1, 0),
(129, 'KR', 'KOR', 'South Corea', NULL, 1, 0),
(130, 'KW', 'KWT', 'KoweĂ¯t', NULL, 1, 0),
(131, 'KG', 'KGZ', 'Kirghizistan', NULL, 1, 0),
(132, 'LA', 'LAO', 'Laos', NULL, 1, 0),
(133, 'LV', 'LVA', 'Lettonie', 1, 1, 0),
(134, 'LB', 'LBN', 'Liban', NULL, 1, 0),
(135, 'LS', 'LSO', 'Lesotho', NULL, 1, 0),
(136, 'LR', 'LBR', 'Liberia', NULL, 1, 0),
(137, 'LY', 'LBY', 'Libye', NULL, 1, 0),
(138, 'LI', 'LIE', 'Liechtenstein', NULL, 1, 0),
(139, 'LT', 'LTU', 'Lituanie', 1, 1, 0),
(140, 'LU', 'LUX', 'Luxembourg', 1, 1, 0),
(141, 'MO', 'MAC', 'Macao', NULL, 1, 0),
(142, 'MK', 'MKD', 'ex-RĂ©publique yougoslave de MacĂ©doine', NULL, 1, 0),
(143, 'MG', 'MDG', 'Madagascar', NULL, 1, 0),
(144, 'MW', 'MWI', 'Malawi', NULL, 1, 0),
(145, 'MY', 'MYS', 'Malaisie', NULL, 1, 0),
(146, 'MV', 'MDV', 'Maldives', NULL, 1, 0),
(147, 'ML', 'MLI', 'Mali', NULL, 1, 0),
(148, 'MT', 'MLT', 'Malte', 1, 1, 0),
(149, 'MH', 'MHL', 'Iles Marshall', NULL, 1, 0),
(151, 'MR', 'MRT', 'Mauritanie', NULL, 1, 0),
(152, 'MU', 'MUS', 'Maurice', NULL, 1, 0),
(153, 'YT', 'MYT', 'Mayotte', NULL, 1, 0),
(154, 'MX', 'MEX', 'Mexique', NULL, 1, 0),
(155, 'FM', 'FSM', 'MicronĂ©sie', NULL, 1, 0),
(156, 'MD', 'MDA', 'Moldavie', NULL, 1, 0),
(157, 'MN', 'MNG', 'Mongolie', NULL, 1, 0),
(158, 'MS', 'MSR', 'Monserrat', NULL, 1, 0),
(159, 'MZ', 'MOZ', 'Mozambique', NULL, 1, 0),
(160, 'MM', 'MMR', 'Birmanie (Myanmar)', NULL, 1, 0),
(161, 'NA', 'NAM', 'Namibie', NULL, 1, 0),
(162, 'NR', 'NRU', 'Nauru', NULL, 1, 0),
(163, 'NP', 'NPL', 'NĂ©pal', NULL, 1, 0),
(165, 'NC', 'NCL', 'New Caledonia', NULL, 1, 0),
(166, 'NZ', 'NZL', 'New Zealand', NULL, 1, 0),
(167, 'NI', 'NIC', 'Nicaragua', NULL, 1, 0),
(168, 'NE', 'NER', 'Niger', NULL, 1, 0),
(169, 'NG', 'NGA', 'Nigeria', NULL, 1, 0),
(170, 'NU', 'NIU', 'Niue', NULL, 1, 0),
(171, 'NF', 'NFK', 'Norfolk Island', NULL, 1, 0),
(172, 'MP', 'MNP', 'Northern Mariana Islands', NULL, 1, 0),
(173, 'NO', 'NOR', 'Norway', NULL, 1, 0),
(174, 'OM', 'OMN', 'Oman', NULL, 1, 0),
(175, 'PK', 'PAK', 'Pakistan', NULL, 1, 0),
(176, 'PW', 'PLW', 'Palau', NULL, 1, 0),
(177, 'PS', 'PSE', 'Palestinian territories', NULL, 1, 0),
(178, 'PA', 'PAN', 'Panama', NULL, 1, 0),
(179, 'PG', 'PNG', 'Papua New Guinea', NULL, 1, 0),
(180, 'PY', 'PRY', 'Paraguay', NULL, 1, 0),
(181, 'PE', 'PER', 'Peru', NULL, 1, 0),
(182, 'PH', 'PHL', 'Philippines', NULL, 1, 0),
(183, 'PN', 'PCN', 'Pitcairn Islands', NULL, 1, 0),
(184, 'PL', 'POL', 'Pologne', 1, 1, 0),
(185, 'PR', 'PRI', 'Puerto Rico', NULL, 1, 0),
(186, 'QA', 'QAT', 'Qatar', NULL, 1, 0),
(188, 'RO', 'ROU', 'Romania', 1, 1, 0),
(189, 'RW', 'RWA', 'Rwanda', NULL, 1, 0),
(190, 'SH', 'SHN', 'Saint Helena', NULL, 1, 0),
(191, 'KN', 'KNA', 'Saint Kitts and Nevis', NULL, 1, 0),
(192, 'LC', 'LCA', 'Saint Lucia', NULL, 1, 0),
(193, 'PM', 'SPM', 'Saint Pierre and Miquelon', NULL, 1, 0),
(194, 'VC', 'VCT', 'Saint Vincent and the Grenadines', NULL, 1, 0),
(195, 'WS', 'WSM', 'Samoa', NULL, 1, 0),
(196, 'SM', 'SMR', 'San Marino ', NULL, 1, 0),
(197, 'ST', 'STP', 'Saint Thomas and Prince', NULL, 1, 0),
(198, 'RS', 'SRB', 'Serbia', NULL, 1, 0),
(199, 'SC', 'SYC', 'Seychelles', NULL, 1, 0),
(200, 'SL', 'SLE', 'Sierra Leone', NULL, 1, 0),
(201, 'SK', 'SVK', 'Slovakia', 1, 1, 0),
(202, 'SI', 'SVN', 'Slovenia', 1, 1, 0),
(203, 'SB', 'SLB', 'Solomon Islands', NULL, 1, 0),
(204, 'SO', 'SOM', 'Somalia', NULL, 1, 0),
(205, 'ZA', 'ZAF', 'South Africa', NULL, 1, 0),
(206, 'GS', 'SGS', 'South Georgia and the South Sandwich Islands ', NULL, 1, 0),
(207, 'LK', 'LKA', 'Sri Lanka', NULL, 1, 0),
(208, 'SD', 'SDN', 'Sudan', NULL, 1, 0),
(209, 'SR', 'SUR', 'Suriname', NULL, 1, 0),
(210, 'SJ', 'SJM', 'Svalbard and Jan Mayen', NULL, 1, 0),
(211, 'SZ', 'SWZ', 'Swaziland / Eswatini', NULL, 1, 0),
(212, 'SY', 'SYR', 'Syria', NULL, 1, 0),
(213, 'TW', 'TWN', 'Taiwan', NULL, 1, 0),
(214, 'TJ', 'TJK', 'Tajikistan', NULL, 1, 0),
(215, 'TZ', 'TZA', 'Tanzania', NULL, 1, 0),
(216, 'TH', 'THA', 'Thailand', NULL, 1, 0),
(217, 'TL', 'TLS', 'Timor-Leste', NULL, 1, 0),
(218, 'TK', 'TKL', 'Tokelau', NULL, 1, 0),
(219, 'TO', 'TON', 'Tonga', NULL, 1, 0),
(220, 'TT', 'TTO', 'Trinidad and Tobago', NULL, 1, 0),
(221, 'TR', 'TUR', 'Turkey', NULL, 1, 0),
(222, 'TM', 'TKM', 'Turkmenistan', NULL, 1, 0),
(223, 'TC', 'TCA', 'Turks and Caicos Islands', NULL, 1, 0),
(224, 'TV', 'TUV', 'Tuvalu', NULL, 1, 0),
(225, 'UG', 'UGA', 'Uganda', NULL, 1, 0),
(226, 'UA', 'UKR', 'Ukraine', NULL, 1, 0),
(227, 'AE', 'ARE', 'United Arab Emirates', NULL, 1, 0),
(228, 'UM', 'UMI', 'United States Minor Outlying Islands', NULL, 1, 0),
(229, 'UY', 'URY', 'Uruguay', NULL, 1, 0),
(230, 'UZ', 'UZB', 'Uzbekistan', NULL, 1, 0),
(231, 'VU', 'VUT', 'Vanuatu', NULL, 1, 0),
(232, 'VE', 'VEN', 'Venezuela', NULL, 1, 0),
(233, 'VN', 'VNM', 'Vietnam', NULL, 1, 0),
(234, 'VG', 'VGB', 'British Virgin Islands', NULL, 1, 0),
(235, 'VI', 'VIR', 'Virgin Islands of the United States', NULL, 1, 0),
(236, 'WF', 'WLF', 'Wallis and Futuna', NULL, 1, 0),
(237, 'EH', 'ESH', 'Western Sahara', NULL, 1, 0),
(238, 'YE', 'YEM', 'Yemen', NULL, 1, 0),
(239, 'ZM', 'ZMB', 'Zambia', NULL, 1, 0),
(240, 'ZW', 'ZWE', 'Zimbabwe', NULL, 1, 0),
(241, 'GG', 'GGY', 'Guernsey', NULL, 1, 0),
(242, 'IM', 'IMN', 'Isle of Man', NULL, 1, 0),
(243, 'JE', 'JEY', 'Jersey', NULL, 1, 0),
(244, 'ME', 'MNE', 'Montenegro', NULL, 1, 0),
(245, 'BL', 'BLM', 'Saint-BarthĂ©lemy', NULL, 1, 0),
(246, 'MF', 'MAF', 'Saint-Martin', NULL, 1, 0),
(247, 'XK', 'XKX', 'Kosovo', NULL, 1, 0),
(300, 'CW', 'CUW', 'CuraĂ§ao', NULL, 1, 0),
(301, 'SX', 'SXM', 'Sint Maarten', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_currencies`
--

CREATE TABLE `erp_c_currencies` (
  `code_iso` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unicode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_currencies`
--

INSERT INTO `erp_c_currencies` (`code_iso`, `label`, `unicode`, `active`) VALUES
('AED', 'United Arab Emirates Dirham', NULL, 1),
('AFN', 'Afghanistan Afghani', '[1547]', 1),
('ALL', 'Albania Lek', '[76,101,107]', 1),
('ANG', 'Netherlands Antilles Guilder', '[402]', 1),
('AOA', 'Angola Kwanza', NULL, 1),
('ARP', 'Pesos argentins', NULL, 0),
('ARS', 'Argentino Peso', '[36]', 1),
('ATS', 'Shiliing autrichiens', NULL, 0),
('AUD', 'Australia Dollar', '[36]', 1),
('AWG', 'Aruba Guilder', '[402]', 1),
('AZN', 'Azerbaijan New Manat', '[1084,1072,1085]', 1),
('BAM', 'Bosnia and Herzegovina Convertible Marka', '[75,77]', 1),
('BBD', 'Barbados Dollar', '[36]', 1),
('BDT', 'Bangladeshi Taka', '[2547]', 1),
('BEF', 'Francs belges', NULL, 0),
('BGN', 'Bulgaria Lev', '[1083,1074]', 1),
('BHD', 'Bahrain', NULL, 1),
('BMD', 'Bermuda Dollar', '[36]', 1),
('BND', 'Brunei Darussalam Dollar', '[36]', 1),
('BOB', 'Bolivia Boliviano', '[66,115]', 1),
('BRL', 'Brazil Real', '[82,36]', 1),
('BSD', 'Bahamas Dollar', '[36]', 1),
('BWP', 'Botswana Pula', '[80]', 1),
('BYR', 'Belarus Ruble', '[112,46]', 1),
('BZD', 'Belize Dollar', '[66,90,36]', 1),
('CAD', 'Canada Dollar', '[36]', 1),
('CHF', 'Switzerland Franc', '[67,72,70]', 1),
('CLP', 'Chile Peso', '[36]', 1),
('CNY', 'China Yuan Renminbi', '[165]', 1),
('COP', 'Colombia Peso', '[36]', 1),
('CRC', 'Costa Rica Colon', '[8353]', 1),
('CUP', 'Cuba Peso', '[8369]', 1),
('CVE', 'Cap Verde Escudo', '[4217]', 1),
('CZK', 'Czech Republic Koruna', '[75,269]', 1),
('DEM', 'Deutsche Mark', NULL, 0),
('DKK', 'Denmark Krone', '[107,114]', 1),
('DOP', 'Dominican Republic Peso', '[82,68,36]', 1),
('DZD', 'Algeria Dinar', NULL, 1),
('ECS', 'Ecuador Sucre', '[83,47,46]', 1),
('EEK', 'Estonia Kroon', '[107,114]', 1),
('EGP', 'Egypt Pound', '[163]', 1),
('ESP', 'Pesete', NULL, 0),
('ETB', 'Ethiopian Birr', NULL, 1),
('EUR', 'Euro Member Countries', '[8364]', 1),
('FIM', 'Mark finlandais', NULL, 0),
('FJD', 'Fiji Dollar', '[36]', 1),
('FKP', 'Falkland Islands (Malvinas) Pound', '[163]', 1),
('FRF', 'Francs francais', NULL, 0),
('GBP', 'United Kingdom Pound', '[163]', 1),
('GGP', 'Guernsey Pound', '[163]', 1),
('GHC', 'Ghana Cedis', '[162]', 1),
('GIP', 'Gibraltar Pound', '[163]', 1),
('GNF', 'Guinea Franc', '[70,71]', 1),
('GRD', 'Drachme (grece)', NULL, 0),
('GTQ', 'Guatemala Quetzal', '[81]', 1),
('GYD', 'Guyana Dollar', '[36]', 1),
('HKD', 'Hong Kong Dollar', '[36]', 1),
('HNL', 'Honduras Lempira', '[76]', 1),
('HRK', 'Croatia Kuna', '[107,110]', 1),
('HUF', 'Hungary Forint', '[70,116]', 1),
('IDR', 'Indonesia Rupiah', '[82,112]', 1),
('IEP', 'Livres irlandaises', NULL, 0),
('ILS', 'Israel Shekel', '[8362]', 1),
('IMP', 'Isle of Man Pound', '[163]', 1),
('INR', 'India Rupee', '[8377]', 1),
('IRR', 'Iran Rial', '[65020]', 1),
('ISK', 'Iceland Krona', '[107,114]', 1),
('ITL', 'Lires', NULL, 0),
('JEP', 'Jersey Pound', '[163]', 1),
('JMD', 'Jamaica Dollar', '[74,36]', 1),
('JPY', 'Japan Yen', '[165]', 1),
('KES', 'Kenya Shilling', NULL, 1),
('KGS', 'Kyrgyzstan Som', '[1083,1074]', 1),
('KHR', 'Cambodia Riel', '[6107]', 1),
('KPW', 'Korea (North) Won', '[8361]', 1),
('KRW', 'Korea (South) Won', '[8361]', 1),
('KYD', 'Cayman Islands Dollar', '[36]', 1),
('KZT', 'Kazakhstan Tenge', '[1083,1074]', 1),
('LAK', 'Laos Kip', '[8365]', 1),
('LBP', 'Lebanon Pound', '[163]', 1),
('LKR', 'Sri Lanka Rupee', '[8360]', 1),
('LRD', 'Liberia Dollar', '[36]', 1),
('LTL', 'Lithuania Litas', '[76,116]', 1),
('LUF', 'Francs luxembourgeois', NULL, 0),
('LVL', 'Latvia Lat', '[76,115]', 1),
('MAD', 'Morocco Dirham', NULL, 1),
('MDL', 'Moldova Leu', NULL, 1),
('MGA', 'Ariary', NULL, 1),
('MKD', 'Macedonia Denar', '[1076,1077,1085]', 1),
('MNT', 'Mongolia Tughrik', '[8366]', 1),
('MRO', 'Mauritania Ouguiya', NULL, 1),
('MUR', 'Mauritius Rupee', '[8360]', 1),
('MXN', 'Mexico Peso', '[36]', 1),
('MXP', 'Pesos Mexicans', NULL, 0),
('MYR', 'Malaysia Ringgit', '[82,77]', 1),
('MZN', 'Mozambique Metical', '[77,84]', 1),
('NAD', 'Namibia Dollar', '[36]', 1),
('NGN', 'Nigeria Naira', '[8358]', 1),
('NIO', 'Nicaragua Cordoba', '[67,36]', 1),
('NLG', 'Florins', NULL, 0),
('NOK', 'Norway Krone', '[107,114]', 1),
('NPR', 'Nepal Rupee', '[8360]', 1),
('NZD', 'New Zealand Dollar', '[36]', 1),
('OMR', 'Oman Rial', '[65020]', 1),
('PAB', 'Panama Balboa', '[66,47,46]', 1),
('PEN', 'PerĂº Sol', '[83,47]', 1),
('PHP', 'Philippines Peso', '[8369]', 1),
('PKR', 'Pakistan Rupee', '[8360]', 1),
('PLN', 'Poland Zloty', '[122,322]', 1),
('PTE', 'Escudos', NULL, 0),
('PYG', 'Paraguay Guarani', '[71,115]', 1),
('QAR', 'Qatar Riyal', '[65020]', 1),
('RON', 'Romania New Leu', '[108,101,105]', 1),
('RSD', 'Serbia Dinar', '[1044,1080,1085,46]', 1),
('RUB', 'Russia Ruble', '[1088,1091,1073]', 1),
('SAR', 'Saudi Arabia Riyal', '[65020]', 1),
('SBD', 'Solomon Islands Dollar', '[36]', 1),
('SCR', 'Seychelles Rupee', '[8360]', 1),
('SEK', 'Sweden Krona', '[107,114]', 1),
('SGD', 'Singapore Dollar', '[36]', 1),
('SHP', 'Saint Helena Pound', '[163]', 1),
('SKK', 'Couronnes slovaques', NULL, 0),
('SOS', 'Somalia Shilling', '[83]', 1),
('SRD', 'Suriname Dollar', '[36]', 1),
('SUR', 'Rouble', NULL, 0),
('SVC', 'El Salvador Colon', '[36]', 1),
('SYP', 'Syria Pound', '[163]', 1),
('THB', 'Thailand Baht', '[3647]', 1),
('TND', 'Tunisia Dinar', NULL, 1),
('TRL', 'Turkey Lira', '[84,76]', 0),
('TRY', 'Turkey Lira', '[8356]', 1),
('TTD', 'Trinidad and Tobago Dollar', '[84,84,36]', 1),
('TVD', 'Tuvalu Dollar', '[36]', 1),
('TWD', 'Taiwan New Dollar', '[78,84,36]', 1),
('UAH', 'Ukraine Hryvna', '[8372]', 1),
('USD', 'United States Dollar', '[36]', 1),
('UYU', 'Uruguay Peso', '[36,85]', 1),
('UZS', 'Uzbekistan Som', '[1083,1074]', 1),
('VEF', 'Venezuela Bolivar Fuerte', '[66,115]', 1),
('VND', 'Viet Nam Dong', '[8363]', 1),
('XAF', 'Communaute Financiere Africaine (BEAC) CFA Franc', NULL, 1),
('XCD', 'East Caribbean Dollar', '[36]', 1),
('XEU', 'Ecus', NULL, 0),
('XOF', 'Communaute Financiere Africaine (BCEAO) Franc', NULL, 1),
('XPF', 'Franc CFP', '[70]', 1),
('YER', 'Yemen Rial', '[65020]', 1),
('ZAR', 'South Africa Rand', '[82]', 1),
('ZWD', 'Zimbabwe Dollar', '[90,36]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_departements`
--

CREATE TABLE `erp_c_departements` (
  `rowid` int(11) NOT NULL,
  `code_departement` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_region` int(11) DEFAULT NULL,
  `cheflieu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `ncc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_departements`
--

INSERT INTO `erp_c_departements` (`rowid`, `code_departement`, `fk_region`, `cheflieu`, `tncc`, `ncc`, `nom`, `active`) VALUES
(1, '0', 0, '0', 0, '-', '-', 1),
(2, 'AL01', 1301, '', 0, '', 'Wilaya d\'Adrar', 1),
(3, 'AL02', 1301, '', 0, '', 'Wilaya de Chlef', 1),
(4, 'AL03', 1301, '', 0, '', 'Wilaya de Laghouat', 1),
(5, 'AL04', 1301, '', 0, '', 'Wilaya d\'Oum El Bouaghi', 1),
(6, 'AL05', 1301, '', 0, '', 'Wilaya de Batna', 1),
(7, 'AL06', 1301, '', 0, '', 'Wilaya de BĂ©jaĂ¯a', 1),
(8, 'AL07', 1301, '', 0, '', 'Wilaya de Biskra', 1),
(9, 'AL08', 1301, '', 0, '', 'Wilaya de BĂ©char', 1),
(10, 'AL09', 1301, '', 0, '', 'Wilaya de Blida', 1),
(11, 'AL10', 1301, '', 0, '', 'Wilaya de Bouira', 1),
(12, 'AL11', 1301, '', 0, '', 'Wilaya de Tamanrasset', 1),
(13, 'AL12', 1301, '', 0, '', 'Wilaya de TĂ©bessa', 1),
(14, 'AL13', 1301, '', 0, '', 'Wilaya de Tlemcen', 1),
(15, 'AL14', 1301, '', 0, '', 'Wilaya de Tiaret', 1),
(16, 'AL15', 1301, '', 0, '', 'Wilaya de Tizi Ouzou', 1),
(17, 'AL16', 1301, '', 0, '', 'Wilaya d\'Alger', 1),
(18, 'AL17', 1301, '', 0, '', 'Wilaya de Djelfa', 1),
(19, 'AL18', 1301, '', 0, '', 'Wilaya de Jijel', 1),
(20, 'AL19', 1301, '', 0, '', 'Wilaya de SĂ©tif', 1),
(21, 'AL20', 1301, '', 0, '', 'Wilaya de SaĂ¯da', 1),
(22, 'AL21', 1301, '', 0, '', 'Wilaya de Skikda', 1),
(23, 'AL22', 1301, '', 0, '', 'Wilaya de Sidi Bel AbbĂ¨s', 1),
(24, 'AL23', 1301, '', 0, '', 'Wilaya d\'Annaba', 1),
(25, 'AL24', 1301, '', 0, '', 'Wilaya de Guelma', 1),
(26, 'AL25', 1301, '', 0, '', 'Wilaya de Constantine', 1),
(27, 'AL26', 1301, '', 0, '', 'Wilaya de MĂ©dĂ©a', 1),
(28, 'AL27', 1301, '', 0, '', 'Wilaya de Mostaganem', 1),
(29, 'AL28', 1301, '', 0, '', 'Wilaya de M\'Sila', 1),
(30, 'AL29', 1301, '', 0, '', 'Wilaya de Mascara', 1),
(31, 'AL30', 1301, '', 0, '', 'Wilaya d\'Ouargla', 1),
(32, 'AL31', 1301, '', 0, '', 'Wilaya d\'Oran', 1),
(33, 'AL32', 1301, '', 0, '', 'Wilaya d\'El Bayadh', 1),
(34, 'AL33', 1301, '', 0, '', 'Wilaya d\'Illizi', 1),
(35, 'AL34', 1301, '', 0, '', 'Wilaya de Bordj Bou Arreridj', 1),
(36, 'AL35', 1301, '', 0, '', 'Wilaya de BoumerdĂ¨s', 1),
(37, 'AL36', 1301, '', 0, '', 'Wilaya d\'El Tarf', 1),
(38, 'AL37', 1301, '', 0, '', 'Wilaya de Tindouf', 1),
(39, 'AL38', 1301, '', 0, '', 'Wilaya de Tissemsilt', 1),
(40, 'AL39', 1301, '', 0, '', 'Wilaya d\'El Oued', 1),
(41, 'AL40', 1301, '', 0, '', 'Wilaya de Khenchela', 1),
(42, 'AL41', 1301, '', 0, '', 'Wilaya de Souk Ahras', 1),
(43, 'AL42', 1301, '', 0, '', 'Wilaya de Tipaza', 1),
(44, 'AL43', 1301, '', 0, '', 'Wilaya de Mila', 1),
(45, 'AL44', 1301, '', 0, '', 'Wilaya d\'AĂ¯n Defla', 1),
(46, 'AL45', 1301, '', 0, '', 'Wilaya de NaĂ¢ma', 1),
(47, 'AL46', 1301, '', 0, '', 'Wilaya d\'AĂ¯n TĂ©mouchent', 1),
(48, 'AL47', 1301, '', 0, '', 'Wilaya de Ghardaia', 1),
(49, 'AL48', 1301, '', 0, '', 'Wilaya de Relizane', 1),
(50, 'AD-002', 34000, 'AD100', NULL, NULL, 'Canillo', 1),
(51, 'AD-003', 34000, 'AD200', NULL, NULL, 'Encamp', 1),
(52, 'AD-004', 34000, 'AD400', NULL, NULL, 'La Massana', 1),
(53, 'AD-005', 34000, 'AD300', NULL, NULL, 'Ordino', 1),
(54, 'AD-006', 34000, 'AD600', NULL, NULL, 'Sant JuliĂ  de LĂ²ria', 1),
(55, 'AD-007', 34000, 'AD500', NULL, NULL, 'Andorra la Vella', 1),
(56, 'AD-008', 34000, 'AD700', NULL, NULL, 'Escaldes-Engordany', 1),
(57, 'AO-ABO', 35001, NULL, NULL, 'BENGO', 'Bengo', 1),
(58, 'AO-BGU', 35001, NULL, NULL, 'BENGUELA', 'Benguela', 1),
(59, 'AO-BIE', 35001, NULL, NULL, 'BIĂ‰', 'BiĂ©', 1),
(60, 'AO-CAB', 35001, NULL, NULL, 'CABINDA', 'Cabinda', 1),
(61, 'AO-CCU', 35001, NULL, NULL, 'KUANDO KUBANGO', 'Kuando Kubango', 1),
(62, 'AO-CNO', 35001, NULL, NULL, 'KWANZA NORTE', 'Kwanza Norte', 1),
(63, 'AO-CUS', 35001, NULL, NULL, 'KWANZA SUL', 'Kwanza Sul', 1),
(64, 'AO-CNN', 35001, NULL, NULL, 'CUNENE', 'Cunene', 1),
(65, 'AO-HUA', 35001, NULL, NULL, 'HUAMBO', 'Huambo', 1),
(66, 'AO-HUI', 35001, NULL, NULL, 'HUĂLA', 'Huila', 1),
(67, 'AO-LUA', 35001, NULL, NULL, 'LUANDA', 'Luanda', 1),
(68, 'AO-LNO', 35001, NULL, NULL, 'LUNDA-NORTE', 'Lunda-Norte', 1),
(69, 'AO-LSU', 35001, NULL, NULL, 'LUNDA-SUL', 'Lunda-Sul', 1),
(70, 'AO-MAL', 35001, NULL, NULL, 'MALANGE', 'Malange', 1),
(71, 'AO-MOX', 35001, NULL, NULL, 'MOXICO', 'Moxico', 1),
(72, 'AO-NAM', 35001, NULL, NULL, 'NAMĂBE', 'NamĂ­be', 1),
(73, 'AO-UIG', 35001, NULL, NULL, 'UĂGE', 'UĂ­ge', 1),
(74, 'AO-ZAI', 35001, NULL, NULL, 'ZAĂRE', 'ZaĂ­re', 1),
(75, '2301', 2301, '', 0, 'CATAMARCA', 'Catamarca', 1),
(76, '2302', 2301, '', 0, 'JUJUY', 'Jujuy', 1),
(77, '2303', 2301, '', 0, 'TUCAMAN', 'TucamĂ¡n', 1),
(78, '2304', 2301, '', 0, 'SANTIAGO DEL ESTERO', 'Santiago del Estero', 1),
(79, '2305', 2301, '', 0, 'SALTA', 'Salta', 1),
(80, '2306', 2302, '', 0, 'CHACO', 'Chaco', 1),
(81, '2307', 2302, '', 0, 'CORRIENTES', 'Corrientes', 1),
(82, '2308', 2302, '', 0, 'ENTRE RIOS', 'Entre RĂ­os', 1),
(83, '2309', 2302, '', 0, 'FORMOSA', 'Formosa', 1),
(84, '2310', 2302, '', 0, 'SANTA FE', 'Santa Fe', 1),
(85, '2311', 2303, '', 0, 'LA RIOJA', 'La Rioja', 1),
(86, '2312', 2303, '', 0, 'MENDOZA', 'Mendoza', 1),
(87, '2313', 2303, '', 0, 'SAN JUAN', 'San Juan', 1),
(88, '2314', 2303, '', 0, 'SAN LUIS', 'San Luis', 1),
(89, '2315', 2304, '', 0, 'CORDOBA', 'CĂ³rdoba', 1),
(90, '2316', 2304, '', 0, 'BUENOS AIRES', 'Buenos Aires', 1),
(91, '2317', 2304, '', 0, 'CABA', 'Caba', 1),
(92, '2318', 2305, '', 0, 'LA PAMPA', 'La Pampa', 1),
(93, '2319', 2305, '', 0, 'NEUQUEN', 'NeuquĂ©n', 1),
(94, '2320', 2305, '', 0, 'RIO NEGRO', 'RĂ­o Negro', 1),
(95, '2321', 2305, '', 0, 'CHUBUT', 'Chubut', 1),
(96, '2322', 2305, '', 0, 'SANTA CRUZ', 'Santa Cruz', 1),
(97, '2323', 2305, '', 0, 'TIERRA DEL FUEGO', 'Tierra del Fuego', 1),
(98, '2324', 2305, '', 0, 'ISLAS MALVINAS', 'Islas Malvinas', 1),
(99, '2325', 2305, '', 0, 'ANTARTIDA', 'AntĂ¡rtida', 1),
(100, '2326', 2305, '', 0, 'MISIONES', 'Misiones', 1),
(101, 'NSW', 2801, '', 1, '', 'New South Wales', 1),
(102, 'VIC', 2801, '', 1, '', 'Victoria', 1),
(103, 'QLD', 2801, '', 1, '', 'Queensland', 1),
(104, 'SA', 2801, '', 1, '', 'South Australia', 1),
(105, 'ACT', 2801, '', 1, '', 'Australia Capital Territory', 1),
(106, 'TAS', 2801, '', 1, '', 'Tasmania', 1),
(107, 'WA', 2801, '', 1, '', 'Western Australia', 1),
(108, 'NT', 2801, '', 1, '', 'Northern Territory', 1),
(109, 'B', 4101, NULL, NULL, 'BURGENLAND', 'Burgenland', 1),
(110, 'K', 4101, NULL, NULL, 'KAERNTEN', 'KĂ¤rnten', 1),
(111, 'N', 4101, NULL, NULL, 'NIEDEROESTERREICH', 'NiederĂ¶sterreich', 1),
(112, 'O', 4101, NULL, NULL, 'OBEROESTERREICH', 'OberĂ¶sterreich', 1),
(113, 'S', 4101, NULL, NULL, 'SALZBURG', 'Salzburg', 1),
(114, 'ST', 4101, NULL, NULL, 'STEIERMARK', 'Steiermark', 1),
(115, 'T', 4101, NULL, NULL, 'TIROL', 'Tirol', 1),
(116, 'V', 4101, NULL, NULL, 'VORARLBERG', 'Vorarlberg', 1),
(117, 'W', 4101, NULL, NULL, 'WIEN', 'Wien', 1),
(118, 'CC', 4601, 'Oistins', 0, 'CC', 'Christ Church', 1),
(119, 'SA', 4601, 'Greenland', 0, 'SA', 'Saint Andrew', 1),
(120, 'SG', 4601, 'Bulkeley', 0, 'SG', 'Saint George', 1),
(121, 'JA', 4601, 'Holetown', 0, 'JA', 'Saint James', 1),
(122, 'SJ', 4601, 'Four Roads', 0, 'SJ', 'Saint John', 1),
(123, 'SB', 4601, 'Bathsheba', 0, 'SB', 'Saint Joseph', 1),
(124, 'SL', 4601, 'Crab Hill', 0, 'SL', 'Saint Lucy', 1),
(125, 'SM', 4601, 'Bridgetown', 0, 'SM', 'Saint Michael', 1),
(126, 'SP', 4601, 'Speightstown', 0, 'SP', 'Saint Peter', 1),
(127, 'SC', 4601, 'Crane', 0, 'SC', 'Saint Philip', 1),
(128, 'ST', 4601, 'Hillaby', 0, 'ST', 'Saint Thomas', 1),
(129, '01', 201, '', 1, 'ANVERS', 'Anvers', 1),
(130, '02', 203, '', 3, 'BRUXELLES-CAPITALE', 'Bruxelles-Capitale', 1),
(131, '03', 202, '', 2, 'BRABANT-WALLON', 'Brabant-Wallon', 1),
(132, '04', 201, '', 1, 'BRABANT-FLAMAND', 'Brabant-Flamand', 1),
(133, '05', 201, '', 1, 'FLANDRE-OCCIDENTALE', 'Flandre-Occidentale', 1),
(134, '06', 201, '', 1, 'FLANDRE-ORIENTALE', 'Flandre-Orientale', 1),
(135, '07', 202, '', 2, 'HAINAUT', 'Hainaut', 1),
(136, '08', 201, '', 2, 'LIEGE', 'LiĂ¨ge', 1),
(137, '09', 202, '', 1, 'LIMBOURG', 'Limbourg', 1),
(138, '10', 202, '', 2, 'LUXEMBOURG', 'Luxembourg', 1),
(139, '11', 201, '', 2, 'NAMUR', 'Namur', 1),
(140, 'AC', 5601, 'ACRE', 0, 'AC', 'Acre', 1),
(141, 'AL', 5601, 'ALAGOAS', 0, 'AL', 'Alagoas', 1),
(142, 'AP', 5601, 'AMAPA', 0, 'AP', 'AmapĂ¡', 1),
(143, 'AM', 5601, 'AMAZONAS', 0, 'AM', 'Amazonas', 1),
(144, 'BA', 5601, 'BAHIA', 0, 'BA', 'Bahia', 1),
(145, 'CE', 5601, 'CEARA', 0, 'CE', 'CearĂ¡', 1),
(146, 'ES', 5601, 'ESPIRITO SANTO', 0, 'ES', 'Espirito Santo', 1),
(147, 'GO', 5601, 'GOIAS', 0, 'GO', 'GoiĂ¡s', 1),
(148, 'MA', 5601, 'MARANHAO', 0, 'MA', 'MaranhĂ£o', 1),
(149, 'MT', 5601, 'MATO GROSSO', 0, 'MT', 'Mato Grosso', 1),
(150, 'MS', 5601, 'MATO GROSSO DO SUL', 0, 'MS', 'Mato Grosso do Sul', 1),
(151, 'MG', 5601, 'MINAS GERAIS', 0, 'MG', 'Minas Gerais', 1),
(152, 'PA', 5601, 'PARA', 0, 'PA', 'ParĂ¡', 1),
(153, 'PB', 5601, 'PARAIBA', 0, 'PB', 'Paraiba', 1),
(154, 'PR', 5601, 'PARANA', 0, 'PR', 'ParanĂ¡', 1),
(155, 'PE', 5601, 'PERNAMBUCO', 0, 'PE', 'Pernambuco', 1),
(156, 'PI', 5601, 'PIAUI', 0, 'PI', 'PiauĂ­', 1),
(157, 'RJ', 5601, 'RIO DE JANEIRO', 0, 'RJ', 'Rio de Janeiro', 1),
(158, 'RN', 5601, 'RIO GRANDE DO NORTE', 0, 'RN', 'Rio Grande do Norte', 1),
(159, 'RS', 5601, 'RIO GRANDE DO SUL', 0, 'RS', 'Rio Grande do Sul', 1),
(160, 'RO', 5601, 'RONDONIA', 0, 'RO', 'RondĂ´nia', 1),
(161, 'RR', 5601, 'RORAIMA', 0, 'RR', 'Roraima', 1),
(162, 'SC', 5601, 'SANTA CATARINA', 0, 'SC', 'Santa Catarina', 1),
(163, 'SE', 5601, 'SERGIPE', 0, 'SE', 'Sergipe', 1),
(164, 'SP', 5601, 'SAO PAULO', 0, 'SP', 'Sao Paulo', 1),
(165, 'TO', 5601, 'TOCANTINS', 0, 'TO', 'Tocantins', 1),
(166, 'DF', 5601, 'DISTRITO FEDERAL', 0, 'DF', 'Distrito Federal', 1),
(167, 'ON', 1401, '', 1, '', 'Ontario', 1),
(168, 'QC', 1401, '', 1, '', 'Quebec', 1),
(169, 'NS', 1401, '', 1, '', 'Nova Scotia', 1),
(170, 'NB', 1401, '', 1, '', 'New Brunswick', 1),
(171, 'MB', 1401, '', 1, '', 'Manitoba', 1),
(172, 'BC', 1401, '', 1, '', 'British Columbia', 1),
(173, 'PE', 1401, '', 1, '', 'Prince Edward Island', 1),
(174, 'SK', 1401, '', 1, '', 'Saskatchewan', 1),
(175, 'AB', 1401, '', 1, '', 'Alberta', 1),
(176, 'NL', 1401, '', 1, '', 'Newfoundland and Labrador', 1),
(177, '011', 6701, '', 0, '011', 'Iquique', 1),
(178, '014', 6701, '', 0, '014', 'Tamarugal', 1),
(179, '021', 6702, '', 0, '021', 'Antofagasa', 1),
(180, '022', 6702, '', 0, '022', 'El Loa', 1),
(181, '023', 6702, '', 0, '023', 'Tocopilla', 1),
(182, '031', 6703, '', 0, '031', 'CopiapĂ³', 1),
(183, '032', 6703, '', 0, '032', 'ChaĂ±aral', 1),
(184, '033', 6703, '', 0, '033', 'Huasco', 1),
(185, '041', 6704, '', 0, '041', 'Elqui', 1),
(186, '042', 6704, '', 0, '042', 'Choapa', 1),
(187, '043', 6704, '', 0, '043', 'LimarĂ­', 1),
(188, '051', 6705, '', 0, '051', 'ValparaĂ­so', 1),
(189, '052', 6705, '', 0, '052', 'Isla de Pascua', 1),
(190, '053', 6705, '', 0, '053', 'Los Andes', 1),
(191, '054', 6705, '', 0, '054', 'Petorca', 1),
(192, '055', 6705, '', 0, '055', 'Quillota', 1),
(193, '056', 6705, '', 0, '056', 'San Antonio', 1),
(194, '057', 6705, '', 0, '057', 'San Felipe de Aconcagua', 1),
(195, '058', 6705, '', 0, '058', 'Marga Marga', 1),
(196, '061', 6706, '', 0, '061', 'Cachapoal', 1),
(197, '062', 6706, '', 0, '062', 'Cardenal Caro', 1),
(198, '063', 6706, '', 0, '063', 'Colchagua', 1),
(199, '071', 6707, '', 0, '071', 'Talca', 1),
(200, '072', 6707, '', 0, '072', 'Cauquenes', 1),
(201, '073', 6707, '', 0, '073', 'CuricĂ³', 1),
(202, '074', 6707, '', 0, '074', 'Linares', 1),
(203, '081', 6708, '', 0, '081', 'ConcepciĂ³n', 1),
(204, '082', 6708, '', 0, '082', 'Arauco', 1),
(205, '083', 6708, '', 0, '083', 'BiobĂ­o', 1),
(206, '084', 6708, '', 0, '084', 'Ă‘uble', 1),
(207, '091', 6709, '', 0, '091', 'CautĂ­n', 1),
(208, '092', 6709, '', 0, '092', 'Malleco', 1),
(209, '101', 6710, '', 0, '101', 'Llanquihue', 1),
(210, '102', 6710, '', 0, '102', 'ChiloĂ©', 1),
(211, '103', 6710, '', 0, '103', 'Osorno', 1),
(212, '104', 6710, '', 0, '104', 'Palena', 1),
(213, '111', 6711, '', 0, '111', 'Coihaique', 1),
(214, '112', 6711, '', 0, '112', 'AisĂ©n', 1),
(215, '113', 6711, '', 0, '113', 'CapitĂ¡n Prat', 1),
(216, '114', 6711, '', 0, '114', 'General Carrera', 1),
(217, '121', 6712, '', 0, '121', 'Magallanes', 1),
(218, '122', 6712, '', 0, '122', 'AntĂ¡rtica Chilena', 1),
(219, '123', 6712, '', 0, '123', 'Tierra del Fuego', 1),
(220, '124', 6712, '', 0, '124', 'Ăltima Esperanza', 1),
(221, '131', 6713, '', 0, '131', 'Santiago', 1),
(222, '132', 6713, '', 0, '132', 'Cordillera', 1),
(223, '133', 6713, '', 0, '133', 'Chacabuco', 1),
(224, '134', 6713, '', 0, '134', 'Maipo', 1),
(225, '135', 6713, '', 0, '135', 'Melipilla', 1),
(226, '136', 6713, '', 0, '136', 'Talagante', 1),
(227, '141', 6714, '', 0, '141', 'Valdivia', 1),
(228, '142', 6714, '', 0, '142', 'Ranco', 1),
(229, '151', 6715, '', 0, '151', 'Arica', 1),
(230, '152', 6715, '', 0, '152', 'Parinacota', 1),
(231, 'ANT', 7001, '', 0, 'ANT', 'Antioquia', 1),
(232, 'BOL', 7001, '', 0, 'BOL', 'BolĂ­var', 1),
(233, 'BOY', 7001, '', 0, 'BOY', 'BoyacĂ¡', 1),
(234, 'CAL', 7001, '', 0, 'CAL', 'Caldas', 1),
(235, 'CAU', 7001, '', 0, 'CAU', 'Cauca', 1),
(236, 'CUN', 7001, '', 0, 'CUN', 'Cundinamarca', 1),
(237, 'HUI', 7001, '', 0, 'HUI', 'Huila', 1),
(238, 'LAG', 7001, '', 0, 'LAG', 'La Guajira', 1),
(239, 'MET', 7001, '', 0, 'MET', 'Meta', 1),
(240, 'NAR', 7001, '', 0, 'NAR', 'NariĂ±o', 1),
(241, 'NDS', 7001, '', 0, 'NDS', 'Norte de Santander', 1),
(242, 'SAN', 7001, '', 0, 'SAN', 'Santander', 1),
(243, 'SUC', 7001, '', 0, 'SUC', 'Sucre', 1),
(244, 'TOL', 7001, '', 0, 'TOL', 'Tolima', 1),
(245, 'VAC', 7001, '', 0, 'VAC', 'Valle del Cauca', 1),
(246, 'RIS', 7001, '', 0, 'RIS', 'Risalda', 1),
(247, 'ATL', 7001, '', 0, 'ATL', 'AtlĂ¡ntico', 1),
(248, 'COR', 7001, '', 0, 'COR', 'CĂ³rdoba', 1),
(249, 'SAP', 7001, '', 0, 'SAP', 'San AndrĂ©s, Providencia y Santa Catalina', 1),
(250, 'ARA', 7001, '', 0, 'ARA', 'Arauca', 1),
(251, 'CAS', 7001, '', 0, 'CAS', 'Casanare', 1),
(252, 'AMA', 7001, '', 0, 'AMA', 'Amazonas', 1),
(253, 'CAQ', 7001, '', 0, 'CAQ', 'CaquetĂ¡', 1),
(254, 'CHO', 7001, '', 0, 'CHO', 'ChocĂ³', 1),
(255, 'GUA', 7001, '', 0, 'GUA', 'GuainĂ­a', 1),
(256, 'GUV', 7001, '', 0, 'GUV', 'Guaviare', 1),
(257, 'PUT', 7001, '', 0, 'PUT', 'Putumayo', 1),
(258, 'QUI', 7001, '', 0, 'QUI', 'QuindĂ­o', 1),
(259, 'VAU', 7001, '', 0, 'VAU', 'VaupĂ©s', 1),
(260, 'BOG', 7001, '', 0, 'BOG', 'BogotĂ¡', 1),
(261, 'VID', 7001, '', 0, 'VID', 'Vichada', 1),
(262, 'CES', 7001, '', 0, 'CES', 'Cesar', 1),
(263, 'MAG', 7001, '', 0, 'MAG', 'Magdalena', 1),
(264, '971', 1, '97105', 3, 'GUADELOUPE', 'Guadeloupe', 1),
(265, '972', 2, '97209', 3, 'MARTINIQUE', 'Martinique', 1),
(266, '973', 3, '97302', 3, 'GUYANE', 'Guyane', 1),
(267, '974', 4, '97411', 3, 'REUNION', 'RĂ©union', 1),
(268, '976', 6, '97601', 3, 'MAYOTTE', 'Mayotte', 1),
(269, '01', 84, '01053', 5, 'AIN', 'Ain', 1),
(270, '02', 32, '02408', 5, 'AISNE', 'Aisne', 1),
(271, '03', 84, '03190', 5, 'ALLIER', 'Allier', 1),
(272, '04', 93, '04070', 4, 'ALPES-DE-HAUTE-PROVENCE', 'Alpes-de-Haute-Provence', 1),
(273, '05', 93, '05061', 4, 'HAUTES-ALPES', 'Hautes-Alpes', 1),
(274, '06', 93, '06088', 4, 'ALPES-MARITIMES', 'Alpes-Maritimes', 1),
(275, '07', 84, '07186', 5, 'ARDECHE', 'ArdĂ¨che', 1),
(276, '08', 44, '08105', 4, 'ARDENNES', 'Ardennes', 1),
(277, '09', 76, '09122', 5, 'ARIEGE', 'AriĂ¨ge', 1),
(278, '10', 44, '10387', 5, 'AUBE', 'Aube', 1),
(279, '11', 76, '11069', 5, 'AUDE', 'Aude', 1),
(280, '12', 76, '12202', 5, 'AVEYRON', 'Aveyron', 1),
(281, '13', 93, '13055', 4, 'BOUCHES-DU-RHONE', 'Bouches-du-RhĂ´ne', 1),
(282, '14', 28, '14118', 2, 'CALVADOS', 'Calvados', 1),
(283, '15', 84, '15014', 2, 'CANTAL', 'Cantal', 1),
(284, '16', 75, '16015', 3, 'CHARENTE', 'Charente', 1),
(285, '17', 75, '17300', 3, 'CHARENTE-MARITIME', 'Charente-Maritime', 1),
(286, '18', 24, '18033', 2, 'CHER', 'Cher', 1),
(287, '19', 75, '19272', 3, 'CORREZE', 'CorrĂ¨ze', 1),
(288, '2A', 94, '2A004', 3, 'CORSE-DU-SUD', 'Corse-du-Sud', 1),
(289, '2B', 94, '2B033', 3, 'HAUTE-CORSE', 'Haute-Corse', 1),
(290, '21', 27, '21231', 3, 'COTE-D OR', 'CĂ´te-d Or', 1),
(291, '22', 53, '22278', 4, 'COTES-D ARMOR', 'CĂ´tes-d Armor', 1),
(292, '23', 75, '23096', 3, 'CREUSE', 'Creuse', 1),
(293, '24', 75, '24322', 3, 'DORDOGNE', 'Dordogne', 1),
(294, '25', 27, '25056', 2, 'DOUBS', 'Doubs', 1),
(295, '26', 84, '26362', 3, 'DROME', 'DrĂ´me', 1),
(296, '27', 28, '27229', 5, 'EURE', 'Eure', 1),
(297, '28', 24, '28085', 1, 'EURE-ET-LOIR', 'Eure-et-Loir', 1),
(298, '29', 53, '29232', 2, 'FINISTERE', 'FinistĂ¨re', 1),
(299, '30', 76, '30189', 2, 'GARD', 'Gard', 1),
(300, '31', 76, '31555', 3, 'HAUTE-GARONNE', 'Haute-Garonne', 1),
(301, '32', 76, '32013', 2, 'GERS', 'Gers', 1),
(302, '33', 75, '33063', 3, 'GIRONDE', 'Gironde', 1),
(303, '34', 76, '34172', 5, 'HERAULT', 'HĂ©rault', 1),
(304, '35', 53, '35238', 1, 'ILLE-ET-VILAINE', 'Ille-et-Vilaine', 1),
(305, '36', 24, '36044', 5, 'INDRE', 'Indre', 1),
(306, '37', 24, '37261', 1, 'INDRE-ET-LOIRE', 'Indre-et-Loire', 1),
(307, '38', 84, '38185', 5, 'ISERE', 'IsĂ¨re', 1),
(308, '39', 27, '39300', 2, 'JURA', 'Jura', 1),
(309, '40', 75, '40192', 4, 'LANDES', 'Landes', 1),
(310, '41', 24, '41018', 0, 'LOIR-ET-CHER', 'Loir-et-Cher', 1),
(311, '42', 84, '42218', 3, 'LOIRE', 'Loire', 1),
(312, '43', 84, '43157', 3, 'HAUTE-LOIRE', 'Haute-Loire', 1),
(313, '44', 52, '44109', 3, 'LOIRE-ATLANTIQUE', 'Loire-Atlantique', 1),
(314, '45', 24, '45234', 2, 'LOIRET', 'Loiret', 1),
(315, '46', 76, '46042', 2, 'LOT', 'Lot', 1),
(316, '47', 75, '47001', 0, 'LOT-ET-GARONNE', 'Lot-et-Garonne', 1),
(317, '48', 76, '48095', 3, 'LOZERE', 'LozĂ¨re', 1),
(318, '49', 52, '49007', 0, 'MAINE-ET-LOIRE', 'Maine-et-Loire', 1),
(319, '50', 28, '50502', 3, 'MANCHE', 'Manche', 1),
(320, '51', 44, '51108', 3, 'MARNE', 'Marne', 1),
(321, '52', 44, '52121', 3, 'HAUTE-MARNE', 'Haute-Marne', 1),
(322, '53', 52, '53130', 3, 'MAYENNE', 'Mayenne', 1),
(323, '54', 44, '54395', 0, 'MEURTHE-ET-MOSELLE', 'Meurthe-et-Moselle', 1),
(324, '55', 44, '55029', 3, 'MEUSE', 'Meuse', 1),
(325, '56', 53, '56260', 2, 'MORBIHAN', 'Morbihan', 1),
(326, '57', 44, '57463', 3, 'MOSELLE', 'Moselle', 1),
(327, '58', 27, '58194', 3, 'NIEVRE', 'NiĂ¨vre', 1),
(328, '59', 32, '59350', 2, 'NORD', 'Nord', 1),
(329, '60', 32, '60057', 5, 'OISE', 'Oise', 1),
(330, '61', 28, '61001', 5, 'ORNE', 'Orne', 1),
(331, '62', 32, '62041', 2, 'PAS-DE-CALAIS', 'Pas-de-Calais', 1),
(332, '63', 84, '63113', 2, 'PUY-DE-DOME', 'Puy-de-DĂ´me', 1),
(333, '64', 75, '64445', 4, 'PYRENEES-ATLANTIQUES', 'PyrĂ©nĂ©es-Atlantiques', 1),
(334, '65', 76, '65440', 4, 'HAUTES-PYRENEES', 'Hautes-PyrĂ©nĂ©es', 1),
(335, '66', 76, '66136', 4, 'PYRENEES-ORIENTALES', 'PyrĂ©nĂ©es-Orientales', 1),
(336, '67', 44, '67482', 2, 'BAS-RHIN', 'Bas-Rhin', 1),
(337, '68', 44, '68066', 2, 'HAUT-RHIN', 'Haut-Rhin', 1),
(338, '69', 84, '69123', 2, 'RHONE', 'RhĂ´ne', 1),
(339, '70', 27, '70550', 3, 'HAUTE-SAONE', 'Haute-SaĂ´ne', 1),
(340, '71', 27, '71270', 0, 'SAONE-ET-LOIRE', 'SaĂ´ne-et-Loire', 1),
(341, '72', 52, '72181', 3, 'SARTHE', 'Sarthe', 1),
(342, '73', 84, '73065', 3, 'SAVOIE', 'Savoie', 1),
(343, '74', 84, '74010', 3, 'HAUTE-SAVOIE', 'Haute-Savoie', 1),
(344, '75', 11, '75056', 0, 'PARIS', 'Paris', 1),
(345, '76', 28, '76540', 3, 'SEINE-MARITIME', 'Seine-Maritime', 1),
(346, '77', 11, '77288', 0, 'SEINE-ET-MARNE', 'Seine-et-Marne', 1),
(347, '78', 11, '78646', 4, 'YVELINES', 'Yvelines', 1),
(348, '79', 75, '79191', 4, 'DEUX-SEVRES', 'Deux-SĂ¨vres', 1),
(349, '80', 32, '80021', 3, 'SOMME', 'Somme', 1),
(350, '81', 76, '81004', 2, 'TARN', 'Tarn', 1),
(351, '82', 76, '82121', 0, 'TARN-ET-GARONNE', 'Tarn-et-Garonne', 1),
(352, '83', 93, '83137', 2, 'VAR', 'Var', 1),
(353, '84', 93, '84007', 0, 'VAUCLUSE', 'Vaucluse', 1),
(354, '85', 52, '85191', 3, 'VENDEE', 'VendĂ©e', 1),
(355, '86', 75, '86194', 3, 'VIENNE', 'Vienne', 1),
(356, '87', 75, '87085', 3, 'HAUTE-VIENNE', 'Haute-Vienne', 1),
(357, '88', 44, '88160', 4, 'VOSGES', 'Vosges', 1),
(358, '89', 27, '89024', 5, 'YONNE', 'Yonne', 1),
(359, '90', 27, '90010', 0, 'TERRITOIRE DE BELFORT', 'Territoire de Belfort', 1),
(360, '91', 11, '91228', 5, 'ESSONNE', 'Essonne', 1),
(361, '92', 11, '92050', 4, 'HAUTS-DE-SEINE', 'Hauts-de-Seine', 1),
(362, '93', 11, '93008', 3, 'SEINE-SAINT-DENIS', 'Seine-Saint-Denis', 1),
(363, '94', 11, '94028', 2, 'VAL-DE-MARNE', 'Val-de-Marne', 1),
(364, '95', 11, '95500', 2, 'VAL-D OISE', 'Val-d Oise', 1),
(365, 'BW', 501, NULL, NULL, 'BADEN-WĂœRTTEMBERG', 'Baden-WĂ¼rttemberg', 1),
(366, 'BY', 501, NULL, NULL, 'BAYERN', 'Bayern', 1),
(367, 'BE', 501, NULL, NULL, 'BERLIN', 'Berlin', 1),
(368, 'BB', 501, NULL, NULL, 'BRANDENBURG', 'Brandenburg', 1),
(369, 'HB', 501, NULL, NULL, 'BREMEN', 'Bremen', 1),
(370, 'HH', 501, NULL, NULL, 'HAMBURG', 'Hamburg', 1),
(371, 'HE', 501, NULL, NULL, 'HESSEN', 'Hessen', 1),
(372, 'MV', 501, NULL, NULL, 'MECKLENBURG-VORPOMMERN', 'Mecklenburg-Vorpommern', 1),
(373, 'NI', 501, NULL, NULL, 'NIEDERSACHSEN', 'Niedersachsen', 1),
(374, 'NW', 501, NULL, NULL, 'NORDRHEIN-WESTFALEN', 'Nordrhein-Westfalen', 1),
(375, 'RP', 501, NULL, NULL, 'RHEINLAND-PFALZ', 'Rheinland-Pfalz', 1),
(376, 'SL', 501, NULL, NULL, 'SAARLAND', 'Saarland', 1),
(377, 'SN', 501, NULL, NULL, 'SACHSEN', 'Sachsen', 1),
(378, 'ST', 501, NULL, NULL, 'SACHSEN-ANHALT', 'Sachsen-Anhalt', 1),
(379, 'SH', 501, NULL, NULL, 'SCHLESWIG-HOLSTEIN', 'Schleswig-Holstein', 1),
(380, 'TH', 501, NULL, NULL, 'THĂœRINGEN', 'ThĂ¼ringen', 1),
(381, 'AT', 11401, '', 0, 'AT', 'AtlĂ¡ntida', 1),
(382, 'CH', 11401, '', 0, 'CH', 'Choluteca', 1),
(383, 'CL', 11401, '', 0, 'CL', 'ColĂ³n', 1),
(384, 'CM', 11401, '', 0, 'CM', 'Comayagua', 1),
(385, 'CO', 11401, '', 0, 'CO', 'CopĂ¡n', 1),
(386, 'CR', 11401, '', 0, 'CR', 'CortĂ©s', 1),
(387, 'EP', 11401, '', 0, 'EP', 'El ParaĂ­so', 1),
(388, 'FM', 11401, '', 0, 'FM', 'Francisco MorazĂ¡n', 1),
(389, 'GD', 11401, '', 0, 'GD', 'Gracias a Dios', 1),
(390, 'IN', 11401, '', 0, 'IN', 'IntibucĂ¡', 1),
(391, 'IB', 11401, '', 0, 'IB', 'Islas de la BahĂ­a', 1),
(392, 'LP', 11401, '', 0, 'LP', 'La Paz', 1),
(393, 'LM', 11401, '', 0, 'LM', 'Lempira', 1),
(394, 'OC', 11401, '', 0, 'OC', 'Ocotepeque', 1),
(395, 'OL', 11401, '', 0, 'OL', 'Olancho', 1),
(396, 'SB', 11401, '', 0, 'SB', 'Santa BĂ¡rbara', 1),
(397, 'VL', 11401, '', 0, 'VL', 'Valle', 1),
(398, 'YO', 11401, '', 0, 'YO', 'Yoro', 1),
(399, 'DC', 11401, '', 0, 'DC', 'Distrito Central', 1),
(400, 'HU-BU', 180100, 'HU101', NULL, NULL, 'Budapest', 1),
(401, 'HU-PE', 180100, 'HU102', NULL, NULL, 'Pest', 1),
(402, 'HU-FE', 182100, 'HU211', NULL, NULL, 'FejĂ©r', 1),
(403, 'HU-KE', 182100, 'HU212', NULL, NULL, 'KomĂ¡rom-Esztergom', 1),
(404, 'HU-VE', 182100, 'HU213', NULL, NULL, 'VeszprĂ©m', 1),
(405, 'HU-GS', 182200, 'HU221', NULL, NULL, 'GyÅ‘r-Moson-Sopron', 1),
(406, 'HU-VA', 182200, 'HU222', NULL, NULL, 'Vas', 1),
(407, 'HU-ZA', 182200, 'HU223', NULL, NULL, 'Zala', 1),
(408, 'HU-BA', 182300, 'HU231', NULL, NULL, 'Baranya', 1),
(409, 'HU-SO', 182300, 'HU232', NULL, NULL, 'Somogy', 1),
(410, 'HU-TO', 182300, 'HU233', NULL, NULL, 'Tolna', 1),
(411, 'HU-BZ', 183100, 'HU311', NULL, NULL, 'Borsod-AbaĂºj-ZemplĂ©n', 1),
(412, 'HU-HE', 183100, 'HU312', NULL, NULL, 'Heves', 1),
(413, 'HU-NO', 183100, 'HU313', NULL, NULL, 'NĂ³grĂ¡d', 1),
(414, 'HU-HB', 183200, 'HU321', NULL, NULL, 'HajdĂº-Bihar', 1),
(415, 'HU-JN', 183200, 'HU322', NULL, NULL, 'JĂ¡sz-Nagykun-Szolnok', 1),
(416, 'HU-SZ', 183200, 'HU323', NULL, NULL, 'Szabolcs-SzatmĂ¡r-Bereg', 1),
(417, 'HU-BK', 183300, 'HU331', NULL, NULL, 'BĂ¡cs-Kiskun', 1),
(418, 'HU-BE', 183300, 'HU332', NULL, NULL, 'BĂ©kĂ©s', 1),
(419, 'HU-CS', 183300, 'HU333', NULL, NULL, 'CsongrĂ¡d', 1),
(420, 'AG', 315, NULL, NULL, NULL, 'AGRIGENTO', 1),
(421, 'AL', 312, NULL, NULL, NULL, 'ALESSANDRIA', 1),
(422, 'AN', 310, NULL, NULL, NULL, 'ANCONA', 1),
(423, 'AO', 319, NULL, NULL, NULL, 'AOSTA', 1),
(424, 'AR', 316, NULL, NULL, NULL, 'AREZZO', 1),
(425, 'AP', 310, NULL, NULL, NULL, 'ASCOLI PICENO', 1),
(426, 'AT', 312, NULL, NULL, NULL, 'ASTI', 1),
(427, 'AV', 304, NULL, NULL, NULL, 'AVELLINO', 1),
(428, 'BA', 313, NULL, NULL, NULL, 'BARI', 1),
(429, 'BT', 313, NULL, NULL, NULL, 'BARLETTA-ANDRIA-TRANI', 1),
(430, 'BL', 320, NULL, NULL, NULL, 'BELLUNO', 1),
(431, 'BN', 304, NULL, NULL, NULL, 'BENEVENTO', 1),
(432, 'BG', 309, NULL, NULL, NULL, 'BERGAMO', 1),
(433, 'BI', 312, NULL, NULL, NULL, 'BIELLA', 1),
(434, 'BO', 305, NULL, NULL, NULL, 'BOLOGNA', 1),
(435, 'BZ', 317, NULL, NULL, NULL, 'BOLZANO', 1),
(436, 'BS', 309, NULL, NULL, NULL, 'BRESCIA', 1),
(437, 'BR', 313, NULL, NULL, NULL, 'BRINDISI', 1),
(438, 'CA', 314, NULL, NULL, NULL, 'CAGLIARI', 1),
(439, 'CL', 315, NULL, NULL, NULL, 'CALTANISSETTA', 1),
(440, 'CB', 311, NULL, NULL, NULL, 'CAMPOBASSO', 1),
(441, 'CI', 314, NULL, NULL, NULL, 'CARBONIA-IGLESIAS', 1),
(442, 'CE', 304, NULL, NULL, NULL, 'CASERTA', 1),
(443, 'CT', 315, NULL, NULL, NULL, 'CATANIA', 1),
(444, 'CZ', 303, NULL, NULL, NULL, 'CATANZARO', 1),
(445, 'CH', 301, NULL, NULL, NULL, 'CHIETI', 1),
(446, 'CO', 309, NULL, NULL, NULL, 'COMO', 1),
(447, 'CS', 303, NULL, NULL, NULL, 'COSENZA', 1),
(448, 'CR', 309, NULL, NULL, NULL, 'CREMONA', 1),
(449, 'KR', 303, NULL, NULL, NULL, 'CROTONE', 1),
(450, 'CN', 312, NULL, NULL, NULL, 'CUNEO', 1),
(451, 'EN', 315, NULL, NULL, NULL, 'ENNA', 1),
(452, 'FM', 310, NULL, NULL, NULL, 'FERMO', 1),
(453, 'FE', 305, NULL, NULL, NULL, 'FERRARA', 1),
(454, 'FI', 316, NULL, NULL, NULL, 'FIRENZE', 1),
(455, 'FG', 313, NULL, NULL, NULL, 'FOGGIA', 1),
(456, 'FC', 305, NULL, NULL, NULL, 'FORLI-CESENA', 1),
(457, 'FR', 307, NULL, NULL, NULL, 'FROSINONE', 1),
(458, 'GE', 308, NULL, NULL, NULL, 'GENOVA', 1),
(459, 'GO', 306, NULL, NULL, NULL, 'GORIZIA', 1),
(460, 'GR', 316, NULL, NULL, NULL, 'GROSSETO', 1),
(461, 'IM', 308, NULL, NULL, NULL, 'IMPERIA', 1),
(462, 'IS', 311, NULL, NULL, NULL, 'ISERNIA', 1),
(463, 'SP', 308, NULL, NULL, NULL, 'LA SPEZIA', 1),
(464, 'AQ', 301, NULL, NULL, NULL, 'L AQUILA', 1),
(465, 'LT', 307, NULL, NULL, NULL, 'LATINA', 1),
(466, 'LE', 313, NULL, NULL, NULL, 'LECCE', 1),
(467, 'LC', 309, NULL, NULL, NULL, 'LECCO', 1),
(468, 'LI', 314, NULL, NULL, NULL, 'LIVORNO', 1),
(469, 'LO', 309, NULL, NULL, NULL, 'LODI', 1),
(470, 'LU', 316, NULL, NULL, NULL, 'LUCCA', 1),
(471, 'MC', 310, NULL, NULL, NULL, 'MACERATA', 1),
(472, 'MN', 309, NULL, NULL, NULL, 'MANTOVA', 1),
(473, 'MS', 316, NULL, NULL, NULL, 'MASSA-CARRARA', 1),
(474, 'MT', 302, NULL, NULL, NULL, 'MATERA', 1),
(475, 'VS', 314, NULL, NULL, NULL, 'MEDIO CAMPIDANO', 1),
(476, 'ME', 315, NULL, NULL, NULL, 'MESSINA', 1),
(477, 'MI', 309, NULL, NULL, NULL, 'MILANO', 1),
(478, 'MB', 309, NULL, NULL, NULL, 'MONZA e BRIANZA', 1),
(479, 'MO', 305, NULL, NULL, NULL, 'MODENA', 1),
(480, 'NA', 304, NULL, NULL, NULL, 'NAPOLI', 1),
(481, 'NO', 312, NULL, NULL, NULL, 'NOVARA', 1),
(482, 'NU', 314, NULL, NULL, NULL, 'NUORO', 1),
(483, 'OG', 314, NULL, NULL, NULL, 'OGLIASTRA', 1),
(484, 'OT', 314, NULL, NULL, NULL, 'OLBIA-TEMPIO', 1),
(485, 'OR', 314, NULL, NULL, NULL, 'ORISTANO', 1),
(486, 'PD', 320, NULL, NULL, NULL, 'PADOVA', 1),
(487, 'PA', 315, NULL, NULL, NULL, 'PALERMO', 1),
(488, 'PR', 305, NULL, NULL, NULL, 'PARMA', 1),
(489, 'PV', 309, NULL, NULL, NULL, 'PAVIA', 1),
(490, 'PG', 318, NULL, NULL, NULL, 'PERUGIA', 1),
(491, 'PU', 310, NULL, NULL, NULL, 'PESARO e URBINO', 1),
(492, 'PE', 301, NULL, NULL, NULL, 'PESCARA', 1),
(493, 'PC', 305, NULL, NULL, NULL, 'PIACENZA', 1),
(494, 'PI', 316, NULL, NULL, NULL, 'PISA', 1),
(495, 'PT', 316, NULL, NULL, NULL, 'PISTOIA', 1),
(496, 'PN', 306, NULL, NULL, NULL, 'PORDENONE', 1),
(497, 'PZ', 302, NULL, NULL, NULL, 'POTENZA', 1),
(498, 'PO', 316, NULL, NULL, NULL, 'PRATO', 1),
(499, 'RG', 315, NULL, NULL, NULL, 'RAGUSA', 1),
(500, 'RA', 305, NULL, NULL, NULL, 'RAVENNA', 1),
(501, 'RC', 303, NULL, NULL, NULL, 'REGGIO CALABRIA', 1),
(502, 'RE', 305, NULL, NULL, NULL, 'REGGIO NELL EMILIA', 1),
(503, 'RI', 307, NULL, NULL, NULL, 'RIETI', 1),
(504, 'RN', 305, NULL, NULL, NULL, 'RIMINI', 1),
(505, 'RM', 307, NULL, NULL, NULL, 'ROMA', 1),
(506, 'RO', 320, NULL, NULL, NULL, 'ROVIGO', 1),
(507, 'SA', 304, NULL, NULL, NULL, 'SALERNO', 1),
(508, 'SS', 314, NULL, NULL, NULL, 'SASSARI', 1),
(509, 'SV', 308, NULL, NULL, NULL, 'SAVONA', 1),
(510, 'SI', 316, NULL, NULL, NULL, 'SIENA', 1),
(511, 'SR', 315, NULL, NULL, NULL, 'SIRACUSA', 1),
(512, 'SO', 309, NULL, NULL, NULL, 'SONDRIO', 1),
(513, 'TA', 313, NULL, NULL, NULL, 'TARANTO', 1),
(514, 'TE', 301, NULL, NULL, NULL, 'TERAMO', 1),
(515, 'TR', 318, NULL, NULL, NULL, 'TERNI', 1),
(516, 'TO', 312, NULL, NULL, NULL, 'TORINO', 1),
(517, 'TP', 315, NULL, NULL, NULL, 'TRAPANI', 1),
(518, 'TN', 317, NULL, NULL, NULL, 'TRENTO', 1),
(519, 'TV', 320, NULL, NULL, NULL, 'TREVISO', 1),
(520, 'TS', 306, NULL, NULL, NULL, 'TRIESTE', 1),
(521, 'UD', 306, NULL, NULL, NULL, 'UDINE', 1),
(522, 'VA', 309, NULL, NULL, NULL, 'VARESE', 1),
(523, 'VE', 320, NULL, NULL, NULL, 'VENEZIA', 1),
(524, 'VB', 312, NULL, NULL, NULL, 'VERBANO-CUSIO-OSSOLA', 1),
(525, 'VC', 312, NULL, NULL, NULL, 'VERCELLI', 1),
(526, 'VR', 320, NULL, NULL, NULL, 'VERONA', 1),
(527, 'VV', 303, NULL, NULL, NULL, 'VIBO VALENTIA', 1),
(528, 'VI', 320, NULL, NULL, NULL, 'VICENZA', 1),
(529, 'VT', 307, NULL, NULL, NULL, 'VITERBO', 1),
(530, 'LU0001', 14001, '', 0, '', 'Clervaux', 1),
(531, 'LU0002', 14001, '', 0, '', 'Diekirch', 1),
(532, 'LU0003', 14001, '', 0, '', 'Redange', 1),
(533, 'LU0004', 14001, '', 0, '', 'Vianden', 1),
(534, 'LU0005', 14001, '', 0, '', 'Wiltz', 1),
(535, 'LU0006', 14002, '', 0, '', 'Echternach', 1),
(536, 'LU0007', 14002, '', 0, '', 'Grevenmacher', 1),
(537, 'LU0008', 14002, '', 0, '', 'Remich', 1),
(538, 'LU0009', 14003, '', 0, '', 'Capellen', 1),
(539, 'LU0010', 14003, '', 0, '', 'Esch-sur-Alzette', 1),
(540, 'LU0011', 14003, '', 0, '', 'Luxembourg', 1),
(541, 'LU0012', 14003, '', 0, '', 'Mersch', 1),
(542, 'MA', 1209, '', 0, '', 'Province de Benslimane', 1),
(543, 'MA1', 1209, '', 0, '', 'Province de Berrechid', 1),
(544, 'MA2', 1209, '', 0, '', 'Province de Khouribga', 1),
(545, 'MA3', 1209, '', 0, '', 'Province de Settat', 1),
(546, 'MA4', 1210, '', 0, '', 'Province d\'El Jadida', 1),
(547, 'MA5', 1210, '', 0, '', 'Province de Safi', 1),
(548, 'MA6', 1210, '', 0, '', 'Province de Sidi Bennour', 1),
(549, 'MA7', 1210, '', 0, '', 'Province de Youssoufia', 1),
(550, 'MA6B', 1205, '', 0, '', 'PrĂ©fecture de FĂ¨s', 1),
(551, 'MA7B', 1205, '', 0, '', 'Province de Boulemane', 1),
(552, 'MA8', 1205, '', 0, '', 'Province de Moulay Yacoub', 1),
(553, 'MA9', 1205, '', 0, '', 'Province de Sefrou', 1),
(554, 'MA8A', 1202, '', 0, '', 'Province de KĂ©nitra', 1),
(555, 'MA9A', 1202, '', 0, '', 'Province de Sidi Kacem', 1),
(556, 'MA10', 1202, '', 0, '', 'Province de Sidi Slimane', 1),
(557, 'MA11', 1208, '', 0, '', 'PrĂ©fecture de Casablanca', 1),
(558, 'MA12', 1208, '', 0, '', 'PrĂ©fecture de MohammĂ©dia', 1),
(559, 'MA13', 1208, '', 0, '', 'Province de MĂ©diouna', 1),
(560, 'MA14', 1208, '', 0, '', 'Province de Nouaceur', 1),
(561, 'MA15', 1214, '', 0, '', 'Province d\'Assa-Zag', 1),
(562, 'MA16', 1214, '', 0, '', 'Province d\'Es-Semara', 1),
(563, 'MA17A', 1214, '', 0, '', 'Province de Guelmim', 1),
(564, 'MA18', 1214, '', 0, '', 'Province de Tata', 1),
(565, 'MA19', 1214, '', 0, '', 'Province de Tan-Tan', 1),
(566, 'MA15', 1215, '', 0, '', 'Province de Boujdour', 1),
(567, 'MA16', 1215, '', 0, '', 'Province de LĂ¢ayoune', 1),
(568, 'MA17', 1215, '', 0, '', 'Province de Tarfaya', 1),
(569, 'MA18', 1211, '', 0, '', 'PrĂ©fecture de Marrakech', 1),
(570, 'MA19', 1211, '', 0, '', 'Province d\'Al Haouz', 1),
(571, 'MA20', 1211, '', 0, '', 'Province de Chichaoua', 1),
(572, 'MA21', 1211, '', 0, '', 'Province d\'El KelĂ¢a des Sraghna', 1),
(573, 'MA22', 1211, '', 0, '', 'Province d\'Essaouira', 1),
(574, 'MA23', 1211, '', 0, '', 'Province de Rehamna', 1),
(575, 'MA24', 1206, '', 0, '', 'PrĂ©fecture de MeknĂ¨s', 1),
(576, 'MA25', 1206, '', 0, '', 'Province dâ€™El Hajeb', 1),
(577, 'MA26', 1206, '', 0, '', 'Province d\'Errachidia', 1),
(578, 'MA27', 1206, '', 0, '', 'Province dâ€™Ifrane', 1),
(579, 'MA28', 1206, '', 0, '', 'Province de KhĂ©nifra', 1),
(580, 'MA29', 1206, '', 0, '', 'Province de Midelt', 1),
(581, 'MA30', 1204, '', 0, '', 'PrĂ©fecture d\'Oujda-Angad', 1),
(582, 'MA31', 1204, '', 0, '', 'Province de Berkane', 1),
(583, 'MA32', 1204, '', 0, '', 'Province de Driouch', 1),
(584, 'MA33', 1204, '', 0, '', 'Province de Figuig', 1),
(585, 'MA34', 1204, '', 0, '', 'Province de Jerada', 1),
(586, 'MA35', 1204, '', 0, '', 'Province de Nador', 1),
(587, 'MA36', 1204, '', 0, '', 'Province de Taourirt', 1),
(588, 'MA37', 1216, '', 0, '', 'Province d\'Aousserd', 1),
(589, 'MA38', 1216, '', 0, '', 'Province d\'Oued Ed-Dahab', 1),
(590, 'MA39', 1207, '', 0, '', 'PrĂ©fecture de Rabat', 1),
(591, 'MA40', 1207, '', 0, '', 'PrĂ©fecture de Skhirat-TĂ©mara', 1),
(592, 'MA41', 1207, '', 0, '', 'PrĂ©fecture de SalĂ©', 1),
(593, 'MA42', 1207, '', 0, '', 'Province de KhĂ©misset', 1),
(594, 'MA43', 1213, '', 0, '', 'PrĂ©fecture d\'Agadir Ida-Outanane', 1),
(595, 'MA44', 1213, '', 0, '', 'PrĂ©fecture d\'Inezgane-AĂ¯t Melloul', 1),
(596, 'MA45', 1213, '', 0, '', 'Province de Chtouka-AĂ¯t Baha', 1),
(597, 'MA46', 1213, '', 0, '', 'Province d\'Ouarzazate', 1),
(598, 'MA47', 1213, '', 0, '', 'Province de Sidi Ifni', 1),
(599, 'MA48', 1213, '', 0, '', 'Province de Taroudant', 1),
(600, 'MA49', 1213, '', 0, '', 'Province de Tinghir', 1),
(601, 'MA50', 1213, '', 0, '', 'Province de Tiznit', 1),
(602, 'MA51', 1213, '', 0, '', 'Province de Zagora', 1),
(603, 'MA52', 1212, '', 0, '', 'Province d\'Azilal', 1),
(604, 'MA53', 1212, '', 0, '', 'Province de Beni Mellal', 1),
(605, 'MA54', 1212, '', 0, '', 'Province de Fquih Ben Salah', 1),
(606, 'MA55', 1201, '', 0, '', 'PrĂ©fecture de M\'diq-Fnideq', 1),
(607, 'MA56', 1201, '', 0, '', 'PrĂ©fecture de Tanger-Asilah', 1),
(608, 'MA57', 1201, '', 0, '', 'Province de Chefchaouen', 1),
(609, 'MA58', 1201, '', 0, '', 'Province de Fahs-Anjra', 1),
(610, 'MA59', 1201, '', 0, '', 'Province de Larache', 1),
(611, 'MA60', 1201, '', 0, '', 'Province d\'Ouezzane', 1),
(612, 'MA61', 1201, '', 0, '', 'Province de TĂ©touan', 1),
(613, 'MA62', 1203, '', 0, '', 'Province de Guercif', 1),
(614, 'MA63', 1203, '', 0, '', 'Province d\'Al HoceĂ¯ma', 1),
(615, 'MA64', 1203, '', 0, '', 'Province de Taounate', 1),
(616, 'MA65', 1203, '', 0, '', 'Province de Taza', 1),
(617, 'MA6A', 1205, '', 0, '', 'PrĂ©fecture de FĂ¨s', 1),
(618, 'MA7A', 1205, '', 0, '', 'Province de Boulemane', 1),
(619, 'MA15A', 1214, '', 0, '', 'Province d\'Assa-Zag', 1),
(620, 'MA16A', 1214, '', 0, '', 'Province d\'Es-Semara', 1),
(621, 'MA18A', 1211, '', 0, '', 'PrĂ©fecture de Marrakech', 1),
(622, 'MA19A', 1214, '', 0, '', 'Province de Tan-Tan', 1),
(623, 'MA19B', 1214, '', 0, '', 'Province de Tan-Tan', 1),
(624, 'GR', 1701, NULL, NULL, NULL, 'Groningen', 1),
(625, 'FR', 1701, NULL, NULL, NULL, 'Friesland', 1),
(626, 'DR', 1701, NULL, NULL, NULL, 'Drenthe', 1),
(627, 'OV', 1701, NULL, NULL, NULL, 'Overijssel', 1),
(628, 'GD', 1701, NULL, NULL, NULL, 'Gelderland', 1),
(629, 'FL', 1701, NULL, NULL, NULL, 'Flevoland', 1),
(630, 'UT', 1701, NULL, NULL, NULL, 'Utrecht', 1),
(631, 'NH', 1701, NULL, NULL, NULL, 'Noord-Holland', 1),
(632, 'ZH', 1701, NULL, NULL, NULL, 'Zuid-Holland', 1),
(633, 'ZL', 1701, NULL, NULL, NULL, 'Zeeland', 1),
(634, 'NB', 1701, NULL, NULL, NULL, 'Noord-Brabant', 1),
(635, 'LB', 1701, NULL, NULL, NULL, 'Limburg', 1),
(636, 'PA-1', 17801, '', 0, '', 'Bocas del Toro', 1),
(637, 'PA-2', 17801, '', 0, '', 'CoclĂ©', 1),
(638, 'PA-3', 17801, '', 0, '', 'ColĂ³n', 1),
(639, 'PA-4', 17801, '', 0, '', 'ChiriquĂ­', 1),
(640, 'PA-5', 17801, '', 0, '', 'DariĂ©n', 1),
(641, 'PA-6', 17801, '', 0, '', 'Herrera', 1),
(642, 'PA-7', 17801, '', 0, '', 'Los Santos', 1),
(643, 'PA-8', 17801, '', 0, '', 'PanamĂ¡', 1),
(644, 'PA-9', 17801, '', 0, '', 'Veraguas', 1),
(645, 'PA-13', 17801, '', 0, '', 'PanamĂ¡ Oeste', 1),
(646, '0101', 18101, '', 0, '', 'Chachapoyas', 1),
(647, '0102', 18101, '', 0, '', 'Bagua', 1),
(648, '0103', 18101, '', 0, '', 'BongarĂ¡', 1),
(649, '0104', 18101, '', 0, '', 'Condorcanqui', 1),
(650, '0105', 18101, '', 0, '', 'Luya', 1),
(651, '0106', 18101, '', 0, '', 'RodrĂ­guez de Mendoza', 1),
(652, '0107', 18101, '', 0, '', 'Utcubamba', 1),
(653, '0201', 18102, '', 0, '', 'Huaraz', 1),
(654, '0202', 18102, '', 0, '', 'Aija', 1),
(655, '0203', 18102, '', 0, '', 'Antonio Raymondi', 1),
(656, '0204', 18102, '', 0, '', 'AsunciĂ³n', 1),
(657, '0205', 18102, '', 0, '', 'Bolognesi', 1),
(658, '0206', 18102, '', 0, '', 'Carhuaz', 1),
(659, '0207', 18102, '', 0, '', 'Carlos FermĂ­n Fitzcarrald', 1),
(660, '0208', 18102, '', 0, '', 'Casma', 1),
(661, '0209', 18102, '', 0, '', 'Corongo', 1),
(662, '0210', 18102, '', 0, '', 'Huari', 1),
(663, '0211', 18102, '', 0, '', 'Huarmey', 1),
(664, '0212', 18102, '', 0, '', 'Huaylas', 1),
(665, '0213', 18102, '', 0, '', 'Mariscal Luzuriaga', 1),
(666, '0214', 18102, '', 0, '', 'Ocros', 1),
(667, '0215', 18102, '', 0, '', 'Pallasca', 1),
(668, '0216', 18102, '', 0, '', 'Pomabamba', 1),
(669, '0217', 18102, '', 0, '', 'Recuay', 1),
(670, '0218', 18102, '', 0, '', 'PapĂ¡', 1),
(671, '0219', 18102, '', 0, '', 'Sihuas', 1),
(672, '0220', 18102, '', 0, '', 'Yungay', 1),
(673, '0301', 18103, '', 0, '', 'Abancay', 1),
(674, '0302', 18103, '', 0, '', 'Andahuaylas', 1),
(675, '0303', 18103, '', 0, '', 'Antabamba', 1),
(676, '0304', 18103, '', 0, '', 'Aymaraes', 1),
(677, '0305', 18103, '', 0, '', 'Cotabambas', 1),
(678, '0306', 18103, '', 0, '', 'Chincheros', 1),
(679, '0307', 18103, '', 0, '', 'Grau', 1),
(680, '0401', 18104, '', 0, '', 'Arequipa', 1),
(681, '0402', 18104, '', 0, '', 'CamanĂ¡', 1),
(682, '0403', 18104, '', 0, '', 'CaravelĂ­', 1),
(683, '0404', 18104, '', 0, '', 'Castilla', 1),
(684, '0405', 18104, '', 0, '', 'Caylloma', 1),
(685, '0406', 18104, '', 0, '', 'Condesuyos', 1),
(686, '0407', 18104, '', 0, '', 'Islay', 1),
(687, '0408', 18104, '', 0, '', 'La UniĂ³n', 1),
(688, '0501', 18105, '', 0, '', 'Huamanga', 1),
(689, '0502', 18105, '', 0, '', 'Cangallo', 1),
(690, '0503', 18105, '', 0, '', 'Huanca Sancos', 1),
(691, '0504', 18105, '', 0, '', 'Huanta', 1),
(692, '0505', 18105, '', 0, '', 'La Mar', 1),
(693, '0506', 18105, '', 0, '', 'Lucanas', 1),
(694, '0507', 18105, '', 0, '', 'Parinacochas', 1),
(695, '0508', 18105, '', 0, '', 'PĂ¡ucar del Sara Sara', 1),
(696, '0509', 18105, '', 0, '', 'Sucre', 1),
(697, '0510', 18105, '', 0, '', 'VĂ­ctor Fajardo', 1),
(698, '0511', 18105, '', 0, '', 'Vilcas HuamĂ¡n', 1),
(699, '0601', 18106, '', 0, '', 'Cajamarca', 1),
(700, '0602', 18106, '', 0, '', 'Cajabamba', 1),
(701, '0603', 18106, '', 0, '', 'CelendĂ­n', 1),
(702, '0604', 18106, '', 0, '', 'Chota', 1),
(703, '0605', 18106, '', 0, '', 'ContumazĂ¡', 1),
(704, '0606', 18106, '', 0, '', 'Cutervo', 1),
(705, '0607', 18106, '', 0, '', 'Hualgayoc', 1),
(706, '0608', 18106, '', 0, '', 'JaĂ©n', 1),
(707, '0609', 18106, '', 0, '', 'San Ignacio', 1),
(708, '0610', 18106, '', 0, '', 'San Marcos', 1),
(709, '0611', 18106, '', 0, '', 'San Miguel', 1),
(710, '0612', 18106, '', 0, '', 'San Pablo', 1),
(711, '0613', 18106, '', 0, '', 'Santa Cruz', 1),
(712, '0701', 18107, '', 0, '', 'Callao', 1),
(713, '0801', 18108, '', 0, '', 'Cusco', 1),
(714, '0802', 18108, '', 0, '', 'Acomayo', 1),
(715, '0803', 18108, '', 0, '', 'Anta', 1),
(716, '0804', 18108, '', 0, '', 'Calca', 1),
(717, '0805', 18108, '', 0, '', 'Canas', 1),
(718, '0806', 18108, '', 0, '', 'Canchis', 1),
(719, '0807', 18108, '', 0, '', 'Chumbivilcas', 1),
(720, '0808', 18108, '', 0, '', 'Espinar', 1),
(721, '0809', 18108, '', 0, '', 'La ConvenciĂ³n', 1),
(722, '0810', 18108, '', 0, '', 'Paruro', 1),
(723, '0811', 18108, '', 0, '', 'Paucartambo', 1),
(724, '0812', 18108, '', 0, '', 'Quispicanchi', 1),
(725, '0813', 18108, '', 0, '', 'Urubamba', 1),
(726, '0901', 18109, '', 0, '', 'Huancavelica', 1),
(727, '0902', 18109, '', 0, '', 'Acobamba', 1),
(728, '0903', 18109, '', 0, '', 'Angaraes', 1),
(729, '0904', 18109, '', 0, '', 'Castrovirreyna', 1),
(730, '0905', 18109, '', 0, '', 'Churcampa', 1),
(731, '0906', 18109, '', 0, '', 'HuaytarĂ¡', 1),
(732, '0907', 18109, '', 0, '', 'Tayacaja', 1),
(733, '1001', 18110, '', 0, '', 'HuĂ¡nuco', 1),
(734, '1002', 18110, '', 0, '', 'AmbĂ³n', 1),
(735, '1003', 18110, '', 0, '', 'Dos de Mayo', 1),
(736, '1004', 18110, '', 0, '', 'Huacaybamba', 1),
(737, '1005', 18110, '', 0, '', 'HuamalĂ­es', 1),
(738, '1006', 18110, '', 0, '', 'Leoncio Prado', 1),
(739, '1007', 18110, '', 0, '', 'MaraĂ±Ă³n', 1),
(740, '1008', 18110, '', 0, '', 'Pachitea', 1),
(741, '1009', 18110, '', 0, '', 'Puerto Inca', 1),
(742, '1010', 18110, '', 0, '', 'Lauricocha', 1),
(743, '1011', 18110, '', 0, '', 'Yarowilca', 1),
(744, '1101', 18111, '', 0, '', 'Ica', 1),
(745, '1102', 18111, '', 0, '', 'Chincha', 1),
(746, '1103', 18111, '', 0, '', 'Nazca', 1),
(747, '1104', 18111, '', 0, '', 'Palpa', 1),
(748, '1105', 18111, '', 0, '', 'Pisco', 1),
(749, '1201', 18112, '', 0, '', 'Huancayo', 1),
(750, '1202', 18112, '', 0, '', 'ConcepciĂ³n', 1),
(751, '1203', 18112, '', 0, '', 'Chanchamayo', 1),
(752, '1204', 18112, '', 0, '', 'Jauja', 1),
(753, '1205', 18112, '', 0, '', 'JunĂ­n', 1),
(754, '1206', 18112, '', 0, '', 'Satipo', 1),
(755, '1207', 18112, '', 0, '', 'Tarma', 1),
(756, '1208', 18112, '', 0, '', 'Yauli', 1),
(757, '1209', 18112, '', 0, '', 'Chupaca', 1),
(758, '1301', 18113, '', 0, '', 'Trujillo', 1),
(759, '1302', 18113, '', 0, '', 'Ascope', 1),
(760, '1303', 18113, '', 0, '', 'BolĂ­var', 1),
(761, '1304', 18113, '', 0, '', 'ChepĂ©n', 1),
(762, '1305', 18113, '', 0, '', 'JulcĂ¡n', 1),
(763, '1306', 18113, '', 0, '', 'Otuzco', 1),
(764, '1307', 18113, '', 0, '', 'Pacasmayo', 1),
(765, '1308', 18113, '', 0, '', 'Pataz', 1),
(766, '1309', 18113, '', 0, '', 'SĂ¡nchez CarriĂ³n', 1),
(767, '1310', 18113, '', 0, '', 'Santiago de Chuco', 1),
(768, '1311', 18113, '', 0, '', 'Gran ChimĂº', 1),
(769, '1312', 18113, '', 0, '', 'VirĂº', 1),
(770, '1401', 18114, '', 0, '', 'Chiclayo', 1),
(771, '1402', 18114, '', 0, '', 'FerreĂ±afe', 1),
(772, '1403', 18114, '', 0, '', 'Lambayeque', 1),
(773, '1501', 18115, '', 0, '', 'Lima', 1),
(774, '1502', 18116, '', 0, '', 'Huaura', 1),
(775, '1503', 18116, '', 0, '', 'Barranca', 1),
(776, '1504', 18116, '', 0, '', 'Cajatambo', 1),
(777, '1505', 18116, '', 0, '', 'Canta', 1),
(778, '1506', 18116, '', 0, '', 'CaĂ±ete', 1),
(779, '1507', 18116, '', 0, '', 'Huaral', 1),
(780, '1508', 18116, '', 0, '', 'HuarochirĂ­', 1),
(781, '1509', 18116, '', 0, '', 'OyĂ³n', 1),
(782, '1510', 18116, '', 0, '', 'Yauyos', 1),
(783, '1601', 18117, '', 0, '', 'Maynas', 1),
(784, '1602', 18117, '', 0, '', 'Alto Amazonas', 1),
(785, '1603', 18117, '', 0, '', 'Loreto', 1),
(786, '1604', 18117, '', 0, '', 'Mariscal RamĂ³n Castilla', 1),
(787, '1605', 18117, '', 0, '', 'Requena', 1),
(788, '1606', 18117, '', 0, '', 'Ucayali', 1),
(789, '1607', 18117, '', 0, '', 'Datem del MaraĂ±Ă³n', 1),
(790, '1701', 18118, '', 0, '', 'Tambopata', 1),
(791, '1702', 18118, '', 0, '', 'ManĂº', 1),
(792, '1703', 18118, '', 0, '', 'Tahuamanu', 1),
(793, '1801', 18119, '', 0, '', 'Mariscal Nieto', 1),
(794, '1802', 18119, '', 0, '', 'General SĂ¡nchez Cerro', 1),
(795, '1803', 18119, '', 0, '', 'Ilo', 1),
(796, '1901', 18120, '', 0, '', 'Pasco', 1),
(797, '1902', 18120, '', 0, '', 'Daniel Alcides CarriĂ³n', 1),
(798, '1903', 18120, '', 0, '', 'Oxapampa', 1),
(799, '2001', 18121, '', 0, '', 'Piura', 1),
(800, '2002', 18121, '', 0, '', 'Ayabaca', 1),
(801, '2003', 18121, '', 0, '', 'Huancabamba', 1),
(802, '2004', 18121, '', 0, '', 'MorropĂ³n', 1),
(803, '2005', 18121, '', 0, '', 'Paita', 1),
(804, '2006', 18121, '', 0, '', 'Sullana', 1),
(805, '2007', 18121, '', 0, '', 'Talara', 1),
(806, '2008', 18121, '', 0, '', 'Sechura', 1),
(807, '2101', 18122, '', 0, '', 'Puno', 1),
(808, '2102', 18122, '', 0, '', 'AzĂ¡ngaro', 1),
(809, '2103', 18122, '', 0, '', 'Carabaya', 1),
(810, '2104', 18122, '', 0, '', 'Chucuito', 1),
(811, '2105', 18122, '', 0, '', 'El Collao', 1),
(812, '2106', 18122, '', 0, '', 'HuancanĂ©', 1),
(813, '2107', 18122, '', 0, '', 'Lampa', 1),
(814, '2108', 18122, '', 0, '', 'Melgar', 1),
(815, '2109', 18122, '', 0, '', 'Moho', 1),
(816, '2110', 18122, '', 0, '', 'San Antonio de Putina', 1),
(817, '2111', 18122, '', 0, '', 'San RomĂ¡n', 1),
(818, '2112', 18122, '', 0, '', 'Sandia', 1),
(819, '2113', 18122, '', 0, '', 'Yunguyo', 1),
(820, '2201', 18123, '', 0, '', 'Moyobamba', 1),
(821, '2202', 18123, '', 0, '', 'Bellavista', 1),
(822, '2203', 18123, '', 0, '', 'El Dorado', 1),
(823, '2204', 18123, '', 0, '', 'Huallaga', 1),
(824, '2205', 18123, '', 0, '', 'Lamas', 1),
(825, '2206', 18123, '', 0, '', 'Mariscal CĂ¡ceres', 1),
(826, '2207', 18123, '', 0, '', 'Picota', 1),
(827, '2208', 18123, '', 0, '', 'La Rioja', 1),
(828, '2209', 18123, '', 0, '', 'San MartĂ­n', 1),
(829, '2210', 18123, '', 0, '', 'Tocache', 1),
(830, '2301', 18124, '', 0, '', 'Tacna', 1),
(831, '2302', 18124, '', 0, '', 'Candarave', 1),
(832, '2303', 18124, '', 0, '', 'Jorge Basadre', 1),
(833, '2304', 18124, '', 0, '', 'Tarata', 1),
(834, '2401', 18125, '', 0, '', 'Tumbes', 1),
(835, '2402', 18125, '', 0, '', 'Contralmirante Villar', 1),
(836, '2403', 18125, '', 0, '', 'Zarumilla', 1),
(837, '2501', 18126, '', 0, '', 'Coronel Portillo', 1),
(838, '2502', 18126, '', 0, '', 'Atalaya', 1),
(839, '2503', 18126, '', 0, '', 'Padre Abad', 1),
(840, '2504', 18126, '', 0, '', 'PurĂºs', 1),
(841, 'PT-AV', 15001, NULL, NULL, 'AVEIRO', 'Aveiro', 1),
(842, 'PT-AC', 15002, NULL, NULL, 'AZORES', 'Azores', 1),
(843, 'PT-BE', 15001, NULL, NULL, 'BEJA', 'Beja', 1),
(844, 'PT-BR', 15001, NULL, NULL, 'BRAGA', 'Braga', 1),
(845, 'PT-BA', 15001, NULL, NULL, 'BRAGANCA', 'BraganĂ§a', 1),
(846, 'PT-CB', 15001, NULL, NULL, 'CASTELO BRANCO', 'Castelo Branco', 1),
(847, 'PT-CO', 15001, NULL, NULL, 'COIMBRA', 'Coimbra', 1),
(848, 'PT-EV', 15001, NULL, NULL, 'EVORA', 'Ă‰vora', 1),
(849, 'PT-FA', 15001, NULL, NULL, 'FARO', 'Faro', 1),
(850, 'PT-GU', 15001, NULL, NULL, 'GUARDA', 'Guarda', 1),
(851, 'PT-LE', 15001, NULL, NULL, 'LEIRIA', 'Leiria', 1),
(852, 'PT-LI', 15001, NULL, NULL, 'LISBON', 'Lisboa', 1),
(853, 'PT-AML', 15001, NULL, NULL, 'AREA METROPOLITANA LISBOA', 'Ărea Metropolitana de Lisboa', 1),
(854, 'PT-MA', 15002, NULL, NULL, 'MADEIRA', 'Madeira', 1),
(855, 'PT-PA', 15001, NULL, NULL, 'PORTALEGRE', 'Portalegre', 1),
(856, 'PT-PO', 15001, NULL, NULL, 'PORTO', 'Porto', 1),
(857, 'PT-SA', 15001, NULL, NULL, 'SANTAREM', 'SantarĂ©m', 1),
(858, 'PT-SE', 15001, NULL, NULL, 'SETUBAL', 'SetĂºbal', 1),
(859, 'PT-VC', 15001, NULL, NULL, 'VIANA DO CASTELO', 'Viana Do Castelo', 1),
(860, 'PT-VR', 15001, NULL, NULL, 'VILA REAL', 'Vila Real', 1),
(861, 'PT-VI', 15001, NULL, NULL, 'VISEU', 'Viseu', 1),
(862, 'AB', 18801, '', 0, '', 'Alba', 1),
(863, 'AR', 18801, '', 0, '', 'Arad', 1),
(864, 'AG', 18801, '', 0, '', 'ArgeÈ™', 1),
(865, 'BC', 18801, '', 0, '', 'BacÄƒu', 1),
(866, 'BH', 18801, '', 0, '', 'Bihor', 1),
(867, 'BN', 18801, '', 0, '', 'BistriÈ›a-NÄƒsÄƒud', 1),
(868, 'BT', 18801, '', 0, '', 'BotoÈ™ani', 1),
(869, 'BV', 18801, '', 0, '', 'BraÈ™ov', 1),
(870, 'BR', 18801, '', 0, '', 'BrÄƒila', 1),
(871, 'BU', 18801, '', 0, '', 'Bucuresti', 1),
(872, 'BZ', 18801, '', 0, '', 'BuzÄƒu', 1),
(873, 'CL', 18801, '', 0, '', 'CÄƒlÄƒraÈ™i', 1),
(874, 'CS', 18801, '', 0, '', 'CaraÈ™-Severin', 1),
(875, 'CJ', 18801, '', 0, '', 'Cluj', 1),
(876, 'CT', 18801, '', 0, '', 'ConstanÈ›a', 1),
(877, 'CV', 18801, '', 0, '', 'Covasna', 1),
(878, 'DB', 18801, '', 0, '', 'DĂ¢mboviÈ›a', 1),
(879, 'DJ', 18801, '', 0, '', 'Dolj', 1),
(880, 'GL', 18801, '', 0, '', 'GalaÈ›i', 1),
(881, 'GR', 18801, '', 0, '', 'Giurgiu', 1),
(882, 'GJ', 18801, '', 0, '', 'Gorj', 1),
(883, 'HR', 18801, '', 0, '', 'Harghita', 1),
(884, 'HD', 18801, '', 0, '', 'Hunedoara', 1),
(885, 'IL', 18801, '', 0, '', 'IalomiÈ›a', 1),
(886, 'IS', 18801, '', 0, '', 'IaÈ™i', 1),
(887, 'IF', 18801, '', 0, '', 'Ilfov', 1),
(888, 'MM', 18801, '', 0, '', 'MaramureÈ™', 1),
(889, 'MH', 18801, '', 0, '', 'MehedinÈ›i', 1),
(890, 'MS', 18801, '', 0, '', 'MureÈ™', 1),
(891, 'NT', 18801, '', 0, '', 'NeamÈ›', 1),
(892, 'OT', 18801, '', 0, '', 'Olt', 1),
(893, 'PH', 18801, '', 0, '', 'Prahova', 1),
(894, 'SM', 18801, '', 0, '', 'Satu Mare', 1),
(895, 'SJ', 18801, '', 0, '', 'SÄƒlaj', 1),
(896, 'SB', 18801, '', 0, '', 'Sibiu', 1),
(897, 'SV', 18801, '', 0, '', 'Suceava', 1),
(898, 'TR', 18801, '', 0, '', 'Teleorman', 1),
(899, 'TM', 18801, '', 0, '', 'TimiÈ™', 1),
(900, 'TL', 18801, '', 0, '', 'Tulcea', 1),
(901, 'VS', 18801, '', 0, '', 'Vaslui', 1),
(902, 'VL', 18801, '', 0, '', 'VĂ¢lcea', 1),
(903, 'VN', 18801, '', 0, '', 'Vrancea', 1),
(904, 'SI031', 20203, NULL, NULL, 'MURA', 'Mura', 1),
(905, 'SI032', 20203, NULL, NULL, 'DRAVA', 'Drava', 1),
(906, 'SI033', 20203, NULL, NULL, 'CARINTHIA', 'Carinthia', 1),
(907, 'SI034', 20203, NULL, NULL, 'SAVINJA', 'Savinja', 1),
(908, 'SI035', 20203, NULL, NULL, 'CENTRAL SAVA', 'Central Sava', 1),
(909, 'SI036', 20203, NULL, NULL, 'LOWER SAVA', 'Lower Sava', 1),
(910, 'SI037', 20203, NULL, NULL, 'SOUTHEAST SLOVENIA', 'Southeast Slovenia', 1),
(911, 'SI038', 20203, NULL, NULL, 'LITTORALâ€“INNER CARNIOLA', 'Littoralâ€“Inner Carniola', 1),
(912, 'SI041', 20204, NULL, NULL, 'CENTRAL SLOVENIA', 'Central Slovenia', 1),
(913, 'SI038', 20204, NULL, NULL, 'UPPER CARNIOLA', 'Upper Carniola', 1),
(914, 'SI043', 20204, NULL, NULL, 'GORIZIA', 'Gorizia', 1),
(915, 'SI044', 20204, NULL, NULL, 'COASTALâ€“KARST', 'Coastalâ€“Karst', 1),
(916, 'TW-KLU', 21301, 'KLU', NULL, NULL, 'åŸºé†å¸‚', 1),
(917, 'TW-TPE', 21301, 'TPE', NULL, NULL, 'è‡ºåŒ—å¸‚', 1),
(918, 'TW-TPH', 21301, 'TPH', NULL, NULL, 'æ–°åŒ—å¸‚', 1),
(919, 'TW-TYC', 21301, 'TYC', NULL, NULL, 'æ¡ƒåœ’å¸‚', 1),
(920, 'TW-HSH', 21301, 'HSH', NULL, NULL, 'æ–°ç«¹ç¸£', 1),
(921, 'TW-HSC', 21301, 'HSC', NULL, NULL, 'æ–°ç«¹å¸‚', 1),
(922, 'TW-MAL', 21301, 'MAL', NULL, NULL, 'è‹—æ —ç¸£', 1),
(923, 'TW-MAC', 21301, 'MAC', NULL, NULL, 'è‹—æ —å¸‚', 1),
(924, 'TW-TXG', 21301, 'TXG', NULL, NULL, 'è‡ºä¸­å¸‚', 1),
(925, 'TW-CWH', 21301, 'CWH', NULL, NULL, 'å½°åŒ–ç¸£', 1),
(926, 'TW-CWS', 21301, 'CWS', NULL, NULL, 'å½°åŒ–å¸‚', 1),
(927, 'TW-NTC', 21301, 'NTC', NULL, NULL, 'å—æ•å¸‚', 1),
(928, 'TW-NTO', 21301, 'NTO', NULL, NULL, 'å—æ•ç¸£', 1),
(929, 'TW-YLH', 21301, 'YLH', NULL, NULL, 'é›²æ—ç¸£', 1),
(930, 'TW-CHY', 21301, 'CHY', NULL, NULL, 'å˜‰ç¾©ç¸£', 1),
(931, 'TW-CYI', 21301, 'CYI', NULL, NULL, 'å˜‰ç¾©å¸‚', 1),
(932, 'TW-TNN', 21301, 'TNN', NULL, NULL, 'è‡ºå—å¸‚', 1),
(933, 'TW-KHH', 21301, 'KHH', NULL, NULL, 'é«˜é›„å¸‚', 1),
(934, 'TW-IUH', 21301, 'IUH', NULL, NULL, 'å±æ±ç¸£', 1),
(935, 'TW-PTS', 21301, 'PTS', NULL, NULL, 'å±æ±å¸‚', 1),
(936, 'TW-ILN', 21301, 'ILN', NULL, NULL, 'å®œè˜­ç¸£', 1),
(937, 'TW-ILC', 21301, 'ILC', NULL, NULL, 'å®œè˜­å¸‚', 1),
(938, 'TW-HWA', 21301, 'HWA', NULL, NULL, 'è±è“®ç¸£', 1),
(939, 'TW-HWC', 21301, 'HWC', NULL, NULL, 'è±è“®å¸‚', 1),
(940, 'TW-TTC', 21301, 'TTC', NULL, NULL, 'è‡ºæ±å¸‚', 1),
(941, 'TW-TTT', 21301, 'TTT', NULL, NULL, 'è‡ºæ±ç¸£', 1),
(942, 'TW-PEH', 21301, 'PEH', NULL, NULL, 'æ¾æ¹–ç¸£', 1),
(943, 'TW-GNI', 21301, 'GNI', NULL, NULL, 'ç¶ å³¶', 1),
(944, 'TW-KYD', 21301, 'KYD', NULL, NULL, 'è˜­å¶¼', 1),
(945, 'TW-KMN', 21301, 'KMN', NULL, NULL, 'é‡‘é–€ç¸£', 1),
(946, 'TW-LNN', 21301, 'LNN', NULL, NULL, 'é€£æ±Ÿç¸£', 1),
(947, 'TN01', 1001, '', 0, '', 'Ariana', 1),
(948, 'TN02', 1001, '', 0, '', 'BĂ©ja', 1),
(949, 'TN03', 1001, '', 0, '', 'Ben Arous', 1),
(950, 'TN04', 1001, '', 0, '', 'Bizerte', 1),
(951, 'TN05', 1001, '', 0, '', 'GabĂ¨s', 1),
(952, 'TN06', 1001, '', 0, '', 'Gafsa', 1),
(953, 'TN07', 1001, '', 0, '', 'Jendouba', 1),
(954, 'TN08', 1001, '', 0, '', 'Kairouan', 1),
(955, 'TN09', 1001, '', 0, '', 'Kasserine', 1),
(956, 'TN10', 1001, '', 0, '', 'KĂ©bili', 1),
(957, 'TN11', 1001, '', 0, '', 'La Manouba', 1),
(958, 'TN12', 1001, '', 0, '', 'Le Kef', 1),
(959, 'TN13', 1001, '', 0, '', 'Mahdia', 1),
(960, 'TN14', 1001, '', 0, '', 'MĂ©denine', 1);
INSERT INTO `erp_c_departements` (`rowid`, `code_departement`, `fk_region`, `cheflieu`, `tncc`, `ncc`, `nom`, `active`) VALUES
(961, 'TN15', 1001, '', 0, '', 'Monastir', 1),
(962, 'TN16', 1001, '', 0, '', 'Nabeul', 1),
(963, 'TN17', 1001, '', 0, '', 'Sfax', 1),
(964, 'TN18', 1001, '', 0, '', 'Sidi Bouzid', 1),
(965, 'TN19', 1001, '', 0, '', 'Siliana', 1),
(966, 'TN20', 1001, '', 0, '', 'Sousse', 1),
(967, 'TN21', 1001, '', 0, '', 'Tataouine', 1),
(968, 'TN22', 1001, '', 0, '', 'Tozeur', 1),
(969, 'TN23', 1001, '', 0, '', 'Tunis', 1),
(970, 'TN24', 1001, '', 0, '', 'Zaghouan', 1),
(971, 'AL', 1101, '', 0, 'ALABAMA', 'Alabama', 1),
(972, 'AK', 1101, '', 0, 'ALASKA', 'Alaska', 1),
(973, 'AZ', 1101, '', 0, 'ARIZONA', 'Arizona', 1),
(974, 'AR', 1101, '', 0, 'ARKANSAS', 'Arkansas', 1),
(975, 'CA', 1101, '', 0, 'CALIFORNIA', 'California', 1),
(976, 'CO', 1101, '', 0, 'COLORADO', 'Colorado', 1),
(977, 'CT', 1101, '', 0, 'CONNECTICUT', 'Connecticut', 1),
(978, 'DE', 1101, '', 0, 'DELAWARE', 'Delaware', 1),
(979, 'FL', 1101, '', 0, 'FLORIDA', 'Florida', 1),
(980, 'GA', 1101, '', 0, 'GEORGIA', 'Georgia', 1),
(981, 'HI', 1101, '', 0, 'HAWAII', 'Hawaii', 1),
(982, 'ID', 1101, '', 0, 'IDAHO', 'Idaho', 1),
(983, 'IL', 1101, '', 0, 'ILLINOIS', 'Illinois', 1),
(984, 'IN', 1101, '', 0, 'INDIANA', 'Indiana', 1),
(985, 'IA', 1101, '', 0, 'IOWA', 'Iowa', 1),
(986, 'KS', 1101, '', 0, 'KANSAS', 'Kansas', 1),
(987, 'KY', 1101, '', 0, 'KENTUCKY', 'Kentucky', 1),
(988, 'LA', 1101, '', 0, 'LOUISIANA', 'Louisiana', 1),
(989, 'ME', 1101, '', 0, 'MAINE', 'Maine', 1),
(990, 'MD', 1101, '', 0, 'MARYLAND', 'Maryland', 1),
(991, 'MA', 1101, '', 0, 'MASSACHUSSETTS', 'Massachusetts', 1),
(992, 'MI', 1101, '', 0, 'MICHIGAN', 'Michigan', 1),
(993, 'MN', 1101, '', 0, 'MINNESOTA', 'Minnesota', 1),
(994, 'MS', 1101, '', 0, 'MISSISSIPPI', 'Mississippi', 1),
(995, 'MO', 1101, '', 0, 'MISSOURI', 'Missouri', 1),
(996, 'MT', 1101, '', 0, 'MONTANA', 'Montana', 1),
(997, 'NE', 1101, '', 0, 'NEBRASKA', 'Nebraska', 1),
(998, 'NV', 1101, '', 0, 'NEVADA', 'Nevada', 1),
(999, 'NH', 1101, '', 0, 'NEW HAMPSHIRE', 'New Hampshire', 1),
(1000, 'NJ', 1101, '', 0, 'NEW JERSEY', 'New Jersey', 1),
(1001, 'NM', 1101, '', 0, 'NEW MEXICO', 'New Mexico', 1),
(1002, 'NY', 1101, '', 0, 'NEW YORK', 'New York', 1),
(1003, 'NC', 1101, '', 0, 'NORTH CAROLINA', 'North Carolina', 1),
(1004, 'ND', 1101, '', 0, 'NORTH DAKOTA', 'North Dakota', 1),
(1005, 'OH', 1101, '', 0, 'OHIO', 'Ohio', 1),
(1006, 'OK', 1101, '', 0, 'OKLAHOMA', 'Oklahoma', 1),
(1007, 'OR', 1101, '', 0, 'OREGON', 'Oregon', 1),
(1008, 'PA', 1101, '', 0, 'PENNSYLVANIA', 'Pennsylvania', 1),
(1009, 'RI', 1101, '', 0, 'RHODE ISLAND', 'Rhode Island', 1),
(1010, 'SC', 1101, '', 0, 'SOUTH CAROLINA', 'South Carolina', 1),
(1011, 'SD', 1101, '', 0, 'SOUTH DAKOTA', 'South Dakota', 1),
(1012, 'TN', 1101, '', 0, 'TENNESSEE', 'Tennessee', 1),
(1013, 'TX', 1101, '', 0, 'TEXAS', 'Texas', 1),
(1014, 'UT', 1101, '', 0, 'UTAH', 'Utah', 1),
(1015, 'VT', 1101, '', 0, 'VERMONT', 'Vermont', 1),
(1016, 'VA', 1101, '', 0, 'VIRGINIA', 'Virginia', 1),
(1017, 'WA', 1101, '', 0, 'WASHINGTON', 'Washington', 1),
(1018, 'WV', 1101, '', 0, 'WEST VIRGINIA', 'West Virginia', 1),
(1019, 'WI', 1101, '', 0, 'WISCONSIN', 'Wisconsin', 1),
(1020, 'WY', 1101, '', 0, 'WYOMING', 'Wyoming', 1),
(1021, '001', 5201, '', 0, '', 'Belisario Boeto', 1),
(1022, '002', 5201, '', 0, '', 'Hernando Siles', 1),
(1023, '003', 5201, '', 0, '', 'Jaime ZudĂ¡Ă±ez', 1),
(1024, '004', 5201, '', 0, '', 'Juana Azurduy de Padilla', 1),
(1025, '005', 5201, '', 0, '', 'Luis Calvo', 1),
(1026, '006', 5201, '', 0, '', 'Nor Cinti', 1),
(1027, '007', 5201, '', 0, '', 'Oropeza', 1),
(1028, '008', 5201, '', 0, '', 'Sud Cinti', 1),
(1029, '009', 5201, '', 0, '', 'Tomina', 1),
(1030, '010', 5201, '', 0, '', 'YamparĂ¡ez', 1),
(1031, '011', 5202, '', 0, '', 'Abel Iturralde', 1),
(1032, '012', 5202, '', 0, '', 'Aroma', 1),
(1033, '013', 5202, '', 0, '', 'Bautista Saavedra', 1),
(1034, '014', 5202, '', 0, '', 'Caranavi', 1),
(1035, '015', 5202, '', 0, '', 'Eliodoro Camacho', 1),
(1036, '016', 5202, '', 0, '', 'Franz Tamayo', 1),
(1037, '017', 5202, '', 0, '', 'Gualberto Villarroel', 1),
(1038, '018', 5202, '', 0, '', 'IngavĂ­', 1),
(1039, '019', 5202, '', 0, '', 'Inquisivi', 1),
(1040, '020', 5202, '', 0, '', 'JosĂ© RamĂ³n Loayza', 1),
(1041, '021', 5202, '', 0, '', 'Larecaja', 1),
(1042, '022', 5202, '', 0, '', 'Los Andes (Bolivia)', 1),
(1043, '023', 5202, '', 0, '', 'Manco Kapac', 1),
(1044, '024', 5202, '', 0, '', 'MuĂ±ecas', 1),
(1045, '025', 5202, '', 0, '', 'Nor Yungas', 1),
(1046, '026', 5202, '', 0, '', 'Omasuyos', 1),
(1047, '027', 5202, '', 0, '', 'Pacajes', 1),
(1048, '028', 5202, '', 0, '', 'Pedro Domingo Murillo', 1),
(1049, '029', 5202, '', 0, '', 'Sud Yungas', 1),
(1050, '030', 5202, '', 0, '', 'General JosĂ© Manuel Pando', 1),
(1051, '031', 5203, '', 0, '', 'Arani', 1),
(1052, '032', 5203, '', 0, '', 'Arque', 1),
(1053, '033', 5203, '', 0, '', 'Ayopaya', 1),
(1054, '034', 5203, '', 0, '', 'BolĂ­var (Bolivia)', 1),
(1055, '035', 5203, '', 0, '', 'Campero', 1),
(1056, '036', 5203, '', 0, '', 'Capinota', 1),
(1057, '037', 5203, '', 0, '', 'Cercado (Cochabamba)', 1),
(1058, '038', 5203, '', 0, '', 'Esteban Arze', 1),
(1059, '039', 5203, '', 0, '', 'GermĂ¡n JordĂ¡n', 1),
(1060, '040', 5203, '', 0, '', 'JosĂ© Carrasco', 1),
(1061, '041', 5203, '', 0, '', 'Mizque', 1),
(1062, '042', 5203, '', 0, '', 'Punata', 1),
(1063, '043', 5203, '', 0, '', 'Quillacollo', 1),
(1064, '044', 5203, '', 0, '', 'TapacarĂ­', 1),
(1065, '045', 5203, '', 0, '', 'Tiraque', 1),
(1066, '046', 5203, '', 0, '', 'Chapare', 1),
(1067, '047', 5204, '', 0, '', 'Carangas', 1),
(1068, '048', 5204, '', 0, '', 'Cercado (Oruro)', 1),
(1069, '049', 5204, '', 0, '', 'Eduardo Avaroa', 1),
(1070, '050', 5204, '', 0, '', 'Ladislao Cabrera', 1),
(1071, '051', 5204, '', 0, '', 'Litoral de Atacama', 1),
(1072, '052', 5204, '', 0, '', 'Mejillones', 1),
(1073, '053', 5204, '', 0, '', 'Nor Carangas', 1),
(1074, '054', 5204, '', 0, '', 'PantaleĂ³n Dalence', 1),
(1075, '055', 5204, '', 0, '', 'PoopĂ³', 1),
(1076, '056', 5204, '', 0, '', 'Sabaya', 1),
(1077, '057', 5204, '', 0, '', 'Sajama', 1),
(1078, '058', 5204, '', 0, '', 'San Pedro de Totora', 1),
(1079, '059', 5204, '', 0, '', 'SaucarĂ­', 1),
(1080, '060', 5204, '', 0, '', 'SebastiĂ¡n Pagador', 1),
(1081, '061', 5204, '', 0, '', 'Sud Carangas', 1),
(1082, '062', 5204, '', 0, '', 'TomĂ¡s BarrĂ³n', 1),
(1083, '063', 5205, '', 0, '', 'Alonso de IbĂ¡Ă±ez', 1),
(1084, '064', 5205, '', 0, '', 'Antonio Quijarro', 1),
(1085, '065', 5205, '', 0, '', 'Bernardino Bilbao', 1),
(1086, '066', 5205, '', 0, '', 'Charcas (PotosĂ­)', 1),
(1087, '067', 5205, '', 0, '', 'Chayanta', 1),
(1088, '068', 5205, '', 0, '', 'Cornelio Saavedra', 1),
(1089, '069', 5205, '', 0, '', 'Daniel Campos', 1),
(1090, '070', 5205, '', 0, '', 'Enrique Baldivieso', 1),
(1091, '071', 5205, '', 0, '', 'JosĂ© MarĂ­a Linares', 1),
(1092, '072', 5205, '', 0, '', 'Modesto Omiste', 1),
(1093, '073', 5205, '', 0, '', 'Nor Chichas', 1),
(1094, '074', 5205, '', 0, '', 'Nor LĂ­pez', 1),
(1095, '075', 5205, '', 0, '', 'Rafael Bustillo', 1),
(1096, '076', 5205, '', 0, '', 'Sud Chichas', 1),
(1097, '077', 5205, '', 0, '', 'Sud LĂ­pez', 1),
(1098, '078', 5205, '', 0, '', 'TomĂ¡s FrĂ­as', 1),
(1099, '079', 5206, '', 0, '', 'Aniceto Arce', 1),
(1100, '080', 5206, '', 0, '', 'Burdet O\'Connor', 1),
(1101, '081', 5206, '', 0, '', 'Cercado (Tarija)', 1),
(1102, '082', 5206, '', 0, '', 'Eustaquio MĂ©ndez', 1),
(1103, '083', 5206, '', 0, '', 'JosĂ© MarĂ­a AvilĂ©s', 1),
(1104, '084', 5206, '', 0, '', 'Gran Chaco', 1),
(1105, '085', 5207, '', 0, '', 'AndrĂ©s IbĂ¡Ă±ez', 1),
(1106, '086', 5207, '', 0, '', 'Caballero', 1),
(1107, '087', 5207, '', 0, '', 'Chiquitos', 1),
(1108, '088', 5207, '', 0, '', 'Cordillera (Bolivia)', 1),
(1109, '089', 5207, '', 0, '', 'Florida', 1),
(1110, '090', 5207, '', 0, '', 'GermĂ¡n Busch', 1),
(1111, '091', 5207, '', 0, '', 'Guarayos', 1),
(1112, '092', 5207, '', 0, '', 'Ichilo', 1),
(1113, '093', 5207, '', 0, '', 'Obispo Santistevan', 1),
(1114, '094', 5207, '', 0, '', 'Sara', 1),
(1115, '095', 5207, '', 0, '', 'Vallegrande', 1),
(1116, '096', 5207, '', 0, '', 'Velasco', 1),
(1117, '097', 5207, '', 0, '', 'Warnes', 1),
(1118, '098', 5207, '', 0, '', 'Ăngel SandĂ³val', 1),
(1119, '099', 5207, '', 0, '', 'Ă‘uflo de Chaves', 1),
(1120, '100', 5208, '', 0, '', 'Cercado (Beni)', 1),
(1121, '101', 5208, '', 0, '', 'ItĂ©nez', 1),
(1122, '102', 5208, '', 0, '', 'MamorĂ©', 1),
(1123, '103', 5208, '', 0, '', 'MarbĂ¡n', 1),
(1124, '104', 5208, '', 0, '', 'Moxos', 1),
(1125, '105', 5208, '', 0, '', 'Vaca DĂ­ez', 1),
(1126, '106', 5208, '', 0, '', 'Yacuma', 1),
(1127, '107', 5208, '', 0, '', 'General JosĂ© BalliviĂ¡n Segurola', 1),
(1128, '108', 5209, '', 0, '', 'AbunĂ¡', 1),
(1129, '109', 5209, '', 0, '', 'Madre de Dios', 1),
(1130, '110', 5209, '', 0, '', 'Manuripi', 1),
(1131, '111', 5209, '', 0, '', 'NicolĂ¡s SuĂ¡rez', 1),
(1132, '112', 5209, '', 0, '', 'General Federico RomĂ¡n', 1),
(1133, 'VI', 419, '01', 19, 'ALAVA', 'Ălava', 1),
(1134, 'AB', 404, '02', 4, 'ALBACETE', 'Albacete', 1),
(1135, 'A', 411, '03', 11, 'ALICANTE', 'Alicante', 1),
(1136, 'AL', 401, '04', 1, 'ALMERIA', 'AlmerĂ­a', 1),
(1137, 'O', 418, '33', 18, 'ASTURIAS', 'Asturias', 1),
(1138, 'AV', 403, '05', 3, 'AVILA', 'Ăvila', 1),
(1139, 'BA', 412, '06', 12, 'BADAJOZ', 'Badajoz', 1),
(1140, 'B', 406, '08', 6, 'BARCELONA', 'Barcelona', 1),
(1141, 'BU', 403, '09', 8, 'BURGOS', 'Burgos', 1),
(1142, 'CC', 412, '10', 12, 'CACERES', 'CĂ¡ceres', 1),
(1143, 'CA', 401, '11', 1, 'CADIZ', 'CĂ¡diz', 1),
(1144, 'S', 410, '39', 10, 'CANTABRIA', 'Cantabria', 1),
(1145, 'CS', 411, '12', 11, 'CASTELLON', 'CastellĂ³n', 1),
(1146, 'CE', 407, '51', 7, 'CEUTA', 'Ceuta', 1),
(1147, 'CR', 404, '13', 4, 'CIUDAD REAL', 'Ciudad Real', 1),
(1148, 'CO', 401, '14', 1, 'CORDOBA', 'CĂ³rdoba', 1),
(1149, 'CU', 404, '16', 4, 'CUENCA', 'Cuenca', 1),
(1150, 'GI', 406, '17', 6, 'GERONA', 'Gerona', 1),
(1151, 'GR', 401, '18', 1, 'GRANADA', 'Granada', 1),
(1152, 'GU', 404, '19', 4, 'GUADALAJARA', 'Guadalajara', 1),
(1153, 'SS', 419, '20', 19, 'GUIPUZCOA', 'GuipĂºzcoa', 1),
(1154, 'H', 401, '21', 1, 'HUELVA', 'Huelva', 1),
(1155, 'HU', 402, '22', 2, 'HUESCA', 'Huesca', 1),
(1156, 'PM', 414, '07', 14, 'ISLAS BALEARES', 'Islas Baleares', 1),
(1157, 'J', 401, '23', 1, 'JAEN', 'JaĂ©n', 1),
(1158, 'C', 413, '15', 13, 'LA CORUĂ‘A', 'La CoruĂ±a', 1),
(1159, 'LO', 415, '26', 15, 'LA RIOJA', 'La Rioja', 1),
(1160, 'GC', 405, '35', 5, 'LAS PALMAS', 'Las Palmas', 1),
(1161, 'LE', 403, '24', 3, 'LEON', 'LeĂ³n', 1),
(1162, 'L', 406, '25', 6, 'LERIDA', 'LĂ©rida', 1),
(1163, 'LU', 413, '27', 13, 'LUGO', 'Lugo', 1),
(1164, 'M', 416, '28', 16, 'MADRID', 'Madrid', 1),
(1165, 'MA', 401, '29', 1, 'MALAGA', 'MĂ¡laga', 1),
(1166, 'ML', 409, '52', 9, 'MELILLA', 'Melilla', 1),
(1167, 'MU', 417, '30', 17, 'MURCIA', 'Murcia', 1),
(1168, 'NA', 408, '31', 8, 'NAVARRA', 'Navarra', 1),
(1169, 'OR', 413, '32', 13, 'ORENSE', 'Orense', 1),
(1170, 'P', 403, '34', 3, 'PALENCIA', 'Palencia', 1),
(1171, 'PO', 413, '36', 13, 'PONTEVEDRA', 'Pontevedra', 1),
(1172, 'SA', 403, '37', 3, 'SALAMANCA', 'Salamanca', 1),
(1173, 'TF', 405, '38', 5, 'STA. CRUZ DE TENERIFE', 'Santa Cruz de Tenerife', 1),
(1174, 'SG', 403, '40', 3, 'SEGOVIA', 'Segovia', 1),
(1175, 'SE', 401, '41', 1, 'SEVILLA', 'Sevilla', 1),
(1176, 'SO', 403, '42', 3, 'SORIA', 'Soria', 1),
(1177, 'T', 406, '43', 6, 'TARRAGONA', 'Tarragona', 1),
(1178, 'TE', 402, '44', 2, 'TERUEL', 'Teruel', 1),
(1179, 'TO', 404, '45', 5, 'TOLEDO', 'Toledo', 1),
(1180, 'V', 411, '46', 11, 'VALENCIA', 'Valencia', 1),
(1181, 'VA', 403, '47', 3, 'VALLADOLID', 'Valladolid', 1),
(1182, 'BI', 419, '48', 19, 'VIZCAYA', 'Vizcaya', 1),
(1183, 'ZA', 403, '49', 3, 'ZAMORA', 'Zamora', 1),
(1184, 'Z', 402, '50', 1, 'ZARAGOZA', 'Zaragoza', 1),
(1185, '66', 10201, '', 0, '', 'Î‘Î¸Î®Î½Î±', 1),
(1186, '67', 10205, '', 0, '', 'Î”ÏÎ¬Î¼Î±', 1),
(1187, '01', 10205, '', 0, '', 'ÎˆÎ²ÏÎ¿Ï‚', 1),
(1188, '02', 10205, '', 0, '', 'Î˜Î¬ÏƒÎ¿Ï‚', 1),
(1189, '03', 10205, '', 0, '', 'ÎÎ±Î²Î¬Î»Î±', 1),
(1190, '04', 10205, '', 0, '', 'ÎÎ¬Î½Î¸Î·', 1),
(1191, '05', 10205, '', 0, '', 'Î¡Î¿Î´ÏŒÏ€Î·', 1),
(1192, '06', 10203, '', 0, '', 'Î—Î¼Î±Î¸Î¯Î±', 1),
(1193, '07', 10203, '', 0, '', 'Î˜ÎµÏƒÏƒÎ±Î»Î¿Î½Î¯ÎºÎ·', 1),
(1194, '08', 10203, '', 0, '', 'ÎÎ¹Î»ÎºÎ¯Ï‚', 1),
(1195, '09', 10203, '', 0, '', 'Î Î­Î»Î»Î±', 1),
(1196, '10', 10203, '', 0, '', 'Î Î¹ÎµÏÎ¯Î±', 1),
(1197, '11', 10203, '', 0, '', 'Î£Î­ÏÏÎµÏ‚', 1),
(1198, '12', 10203, '', 0, '', 'Î§Î±Î»ÎºÎ¹Î´Î¹ÎºÎ®', 1),
(1199, '13', 10206, '', 0, '', 'Î†ÏÏ„Î±', 1),
(1200, '14', 10206, '', 0, '', 'Î˜ÎµÏƒÏ€ÏÏ‰Ï„Î¯Î±', 1),
(1201, '15', 10206, '', 0, '', 'Î™Ï‰Î¬Î½Î½Î¹Î½Î±', 1),
(1202, '16', 10206, '', 0, '', 'Î ÏÎ­Î²ÎµÎ¶Î±', 1),
(1203, '17', 10213, '', 0, '', 'Î“ÏÎµÎ²ÎµÎ½Î¬', 1),
(1204, '18', 10213, '', 0, '', 'ÎÎ±ÏƒÏ„Î¿ÏÎ¹Î¬', 1),
(1205, '19', 10213, '', 0, '', 'ÎÎ¿Î¶Î¬Î½Î·', 1),
(1206, '20', 10213, '', 0, '', 'Î¦Î»ÏÏÎ¹Î½Î±', 1),
(1207, '21', 10212, '', 0, '', 'ÎÎ±ÏÎ´Î¯Ï„ÏƒÎ±', 1),
(1208, '22', 10212, '', 0, '', 'Î›Î¬ÏÎ¹ÏƒÎ±', 1),
(1209, '23', 10212, '', 0, '', 'ÎœÎ±Î³Î½Î·ÏƒÎ¯Î±', 1),
(1210, '24', 10212, '', 0, '', 'Î¤ÏÎ¯ÎºÎ±Î»Î±', 1),
(1211, '25', 10212, '', 0, '', 'Î£Ï€Î¿ÏÎ¬Î´ÎµÏ‚', 1),
(1212, '26', 10212, '', 0, '', 'Î’Î¿Î¹Ï‰Ï„Î¯Î±', 1),
(1213, '27', 10202, '', 0, '', 'Î•ÏÎ²Î¿Î¹Î±', 1),
(1214, '28', 10202, '', 0, '', 'Î•Ï…ÏÏ…Ï„Î±Î½Î¯Î±', 1),
(1215, '29', 10202, '', 0, '', 'Î¦Î¸Î¹ÏÏ„Î¹Î´Î±', 1),
(1216, '30', 10202, '', 0, '', 'Î¦Ï‰ÎºÎ¯Î´Î±', 1),
(1217, '31', 10209, '', 0, '', 'Î‘ÏÎ³Î¿Î»Î¯Î´Î±', 1),
(1218, '32', 10209, '', 0, '', 'Î‘ÏÎºÎ±Î´Î¯Î±', 1),
(1219, '33', 10209, '', 0, '', 'ÎÎ¿ÏÎ¹Î½Î¸Î¯Î±', 1),
(1220, '34', 10209, '', 0, '', 'Î›Î±ÎºÏ‰Î½Î¯Î±', 1),
(1221, '35', 10209, '', 0, '', 'ÎœÎµÏƒÏƒÎ·Î½Î¯Î±', 1),
(1222, '36', 10211, '', 0, '', 'Î‘Î¹Ï„Ï‰Î»Î¿Î±ÎºÎ±ÏÎ½Î±Î½Î¯Î±', 1),
(1223, '37', 10211, '', 0, '', 'Î‘Ï‡Î±ÎÎ±', 1),
(1224, '38', 10211, '', 0, '', 'Î—Î»ÎµÎ¯Î±', 1),
(1225, '39', 10207, '', 0, '', 'Î–Î¬ÎºÏ…Î½Î¸Î¿Ï‚', 1),
(1226, '40', 10207, '', 0, '', 'ÎÎ­ÏÎºÏ…ÏÎ±', 1),
(1227, '41', 10207, '', 0, '', 'ÎÎµÏ†Î±Î»Î»Î·Î½Î¯Î±', 1),
(1228, '42', 10207, '', 0, '', 'Î™Î¸Î¬ÎºÎ·', 1),
(1229, '43', 10207, '', 0, '', 'Î›ÎµÏ…ÎºÎ¬Î´Î±', 1),
(1230, '44', 10208, '', 0, '', 'Î™ÎºÎ±ÏÎ¯Î±', 1),
(1231, '45', 10208, '', 0, '', 'Î›Î­ÏƒÎ²Î¿Ï‚', 1),
(1232, '46', 10208, '', 0, '', 'Î›Î®Î¼Î½Î¿Ï‚', 1),
(1233, '47', 10208, '', 0, '', 'Î£Î¬Î¼Î¿Ï‚', 1),
(1234, '48', 10208, '', 0, '', 'Î§Î¯Î¿Ï‚', 1),
(1235, '49', 10210, '', 0, '', 'Î†Î½Î´ÏÎ¿Ï‚', 1),
(1236, '50', 10210, '', 0, '', 'Î˜Î®ÏÎ±', 1),
(1237, '51', 10210, '', 0, '', 'ÎÎ¬Î»Ï…Î¼Î½Î¿Ï‚', 1),
(1238, '52', 10210, '', 0, '', 'ÎÎ¬ÏÏ€Î±Î¸Î¿Ï‚', 1),
(1239, '53', 10210, '', 0, '', 'ÎÎ­Î±-ÎÏÎ¸Î½Î¿Ï‚', 1),
(1240, '54', 10210, '', 0, '', 'ÎÏ‰', 1),
(1241, '55', 10210, '', 0, '', 'ÎœÎ®Î»Î¿Ï‚', 1),
(1242, '56', 10210, '', 0, '', 'ÎœÏÎºÎ¿Î½Î¿Ï‚', 1),
(1243, '57', 10210, '', 0, '', 'ÎÎ¬Î¾Î¿Ï‚', 1),
(1244, '58', 10210, '', 0, '', 'Î Î¬ÏÎ¿Ï‚', 1),
(1245, '59', 10210, '', 0, '', 'Î¡ÏŒÎ´Î¿Ï‚', 1),
(1246, '60', 10210, '', 0, '', 'Î£ÏÏÎ¿Ï‚', 1),
(1247, '61', 10210, '', 0, '', 'Î¤Î®Î½Î¿Ï‚', 1),
(1248, '62', 10204, '', 0, '', 'Î—ÏÎ¬ÎºÎ»ÎµÎ¹Î¿', 1),
(1249, '63', 10204, '', 0, '', 'Î›Î±ÏƒÎ¯Î¸Î¹', 1),
(1250, '64', 10204, '', 0, '', 'Î¡Î­Î¸Ï…Î¼Î½Î¿', 1),
(1251, '65', 10204, '', 0, '', 'Î§Î±Î½Î¹Î¬', 1),
(1252, 'AG', 601, NULL, NULL, 'ARGOVIE', 'Argovie', 1),
(1253, 'AI', 601, NULL, NULL, 'APPENZELL RHODES INTERIEURES', 'Appenzell Rhodes intĂ©rieures', 1),
(1254, 'AR', 601, NULL, NULL, 'APPENZELL RHODES EXTERIEURES', 'Appenzell Rhodes extĂ©rieures', 1),
(1255, 'BE', 601, NULL, NULL, 'BERNE', 'Berne', 1),
(1256, 'BL', 601, NULL, NULL, 'BALE CAMPAGNE', 'BĂ¢le Campagne', 1),
(1257, 'BS', 601, NULL, NULL, 'BALE VILLE', 'BĂ¢le Ville', 1),
(1258, 'FR', 601, NULL, NULL, 'FRIBOURG', 'Fribourg', 1),
(1259, 'GE', 601, NULL, NULL, 'GENEVE', 'GenĂ¨ve', 1),
(1260, 'GL', 601, NULL, NULL, 'GLARIS', 'Glaris', 1),
(1261, 'GR', 601, NULL, NULL, 'GRISONS', 'Grisons', 1),
(1262, 'JU', 601, NULL, NULL, 'JURA', 'Jura', 1),
(1263, 'LU', 601, NULL, NULL, 'LUCERNE', 'Lucerne', 1),
(1264, 'NE', 601, NULL, NULL, 'NEUCHATEL', 'NeuchĂ¢tel', 1),
(1265, 'NW', 601, NULL, NULL, 'NIDWALD', 'Nidwald', 1),
(1266, 'OW', 601, NULL, NULL, 'OBWALD', 'Obwald', 1),
(1267, 'SG', 601, NULL, NULL, 'SAINT-GALL', 'Saint-Gall', 1),
(1268, 'SH', 601, NULL, NULL, 'SCHAFFHOUSE', 'Schaffhouse', 1),
(1269, 'SO', 601, NULL, NULL, 'SOLEURE', 'Soleure', 1),
(1270, 'SZ', 601, NULL, NULL, 'SCHWYZ', 'Schwyz', 1),
(1271, 'TG', 601, NULL, NULL, 'THURGOVIE', 'Thurgovie', 1),
(1272, 'TI', 601, NULL, NULL, 'TESSIN', 'Tessin', 1),
(1273, 'UR', 601, NULL, NULL, 'URI', 'Uri', 1),
(1274, 'VD', 601, NULL, NULL, 'VAUD', 'Vaud', 1),
(1275, 'VS', 601, NULL, NULL, 'VALAIS', 'Valais', 1),
(1276, 'ZG', 601, NULL, NULL, 'ZUG', 'Zug', 1),
(1277, 'ZH', 601, NULL, NULL, 'ZURICH', 'ZĂ¼rich', 1),
(1278, '701', 701, NULL, 0, NULL, 'Bedfordshire', 1),
(1279, '702', 701, NULL, 0, NULL, 'Berkshire', 1),
(1280, '703', 701, NULL, 0, NULL, 'Bristol, City of', 1),
(1281, '704', 701, NULL, 0, NULL, 'Buckinghamshire', 1),
(1282, '705', 701, NULL, 0, NULL, 'Cambridgeshire', 1),
(1283, '706', 701, NULL, 0, NULL, 'Cheshire', 1),
(1284, '707', 701, NULL, 0, NULL, 'Cleveland', 1),
(1285, '708', 701, NULL, 0, NULL, 'Cornwall', 1),
(1286, '709', 701, NULL, 0, NULL, 'Cumberland', 1),
(1287, '710', 701, NULL, 0, NULL, 'Cumbria', 1),
(1288, '711', 701, NULL, 0, NULL, 'Derbyshire', 1),
(1289, '712', 701, NULL, 0, NULL, 'Devon', 1),
(1290, '713', 701, NULL, 0, NULL, 'Dorset', 1),
(1291, '714', 701, NULL, 0, NULL, 'Co. Durham', 1),
(1292, '715', 701, NULL, 0, NULL, 'East Riding of Yorkshire', 1),
(1293, '716', 701, NULL, 0, NULL, 'East Sussex', 1),
(1294, '717', 701, NULL, 0, NULL, 'Essex', 1),
(1295, '718', 701, NULL, 0, NULL, 'Gloucestershire', 1),
(1296, '719', 701, NULL, 0, NULL, 'Greater Manchester', 1),
(1297, '720', 701, NULL, 0, NULL, 'Hampshire', 1),
(1298, '721', 701, NULL, 0, NULL, 'Hertfordshire', 1),
(1299, '722', 701, NULL, 0, NULL, 'Hereford and Worcester', 1),
(1300, '723', 701, NULL, 0, NULL, 'Herefordshire', 1),
(1301, '724', 701, NULL, 0, NULL, 'Huntingdonshire', 1),
(1302, '725', 701, NULL, 0, NULL, 'Isle of Man', 1),
(1303, '726', 701, NULL, 0, NULL, 'Isle of Wight', 1),
(1304, '727', 701, NULL, 0, NULL, 'Jersey', 1),
(1305, '728', 701, NULL, 0, NULL, 'Kent', 1),
(1306, '729', 701, NULL, 0, NULL, 'Lancashire', 1),
(1307, '730', 701, NULL, 0, NULL, 'Leicestershire', 1),
(1308, '731', 701, NULL, 0, NULL, 'Lincolnshire', 1),
(1309, '732', 701, NULL, 0, NULL, 'London - City of London', 1),
(1310, '733', 701, NULL, 0, NULL, 'Merseyside', 1),
(1311, '734', 701, NULL, 0, NULL, 'Middlesex', 1),
(1312, '735', 701, NULL, 0, NULL, 'Norfolk', 1),
(1313, '736', 701, NULL, 0, NULL, 'North Yorkshire', 1),
(1314, '737', 701, NULL, 0, NULL, 'North Riding of Yorkshire', 1),
(1315, '738', 701, NULL, 0, NULL, 'Northamptonshire', 1),
(1316, '739', 701, NULL, 0, NULL, 'Northumberland', 1),
(1317, '740', 701, NULL, 0, NULL, 'Nottinghamshire', 1),
(1318, '741', 701, NULL, 0, NULL, 'Oxfordshire', 1),
(1319, '742', 701, NULL, 0, NULL, 'Rutland', 1),
(1320, '743', 701, NULL, 0, NULL, 'Shropshire', 1),
(1321, '744', 701, NULL, 0, NULL, 'Somerset', 1),
(1322, '745', 701, NULL, 0, NULL, 'Staffordshire', 1),
(1323, '746', 701, NULL, 0, NULL, 'Suffolk', 1),
(1324, '747', 701, NULL, 0, NULL, 'Surrey', 1),
(1325, '748', 701, NULL, 0, NULL, 'Sussex', 1),
(1326, '749', 701, NULL, 0, NULL, 'Tyne and Wear', 1),
(1327, '750', 701, NULL, 0, NULL, 'Warwickshire', 1),
(1328, '751', 701, NULL, 0, NULL, 'West Midlands', 1),
(1329, '752', 701, NULL, 0, NULL, 'West Sussex', 1),
(1330, '753', 701, NULL, 0, NULL, 'West Yorkshire', 1),
(1331, '754', 701, NULL, 0, NULL, 'West Riding of Yorkshire', 1),
(1332, '755', 701, NULL, 0, NULL, 'Wiltshire', 1),
(1333, '756', 701, NULL, 0, NULL, 'Worcestershire', 1),
(1334, '757', 701, NULL, 0, NULL, 'Yorkshire', 1),
(1335, '758', 702, NULL, 0, NULL, 'Anglesey', 1),
(1336, '759', 702, NULL, 0, NULL, 'Breconshire', 1),
(1337, '760', 702, NULL, 0, NULL, 'Caernarvonshire', 1),
(1338, '761', 702, NULL, 0, NULL, 'Cardiganshire', 1),
(1339, '762', 702, NULL, 0, NULL, 'Carmarthenshire', 1),
(1340, '763', 702, NULL, 0, NULL, 'Ceredigion', 1),
(1341, '764', 702, NULL, 0, NULL, 'Denbighshire', 1),
(1342, '765', 702, NULL, 0, NULL, 'Flintshire', 1),
(1343, '766', 702, NULL, 0, NULL, 'Glamorgan', 1),
(1344, '767', 702, NULL, 0, NULL, 'Gwent', 1),
(1345, '768', 702, NULL, 0, NULL, 'Gwynedd', 1),
(1346, '769', 702, NULL, 0, NULL, 'Merionethshire', 1),
(1347, '770', 702, NULL, 0, NULL, 'Monmouthshire', 1),
(1348, '771', 702, NULL, 0, NULL, 'Mid Glamorgan', 1),
(1349, '772', 702, NULL, 0, NULL, 'Montgomeryshire', 1),
(1350, '773', 702, NULL, 0, NULL, 'Pembrokeshire', 1),
(1351, '774', 702, NULL, 0, NULL, 'Powys', 1),
(1352, '775', 702, NULL, 0, NULL, 'Radnorshire', 1),
(1353, '776', 702, NULL, 0, NULL, 'South Glamorgan', 1),
(1354, '777', 703, NULL, 0, NULL, 'Aberdeen, City of', 1),
(1355, '778', 703, NULL, 0, NULL, 'Angus', 1),
(1356, '779', 703, NULL, 0, NULL, 'Argyll', 1),
(1357, '780', 703, NULL, 0, NULL, 'Ayrshire', 1),
(1358, '781', 703, NULL, 0, NULL, 'Banffshire', 1),
(1359, '782', 703, NULL, 0, NULL, 'Berwickshire', 1),
(1360, '783', 703, NULL, 0, NULL, 'Bute', 1),
(1361, '784', 703, NULL, 0, NULL, 'Caithness', 1),
(1362, '785', 703, NULL, 0, NULL, 'Clackmannanshire', 1),
(1363, '786', 703, NULL, 0, NULL, 'Dumfriesshire', 1),
(1364, '787', 703, NULL, 0, NULL, 'Dumbartonshire', 1),
(1365, '788', 703, NULL, 0, NULL, 'Dundee, City of', 1),
(1366, '789', 703, NULL, 0, NULL, 'East Lothian', 1),
(1367, '790', 703, NULL, 0, NULL, 'Fife', 1),
(1368, '791', 703, NULL, 0, NULL, 'Inverness', 1),
(1369, '792', 703, NULL, 0, NULL, 'Kincardineshire', 1),
(1370, '793', 703, NULL, 0, NULL, 'Kinross-shire', 1),
(1371, '794', 703, NULL, 0, NULL, 'Kirkcudbrightshire', 1),
(1372, '795', 703, NULL, 0, NULL, 'Lanarkshire', 1),
(1373, '796', 703, NULL, 0, NULL, 'Midlothian', 1),
(1374, '797', 703, NULL, 0, NULL, 'Morayshire', 1),
(1375, '798', 703, NULL, 0, NULL, 'Nairnshire', 1),
(1376, '799', 703, NULL, 0, NULL, 'Orkney', 1),
(1377, '800', 703, NULL, 0, NULL, 'Peebleshire', 1),
(1378, '801', 703, NULL, 0, NULL, 'Perthshire', 1),
(1379, '802', 703, NULL, 0, NULL, 'Renfrewshire', 1),
(1380, '803', 703, NULL, 0, NULL, 'Ross & Cromarty', 1),
(1381, '804', 703, NULL, 0, NULL, 'Roxburghshire', 1),
(1382, '805', 703, NULL, 0, NULL, 'Selkirkshire', 1),
(1383, '806', 703, NULL, 0, NULL, 'Shetland', 1),
(1384, '807', 703, NULL, 0, NULL, 'Stirlingshire', 1),
(1385, '808', 703, NULL, 0, NULL, 'Sutherland', 1),
(1386, '809', 703, NULL, 0, NULL, 'West Lothian', 1),
(1387, '810', 703, NULL, 0, NULL, 'Wigtownshire', 1),
(1388, '811', 704, NULL, 0, NULL, 'Antrim', 1),
(1389, '812', 704, NULL, 0, NULL, 'Armagh', 1),
(1390, '813', 704, NULL, 0, NULL, 'Co. Down', 1),
(1391, '814', 704, NULL, 0, NULL, 'Co. Fermanagh', 1),
(1392, '815', 704, NULL, 0, NULL, 'Co. Londonderry', 1),
(1393, 'SS', 8601, '', 0, '', 'San Salvador', 1),
(1394, 'SA', 8603, '', 0, '', 'Santa Ana', 1),
(1395, 'AH', 8603, '', 0, '', 'Ahuachapan', 1),
(1396, 'SO', 8603, '', 0, '', 'Sonsonate', 1),
(1397, 'US', 8602, '', 0, '', 'Usulutan', 1),
(1398, 'SM', 8602, '', 0, '', 'San Miguel', 1),
(1399, 'MO', 8602, '', 0, '', 'Morazan', 1),
(1400, 'LU', 8602, '', 0, '', 'La Union', 1),
(1401, 'LL', 8601, '', 0, '', 'La Libertad', 1),
(1402, 'CH', 8601, '', 0, '', 'Chalatenango', 1),
(1403, 'CA', 8601, '', 0, '', 'CabaĂ±as', 1),
(1404, 'LP', 8601, '', 0, '', 'La Paz', 1),
(1405, 'SV', 8601, '', 0, '', 'San Vicente', 1),
(1406, 'CU', 8601, '', 0, '', 'Cuscatlan', 1),
(1407, 'AN', 11701, NULL, 0, 'AN', 'Andaman & Nicobar', 1),
(1408, 'AP', 11701, NULL, 0, 'AP', 'Andhra Pradesh', 1),
(1409, 'AR', 11701, NULL, 0, 'AR', 'Arunachal Pradesh', 1),
(1410, 'AS', 11701, NULL, 0, 'AS', 'Assam', 1),
(1411, 'BR', 11701, NULL, 0, 'BR', 'Bihar', 1),
(1412, 'CG', 11701, NULL, 0, 'CG', 'Chattisgarh', 1),
(1413, 'CH', 11701, NULL, 0, 'CH', 'Chandigarh', 1),
(1414, 'DD', 11701, NULL, 0, 'DD', 'Daman & Diu', 1),
(1415, 'DL', 11701, NULL, 0, 'DL', 'Delhi', 1),
(1416, 'DN', 11701, NULL, 0, 'DN', 'Dadra and Nagar Haveli', 1),
(1417, 'GA', 11701, NULL, 0, 'GA', 'Goa', 1),
(1418, 'GJ', 11701, NULL, 0, 'GJ', 'Gujarat', 1),
(1419, 'HP', 11701, NULL, 0, 'HP', 'Himachal Pradesh', 1),
(1420, 'HR', 11701, NULL, 0, 'HR', 'Haryana', 1),
(1421, 'JH', 11701, NULL, 0, 'JH', 'Jharkhand', 1),
(1422, 'JK', 11701, NULL, 0, 'JK', 'Jammu & Kashmir', 1),
(1423, 'KA', 11701, NULL, 0, 'KA', 'Karnataka', 1),
(1424, 'KL', 11701, NULL, 0, 'KL', 'Kerala', 1),
(1425, 'LD', 11701, NULL, 0, 'LD', 'Lakshadweep', 1),
(1426, 'MH', 11701, NULL, 0, 'MH', 'Maharashtra', 1),
(1427, 'ML', 11701, NULL, 0, 'ML', 'Meghalaya', 1),
(1428, 'MN', 11701, NULL, 0, 'MN', 'Manipur', 1),
(1429, 'MP', 11701, NULL, 0, 'MP', 'Madhya Pradesh', 1),
(1430, 'MZ', 11701, NULL, 0, 'MZ', 'Mizoram', 1),
(1431, 'NL', 11701, NULL, 0, 'NL', 'Nagaland', 1),
(1432, 'OR', 11701, NULL, 0, 'OR', 'Orissa', 1),
(1433, 'PB', 11701, NULL, 0, 'PB', 'Punjab', 1),
(1434, 'PY', 11701, NULL, 0, 'PY', 'Puducherry', 1),
(1435, 'RJ', 11701, NULL, 0, 'RJ', 'Rajasthan', 1),
(1436, 'SK', 11701, NULL, 0, 'SK', 'Sikkim', 1),
(1437, 'TE', 11701, NULL, 0, 'TE', 'Telangana', 1),
(1438, 'TN', 11701, NULL, 0, 'TN', 'Tamil Nadu', 1),
(1439, 'TR', 11701, NULL, 0, 'TR', 'Tripura', 1),
(1440, 'UL', 11701, NULL, 0, 'UL', 'Uttarakhand', 1),
(1441, 'UP', 11701, NULL, 0, 'UP', 'Uttar Pradesh', 1),
(1442, 'WB', 11701, NULL, 0, 'WB', 'West Bengal', 1),
(1443, 'BA', 11801, NULL, 0, 'BA', 'Bali', 1),
(1444, 'BB', 11801, NULL, 0, 'BB', 'Bangka Belitung', 1),
(1445, 'BT', 11801, NULL, 0, 'BT', 'Banten', 1),
(1446, 'BE', 11801, NULL, 0, 'BA', 'Bengkulu', 1),
(1447, 'YO', 11801, NULL, 0, 'YO', 'DI Yogyakarta', 1),
(1448, 'JK', 11801, NULL, 0, 'JK', 'DKI Jakarta', 1),
(1449, 'GO', 11801, NULL, 0, 'GO', 'Gorontalo', 1),
(1450, 'JA', 11801, NULL, 0, 'JA', 'Jambi', 1),
(1451, 'JB', 11801, NULL, 0, 'JB', 'Jawa Barat', 1),
(1452, 'JT', 11801, NULL, 0, 'JT', 'Jawa Tengah', 1),
(1453, 'JI', 11801, NULL, 0, 'JI', 'Jawa Timur', 1),
(1454, 'KB', 11801, NULL, 0, 'KB', 'Kalimantan Barat', 1),
(1455, 'KS', 11801, NULL, 0, 'KS', 'Kalimantan Selatan', 1),
(1456, 'KT', 11801, NULL, 0, 'KT', 'Kalimantan Tengah', 1),
(1457, 'KI', 11801, NULL, 0, 'KI', 'Kalimantan Timur', 1),
(1458, 'KU', 11801, NULL, 0, 'KU', 'Kalimantan Utara', 1),
(1459, 'KR', 11801, NULL, 0, 'KR', 'Kepulauan Riau', 1),
(1460, 'LA', 11801, NULL, 0, 'LA', 'Lampung', 1),
(1461, 'MA', 11801, NULL, 0, 'MA', 'Maluku', 1),
(1462, 'MU', 11801, NULL, 0, 'MU', 'Maluku Utara', 1),
(1463, 'AC', 11801, NULL, 0, 'AC', 'Nanggroe Aceh Darussalam', 1),
(1464, 'NB', 11801, NULL, 0, 'NB', 'Nusa Tenggara Barat', 1),
(1465, 'NT', 11801, NULL, 0, 'NT', 'Nusa Tenggara Timur', 1),
(1466, 'PA', 11801, NULL, 0, 'PA', 'Papua', 1),
(1467, 'PB', 11801, NULL, 0, 'PB', 'Papua Barat', 1),
(1468, 'RI', 11801, NULL, 0, 'RI', 'Riau', 1),
(1469, 'SR', 11801, NULL, 0, 'SR', 'Sulawesi Barat', 1),
(1470, 'SN', 11801, NULL, 0, 'SN', 'Sulawesi Selatan', 1),
(1471, 'ST', 11801, NULL, 0, 'ST', 'Sulawesi Tengah', 1),
(1472, 'SG', 11801, NULL, 0, 'SG', 'Sulawesi Tenggara', 1),
(1473, 'SA', 11801, NULL, 0, 'SA', 'Sulawesi Utara', 1),
(1474, 'SB', 11801, NULL, 0, 'SB', 'Sumatera Barat', 1),
(1475, 'SS', 11801, NULL, 0, 'SS', 'Sumatera Selatan', 1),
(1476, 'SU', 11801, NULL, 0, 'SU', 'Sumatera Utara	', 1),
(1477, 'CMX', 15401, '', 0, 'CMX', 'Ciudad de MĂ©xico', 1),
(1478, 'AGS', 15401, '', 0, 'AGS', 'Aguascalientes', 1),
(1479, 'BCN', 15401, '', 0, 'BCN', 'Baja California Norte', 1),
(1480, 'BCS', 15401, '', 0, 'BCS', 'Baja California Sur', 1),
(1481, 'CAM', 15401, '', 0, 'CAM', 'Campeche', 1),
(1482, 'CHP', 15401, '', 0, 'CHP', 'Chiapas', 1),
(1483, 'CHI', 15401, '', 0, 'CHI', 'Chihuahua', 1),
(1484, 'COA', 15401, '', 0, 'COA', 'Coahuila', 1),
(1485, 'COL', 15401, '', 0, 'COL', 'Colima', 1),
(1486, 'DUR', 15401, '', 0, 'DUR', 'Durango', 1),
(1487, 'GTO', 15401, '', 0, 'GTO', 'Guanajuato', 1),
(1488, 'GRO', 15401, '', 0, 'GRO', 'Guerrero', 1),
(1489, 'HGO', 15401, '', 0, 'HGO', 'Hidalgo', 1),
(1490, 'JAL', 15401, '', 0, 'JAL', 'Jalisco', 1),
(1491, 'MEX', 15401, '', 0, 'MEX', 'MĂ©xico', 1),
(1492, 'MIC', 15401, '', 0, 'MIC', 'MichoacĂ¡n de Ocampo', 1),
(1493, 'MOR', 15401, '', 0, 'MOR', 'Morelos', 1),
(1494, 'NAY', 15401, '', 0, 'NAY', 'Nayarit', 1),
(1495, 'NLE', 15401, '', 0, 'NLE', 'Nuevo LeĂ³n', 1),
(1496, 'OAX', 15401, '', 0, 'OAX', 'Oaxaca', 1),
(1497, 'PUE', 15401, '', 0, 'PUE', 'Puebla', 1),
(1498, 'QRO', 15401, '', 0, 'QRO', 'QuerĂ©taro', 1),
(1499, 'ROO', 15401, '', 0, 'ROO', 'Quintana Roo', 1),
(1500, 'SLP', 15401, '', 0, 'SLP', 'San Luis PotosĂ­', 1),
(1501, 'SIN', 15401, '', 0, 'SIN', 'Sinaloa', 1),
(1502, 'SON', 15401, '', 0, 'SON', 'Sonora', 1),
(1503, 'TAB', 15401, '', 0, 'TAB', 'Tabasco', 1),
(1504, 'TAM', 15401, '', 0, 'TAM', 'Tamaulipas', 1),
(1505, 'TLX', 15401, '', 0, 'TLX', 'Tlaxcala', 1),
(1506, 'VER', 15401, '', 0, 'VER', 'Veracruz', 1),
(1507, 'YUC', 15401, '', 0, 'YUC', 'YucatĂ¡n', 1),
(1508, 'ZAC', 15401, '', 0, 'ZAC', 'Zacatecas', 1),
(1509, 'VE-L', 23201, '', 0, 'VE-L', 'MĂ©rida', 1),
(1510, 'VE-T', 23201, '', 0, 'VE-T', 'Trujillo', 1),
(1511, 'VE-E', 23201, '', 0, 'VE-E', 'Barinas', 1),
(1512, 'VE-M', 23202, '', 0, 'VE-M', 'Miranda', 1),
(1513, 'VE-W', 23202, '', 0, 'VE-W', 'Vargas', 1),
(1514, 'VE-A', 23202, '', 0, 'VE-A', 'Distrito Capital', 1),
(1515, 'VE-D', 23203, '', 0, 'VE-D', 'Aragua', 1),
(1516, 'VE-G', 23203, '', 0, 'VE-G', 'Carabobo', 1),
(1517, 'VE-I', 23204, '', 0, 'VE-I', 'FalcĂ³n', 1),
(1518, 'VE-K', 23204, '', 0, 'VE-K', 'Lara', 1),
(1519, 'VE-U', 23204, '', 0, 'VE-U', 'Yaracuy', 1),
(1520, 'VE-F', 23205, '', 0, 'VE-F', 'BolĂ­var', 1),
(1521, 'VE-X', 23205, '', 0, 'VE-X', 'Amazonas', 1),
(1522, 'VE-Y', 23205, '', 0, 'VE-Y', 'Delta Amacuro', 1),
(1523, 'VE-O', 23206, '', 0, 'VE-O', 'Nueva Esparta', 1),
(1524, 'VE-Z', 23206, '', 0, 'VE-Z', 'Dependencias Federales', 1),
(1525, 'VE-C', 23207, '', 0, 'VE-C', 'Apure', 1),
(1526, 'VE-J', 23207, '', 0, 'VE-J', 'GuĂ¡rico', 1),
(1527, 'VE-H', 23207, '', 0, 'VE-H', 'Cojedes', 1),
(1528, 'VE-P', 23207, '', 0, 'VE-P', 'Portuguesa', 1),
(1529, 'VE-B', 23208, '', 0, 'VE-B', 'AnzoĂ¡tegui', 1),
(1530, 'VE-N', 23208, '', 0, 'VE-N', 'Monagas', 1),
(1531, 'VE-R', 23208, '', 0, 'VE-R', 'Sucre', 1),
(1532, 'VE-V', 23209, '', 0, 'VE-V', 'Zulia', 1),
(1533, 'VE-S', 23209, '', 0, 'VE-S', 'TĂ¡chira', 1),
(1534, 'AE-1', 22701, '', 0, '', 'Abu Dhabi', 1),
(1535, 'AE-2', 22701, '', 0, '', 'Dubai', 1),
(1536, 'AE-3', 22701, '', 0, '', 'Ajman', 1),
(1537, 'AE-4', 22701, '', 0, '', 'Fujairah', 1),
(1538, 'AE-5', 22701, '', 0, '', 'Ras al-Khaimah', 1),
(1539, 'AE-6', 22701, '', 0, '', 'Sharjah', 1),
(1540, 'AE-7', 22701, '', 0, '', 'Umm al-Quwain', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_ecotaxe`
--

CREATE TABLE `erp_c_ecotaxe` (
  `rowid` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_ecotaxe`
--

INSERT INTO `erp_c_ecotaxe` (`rowid`, `code`, `label`, `price`, `organization`, `fk_pays`, `active`) VALUES
(1, '25040', 'PETIT APPAREILS MENAGERS', 0.25000000, 'Eco-systĂ¨mes', 1, 1),
(2, '25050', 'TRES PETIT APPAREILS MENAGERS', 0.08000000, 'Eco-systĂ¨mes', 1, 1),
(3, '32070', 'ECRAN POIDS < 5 KG', 2.08000000, 'Eco-systĂ¨mes', 1, 1),
(4, '32080', 'ECRAN POIDS > 5 KG', 1.25000000, 'Eco-systĂ¨mes', 1, 1),
(5, '32051', 'ORDINATEUR PORTABLE', 0.42000000, 'Eco-systĂ¨mes', 1, 1),
(6, '32061', 'TABLETTE INFORMATIQUE', 0.84000000, 'Eco-systĂ¨mes', 1, 1),
(7, '36011', 'ORDINATEUR FIXE (UC)', 1.15000000, 'Eco-systĂ¨mes', 1, 1),
(8, '36021', 'IMPRIMANTES', 0.83000000, 'Eco-systĂ¨mes', 1, 1),
(9, '36030', 'IT (INFORMATIQUE ET TELECOMS)', 0.83000000, 'Eco-systĂ¨mes', 1, 1),
(10, '36040', 'PETIT IT (CLAVIERS / SOURIS)', 0.08000000, 'Eco-systĂ¨mes', 1, 1),
(11, '36050', 'TELEPHONIE MOBILE', 0.02000000, 'Eco-systĂ¨mes', 1, 1),
(12, '36060', 'CONNECTIQUE CABLES', 0.02000000, 'Eco-systĂ¨mes', 1, 1),
(13, '45010', 'GROS MATERIEL GRAND PUBLIC (TELEAGRANDISSEURS)', 1.67000000, 'Eco-systĂ¨mes', 1, 1),
(14, '45020', 'MOYEN MATERIEL GRAND PUBLIC (LOUPES ELECTRONIQUES)', 0.42000000, 'Eco-systĂ¨mes', 1, 1),
(15, '45030', 'PETIT MATERIEL GRAND PUBLIC (VIE QUOTIDIENNE)', 0.08000000, 'Eco-systĂ¨mes', 1, 1),
(16, '75030', 'JOUETS < 0,5 KG', 0.08000000, 'Eco-systĂ¨mes', 1, 1),
(17, '75040', 'JOUETS ENTRE 0,5 KG ET 10 KG', 0.17000000, 'Eco-systĂ¨mes', 1, 1),
(18, '74050', 'JOUETS > 10 KG', 1.67000000, 'Eco-systĂ¨mes', 1, 1),
(19, '85010', 'EQUIPEMENT MEDICAL < 0,5 KG', 0.08000000, 'Eco-systĂ¨mes', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_effectif`
--

CREATE TABLE `erp_c_effectif` (
  `id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_effectif`
--

INSERT INTO `erp_c_effectif` (`id`, `code`, `libelle`, `active`, `module`) VALUES
(0, 'EF0', '-', 1, NULL),
(1, 'EF1-5', '1 - 5', 1, NULL),
(2, 'EF6-10', '6 - 10', 1, NULL),
(3, 'EF11-50', '11 - 50', 1, NULL),
(4, 'EF51-100', '51 - 100', 1, NULL),
(5, 'EF100-500', '100 - 500', 1, NULL),
(6, 'EF500-', '> 500', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_email_senderprofile`
--

CREATE TABLE `erp_c_email_senderprofile` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `private` smallint(6) NOT NULL DEFAULT 0,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` smallint(6) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_email_templates`
--

CREATE TABLE `erp_c_email_templates` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_template` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `private` smallint(6) NOT NULL DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `enabled` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `topic` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joinfiles` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_lines` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_email_templates`
--

INSERT INTO `erp_c_email_templates` (`rowid`, `entity`, `module`, `type_template`, `lang`, `private`, `fk_user`, `datec`, `tms`, `label`, `position`, `enabled`, `active`, `topic`, `joinfiles`, `content`, `content_lines`) VALUES
(1, 0, 'banque', 'thirdparty', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(YourSEPAMandate)', 1, '$conf->societe->enabled && $conf->banque->enabled && $conf->prelevement->enabled', 0, '__(YourSEPAMandate)__', '0', '__(Hello)__,<br><br>\n\n__(FindYourSEPAMandate)__ :<br>\n__MYCOMPANY_NAME__<br>\n__MYCOMPANY_FULLADDRESS__<br><br>\n__(Sincerely)__<br>\n__USER_SIGNATURE__', NULL),
(2, 0, 'adherent', 'member', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(SendingEmailOnAutoSubscription)', 10, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipRequestWasReceived)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipRequestWasReceived)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(3, 0, 'adherent', 'member', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(SendingEmailOnMemberValidation)', 20, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasValidated)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipWasValidated)__<br>__(FirstName)__ : __MEMBER_FIRSTNAME__<br>__(LastName)__ : __MEMBER_LASTNAME__<br>__(ID)__ : __MEMBER_ID__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(4, 0, 'adherent', 'member', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(SendingEmailOnNewSubscription)', 30, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourSubscriptionWasRecorded)__', '1', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourSubscriptionWasRecorded)__<br>\n\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(5, 0, 'adherent', 'member', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(SendingReminderForExpiredSubscription)', 40, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(SubscriptionReminderEmail)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfSubscriptionReminderEmail)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(6, 0, 'adherent', 'member', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(SendingEmailOnCancelation)', 50, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasCanceled)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(YourMembershipWasCanceled)__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(7, 0, 'adherent', 'member', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(SendingAnEMailToMember)', 60, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(CardContent)__', '0', '__(Hello)__,<br><br>\n\n__(ThisIsContentOfYourCard)__<br>\n__(ID)__ : __ID__<br>\n__(Civility)__ : __MEMBER_CIVILITY__<br>\n__(Firstname)__ : __MEMBER_FIRSTNAME__<br>\n__(Lastname)__ : __MEMBER_LASTNAME__<br>\n__(Fullname)__ : __MEMBER_FULLNAME__<br>\n__(Company)__ : __MEMBER_COMPANY__<br>\n__(Address)__ : __MEMBER_ADDRESS__<br>\n__(Zip)__ : __MEMBER_ZIP__<br>\n__(Town)__ : __MEMBER_TOWN__<br>\n__(Country)__ : __MEMBER_COUNTRY__<br>\n__(Email)__ : __MEMBER_EMAIL__<br>\n__(Birthday)__ : __MEMBER_BIRTH__<br>\n__(Photo)__ : __MEMBER_PHOTO__<br>\n__(Login)__ : __MEMBER_LOGIN__<br>\n__(Phone)__ : __MEMBER_PHONE__<br>\n__(PhonePerso)__ : __MEMBER_PHONEPRO__<br>\n__(PhoneMobile)__ : __MEMBER_PHONEMOBILE__<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(8, 0, 'recruitment', 'recruitmentcandidature_send', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(AnswerCandidature)', 100, '$conf->recruitment->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourCandidature)__', '0', '__(Hello)__ __CANDIDATE_FULLNAME__,<br><br>\n\n__(YourCandidatureAnswerMessage)__<br>__ONLINE_INTERVIEW_SCHEDULER_TEXT_AND_URL__\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(9, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(EventOrganizationEmailAskConf)', 10, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskConf)__', NULL, '__(Hello)__,<br /><br />__(OrganizationEventConfRequestWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(10, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(EventOrganizationEmailAskBooth)', 20, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskBooth)__', NULL, '__(Hello)__,<br /><br />__(OrganizationEventBoothRequestWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(11, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(EventOrganizationEmailSubsBooth)', 30, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailBoothPayment)__', NULL, '__(Hello)__,<br /><br />__(OrganizationEventPaymentOfBoothWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(12, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(EventOrganizationEmailSubsEvent)', 40, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailRegistrationPayment)__', NULL, '__(Hello)__,<br /><br />__(OrganizationEventPaymentOfRegistrationWasReceived)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(13, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(EventOrganizationMassEmailAttendees)', 50, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailAttendees)__', NULL, '__(Hello)__,<br /><br />__(OrganizationEventBulkMailToAttendees)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(14, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(EventOrganizationMassEmailSpeakers)', 60, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailSpeakers)__', NULL, '__(Hello)__,<br /><br />__(OrganizationEventBulkMailToSpeakers)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(15, 0, 'partnership', 'partnership_send', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(SendingEmailOnPartnershipWillSoonBeCanceled)', 100, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipWillSoonBeCanceledTopic)__', '0', '<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipWillSoonBeCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n', NULL),
(16, 0, 'partnership', 'partnership_send', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(SendingEmailOnPartnershipCanceled)', 100, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipCanceledTopic)__', '0', '<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n', NULL),
(17, 0, 'partnership', 'partnership_send', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(SendingEmailOnPartnershipRefused)', 100, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipRefusedTopic)__', '0', '<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipRefusedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n', NULL),
(18, 0, 'partnership', 'partnership_send', '', 0, NULL, NULL, '2021-11-09 04:36:55', '(SendingEmailOnPartnershipAccepted)', 100, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipAcceptedTopic)__', '0', '<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipAcceptedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_exp_tax_cat`
--

CREATE TABLE `erp_c_exp_tax_cat` (
  `rowid` int(11) NOT NULL,
  `label` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_exp_tax_cat`
--

INSERT INTO `erp_c_exp_tax_cat` (`rowid`, `label`, `entity`, `active`) VALUES
(1, 'ExpAutoCat', 1, 0),
(2, 'ExpCycloCat', 1, 0),
(3, 'ExpMotoCat', 1, 0),
(4, 'ExpAuto3CV', 1, 1),
(5, 'ExpAuto4CV', 1, 1),
(6, 'ExpAuto5CV', 1, 1),
(7, 'ExpAuto6CV', 1, 1),
(8, 'ExpAuto7CV', 1, 1),
(9, 'ExpAuto8CV', 1, 1),
(10, 'ExpAuto9CV', 1, 0),
(11, 'ExpAuto10CV', 1, 0),
(12, 'ExpAuto11CV', 1, 0),
(13, 'ExpAuto12CV', 1, 0),
(14, 'ExpAuto3PCV', 1, 0),
(15, 'ExpAuto4PCV', 1, 0),
(16, 'ExpAuto5PCV', 1, 0),
(17, 'ExpAuto6PCV', 1, 0),
(18, 'ExpAuto7PCV', 1, 0),
(19, 'ExpAuto8PCV', 1, 0),
(20, 'ExpAuto9PCV', 1, 0),
(21, 'ExpAuto10PCV', 1, 0),
(22, 'ExpAuto11PCV', 1, 0),
(23, 'ExpAuto12PCV', 1, 0),
(24, 'ExpAuto13PCV', 1, 0),
(25, 'ExpCyclo', 1, 0),
(26, 'ExpMoto12CV', 1, 0),
(27, 'ExpMoto345CV', 1, 0),
(28, 'ExpMoto5PCV', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_exp_tax_range`
--

CREATE TABLE `erp_c_exp_tax_range` (
  `rowid` int(11) NOT NULL,
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT 1,
  `range_ik` double NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_exp_tax_range`
--

INSERT INTO `erp_c_exp_tax_range` (`rowid`, `fk_c_exp_tax_cat`, `range_ik`, `entity`, `active`) VALUES
(1, 4, 0, 1, 1),
(2, 4, 5000, 1, 1),
(3, 4, 20000, 1, 1),
(4, 5, 0, 1, 1),
(5, 5, 5000, 1, 1),
(6, 5, 20000, 1, 1),
(7, 6, 0, 1, 1),
(8, 6, 5000, 1, 1),
(9, 6, 20000, 1, 1),
(10, 7, 0, 1, 1),
(11, 7, 5000, 1, 1),
(12, 7, 20000, 1, 1),
(13, 8, 0, 1, 1),
(14, 8, 5000, 1, 1),
(15, 8, 20000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_field_list`
--

CREATE TABLE `erp_c_field_list` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `element` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `align` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `sort` tinyint(4) NOT NULL DEFAULT 1,
  `search` tinyint(4) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `enabled` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_format_cards`
--

CREATE TABLE `erp_c_format_cards` (
  `rowid` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paper_size` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orientation` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metric` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leftmargin` double(24,8) NOT NULL,
  `topmargin` double(24,8) NOT NULL,
  `nx` int(11) NOT NULL,
  `ny` int(11) NOT NULL,
  `spacex` double(24,8) NOT NULL,
  `spacey` double(24,8) NOT NULL,
  `width` double(24,8) NOT NULL,
  `height` double(24,8) NOT NULL,
  `font_size` int(11) NOT NULL,
  `custom_x` double(24,8) NOT NULL,
  `custom_y` double(24,8) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_format_cards`
--

INSERT INTO `erp_c_format_cards` (`rowid`, `code`, `name`, `paper_size`, `orientation`, `metric`, `leftmargin`, `topmargin`, `nx`, `ny`, `spacex`, `spacey`, `width`, `height`, `font_size`, `custom_x`, `custom_y`, `active`) VALUES
(1, '5160', 'Avery-5160, WL-875WX', 'letter', 'P', 'mm', 5.58165000, 12.70000000, 3, 10, 3.55600000, 0.00000000, 65.87490000, 25.40000000, 7, 0.00000000, 0.00000000, 1),
(2, '5161', 'Avery-5161, WL-75WX', 'letter', 'P', 'mm', 4.44500000, 12.70000000, 2, 10, 3.96800000, 0.00000000, 101.60000000, 25.40000000, 7, 0.00000000, 0.00000000, 1),
(3, '5162', 'Avery-5162, WL-100WX', 'letter', 'P', 'mm', 3.87350000, 22.35200000, 2, 7, 4.95400000, 0.00000000, 101.60000000, 33.78100000, 8, 0.00000000, 0.00000000, 1),
(4, '5163', 'Avery-5163, WL-125WX', 'letter', 'P', 'mm', 4.57200000, 12.70000000, 2, 5, 3.55600000, 0.00000000, 101.60000000, 50.80000000, 10, 0.00000000, 0.00000000, 1),
(5, '5164', 'Avery-5164 (inch)', 'letter', 'P', 'in', 0.14800000, 0.50000000, 2, 3, 0.20310000, 0.00000000, 4.00000000, 3.33000000, 12, 0.00000000, 0.00000000, 0),
(6, '8600', 'Avery-8600', 'letter', 'P', 'mm', 7.10000000, 19.00000000, 3, 10, 9.50000000, 3.10000000, 66.60000000, 25.40000000, 7, 0.00000000, 0.00000000, 1),
(7, '99012', 'DYMO 99012 89*36mm', 'custom', 'L', 'mm', 1.00000000, 1.00000000, 1, 1, 0.00000000, 0.00000000, 36.00000000, 89.00000000, 10, 36.00000000, 89.00000000, 1),
(8, '99014', 'DYMO 99014 101*54mm', 'custom', 'L', 'mm', 1.00000000, 1.00000000, 1, 1, 0.00000000, 0.00000000, 54.00000000, 101.00000000, 10, 54.00000000, 101.00000000, 1),
(9, 'AVERYC32010', 'Avery-C32010', 'A4', 'P', 'mm', 15.00000000, 13.00000000, 2, 5, 10.00000000, 0.00000000, 85.00000000, 54.00000000, 10, 0.00000000, 0.00000000, 1),
(10, 'CARD', 'Dolibarr Business cards', 'A4', 'P', 'mm', 15.00000000, 15.00000000, 2, 5, 0.00000000, 0.00000000, 85.00000000, 54.00000000, 10, 0.00000000, 0.00000000, 1),
(11, 'L7163', 'Avery-L7163', 'A4', 'P', 'mm', 5.00000000, 15.00000000, 2, 7, 2.50000000, 0.00000000, 99.10000000, 38.10000000, 8, 0.00000000, 0.00000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_forme_juridique`
--

CREATE TABLE `erp_c_forme_juridique` (
  `rowid` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isvatexempted` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_forme_juridique`
--

INSERT INTO `erp_c_forme_juridique` (`rowid`, `code`, `fk_pays`, `libelle`, `isvatexempted`, `active`, `module`, `position`) VALUES
(1, 0, 0, '-', 0, 1, NULL, 0),
(2, 2301, 23, 'Monotributista', 0, 1, NULL, 0),
(3, 2302, 23, 'Sociedad Civil', 0, 1, NULL, 0),
(4, 2303, 23, 'Sociedades Comerciales', 0, 1, NULL, 0),
(5, 2304, 23, 'Sociedades de Hecho', 0, 1, NULL, 0),
(6, 2305, 23, 'Sociedades Irregulares', 0, 1, NULL, 0),
(7, 2306, 23, 'Sociedad Colectiva', 0, 1, NULL, 0),
(8, 2307, 23, 'Sociedad en Comandita Simple', 0, 1, NULL, 0),
(9, 2308, 23, 'Sociedad de Capital e Industria', 0, 1, NULL, 0),
(10, 2309, 23, 'Sociedad Accidental o en participaciĂ³n', 0, 1, NULL, 0),
(11, 2310, 23, 'Sociedad de Responsabilidad Limitada', 0, 1, NULL, 0),
(12, 2311, 23, 'Sociedad AnĂ³nima', 0, 1, NULL, 0),
(13, 2312, 23, 'Sociedad AnĂ³nima con ParticipaciĂ³n Estatal Mayoritaria', 0, 1, NULL, 0),
(14, 2313, 23, 'Sociedad en Comandita por Acciones (arts. 315 a 324, LSC)', 0, 1, NULL, 0),
(15, 4100, 41, 'GmbH - Gesellschaft mit beschrĂ¤nkter Haftung', 0, 1, NULL, 0),
(16, 4101, 41, 'GesmbH - Gesellschaft mit beschrĂ¤nkter Haftung', 0, 1, NULL, 0),
(17, 4102, 41, 'AG - Aktiengesellschaft', 0, 1, NULL, 0),
(18, 4103, 41, 'EWIV - EuropĂ¤ische wirtschaftliche Interessenvereinigung', 0, 1, NULL, 0),
(19, 4104, 41, 'KEG - Kommanditerwerbsgesellschaft', 0, 1, NULL, 0),
(20, 4105, 41, 'OEG - Offene Erwerbsgesellschaft', 0, 1, NULL, 0),
(21, 4106, 41, 'OHG - Offene Handelsgesellschaft', 0, 1, NULL, 0),
(22, 4107, 41, 'AG & Co KG - Kommanditgesellschaft', 0, 1, NULL, 0),
(23, 4108, 41, 'GmbH & Co KG - Kommanditgesellschaft', 0, 1, NULL, 0),
(24, 4109, 41, 'KG - Kommanditgesellschaft', 0, 1, NULL, 0),
(25, 4110, 41, 'OG - Offene Gesellschaft', 0, 1, NULL, 0),
(26, 4111, 41, 'GbR - Gesellschaft nach bĂ¼rgerlichem Recht', 0, 1, NULL, 0),
(27, 4112, 41, 'GesbR - Gesellschaft nach bĂ¼rgerlichem Recht', 0, 1, NULL, 0),
(28, 4113, 41, 'GesnbR - Gesellschaft nach bĂ¼rgerlichem Recht', 0, 1, NULL, 0),
(29, 4114, 41, 'e.U. - eingetragener Einzelunternehmer', 0, 1, NULL, 0),
(30, 200, 2, 'IndĂ©pendant', 0, 1, NULL, 0),
(31, 201, 2, 'SRL - SociĂ©tĂ© Ă  responsabilitĂ© limitĂ©e', 0, 1, NULL, 0),
(32, 202, 2, 'SA   - SociĂ©tĂ© Anonyme', 0, 1, NULL, 0),
(33, 203, 2, 'SCRL - SociĂ©tĂ© coopĂ©rative Ă  responsabilitĂ© limitĂ©e', 0, 1, NULL, 0),
(34, 204, 2, 'ASBL - Association sans but Lucratif', 0, 1, NULL, 0),
(35, 205, 2, 'SCRI - SociĂ©tĂ© coopĂ©rative Ă  responsabilitĂ© illimitĂ©e', 0, 1, NULL, 0),
(36, 206, 2, 'SCS  - SociĂ©tĂ© en commandite simple', 0, 1, NULL, 0),
(37, 207, 2, 'SCA  - SociĂ©tĂ© en commandite par action', 0, 1, NULL, 0),
(38, 208, 2, 'SNC  - SociĂ©tĂ© en nom collectif', 0, 1, NULL, 0),
(39, 209, 2, 'GIE  - Groupement d intĂ©rĂªt Ă©conomique', 0, 1, NULL, 0),
(40, 210, 2, 'GEIE - Groupement europĂ©en d intĂ©rĂªt Ă©conomique', 0, 1, NULL, 0),
(41, 220, 2, 'Eenmanszaak', 0, 1, NULL, 0),
(42, 221, 2, 'BVBA - Besloten vennootschap met beperkte aansprakelijkheid', 0, 1, NULL, 0),
(43, 222, 2, 'NV   - Naamloze Vennootschap', 0, 1, NULL, 0),
(44, 223, 2, 'CVBA - CoĂ¶peratieve vennootschap met beperkte aansprakelijkheid', 0, 1, NULL, 0),
(45, 224, 2, 'VZW  - Vereniging zonder winstoogmerk', 0, 1, NULL, 0),
(46, 225, 2, 'CVOA - CoĂ¶peratieve vennootschap met onbeperkte aansprakelijkheid ', 0, 1, NULL, 0),
(47, 226, 2, 'GCV  - Gewone commanditaire vennootschap', 0, 1, NULL, 0),
(48, 227, 2, 'Comm.VA - Commanditaire vennootschap op aandelen', 0, 1, NULL, 0),
(49, 228, 2, 'VOF  - Vennootschap onder firma', 0, 1, NULL, 0),
(50, 229, 2, 'VS0  - Vennootschap met sociaal oogmerk', 0, 1, NULL, 0),
(51, 11, 1, 'Artisan CommerĂ§ant (EI)', 0, 1, NULL, 0),
(52, 12, 1, 'CommerĂ§ant (EI)', 0, 1, NULL, 0),
(53, 13, 1, 'Artisan (EI)', 0, 1, NULL, 0),
(54, 14, 1, 'Officier public ou ministĂ©riel', 0, 1, NULL, 0),
(55, 15, 1, 'Profession libĂ©rale (EI)', 0, 1, NULL, 0),
(56, 16, 1, 'Exploitant agricole', 0, 1, NULL, 0),
(57, 17, 1, 'Agent commercial', 0, 1, NULL, 0),
(58, 18, 1, 'AssociĂ© GĂ©rant de sociĂ©tĂ©', 0, 1, NULL, 0),
(59, 19, 1, 'Personne physique', 0, 1, NULL, 0),
(60, 21, 1, 'Indivision', 0, 1, NULL, 0),
(61, 22, 1, 'SociĂ©tĂ© crĂ©Ă©e de fait', 0, 1, NULL, 0),
(62, 23, 1, 'SociĂ©tĂ© en participation', 0, 1, NULL, 0),
(63, 24, 1, 'SociĂ©tĂ© coopĂ©rative d\'interet collectif (SCIC)', 0, 1, NULL, 0),
(64, 25, 1, 'SociĂ©tĂ© coopĂ©rative de production Ă  responsabilitĂ© limitĂ©e (SCOP)', 0, 1, NULL, 0),
(65, 27, 1, 'Paroisse hors zone concordataire', 0, 1, NULL, 0),
(66, 29, 1, 'Groupement de droit privĂ© non dotĂ© de la personnalitĂ© morale', 0, 1, NULL, 0),
(67, 31, 1, 'Personne morale de droit Ă©tranger, immatriculĂ©e au RCS', 0, 1, NULL, 0),
(68, 32, 1, 'Personne morale de droit Ă©tranger, non immatriculĂ©e au RCS', 0, 1, NULL, 0),
(69, 35, 1, 'RĂ©gime auto-entrepreneur', 0, 1, NULL, 0),
(70, 41, 1, 'Etablissement public ou rĂ©gie Ă  caractĂ¨re industriel ou commercial', 0, 1, NULL, 0),
(71, 51, 1, 'SociĂ©tĂ© coopĂ©rative commerciale particuliĂ¨re', 0, 1, NULL, 0),
(72, 52, 1, 'SociĂ©tĂ© en nom collectif', 0, 1, NULL, 0),
(73, 53, 1, 'SociĂ©tĂ© en commandite', 0, 1, NULL, 0),
(74, 54, 1, 'SociĂ©tĂ© Ă  responsabilitĂ© limitĂ©e (SARL)', 0, 1, NULL, 0),
(75, 55, 1, 'SociĂ©tĂ© anonyme Ă  conseil d administration', 0, 1, NULL, 0),
(76, 56, 1, 'SociĂ©tĂ© anonyme Ă  directoire', 0, 1, NULL, 0),
(77, 57, 1, 'SociĂ©tĂ© par actions simplifiĂ©e (SAS)', 0, 1, NULL, 0),
(78, 58, 1, 'Entreprise Unipersonnelle Ă  ResponsabilitĂ© LimitĂ©e (EURL)', 0, 1, NULL, 0),
(79, 59, 1, 'SociĂ©tĂ© par actions simplifiĂ©e unipersonnelle (SASU)', 0, 1, NULL, 0),
(80, 60, 1, 'Entreprise Individuelle Ă  ResponsabilitĂ© LimitĂ©e (EIRL)', 0, 1, NULL, 0),
(81, 61, 1, 'Caisse d\'Ă©pargne et de prĂ©voyance', 0, 1, NULL, 0),
(82, 62, 1, 'Groupement d\'intĂ©rĂªt Ă©conomique (GIE)', 0, 1, NULL, 0),
(83, 63, 1, 'SociĂ©tĂ© coopĂ©rative agricole', 0, 1, NULL, 0),
(84, 64, 1, 'SociĂ©tĂ© non commerciale d assurances', 0, 1, NULL, 0),
(85, 65, 1, 'SociĂ©tĂ© civile', 0, 1, NULL, 0),
(86, 69, 1, 'Personnes de droit privĂ© inscrites au RCS', 0, 1, NULL, 0),
(87, 71, 1, 'Administration de l Ă©tat', 0, 1, NULL, 0),
(88, 72, 1, 'CollectivitĂ© territoriale', 0, 1, NULL, 0),
(89, 73, 1, 'Etablissement public administratif', 0, 1, NULL, 0),
(90, 74, 1, 'Personne morale de droit public administratif', 0, 1, NULL, 0),
(91, 81, 1, 'Organisme gĂ©rant rĂ©gime de protection social Ă  adhĂ©sion obligatoire', 0, 1, NULL, 0),
(92, 82, 1, 'Organisme mutualiste', 0, 1, NULL, 0),
(93, 83, 1, 'ComitĂ© d entreprise', 0, 1, NULL, 0),
(94, 84, 1, 'Organisme professionnel', 0, 1, NULL, 0),
(95, 85, 1, 'Organisme de retraite Ă  adhĂ©sion non obligatoire', 0, 1, NULL, 0),
(96, 91, 1, 'Syndicat de propriĂ©taires', 0, 1, NULL, 0),
(97, 92, 1, 'Association loi 1901 ou assimilĂ©', 0, 1, NULL, 0),
(98, 93, 1, 'Fondation', 0, 1, NULL, 0),
(99, 99, 1, 'Personne morale de droit privĂ©', 0, 1, NULL, 0),
(100, 500, 5, 'GmbH - Gesellschaft mit beschrĂ¤nkter Haftung', 0, 1, NULL, 0),
(101, 501, 5, 'AG - Aktiengesellschaft ', 0, 1, NULL, 0),
(102, 502, 5, 'GmbH&Co. KG - Gesellschaft mit beschrĂ¤nkter Haftung & Compagnie Kommanditgesellschaft', 0, 1, NULL, 0),
(103, 503, 5, 'Gewerbe - Personengesellschaft', 0, 1, NULL, 0),
(104, 504, 5, 'UG - Unternehmergesellschaft -haftungsbeschrĂ¤nkt-', 0, 1, NULL, 0),
(105, 505, 5, 'GbR - Gesellschaft des bĂ¼rgerlichen Rechts', 0, 1, NULL, 0),
(106, 506, 5, 'KG - Kommanditgesellschaft', 0, 1, NULL, 0),
(107, 507, 5, 'Ltd. - Limited Company', 0, 1, NULL, 0),
(108, 508, 5, 'OHG - Offene Handelsgesellschaft', 0, 1, NULL, 0),
(109, 509, 5, 'eG - eingetragene Genossenschaft', 0, 1, NULL, 0),
(110, 8001, 80, 'Aktieselvskab A/S', 0, 1, NULL, 0),
(111, 8002, 80, 'Anparts Selvskab ApS', 0, 1, NULL, 0),
(112, 8003, 80, 'Personlig ejet selvskab', 0, 1, NULL, 0),
(113, 8004, 80, 'IvĂ¦rksĂ¦tterselvskab IVS', 0, 1, NULL, 0),
(114, 8005, 80, 'Interessentskab I/S', 0, 1, NULL, 0),
(115, 8006, 80, 'Holdingselskab', 0, 1, NULL, 0),
(116, 8007, 80, 'Selskab Med BegrĂ¦nset HĂ¦ftelse SMBA', 0, 1, NULL, 0),
(117, 8008, 80, 'Kommanditselskab K/S', 0, 1, NULL, 0),
(118, 8009, 80, 'SPE-selskab', 0, 1, NULL, 0),
(119, 10201, 102, 'Î‘Ï„Î¿Î¼Î¹ÎºÎ® ÎµÏ€Î¹Ï‡ÎµÎ¯ÏÎ·ÏƒÎ·', 0, 1, NULL, 0),
(120, 10202, 102, 'Î•Ï„Î±Î¹ÏÎ¹ÎºÎ®  ÎµÏ€Î¹Ï‡ÎµÎ¯ÏÎ·ÏƒÎ·', 0, 1, NULL, 0),
(121, 10203, 102, 'ÎŸÎ¼ÏŒÏÏÏ…Î¸Î¼Î· Î•Ï„Î±Î¹ÏÎµÎ¯Î± ÎŸ.Î•', 0, 1, NULL, 0),
(122, 10204, 102, 'Î•Ï„ÎµÏÏŒÏÏÏ…Î¸Î¼Î· Î•Ï„Î±Î¹ÏÎµÎ¯Î± Î•.Î•', 0, 1, NULL, 0),
(123, 10205, 102, 'Î•Ï„Î±Î¹ÏÎµÎ¯Î± Î ÎµÏÎ¹Î¿ÏÎ¹ÏƒÎ¼Î­Î½Î·Ï‚ Î•Ï…Î¸ÏÎ½Î·Ï‚ Î•.Î .Î•', 0, 1, NULL, 0),
(124, 10206, 102, 'Î‘Î½ÏÎ½Ï…Î¼Î· Î•Ï„Î±Î¹ÏÎµÎ¯Î± Î‘.Î•', 0, 1, NULL, 0),
(125, 10207, 102, 'Î‘Î½ÏÎ½Ï…Î¼Î· Î½Î±Ï…Ï„Î¹Î»Î¹Î±ÎºÎ® ÎµÏ„Î±Î¹ÏÎµÎ¯Î± Î‘.Î.Î•', 0, 1, NULL, 0),
(126, 10208, 102, 'Î£Ï…Î½ÎµÏ„Î±Î¹ÏÎ¹ÏƒÎ¼ÏŒÏ‚', 0, 1, NULL, 0),
(127, 10209, 102, 'Î£Ï…Î¼Ï€Î»Î¿Î¹Î¿ÎºÏ„Î·ÏƒÎ¯Î±', 0, 1, NULL, 0),
(128, 301, 3, 'SocietĂ  semplice', 0, 1, NULL, 0),
(129, 302, 3, 'SocietĂ  in nome collettivo s.n.c.', 0, 1, NULL, 0),
(130, 303, 3, 'SocietĂ  in accomandita semplice s.a.s.', 0, 1, NULL, 0),
(131, 304, 3, 'SocietĂ  per azioni s.p.a.', 0, 1, NULL, 0),
(132, 305, 3, 'SocietĂ  a responsabilitĂ  limitata s.r.l.', 0, 1, NULL, 0),
(133, 306, 3, 'SocietĂ  in accomandita per azioni s.a.p.a.', 0, 1, NULL, 0),
(134, 307, 3, 'SocietĂ  cooperativa a r.l.', 0, 1, NULL, 0),
(135, 308, 3, 'SocietĂ  consortile', 0, 1, NULL, 0),
(136, 309, 3, 'SocietĂ  europea', 0, 1, NULL, 0),
(137, 310, 3, 'SocietĂ  cooperativa europea', 0, 1, NULL, 0),
(138, 311, 3, 'SocietĂ  unipersonale', 0, 1, NULL, 0),
(139, 312, 3, 'SocietĂ  di professionisti', 0, 1, NULL, 0),
(140, 313, 3, 'SocietĂ  di fatto', 0, 1, NULL, 0),
(141, 315, 3, 'SocietĂ  apparente', 0, 1, NULL, 0),
(142, 316, 3, 'Impresa individuale ', 0, 1, NULL, 0),
(143, 317, 3, 'Impresa coniugale', 0, 1, NULL, 0),
(144, 318, 3, 'Impresa familiare', 0, 1, NULL, 0),
(145, 319, 3, 'Consorzio cooperativo', 0, 1, NULL, 0),
(146, 320, 3, 'SocietĂ  cooperativa sociale', 0, 1, NULL, 0),
(147, 321, 3, 'SocietĂ  cooperativa di consumo', 0, 1, NULL, 0),
(148, 322, 3, 'SocietĂ  cooperativa agricola', 0, 1, NULL, 0),
(149, 323, 3, 'A.T.I. Associazione temporanea di imprese', 0, 1, NULL, 0),
(150, 324, 3, 'R.T.I. Raggruppamento temporaneo di imprese', 0, 1, NULL, 0),
(151, 325, 3, 'Studio associato', 0, 1, NULL, 0),
(152, 600, 6, 'Raison Individuelle', 0, 1, NULL, 0),
(153, 601, 6, 'SociĂ©tĂ© Simple', 0, 1, NULL, 0),
(154, 602, 6, 'SociĂ©tĂ© en nom collectif', 0, 1, NULL, 0),
(155, 603, 6, 'SociĂ©tĂ© en commandite', 0, 1, NULL, 0),
(156, 604, 6, 'SociĂ©tĂ© anonyme (SA)', 0, 1, NULL, 0),
(157, 605, 6, 'SociĂ©tĂ© en commandite par actions', 0, 1, NULL, 0),
(158, 606, 6, 'SociĂ©tĂ© Ă  responsabilitĂ© limitĂ©e (SARL)', 0, 1, NULL, 0),
(159, 607, 6, 'SociĂ©tĂ© coopĂ©rative', 0, 1, NULL, 0),
(160, 608, 6, 'Association', 0, 1, NULL, 0),
(161, 609, 6, 'Fondation', 0, 1, NULL, 0),
(162, 700, 7, 'Sole Trader', 0, 1, NULL, 0),
(163, 701, 7, 'Partnership', 0, 1, NULL, 0),
(164, 702, 7, 'Private Limited Company by shares (LTD)', 0, 1, NULL, 0),
(165, 703, 7, 'Public Limited Company', 0, 1, NULL, 0),
(166, 704, 7, 'Workers Cooperative', 0, 1, NULL, 0),
(167, 705, 7, 'Limited Liability Partnership', 0, 1, NULL, 0),
(168, 706, 7, 'Franchise', 0, 1, NULL, 0),
(169, 1000, 10, 'SociĂ©tĂ© Ă  responsabilitĂ© limitĂ©e (SARL)', 0, 1, NULL, 0),
(170, 1001, 10, 'SociĂ©tĂ© en Nom Collectif (SNC)', 0, 1, NULL, 0),
(171, 1002, 10, 'SociĂ©tĂ© en Commandite Simple (SCS)', 0, 1, NULL, 0),
(172, 1003, 10, 'sociĂ©tĂ© en participation', 0, 1, NULL, 0),
(173, 1004, 10, 'SociĂ©tĂ© Anonyme (SA)', 0, 1, NULL, 0),
(174, 1005, 10, 'SociĂ©tĂ© Unipersonnelle Ă  ResponsabilitĂ© LimitĂ©e (SUARL)', 0, 1, NULL, 0),
(175, 1006, 10, 'Groupement d\'intĂ©rĂªt Ă©conomique (GEI)', 0, 1, NULL, 0),
(176, 1007, 10, 'Groupe de sociĂ©tĂ©s', 0, 1, NULL, 0),
(177, 1701, 17, 'Eenmanszaak', 0, 1, NULL, 0),
(178, 1702, 17, 'Maatschap', 0, 1, NULL, 0),
(179, 1703, 17, 'Vennootschap onder firma', 0, 1, NULL, 0),
(180, 1704, 17, 'Commanditaire vennootschap', 0, 1, NULL, 0),
(181, 1705, 17, 'Besloten vennootschap (BV)', 0, 1, NULL, 0),
(182, 1706, 17, 'Naamloze Vennootschap (NV)', 0, 1, NULL, 0),
(183, 1707, 17, 'Vereniging', 0, 1, NULL, 0),
(184, 1708, 17, 'Stichting', 0, 1, NULL, 0),
(185, 1709, 17, 'CoĂ¶peratie met beperkte aansprakelijkheid (BA)', 0, 1, NULL, 0),
(186, 1710, 17, 'CoĂ¶peratie met uitgesloten aansprakelijkheid (UA)', 0, 1, NULL, 0),
(187, 1711, 17, 'CoĂ¶peratie met wettelijke aansprakelijkheid (WA)', 0, 1, NULL, 0),
(188, 1712, 17, 'Onderlinge waarborgmaatschappij', 0, 1, NULL, 0),
(189, 401, 4, 'Empresario Individual', 0, 1, NULL, 0),
(190, 402, 4, 'Comunidad de Bienes', 0, 1, NULL, 0),
(191, 403, 4, 'Sociedad Civil', 0, 1, NULL, 0),
(192, 404, 4, 'Sociedad Colectiva', 0, 1, NULL, 0),
(193, 405, 4, 'Sociedad Limitada', 0, 1, NULL, 0),
(194, 406, 4, 'Sociedad AnĂ³nima', 0, 1, NULL, 0),
(195, 407, 4, 'Sociedad Comanditaria por Acciones', 0, 1, NULL, 0),
(196, 408, 4, 'Sociedad Comanditaria Simple', 0, 1, NULL, 0),
(197, 409, 4, 'Sociedad Laboral', 0, 1, NULL, 0),
(198, 410, 4, 'Sociedad Cooperativa', 0, 1, NULL, 0),
(199, 411, 4, 'Sociedad de GarantĂ­a RecĂ­proca', 0, 1, NULL, 0),
(200, 412, 4, 'Entidad de Capital-Riesgo', 0, 1, NULL, 0),
(201, 413, 4, 'AgrupaciĂ³n de InterĂ©s EconĂ³mico', 0, 1, NULL, 0),
(202, 414, 4, 'Sociedad de InversiĂ³n Mobiliaria', 0, 1, NULL, 0),
(203, 415, 4, 'AgrupaciĂ³n sin Ănimo de Lucro', 0, 1, NULL, 0),
(204, 15201, 152, 'Mauritius Private Company Limited By Shares', 0, 1, NULL, 0),
(205, 15202, 152, 'Mauritius Company Limited By Guarantee', 0, 1, NULL, 0),
(206, 15203, 152, 'Mauritius Public Company Limited By Shares', 0, 1, NULL, 0),
(207, 15204, 152, 'Mauritius Foreign Company', 0, 1, NULL, 0),
(208, 15205, 152, 'Mauritius GBC1 (Offshore Company)', 0, 1, NULL, 0),
(209, 15206, 152, 'Mauritius GBC2 (International Company)', 0, 1, NULL, 0),
(210, 15207, 152, 'Mauritius General Partnership', 0, 1, NULL, 0),
(211, 15208, 152, 'Mauritius Limited Partnership', 0, 1, NULL, 0),
(212, 15209, 152, 'Mauritius Sole Proprietorship', 0, 1, NULL, 0),
(213, 15210, 152, 'Mauritius Trusts', 0, 1, NULL, 0),
(214, 15401, 154, 'Sociedad en nombre colectivo', 0, 1, NULL, 0),
(215, 15402, 154, 'Sociedad en comandita simple', 0, 1, NULL, 0),
(216, 15403, 154, 'Sociedad de responsabilidad limitada', 0, 1, NULL, 0),
(217, 15404, 154, 'Sociedad anĂ³nima', 0, 1, NULL, 0),
(218, 15405, 154, 'Sociedad en comandita por acciones', 0, 1, NULL, 0),
(219, 15406, 154, 'Sociedad cooperativa', 0, 1, NULL, 0),
(220, 14001, 140, 'Entreprise individuelle', 0, 1, NULL, 0),
(221, 14002, 140, 'SociĂ©tĂ© en nom collectif (SENC)', 0, 1, NULL, 0),
(222, 14003, 140, 'SociĂ©tĂ© en commandite simple (SECS)', 0, 1, NULL, 0),
(223, 14004, 140, 'SociĂ©tĂ© en commandite par actions (SECA)', 0, 1, NULL, 0),
(224, 14005, 140, 'SociĂ©tĂ© Ă  responsabilitĂ© limitĂ©e (SARL)', 0, 1, NULL, 0),
(225, 14006, 140, 'SociĂ©tĂ© anonyme (SA)', 0, 1, NULL, 0),
(226, 14007, 140, 'SociĂ©tĂ© coopĂ©rative (SC)', 0, 1, NULL, 0),
(227, 14008, 140, 'SociĂ©tĂ© europĂ©enne (SE)', 0, 1, NULL, 0),
(228, 18801, 188, 'AFJ - Alte forme juridice', 0, 1, NULL, 0),
(229, 18802, 188, 'ASF - Asociatie familialĂ£', 0, 1, NULL, 0),
(230, 18803, 188, 'CON - Concesiune', 0, 1, NULL, 0),
(231, 18804, 188, 'CRL - Soc civilĂ£ profesionala cu pers. juridica si rĂ£spundere limitata (SPRL)', 0, 1, NULL, 0),
(232, 18805, 188, 'INC - Ănchiriere', 0, 1, NULL, 0),
(233, 18806, 188, 'LOC - LocaÅ£ie de gestiune', 0, 1, NULL, 0),
(234, 18807, 188, 'OC1 - OrganizaÅ£ie cooperatistĂ£ meÅŸteÅŸugĂ£reascĂ£', 0, 1, NULL, 0),
(235, 18808, 188, 'OC2 - OrganizaÅ£ie cooperatistĂ£ de consum', 0, 1, NULL, 0),
(236, 18809, 188, 'OC3 - OrganizaÅ£ie cooperatistĂ£ de credit', 0, 1, NULL, 0),
(237, 18810, 188, 'PFA - PersoanĂ£ fizicĂ£ independentĂ£', 0, 1, NULL, 0),
(238, 18811, 188, 'RA - Regie autonomĂ£', 0, 1, NULL, 0),
(239, 18812, 188, 'SA - Societate comercialĂ£ pe acÅ£iuni', 0, 1, NULL, 0),
(240, 18813, 188, 'SCS - Societate comercialĂ£ Ă®n comanditĂ£ simplĂ£', 0, 1, NULL, 0),
(241, 18814, 188, 'SNC - Societate comercialĂ£ Ă®n nume colectiv', 0, 1, NULL, 0),
(242, 18815, 188, 'SPI - Societate profesionala practicieni in insolventa (SPPI)', 0, 1, NULL, 0),
(243, 18816, 188, 'SRL - Societate comercialĂ£ cu rĂ£spundere limitatĂ£', 0, 1, NULL, 0),
(244, 18817, 188, 'URL - Intreprindere profesionala unipersonala cu rĂ£spundere limitata (IPURL)', 0, 1, NULL, 0),
(245, 17801, 178, 'Empresa individual', 0, 1, NULL, 0),
(246, 17802, 178, 'AsociaciĂ³n General', 0, 1, NULL, 0),
(247, 17803, 178, 'Sociedad de Responsabilidad Limitada', 0, 1, NULL, 0),
(248, 17804, 178, 'Sociedad Civil', 0, 1, NULL, 0),
(249, 17805, 178, 'Sociedad AnĂ³nima', 0, 1, NULL, 0),
(250, 1300, 13, 'Personne physique', 0, 1, NULL, 0),
(251, 1301, 13, 'SociĂ©tĂ© Ă  responsabilitĂ© limitĂ©e (SARL)', 0, 1, NULL, 0),
(252, 1302, 13, 'Entreprise unipersonnelle Ă  responsabilitĂ© limitĂ©e (EURL)', 0, 1, NULL, 0),
(253, 1303, 13, 'SociĂ©tĂ© en Nom Collectif (SNC)', 0, 1, NULL, 0),
(254, 1304, 13, 'sociĂ©tĂ© par actions (SPA)', 0, 1, NULL, 0),
(255, 1305, 13, 'SociĂ©tĂ© en Commandite Simple (SCS)', 0, 1, NULL, 0),
(256, 1306, 13, 'SociĂ©tĂ© en commandite par actions (SCA)', 0, 1, NULL, 0),
(257, 1307, 13, 'SociĂ©tĂ© en participation', 0, 1, NULL, 0),
(258, 1308, 13, 'Groupe de sociĂ©tĂ©s', 0, 1, NULL, 0),
(259, 2001, 20, 'Aktiebolag', 0, 1, NULL, 0),
(260, 2002, 20, 'Publikt aktiebolag (AB publ)', 0, 1, NULL, 0),
(261, 2003, 20, 'Ekonomisk fĂ¶rening (ek. fĂ¶r.)', 0, 1, NULL, 0),
(262, 2004, 20, 'BostadsrĂ¤ttsfĂ¶rening (BRF)', 0, 1, NULL, 0),
(263, 2005, 20, 'HyresrĂ¤ttsfĂ¶rening (HRF)', 0, 1, NULL, 0),
(264, 2006, 20, 'Kooperativ', 0, 1, NULL, 0),
(265, 2007, 20, 'Enskild firma (EF)', 0, 1, NULL, 0),
(266, 2008, 20, 'Handelsbolag (HB)', 0, 1, NULL, 0),
(267, 2009, 20, 'Kommanditbolag (KB)', 0, 1, NULL, 0),
(268, 2010, 20, 'Enkelt bolag', 0, 1, NULL, 0),
(269, 2011, 20, 'Ideell fĂ¶rening', 0, 1, NULL, 0),
(270, 2012, 20, 'Stiftelse', 0, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_holiday_types`
--

CREATE TABLE `erp_c_holiday_types` (
  `rowid` int(11) NOT NULL,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `affect` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `newbymonth` double(8,5) NOT NULL DEFAULT 0.00000,
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_holiday_types`
--

INSERT INTO `erp_c_holiday_types` (`rowid`, `code`, `label`, `affect`, `delay`, `newbymonth`, `fk_country`, `active`) VALUES
(1, 'LEAVE_SICK', 'Sick leave', 0, 0, 0.00000, NULL, 1),
(2, 'LEAVE_OTHER', 'Other leave', 0, 0, 0.00000, NULL, 1),
(3, 'LEAVE_PAID', 'Paid vacation', 1, 7, 0.00000, NULL, 0),
(4, 'LEAVE_RTT_FR', 'RTT', 1, 7, 0.83000, 1, 1),
(5, 'LEAVE_PAID_FR', 'Paid vacation', 1, 30, 2.08334, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_hrm_department`
--

CREATE TABLE `erp_c_hrm_department` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_hrm_department`
--

INSERT INTO `erp_c_hrm_department` (`rowid`, `pos`, `code`, `label`, `active`) VALUES
(1, 5, 'MANAGEMENT', 'Management', 1),
(3, 15, 'TRAINING', 'Training', 1),
(4, 20, 'IT', 'Inform. Technology (IT)', 0),
(5, 25, 'MARKETING', 'Marketing', 0),
(6, 30, 'SALES', 'Sales', 1),
(7, 35, 'LEGAL', 'Legal', 0),
(8, 40, 'FINANCIAL', 'Financial accounting', 1),
(9, 45, 'HUMANRES', 'Human resources', 1),
(10, 50, 'PURCHASING', 'Purchasing', 1),
(12, 60, 'CUSTOMSERV', 'Customer service', 0),
(14, 70, 'LOGISTIC', 'Logistics', 1),
(15, 75, 'CONSTRUCT', 'Engineering/design', 0),
(16, 80, 'PRODUCTION', 'Production', 1),
(17, 85, 'QUALITY', 'Quality assurance', 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_hrm_function`
--

CREATE TABLE `erp_c_hrm_function` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_level` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_hrm_function`
--

INSERT INTO `erp_c_hrm_function` (`rowid`, `pos`, `code`, `label`, `c_level`, `active`) VALUES
(1, 5, 'EXECBOARD', 'Executive board', 0, 1),
(2, 10, 'MANAGDIR', 'Managing director', 1, 1),
(3, 15, 'ACCOUNTMANAG', 'Account manager', 0, 1),
(4, 20, 'ENGAGDIR', 'Engagement director', 1, 1),
(5, 25, 'DIRECTOR', 'Director', 1, 1),
(6, 30, 'PROJMANAG', 'Project manager', 0, 1),
(7, 35, 'DEPHEAD', 'Department head', 0, 1),
(8, 40, 'SECRETAR', 'Secretary', 0, 1),
(9, 45, 'EMPLOYEE', 'Department employee', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_hrm_public_holiday`
--

CREATE TABLE `erp_c_hrm_public_holiday` (
  `id` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 0,
  `fk_country` int(11) DEFAULT NULL,
  `code` varchar(62) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dayrule` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_hrm_public_holiday`
--

INSERT INTO `erp_c_hrm_public_holiday` (`id`, `entity`, `fk_country`, `code`, `dayrule`, `day`, `month`, `year`, `active`, `import_key`) VALUES
(1, 0, 0, 'NEWYEARDAY1', '', 1, 1, 0, 1, NULL),
(2, 0, 0, 'LABORDAY1', '', 1, 5, 0, 1, NULL),
(3, 0, 0, 'ASSOMPTIONDAY1', '', 15, 8, 0, 1, NULL),
(4, 0, 0, 'CHRISTMASDAY1', '', 25, 12, 0, 1, NULL),
(5, 0, 1, 'FR-VICTORYDAY', '', 8, 5, 0, 1, NULL),
(6, 0, 1, 'FR-NATIONALDAY', '', 14, 7, 0, 1, NULL),
(7, 0, 1, 'FR-ASSOMPTION', '', 15, 8, 0, 1, NULL),
(8, 0, 1, 'FR-TOUSSAINT', '', 1, 11, 0, 1, NULL),
(9, 0, 1, 'FR-ARMISTICE', '', 11, 11, 0, 1, NULL),
(10, 0, 1, 'FR-EASTER', 'eastermonday', 0, 0, 0, 1, NULL),
(11, 0, 1, 'FR-ASCENSION', 'ascension', 0, 0, 0, 1, NULL),
(12, 0, 1, 'FR-PENTECOST', 'pentecost', 0, 0, 0, 1, NULL),
(13, 0, 3, 'IT-LIBEAZIONE', '', 25, 4, 0, 1, NULL),
(14, 0, 3, 'IT-EPIPHANY', '', 1, 6, 0, 1, NULL),
(15, 0, 3, 'IT-REPUBBLICA', '', 2, 6, 0, 1, NULL),
(16, 0, 3, 'IT-TUTTISANTIT', '', 1, 11, 0, 1, NULL),
(17, 0, 3, 'IT-IMMACULE', '', 8, 12, 0, 1, NULL),
(18, 0, 3, 'IT-SAINTSTEFAN', '', 26, 12, 0, 1, NULL),
(19, 0, 4, 'ES-EASTER', 'easter', 0, 0, 0, 1, NULL),
(20, 0, 4, 'ES-REYE', '', 1, 6, 0, 1, NULL),
(21, 0, 4, 'ES-HISPANIDAD', '', 12, 10, 0, 1, NULL),
(22, 0, 4, 'ES-TOUSSAINT', '', 1, 11, 0, 1, NULL),
(23, 0, 4, 'ES-CONSTITUIZION', '', 6, 12, 0, 1, NULL),
(24, 0, 4, 'ES-IMMACULE', '', 8, 12, 0, 1, NULL),
(25, 0, 41, 'AT-EASTER', 'eastermonday', 0, 0, 0, 1, NULL),
(26, 0, 41, 'AT-ASCENSION', 'ascension', 0, 0, 0, 1, NULL),
(27, 0, 41, 'AT-PENTECOST', 'pentecost', 0, 0, 0, 1, NULL),
(28, 0, 41, 'AT-FRONLEICHNAM', 'fronleichnam', 0, 0, 0, 1, NULL),
(29, 0, 41, 'AT-KONEGIE', '', 1, 6, 0, 1, NULL),
(30, 0, 41, 'AT-26OKT', '', 26, 10, 0, 1, NULL),
(31, 0, 41, 'AT-TOUSSAINT', '', 1, 11, 0, 1, NULL),
(32, 0, 41, 'AT-IMMACULE', '', 8, 12, 0, 1, NULL),
(33, 0, 41, 'AT-24DEC', '', 24, 12, 0, 1, NULL),
(34, 0, 41, 'AT-SAINTSTEFAN', '', 26, 12, 0, 1, NULL),
(35, 0, 41, 'AT-Silvester', '', 31, 12, 0, 1, NULL),
(36, 0, 117, 'IN-REPUBLICDAY', '', 26, 1, 0, 1, NULL),
(37, 0, 117, 'IN-GANDI', '', 2, 10, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_incoterms`
--

CREATE TABLE `erp_c_incoterms` (
  `rowid` int(11) NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_incoterms`
--

INSERT INTO `erp_c_incoterms` (`rowid`, `code`, `label`, `libelle`, `active`) VALUES
(1, 'EXW', 'Ex Works', 'Ex Works, au dĂ©part non chargĂ©, non dĂ©douanĂ© sortie d\'usine (uniquement adaptĂ© aux flux domestiques, nationaux)', 1),
(2, 'FCA', 'Free Carrier', 'Free Carrier, marchandises dĂ©douanĂ©es et chargĂ©es dans le pays de dĂ©part, chez le vendeur ou chez le commissionnaire de transport de l\'acheteur', 1),
(3, 'FAS', 'Free Alongside Ship', 'Free Alongside Ship, sur le quai du port de dĂ©part', 1),
(4, 'FOB', 'Free On Board', 'Free On Board, chargĂ© sur le bateau, les frais de chargement dans celui-ci Ă©tant fonction du liner term indiquĂ© par la compagnie maritime (Ă  la charge du vendeur)', 1),
(5, 'CFR', 'Cost and Freight', 'Cost and Freight, chargĂ© dans le bateau, livraison au port de dĂ©part, frais payĂ©s jusqu\'au port d\'arrivĂ©e, sans assurance pour le transport, non dĂ©chargĂ© du navire Ă  destination (les frais de dĂ©chargement sont inclus ou non au port d\'arrivĂ©e)', 1),
(6, 'CIF', 'Cost, Insurance, Freight', 'Cost, Insurance and Freight, chargĂ© sur le bateau, frais jusqu\'au port d\'arrivĂ©e, avec l\'assurance marchandise transportĂ©e souscrite par le vendeur pour le compte de l\'acheteur', 1),
(7, 'CPT', 'Carriage Paid To', 'Carriage Paid To, livraison au premier transporteur, frais jusqu\'au dĂ©chargement du mode de transport, sans assurance pour le transport', 1),
(8, 'CIP', 'Carriage Insurance Paid', 'Carriage and Insurance Paid to, idem CPT, avec assurance marchandise transportĂ©e souscrite par le vendeur pour le compte de l\'acheteur', 1),
(9, 'DAT', 'Delivered At Terminal', 'Delivered At Terminal, marchandises (dĂ©chargĂ©es) livrĂ©es sur quai, dans un terminal maritime, fluvial, aĂ©rien, routier ou ferroviaire dĂ©signĂ© (dĂ©douanement import, et post-acheminement payĂ©s par l\'acheteur)', 1),
(10, 'DAP', 'Delivered At Place', 'Delivered At Place, marchandises (non dĂ©chargĂ©es) mises Ă  disposition de l\'acheteur dans le pays d\'importation au lieu prĂ©cisĂ© dans le contrat (dĂ©chargement, dĂ©douanement import payĂ© par l\'acheteur)', 1),
(11, 'DDP', 'Delivered Duty Paid', 'Delivered Duty Paid, marchandises (non dĂ©chargĂ©es) livrĂ©es Ă  destination finale, dĂ©douanement import et taxes Ă  la charge du vendeur ; l\'acheteur prend en charge uniquement le dĂ©chargement (si exclusion des taxes type TVA, le prĂ©ciser clairement)', 1),
(12, 'DPU', 'Delivered at Place Unloaded', 'Delivered at Place unloaded', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_input_method`
--

CREATE TABLE `erp_c_input_method` (
  `rowid` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libelle` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_input_method`
--

INSERT INTO `erp_c_input_method` (`rowid`, `code`, `libelle`, `active`, `module`) VALUES
(1, 'OrderByMail', 'Courrier', 1, NULL),
(2, 'OrderByFax', 'Fax', 1, NULL),
(3, 'OrderByEMail', 'EMail', 1, NULL),
(4, 'OrderByPhone', 'TĂ©lĂ©phone', 1, NULL),
(5, 'OrderByWWW', 'En ligne', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_input_reason`
--

CREATE TABLE `erp_c_input_reason` (
  `rowid` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_input_reason`
--

INSERT INTO `erp_c_input_reason` (`rowid`, `code`, `label`, `active`, `module`) VALUES
(1, 'SRC_INTE', 'Web site', 1, NULL),
(2, 'SRC_CAMP_MAIL', 'Mailing campaign', 1, NULL),
(3, 'SRC_CAMP_PHO', 'Phone campaign', 1, NULL),
(4, 'SRC_CAMP_FAX', 'Fax campaign', 1, NULL),
(5, 'SRC_COMM', 'Commercial contact', 1, NULL),
(6, 'SRC_SHOP', 'Shop contact', 1, NULL),
(7, 'SRC_CAMP_EMAIL', 'EMailing campaign', 1, NULL),
(8, 'SRC_WOM', 'Word of mouth', 1, NULL),
(9, 'SRC_PARTNER', 'Partner', 1, NULL),
(10, 'SRC_EMPLOYEE', 'Employee', 1, NULL),
(11, 'SRC_SPONSORING', 'Sponsorship', 1, NULL),
(12, 'SRC_CUSTOMER', 'Incoming contact of a customer', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_lead_status`
--

CREATE TABLE `erp_c_lead_status` (
  `rowid` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `percent` double(5,2) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_lead_status`
--

INSERT INTO `erp_c_lead_status` (`rowid`, `code`, `label`, `position`, `percent`, `active`) VALUES
(1, 'PROSP', 'Prospection', 10, 0.00, 1),
(2, 'QUAL', 'Qualification', 20, 20.00, 1),
(3, 'PROPO', 'Proposal', 30, 40.00, 1),
(4, 'NEGO', 'Negotiation', 40, 60.00, 1),
(5, 'PENDING', 'Pending', 50, 50.00, 0),
(6, 'WON', 'Won', 60, 100.00, 1),
(7, 'LOST', 'Lost', 70, 0.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_paiement`
--

CREATE TABLE `erp_c_paiement` (
  `id` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(62) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_paiement`
--

INSERT INTO `erp_c_paiement` (`id`, `entity`, `code`, `libelle`, `type`, `active`, `accountancy_code`, `module`, `position`) VALUES
(1, 1, 'TIP', 'TIP', 2, 0, NULL, NULL, 0),
(2, 1, 'VIR', 'Transfer', 2, 1, NULL, NULL, 0),
(3, 1, 'PRE', 'Debit order', 2, 1, NULL, NULL, 0),
(4, 1, 'LIQ', 'Cash', 2, 1, NULL, NULL, 0),
(6, 1, 'CB', 'Credit card', 2, 1, NULL, NULL, 0),
(7, 1, 'CHQ', 'Cheque', 2, 1, NULL, NULL, 0),
(50, 1, 'VAD', 'Online payment', 2, 0, NULL, NULL, 0),
(51, 1, 'TRA', 'Traite', 2, 0, NULL, NULL, 0),
(52, 1, 'LCR', 'LCR', 2, 0, NULL, NULL, 0),
(53, 1, 'FAC', 'Factor', 2, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_paper_format`
--

CREATE TABLE `erp_c_paper_format` (
  `rowid` int(11) NOT NULL,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` float(6,2) DEFAULT 0.00,
  `height` float(6,2) DEFAULT 0.00,
  `unit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_paper_format`
--

INSERT INTO `erp_c_paper_format` (`rowid`, `code`, `label`, `width`, `height`, `unit`, `active`, `module`) VALUES
(1, 'EU4A0', 'Format 4A0', 1682.00, 2378.00, 'mm', 1, NULL),
(2, 'EU2A0', 'Format 2A0', 1189.00, 1682.00, 'mm', 1, NULL),
(3, 'EUA0', 'Format A0', 840.00, 1189.00, 'mm', 1, NULL),
(4, 'EUA1', 'Format A1', 594.00, 840.00, 'mm', 1, NULL),
(5, 'EUA2', 'Format A2', 420.00, 594.00, 'mm', 1, NULL),
(6, 'EUA3', 'Format A3', 297.00, 420.00, 'mm', 1, NULL),
(7, 'EUA4', 'Format A4', 210.00, 297.00, 'mm', 1, NULL),
(8, 'EUA5', 'Format A5', 148.00, 210.00, 'mm', 1, NULL),
(9, 'EUA6', 'Format A6', 105.00, 148.00, 'mm', 1, NULL),
(100, 'USLetter', 'Format Letter (A)', 216.00, 279.00, 'mm', 1, NULL),
(105, 'USLegal', 'Format Legal', 216.00, 356.00, 'mm', 1, NULL),
(110, 'USExecutive', 'Format Executive', 190.00, 254.00, 'mm', 1, NULL),
(115, 'USLedger', 'Format Ledger/Tabloid (B)', 279.00, 432.00, 'mm', 1, NULL),
(200, 'CAP1', 'Format Canadian P1', 560.00, 860.00, 'mm', 1, NULL),
(205, 'CAP2', 'Format Canadian P2', 430.00, 560.00, 'mm', 1, NULL),
(210, 'CAP3', 'Format Canadian P3', 280.00, 430.00, 'mm', 1, NULL),
(215, 'CAP4', 'Format Canadian P4', 215.00, 280.00, 'mm', 1, NULL),
(220, 'CAP5', 'Format Canadian P5', 140.00, 215.00, 'mm', 1, NULL),
(225, 'CAP6', 'Format Canadian P6', 107.00, 140.00, 'mm', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_partnership_type`
--

CREATE TABLE `erp_c_partnership_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_payment_term`
--

CREATE TABLE `erp_c_payment_term` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 1,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libelle_facture` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_cdr` tinyint(4) DEFAULT NULL,
  `nbjour` smallint(6) DEFAULT NULL,
  `decalage` smallint(6) DEFAULT NULL,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_payment_term`
--

INSERT INTO `erp_c_payment_term` (`rowid`, `entity`, `code`, `sortorder`, `active`, `libelle`, `libelle_facture`, `type_cdr`, `nbjour`, `decalage`, `module`, `position`) VALUES
(1, 1, 'RECEP', 1, 1, 'Due upon receipt', 'Due upon receipt', 0, 1, NULL, NULL, 0),
(2, 1, '30D', 2, 1, '30 days', 'Due in 30 days', 0, 30, NULL, NULL, 0),
(3, 1, '30DENDMONTH', 3, 1, '30 days end of month', 'Due in 30 days, end of month', 1, 30, NULL, NULL, 0),
(4, 1, '60D', 4, 1, '60 days', 'Due in 60 days, end of month', 0, 60, NULL, NULL, 0),
(5, 1, '60DENDMONTH', 5, 1, '60 days end of month', 'Due in 60 days, end of month', 1, 60, NULL, NULL, 0),
(6, 1, 'PT_ORDER', 6, 1, 'Due on order', 'Due on order', 0, 1, NULL, NULL, 0),
(7, 1, 'PT_DELIVERY', 7, 1, 'Due on delivery', 'Due on delivery', 0, 1, NULL, NULL, 0),
(8, 1, 'PT_5050', 8, 1, '50 and 50', '50% on order, 50% on delivery', 0, 1, NULL, NULL, 0),
(9, 1, '10D', 9, 1, '10 days', 'Due in 10 days', 0, 10, NULL, NULL, 0),
(10, 1, '10DENDMONTH', 10, 1, '10 days end of month', 'Due in 10 days, end of month', 1, 10, NULL, NULL, 0),
(11, 1, '14D', 11, 1, '14 days', 'Due in 14 days', 0, 14, NULL, NULL, 0),
(12, 1, '14DENDMONTH', 12, 1, '14 days end of month', 'Due in 14 days, end of month', 1, 14, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_price_expression`
--

CREATE TABLE `erp_c_price_expression` (
  `rowid` int(11) NOT NULL,
  `title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expression` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_price_global_variable`
--

CREATE TABLE `erp_c_price_global_variable` (
  `rowid` int(11) NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_price_global_variable_updater`
--

CREATE TABLE `erp_c_price_global_variable_updater` (
  `rowid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_variable` int(11) NOT NULL,
  `update_interval` int(11) DEFAULT 0,
  `next_update` int(11) DEFAULT 0,
  `last_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_productbatch_qcstatus`
--

CREATE TABLE `erp_c_productbatch_qcstatus` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_productbatch_qcstatus`
--

INSERT INTO `erp_c_productbatch_qcstatus` (`rowid`, `entity`, `code`, `label`, `active`) VALUES
(1, 1, 'OK', 'InWorkingOrder', 1),
(2, 1, 'KO', 'OutOfOrder', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_product_nature`
--

CREATE TABLE `erp_c_product_nature` (
  `rowid` int(11) NOT NULL,
  `code` tinyint(4) NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_product_nature`
--

INSERT INTO `erp_c_product_nature` (`rowid`, `code`, `label`, `active`) VALUES
(1, 0, 'RowMaterial', 1),
(2, 1, 'Finished', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_propalst`
--

CREATE TABLE `erp_c_propalst` (
  `id` smallint(6) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_propalst`
--

INSERT INTO `erp_c_propalst` (`id`, `code`, `label`, `active`) VALUES
(0, 'PR_DRAFT', 'Brouillon', 1),
(1, 'PR_OPEN', 'Ouverte', 1),
(2, 'PR_SIGNED', 'SignĂ©e', 1),
(3, 'PR_NOTSIGNED', 'Non SignĂ©e', 1),
(4, 'PR_FAC', 'FacturĂ©e', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_prospectcontactlevel`
--

CREATE TABLE `erp_c_prospectcontactlevel` (
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_prospectcontactlevel`
--

INSERT INTO `erp_c_prospectcontactlevel` (`code`, `label`, `sortorder`, `active`, `module`) VALUES
('PL_HIGH', 'High', 4, 1, NULL),
('PL_LOW', 'Low', 2, 1, NULL),
('PL_MEDIUM', 'Medium', 3, 1, NULL),
('PL_NONE', 'None', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_prospectlevel`
--

CREATE TABLE `erp_c_prospectlevel` (
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_prospectlevel`
--

INSERT INTO `erp_c_prospectlevel` (`code`, `label`, `sortorder`, `active`, `module`) VALUES
('PL_HIGH', 'High', 4, 1, NULL),
('PL_LOW', 'Low', 2, 1, NULL),
('PL_MEDIUM', 'Medium', 3, 1, NULL),
('PL_NONE', 'None', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_recruitment_origin`
--

CREATE TABLE `erp_c_recruitment_origin` (
  `rowid` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_regions`
--

CREATE TABLE `erp_c_regions` (
  `rowid` int(11) NOT NULL,
  `code_region` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `cheflieu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_regions`
--

INSERT INTO `erp_c_regions` (`rowid`, `code_region`, `fk_pays`, `cheflieu`, `tncc`, `nom`, `active`) VALUES
(1, 0, 0, '0', 0, '-', 1),
(2, 1301, 13, '', 0, 'Algerie', 1),
(3, 34000, 34, 'AD', NULL, 'Andorra', 1),
(4, 35001, 35, 'AO', NULL, 'Angola', 1),
(5, 2301, 23, '', 0, 'Norte', 1),
(6, 2302, 23, '', 0, 'Litoral', 1),
(7, 2303, 23, '', 0, 'Cuyana', 1),
(8, 2304, 23, '', 0, 'Central', 1),
(9, 2305, 23, '', 0, 'Patagonia', 1),
(10, 2801, 28, '', 0, 'Australia', 1),
(11, 4101, 41, '', 0, 'Ă–sterreich', 1),
(12, 4601, 46, '', 0, 'Barbados', 1),
(13, 201, 2, '', 1, 'Flandre', 1),
(14, 202, 2, '', 2, 'Wallonie', 1),
(15, 203, 2, '', 3, 'Bruxelles-Capitale', 1),
(16, 5201, 52, '', 0, 'Chuquisaca', 1),
(17, 5202, 52, '', 0, 'La Paz', 1),
(18, 5203, 52, '', 0, 'Cochabamba', 1),
(19, 5204, 52, '', 0, 'Oruro', 1),
(20, 5205, 52, '', 0, 'PotosĂ­', 1),
(21, 5206, 52, '', 0, 'Tarija', 1),
(22, 5207, 52, '', 0, 'Santa Cruz', 1),
(23, 5208, 52, '', 0, 'El Beni', 1),
(24, 5209, 52, '', 0, 'Pando', 1),
(25, 5601, 56, '', 0, 'Brasil', 1),
(26, 1401, 14, '', 0, 'Canada', 1),
(27, 6701, 67, NULL, NULL, 'TarapacĂ¡', 1),
(28, 6702, 67, NULL, NULL, 'Antofagasta', 1),
(29, 6703, 67, NULL, NULL, 'Atacama', 1),
(30, 6704, 67, NULL, NULL, 'Coquimbo', 1),
(31, 6705, 67, NULL, NULL, 'ValparaĂ­so', 1),
(32, 6706, 67, NULL, NULL, 'General Bernardo O Higgins', 1),
(33, 6707, 67, NULL, NULL, 'Maule', 1),
(34, 6708, 67, NULL, NULL, 'BiobĂ­o', 1),
(35, 6709, 67, NULL, NULL, 'RaucanĂ­a', 1),
(36, 6710, 67, NULL, NULL, 'Los Lagos', 1),
(37, 6711, 67, NULL, NULL, 'AysĂ©n General Carlos IbĂ¡Ă±ez del Campo', 1),
(38, 6712, 67, NULL, NULL, 'Magallanes y AntĂ¡rtica Chilena', 1),
(39, 6713, 67, NULL, NULL, 'Metropolitana de Santiago', 1),
(40, 6714, 67, NULL, NULL, 'Los RĂ­os', 1),
(41, 6715, 67, NULL, NULL, 'Arica y Parinacota', 1),
(42, 901, 9, 'äº¬', 0, 'åŒ—äº¬å¸‚', 1),
(43, 902, 9, 'æ´¥', 0, 'å¤©æ´¥å¸‚', 1),
(44, 903, 9, 'æ²ª', 0, 'ä¸æµ·å¸‚', 1),
(45, 904, 9, 'æ¸', 0, 'é‡åº†å¸‚', 1),
(46, 905, 9, 'å†€', 0, 'æ²³åŒ—çœ', 1),
(47, 906, 9, 'æ™‹', 0, 'å±±è¥¿çœ', 1),
(48, 907, 9, 'è¾½', 0, 'è¾½å®çœ', 1),
(49, 908, 9, 'å‰', 0, 'å‰æ—çœ', 1),
(50, 909, 9, 'é»‘', 0, 'é»‘é¾™æ±Ÿçœ', 1),
(51, 910, 9, 'è‹', 0, 'æ±Ÿè‹çœ', 1),
(52, 911, 9, 'æµ™', 0, 'æµ™æ±Ÿçœ', 1),
(53, 912, 9, 'ç–', 0, 'å®‰å¾½çœ', 1),
(54, 913, 9, 'é—½', 0, 'ç¦å»ºçœ', 1),
(55, 914, 9, 'èµ£', 0, 'æ±Ÿè¥¿çœ', 1),
(56, 915, 9, 'é²', 0, 'å±±ä¸œçœ', 1),
(57, 916, 9, 'è±«', 0, 'æ²³å—çœ', 1),
(58, 917, 9, 'é„‚', 0, 'æ¹–åŒ—çœ', 1),
(59, 918, 9, 'æ¹˜', 0, 'æ¹–å—çœ', 1),
(60, 919, 9, 'ç²¤', 0, 'å¹¿ä¸œçœ', 1),
(61, 920, 9, 'ç¼', 0, 'æµ·å—çœ', 1),
(62, 921, 9, 'å·', 0, 'å››å·çœ', 1),
(63, 922, 9, 'è´µ', 0, 'è´µå·çœ', 1),
(64, 923, 9, 'äº‘', 0, 'äº‘å—çœ', 1),
(65, 924, 9, 'é™•', 0, 'é™•è¥¿çœ', 1),
(66, 925, 9, 'ç”˜', 0, 'ç”˜è‚ƒçœ', 1),
(67, 926, 9, 'é’', 0, 'é’æµ·çœ', 1),
(68, 927, 9, 'å°', 0, 'å°æ¹¾çœ', 1),
(69, 928, 9, 'è’™', 0, 'å†…è’™å¤è‡ªæ²»åŒº', 1),
(70, 929, 9, 'æ¡‚', 0, 'å¹¿è¥¿å£®æ—è‡ªæ²»åŒº', 1),
(71, 930, 9, 'è—', 0, 'è¥¿è—è‡ªæ²»åŒº', 1),
(72, 931, 9, 'å®', 0, 'å®å¤å›æ—è‡ªæ²»åŒº', 1),
(73, 932, 9, 'æ–°', 0, 'æ–°ç–†ç»´å¾å°”è‡ªæ²»åŒº', 1),
(74, 933, 9, 'æ¸¯', 0, 'é¦™æ¸¯ç‰¹åˆ«è¡Œæ”¿åŒº', 1),
(75, 934, 9, 'æ¾³', 0, 'æ¾³é—¨ç‰¹åˆ«è¡Œæ”¿åŒº', 1),
(76, 7001, 70, '', 0, 'Colombie', 1),
(77, 8001, 80, '', 0, 'Nordjylland', 1),
(78, 8002, 80, '', 0, 'Midtjylland', 1),
(79, 8003, 80, '', 0, 'Syddanmark', 1),
(80, 8004, 80, '', 0, 'Hovedstaden', 1),
(81, 8005, 80, '', 0, 'SjĂ¦lland', 1),
(82, 1, 1, '97105', 3, 'Guadeloupe', 1),
(83, 2, 1, '97209', 3, 'Martinique', 1),
(84, 3, 1, '97302', 3, 'Guyane', 1),
(85, 4, 1, '97411', 3, 'RĂ©union', 1),
(86, 6, 1, '97601', 3, 'Mayotte', 1),
(87, 11, 1, '75056', 1, 'Ăle-de-France', 1),
(88, 24, 1, '45234', 2, 'Centre-Val de Loire', 1),
(89, 27, 1, '21231', 0, 'Bourgogne-Franche-ComtĂ©', 1),
(90, 28, 1, '76540', 0, 'Normandie', 1),
(91, 32, 1, '59350', 4, 'Hauts-de-France', 1),
(92, 44, 1, '67482', 2, 'Grand Est', 1),
(93, 52, 1, '44109', 4, 'Pays de la Loire', 1),
(94, 53, 1, '35238', 0, 'Bretagne', 1),
(95, 75, 1, '33063', 0, 'Nouvelle-Aquitaine', 1),
(96, 76, 1, '31355', 1, 'Occitanie', 1),
(97, 84, 1, '69123', 1, 'Auvergne-RhĂ´ne-Alpes', 1),
(98, 93, 1, '13055', 0, 'Provence-Alpes-CĂ´te d\'Azur', 1),
(99, 94, 1, '2A004', 0, 'Corse', 1),
(100, 501, 5, '', 0, 'Deutschland', 1),
(101, 10201, 102, NULL, NULL, 'Î‘Ï„Ï„Î¹ÎºÎ®', 1),
(102, 10202, 102, NULL, NULL, 'Î£Ï„ÎµÏÎµÎ¬ Î•Î»Î»Î¬Î´Î±', 1),
(103, 10203, 102, NULL, NULL, 'ÎÎµÎ½Ï„ÏÎ¹ÎºÎ® ÎœÎ±ÎºÎµÎ´Î¿Î½Î¯Î±', 1),
(104, 10204, 102, NULL, NULL, 'ÎÏÎ®Ï„Î·', 1),
(105, 10205, 102, NULL, NULL, 'Î‘Î½Î±Ï„Î¿Î»Î¹ÎºÎ® ÎœÎ±ÎºÎµÎ´Î¿Î½Î¯Î± ÎºÎ±Î¹ Î˜ÏÎ¬ÎºÎ·', 1),
(106, 10206, 102, NULL, NULL, 'Î‰Ï€ÎµÎ¹ÏÎ¿Ï‚', 1),
(107, 10207, 102, NULL, NULL, 'Î™ÏŒÎ½Î¹Î± Î½Î·ÏƒÎ¹Î¬', 1),
(108, 10208, 102, NULL, NULL, 'Î’ÏŒÏÎµÎ¹Î¿ Î‘Î¹Î³Î±Î¯Î¿', 1),
(109, 10209, 102, NULL, NULL, 'Î ÎµÎ»Î¿Ï€ÏŒÎ½Î½Î·ÏƒÎ¿Ï‚', 1),
(110, 10210, 102, NULL, NULL, 'ÎÏŒÏ„Î¹Î¿ Î‘Î¹Î³Î±Î¯Î¿', 1),
(111, 10211, 102, NULL, NULL, 'Î”Ï…Ï„Î¹ÎºÎ® Î•Î»Î»Î¬Î´Î±', 1),
(112, 10212, 102, NULL, NULL, 'Î˜ÎµÏƒÏƒÎ±Î»Î¯Î±', 1),
(113, 10213, 102, NULL, NULL, 'Î”Ï…Ï„Î¹ÎºÎ® ÎœÎ±ÎºÎµÎ´Î¿Î½Î¯Î±', 1),
(114, 11401, 114, '', 0, 'Honduras', 1),
(115, 180100, 18, 'HU1', NULL, 'KĂ¶zĂ©p-MagyarorszĂ¡g', 1),
(116, 182100, 18, 'HU21', NULL, 'KĂ¶zĂ©p-DunĂ¡ntĂºl', 1),
(117, 182200, 18, 'HU22', NULL, 'Nyugat-DunĂ¡ntĂºl', 1),
(118, 182300, 18, 'HU23', NULL, 'DĂ©l-DunĂ¡ntĂºl', 1),
(119, 183100, 18, 'HU31', NULL, 'Ă‰szak-MagyarorszĂ¡g', 1),
(120, 183200, 18, 'HU32', NULL, 'Ă‰szak-AlfĂ¶ld', 1),
(121, 183300, 18, 'HU33', NULL, 'DĂ©l-AlfĂ¶ld', 1),
(122, 11701, 117, '', 0, 'India', 1),
(123, 11801, 118, '', 0, 'Indonesia', 1),
(124, 301, 3, NULL, 1, 'Abruzzo', 1),
(125, 302, 3, NULL, 1, 'Basilicata', 1),
(126, 303, 3, NULL, 1, 'Calabria', 1),
(127, 304, 3, NULL, 1, 'Campania', 1),
(128, 305, 3, NULL, 1, 'Emilia-Romagna', 1),
(129, 306, 3, NULL, 1, 'Friuli-Venezia Giulia', 1),
(130, 307, 3, NULL, 1, 'Lazio', 1),
(131, 308, 3, NULL, 1, 'Liguria', 1),
(132, 309, 3, NULL, 1, 'Lombardia', 1),
(133, 310, 3, NULL, 1, 'Marche', 1),
(134, 311, 3, NULL, 1, 'Molise', 1),
(135, 312, 3, NULL, 1, 'Piemonte', 1),
(136, 313, 3, NULL, 1, 'Puglia', 1),
(137, 314, 3, NULL, 1, 'Sardegna', 1),
(138, 315, 3, NULL, 1, 'Sicilia', 1),
(139, 316, 3, NULL, 1, 'Toscana', 1),
(140, 317, 3, NULL, 1, 'Trentino-Alto Adige', 1),
(141, 318, 3, NULL, 1, 'Umbria', 1),
(142, 319, 3, NULL, 1, 'Valle d Aosta', 1),
(143, 320, 3, NULL, 1, 'Veneto', 1),
(144, 14001, 140, '', 0, 'Diekirch', 1),
(145, 14002, 140, '', 0, 'Grevenmacher', 1),
(146, 14003, 140, '', 0, 'Luxembourg', 1),
(147, 15201, 152, '', 0, 'RiviĂ¨re Noire', 1),
(148, 15202, 152, '', 0, 'Flacq', 1),
(149, 15203, 152, '', 0, 'Grand Port', 1),
(150, 15204, 152, '', 0, 'Moka', 1),
(151, 15205, 152, '', 0, 'Pamplemousses', 1),
(152, 15206, 152, '', 0, 'Plaines Wilhems', 1),
(153, 15207, 152, '', 0, 'Port-Louis', 1),
(154, 15208, 152, '', 0, 'RiviĂ¨re du Rempart', 1),
(155, 15209, 152, '', 0, 'Savanne', 1),
(156, 15210, 152, '', 0, 'Rodrigues', 1),
(157, 15211, 152, '', 0, 'Les Ă®les AgalĂ©ga', 1),
(158, 15212, 152, '', 0, 'Les Ă©cueils des Cargados Carajos', 1),
(159, 15401, 154, '', 0, 'Mexique', 1),
(160, 1201, 12, '', 0, 'Tanger-TĂ©touan', 1),
(161, 1202, 12, '', 0, 'Gharb-Chrarda-Beni Hssen', 1),
(162, 1203, 12, '', 0, 'Taza-Al Hoceima-Taounate', 1),
(163, 1204, 12, '', 0, 'L\'Oriental', 1),
(164, 1205, 12, '', 0, 'FĂ¨s-Boulemane', 1),
(165, 1206, 12, '', 0, 'MeknĂ¨s-Tafialet', 1),
(166, 1207, 12, '', 0, 'Rabat-SalĂ©-Zemour-ZaĂ«r', 1),
(167, 1208, 12, '', 0, 'Grand Cassablanca', 1),
(168, 1209, 12, '', 0, 'Chaouia-Ouardigha', 1),
(169, 1210, 12, '', 0, 'Doukahla-Adba', 1),
(170, 1211, 12, '', 0, 'Marrakech-Tensift-Al Haouz', 1),
(171, 1212, 12, '', 0, 'Tadla-Azilal', 1),
(172, 1213, 12, '', 0, 'Sous-Massa-DrĂ¢a', 1),
(173, 1214, 12, '', 0, 'Guelmim-Es Smara', 1),
(174, 1215, 12, '', 0, 'LaĂ¢youne-Boujdour-Sakia el Hamra', 1),
(175, 1216, 12, '', 0, 'Oued Ed-Dahab Lagouira', 1),
(176, 1701, 17, '', 0, 'Provincies van Nederland ', 1),
(177, 17801, 178, '', 0, 'Panama', 1),
(178, 18101, 181, '', 0, 'Amazonas', 1),
(179, 18102, 181, '', 0, 'Ancash', 1),
(180, 18103, 181, '', 0, 'Apurimac', 1),
(181, 18104, 181, '', 0, 'Arequipa', 1),
(182, 18105, 181, '', 0, 'Ayacucho', 1),
(183, 18106, 181, '', 0, 'Cajamarca', 1),
(184, 18107, 181, '', 0, 'Callao', 1),
(185, 18108, 181, '', 0, 'Cuzco', 1),
(186, 18109, 181, '', 0, 'Huancavelica', 1),
(187, 18110, 181, '', 0, 'Huanuco', 1),
(188, 18111, 181, '', 0, 'Ica', 1),
(189, 18112, 181, '', 0, 'Junin', 1),
(190, 18113, 181, '', 0, 'La Libertad', 1),
(191, 18114, 181, '', 0, 'Lambayeque', 1),
(192, 18115, 181, '', 0, 'Lima Metropolitana', 1),
(193, 18116, 181, '', 0, 'Lima', 1),
(194, 18117, 181, '', 0, 'Loreto', 1),
(195, 18118, 181, '', 0, 'Madre de Dios', 1),
(196, 18119, 181, '', 0, 'Moquegua', 1),
(197, 18120, 181, '', 0, 'Pasco', 1),
(198, 18121, 181, '', 0, 'Piura', 1),
(199, 18122, 181, '', 0, 'Puno', 1),
(200, 18123, 181, '', 0, 'San MartĂ­n', 1),
(201, 18124, 181, '', 0, 'Tacna', 1),
(202, 18125, 181, '', 0, 'Tumbes', 1),
(203, 18126, 181, '', 0, 'Ucayali', 1),
(204, 15001, 25, 'PT', NULL, 'Portugal', 1),
(205, 15002, 25, 'PT9', NULL, 'Azores-Madeira', 1),
(206, 18801, 188, '', 0, 'Romania', 1),
(207, 8601, 86, NULL, NULL, 'Central', 1),
(208, 8602, 86, NULL, NULL, 'Oriental', 1),
(209, 8603, 86, NULL, NULL, 'Occidental', 1),
(210, 20203, 202, 'SI03', NULL, 'East Slovenia', 1),
(211, 20204, 202, 'SI04', NULL, 'West Slovenia', 1),
(212, 401, 4, '', 0, 'Andalucia', 1),
(213, 402, 4, '', 0, 'AragĂ³n', 1),
(214, 403, 4, '', 0, 'Castilla y LeĂ³n', 1),
(215, 404, 4, '', 0, 'Castilla la Mancha', 1),
(216, 405, 4, '', 0, 'Canarias', 1),
(217, 406, 4, '', 0, 'CataluĂ±a', 1),
(218, 407, 4, '', 0, 'Comunidad de Ceuta', 1),
(219, 408, 4, '', 0, 'Comunidad Foral de Navarra', 1),
(220, 409, 4, '', 0, 'Comunidad de Melilla', 1),
(221, 410, 4, '', 0, 'Cantabria', 1),
(222, 411, 4, '', 0, 'Comunidad Valenciana', 1),
(223, 412, 4, '', 0, 'Extemadura', 1),
(224, 413, 4, '', 0, 'Galicia', 1),
(225, 414, 4, '', 0, 'Islas Baleares', 1),
(226, 415, 4, '', 0, 'La Rioja', 1),
(227, 416, 4, '', 0, 'Comunidad de Madrid', 1),
(228, 417, 4, '', 0, 'RegiĂ³n de Murcia', 1),
(229, 418, 4, '', 0, 'Principado de Asturias', 1),
(230, 419, 4, '', 0, 'Pais Vasco', 1),
(231, 420, 4, '', 0, 'Otros', 1),
(232, 601, 6, '', 1, 'Cantons', 1),
(233, 21301, 213, 'TW', NULL, 'Taiwan', 1),
(234, 1001, 10, '', 0, 'Ariana', 1),
(235, 1002, 10, '', 0, 'BĂ©ja', 1),
(236, 1003, 10, '', 0, 'Ben Arous', 1),
(237, 1004, 10, '', 0, 'Bizerte', 1),
(238, 1005, 10, '', 0, 'GabĂ¨s', 1),
(239, 1006, 10, '', 0, 'Gafsa', 1),
(240, 1007, 10, '', 0, 'Jendouba', 1),
(241, 1008, 10, '', 0, 'Kairouan', 1),
(242, 1009, 10, '', 0, 'Kasserine', 1),
(243, 1010, 10, '', 0, 'KĂ©bili', 1),
(244, 1011, 10, '', 0, 'La Manouba', 1),
(245, 1012, 10, '', 0, 'Le Kef', 1),
(246, 1013, 10, '', 0, 'Mahdia', 1),
(247, 1014, 10, '', 0, 'MĂ©denine', 1),
(248, 1015, 10, '', 0, 'Monastir', 1),
(249, 1016, 10, '', 0, 'Nabeul', 1),
(250, 1017, 10, '', 0, 'Sfax', 1),
(251, 1018, 10, '', 0, 'Sidi Bouzid', 1),
(252, 1019, 10, '', 0, 'Siliana', 1),
(253, 1020, 10, '', 0, 'Sousse', 1),
(254, 1021, 10, '', 0, 'Tataouine', 1),
(255, 1022, 10, '', 0, 'Tozeur', 1),
(256, 1023, 10, '', 0, 'Tunis', 1),
(257, 1024, 10, '', 0, 'Zaghouan', 1),
(258, 22701, 227, '', 0, 'United Arab Emirates', 1),
(259, 701, 7, '', 0, 'England', 1),
(260, 702, 7, '', 0, 'Wales', 1),
(261, 703, 7, '', 0, 'Scotland', 1),
(262, 704, 7, '', 0, 'Northern Ireland', 1),
(263, 1101, 11, '', 0, 'United-States', 1),
(264, 23201, 232, '', 0, 'Los Andes', 1),
(265, 23202, 232, '', 0, 'Capital', 1),
(266, 23203, 232, '', 0, 'Central', 1),
(267, 23204, 232, '', 0, 'Cento Occidental', 1),
(268, 23205, 232, '', 0, 'Guayana', 1),
(269, 23206, 232, '', 0, 'Insular', 1),
(270, 23207, 232, '', 0, 'Los Llanos', 1),
(271, 23208, 232, '', 0, 'Nor-Oriental', 1),
(272, 23209, 232, '', 0, 'Zuliana', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_revenuestamp`
--

CREATE TABLE `erp_c_revenuestamp` (
  `rowid` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `taux` double NOT NULL,
  `revenuestamp_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `note` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_revenuestamp`
--

INSERT INTO `erp_c_revenuestamp` (`rowid`, `fk_pays`, `taux`, `revenuestamp_type`, `note`, `active`, `accountancy_code_sell`, `accountancy_code_buy`) VALUES
(101, 10, 0.4, 'fixed', 'Revenue stamp tunisia', 1, NULL, NULL),
(1541, 154, 1.5, 'percent', 'Revenue stamp mexico', 1, NULL, NULL),
(1542, 154, 3, 'percent', 'Revenue stamp mexico', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_shipment_mode`
--

CREATE TABLE `erp_c_shipment_mode` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_shipment_mode`
--

INSERT INTO `erp_c_shipment_mode` (`rowid`, `entity`, `tms`, `code`, `libelle`, `description`, `tracking`, `active`, `module`) VALUES
(1, 1, '2021-11-09 04:36:56', 'CATCH', 'In-Store Collection', 'In-store collection by the customer', '', 1, NULL),
(2, 1, '2021-11-09 04:36:56', 'TRANS', 'Generic transport service', 'Generic transport service', '', 1, NULL),
(3, 1, '2021-11-09 04:36:56', 'COLSUI', 'Colissimo Suivi', 'Colissimo Suivi', 'https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}', 0, NULL),
(4, 1, '2021-11-09 04:36:56', 'LETTREMAX', 'Lettre Max', 'Courrier Suivi et Lettre Max', 'https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}', 0, NULL),
(5, 1, '2021-11-09 04:36:56', 'UPS', 'UPS', 'United Parcel Service', 'http://wwwapps.ups.com/etracking/tracking.cgi?InquiryNumber2=&InquiryNumber3=&tracknums_displayed=3&loc=fr_FR&TypeOfInquiryNumber=T&HTMLVersion=4.0&InquiryNumber22=&InquiryNumber32=&track=Track&Suivi.x=64&Suivi.y=7&Suivi=Valider&InquiryNumber1={TRACKID}', 1, NULL),
(6, 1, '2021-11-09 04:36:56', 'KIALA', 'KIALA', 'Relais Kiala', 'http://www.kiala.fr/tnt/delivery/{TRACKID}', 0, NULL),
(7, 1, '2021-11-09 04:36:56', 'GLS', 'GLS', 'General Logistics Systems', 'https://gls-group.eu/FR/fr/suivi-colis?match={TRACKID}', 0, NULL),
(8, 1, '2021-11-09 04:36:56', 'CHRONO', 'Chronopost', 'Chronopost', 'http://www.chronopost.fr/expedier/inputLTNumbersNoJahia.do?listeNumeros={TRACKID}', 0, NULL),
(9, 1, '2021-11-09 04:36:56', 'INPERSON', 'In person at your site', NULL, NULL, 0, NULL),
(10, 1, '2021-11-09 04:36:56', 'FEDEX', 'Fedex', NULL, 'https://www.fedex.com/apps/fedextrack/index.html?tracknumbers={TRACKID}', 0, NULL),
(11, 1, '2021-11-09 04:36:56', 'TNT', 'TNT', NULL, 'https://www.tnt.com/express/fr_fr/site/outils-expedition/suivi.html?searchType=con&cons=={TRACKID}', 0, NULL),
(12, 1, '2021-11-09 04:36:56', 'DHL', 'DHL', NULL, 'https://www.dhl.com/fr-fr/home/tracking/tracking-global-forwarding.html?submit=1&tracking-id={TRACKID}', 0, NULL),
(13, 1, '2021-11-09 04:36:56', 'DPD', 'DPD', NULL, 'https://www.dpd.fr/trace/{TRACKID}', 0, NULL),
(14, 1, '2021-11-09 04:36:56', 'MAINFREIGHT', 'Mainfreight', NULL, 'https://www.mainfreight.com/track?{TRACKID}', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_shipment_package_type`
--

CREATE TABLE `erp_c_shipment_package_type` (
  `rowid` int(11) NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_socialnetworks`
--

CREATE TABLE `erp_c_socialnetworks` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_socialnetworks`
--

INSERT INTO `erp_c_socialnetworks` (`rowid`, `entity`, `code`, `label`, `url`, `icon`, `active`) VALUES
(1, 1, '500px', '500px', '{socialid}', 'fa-500px', 0),
(2, 1, 'dailymotion', 'Dailymotion', '{socialid}', '', 0),
(3, 1, 'diaspora', 'Diaspora', '{socialid}', '', 0),
(4, 1, 'discord', 'Discord', '{socialid}', 'fa-discord', 0),
(5, 1, 'facebook', 'Facebook', 'https://www.facebook.com/{socialid}', 'fa-facebook', 1),
(6, 1, 'flickr', 'Flickr', '{socialid}', 'fa-flickr', 0),
(7, 1, 'gifycat', 'Gificat', '{socialid}', '', 0),
(8, 1, 'giphy', 'Giphy', '{socialid}', '', 0),
(9, 1, 'googleplus', 'GooglePlus', 'https://www.googleplus.com/{socialid}', 'fa-google-plus-g', 0),
(10, 1, 'instagram', 'Instagram', 'https://www.instagram.com/{socialid}', 'fa-instagram', 1),
(11, 1, 'linkedin', 'LinkedIn', 'https://www.linkedin.com/{socialid}', 'fa-linkedin', 1),
(12, 1, 'mastodon', 'Mastodon', '{socialid}', '', 0),
(13, 1, 'meetup', 'Meetup', '{socialid}', 'fa-meetup', 0),
(14, 1, 'periscope', 'Periscope', '{socialid}', '', 0),
(15, 1, 'pinterest', 'Pinterest', '{socialid}', 'fa-pinterest', 0),
(16, 1, 'quora', 'Quora', '{socialid}', '', 0),
(17, 1, 'reddit', 'Reddit', '{socialid}', 'fa-reddit', 0),
(18, 1, 'slack', 'Slack', '{socialid}', 'fa-slack', 0),
(19, 1, 'snapchat', 'Snapchat', '{socialid}', 'fa-snapchat', 1),
(20, 1, 'skype', 'Skype', 'https://www.skype.com/{socialid}', 'fa-skype', 1),
(21, 1, 'tripadvisor', 'Tripadvisor', '{socialid}', '', 0),
(22, 1, 'tumblr', 'Tumblr', 'https://www.tumblr.com/{socialid}', 'fa-tumblr', 0),
(23, 1, 'twitch', 'Twitch', '{socialid}', '', 0),
(24, 1, 'twitter', 'Twitter', 'https://www.twitter.com/{socialid}', 'fa-twitter', 1),
(25, 1, 'vero', 'Vero', 'https://vero.co/{socialid}', '', 0),
(26, 1, 'viadeo', 'Viadeo', 'https://fr.viadeo.com/fr/{socialid}', 'fa-viadeo', 0),
(27, 1, 'viber', 'Viber', '{socialid}', '', 0),
(28, 1, 'vimeo', 'Vimeo', '{socialid}', '', 0),
(29, 1, 'whatsapp', 'Whatsapp', '{socialid}', 'fa-whatsapp', 1),
(30, 1, 'wikipedia', 'Wikipedia', '{socialid}', '', 0),
(31, 1, 'xing', 'Xing', '{socialid}', 'fa-xing', 0),
(32, 1, 'youtube', 'Youtube', 'https://www.youtube.com/{socialid}', 'fa-youtube', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_stcomm`
--

CREATE TABLE `erp_c_stcomm` (
  `id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picto` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_stcomm`
--

INSERT INTO `erp_c_stcomm` (`id`, `code`, `libelle`, `picto`, `active`) VALUES
(-1, 'ST_NO', 'Do not contact', NULL, 1),
(0, 'ST_NEVER', 'Never contacted', NULL, 1),
(1, 'ST_TODO', 'To contact', NULL, 1),
(2, 'ST_PEND', 'Contact in progress', NULL, 1),
(3, 'ST_DONE', 'Contacted', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_stcommcontact`
--

CREATE TABLE `erp_c_stcommcontact` (
  `id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picto` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_stcommcontact`
--

INSERT INTO `erp_c_stcommcontact` (`id`, `code`, `libelle`, `picto`, `active`) VALUES
(-1, 'ST_NO', 'Do not contact', NULL, 1),
(0, 'ST_NEVER', 'Never contacted', NULL, 1),
(1, 'ST_TODO', 'To contact', NULL, 1),
(2, 'ST_PEND', 'Contact in progress', NULL, 1),
(3, 'ST_DONE', 'Contacted', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_ticket_category`
--

CREATE TABLE `erp_c_ticket_category` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public` int(11) DEFAULT 0,
  `use_default` int(11) DEFAULT 1,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `force_severity` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_ticket_category`
--

INSERT INTO `erp_c_ticket_category` (`rowid`, `entity`, `code`, `label`, `public`, `use_default`, `fk_parent`, `force_severity`, `description`, `pos`, `active`) VALUES
(1, 1, 'OTHER', 'Other', 0, 1, 0, NULL, NULL, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_ticket_resolution`
--

CREATE TABLE `erp_c_ticket_resolution` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_ticket_resolution`
--

INSERT INTO `erp_c_ticket_resolution` (`rowid`, `entity`, `code`, `pos`, `label`, `active`, `use_default`, `description`) VALUES
(1, 1, 'SOLVED', '10', 'Solved', 1, 0, NULL),
(2, 1, 'CANCELED', '50', 'Canceled', 1, 0, NULL),
(3, 1, 'OTHER', '90', 'Other', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_ticket_severity`
--

CREATE TABLE `erp_c_ticket_severity` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_ticket_severity`
--

INSERT INTO `erp_c_ticket_severity` (`rowid`, `entity`, `code`, `pos`, `label`, `color`, `active`, `use_default`, `description`) VALUES
(1, 1, 'LOW', '10', 'Low', '', 1, 0, NULL),
(2, 1, 'NORMAL', '20', 'Normal', '', 1, 1, NULL),
(3, 1, 'HIGH', '30', 'High', '', 1, 0, NULL),
(4, 1, 'BLOCKING', '40', 'Critical / blocking', '', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_ticket_type`
--

CREATE TABLE `erp_c_ticket_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_ticket_type`
--

INSERT INTO `erp_c_ticket_type` (`rowid`, `entity`, `code`, `pos`, `label`, `active`, `use_default`, `description`) VALUES
(1, 1, 'COM', '10', 'Commercial question', 1, 0, NULL),
(2, 1, 'HELP', '15', 'Request for functionnal help', 1, 0, NULL),
(3, 1, 'ISSUE', '20', 'Issue or bug', 1, 0, NULL),
(4, 1, 'PROBLEM', '22', 'Problem', 0, 0, NULL),
(5, 1, 'REQUEST', '25', 'Change or enhancement request', 1, 0, NULL),
(6, 1, 'PROJECT', '30', 'Project', 0, 0, NULL),
(7, 1, 'OTHER', '40', 'Other', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_transport_mode`
--

CREATE TABLE `erp_c_transport_mode` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_transport_mode`
--

INSERT INTO `erp_c_transport_mode` (`rowid`, `entity`, `code`, `label`, `active`) VALUES
(1, 1, 'MAR', 'Transport maritime (y compris camions ou wagons sur bateau)', 1),
(2, 1, 'TRA', 'Transport par chemin de fer (y compris camions sur wagon)', 1),
(3, 1, 'ROU', 'Transport par route', 1),
(4, 1, 'AIR', 'Transport par air', 1),
(5, 1, 'POS', 'Envois postaux', 1),
(6, 1, 'OLE', 'Installations de transport fixe (olĂ©oduc)', 1),
(7, 1, 'NAV', 'Transport par navigation intĂ©rieure', 1),
(8, 1, 'PRO', 'Propulsion propre', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_tva`
--

CREATE TABLE `erp_c_tva` (
  `rowid` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `taux` double NOT NULL,
  `localtax1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `note` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_tva`
--

INSERT INTO `erp_c_tva` (`rowid`, `fk_pays`, `code`, `taux`, `localtax1`, `localtax1_type`, `localtax2`, `localtax2_type`, `recuperableonly`, `note`, `active`, `accountancy_code_sell`, `accountancy_code_buy`) VALUES
(11, 1, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0 ou non applicable', 1, NULL, NULL),
(12, 1, '', 20, '0', '0', '0', '0', 0, 'VAT rate - standard (France hors DOM-TOM)', 1, NULL, NULL),
(13, 1, '', 10, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(14, 1, '', 5.5, '0', '0', '0', '0', 0, 'VAT rate - reduced (France hors DOM-TOM)', 1, NULL, NULL),
(15, 1, '', 2.1, '0', '0', '0', '0', 0, 'VAT rate - super-reduced', 1, NULL, NULL),
(16, 1, '85', 8.5, '0', '0', '0', '0', 0, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin)', 0, NULL, NULL),
(17, 1, '85NPR', 8.5, '0', '0', '0', '0', 1, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perĂ§u par le vendeur mais rĂ©cupĂ©rable par acheteur', 0, NULL, NULL),
(18, 1, '85NPROM', 8.5, '2', '3', '0', '0', 1, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer', 0, NULL, NULL),
(19, 1, '85NPROMOMR', 8.5, '2', '3', '2.5', '3', 1, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer et Octroi de Mer Regional', 0, NULL, NULL),
(21, 2, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0 ou non applicable', 1, NULL, NULL),
(22, 2, '', 6, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(23, 2, '', 21, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(24, 2, '', 12, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(31, 3, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(32, 3, '', 10, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(33, 3, '', 4, '0', '0', '0', '0', 0, 'VAT rate - super-reduced', 1, NULL, NULL),
(34, 3, '', 22, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(41, 4, '', 0, '0', '3', '-19:-15:-9', '5', 0, 'VAT rate 0', 1, NULL, NULL),
(42, 4, '', 10, '1.4', '3', '-19:-15:-9', '5', 0, 'VAT rate - reduced', 1, NULL, NULL),
(43, 4, '', 4, '0.5', '3', '-19:-15:-9', '5', 0, 'VAT rate - super-reduced', 1, NULL, NULL),
(44, 4, '', 21, '5.2', '3', '-19:-15:-9', '5', 0, 'VAT rate - standard', 1, NULL, NULL),
(51, 5, '', 0, '0', '0', '0', '0', 0, 'No VAT', 1, NULL, NULL),
(52, 5, '', 7, '0', '0', '0', '0', 0, 'ermĂ¤ĂŸigte USt.', 1, NULL, NULL),
(54, 5, '', 5.5, '0', '0', '0', '0', 0, 'USt. Forst', 0, NULL, NULL),
(55, 5, '', 10.7, '0', '0', '0', '0', 0, 'USt. Landwirtschaft', 0, NULL, NULL),
(56, 5, '', 19, '0', '0', '0', '0', 0, 'allgemeine Ust.', 1, NULL, NULL),
(61, 6, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(62, 6, '', 3.7, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(63, 6, '', 2.5, '0', '0', '0', '0', 0, 'VAT rate - super-reduced', 1, NULL, NULL),
(64, 6, '', 7.7, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(71, 7, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(72, 7, '', 17.5, '0', '0', '0', '0', 0, 'VAT rate - standard before 2011', 1, NULL, NULL),
(73, 7, '', 5, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(74, 7, '', 20, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(81, 8, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(82, 8, '', 23, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(83, 8, '', 13.5, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(84, 8, '', 9, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(85, 8, '', 4.8, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(91, 9, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(92, 9, '', 13, '0', '0', '0', '0', 0, 'VAT rate - reduced 0', 1, NULL, NULL),
(93, 9, '', 3, '0', '0', '0', '0', 0, 'VAT rate -  super-reduced 0', 1, NULL, NULL),
(94, 9, '', 17, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(101, 10, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(102, 10, '', 12, '0', '0', '0', '0', 0, 'VAT 12%', 1, NULL, NULL),
(103, 10, '', 18, '0', '0', '0', '0', 0, 'VAT 18%', 1, NULL, NULL),
(104, 10, '', 7.5, '0', '0', '0', '0', 0, 'VAT 6% MajorĂ© Ă  25% (7.5%)', 1, NULL, NULL),
(105, 10, '', 15, '0', '0', '0', '0', 0, 'VAT 12% MajorĂ© Ă  25% (15%)', 1, NULL, NULL),
(106, 10, '', 22.5, '0', '0', '0', '0', 0, 'VAT 18% MajorĂ© Ă  25% (22.5%)', 1, NULL, NULL),
(107, 10, '', 6, '0', '0', '0', '0', 0, 'VAT 6%', 1, NULL, NULL),
(108, 10, '', 18.18, '1', '4', '0', '0', 0, 'VAT 18%+FODEC', 1, NULL, NULL),
(111, 11, '', 0, '0', '0', '0', '0', 0, 'No Sales Tax', 1, NULL, NULL),
(112, 11, '', 4, '0', '0', '0', '0', 0, 'Sales Tax 4%', 1, NULL, NULL),
(113, 11, '', 6, '0', '0', '0', '0', 0, 'Sales Tax 6%', 1, NULL, NULL),
(121, 12, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(122, 12, '', 14, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(123, 12, '', 10, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(124, 12, '', 7, '0', '0', '0', '0', 0, 'VAT rate - super-reduced', 1, NULL, NULL),
(125, 12, '', 20, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(131, 13, '', 0, '0', '0', '0', '0', 0, 'TVA 0%', 1, NULL, NULL),
(132, 13, '', 9, '0', '0', '0', '0', 0, 'TVA 9%', 1, NULL, NULL),
(133, 13, '', 19, '0', '0', '0', '0', 0, 'TVA 19%', 1, NULL, NULL),
(141, 14, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(142, 14, '', 7, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(143, 14, '', 5, '9.975', '1', '0', '0', 0, 'GST/TPS and PST/TVQ rate for Province', 1, NULL, NULL),
(171, 17, '', 0, '0', '0', '0', '0', 0, '0 BTW tarief', 1, NULL, NULL),
(172, 17, '', 6, '0', '0', '0', '0', 0, 'Verlaagd BTW tarief', 1, NULL, NULL),
(173, 17, '', 19, '0', '0', '0', '0', 0, 'Algemeen BTW tarief', 1, NULL, NULL),
(174, 17, '', 21, '0', '0', '0', '0', 0, 'Algemeen BTW tarief (vanaf 1 oktober 2012)', 0, NULL, NULL),
(201, 20, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(202, 20, '', 12, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(203, 20, '', 6, '0', '0', '0', '0', 0, 'VAT rate - super-reduced', 1, NULL, NULL),
(204, 20, '', 25, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(211, 21, '', 0, '0', '0', '0', '0', 0, 'IVA Rate 0', 1, NULL, NULL),
(212, 21, '', 18, '7.5', '2', '0', '0', 0, 'IVA standard rate', 1, NULL, NULL),
(221, 22, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(222, 22, '', 10, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(223, 22, '', 18, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(231, 23, '', 0, '0', '0', '0', '0', 0, 'IVA Rate 0', 1, NULL, NULL),
(232, 23, '', 10.5, '0', '0', '0', '0', 0, 'IVA reduced rate', 1, NULL, NULL),
(233, 23, '', 21, '0', '0', '0', '0', 0, 'IVA standard rate', 1, NULL, NULL),
(241, 24, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(242, 24, '', 19.25, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(251, 25, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(252, 25, '', 13, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(253, 25, '', 23, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(254, 25, '', 6, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(261, 26, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(262, 26, '', 5, '0', '0', '0', '0', 0, 'VAT rate 5', 1, NULL, NULL),
(271, 27, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0 ou non applicable', 1, NULL, NULL),
(272, 27, '', 8.5, '0', '0', '0', '0', 0, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin)', 0, NULL, NULL),
(273, 27, '', 8.5, '0', '0', '0', '0', 1, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perĂ§u par le vendeur mais rĂ©cupĂ©rable par acheteur', 0, NULL, NULL),
(274, 27, '', 5.5, '0', '0', '0', '0', 0, 'VAT rate - reduced (France hors DOM-TOM)', 0, NULL, NULL),
(275, 27, '', 19.6, '0', '0', '0', '0', 0, 'VAT rate - standard (France hors DOM-TOM)', 1, NULL, NULL),
(276, 27, '', 2.1, '0', '0', '0', '0', 0, 'VAT rate - super-reduced', 1, NULL, NULL),
(277, 27, '', 7, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(281, 28, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(282, 28, '', 10, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(351, 35, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(352, 35, '', 7, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(353, 35, '', 14, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(411, 41, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(412, 41, '', 10, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(413, 41, '', 20, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(461, 46, '', 0, '0', '0', '0', '0', 0, 'No VAT', 1, NULL, NULL),
(462, 46, '', 15, '0', '0', '0', '0', 0, 'VAT 15%', 1, NULL, NULL),
(463, 46, '', 7.5, '0', '0', '0', '0', 0, 'VAT 7.5%', 1, NULL, NULL),
(561, 56, '', 0, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(591, 59, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(592, 59, '', 7, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(593, 59, '', 20, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(671, 67, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(672, 67, '', 19, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(721, 72, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(722, 72, '', 18, '0.9', '1', '0', '0', 0, 'VAT rate 18+0.9', 1, NULL, NULL),
(781, 78, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(782, 78, '', 9, '0', '0', '0', '0', 0, 'VAT rate 9', 1, NULL, NULL),
(783, 78, '', 5, '0', '0', '0', '0', 0, 'VAT rate 5', 1, NULL, NULL),
(784, 78, '', 19, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(801, 80, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(802, 80, '', 25, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(861, 86, '', 0, '0', '0', '0', '0', 0, 'SIN IVA', 1, NULL, NULL),
(862, 86, '', 13, '0', '0', '0', '0', 0, 'IVA 13', 1, NULL, NULL),
(1021, 102, '', 0, '0', '0', '0', '0', 0, 'ÎœÎ·Î´ÎµÎ½Î¹ÎºÏŒ Î¦.Î .Î‘.', 1, NULL, NULL),
(1022, 102, '', 24, '0', '0', '0', '0', 0, 'ÎÎ±Î½Î¿Î½Î¹ÎºÏŒÏ‚ Î¦.Î .Î‘.', 1, NULL, NULL),
(1023, 102, '', 13, '0', '0', '0', '0', 0, 'ÎœÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.', 1, NULL, NULL),
(1024, 102, '', 6, '0', '0', '0', '0', 0, 'Î¥Ï€ÎµÏÎ¼ÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.', 1, NULL, NULL),
(1025, 102, '', 16, '0', '0', '0', '0', 0, 'ÎÎ®ÏƒÏ‰Î½ ÎºÎ±Î½Î¿Î½Î¹ÎºÏŒÏ‚ Î¦.Î .Î‘.', 1, NULL, NULL),
(1026, 102, '', 9, '0', '0', '0', '0', 0, 'ÎÎ®ÏƒÏ‰Î½ Î¼ÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.', 1, NULL, NULL),
(1027, 102, '', 4, '0', '0', '0', '0', 0, 'ÎÎ®ÏƒÏ‰Î½ Ï…Ï€ÎµÏÎ¼ÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.', 1, NULL, NULL),
(1028, 102, '', 17, '0', '0', '0', '0', 0, 'ÎÎ®ÏƒÏ‰Î½ Ï…Ï€ÎµÏÎ¼ÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.', 1, NULL, NULL),
(1141, 114, '', 0, '0', '0', '0', '0', 0, 'No ISV', 1, NULL, NULL),
(1142, 114, '', 12, '0', '0', '0', '0', 0, 'ISV 12%', 1, NULL, NULL),
(1161, 116, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1162, 116, '', 7, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(1163, 116, '', 25.5, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(1171, 117, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 0, NULL, NULL),
(1172, 117, 'C+S-5', 0, '2.5', '1', '2.5', '1', 0, 'CGST+SGST - Same state sales', 1, NULL, NULL),
(1173, 117, 'I-5', 5, '0', '0', '0', '0', 0, 'IGST', 1, NULL, NULL),
(1174, 117, 'C+S-12', 0, '6', '1', '6', '1', 0, 'CGST+SGST - Same state sales', 1, NULL, NULL),
(1175, 117, 'I-12', 12, '0', '0', '0', '0', 0, 'IGST', 1, NULL, NULL),
(1176, 117, 'C+S-18', 0, '9', '1', '9', '1', 0, 'CGST+SGST - Same state sales', 1, NULL, NULL),
(1177, 117, 'I-18', 18, '0', '0', '0', '0', 0, 'IGST', 1, NULL, NULL),
(1178, 117, 'C+S-28', 0, '14', '1', '14', '1', 0, 'CGST+SGST - Same state sales', 1, NULL, NULL),
(1179, 117, 'I-28', 28, '0', '0', '0', '0', 0, 'IGST', 1, NULL, NULL),
(1231, 123, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1232, 123, '', 5, '0', '0', '0', '0', 0, 'VAT rate 5', 1, NULL, NULL),
(1401, 140, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1402, 140, '', 14, '0', '0', '0', '0', 0, 'VAT rate - intermediary', 1, NULL, NULL),
(1403, 140, '', 8, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(1404, 140, '', 3, '0', '0', '0', '0', 0, 'VAT rate - super-reduced', 1, NULL, NULL),
(1405, 140, '', 17, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(1471, 147, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1481, 148, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1482, 148, '', 7, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(1483, 148, '', 5, '0', '0', '0', '0', 0, 'VAT rate - super-reduced', 1, NULL, NULL),
(1484, 148, '', 18, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(1511, 151, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1512, 151, '', 14, '0', '0', '0', '0', 0, 'VAT rate 14', 1, NULL, NULL),
(1521, 152, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1522, 152, '', 15, '0', '0', '0', '0', 0, 'VAT rate 15', 1, NULL, NULL),
(1541, 154, '', 0, '0', '0', '0', '0', 0, 'No VAT', 1, NULL, NULL),
(1542, 154, '', 16, '0', '0', '0', '0', 0, 'VAT 16%', 1, NULL, NULL),
(1543, 154, '', 10, '0', '0', '0', '0', 0, 'VAT Frontero', 1, NULL, NULL),
(1651, 165, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1652, 165, '', 3, '0', '0', '0', '0', 0, 'VAT standard 3', 1, NULL, NULL),
(1653, 165, '', 6, '0', '0', '0', '0', 0, 'VAT standard 6', 1, NULL, NULL),
(1654, 165, '', 11, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(1655, 165, '', 22, '0', '0', '0', '0', 0, 'VAT standard high', 1, NULL, NULL),
(1661, 166, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1662, 166, '', 15, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(1691, 169, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1692, 169, '', 5, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(1731, 173, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1732, 173, '', 14, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(1733, 173, '', 8, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(1734, 173, '', 25, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(1781, 178, '', 0, '0', '0', '0', '0', 0, 'ITBMS Rate 0', 1, NULL, NULL),
(1782, 178, '', 7, '0', '0', '0', '0', 0, 'ITBMS standard rate', 1, NULL, NULL),
(1811, 181, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1818, 181, '', 18, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(1841, 184, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1842, 184, '', 8, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(1843, 184, '', 3, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(1844, 184, '', 23, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(1881, 188, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(1882, 188, '', 9, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(1883, 188, '', 19, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(1884, 188, '', 5, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(1931, 193, '', 0, '0', '0', '0', '0', 0, 'No VAT in SPM', 1, NULL, NULL),
(2011, 201, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(2012, 201, '', 10, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(2013, 201, '', 19, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(2021, 202, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(2022, 202, '', 9.5, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(2023, 202, '', 22, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(2051, 205, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(2052, 205, '', 15, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(2071, 207, '', 0, '0', '0', '0', '0', 0, 'VAT 0', 1, NULL, NULL),
(2072, 207, '', 15, '0', '0', '0', '0', 0, 'VAT 15%', 1, NULL, NULL),
(2131, 213, '', 0, '0', '0', '0', '0', 0, 'VAT 0', 1, NULL, NULL),
(2132, 213, '', 5, '0', '0', '0', '0', 0, 'VAT 5%', 1, NULL, NULL),
(2261, 226, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(2262, 226, '', 20, '0', '0', '0', '0', 0, 'VAT standart rate', 1, NULL, NULL),
(2321, 232, '', 0, '0', '0', '0', '0', 0, 'No VAT', 1, NULL, NULL),
(2322, 232, '', 12, '0', '0', '0', '0', 0, 'VAT 12%', 1, NULL, NULL),
(2323, 232, '', 8, '0', '0', '0', '0', 0, 'VAT 8%', 1, NULL, NULL),
(2461, 246, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(2462, 29, '7', 7, '0', '0', '0', '0', 0, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_typent`
--

CREATE TABLE `erp_c_typent` (
  `id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_typent`
--

INSERT INTO `erp_c_typent` (`id`, `code`, `libelle`, `fk_country`, `active`, `module`, `position`) VALUES
(1, 'TE_STARTUP', 'Start-up', NULL, 0, NULL, 0),
(2, 'TE_GROUP', 'Grand groupe', NULL, 1, NULL, 0),
(3, 'TE_MEDIUM', 'PME/PMI', NULL, 1, NULL, 0),
(4, 'TE_SMALL', 'TPE', NULL, 1, NULL, 0),
(5, 'TE_ADMIN', 'Administration', NULL, 1, NULL, 0),
(6, 'TE_WHOLE', 'Grossiste', NULL, 0, NULL, 0),
(7, 'TE_RETAIL', 'Revendeur', NULL, 0, NULL, 0),
(8, 'TE_PRIVATE', 'Particulier', NULL, 1, NULL, 0),
(100, 'TE_OTHER', 'Autres', NULL, 1, NULL, 0),
(231, 'TE_A_RI', 'Responsable Inscripto (typo A)', 23, 0, NULL, 0),
(232, 'TE_B_RNI', 'Responsable No Inscripto (typo B)', 23, 0, NULL, 0),
(233, 'TE_C_FE', 'Consumidor Final/Exento (typo C)', 23, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_type_contact`
--

CREATE TABLE `erp_c_type_contact` (
  `rowid` int(11) NOT NULL,
  `element` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'external',
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_type_contact`
--

INSERT INTO `erp_c_type_contact` (`rowid`, `element`, `source`, `code`, `libelle`, `active`, `module`, `position`) VALUES
(10, 'contrat', 'internal', 'SALESREPSIGN', 'Commercial signataire du contrat', 1, NULL, 0),
(11, 'contrat', 'internal', 'SALESREPFOLL', 'Commercial suivi du contrat', 1, NULL, 0),
(20, 'contrat', 'external', 'BILLING', 'Contact client facturation contrat', 1, NULL, 0),
(21, 'contrat', 'external', 'CUSTOMER', 'Contact client suivi contrat', 1, NULL, 0),
(22, 'contrat', 'external', 'SALESREPSIGN', 'Contact client signataire contrat', 1, NULL, 0),
(31, 'propal', 'internal', 'SALESREPFOLL', 'Commercial Ă  l\'origine de la propale', 1, NULL, 0),
(40, 'propal', 'external', 'BILLING', 'Contact client facturation propale', 1, NULL, 0),
(41, 'propal', 'external', 'CUSTOMER', 'Contact client suivi propale', 1, NULL, 0),
(42, 'propal', 'external', 'SHIPPING', 'Contact client livraison propale', 1, NULL, 0),
(50, 'facture', 'internal', 'SALESREPFOLL', 'Responsable suivi du paiement', 1, NULL, 0),
(60, 'facture', 'external', 'BILLING', 'Contact client facturation', 1, NULL, 0),
(61, 'facture', 'external', 'SHIPPING', 'Contact client livraison', 1, NULL, 0),
(62, 'facture', 'external', 'SERVICE', 'Contact client prestation', 1, NULL, 0),
(70, 'invoice_supplier', 'internal', 'SALESREPFOLL', 'Responsable suivi du paiement', 1, NULL, 0),
(71, 'invoice_supplier', 'external', 'BILLING', 'Contact fournisseur facturation', 1, NULL, 0),
(72, 'invoice_supplier', 'external', 'SHIPPING', 'Contact fournisseur livraison', 1, NULL, 0),
(73, 'invoice_supplier', 'external', 'SERVICE', 'Contact fournisseur prestation', 1, NULL, 0),
(80, 'agenda', 'internal', 'ACTOR', 'Responsable', 1, NULL, 0),
(81, 'agenda', 'internal', 'GUEST', 'Guest', 1, NULL, 0),
(85, 'agenda', 'external', 'ACTOR', 'Responsable', 1, NULL, 0),
(86, 'agenda', 'external', 'GUEST', 'Guest', 1, NULL, 0),
(91, 'commande', 'internal', 'SALESREPFOLL', 'Responsable suivi de la commande', 1, NULL, 0),
(100, 'commande', 'external', 'BILLING', 'Contact client facturation commande', 1, NULL, 0),
(101, 'commande', 'external', 'CUSTOMER', 'Contact client suivi commande', 1, NULL, 0),
(102, 'commande', 'external', 'SHIPPING', 'Contact client livraison commande', 1, NULL, 0),
(110, 'supplier_proposal', 'internal', 'SALESREPFOLL', 'Responsable suivi de la demande', 1, NULL, 0),
(111, 'supplier_proposal', 'external', 'BILLING', 'Contact fournisseur facturation', 1, NULL, 0),
(112, 'supplier_proposal', 'external', 'SHIPPING', 'Contact fournisseur livraison', 1, NULL, 0),
(113, 'supplier_proposal', 'external', 'SERVICE', 'Contact fournisseur prestation', 1, NULL, 0),
(120, 'fichinter', 'internal', 'INTERREPFOLL', 'Responsable suivi de l\'intervention', 1, NULL, 0),
(121, 'fichinter', 'internal', 'INTERVENING', 'Intervenant', 1, NULL, 0),
(130, 'fichinter', 'external', 'BILLING', 'Contact client facturation intervention', 1, NULL, 0),
(131, 'fichinter', 'external', 'CUSTOMER', 'Contact client suivi de l\'intervention', 1, NULL, 0),
(140, 'order_supplier', 'internal', 'SALESREPFOLL', 'Responsable suivi de la commande', 1, NULL, 0),
(141, 'order_supplier', 'internal', 'SHIPPING', 'Responsable rĂ©ception de la commande', 1, NULL, 0),
(142, 'order_supplier', 'external', 'BILLING', 'Contact fournisseur facturation commande', 1, NULL, 0),
(143, 'order_supplier', 'external', 'CUSTOMER', 'Contact fournisseur suivi commande', 1, NULL, 0),
(145, 'order_supplier', 'external', 'SHIPPING', 'Contact fournisseur livraison commande', 1, NULL, 0),
(150, 'dolresource', 'internal', 'USERINCHARGE', 'In charge of resource', 1, NULL, 0),
(151, 'dolresource', 'external', 'THIRDINCHARGE', 'In charge of resource', 1, NULL, 0),
(155, 'ticket', 'internal', 'SUPPORTTEC', 'Utilisateur contact support', 1, NULL, 0),
(156, 'ticket', 'internal', 'CONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(157, 'ticket', 'external', 'SUPPORTCLI', 'Contact client suivi incident', 1, NULL, 0),
(158, 'ticket', 'external', 'CONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(160, 'project', 'internal', 'PROJECTLEADER', 'Chef de Projet', 1, NULL, 0),
(161, 'project', 'internal', 'PROJECTCONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(170, 'project', 'external', 'PROJECTLEADER', 'Chef de Projet', 1, NULL, 0),
(171, 'project', 'external', 'PROJECTCONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(180, 'project_task', 'internal', 'TASKEXECUTIVE', 'Responsable', 1, NULL, 0),
(181, 'project_task', 'internal', 'TASKCONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(190, 'project_task', 'external', 'TASKEXECUTIVE', 'Responsable', 1, NULL, 0),
(191, 'project_task', 'external', 'TASKCONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(210, 'conferenceorbooth', 'internal', 'MANAGER', 'Conference or Booth manager', 1, NULL, 0),
(211, 'conferenceorbooth', 'external', 'SPEAKER', 'Conference Speaker', 1, NULL, 0),
(212, 'conferenceorbooth', 'external', 'RESPONSIBLE', 'Booth responsible', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_type_container`
--

CREATE TABLE `erp_c_type_container` (
  `rowid` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_type_container`
--

INSERT INTO `erp_c_type_container` (`rowid`, `code`, `entity`, `label`, `module`, `active`) VALUES
(1, 'page', 1, 'Page', 'system', 1),
(2, 'banner', 1, 'Banner', 'system', 1),
(3, 'blogpost', 1, 'BlogPost', 'system', 1),
(4, 'menu', 1, 'Menu', 'system', 1),
(5, 'other', 1, 'Other', 'system', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_type_fees`
--

CREATE TABLE `erp_c_type_fees` (
  `id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT 0,
  `accountancy_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_type_fees`
--

INSERT INTO `erp_c_type_fees` (`id`, `code`, `label`, `type`, `accountancy_code`, `active`, `module`, `position`) VALUES
(1, 'TF_OTHER', 'Other', 0, NULL, 1, NULL, 0),
(2, 'TF_TRIP', 'Transportation', 0, NULL, 1, NULL, 0),
(3, 'TF_LUNCH', 'Lunch', 0, NULL, 1, NULL, 0),
(4, 'EX_KME', 'ExpLabelKm', 0, NULL, 1, NULL, 0),
(5, 'EX_FUE', 'ExpLabelFuelCV', 0, NULL, 0, NULL, 0),
(6, 'EX_HOT', 'ExpLabelHotel', 0, NULL, 0, NULL, 0),
(7, 'EX_PAR', 'ExpLabelParkingCV', 0, NULL, 0, NULL, 0),
(8, 'EX_TOL', 'ExpLabelTollCV', 0, NULL, 0, NULL, 0),
(9, 'EX_TAX', 'ExpLabelVariousTaxes', 0, NULL, 0, NULL, 0),
(10, 'EX_IND', 'ExpLabelIndemnityTransSubscrip', 0, NULL, 0, NULL, 0),
(11, 'EX_SUM', 'ExpLabelMaintenanceSupply', 0, NULL, 0, NULL, 0),
(12, 'EX_SUO', 'ExpLabelOfficeSupplies', 0, NULL, 0, NULL, 0),
(13, 'EX_CAR', 'ExpLabelCarRental', 0, NULL, 0, NULL, 0),
(14, 'EX_DOC', 'ExpLabelDocumentation', 0, NULL, 0, NULL, 0),
(15, 'EX_CUR', 'ExpLabelCustomersReceiving', 0, NULL, 0, NULL, 0),
(16, 'EX_OTR', 'ExpLabelOtherReceiving', 0, NULL, 0, NULL, 0),
(17, 'EX_POS', 'ExpLabelPostage', 0, NULL, 0, NULL, 0),
(18, 'EX_CAM', 'ExpLabelMaintenanceRepairCV', 0, NULL, 0, NULL, 0),
(19, 'EX_EMM', 'ExpLabelEmployeesMeal', 0, NULL, 0, NULL, 0),
(20, 'EX_GUM', 'ExpLabelGuestsMeal', 0, NULL, 0, NULL, 0),
(21, 'EX_BRE', 'ExpLabelBreakfast', 0, NULL, 0, NULL, 0),
(22, 'EX_FUE_VP', 'ExpLabelFuelPV', 0, NULL, 0, NULL, 0),
(23, 'EX_TOL_VP', 'ExpLabelTollPV', 0, NULL, 0, NULL, 0),
(24, 'EX_PAR_VP', 'ExpLabelParkingPV', 0, NULL, 0, NULL, 0),
(25, 'EX_CAM_VP', 'ExpLabelMaintenanceRepairPV', 0, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_type_resource`
--

CREATE TABLE `erp_c_type_resource` (
  `rowid` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_type_resource`
--

INSERT INTO `erp_c_type_resource` (`rowid`, `code`, `label`, `active`) VALUES
(1, 'RES_ROOMS', 'Rooms', 1),
(2, 'RES_CARS', 'Cars', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_units`
--

CREATE TABLE `erp_c_units` (
  `rowid` int(11) NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_label` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_c_units`
--

INSERT INTO `erp_c_units` (`rowid`, `code`, `sortorder`, `scale`, `label`, `short_label`, `unit_type`, `active`) VALUES
(1, 'T', 100, 3, 'WeightUnitton', 'T', 'weight', 1),
(2, 'KG', 110, 0, 'WeightUnitkg', 'kg', 'weight', 1),
(3, 'G', 120, -3, 'WeightUnitg', 'g', 'weight', 1),
(4, 'MG', 130, -6, 'WeightUnitmg', 'mg', 'weight', 1),
(5, 'OZ', 140, 98, 'WeightUnitounce', 'Oz', 'weight', 1),
(6, 'LB', 150, 99, 'WeightUnitpound', 'lb', 'weight', 1),
(7, 'M', 200, 0, 'SizeUnitm', 'm', 'size', 1),
(8, 'DM', 210, -1, 'SizeUnitdm', 'dm', 'size', 1),
(9, 'CM', 220, -2, 'SizeUnitcm', 'cm', 'size', 1),
(10, 'MM', 230, -3, 'SizeUnitmm', 'mm', 'size', 1),
(11, 'FT', 240, 98, 'SizeUnitfoot', 'ft', 'size', 1),
(12, 'IN', 250, 99, 'SizeUnitinch', 'in', 'size', 1),
(13, 'M2', 300, 0, 'SurfaceUnitm2', 'm2', 'surface', 1),
(14, 'DM2', 310, -2, 'SurfaceUnitdm2', 'dm2', 'surface', 1),
(15, 'CM2', 320, -4, 'SurfaceUnitcm2', 'cm2', 'surface', 1),
(16, 'MM2', 330, -6, 'SurfaceUnitmm2', 'mm2', 'surface', 1),
(17, 'FT2', 340, 98, 'SurfaceUnitfoot2', 'ft2', 'surface', 1),
(18, 'IN2', 350, 99, 'SurfaceUnitinch2', 'in2', 'surface', 1),
(19, 'M3', 400, 0, 'VolumeUnitm3', 'm3', 'volume', 1),
(20, 'DM3', 410, -3, 'VolumeUnitdm3', 'dm3', 'volume', 1),
(21, 'CM3', 420, -6, 'VolumeUnitcm3', 'cm3', 'volume', 1),
(22, 'MM3', 430, -9, 'VolumeUnitmm3', 'mm3', 'volume', 1),
(23, 'FT3', 440, 88, 'VolumeUnitfoot3', 'ft3', 'volume', 1),
(24, 'IN3', 450, 89, 'VolumeUnitinch3', 'in3', 'volume', 1),
(25, 'OZ3', 460, 97, 'VolumeUnitounce', 'Oz', 'volume', 1),
(26, 'L', 470, 98, 'VolumeUnitlitre', 'L', 'volume', 1),
(27, 'GAL', 480, 99, 'VolumeUnitgallon', 'gal', 'volume', 1),
(28, 'P', 500, 0, 'Piece', 'p', 'qty', 1),
(29, 'SET', 510, 0, 'Set', 'set', 'qty', 1),
(30, 'S', 600, 0, 'second', 's', 'time', 1),
(31, 'MI', 610, 60, 'minute', 'i', 'time', 1),
(32, 'H', 620, 3600, 'hour', 'h', 'time', 1),
(33, 'D', 630, 86400, 'day', 'd', 'time', 1),
(34, 'W', 640, 604800, 'week', 'w', 'time', 1),
(35, 'MO', 650, 2629800, 'month', 'm', 'time', 1),
(36, 'Y', 660, 31557600, 'year', 'y', 'time', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_c_ziptown`
--

CREATE TABLE `erp_c_ziptown` (
  `rowid` int(11) NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_county` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT 0,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_default_values`
--

CREATE TABLE `erp_default_values` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `param` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_delivery`
--

CREATE TABLE `erp_delivery` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_deliverydet`
--

CREATE TABLE `erp_deliverydet` (
  `rowid` int(11) NOT NULL,
  `fk_delivery` int(11) DEFAULT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_deliverydet_extrafields`
--

CREATE TABLE `erp_deliverydet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_delivery_extrafields`
--

CREATE TABLE `erp_delivery_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_deplacement`
--

CREATE TABLE `erp_deplacement` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dated` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT 1,
  `km` double DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_document_model`
--

CREATE TABLE `erp_document_model` (
  `rowid` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_document_model`
--

INSERT INTO `erp_document_model` (`rowid`, `nom`, `entity`, `type`, `libelle`, `description`) VALUES
(1, 'standard', 1, 'expensereport', NULL, NULL),
(2, 'standard', 1, 'member', NULL, NULL),
(3, 'standard_recruitmentjobposition', 1, 'recruitmentjobposition', NULL, NULL),
(4, 'generic_recruitmentjobposition_odt', 1, 'recruitmentjobposition', NULL, NULL),
(5, 'einstein', 1, 'order', NULL, NULL),
(6, 'soleil', 1, 'ficheinter', NULL, NULL),
(7, 'azur', 1, 'propal', NULL, NULL),
(8, 'rouget', 1, 'shipping', NULL, NULL),
(9, 'typhon', 1, 'delivery', NULL, NULL),
(10, 'strato', 1, 'contract', NULL, NULL),
(11, 'muscadet', 1, 'order_supplier', NULL, NULL),
(12, 'aurore', 1, 'supplier_proposal', NULL, NULL),
(13, 'crabe', 1, 'invoice', NULL, NULL),
(14, 'sepamandate', 1, 'bankaccount', NULL, NULL),
(15, 'standard', 1, 'stock', NULL, NULL),
(16, 'stdmovement', 1, 'mouvement', NULL, NULL),
(21, 'TICKET_ADDON_PDF_ODT_PATH', 1, 'ticket', NULL, NULL),
(22, '', 1, 'task', NULL, NULL),
(23, 'beluga', 1, 'project', NULL, NULL),
(24, 'baleine', 1, 'project', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_don`
--

CREATE TABLE `erp_don` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `datedon` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_payment` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `societe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_country` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` smallint(6) NOT NULL DEFAULT 1,
  `fk_projet` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_don_extrafields`
--

CREATE TABLE `erp_don_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_ecm_directories`
--

CREATE TABLE `erp_ecm_directories` (
  `rowid` int(11) NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cachenbofdoc` int(11) NOT NULL DEFAULT 0,
  `fullpath` varchar(750) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acl` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_ecm_directories_extrafields`
--

CREATE TABLE `erp_ecm_directories_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_ecm_files`
--

CREATE TABLE `erp_ecm_files` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `share` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `filepath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_object_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `src_object_id` int(11) DEFAULT NULL,
  `fullpath_orig` varchar(750) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(750) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `gen_or_uploaded` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acl` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_ecm_files`
--

INSERT INTO `erp_ecm_files` (`rowid`, `ref`, `label`, `share`, `entity`, `filepath`, `filename`, `src_object_type`, `src_object_id`, `fullpath_orig`, `description`, `keywords`, `cover`, `position`, `gen_or_uploaded`, `extraparams`, `date_c`, `tms`, `fk_user_c`, `fk_user_m`, `note_private`, `note_public`, `acl`) VALUES
(1, 'be8c56bda452365c8b976b4af58111cc', '7501e712a8b6af1781fc7811fe9d9948', NULL, 1, 'commande/CO2111-0001', 'CO2111-0001.pdf', 'commande', 1, '', '', '', NULL, 1, 'generated', NULL, '2021-11-09 09:59:20', '2021-11-12 07:35:10', 1, 1, NULL, NULL, NULL),
(2, '9844cd3c4f25c712985fe82b46000fe8', '56f695200c8aaca33c67ba6128a16b6e', NULL, 1, 'commande/(PROV2)', '(PROV2).pdf', 'commande', 2, '', '', '', NULL, 1, 'generated', NULL, '2021-11-11 04:44:33', '2021-11-10 20:44:33', 1, NULL, NULL, NULL, NULL),
(3, '9ef19716838e808ced9796bf3da48c31', '5bc464548a1bff3369ba6a68eab6e78d', NULL, 1, 'commande/(PROV3)', '(PROV3).pdf', 'commande', 3, '', '', '', NULL, 1, 'generated', NULL, '2021-11-11 04:47:29', '2021-11-10 20:47:29', 1, NULL, NULL, NULL, NULL),
(4, '3b3a346f1d70856351dfe247f57e535f', '23ab5ba520048f2f124be55af1aab21f', NULL, 1, 'facture/TC1-2111-0001', 'TC1-2111-0001.pdf', 'facture', 6, '', '', '', NULL, 1, 'generated', NULL, '2021-11-11 06:30:10', '2021-11-10 22:30:10', 1, NULL, NULL, NULL, NULL),
(5, '5457f423908b18a01d71d456208b875d', 'f3accef6d1be49c897a7a3ee0ed98a06', NULL, 1, 'commande/CO2111-0002', 'CO2111-0002.pdf', 'commande', 4, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 07:23:19', '2021-11-12 07:27:06', 1, 1, NULL, NULL, NULL),
(6, '31894e543d2b95aa48fba73b99b525a3', 'e6cb76cf203f3b86905301a2ebab5c15', NULL, 1, 'facture/FA2111-0001', 'FA2111-0001.pdf', 'facture', 7, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 07:28:29', '2021-11-12 07:29:50', 1, 1, NULL, NULL, NULL),
(7, 'e8fe79450a9a743719313344ab26f397', '79f6dcf798f379b61689cdd3588cf942', NULL, 1, 'facture/FA2111-0002', 'FA2111-0002.pdf', 'facture', 8, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 07:34:12', '2021-11-12 09:26:58', 1, 1, NULL, NULL, NULL),
(8, '6b10ce841eb33141295f7367ad8451ca', '8e0288da7ed442639a6ddd43c8efbcb0', NULL, 1, 'commande/CO2111-0003', 'CO2111-0003.pdf', 'commande', 5, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 09:20:32', '2021-11-12 09:23:09', 1, 1, NULL, NULL, NULL),
(9, '59253325a83cc063e7017d020c0795ae', 'ddf57a91e78e7c419c477a91466a3a2a', NULL, 1, 'facture/FA2111-0003', 'FA2111-0003.pdf', 'facture', 11, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 09:25:10', '2021-11-12 09:26:58', 1, 1, NULL, NULL, NULL),
(10, 'd79624fc2c1d65f5218ebe1de20f5253', '26dfa5a46e0a1ade57204d3131e8ae9e', NULL, 1, 'facture/AV2111-0001', 'AV2111-0001.pdf', 'facture', 12, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 09:29:09', '2021-11-12 01:29:09', 1, NULL, NULL, NULL, NULL),
(11, '4769ad8146ecab84b62f45995f540497', '181ff4408001ede96995939749c4bcd8', NULL, 1, 'facture/FA2111-0004', 'FA2111-0004.pdf', 'facture', 13, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 09:33:01', '2021-11-12 09:33:36', 1, 1, NULL, NULL, NULL),
(12, '57e487001050749e243378116cf8ac33', '6dfc4cc4c140e1489dc3c065ea2baca5', NULL, 1, 'bom/BOM2111-0001', 'BOM2111-0001_bom.odt', 'bom_bom', 1, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 09:37:59', '2021-12-12 12:55:41', 1, 1, NULL, NULL, NULL),
(13, '3694d619d2a7ccd70935a886a81b0fad', '42eeb3e7947f0fd8d5d0e7760b66b0f1', NULL, 1, 'fournisseur/commande/PO2111-0001', 'PO2111-0001.pdf', 'commande_fournisseur', 1, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 09:42:22', '2021-11-12 09:43:29', 1, 1, NULL, NULL, NULL),
(14, 'c7c83487d8f6b0d24dc4d4f944ea86ec', 'e27b0072a89a165bdd3e79c149703c28', NULL, 1, 'commande/CO2111-0004', 'CO2111-0004.pdf', 'commande', 6, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 09:45:04', '2021-11-12 09:45:08', 1, 1, NULL, NULL, NULL),
(15, 'aff5c1541f29792362960b6abb5976e1', '327e87ca0df28077a0428e88c6a40fc6', NULL, 1, 'expedition/sending/(PROV1)', '(PROV1).pdf', 'expedition', 1, '', '', '', NULL, 1, 'generated', NULL, '2021-11-12 09:45:43', '2021-11-12 01:45:43', 1, NULL, NULL, NULL, NULL),
(16, '6446da314805e1c06fe833a189220778', '33734e455549abcfdc11fd1c724994c8', NULL, 1, 'ficheinter/FI2111-0001', 'FI2111-0001.pdf', NULL, NULL, '/home/aioswcom/public_html/user5/erp_crm/documents/ficheinter/(PROV1)/(PROV1).pdf', '', '', NULL, 1, 'unknown', NULL, '2021-11-12 09:50:14', '2021-11-12 09:50:20', 1, NULL, NULL, NULL, NULL),
(17, '2bb77b95fd4e5b94b21cfe886c4207d8', '666c8e2795cabebdfa795287dd32628a', NULL, 1, 'fournisseur/commande/PO2111-0002', 'PO2111-0002.pdf', 'commande_fournisseur', 3, '', '', '', NULL, 1, 'generated', NULL, '2021-11-22 08:41:36', '2021-11-22 08:41:48', 1, 1, NULL, NULL, NULL),
(18, '6a1ab1f91c1c670ffe15cb835b426049', '9a50957781854be75380e766ab946d25', NULL, 1, 'bom/BOM2112-0002', 'BOM2112-0002_bom.odt', 'bom_bom', 2, '', '', '', NULL, 1, 'generated', NULL, '2021-12-08 11:52:34', '2021-12-08 03:52:34', 1, NULL, NULL, NULL, NULL),
(19, '542e1cc6f8d00329e495b1b4a0ba30c1', 'd0487a3a2beb8a455b26586a4b4ebc2e', NULL, 1, 'facture/TC1-2112-0002', 'TC1-2112-0002.pdf', 'facture', 16, '', '', '', NULL, 1, 'generated', NULL, '2021-12-08 13:23:44', '2021-12-08 05:23:44', 1, NULL, NULL, NULL, NULL),
(20, '30d469bb0130d77bcf8ac0f2fb6bd995', '22929a7f5986d133dbeb14fd6a2d60c4', NULL, 1, 'facture/TC1-2112-0003', 'TC1-2112-0003.pdf', 'facture', 27, '', '', '', NULL, 1, 'generated', NULL, '2021-12-09 06:56:41', '2021-12-08 22:56:41', 1, NULL, NULL, NULL, NULL),
(21, 'c80029e9a311f3714e7013a47bbcfa71', '7fb977a5aeab5cce57e9ae65c228cfc1', NULL, 1, 'fournisseur/commande/(PROV4)', '(PROV4).pdf', 'commande_fournisseur', 4, '', '', '', NULL, 1, 'generated', NULL, '2021-12-10 14:52:20', '2021-12-10 14:55:09', 1, 1, NULL, NULL, NULL),
(22, '2bdb5a6e8c6f3bdd503a54e2676b7097', '2855dab2c65bfec25623530b64483281', NULL, 1, 'fournisseur/commande/(PROV5)', '(PROV5).pdf', 'commande_fournisseur', 5, '', '', '', NULL, 1, 'generated', NULL, '2021-12-12 12:39:59', '2021-12-12 04:39:59', 1, NULL, NULL, NULL, NULL),
(23, '109ae185f2524a246eccb8bdf91a6078', '42614c3d5debccb8595faa5f031b2a90', NULL, 1, 'propale/PR2112-0001', 'PR2112-0001.pdf', 'propal', 1, '', '', '', NULL, 1, 'generated', NULL, '2021-12-17 09:09:43', '2021-12-17 09:14:33', 1, 1, NULL, NULL, NULL),
(24, '47f0672c9ece47a688d617c5d491dd12', '18708e99949e53ab5e0dab721f937d26', NULL, 1, 'commande/CO2112-0005', 'CO2112-0005.pdf', 'commande', 9, '', '', '', NULL, 1, 'generated', NULL, '2021-12-17 09:10:31', '2021-12-17 09:13:31', 1, 1, NULL, NULL, NULL),
(25, '0deca073044c8a9ba97ade808744a144', 'c1ca68404f262d975877b2b11140d7f8', NULL, 1, 'commande/CO2112-0006', 'CO2112-0006.pdf', 'commande', 11, '', '', '', NULL, 1, 'generated', NULL, '2021-12-17 09:18:37', '2021-12-17 09:18:42', 1, 1, NULL, NULL, NULL),
(26, 'a03b364aa80007765f1c19673c45cbd5', '1aa415d703950e3f1adc59c1e10e3add', NULL, 1, 'commande/CO2112-0007', 'CO2112-0007.pdf', 'commande', 12, '', '', '', NULL, 1, 'generated', NULL, '2021-12-17 09:38:36', '2021-12-17 09:41:00', 1, 1, NULL, NULL, NULL),
(27, 'fcdad35b9566b655ed8de28210296692', 'd2ab3c6cff0cdff0e93ac410512eb058', NULL, 1, 'expedition/sending/SH2112-0001', 'SH2112-0001.pdf', 'expedition', 2, '', '', '', NULL, 1, 'generated', NULL, '2021-12-17 09:41:39', '2021-12-17 01:41:39', 1, NULL, NULL, NULL, NULL),
(28, '586aabc3ae6d8999a99b8b5601bb3c22', 'd6cdd92ffb40553909a0b06a15d7777d', NULL, 1, 'facture/FA2112-0005', 'FA2112-0005.pdf', 'facture', 34, '', '', '', NULL, 1, 'generated', NULL, '2021-12-17 09:42:34', '2021-12-17 01:42:34', 1, NULL, NULL, NULL, NULL),
(29, '6e02b41d8a5ee9c71dae5ed4d726d44c', 'e45b8384913b67b2f4ca83db3d90c823', NULL, 1, 'commande/CO2112-0008', 'CO2112-0008.pdf', 'commande', 13, '', '', '', NULL, 1, 'generated', NULL, '2021-12-17 09:43:50', '2021-12-17 09:43:55', 1, 1, NULL, NULL, NULL),
(30, '3a42fe272e4cd9ddae01667fa70d6ecd', '6ee51b4dc25e6b2e0197b8e2a2daba2f', NULL, 1, 'facture/FA2112-0006', 'FA2112-0006.pdf', 'facture', 35, '', '', '', NULL, 1, 'generated', NULL, '2021-12-17 09:44:20', '2021-12-17 09:48:25', 1, 1, NULL, NULL, NULL),
(31, '4e8937f40e8cace0a3dfe66c8d9ced1c', 'd7b4769d21eb27db43afbd03c8d42752', NULL, 1, 'expedition/sending/SH2112-0002', 'SH2112-0002.pdf', 'expedition', 3, '', '', '', NULL, 1, 'generated', NULL, '2021-12-17 09:45:44', '2021-12-17 09:46:21', 1, 1, NULL, NULL, NULL),
(32, 'dba31c08b2074f0d3fa9d9ab04454dfb', 'fa68fbf802011aaf2e3c243759ce7d32', NULL, 1, 'facture/FA2112-0007', 'FA2112-0007.pdf', 'facture', 36, '', '', '', NULL, 1, 'generated', NULL, '2021-12-17 09:47:00', '2021-12-17 09:49:07', 1, 1, NULL, NULL, NULL),
(33, '5dfa2f0ac9e15fbf887d216873a4b538', '3ca0474956bb09cb13071a9fd8a562d0', NULL, 1, 'contract/CT2112-0001', 'CT2112-0001.pdf', 'contrat', 1, '', '', '', NULL, 1, 'generated', NULL, '2021-12-19 13:27:52', '2021-12-19 13:28:37', 1, 1, NULL, NULL, NULL),
(34, 'eebe8cf2b9950027babc478f81d0cc47', '6da777e5d25b88401ead8c7c82dfcc11', NULL, 1, 'commande/CO2112-0009', 'CO2112-0009.pdf', 'commande', 10, '', '', '', NULL, 1, 'generated', NULL, '2021-12-19 13:35:01', '2021-12-19 13:39:06', 1, 1, NULL, NULL, NULL),
(35, '7d9edce98e59063ca791c22729448a99', '282b5675be0522c9fbca649a889c80c8', NULL, 1, 'facture/FA2112-0008', 'FA2112-0008.pdf', 'facture', 38, '', '', '', NULL, 1, 'generated', NULL, '2021-12-19 13:40:25', '2021-12-19 05:40:25', 1, NULL, NULL, NULL, NULL),
(36, 'e02c5c64851f97783194b02039c60bc9', '496e1d04c45c5ad7f7ad84b9773a7488', NULL, 1, 'commande/CO2112-0010', 'CO2112-0010.pdf', 'commande', 14, '', '', '', NULL, 1, 'generated', NULL, '2021-12-19 13:43:11', '2021-12-19 13:45:28', 1, 1, NULL, NULL, NULL),
(37, '5218526c63cf050043452d0178cdc22f', '89f60bf715c928616f602c727dafbcb7', NULL, 1, 'facture/AC2112-0001', 'AC2112-0001.pdf', 'facture', 39, '', '', '', NULL, 1, 'generated', NULL, '2021-12-19 13:43:39', '2021-12-19 13:50:23', 1, 1, NULL, NULL, NULL),
(38, '48f6be00e564c031737f686db34d3357', 'fd0f292cc2780072c2c26d175c148e1d', NULL, 1, 'expedition/sending/SH2112-0003', 'SH2112-0003.pdf', 'expedition', 4, '', '', '', NULL, 1, 'generated', NULL, '2021-12-19 13:49:55', '2021-12-19 05:49:55', 1, NULL, NULL, NULL, NULL),
(39, '87efc43c9dec62a0a9f5917098cc7663', '47902774f5ebe9aac5522cf2041121d2', NULL, 1, 'facture/FA2112-0009', 'FA2112-0009.pdf', 'facture', 40, '', '', '', NULL, 1, 'generated', NULL, '2021-12-19 13:50:08', '2021-12-19 05:50:08', 1, NULL, NULL, NULL, NULL),
(40, '723f69c919dcbdb40fb4e4ea5446bd64', '6bb554f492d03289fd77eafc3809859c', NULL, 1, 'projet/PJ2112-0001', 'PJ2112-0001.pdf', 'projet', 1, '', '', '', NULL, 1, 'generated', NULL, '2021-12-20 07:16:23', '2021-12-20 00:16:23', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_ecm_files_extrafields`
--

CREATE TABLE `erp_ecm_files_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_element_contact`
--

CREATE TABLE `erp_element_contact` (
  `rowid` int(11) NOT NULL,
  `datecreate` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT 5,
  `element_id` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_element_contact`
--

INSERT INTO `erp_element_contact` (`rowid`, `datecreate`, `statut`, `element_id`, `fk_c_type_contact`, `fk_socpeople`) VALUES
(1, '2021-12-13 14:21:56', 4, 1, 160, 1),
(2, '2021-12-13 14:23:47', 4, 1, 180, 1),
(3, '2021-12-13 14:26:24', 4, 2, 160, 1),
(4, '2021-12-17 09:38:30', 4, 12, 101, 9),
(5, '2021-12-17 09:40:37', 4, 12, 102, 9),
(6, '2021-12-17 09:42:26', 4, 34, 61, 9),
(7, '2021-12-17 09:43:13', 4, 34, 60, 9),
(8, '2021-12-19 13:27:30', 4, 1, 10, 1),
(9, '2021-12-19 13:27:30', 4, 1, 11, 1),
(10, '2021-12-19 13:29:05', 4, 37, 50, 1),
(11, '2021-12-19 13:43:06', 4, 14, 101, 3);

-- --------------------------------------------------------

--
-- Table structure for table `erp_element_element`
--

CREATE TABLE `erp_element_element` (
  `rowid` int(11) NOT NULL,
  `fk_source` int(11) NOT NULL,
  `sourcetype` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_element_element`
--

INSERT INTO `erp_element_element` (`rowid`, `fk_source`, `sourcetype`, `fk_target`, `targettype`) VALUES
(1, 1, 'commande', 1, 'facture'),
(3, 1, 'commande', 9, 'facture'),
(17, 1, 'contrat', 37, 'facture'),
(16, 1, 'propal', 1, 'contrat'),
(19, 1, 'propal', 10, 'commande'),
(10, 2, 'shipping', 34, 'facture'),
(7, 3, 'order_supplier', 1, 'invoice_supplier'),
(14, 3, 'shipping', 36, 'facture'),
(2, 4, 'commande', 7, 'facture'),
(22, 4, 'shipping', 40, 'facture'),
(4, 5, 'commande', 11, 'facture'),
(5, 5, 'commande', 12, 'facture'),
(6, 6, 'commande', 1, 'shipping'),
(18, 10, 'commande', 38, 'facture'),
(9, 12, 'commande', 2, 'shipping'),
(11, 12, 'commande', 34, 'facture'),
(13, 13, 'commande', 3, 'shipping'),
(12, 13, 'commande', 35, 'facture'),
(15, 13, 'commande', 36, 'facture'),
(21, 14, 'commande', 4, 'shipping'),
(20, 14, 'commande', 39, 'facture'),
(23, 14, 'commande', 40, 'facture');

-- --------------------------------------------------------

--
-- Table structure for table `erp_element_resources`
--

CREATE TABLE `erp_element_resources` (
  `rowid` int(11) NOT NULL,
  `element_id` int(11) DEFAULT NULL,
  `element_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `busy` int(11) DEFAULT NULL,
  `mandatory` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_element_tag`
--

CREATE TABLE `erp_element_tag` (
  `rowid` int(11) NOT NULL,
  `fk_categorie` int(11) NOT NULL,
  `fk_element` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_emailcollector_emailcollector`
--

CREATE TABLE `erp_emailcollector_emailcollector` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostcharset` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'UTF-8',
  `login` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_directory` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_directory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maxemailpercollect` int(11) DEFAULT 100,
  `datelastresult` datetime DEFAULT NULL,
  `codelastresult` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastresult` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datelastok` datetime DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_emailcollector_emailcollectoraction`
--

CREATE TABLE `erp_emailcollector_emailcollectoraction` (
  `rowid` int(11) NOT NULL,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionparam` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_emailcollector_emailcollectorfilter`
--

CREATE TABLE `erp_emailcollector_emailcollectorfilter` (
  `rowid` int(11) NOT NULL,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rulevalue` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_entrepot`
--

CREATE TABLE `erp_entrepot` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_project` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lieu` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 1,
  `fk_user_author` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_parent` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_entrepot`
--

INSERT INTO `erp_entrepot` (`rowid`, `ref`, `datec`, `tms`, `entity`, `fk_project`, `description`, `lieu`, `address`, `zip`, `town`, `fk_departement`, `fk_pays`, `phone`, `fax`, `statut`, `fk_user_author`, `model_pdf`, `import_key`, `fk_parent`) VALUES
(1, '2021', '2021-11-09 09:36:09', '2021-11-09 09:36:09', 1, NULL, '', 'Bona Warehouse', '', '', '', NULL, 29, '', '', 1, 1, NULL, NULL, NULL),
(2, 'WH1', '2021-12-12 12:41:36', '2021-12-12 12:41:36', 1, NULL, '', 'Warehouse 1', '', '', '', NULL, 29, '', '', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_entrepot_extrafields`
--

CREATE TABLE `erp_entrepot_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_establishment`
--

CREATE TABLE `erp_establishment` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_state` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT 0,
  `profid1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profid2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profid3` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_eventorganization_conferenceorboothattendee`
--

CREATE TABLE `erp_eventorganization_conferenceorboothattendee` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_actioncomm` int(11) DEFAULT NULL,
  `fk_project` int(11) NOT NULL,
  `fk_invoice` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_subscription` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_eventorganization_conferenceorboothattendee_extrafields`
--

CREATE TABLE `erp_eventorganization_conferenceorboothattendee_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_events`
--

CREATE TABLE `erp_events` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `prefix_session` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateevent` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `authentication_method` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_oauth_token` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_event_element`
--

CREATE TABLE `erp_event_element` (
  `rowid` int(11) NOT NULL,
  `fk_source` int(11) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_expedition`
--

CREATE TABLE `erp_expedition` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_expedition` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_expedition`
--

INSERT INTO `erp_expedition` (`rowid`, `tms`, `ref`, `entity`, `fk_soc`, `fk_projet`, `ref_ext`, `ref_int`, `ref_customer`, `date_creation`, `fk_user_author`, `fk_user_modif`, `date_valid`, `fk_user_valid`, `date_delivery`, `date_expedition`, `fk_address`, `fk_shipping_method`, `tracking_number`, `fk_statut`, `billed`, `height`, `width`, `size_units`, `size`, `weight_units`, `weight`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `fk_incoterms`, `location_incoterms`, `import_key`, `extraparams`) VALUES
(1, '2021-11-12 09:45:43', '(PROV1)', 1, 1, NULL, NULL, NULL, NULL, '2021-11-12 09:45:38', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, 0, NULL, NULL, 0, NULL, 3, NULL, NULL, NULL, 'rouget', 'expedition/sending/(PROV1)/(PROV1).pdf', 5, '200021', NULL, NULL),
(2, '2021-12-17 09:42:05', 'SH2112-0001', 1, 3, NULL, NULL, NULL, NULL, '2021-12-17 09:41:33', 1, NULL, '2021-12-17 09:41:39', 1, NULL, NULL, NULL, NULL, '', 2, 0, NULL, NULL, 0, NULL, 3, NULL, NULL, NULL, NULL, 'expedition/sending/SH2112-0001/SH2112-0001.pdf', 0, '', NULL, NULL),
(3, '2021-12-17 09:49:59', 'SH2112-0002', 1, 3, NULL, NULL, NULL, NULL, '2021-12-17 09:45:38', 1, NULL, '2021-12-17 09:45:44', 1, NULL, NULL, NULL, NULL, '', 2, 0, NULL, NULL, 0, NULL, 3, NULL, NULL, NULL, NULL, 'expedition/sending/SH2112-0002/SH2112-0002.pdf', 0, '', NULL, NULL),
(4, '2021-12-19 13:49:55', 'SH2112-0003', 1, 6, NULL, NULL, NULL, NULL, '2021-12-19 13:49:09', 1, NULL, '2021-12-19 13:49:55', 1, NULL, NULL, NULL, NULL, '', 1, 0, NULL, NULL, 0, NULL, 3, NULL, NULL, NULL, NULL, 'expedition/sending/SH2112-0003/SH2112-0003.pdf', 0, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_expeditiondet`
--

CREATE TABLE `erp_expeditiondet` (
  `rowid` int(11) NOT NULL,
  `fk_expedition` int(11) NOT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_expeditiondet`
--

INSERT INTO `erp_expeditiondet` (`rowid`, `fk_expedition`, `fk_origin_line`, `fk_entrepot`, `qty`, `rang`) VALUES
(1, 1, 8, 1, 1, 0),
(2, 2, 12, 1, 1, 1),
(3, 3, 13, 1, 1, 0),
(4, 4, 16, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_expeditiondet_batch`
--

CREATE TABLE `erp_expeditiondet_batch` (
  `rowid` int(11) NOT NULL,
  `fk_expeditiondet` int(11) NOT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `fk_origin_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_expeditiondet_batch`
--

INSERT INTO `erp_expeditiondet_batch` (`rowid`, `fk_expeditiondet`, `eatby`, `sellby`, `batch`, `qty`, `fk_origin_stock`) VALUES
(1, 1, NULL, NULL, 'Lot Test 02', 1, 1),
(2, 3, NULL, NULL, '456', 1, 3),
(3, 4, NULL, NULL, '123', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `erp_expeditiondet_extrafields`
--

CREATE TABLE `erp_expeditiondet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_expedition_extrafields`
--

CREATE TABLE `erp_expedition_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_expedition_package`
--

CREATE TABLE `erp_expedition_package` (
  `rowid` int(11) NOT NULL,
  `fk_expedition` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(24,8) DEFAULT 0.00000000,
  `fk_package_type` int(11) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `dangerous_goods` smallint(6) DEFAULT 0,
  `tail_lift` smallint(6) DEFAULT 0,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_expensereport`
--

CREATE TABLE `erp_expensereport` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_number_int` int(11) DEFAULT NULL,
  `ref_ext` int(11) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_create` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_validator` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL,
  `fk_c_paiement` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_refuse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_cancel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integration_compta` int(11) DEFAULT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `model_pdf` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_expensereport_det`
--

CREATE TABLE `erp_expensereport_det` (
  `rowid` int(11) NOT NULL,
  `fk_expensereport` int(11) NOT NULL,
  `docnumber` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `fk_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` int(11) DEFAULT -1,
  `qty` double NOT NULL,
  `subprice` double(24,8) NOT NULL DEFAULT 0.00000000,
  `value_unit` double(24,8) NOT NULL,
  `remise_percent` double DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_ht` double(24,8) NOT NULL DEFAULT 0.00000000,
  `total_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  `date` date NOT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_facture` int(11) DEFAULT 0,
  `fk_ecm_files` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule_warning_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_expensereport_extrafields`
--

CREATE TABLE `erp_expensereport_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_expensereport_ik`
--

CREATE TABLE `erp_expensereport_ik` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT 0,
  `fk_range` int(11) NOT NULL DEFAULT 0,
  `coef` double NOT NULL DEFAULT 0,
  `ikoffset` double NOT NULL DEFAULT 0,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_expensereport_ik`
--

INSERT INTO `erp_expensereport_ik` (`rowid`, `datec`, `tms`, `fk_c_exp_tax_cat`, `fk_range`, `coef`, `ikoffset`, `active`) VALUES
(1, NULL, '2021-11-09 04:36:56', 4, 1, 0.41, 0, 1),
(2, NULL, '2021-11-09 04:36:56', 4, 2, 0.244, 824, 1),
(3, NULL, '2021-11-09 04:36:56', 4, 3, 0.286, 0, 1),
(4, NULL, '2021-11-09 04:36:56', 5, 4, 0.493, 0, 1),
(5, NULL, '2021-11-09 04:36:56', 5, 5, 0.277, 1082, 1),
(6, NULL, '2021-11-09 04:36:56', 5, 6, 0.332, 0, 1),
(7, NULL, '2021-11-09 04:36:56', 6, 7, 0.543, 0, 1),
(8, NULL, '2021-11-09 04:36:56', 6, 8, 0.305, 1180, 1),
(9, NULL, '2021-11-09 04:36:56', 6, 9, 0.364, 0, 1),
(10, NULL, '2021-11-09 04:36:56', 7, 10, 0.568, 0, 1),
(11, NULL, '2021-11-09 04:36:56', 7, 11, 0.32, 1244, 1),
(12, NULL, '2021-11-09 04:36:56', 7, 12, 0.382, 0, 1),
(13, NULL, '2021-11-09 04:36:56', 8, 13, 0.595, 0, 1),
(14, NULL, '2021-11-09 04:36:56', 8, 14, 0.337, 1288, 1),
(15, NULL, '2021-11-09 04:36:56', 8, 15, 0.401, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_expensereport_rules`
--

CREATE TABLE `erp_expensereport_rules` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dates` datetime NOT NULL,
  `datee` datetime NOT NULL,
  `amount` double(24,8) NOT NULL,
  `restrictive` tinyint(4) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_usergroup` int(11) DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `code_expense_rules_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_for_all` tinyint(4) DEFAULT 0,
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_export_compta`
--

CREATE TABLE `erp_export_compta` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_export` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_export_model`
--

CREATE TABLE `erp_export_model` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 0,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `filter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_extrafields`
--

CREATE TABLE `erp_extrafields` (
  `rowid` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `elementtype` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldcomputed` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fielddefault` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldunique` int(11) DEFAULT 0,
  `fieldrequired` int(11) DEFAULT 0,
  `perms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(11) DEFAULT 0,
  `alwayseditable` int(11) DEFAULT 0,
  `param` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `printable` int(11) DEFAULT 0,
  `totalizable` tinyint(1) DEFAULT 0,
  `langs` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_facture`
--

CREATE TABLE `erp_facture` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_closing` datetime DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `close_code` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close_note` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_closing` int(11) DEFAULT NULL,
  `module_source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_fac_rec_source` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `increment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT 1,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_transport_mode` int(11) DEFAULT NULL,
  `situation_cycle_ref` smallint(6) DEFAULT NULL,
  `situation_counter` smallint(6) DEFAULT NULL,
  `situation_final` smallint(6) DEFAULT NULL,
  `retained_warranty` double DEFAULT NULL,
  `retained_warranty_date_limit` date DEFAULT NULL,
  `retained_warranty_fk_cond_reglement` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_facture`
--

INSERT INTO `erp_facture` (`rowid`, `ref`, `entity`, `ref_ext`, `ref_int`, `ref_client`, `type`, `fk_soc`, `datec`, `datef`, `date_pointoftax`, `date_valid`, `tms`, `date_closing`, `paye`, `remise_percent`, `remise_absolue`, `remise`, `close_code`, `close_note`, `total_tva`, `localtax1`, `localtax2`, `revenuestamp`, `total_ht`, `total_ttc`, `fk_statut`, `fk_user_author`, `fk_user_modif`, `fk_user_valid`, `fk_user_closing`, `module_source`, `pos_source`, `fk_fac_rec_source`, `fk_facture_source`, `fk_projet`, `increment`, `fk_account`, `fk_currency`, `fk_cond_reglement`, `fk_mode_reglement`, `date_lim_reglement`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `fk_incoterms`, `location_incoterms`, `fk_transport_mode`, `situation_cycle_ref`, `situation_counter`, `situation_final`, `retained_warranty`, `retained_warranty_date_limit`, `retained_warranty_fk_cond_reglement`, `import_key`, `extraparams`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES
(1, '(PROV1)', 1, NULL, NULL, NULL, 0, 1, '2021-11-09 10:01:22', '2021-11-09', NULL, NULL, '2021-11-09 10:01:22', NULL, 0, NULL, NULL, 0, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 26.90000000, 26.90000000, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, '2021-12-09', NULL, NULL, 'crabe', NULL, 0, '', NULL, NULL, NULL, 0, 0, '2021-12-09', 0, NULL, NULL, 0, 'SGD', 1.00000000, 26.90000000, 0.00000000, 26.90000000),
(5, '(PROV-POS1-3)', 1, NULL, NULL, NULL, 0, 1, '2021-11-11 06:21:43', '2021-11-11', NULL, NULL, '2021-11-11 06:21:43', NULL, 0, NULL, NULL, 0, NULL, NULL, 1.88000000, 0.00000000, 0.00000000, 0.00000000, 26.90000000, 28.78000000, 0, 1, NULL, NULL, NULL, 'takepos', '1', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2021-11-11', NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, 0, 'SGD', 1.00000000, 26.90000000, 1.88000000, 28.78000000),
(6, 'TC1-2111-0001', 1, NULL, NULL, NULL, 0, 1, '2021-11-11 06:22:38', '2021-11-11', NULL, '2021-11-11', '2021-11-11 06:30:10', '2021-11-11 06:30:10', 1, NULL, NULL, 0, NULL, NULL, 18.28000000, 0.00000000, 0.00000000, 0.00000000, 261.09000000, 279.37000000, 2, 1, NULL, 1, 1, 'takepos', '1', NULL, NULL, NULL, NULL, NULL, NULL, 0, 4, '2021-11-11', NULL, NULL, NULL, 'facture/TC1-2111-0001/TC1-2111-0001.pdf', 0, '', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, 0, 'SGD', 1.00000000, 261.09000000, 18.28000000, 279.37000000),
(7, 'FA2111-0001', 1, NULL, NULL, '1234', 0, 1, '2021-11-12 07:28:25', '2021-11-12', NULL, '2021-11-12', '2021-11-12 07:34:25', NULL, 0, NULL, NULL, 0, 'replaced', NULL, 21.00000000, 0.00000000, 0.00000000, 0.00000000, 300.00000000, 321.00000000, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, '2021-12-12', NULL, NULL, 'crabe', 'facture/FA2111-0001/FA2111-0001.pdf', 0, '', NULL, NULL, NULL, 0, 0, '2021-12-12', 0, NULL, NULL, 0, 'SGD', 1.00000000, 300.00000000, 21.00000000, 321.00000000),
(8, 'FA2111-0002', 1, NULL, NULL, '1234', 1, 1, '2021-11-12 07:34:12', '2021-11-12', NULL, '2021-11-12', '2021-11-12 09:26:57', '2021-11-12 09:26:57', 1, NULL, NULL, 0, NULL, NULL, 21.00000000, 0.00000000, 0.00000000, 0.00000000, 300.00000000, 321.00000000, 2, 1, NULL, 1, 1, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 2, 2, '2021-12-12', NULL, NULL, 'crabe', 'facture/FA2111-0002/FA2111-0002.pdf', 0, '', NULL, NULL, NULL, 0, 0, '2021-12-12', 0, NULL, NULL, 0, 'SGD', 1.00000000, 300.00000000, 21.00000000, 321.00000000),
(9, '(PROV9)', 1, NULL, NULL, NULL, 0, 1, '2021-11-12 07:35:27', '2021-11-12', NULL, NULL, '2021-11-12 07:35:27', NULL, 0, NULL, NULL, 0, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 26.90000000, 26.90000000, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, '2021-12-12', NULL, NULL, 'crabe', NULL, 0, '', NULL, NULL, NULL, 0, 0, '2021-12-12', 0, NULL, NULL, 0, 'SGD', 1.00000000, 26.90000000, 0.00000000, 26.90000000),
(11, 'FA2111-0003', 1, NULL, NULL, NULL, 0, 1, '2021-11-12 09:24:54', '2021-11-12', NULL, '2021-11-12', '2021-11-12 09:25:10', NULL, 0, NULL, NULL, 0, NULL, NULL, 70.00000000, 0.00000000, 0.00000000, 0.00000000, 1000.00000000, 1070.00000000, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2, 2, '2021-12-12', NULL, NULL, 'crabe', 'facture/FA2111-0003/FA2111-0003.pdf', 0, '', NULL, NULL, NULL, 0, 0, '2021-12-12', 0, NULL, NULL, 0, 'SGD', 1.00000000, 1000.00000000, 70.00000000, 1070.00000000),
(12, 'AV2111-0001', 1, NULL, NULL, NULL, 2, 1, '2021-11-12 09:28:58', '2021-11-12', NULL, '2021-11-12', '2021-11-12 09:31:41', '2021-11-12 09:31:41', 1, NULL, NULL, 0, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, -570.00000000, -570.00000000, 2, 1, NULL, 1, 1, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 0, 0, '2021-11-12', NULL, NULL, 'crabe', 'facture/AV2111-0001/AV2111-0001.pdf', 0, '', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, 0, 'SGD', 1.00000000, -570.00000000, 0.00000000, -570.00000000),
(13, 'FA2111-0004', 1, NULL, NULL, NULL, 0, 1, '2021-11-12 09:32:53', '2021-11-12', NULL, '2021-11-12', '2021-11-12 09:33:36', NULL, 0, NULL, NULL, 0, NULL, NULL, 70.00000000, 0.00000000, 0.00000000, 0.00000000, 1000.00000000, 1070.00000000, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-11-13', NULL, NULL, 'crabe', 'facture/FA2111-0004/FA2111-0004.pdf', 0, '', NULL, NULL, NULL, 0, 0, '2021-11-13', 0, NULL, NULL, 0, 'SGD', 1.00000000, 1000.00000000, 70.00000000, 1070.00000000),
(16, 'TC1-2112-0002', 1, NULL, NULL, NULL, 0, 1, '2021-12-08 09:52:59', '2021-12-08', NULL, '2021-12-08', '2021-12-08 13:23:44', NULL, 0, NULL, NULL, 0, NULL, NULL, 38.35000000, 0.00000000, 0.00000000, 0.00000000, 547.81000000, 586.16000000, 1, 1, NULL, 1, NULL, 'takepos', '1', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2021-12-08', NULL, NULL, NULL, 'facture/TC1-2112-0002/TC1-2112-0002.pdf', 0, '', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, 0, 'SGD', 1.00000000, 547.81000000, 38.35000000, 586.16000000),
(27, 'TC1-2112-0003', 1, NULL, NULL, NULL, 0, 1, '2021-12-09 06:56:14', '2021-12-09', NULL, '2021-12-09', '2021-12-09 06:56:41', '2021-12-09 06:56:41', 1, NULL, NULL, 0, NULL, NULL, 1.69000000, 0.00000000, 0.00000000, 0.00000000, 24.21000000, 25.90000000, 2, 1, NULL, 1, 1, 'takepos', '1', NULL, NULL, NULL, NULL, NULL, NULL, 0, 4, '2021-12-09', NULL, NULL, NULL, 'facture/TC1-2112-0003/TC1-2112-0003.pdf', 0, '', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, 0, 'SGD', 1.00000000, 24.21000000, 1.69000000, 25.90000000),
(28, '(PROV-POS1-0)', 1, NULL, NULL, NULL, 0, 1, '2021-12-09 06:57:46', '2021-12-09', NULL, NULL, '2021-12-09 08:01:50', NULL, 0, NULL, NULL, 0, NULL, NULL, 7.52000000, 0.00000000, 0.00000000, 0.00000000, 107.60000000, 115.12000000, 0, 1, NULL, NULL, NULL, 'takepos', '1', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2021-12-09', NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, 0, 'SGD', 1.00000000, 107.60000000, 7.52000000, 115.12000000),
(32, '(PROV32)', 1, NULL, NULL, NULL, 0, 6, '2021-12-13 14:29:29', '2021-12-13', NULL, NULL, '2021-12-13 14:29:29', NULL, 0, NULL, NULL, 0, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2021-12-13', NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, 0, 'SGD', 1.00000000, 0.00000000, 0.00000000, 0.00000000),
(33, '(PROV33)', 1, NULL, NULL, NULL, 0, 6, '2021-12-13 14:30:16', '2021-12-13', NULL, NULL, '2021-12-13 14:30:16', NULL, 0, NULL, NULL, 0, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2021-12-13', NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, 0, 'SGD', 1.00000000, 0.00000000, 0.00000000, 0.00000000),
(34, 'FA2112-0005', 1, NULL, NULL, NULL, 0, 3, '2021-12-17 09:42:26', '2021-12-17', NULL, '2021-12-17', '2021-12-17 09:42:34', NULL, 0, NULL, NULL, 0, NULL, NULL, 7.00000000, 0.00000000, 0.00000000, 0.00000000, 100.00000000, 107.00000000, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-12-18', NULL, NULL, 'crabe', 'facture/FA2112-0005/FA2112-0005.pdf', 0, '', NULL, NULL, NULL, 0, 0, '2021-12-18', 0, NULL, NULL, 0, 'SGD', 1.00000000, 100.00000000, 7.00000000, 107.00000000),
(35, 'FA2112-0006', 1, NULL, NULL, NULL, 0, 3, '2021-12-17 09:44:15', '2021-12-17', NULL, '2021-12-17', '2021-12-17 09:48:25', '2021-12-17 09:48:25', 1, NULL, NULL, 0, NULL, NULL, 14.00000000, 0.00000000, 0.00000000, 0.00000000, 200.00000000, 214.00000000, 2, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-12-18', NULL, NULL, 'crabe', 'facture/FA2112-0006/FA2112-0006.pdf', 0, '', NULL, NULL, NULL, 0, 0, '2021-12-18', 0, NULL, NULL, 0, 'SGD', 1.00000000, 200.00000000, 14.00000000, 214.00000000),
(36, 'FA2112-0007', 1, NULL, NULL, NULL, 0, 3, '2021-12-17 09:46:51', '2021-12-17', NULL, '2021-12-17', '2021-12-17 09:49:07', '2021-12-17 09:49:07', 1, NULL, NULL, 0, NULL, NULL, 14.00000000, 0.00000000, 0.00000000, 0.00000000, 200.00000000, 214.00000000, 2, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-12-18', NULL, NULL, 'crabe', 'facture/FA2112-0007/FA2112-0007.pdf', 0, '', NULL, NULL, NULL, 0, 0, '2021-12-18', 0, NULL, NULL, 0, 'SGD', 1.00000000, 200.00000000, 14.00000000, 214.00000000),
(37, '(PROV37)', 1, NULL, NULL, NULL, 0, 3, '2021-12-19 13:29:05', '2021-12-19', NULL, NULL, '2021-12-19 13:29:05', NULL, 0, NULL, NULL, 0, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-12-20', NULL, NULL, 'crabe', NULL, 0, '', NULL, NULL, NULL, 0, 0, '2021-12-20', 0, NULL, NULL, 0, 'SGD', 1.00000000, 0.00000000, 0.00000000, 0.00000000),
(38, 'FA2112-0008', 1, NULL, NULL, NULL, 0, 3, '2021-12-19 13:39:16', '2021-12-19', NULL, '2021-12-19', '2021-12-19 13:40:25', NULL, 0, NULL, NULL, 0, NULL, NULL, 7.70000000, 0.00000000, 0.00000000, 0.00000000, 110.00000000, 117.70000000, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, '2022-01-18', NULL, NULL, 'crabe', 'facture/FA2112-0008/FA2112-0008.pdf', 0, '', NULL, NULL, NULL, 0, 0, '2022-01-18', 0, NULL, NULL, 0, 'SGD', 1.00000000, 110.00000000, 7.70000000, 117.70000000),
(39, 'AC2112-0001', 1, NULL, NULL, NULL, 3, 6, '2021-12-19 13:43:34', '2021-12-19', NULL, '2021-12-19', '2021-12-19 13:50:23', NULL, 0, NULL, NULL, 0, NULL, NULL, 0.19000000, 0.00000000, 0.00000000, 0.00000000, 2.69000000, 2.88000000, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-12-20', NULL, NULL, 'crabe', 'facture/AC2112-0001/AC2112-0001.pdf', 0, '', NULL, NULL, NULL, 0, 0, '2021-12-20', 0, NULL, NULL, 0, 'SGD', 1.00000000, 2.69000000, 0.19000000, 2.88000000),
(40, 'FA2112-0009', 1, NULL, NULL, NULL, 0, 6, '2021-12-19 13:50:04', '2021-12-19', NULL, '2021-12-19', '2021-12-19 13:50:08', NULL, 0, NULL, NULL, 0, NULL, NULL, 1.88000000, 0.00000000, 0.00000000, 0.00000000, 26.90000000, 28.78000000, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-12-20', NULL, NULL, 'crabe', 'facture/FA2112-0009/FA2112-0009.pdf', 0, '', NULL, NULL, NULL, 0, 0, '2021-12-20', 0, NULL, NULL, 0, 'SGD', 1.00000000, 26.90000000, 1.88000000, 28.78000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_facturedet`
--

CREATE TABLE `erp_facturedet` (
  `rowid` int(11) NOT NULL,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `situation_percent` double DEFAULT 100,
  `fk_prev_id` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_facturedet`
--

INSERT INTO `erp_facturedet` (`rowid`, `fk_facture`, `fk_parent_line`, `fk_product`, `label`, `description`, `vat_src_code`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `qty`, `remise_percent`, `remise`, `fk_remise_except`, `subprice`, `price`, `total_ht`, `total_tva`, `total_localtax1`, `total_localtax2`, `total_ttc`, `product_type`, `date_start`, `date_end`, `info_bits`, `buy_price_ht`, `fk_product_fournisseur_price`, `special_code`, `rang`, `fk_contract_line`, `fk_unit`, `import_key`, `fk_code_ventilation`, `situation_percent`, `fk_prev_id`, `fk_user_author`, `fk_user_modif`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_subprice`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`, `ref_ext`) VALUES
(1, 1, NULL, 1, NULL, 'Product A', '', 0.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.90000000, NULL, 26.90000000, 0.00000000, 0.00000000, 0.00000000, 26.90000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 26.90000000, 0.00000000, 26.90000000, ''),
(9, 5, NULL, 1, NULL, 'Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.90000000, NULL, 26.90000000, 1.88000000, 0.00000000, 0.00000000, 28.78000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 26.90000000, 1.88000000, 28.78000000, ''),
(10, 6, NULL, 1, NULL, 'Product A', '', 7.0000, 0.0000, '0', 0.0000, '0', 6, 0, 0, NULL, 26.90000000, NULL, 161.40000000, 11.30000000, 0.00000000, 0.00000000, 172.70000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 161.40000000, 11.30000000, 172.70000000, ''),
(11, 6, NULL, 1, NULL, 'Product A', '', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 46.72897000, NULL, 46.73000000, 3.27000000, 0.00000000, 0.00000000, 50.00000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 2, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 46.72897000, 46.73000000, 3.27000000, 50.00000000, ''),
(12, 6, NULL, 1, NULL, 'Product A', '', 7.0000, 0.0000, '0', 0.0000, '0', 1, 3, 0, NULL, 26.90000000, NULL, 26.09000000, 1.83000000, 0.00000000, 0.00000000, 27.92000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 3, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 26.09000000, 1.83000000, 27.92000000, ''),
(13, 6, NULL, 1, NULL, 'Product A', '', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0.1, 0, NULL, 26.90000000, NULL, 26.87000000, 1.88000000, 0.00000000, 0.00000000, 28.75000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 4, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 26.87000000, 1.88000000, 28.75000000, ''),
(14, 7, NULL, 2, NULL, 'This is a test product\n(Country of origin: Singapore)', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 100.00000000, NULL, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000, ''),
(15, 7, NULL, NULL, NULL, 'Supply and Install', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 200.00000000, NULL, 200.00000000, 14.00000000, 0.00000000, 0.00000000, 214.00000000, 1, NULL, NULL, 0, 0.00000000, NULL, 0, 2, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 200.00000000, 200.00000000, 14.00000000, 214.00000000, ''),
(16, 8, NULL, 2, NULL, 'This is a test product\n(Country of origin: Singapore)', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 100.00000000, NULL, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, 14, 1, 1, 0, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000, ''),
(17, 8, NULL, NULL, NULL, 'Supply and Install', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 200.00000000, NULL, 200.00000000, 14.00000000, 0.00000000, 0.00000000, 214.00000000, 1, NULL, NULL, 0, 0.00000000, NULL, 0, 2, NULL, NULL, NULL, 0, 100, 15, 1, 1, 0, 'SGD', 200.00000000, 200.00000000, 14.00000000, 214.00000000, ''),
(18, 9, NULL, 1, NULL, 'Product A', '', 0.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.90000000, NULL, 26.90000000, 0.00000000, 0.00000000, 0.00000000, 26.90000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 26.90000000, 0.00000000, 26.90000000, ''),
(26, 11, NULL, 4, NULL, 'This is a test product 2', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 1000.00000000, NULL, 1000.00000000, 70.00000000, 0.00000000, 0.00000000, 1070.00000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 1000.00000000, 1000.00000000, 70.00000000, 1070.00000000, ''),
(27, 11, NULL, NULL, NULL, 'Supply and Install sample', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 0.00000000, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 1, NULL, NULL, 0, 0.00000000, NULL, 0, 2, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 0.00000000, 0.00000000, 0.00000000, 0.00000000, ''),
(28, 12, NULL, NULL, NULL, 'Credit Note for remaining unpaid amount', '', 0.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, -570.00000000, NULL, -570.00000000, 0.00000000, 0.00000000, 0.00000000, -570.00000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', -570.00000000, -570.00000000, 0.00000000, -570.00000000, ''),
(29, 13, NULL, 4, NULL, 'This is a test product 2', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 1000.00000000, NULL, 1000.00000000, 70.00000000, 0.00000000, 0.00000000, 1070.00000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 1000.00000000, 1000.00000000, 70.00000000, 1070.00000000, ''),
(38, 16, NULL, 1, NULL, 'Product A', '', 7.0000, 0.0000, '0', 0.0000, '0', 1, 6, 0, NULL, 10.28037000, NULL, 9.66000000, 0.68000000, 0.00000000, 0.00000000, 10.34000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 10.28037000, 9.66000000, 0.68000000, 10.34000000, ''),
(39, 16, NULL, 1, NULL, 'Product A', '', 7.0000, 0.0000, '0', 0.0000, '0', 1, 6, 0, NULL, 26.90000000, NULL, 25.29000000, 1.77000000, 0.00000000, 0.00000000, 27.06000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 2, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 25.29000000, 1.77000000, 27.06000000, ''),
(40, 16, NULL, 1, NULL, 'Product A', '', 7.0000, 0.0000, '0', 0.0000, '0', 1, 6, 0, NULL, 26.90000000, NULL, 25.29000000, 1.77000000, 0.00000000, 0.00000000, 27.06000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 3, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 25.29000000, 1.77000000, 27.06000000, ''),
(41, 16, NULL, 1, NULL, 'Product A', '', 7.0000, 0.0000, '0', 0.0000, '0', 1, 6, 0, NULL, 518.69159000, NULL, 487.57000000, 34.13000000, 0.00000000, 0.00000000, 521.70000000, 0, NULL, NULL, 0, 0.00000000, NULL, 0, 4, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 518.69159000, 487.57000000, 34.13000000, 521.70000000, ''),
(71, 27, NULL, 1, NULL, 'Product A', '', 7.0000, 0.0000, '0', 0.0000, '0', 1, 10, 0, NULL, 26.90000000, NULL, 24.21000000, 1.69000000, 0.00000000, 0.00000000, 25.90000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 24.21000000, 1.69000000, 25.90000000, ''),
(72, 28, NULL, 1, NULL, 'Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.90000000, NULL, 26.90000000, 1.88000000, 0.00000000, 0.00000000, 28.78000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 26.90000000, 1.88000000, 28.78000000, ''),
(80, 28, NULL, 1, NULL, 'Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.90000000, NULL, 26.90000000, 1.88000000, 0.00000000, 0.00000000, 28.78000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 2, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 26.90000000, 1.88000000, 28.78000000, ''),
(82, 28, NULL, 1, NULL, 'Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.90000000, NULL, 26.90000000, 1.88000000, 0.00000000, 0.00000000, 28.78000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 3, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 26.90000000, 1.88000000, 28.78000000, ''),
(83, 28, NULL, 1, NULL, 'Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.90000000, NULL, 26.90000000, 1.88000000, 0.00000000, 0.00000000, 28.78000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 4, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 26.90000000, 1.88000000, 28.78000000, ''),
(84, 32, NULL, 8, NULL, 'TK2112-0001 - Do something', '7', 7.0000, 0.0000, '0', 0.0000, '0', 3, 0, 0, NULL, 0.00000000, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 1, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 0.00000000, 0.00000000, 0.00000000, 0.00000000, ''),
(85, 33, NULL, 8, NULL, 'Time spent : 03:00', '7', 7.0000, 0.0000, '0', 0.0000, '0', 3, 0, 0, NULL, 0.00000000, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 1, NULL, NULL, 0, 0.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 0.00000000, 0.00000000, 0.00000000, 0.00000000, ''),
(86, 34, NULL, 2, NULL, 'This is a test product\n(Country of origin: Singapore)', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 100.00000000, NULL, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000, ''),
(87, 35, NULL, 3, NULL, 'Sample Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 200.00000000, NULL, 200.00000000, 14.00000000, 0.00000000, 0.00000000, 214.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 200.00000000, 200.00000000, 14.00000000, 214.00000000, ''),
(88, 36, NULL, 3, NULL, 'Sample Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 200.00000000, NULL, 200.00000000, 14.00000000, 0.00000000, 0.00000000, 214.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 200.00000000, 200.00000000, 14.00000000, 214.00000000, ''),
(89, 37, NULL, NULL, NULL, 'test', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 0.00000000, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0, '2021-12-19 13:28:37', NULL, 0, 0.00000000, NULL, 0, 0, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 0.00000000, 0.00000000, 0.00000000, 0.00000000, ''),
(90, 37, NULL, 8, NULL, '', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 0.00000000, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 1, '2021-12-19 13:28:37', NULL, 0, 0.00000000, NULL, 0, 0, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 0.00000000, 0.00000000, 0.00000000, 0.00000000, ''),
(91, 38, NULL, 2, NULL, 'This is a test product\n(Country of origin: Singapore)', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 100.00000000, NULL, 100.00000000, 7.00000000, 0.00000000, 0.00000000, 107.00000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 100.00000000, 100.00000000, 7.00000000, 107.00000000, ''),
(92, 38, NULL, 5, NULL, 'Testing', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 10.00000000, NULL, 10.00000000, 0.70000000, 0.00000000, 0.00000000, 10.70000000, 0, NULL, NULL, 0, 5.00000000, NULL, 0, 2, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 10.00000000, 10.00000000, 0.70000000, 10.70000000, ''),
(93, 39, NULL, 1, NULL, 'Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 0.1, 0, 0, NULL, 26.90000000, NULL, 2.69000000, 0.19000000, 0.00000000, 0.00000000, 2.88000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 2.69000000, 0.19000000, 2.88000000, ''),
(94, 40, NULL, 1, NULL, 'Product A', '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 26.90000000, NULL, 26.90000000, 1.88000000, 0.00000000, 0.00000000, 28.78000000, 0, NULL, NULL, 0, 20.00000000, NULL, 0, 1, NULL, NULL, NULL, 0, 100, NULL, 1, 1, 0, 'SGD', 26.90000000, 26.90000000, 1.88000000, 28.78000000, '');

-- --------------------------------------------------------

--
-- Table structure for table `erp_facturedet_extrafields`
--

CREATE TABLE `erp_facturedet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_facturedet_rec`
--

CREATE TABLE `erp_facturedet_rec` (
  `rowid` int(11) NOT NULL,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `date_start_fill` int(11) DEFAULT 0,
  `date_end_fill` int(11) DEFAULT 0,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(10) UNSIGNED DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_facturedet_rec_extrafields`
--

CREATE TABLE `erp_facturedet_rec_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_facture_extrafields`
--

CREATE TABLE `erp_facture_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_facture_fourn`
--

CREATE TABLE `erp_facture_fourn` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_supplier` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_closing` datetime DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double(24,8) DEFAULT 0.00000000,
  `close_code` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close_note` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_closing` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_transport_mode` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_facture_fourn`
--

INSERT INTO `erp_facture_fourn` (`rowid`, `ref`, `ref_supplier`, `entity`, `ref_ext`, `type`, `fk_soc`, `datec`, `datef`, `date_pointoftax`, `date_valid`, `tms`, `date_closing`, `libelle`, `paye`, `amount`, `remise`, `close_code`, `close_note`, `tva`, `localtax1`, `localtax2`, `total`, `total_ht`, `total_tva`, `total_ttc`, `fk_statut`, `fk_user_author`, `fk_user_modif`, `fk_user_valid`, `fk_user_closing`, `fk_facture_source`, `fk_projet`, `fk_account`, `fk_cond_reglement`, `fk_mode_reglement`, `date_lim_reglement`, `note_private`, `note_public`, `fk_incoterms`, `location_incoterms`, `fk_transport_mode`, `model_pdf`, `last_main_doc`, `import_key`, `extraparams`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES
(1, 'SI2111-0001', 'Test', 1, '', 0, 2, '2021-11-22 08:44:24', '2021-11-22', NULL, '2021-12-08', '2021-12-08 10:13:46', NULL, '', 0, 0.00000000, 0.00000000, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, 4, '2021-11-23', '', '', 0, '', NULL, NULL, NULL, NULL, NULL, 0, 'SGD', 1.00000000, 0.00000000, 0.00000000, 0.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_facture_fourn_det`
--

CREATE TABLE `erp_facture_fourn_det` (
  `rowid` int(11) NOT NULL,
  `fk_facture_fourn` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_facture_fourn_det`
--

INSERT INTO `erp_facture_fourn_det` (`rowid`, `fk_facture_fourn`, `fk_parent_line`, `fk_product`, `ref`, `label`, `description`, `pu_ht`, `pu_ttc`, `qty`, `remise_percent`, `fk_remise_except`, `vat_src_code`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `total_ht`, `tva`, `total_localtax1`, `total_localtax2`, `total_ttc`, `product_type`, `date_start`, `date_end`, `info_bits`, `fk_code_ventilation`, `special_code`, `rang`, `import_key`, `fk_unit`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_subprice`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES
(1, 1, NULL, 5, 'Test123', NULL, 'Testing', 0.00000000, 0.00000000, 20, 0, NULL, '', 15.0000, 0.0000, '0', 0.0000, '0', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0, NULL, NULL, 0, 0, 0, 1, NULL, NULL, 0, 'SGD', 0.00000000, 0.00000000, 0.00000000, 0.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_facture_fourn_det_extrafields`
--

CREATE TABLE `erp_facture_fourn_det_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_facture_fourn_extrafields`
--

CREATE TABLE `erp_facture_fourn_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_facture_rec`
--

CREATE TABLE `erp_facture_rec` (
  `rowid` int(11) NOT NULL,
  `titre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `suspended` int(11) DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT 1,
  `fk_mode_reglement` int(11) DEFAULT 0,
  `date_lim_reglement` date DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelpdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `usenewprice` int(11) DEFAULT 0,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT 0,
  `generate_pdf` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_facture_rec_extrafields`
--

CREATE TABLE `erp_facture_rec_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_fichinter`
--

CREATE TABLE `erp_fichinter` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `fk_contrat` int(11) DEFAULT 0,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `datei` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `datet` date DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_fichinter`
--

INSERT INTO `erp_fichinter` (`rowid`, `fk_soc`, `fk_projet`, `fk_contrat`, `ref`, `ref_ext`, `entity`, `tms`, `datec`, `date_valid`, `datei`, `fk_user_author`, `fk_user_modif`, `fk_user_valid`, `fk_statut`, `dateo`, `datee`, `datet`, `duree`, `description`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `import_key`, `extraparams`) VALUES
(1, 1, 0, 0, 'FI2111-0001', NULL, 1, '2021-11-12 09:50:20', '2021-11-12 09:50:01', '2021-11-12 09:50:20', NULL, 1, 1, 1, 1, '2021-11-12', '2021-11-12', NULL, 3600, NULL, NULL, NULL, 'soleil', NULL, NULL, NULL),
(2, 1, 0, 0, '(PROV2)', NULL, 1, '2021-11-12 09:51:03', '2021-11-12 09:51:03', NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'soleil', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_fichinterdet`
--

CREATE TABLE `erp_fichinterdet` (
  `rowid` int(11) NOT NULL,
  `fk_fichinter` int(11) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_fichinterdet`
--

INSERT INTO `erp_fichinterdet` (`rowid`, `fk_fichinter`, `fk_parent_line`, `date`, `description`, `duree`, `rang`) VALUES
(1, 1, NULL, '2021-11-12 00:00:00', 'dasd', 3600, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_fichinterdet_extrafields`
--

CREATE TABLE `erp_fichinterdet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_fichinterdet_rec`
--

CREATE TABLE `erp_fichinterdet_rec` (
  `rowid` int(11) NOT NULL,
  `fk_fichinter` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `total_ht` double(24,8) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `fk_export_commpta` int(11) NOT NULL DEFAULT 0,
  `special_code` int(10) UNSIGNED DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_fichinter_extrafields`
--

CREATE TABLE `erp_fichinter_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_fichinter_rec`
--

CREATE TABLE `erp_fichinter_rec` (
  `rowid` int(11) NOT NULL,
  `titre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_contrat` int(11) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelpdf` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_holiday`
--

CREATE TABLE `erp_holiday` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `halfday` int(11) DEFAULT 0,
  `statut` int(11) NOT NULL DEFAULT 1,
  `fk_validator` int(11) NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `detail_refuse` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_holiday_config`
--

CREATE TABLE `erp_holiday_config` (
  `rowid` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_holiday_config`
--

INSERT INTO `erp_holiday_config` (`rowid`, `name`, `value`) VALUES
(1, 'lastUpdate', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_holiday_extrafields`
--

CREATE TABLE `erp_holiday_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_holiday_logs`
--

CREATE TABLE `erp_holiday_logs` (
  `rowid` int(11) NOT NULL,
  `date_action` datetime NOT NULL,
  `fk_user_action` int(11) NOT NULL,
  `fk_user_update` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `type_action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prev_solde` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_solde` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_holiday_users`
--

CREATE TABLE `erp_holiday_users` (
  `fk_user` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `nb_holiday` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_evaluation`
--

CREATE TABLE `erp_hrm_evaluation` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `date_eval` date DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_job` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_evaluationdet`
--

CREATE TABLE `erp_hrm_evaluationdet` (
  `rowid` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_skill` int(11) NOT NULL,
  `fk_evaluation` int(11) NOT NULL,
  `rankorder` int(11) NOT NULL,
  `required_rank` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_evaluationdet_extrafields`
--

CREATE TABLE `erp_hrm_evaluationdet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_evaluation_extrafields`
--

CREATE TABLE `erp_hrm_evaluation_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_job`
--

CREATE TABLE `erp_hrm_job` (
  `rowid` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deplacement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_job_extrafields`
--

CREATE TABLE `erp_hrm_job_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_job_user`
--

CREATE TABLE `erp_hrm_job_user` (
  `rowid` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contrat` int(11) DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_job` int(11) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `abort_comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_job_user_extrafields`
--

CREATE TABLE `erp_hrm_job_user_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_skill`
--

CREATE TABLE `erp_hrm_skill` (
  `rowid` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `required_level` int(11) NOT NULL,
  `date_validite` int(11) NOT NULL,
  `temps_theorique` double(24,8) NOT NULL,
  `skill_type` int(11) NOT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_skilldet`
--

CREATE TABLE `erp_hrm_skilldet` (
  `rowid` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_skill` int(11) NOT NULL,
  `rankorder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_skilldet_extrafields`
--

CREATE TABLE `erp_hrm_skilldet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_skillrank`
--

CREATE TABLE `erp_hrm_skillrank` (
  `rowid` int(11) NOT NULL,
  `fk_skill` int(11) NOT NULL,
  `rankorder` int(11) NOT NULL,
  `fk_object` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `objecttype` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hrm_skill_extrafields`
--

CREATE TABLE `erp_hrm_skill_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_import_model`
--

CREATE TABLE `erp_import_model` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 0,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_intracommreport`
--

CREATE TABLE `erp_intracommreport` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type_declaration` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periods` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_xml` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_export` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_inventory`
--

CREATE TABLE `erp_inventory` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 0,
  `ref` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_inventory` datetime DEFAULT NULL,
  `date_validation` datetime DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_inventorydet`
--

CREATE TABLE `erp_inventorydet` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_inventory` int(11) DEFAULT 0,
  `fk_warehouse` int(11) DEFAULT 0,
  `fk_product` int(11) DEFAULT 0,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_stock` double DEFAULT NULL,
  `qty_view` double DEFAULT NULL,
  `qty_regulated` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_knowledgemanagement_knowledgerecord`
--

CREATE TABLE `erp_knowledgemanagement_knowledgerecord` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_ticket` int(11) DEFAULT NULL,
  `fk_c_ticket_category` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_knowledgemanagement_knowledgerecord_extrafields`
--

CREATE TABLE `erp_knowledgemanagement_knowledgerecord_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_links`
--

CREATE TABLE `erp_links` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datea` datetime NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objecttype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objectid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_loan`
--

CREATE TABLE `erp_loan` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `capital` double(24,8) NOT NULL DEFAULT 0.00000000,
  `insurance_amount` double(24,8) DEFAULT 0.00000000,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `nbterm` double DEFAULT NULL,
  `rate` double NOT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital_position` double(24,8) DEFAULT 0.00000000,
  `date_position` date DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `accountancy_account_capital` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_account_insurance` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_account_interest` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_loan_schedule`
--

CREATE TABLE `erp_loan_schedule` (
  `rowid` int(11) NOT NULL,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT 0.00000000,
  `amount_insurance` double(24,8) DEFAULT 0.00000000,
  `amount_interest` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_payment_loan` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_localtax`
--

CREATE TABLE `erp_localtax` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `localtaxtype` tinyint(4) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_mailing`
--

CREATE TABLE `erp_mailing` (
  `rowid` int(11) NOT NULL,
  `statut` smallint(6) DEFAULT 0,
  `titre` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `sujet` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bgcolor` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bgimage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cible` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nbemail` int(11) DEFAULT NULL,
  `email_from` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_replyto` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_errorsto` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_appro` datetime DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_appro` int(11) DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joined_file1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joined_file2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joined_file3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joined_file4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_mailing_cibles`
--

CREATE TABLE `erp_mailing_cibles` (
  `rowid` int(11) NOT NULL,
  `fk_mailing` int(11) NOT NULL,
  `fk_contact` int(11) NOT NULL,
  `lastname` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `source_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `error_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_mailing_unsubscribe`
--

CREATE TABLE `erp_mailing_unsubscribe` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unsubscribegroup` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_menu`
--

CREATE TABLE `erp_menu` (
  `rowid` int(11) NOT NULL,
  `menu_handler` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainmenu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leftmenu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_menu` int(11) NOT NULL,
  `fk_mainmenu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_leftmenu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `langs` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `perms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usertype` int(11) NOT NULL DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_menu`
--

INSERT INTO `erp_menu` (`rowid`, `menu_handler`, `entity`, `module`, `type`, `mainmenu`, `leftmenu`, `fk_menu`, `fk_mainmenu`, `fk_leftmenu`, `position`, `url`, `target`, `titre`, `prefix`, `langs`, `level`, `perms`, `enabled`, `usertype`, `tms`) VALUES
(31, 'all', 1, 'barcode', 'left', 'tools', 'barcodeprint', -1, 'tools', NULL, 200, '/barcode/printsheet.php?mainmenu=tools&leftmenu=barcodeprint', '', 'BarCodePrintsheet', '<span class=\"fas fa-barcode paddingright pictofixedwidth\" style=\"\"></span>', 'products', NULL, '($conf->global->MAIN_USE_ADVANCED_PERMS && $user->rights->barcode->lire_advance) || (! $conf->global->MAIN_USE_ADVANCED_PERMS)', '$conf->barcode->enabled', 0, '2021-11-09 09:21:02'),
(32, 'all', 1, 'barcode', 'left', 'home', NULL, -1, 'home', 'admintools', 300, '/barcode/codeinit.php?mainmenu=home&leftmenu=admintools', '', 'MassBarcodeInit', '', 'products', NULL, '($conf->global->MAIN_USE_ADVANCED_PERMS && $user->rights->barcode->creer_advance) || (! $conf->global->MAIN_USE_ADVANCED_PERMS)', '$conf->barcode->enabled && preg_match(\'/^(admintools|all)/\',$leftmenu)', 0, '2021-11-09 09:21:02'),
(56, 'all', 1, 'resource', 'left', 'tools', 'resource', -1, 'tools', NULL, 100, '/resource/list.php', '', 'MenuResourceIndex', '<span class=\"fas fa-laptop-house  em092 infobox-action paddingright pictofixedwidth em92\" style=\"\"></span>', 'resource', NULL, '$user->rights->resource->read', '1', 0, '2021-12-08 11:26:28'),
(57, 'all', 1, 'resource', 'left', 'tools', 'resource_add', -1, 'tools', 'resource', 101, '/resource/card.php?action=create', '', 'MenuResourceAdd', '', 'resource', NULL, '$user->rights->resource->write', '1', 0, '2021-12-08 11:26:28'),
(58, 'all', 1, 'resource', 'left', 'tools', 'resource_list', -1, 'tools', 'resource', 102, '/resource/list.php', '', 'List', '', 'resource', NULL, '$user->rights->resource->read', '1', 0, '2021-12-08 11:26:28'),
(16418, 'auguria', 1, '', 'top', 'home', '', 0, NULL, NULL, 0, '/index.php?mainmenu=home&leftmenu=', '', 'Home', '', '', -1, '', '1', 2, '2021-12-23 06:24:30'),
(16419, 'auguria', 1, 'societe|fournisseur|supplier_order|supplier_invoice', 'top', 'companies', '', 0, NULL, NULL, 1, '/societe/list.php?mainmenu=companies&type=f&leftmenu=suppliers&idmenu=16419', '', 'Suppliers', '', 'companies', -1, '$user->rights->societe->lire || $user->rights->societe->contact->lire', '($conf->societe->enabled && (empty($conf->global->SOCIETE_DISABLE_PROSPECTS) || empty($conf->global->SOCIETE_DISABLE_CUSTOMERS) || !empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || $conf->supplier_order->enabled || $conf->supplier_invoice->enabled))', 2, '2021-12-23 06:23:59'),
(16420, 'auguria', 1, 'product|service', 'top', 'products', '', 0, NULL, NULL, 30, '/product/index.php?mainmenu=products&leftmenu=', '', 'Inventory', '', 'products', -1, '$user->rights->produit->lire||$user->rights->service->lire', '$conf->product->enabled || $conf->service->enabled', 0, '2021-12-22 02:40:39'),
(16422, 'auguria', 1, 'propal|commande|fournisseur|supplier_order|supplier_invoice|contrat|ficheinter', 'top', 'commercial', '', 0, NULL, NULL, 3, '/comm/index.php?mainmenu=commercial&leftmenu=', '', 'Sales', '', 'commercial', -1, '$user->rights->societe->lire || $user->rights->societe->contact->lire', '$conf->propal->enabled || $conf->commande->enabled || $conf->supplier_order->enabled || $conf->contrat->enabled || $conf->ficheinter->enabled', 2, '2021-12-23 06:24:52'),
(16423, 'auguria', 1, 'facture|don|tax|salaries|loan|banque', 'top', 'billing', '', 0, NULL, NULL, 50, '/compta/index.php?mainmenu=billing&leftmenu=', '', 'Invoicing', '', 'compta', -1, '$user->rights->facture->lire|| $user->rights->don->lire || $user->rights->tax->charges->lire || $user->rights->salaries->read || $user->rights->loan->read || $user->rights->banque->lire', '$conf->comptabilite->enabled || $conf->accounting->enabled || $conf->facture->enabled || $conf->don->enabled || $conf->tax->enabled || $conf->salaries->enabled || $conf->supplier_invoice->enabled || $conf->loan->enabled || $conf->banque->enabled', 2, '2021-12-22 02:40:08'),
(16424, 'auguria', 1, 'projet', 'top', 'project', '', 0, NULL, NULL, 32, '/projet/index.php?mainmenu=project&amp;leftmenu=', '', 'Projects', NULL, 'projects', -1, '$user->rights->projet->lire', '$conf->projet->enabled', 2, '2021-12-22 02:36:25'),
(16425, 'auguria', 1, '', 'top', 'tools', '', 0, NULL, NULL, 90, '/core/tools.php?mainmenu=tools&amp;leftmenu=', '', 'Tools', NULL, 'other', -1, '', '', 2, '2021-12-22 02:36:25'),
(16426, 'auguria', 1, 'comptabilite|accounting|asset', 'top', 'accountancy', '', 0, NULL, NULL, 54, '/compta/index.php?mainmenu=accountancy&amp;leftmenu=accountancy', '', 'MenuAccountancy', NULL, 'main', -1, '$user->rights->compta->resultat->lire || $user->rights->accounting->mouvements->lire || $user->rights->asset->read', '$conf->comptabilite->enabled || $conf->accounting->enabled || $conf->asset->enabled', 2, '2021-12-22 02:36:25'),
(16430, 'auguria', 1, 'adherent', 'top', 'members', '', 0, NULL, NULL, 19, '/adherents/index.php?mainmenu=members&amp;leftmenu=', '', 'Members', NULL, 'members', -1, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(16431, 'auguria', 1, 'banque|prelevement', 'top', 'bank', '', 0, NULL, NULL, 52, '/compta/bank/list.php?mainmenu=bank&amp;leftmenu=bank', '', 'MenuBankCash', NULL, 'banks', -1, '$user->rights->banque->lire || $user->rights->prelevement->bons->lire', '$conf->banque->enabled || $conf->prelevement->enabled', 0, '2021-12-22 02:36:25'),
(16432, 'auguria', 1, 'hrm|holiday|deplacement|expensereport', 'top', 'hrm', '', 0, NULL, NULL, 80, '/hrm/index.php?mainmenu=hrm&amp;leftmenu=', '', 'HRM', NULL, 'holiday', -1, '$user->rights->user->user->lire || $user->rights->holiday->read || $user->rights->deplacement->lire || $user->rights->expensereport->lire', '$conf->hrm->enabled || $conf->holiday->enabled || $conf->deplacement->enabled || $conf->expensereport->enabled', 0, '2021-12-22 02:36:25'),
(16433, 'auguria', 1, 'bom|mrp', 'top', 'mrp', '', 0, NULL, NULL, 31, '/mrp/index.php?mainmenu=mrp&amp;leftmenu=', '', 'MRP', NULL, 'mrp', -1, '$user->rights->bom->read||$user->rights->mrp->read', '$conf->bom->enabled || $conf->mrp->enabled', 0, '2021-12-22 02:36:25'),
(16507, 'auguria', 1, '', 'left', 'home', '', 16418, NULL, NULL, 0, '/index.php', '', 'MyDashboard', NULL, '', 0, '', '1', 2, '2021-12-22 02:36:25'),
(16517, 'auguria', 1, '', 'left', 'home', 'setup', 16418, NULL, NULL, 1, '/admin/index.php?mainmenu=home&amp;leftmenu=setup', '', 'Setup', NULL, 'admin', 0, '', '$user->admin', 2, '2021-12-22 02:36:25'),
(16518, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 1, '/admin/company.php?mainmenu=home&amp;leftmenu=setup', '', 'MenuCompanySetup', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16519, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 4, '/admin/ihm.php?mainmenu=home&amp;leftmenu=setup', '', 'GUISetup', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16520, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 2, '/admin/modules.php?mainmenu=home&amp;leftmenu=setup', '', 'Modules', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16521, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 6, '/admin/boxes.php?mainmenu=home&amp;leftmenu=setup', '', 'Boxes', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16522, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 3, '/admin/menus.php?mainmenu=home&amp;leftmenu=setup', '', 'Menus', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16523, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 7, '/admin/delais.php?mainmenu=home&amp;leftmenu=setup', '', 'Alerts', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16524, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 10, '/admin/pdf.php?mainmenu=home&amp;leftmenu=setup', '', 'PDF', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16525, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 8, '/admin/security_other.php?mainmenu=home&amp;leftmenu=setup', '', 'Security', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16526, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 11, '/admin/mails.php?mainmenu=home&amp;leftmenu=setup', '', 'Emails', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16527, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 9, '/admin/limits.php?mainmenu=home&amp;leftmenu=setup', '', 'MenuLimits', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16528, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 13, '/admin/dict.php?mainmenu=home&amp;leftmenu=setup', '', 'Dictionary', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16529, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 14, '/admin/const.php?mainmenu=home&amp;leftmenu=setup', '', 'OtherSetup', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16530, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 12, '/admin/sms.php?mainmenu=home&amp;leftmenu=setup', '', 'SMS', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16531, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 4, '/admin/translation.php?mainmenu=home&amp;leftmenu=setup', '', 'Translation', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16532, 'auguria', 1, '', 'left', 'home', '', 16517, NULL, NULL, 4, '/admin/defaultvalues.php?mainmenu=home&amp;leftmenu=setup', '', 'DefaultValues', NULL, 'admin', 1, '', '$leftmenu==\"setup\"', 2, '2021-12-22 02:36:25'),
(16618, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 0, '/admin/system/berp3.php?mainmenu=home&amp;leftmenu=admintools', '', 'InfoBerp3', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16619, 'auguria', 1, '', 'left', 'home', '', 16618, NULL, NULL, 2, '/admin/system/modules.php?mainmenu=home&amp;leftmenu=admintools', '', 'Modules', NULL, 'admin', 2, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16620, 'auguria', 1, '', 'left', 'home', '', 16618, NULL, NULL, 3, '/admin/triggers.php?mainmenu=home&amp;leftmenu=admintools', '', 'Triggers', NULL, 'admin', 2, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16621, 'auguria', 1, '', 'left', 'home', '', 16618, NULL, NULL, 4, '/admin/system/filecheck.php?mainmenu=home&amp;leftmenu=admintools', '', 'FileCheck', NULL, 'admin', 2, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16622, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 1, '/admin/system/browser.php?mainmenu=home&amp;leftmenu=admintools', '', 'InfoBrowser', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16623, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 2, '/admin/system/os.php?mainmenu=home&amp;leftmenu=admintools', '', 'InfoOS', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16624, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 3, '/admin/system/web.php?mainmenu=home&amp;leftmenu=admintools', '', 'InfoWebServer', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16625, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 4, '/admin/system/phpinfo.php?mainmenu=home&amp;leftmenu=admintools', '', 'InfoPHP', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16627, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 5, '/admin/system/database.php?mainmenu=home&amp;leftmenu=admintools', '', 'InfoDatabase', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16717, 'auguria', 1, '', 'left', 'home', 'admintools', 16418, NULL, NULL, 2, '/admin/tools/index.php?mainmenu=home&amp;leftmenu=admintools', '', 'AdminTools', NULL, 'admin', 0, '', '$user->admin', 2, '2021-12-22 02:36:25'),
(16718, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 6, '/admin/tools/berp3_export.php?mainmenu=home&amp;leftmenu=admintools', '', 'Backup', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16719, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 7, '/admin/tools/berp3_import.php?mainmenu=home&amp;leftmenu=admintools', '', 'Restore', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16722, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 8, '/admin/tools/update.php?mainmenu=home&amp;leftmenu=admintools', '', 'MenuUpgrade', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16724, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 10, '/admin/tools/listevents.php?mainmenu=home&amp;leftmenu=admintools', '', 'Audit', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16725, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 11, '/admin/tools/listsessions.php?mainmenu=home&amp;leftmenu=admintools', '', 'Sessions', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16726, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 12, '/admin/tools/purge.php?mainmenu=home&amp;leftmenu=admintools', '', 'Purge', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16728, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 14, '/admin/system/about.php?mainmenu=home&amp;leftmenu=admintools', '', 'ExternalResources', NULL, 'admin', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16737, 'auguria', 1, '', 'left', 'home', '', 16717, NULL, NULL, 15, '/product/admin/product_tools.php?mainmenu=home&amp;leftmenu=admintools', '', 'ProductVatMassChange', NULL, 'products', 1, '', '$leftmenu==\"admintools\"', 2, '2021-12-22 02:36:25'),
(16817, 'auguria', 1, '', 'left', 'home', 'users', 16418, NULL, NULL, 4, '/user/home.php?mainmenu=home&amp;leftmenu=users', '', 'MenuUsersAndGroups', NULL, 'users', 0, '', '1', 2, '2021-12-22 02:36:25'),
(16818, 'auguria', 1, '', 'left', 'home', '', 16817, NULL, NULL, 0, '/user/list.php?mainmenu=home&amp;leftmenu=users', '', 'Users', NULL, 'users', 1, '$user->rights->user->user->lire || $user->admin', '$leftmenu==\"users\"', 2, '2021-12-22 02:36:25'),
(16819, 'auguria', 1, '', 'left', 'home', '', 16818, NULL, NULL, 0, '/user/card.php?mainmenu=home&amp;leftmenu=users&amp;action=create', '', 'NewUser', NULL, 'users', 2, '($user->rights->user->user->creer || $user->admin) && !(! empty($conf->multicompany->enabled) && $conf->entity > 1 && $conf->global->MULTICOMPANY_TRANSVERSE_MODE)', '$leftmenu==\"users\"', 2, '2021-12-22 02:36:25'),
(16821, 'auguria', 1, '', 'left', 'home', '', 16818, NULL, NULL, 0, '/user/hierarchy.php?mainmenu=home&amp;leftmenu=users', '', 'HierarchicView', NULL, 'users', 1, '$user->rights->user->user->lire || $user->admin', '$leftmenu==\"users\"', 2, '2021-12-22 02:36:25'),
(16822, 'auguria', 1, '', 'left', 'home', '', 16818, NULL, NULL, 0, '/categories/index.php?mainmenu=home&amp;leftmenu=users&type=7', '', 'UsersCategoriesShort', NULL, 'categories', 1, '$user->rights->user->user->lire || $user->admin', '$leftmenu==\"users\"', 2, '2021-12-22 02:36:25'),
(16824, 'auguria', 1, '', 'left', 'home', '', 16817, NULL, NULL, 1, '/user/group/list.php?mainmenu=home&amp;leftmenu=users', '', 'Groups', NULL, 'users', 1, '(($conf->global->MAIN_USE_ADVANCED_PERMS?$user->rights->user->group_advance->read:$user->rights->user->user->lire) || $user->admin) && !(! empty($conf->multicompany->enabled) && $conf->entity > 1 && $conf->global->MULTICOMPANY_TRANSVERSE_MODE)', '$leftmenu==\"users\"', 2, '2021-12-22 02:36:25'),
(16825, 'auguria', 1, '', 'left', 'home', '', 16824, NULL, NULL, 0, '/user/group/card.php?mainmenu=home&amp;leftmenu=users&amp;action=create', '', 'NewGroup', NULL, 'users', 2, '(($conf->global->MAIN_USE_ADVANCED_PERMS?$user->rights->user->group_advance->write:$user->rights->user->user->creer) || $user->admin) && !(! empty($conf->multicompany->enabled) && $conf->entity > 1 && $conf->global->MULTICOMPANY_TRANSVERSE_MODE)', '$leftmenu==\"users\"', 2, '2021-12-22 02:36:25'),
(16917, 'auguria', 1, '', 'left', '', '', 16419, NULL, NULL, 0, '/societe/list.php?mainmenu=companies&type=f&leftmenu=suppliers', '', 'Suppliers', '', 'companies', 0, '$user->rights->societe->lire', '$conf->societe->enabled', 2, '2021-12-22 08:25:00'),
(16918, 'auguria', 1, '', 'left', '', '', 16917, NULL, NULL, 0, '/societe/card.php?mainmenu=companies&action=create', '', 'MenuNewThirdParty', '', 'companies', 1, '$user->rights->societe->creer', '0', 2, '2021-12-22 08:20:34'),
(16919, 'auguria', 1, '', 'left', '', '', 16917, NULL, NULL, 0, '/societe/list.php?mainmenu=companies&leftmenu=thirdparties', '', 'List', '', 'companies', 1, '$user->rights->societe->lire', '0', 2, '2021-12-22 08:20:53'),
(16920, 'auguria', 1, '', 'left', '', '', 16917, NULL, NULL, 5, '/societe/list.php?mainmenu=companies&type=f&leftmenu=suppliers', '', 'ListSuppliersShort', '', 'suppliers', 1, '$user->rights->societe->lire && $user->rights->fournisseur->lire', '$conf->societe->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled))', 2, '2021-12-22 08:24:08'),
(16921, 'auguria', 1, '', 'left', 'companies', '', 16920, NULL, NULL, 0, '/societe/card.php?mainmenu=companies&amp;leftmenu=supplier&amp;action=create&amp;type=f', '', 'NewSupplier', NULL, 'suppliers', 2, '$user->rights->societe->creer', '$conf->societe->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled))', 2, '2021-12-22 02:36:25'),
(16923, 'auguria', 1, '', 'left', '', '', 16917, NULL, NULL, 3, '/societe/list.php?mainmenu=companies&type=p&leftmenu=prospects', '', 'ListProspectsShort', '', 'companies', 1, '$user->rights->societe->lire', '0', 2, '2021-12-22 08:21:05'),
(16924, 'auguria', 1, '', 'left', 'companies', '', 16923, NULL, NULL, 0, '/societe/card.php?mainmenu=companies&amp;leftmenu=prospects&amp;action=create&amp;type=p', '', 'MenuNewProspect', NULL, 'companies', 2, '$user->rights->societe->creer', '$conf->societe->enabled', 2, '2021-12-22 02:36:25'),
(16926, 'auguria', 1, '', 'left', '', '', 16917, NULL, NULL, 4, '/societe/list.php?mainmenu=companies&type=c&leftmenu=customers', '', 'ListCustomersShort', '', 'companies', 1, '$user->rights->societe->lire', '0', 2, '2021-12-22 08:21:19'),
(16927, 'auguria', 1, '', 'left', 'companies', '', 16926, NULL, NULL, 0, '/societe/card.php?mainmenu=companies&amp;leftmenu=customers&amp;action=create&amp;type=c', '', 'MenuNewCustomer', NULL, 'companies', 2, '$user->rights->societe->creer', '$conf->societe->enabled', 2, '2021-12-22 02:36:25'),
(17017, 'auguria', 1, '', 'left', '', '', 16419, NULL, NULL, 1, '/contact/list.php?mainmenu=companies&leftmenu=contacts&type=f', '', 'ContactsAddresses', '', 'companies', 0, '$user->rights->societe->lire', '$conf->societe->enabled', 2, '2021-12-23 04:13:00'),
(17018, 'auguria', 1, '', 'left', '', '', 17017, NULL, NULL, 0, '/contact/card.php?mainmenu=companies&leftmenu=contacts&action=create&type=f', '', 'NewContactAddress', '', 'companies', 1, '$user->rights->societe->creer', '$conf->societe->enabled', 2, '2021-12-23 04:28:59'),
(17019, 'auguria', 1, '', 'left', 'companies', '', 17017, NULL, NULL, 1, '/contact/list.php?mainmenu=companies&amp;leftmenu=contacts', '', 'List', NULL, 'companies', 1, '$user->rights->societe->lire', '$conf->societe->enabled', 2, '2021-12-22 02:36:25'),
(17021, 'auguria', 1, '', 'left', '', '', 17019, NULL, NULL, 1, '/contact/list.php?mainmenu=companies&leftmenu=contacts&type=p', '', 'ThirdPartyProspects', '', 'companies', 2, '$user->rights->societe->contact->lire', '0', 2, '2021-12-22 08:29:12'),
(17022, 'auguria', 1, '', 'left', '', '', 17019, NULL, NULL, 2, '/contact/list.php?mainmenu=companies&leftmenu=contacts&type=c', '', 'ThirdPartyCustomers', '', 'companies', 2, '$user->rights->societe->contact->lire', '0', 2, '2021-12-22 08:29:28'),
(17023, 'auguria', 1, '', 'left', 'companies', '', 17019, NULL, NULL, 3, '/contact/list.php?mainmenu=companies&amp;leftmenu=contacts&amp;type=f', '', 'ThirdPartySuppliers', NULL, 'companies', 2, '$user->rights->societe->contact->lire', '$conf->societe->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled))', 2, '2021-12-22 02:36:25'),
(17024, 'auguria', 1, '', 'left', 'companies', '', 17019, NULL, NULL, 4, '/contact/list.php?mainmenu=companies&amp;leftmenu=contacts&amp;type=o', '', 'Others', NULL, 'companies', 2, '$user->rights->societe->contact->lire', '$conf->societe->enabled', 2, '2021-12-22 02:36:25'),
(17067, 'auguria', 1, '', 'left', 'companies', 'cat', 16419, NULL, NULL, 3, '/categories/index.php?mainmenu=companies&amp;leftmenu=cat&amp;type=1', '', 'SuppliersCategoriesShort', NULL, 'categories', 0, '$user->rights->categorie->lire', '$conf->societe->enabled && $conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(17068, 'auguria', 1, '', 'left', 'companies', '', 17067, NULL, NULL, 0, '/categories/card.php?mainmenu=companies&amp;action=create&amp;type=1', '', 'NewCategory', NULL, 'categories', 1, '$user->rights->categorie->creer', '$conf->societe->enabled && $conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(17077, 'auguria', 1, '', 'left', '', '', 16419, NULL, NULL, 4, '/categories/index.php?mainmenu=companies&leftmenu=cat&type=2', '', 'CustomersProspectsCategoriesShort', '', 'categories', 0, '$user->rights->categorie->lire', '0', 2, '2021-12-22 08:29:42'),
(17078, 'auguria', 1, '', 'left', 'companies', '', 17077, NULL, NULL, 0, '/categories/card.php?mainmenu=companies&amp;action=create&amp;type=2', '', 'NewCategory', NULL, 'categories', 1, '$user->rights->categorie->creer', '(!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) && $conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(17087, 'auguria', 1, '', 'left', '', '', 16419, NULL, NULL, 3, '/categories/index.php?mainmenu=companies&leftmenu=cat&type=4', '', 'ContactCategoriesShort', '', 'categories', 0, '$user->rights->categorie->lire', '0', 2, '2021-12-22 08:30:04'),
(17088, 'auguria', 1, '', 'left', 'companies', '', 17087, NULL, NULL, 0, '/categories/card.php?mainmenu=companies&amp;action=create&amp;type=4', '', 'NewCategory', NULL, 'categories', 1, '$user->rights->categorie->creer', '$conf->societe->enabled && $conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(17517, 'auguria', 1, '', 'left', '', '', 16422, NULL, NULL, 4, '/comm/propal/index.php?mainmenu=commercial&leftmenu=propals', '', 'CommercialQuotation', '', 'propal', 0, '$user->rights->propale->lire', '$conf->propal->enabled', 2, '2021-12-23 07:43:12'),
(17518, 'auguria', 1, '', 'left', '', '', 17517, NULL, NULL, 0, '/comm/propal/card.php?mainmenu=commercial&action=create&leftmenu=propals', '', 'NewQuotation', '', 'propal', 1, '$user->rights->propale->creer', '$conf->propal->enabled', 2, '2021-12-23 07:39:47'),
(17519, 'auguria', 1, '', 'left', 'commercial', '', 17517, NULL, NULL, 1, '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals', '', 'List', NULL, 'propal', 1, '$user->rights->propale->lire', '$conf->propal->enabled', 2, '2021-12-22 02:36:25'),
(17520, 'auguria', 1, '', 'left', 'commercial', '', 17519, NULL, NULL, 2, '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals&amp;search_status=0', '', 'PropalsDraft', NULL, 'propal', 1, '$user->rights->propale->lire', '$conf->propal->enabled && $leftmenu==\"propals\"', 2, '2021-12-22 02:36:25'),
(17521, 'auguria', 1, '', 'left', 'commercial', '', 17519, NULL, NULL, 3, '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals&amp;search_status=1', '', 'PropalsOpened', NULL, 'propal', 1, '$user->rights->propale->lire', '$conf->propal->enabled && $leftmenu==\"propals\"', 2, '2021-12-22 02:36:25'),
(17522, 'auguria', 1, '', 'left', 'commercial', '', 17519, NULL, NULL, 4, '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals&amp;search_status=2', '', 'PropalStatusSigned', NULL, 'propal', 1, '$user->rights->propale->lire', '$conf->propal->enabled && $leftmenu==\"propals\"', 2, '2021-12-22 02:36:25'),
(17523, 'auguria', 1, '', 'left', 'commercial', '', 17519, NULL, NULL, 5, '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals&amp;search_status=3', '', 'PropalStatusNotSigned', NULL, 'propal', 1, '$user->rights->propale->lire', '$conf->propal->enabled && $leftmenu==\"propals\"', 2, '2021-12-22 02:36:25'),
(17524, 'auguria', 1, '', 'left', 'commercial', '', 17519, NULL, NULL, 6, '/comm/propal/list.php?mainmenu=commercial&amp;leftmenu=propals&amp;search_status=4', '', 'PropalStatusBilled', NULL, 'propal', 1, '$user->rights->propale->lire', '$conf->propal->enabled && $leftmenu==\"propals\"', 2, '2021-12-22 02:36:25'),
(17527, 'auguria', 1, '', 'left', 'commercial', '', 17517, NULL, NULL, 4, '/comm/propal/stats/index.php?mainmenu=commercial&amp;leftmenu=propals', '', 'Statistics', NULL, 'propal', 1, '$user->rights->propale->lire', '$conf->propal->enabled', 2, '2021-12-22 02:36:25'),
(17617, 'auguria', 1, '', 'left', '', '', 16422, NULL, NULL, 5, '/commande/index.php?mainmenu=commercial&leftmenu=orders', '', 'CustomersOrders', '', 'orders', 0, '$user->rights->commande->lire', '$conf->commande->enabled', 2, '2021-12-22 02:44:13'),
(17618, 'auguria', 1, '', 'left', 'commercial', '', 17617, NULL, NULL, 0, '/commande/card.php?mainmenu=commercial&amp;action=create&amp;leftmenu=orders', '', 'NewOrder', NULL, 'orders', 1, '$user->rights->commande->creer', '$conf->commande->enabled', 2, '2021-12-22 02:36:25'),
(17619, 'auguria', 1, '', 'left', 'commercial', '', 17617, NULL, NULL, 1, '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders', '', 'List', NULL, 'orders', 1, '$user->rights->commande->lire', '$conf->commande->enabled', 2, '2021-12-22 02:36:25'),
(17620, 'auguria', 1, '', 'left', 'commercial', '', 17619, NULL, NULL, 2, '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=0', '', 'StatusOrderDraftShort', NULL, 'orders', 1, '$user->rights->commande->lire', '$conf->commande->enabled && $leftmenu==\"orders\"', 2, '2021-12-22 02:36:25'),
(17621, 'auguria', 1, '', 'left', 'commercial', '', 17619, NULL, NULL, 3, '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=1', '', 'StatusOrderValidated', NULL, 'orders', 1, '$user->rights->commande->lire', '$conf->commande->enabled && $leftmenu==\"orders\"', 2, '2021-12-22 02:36:25'),
(17622, 'auguria', 1, '', 'left', 'commercial', '', 17619, NULL, NULL, 4, '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=2', '', 'StatusOrderOnProcessShort', NULL, 'orders', 1, '$user->rights->commande->lire', '$conf->commande->enabled && $leftmenu==\"orders\"', 2, '2021-12-22 02:36:25'),
(17623, 'auguria', 1, '', 'left', 'commercial', '', 17619, NULL, NULL, 5, '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=3', '', 'StatusOrderToBill', NULL, 'orders', 1, '$user->rights->commande->lire', '$conf->commande->enabled && $leftmenu==\"orders\"', 2, '2021-12-22 02:36:25'),
(17624, 'auguria', 1, '', 'left', 'commercial', '', 17619, NULL, NULL, 6, '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=4', '', 'StatusOrderProcessed', NULL, 'orders', 1, '$user->rights->commande->lire', '$conf->commande->enabled && $leftmenu==\"orders\"', 2, '2021-12-22 02:36:25'),
(17625, 'auguria', 1, '', 'left', 'commercial', '', 17619, NULL, NULL, 7, '/commande/list.php?mainmenu=commercial&amp;leftmenu=orders&amp;search_status=-1', '', 'StatusOrderCanceledShort', NULL, 'orders', 1, '$user->rights->commande->lire', '$conf->commande->enabled && $leftmenu==\"orders\"', 2, '2021-12-22 02:36:25'),
(17626, 'auguria', 1, '', 'left', 'commercial', '', 17617, NULL, NULL, 4, '/commande/stats/index.php?mainmenu=commercial&amp;leftmenu=orders', '', 'Statistics', NULL, 'orders', 1, '$user->rights->commande->lire', '$conf->commande->enabled', 2, '2021-12-22 02:36:25'),
(17717, 'auguria', 1, '', 'left', 'commercial', 'sendings', 16420, NULL, NULL, 6, '/expedition/index.php?mainmenu=commercial&amp;leftmenu=sendings', '', 'Shipments', NULL, 'sendings', 0, '$user->rights->expedition->lire', '$conf->expedition->enabled', 2, '2021-12-22 02:36:25'),
(17718, 'auguria', 1, '', 'left', 'commercial', '', 17717, NULL, NULL, 0, '/expedition/card.php?mainmenu=commercial&amp;action=create2&leftmenu=sendings', '', 'NewSending', NULL, 'sendings', 1, '$user->rights->expedition->creer', '$conf->expedition->enabled && $leftmenu==\"sendings\"', 2, '2021-12-22 02:36:25'),
(17719, 'auguria', 1, '', 'left', 'commercial', '', 17717, NULL, NULL, 1, '/expedition/list.php?mainmenu=commercial&amp;leftmenu=sendings', '', 'List', NULL, 'sendings', 1, '$user->rights->expedition->lire', '$conf->expedition->enabled && $leftmenu==\"sendings\"', 2, '2021-12-22 02:36:25'),
(17720, 'auguria', 1, '', 'left', 'commercial', '', 17717, NULL, NULL, 2, '/expedition/stats/index.php?mainmenu=commercial&amp;leftmenu=sendings', '', 'Statistics', NULL, 'sendings', 1, '$user->rights->expedition->lire', '$conf->expedition->enabled && $leftmenu==\"sendings\"', 2, '2021-12-22 02:36:25'),
(17767, 'auguria', 1, '', 'left', 'commercial', 'receptions', 16420, NULL, NULL, 6, '/reception/index.php?mainmenu=commercial&amp;leftmenu=receptions', '', 'Receptions', NULL, 'receptions', 0, '$user->rights->reception->lire', '$conf->reception->enabled', 2, '2021-12-22 02:36:25'),
(17768, 'auguria', 1, '', 'left', 'commercial', '', 17767, NULL, NULL, 0, '/reception/card.php?mainmenu=commercial&amp;action=create2&leftmenu=receptions', '', 'NewSending', NULL, 'receptions', 1, '$user->rights->reception->creer', '$conf->reception->enabled && $leftmenu==\"receptions\"', 2, '2021-12-22 02:36:25'),
(17769, 'auguria', 1, '', 'left', 'commercial', '', 17767, NULL, NULL, 1, '/reception/list.php?mainmenu=commercial&amp;leftmenu=receptions', '', 'List', NULL, 'receptions', 1, '$user->rights->reception->lire', '$conf->reception->enabled && $leftmenu==\"receptions\"', 2, '2021-12-22 02:36:25'),
(17770, 'auguria', 1, '', 'left', 'commercial', '', 17767, NULL, NULL, 2, '/reception/stats/index.php?mainmenu=commercial&amp;leftmenu=receptions', '', 'Statistics', NULL, 'receptions', 1, '$user->rights->reception->lire', '$conf->reception->enabled && $leftmenu==\"receptions\"', 2, '2021-12-22 02:36:25'),
(17817, 'auguria', 1, '', 'left', '', '', 16422, NULL, NULL, 7, '/contrat/index.php?mainmenu=commercial&leftmenu=contracts', '', 'Contracts', '', 'contracts', 0, '$user->rights->contrat->lire', '$conf->contrat->disabled', 2, '2021-12-23 06:29:31'),
(17818, 'auguria', 1, '', 'left', 'commercial', '', 17817, NULL, NULL, 0, '/contrat/card.php?mainmenu=commercial&amp;action=create&amp;leftmenu=contracts', '', 'NewContract', NULL, 'contracts', 1, '$user->rights->contrat->creer', '$conf->contrat->enabled', 2, '2021-12-22 02:36:25'),
(17819, 'auguria', 1, '', 'left', 'commercial', '', 17817, NULL, NULL, 1, '/contrat/list.php?mainmenu=commercial&amp;leftmenu=contracts', '', 'List', NULL, 'contracts', 1, '$user->rights->contrat->lire', '$conf->contrat->enabled', 2, '2021-12-22 02:36:25'),
(17820, 'auguria', 1, '', 'left', 'commercial', '', 17817, NULL, NULL, 2, '/contrat/services_list.php?mainmenu=commercial&amp;leftmenu=contracts', '', 'MenuServices', NULL, 'contracts', 1, '$user->rights->contrat->lire', '$conf->contrat->enabled', 2, '2021-12-22 02:36:25'),
(17821, 'auguria', 1, '', 'left', 'commercial', '', 17820, NULL, NULL, 0, '/contrat/services_list.php?mainmenu=commercial&amp;leftmenu=contracts&amp;mode=0', '', 'MenuInactiveServices', NULL, 'contracts', 2, '$user->rights->contrat->lire', '$conf->contrat->enabled && $leftmenu==\"contracts\"', 2, '2021-12-22 02:36:25'),
(17822, 'auguria', 1, '', 'left', 'commercial', '', 17820, NULL, NULL, 1, '/contrat/services_list.php?mainmenu=commercial&amp;leftmenu=contracts&amp;mode=4', '', 'MenuRunningServices', NULL, 'contracts', 2, '$user->rights->contrat->lire', '$conf->contrat->enabled && $leftmenu==\"contracts\"', 2, '2021-12-22 02:36:25'),
(17823, 'auguria', 1, '', 'left', 'commercial', '', 17820, NULL, NULL, 2, '/contrat/services_list.php?mainmenu=commercial&amp;leftmenu=contracts&amp;mode=4&amp;filter=expired', '', 'MenuExpiredServices', NULL, 'contracts', 2, '$user->rights->contrat->lire', '$conf->contrat->enabled && $leftmenu==\"contracts\"', 2, '2021-12-22 02:36:25'),
(17824, 'auguria', 1, '', 'left', 'commercial', '', 17820, NULL, NULL, 3, '/contrat/services_list.php?mainmenu=commercial&amp;leftmenu=contracts&amp;mode=5', '', 'MenuClosedServices', NULL, 'contracts', 2, '$user->rights->contrat->lire', '$conf->contrat->enabled && $leftmenu==\"contracts\"', 2, '2021-12-22 02:36:25'),
(17917, 'auguria', 1, '', 'left', '', '', 16422, NULL, NULL, 8, '/fichinter/list.php?mainmenu=commercial&leftmenu=ficheinter', '', 'Interventions', '', 'interventions', 0, '$user->rights->ficheinter->lire', '$conf->ficheinter->disabled', 2, '2021-12-23 06:29:54'),
(17918, 'auguria', 1, '', 'left', 'commercial', '', 17917, NULL, NULL, 0, '/fichinter/card.php?mainmenu=commercial&amp;action=create&amp;leftmenu=ficheinter', '', 'NewIntervention', NULL, 'interventions', 1, '$user->rights->ficheinter->creer', '$conf->ficheinter->enabled', 2, '2021-12-22 02:36:25'),
(17919, 'auguria', 1, '', 'left', 'commercial', '', 17917, NULL, NULL, 1, '/fichinter/list.php?mainmenu=commercial&amp;leftmenu=ficheinter', '', 'List', NULL, 'interventions', 1, '$user->rights->ficheinter->lire', '$conf->ficheinter->enabled', 2, '2021-12-22 02:36:25'),
(17920, 'auguria', 1, '', 'left', 'commercial', '', 17917, NULL, NULL, 2, '/fichinter/stats/index.php?mainmenu=commercial&amp;leftmenu=ficheinter', '', 'Statistics', NULL, 'interventions', 1, '$user->rights->ficheinter->lire', '$conf->ficheinter->enabled', 2, '2021-12-22 02:36:25'),
(18017, 'auguria', 1, '', 'left', 'billing', 'supplier_bills', 16423, NULL, NULL, 3, '/fourn/facture/list.php?mainmenu=billing&amp;leftmenu=suppliers_bills', '', 'BillsSuppliers', NULL, 'bills', 0, '$user->rights->fournisseur->facture->lire', '$conf->supplier_invoice->enabled', 2, '2021-12-22 02:36:25'),
(18018, 'auguria', 1, '', 'left', 'billing', '', 18017, NULL, NULL, 0, '/fourn/facture/card.php?mainmenu=billing&amp;action=create&amp;leftmenu=suppliers_bills', '', 'NewBill', NULL, 'bills', 1, '$user->rights->fournisseur->facture->creer', '$conf->supplier_invoice->enabled', 2, '2021-12-22 02:36:25'),
(18019, 'auguria', 1, '', 'left', 'billing', '', 18017, NULL, NULL, 1, '/fourn/facture/list.php?mainmenu=billing&amp;leftmenu=suppliers_bills', '', 'List', NULL, 'bills', 1, '$user->rights->fournisseur->facture->lire', '$conf->supplier_invoice->enabled', 2, '2021-12-22 02:36:25'),
(18020, 'auguria', 1, '', 'left', 'billing', 'suppliers_bills_payment', 18017, NULL, NULL, 2, '/fourn/facture/paiement.php?mainmenu=billing&amp;leftmenu=suppliers_bills_payment', '', 'Payments', NULL, 'bills', 1, '$user->rights->fournisseur->facture->lire', '$conf->supplier_invoice->enabled', 2, '2021-12-22 02:36:25'),
(18021, 'auguria', 1, '', 'left', 'billing', 'customers_bills_stats', 18017, NULL, NULL, 8, '/compta/facture/stats/index.php?mainmenu=billing&amp;leftmenu=customers_bills_stats&mode=supplier', '', 'Statistics', NULL, 'bills', 1, '$user->rights->fournisseur->facture->lire', '$conf->supplier_invoice->enabled', 2, '2021-12-22 02:36:25'),
(18022, 'auguria', 1, '', 'left', 'billing', 'suppliers_bills_reports', 18020, NULL, NULL, 1, '/fourn/facture/rapport.php?mainmenu=billing&amp;leftmenu=suppliers_bills_reports', '', 'Reporting', NULL, 'bills', 2, '$user->rights->fournisseur->facture->lire', '$conf->supplier_invoice->enabled', 2, '2021-12-22 02:36:25'),
(18067, 'auguria', 1, '', 'left', 'commercial', 'propals_supplier', 16420, NULL, NULL, 4, '/supplier_proposal/index.php?leftmenu=propals_supplier', '', 'SupplierProposalsShort', NULL, 'supplier_proposal', 0, '$user->rights->supplier_proposal->lire', '$conf->supplier_proposal->enabled', 2, '2021-12-22 02:36:25'),
(18068, 'auguria', 1, '', 'left', 'commercial', '', 18067, NULL, NULL, 0, '/supplier_proposal/card.php?action=create&amp;leftmenu=supplier_proposals', '', 'SupplierProposalNew', NULL, 'supplier_proposal', 1, '$user->rights->supplier_proposal->creer', '$conf->supplier_proposal->enabled', 2, '2021-12-22 02:36:25'),
(18069, 'auguria', 1, '', 'left', 'commercial', '', 18067, NULL, NULL, 1, '/supplier_proposal/list.php?leftmenu=supplier_proposals', '', 'List', NULL, 'supplier_proposal', 1, '$user->rights->supplier_proposal->lire', '$conf->supplier_proposal->enabled', 2, '2021-12-22 02:36:25'),
(18070, 'auguria', 1, '', 'left', 'commercial', '', 18067, NULL, NULL, 2, '/comm/propal/stats/index.php?leftmenu=supplier_proposals&amp;mode=supplier', '', 'Statistics', NULL, 'supplier_proposal', 1, '$user->rights->supplier_proposal->lire', '$conf->supplier_proposal->enabled', 2, '2021-12-22 02:36:25'),
(18117, 'auguria', 1, '', 'left', 'billing', 'customer_bills', 16423, NULL, NULL, 3, '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills', '', 'BillsCustomers', NULL, 'bills', 0, '$user->rights->facture->lire', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18118, 'auguria', 1, '', 'left', 'billing', '', 18117, NULL, NULL, 3, '/compta/facture/card.php?mainmenu=billing&amp;action=create&amp;leftmenu=customers_bills', '', 'NewBill', NULL, 'bills', 1, '$user->rights->facture->creer', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18119, 'auguria', 1, '', 'left', 'billing', '', 18117, NULL, NULL, 5, '/compta/facture/invoicetemplate_list.php?mainmenu=billing&amp;leftmenu=customers_bills', '', 'ListOfTemplates', NULL, 'bills', 1, '$user->rights->facture->lire', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18121, 'auguria', 1, '', 'left', 'billing', 'customers_bills_payment', 18117, NULL, NULL, 6, '/compta/paiement/list.php?mainmenu=billing&amp;leftmenu=customers_bills_payment', '', 'Payments', NULL, 'bills', 1, '$user->rights->facture->lire', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18122, 'auguria', 1, '', 'left', 'billing', '', 18117, NULL, NULL, 4, '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills', '', 'List', NULL, 'bills', 1, '$user->rights->facture->lire', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18127, 'auguria', 1, '', 'left', 'billing', 'customers_bills_reports', 18121, NULL, NULL, 1, '/compta/paiement/rapport.php?mainmenu=billing&amp;leftmenu=customers_bills_reports', '', 'Reportings', NULL, 'bills', 2, '$user->rights->facture->lire', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18128, 'auguria', 1, '', 'left', 'accountancy', 'checks', 16431, NULL, NULL, 9, '/compta/paiement/cheque/index.php?mainmenu=bank&amp;leftmenu=checks', '', 'MenuChequeDeposits', NULL, 'bills', 0, '$user->rights->banque->lire', 'empty($conf->global->BANK_DISABLE_CHECK_DEPOSIT) && ! empty($conf->banque->enabled) && (! empty($conf->facture->enabled) || ! empty($conf->global->MAIN_MENU_CHEQUE_DEPOSIT_ON))', 2, '2021-12-22 02:36:25'),
(18129, 'auguria', 1, '', 'left', 'accountancy', '', 18128, NULL, NULL, 0, '/compta/paiement/cheque/card.php?mainmenu=bank&amp;leftmenu=checks&amp;action=new', '', 'NewCheckDeposit', NULL, 'compta', 1, '$user->rights->banque->lire', 'empty($conf->global->BANK_DISABLE_CHECK_DEPOSIT) && ! empty($conf->banque->enabled) && (! empty($conf->facture->enabled) || ! empty($conf->global->MAIN_MENU_CHEQUE_DEPOSIT_ON))', 2, '2021-12-22 02:36:25'),
(18130, 'auguria', 1, '', 'left', 'accountancy', '', 18128, NULL, NULL, 1, '/compta/paiement/cheque/list.php?mainmenu=bank&amp;leftmenu=checks', '', 'List', NULL, 'bills', 1, '$user->rights->banque->lire', 'empty($conf->global->BANK_DISABLE_CHECK_DEPOSIT) && ! empty($conf->banque->enabled) && (! empty($conf->facture->enabled) || ! empty($conf->global->MAIN_MENU_CHEQUE_DEPOSIT_ON))', 2, '2021-12-22 02:36:25'),
(18131, 'auguria', 1, '', 'left', 'billing', 'customers_bills_stats', 18117, NULL, NULL, 8, '/compta/facture/stats/index.php?mainmenu=billing&amp;leftmenu=customers_bills_stats', '', 'Statistics', NULL, 'bills', 1, '$user->rights->facture->lire', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18137, 'auguria', 1, '', 'left', 'billing', '', 18122, NULL, NULL, 1, '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills_draft&amp;search_status=0', '', 'BillShortStatusDraft', NULL, 'bills', 2, '$user->rights->facture->lire', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18138, 'auguria', 1, '', 'left', 'billing', '', 18122, NULL, NULL, 2, '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills_notpaid&amp;search_status=1', '', 'BillShortStatusNotPaid', NULL, 'bills', 2, '$user->rights->facture->lire', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18139, 'auguria', 1, '', 'left', 'billing', '', 18122, NULL, NULL, 3, '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills_paid&amp;search_status=2', '', 'BillShortStatusPaid', NULL, 'bills', 2, '$user->rights->facture->lire', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18140, 'auguria', 1, '', 'left', 'billing', '', 18122, NULL, NULL, 4, '/compta/facture/list.php?mainmenu=billing&amp;leftmenu=customers_bills_canceled&amp;search_status=3', '', 'BillShortStatusCanceled', NULL, 'bills', 2, '$user->rights->facture->lire', '$conf->facture->enabled', 2, '2021-12-22 02:36:25'),
(18317, 'auguria', 1, '', 'left', 'billing', 'orders', 16423, NULL, NULL, 3, '/commande/list.php?mainmenu=billing&amp;leftmenu=orders&amp;search_status=3', '', 'MenuOrdersToBill', NULL, 'orders', 0, '$user->rights->commande->lire', '$conf->commande->enabled', 0, '2021-12-22 02:36:25'),
(18417, 'auguria', 1, '', 'left', 'billing', 'donations', 16423, NULL, NULL, 4, '/don/index.php?mainmenu=billing&amp;leftmenu=donations', '', 'Donations', NULL, 'donations', 0, '$user->rights->don->lire', '$conf->don->enabled', 2, '2021-12-22 02:36:25'),
(18418, 'auguria', 1, '', 'left', 'billing', '', 18417, NULL, NULL, 0, '/don/card.php?mainmenu=billing&amp;leftmenu=donations&amp;action=create', '', 'NewDonation', NULL, 'donations', 1, '$user->rights->don->creer', '$conf->don->enabled && $leftmenu==\"donations\"', 2, '2021-12-22 02:36:25'),
(18419, 'auguria', 1, '', 'left', 'billing', '', 18417, NULL, NULL, 1, '/don/list.php?mainmenu=billing&amp;leftmenu=donations', '', 'List', NULL, 'donations', 1, '$user->rights->don->lire', '$conf->don->enabled && $leftmenu==\"donations\"', 2, '2021-12-22 02:36:25'),
(18517, 'auguria', 1, '', 'left', 'accountancy', 'tripsandexpenses', 16432, NULL, NULL, 5, '/compta/deplacement/index.php?mainmenu=accountancy&amp;leftmenu=tripsandexpenses', '', 'TripsAndExpenses', NULL, 'trips', 0, '$user->rights->deplacement->lire', '$conf->deplacement->enabled', 0, '2021-12-22 02:36:26'),
(18518, 'auguria', 1, '', 'left', 'accountancy', '', 18517, NULL, NULL, 1, '/compta/deplacement/card.php?mainmenu=accountancy&amp;action=create&amp;leftmenu=tripsandexpenses', '', 'New', NULL, 'trips', 1, '$user->rights->deplacement->creer', '$conf->deplacement->enabled', 0, '2021-12-22 02:36:26'),
(18519, 'auguria', 1, '', 'left', 'accountancy', '', 18517, NULL, NULL, 2, '/compta/deplacement/list.php?mainmenu=accountancy&amp;leftmenu=tripsandexpenses', '', 'List', NULL, 'trips', 1, '$user->rights->deplacement->lire', '$conf->deplacement->enabled', 0, '2021-12-22 02:36:26'),
(18520, 'auguria', 1, '', 'left', 'accountancy', '', 18517, NULL, NULL, 2, '/compta/deplacement/stats/index.php?mainmenu=accountancy&amp;leftmenu=tripsandexpenses', '', 'Statistics', NULL, 'trips', 1, '$user->rights->deplacement->lire', '$conf->deplacement->enabled', 0, '2021-12-22 02:36:26'),
(18617, 'auguria', 1, '', 'left', 'billing', 'tax', 16423, NULL, NULL, 6, '/compta/charges/index.php?mainmenu=billing&amp;leftmenu=tax', '', 'MenuTaxesAndSpecialExpenses', NULL, 'compta', 0, '(! empty($conf->tax->enabled) && $user->rights->tax->charges->lire) || (! empty($conf->salaries->enabled) && ! empty($user->rights->salaries->read)) || (! empty($conf->loan->enabled) && $user->rights->loan->read) || (! empty($conf->banque->enabled) && $user->rights->banque->lire)', '$conf->tax->enabled || $conf->salaries->enabled || $conf->loan->enabled || $conf->banque->enabled', 0, '2021-12-22 02:36:25'),
(18627, 'auguria', 1, '', 'left', 'billing', 'tax_sal', 16423, NULL, NULL, 10, '/salaries/list.php?mainmenu=billing&amp;leftmenu=tax_salary', '', 'Salaries', NULL, 'salaries', 0, '$user->rights->salaries->read', '$conf->salaries->enabled', 0, '2021-12-22 02:36:25'),
(18628, 'auguria', 1, '', 'left', 'billing', '', 18627, NULL, NULL, 2, '/salaries/card.php?mainmenu=billing&amp;leftmenu=tax_salary&amp;action=create', '', 'NewPayment', NULL, 'companies', 1, '$user->rights->salaries->write', '$conf->salaries->enabled && $leftmenu==\"tax_salary\"', 0, '2021-12-22 02:36:25'),
(18629, 'auguria', 1, '', 'left', 'billing', '', 18627, NULL, NULL, 3, '/salaries/list.php?mainmenu=billing&amp;leftmenu=tax_salary', '', 'Payments', NULL, 'companies', 1, '$user->rights->salaries->read', '$conf->salaries->enabled && $leftmenu==\"tax_salary\"', 0, '2021-12-22 02:36:25'),
(18630, 'auguria', 1, '', 'left', 'billing', '', 18627, NULL, NULL, 4, '/salaries/stats/index.php?mainmenu=billing&amp;leftmenu=tax_salary', '', 'Statistics', NULL, 'companies', 1, '$user->rights->salaries->read', '$conf->salaries->enabled && $leftmenu==\"tax_salary\"', 0, '2021-12-22 02:36:25'),
(18637, 'auguria', 1, '', 'left', 'billing', 'tax_loan', 16423, NULL, NULL, 20, '/loan/list.php?mainmenu=billing&amp;leftmenu=tax_loan', '', 'Loans', NULL, 'loan', 0, '$user->rights->loan->read', '$conf->loan->enabled', 0, '2021-12-22 02:36:25'),
(18638, 'auguria', 1, '', 'left', 'billing', '', 18637, NULL, NULL, 2, '/loan/card.php?mainmenu=billing&amp;leftmenu=tax_loan&amp;action=create', '', 'NewLoan', NULL, 'loan', 1, '$user->rights->loan->write', '$conf->loan->enabled && $leftmenu==\"tax_loan\"', 0, '2021-12-22 02:36:25'),
(18640, 'auguria', 1, '', 'left', 'billing', '', 18637, NULL, NULL, 4, '/loan/calc.php?mainmenu=billing&amp;leftmenu=tax_loan', '', 'Calculator', NULL, 'companies', 1, '$user->rights->loan->calc', '$conf->loan->enabled && $leftmenu==\"tax_loan\" && ! empty($conf->global->LOAN_SHOW_CALCULATOR)', 0, '2021-12-22 02:36:25'),
(18667, 'auguria', 1, '', 'left', 'billing', 'tax_social', 18617, NULL, NULL, 1, '/compta/sociales/list.php?mainmenu=billing&amp;leftmenu=tax_social', '', 'SocialContributions', NULL, '', 1, '$user->rights->tax->charges->lire', '$conf->tax->enabled', 0, '2021-12-22 02:36:25'),
(18668, 'auguria', 1, '', 'left', 'billing', '', 18667, NULL, NULL, 2, '/compta/sociales/card.php?mainmenu=billing&amp;leftmenu=tax_social&amp;action=create', '', 'MenuNewSocialContribution', NULL, '', 2, '$user->rights->tax->charges->creer', '$conf->tax->enabled && $leftmenu==\"tax_social\"', 0, '2021-12-22 02:36:25'),
(18669, 'auguria', 1, '', 'left', 'billing', '', 18667, NULL, NULL, 3, '/compta/sociales/payments.php?mainmenu=billing&amp;leftmenu=tax_social', '', 'Payments', NULL, '', 2, '$user->rights->tax->charges->lire', '$conf->tax->enabled && $leftmenu==\"tax_social\"', 0, '2021-12-22 02:36:25'),
(18717, 'auguria', 1, '', 'left', 'billing', 'tax_vat', 18617, NULL, NULL, 7, '/compta/tva/list.php?mainmenu=billing&amp;leftmenu=tax_vat', '', 'VAT', NULL, 'companies', 1, '$user->rights->tax->charges->lire', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS)', 0, '2021-12-22 02:36:25'),
(18718, 'auguria', 1, '', 'left', 'billing', '', 18717, NULL, NULL, 0, '/compta/tva/card.php?mainmenu=billing&amp;leftmenu=tax_vat&amp;action=create', '', 'New', NULL, 'companies', 2, '$user->rights->tax->charges->creer', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS) && $leftmenu==\"tax_vat\"', 0, '2021-12-22 02:36:25'),
(18719, 'auguria', 1, '', 'left', 'billing', '', 18717, NULL, NULL, 1, '/compta/tva/list.php?mainmenu=billing&amp;leftmenu=tax_vat', '', 'List', NULL, 'companies', 2, '$user->rights->tax->charges->lire', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS) && $leftmenu==\"tax_vat\"', 0, '2021-12-22 02:36:25'),
(18720, 'auguria', 1, '', 'left', 'billing', '', 18717, NULL, NULL, 2, '/compta/tva/index.php?mainmenu=billing&amp;leftmenu=tax_vat', '', 'ReportByMonth', NULL, 'companies', 2, '$user->rights->tax->charges->lire', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS) && $leftmenu==\"tax_vat\"', 0, '2021-12-22 02:36:25'),
(18721, 'auguria', 1, '', 'left', 'billing', '', 18717, NULL, NULL, 3, '/compta/tva/clients.php?mainmenu=billing&amp;leftmenu=tax_vat', '', 'ReportByThirdparties', NULL, 'companies', 2, '$user->rights->tax->charges->lire', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS) && $leftmenu==\"tax_vat\"', 0, '2021-12-22 02:36:25'),
(18722, 'auguria', 1, '', 'left', 'billing', '', 18717, NULL, NULL, 4, '/compta/tva/quadri_detail.php?mainmenu=billing&amp;leftmenu=tax_vat', '', 'ReportByQuarter', NULL, 'companies', 2, '$user->rights->tax->charges->lire', '$conf->tax->enabled && empty($conf->global->TAX_DISABLE_VAT_MENUS) && $leftmenu==\"tax_vat\"', 0, '2021-12-22 02:36:25'),
(18767, 'auguria', 1, '', 'left', 'billing', 'tax_various', 16423, NULL, NULL, 30, '/compta/bank/various_payment/list.php?mainmenu=billing&amp;leftmenu=tax_various', '', 'MenuVariousPayment', NULL, 'banks', 0, '$user->rights->banque->lire', '$conf->banque->enabled && empty($conf->global->BANK_USE_OLD_VARIOUS_PAYMENT)', 0, '2021-12-22 02:36:25');
INSERT INTO `erp_menu` (`rowid`, `menu_handler`, `entity`, `module`, `type`, `mainmenu`, `leftmenu`, `fk_menu`, `fk_mainmenu`, `fk_leftmenu`, `position`, `url`, `target`, `titre`, `prefix`, `langs`, `level`, `perms`, `enabled`, `usertype`, `tms`) VALUES
(18768, 'auguria', 1, '', 'left', 'billing', '', 18767, NULL, NULL, 2, '/compta/bank/various_payment/card.php?mainmenu=billing&amp;leftmenu=tax_various&amp;action=create', '', 'New', NULL, 'various_payment', 1, '$user->rights->banque->modifier', '$conf->banque->enabled && $leftmenu==\"tax_various\"', 0, '2021-12-22 02:36:25'),
(18769, 'auguria', 1, '', 'left', 'billing', '', 18767, NULL, NULL, 3, '/compta/bank/various_payment/list.php?mainmenu=billing&amp;leftmenu=tax_various', '', 'List', NULL, 'various_payment', 1, '$user->rights->banque->lire', '$conf->banque->enabled && $leftmenu==\"tax_various\"', 0, '2021-12-22 02:36:25'),
(18817, 'auguria', 1, '', 'left', 'accountancy', 'accountancy', 16426, NULL, NULL, 7, '/accountancy/index.php?mainmenu=accountancy&amp;leftmenu=accountancy', '', 'MenuAccountancy', NULL, 'main', 0, '! empty($conf->accounting->enabled) || $user->rights->accounting->bind->write || $user->rights->accounting->bind->write || $user->rights->compta->resultat->lire', '$conf->accounting->enabled', 0, '2021-12-22 02:36:25'),
(18818, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_dispatch_customer', 18817, NULL, NULL, 2, '/accountancy/customer/index.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_customer', '', 'CustomersVentilation', NULL, 'accountancy', 1, '$user->rights->accounting->bind->write', '$conf->accounting->enabled && $conf->facture->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_SALES)', 0, '2021-12-22 02:36:25'),
(18819, 'auguria', 1, '', 'left', 'accountancy', '', 18818, NULL, NULL, 3, '/accountancy/customer/list.php?mainmenu=accountancy', '', 'ToDispatch', NULL, 'accountancy', 2, '$user->rights->accounting->bind->write', '$conf->accounting->enabled && $conf->facture->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_SALES) && $leftmenu==\"accountancy_dispatch_customer\"', 0, '2021-12-22 02:36:25'),
(18820, 'auguria', 1, '', 'left', 'accountancy', '', 18818, NULL, NULL, 4, '/accountancy/customer/lines.php?mainmenu=accountancy', '', 'Dispatched', NULL, 'accountancy', 2, '$user->rights->accounting->bind->write', '$conf->accounting->enabled && $conf->facture->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_SALES) && $leftmenu==\"accountancy_dispatch_customer\"', 0, '2021-12-22 02:36:25'),
(18827, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_dispatch_supplier', 18817, NULL, NULL, 5, '/accountancy/supplier/index.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_supplier', '', 'SuppliersVentilation', NULL, 'accountancy', 1, '$user->rights->accounting->bind->write', '$conf->accounting->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_invoice->enabled)) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_PURCHASES)', 0, '2021-12-22 02:36:25'),
(18828, 'auguria', 1, '', 'left', 'accountancy', '', 18827, NULL, NULL, 6, '/accountancy/supplier/list.php?mainmenu=accountancy', '', 'ToDispatch', NULL, 'accountancy', 2, '$user->rights->accounting->bind->write', '$conf->accounting->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_invoice->enabled)) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_PURCHASES) && $leftmenu==\"accountancy_dispatch_supplier\"', 0, '2021-12-22 02:36:25'),
(18829, 'auguria', 1, '', 'left', 'accountancy', '', 18827, NULL, NULL, 7, '/accountancy/supplier/lines.php?mainmenu=accountancy', '', 'Dispatched', NULL, 'accountancy', 2, '$user->rights->accounting->bind->write', '$conf->accounting->enabled && (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_invoice->enabled)) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_PURCHASES) && $leftmenu==\"accountancy_dispatch_supplier\"', 0, '2021-12-22 02:36:25'),
(18837, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_dispatch_expensereport', 18817, NULL, NULL, 5, '/accountancy/expensereport/index.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_expensereport', '', 'ExpenseReportsVentilation', NULL, 'accountancy', 1, '$user->rights->accounting->bind->write', '$conf->accounting->enabled && $conf->expensereport->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_EXPENSEREPORTS)', 0, '2021-12-22 02:36:25'),
(18838, 'auguria', 1, '', 'left', 'accountancy', '', 18837, NULL, NULL, 6, '/accountancy/expensereport/list.php?mainmenu=accountancy', '', 'ToDispatch', NULL, 'accountancy', 2, '$user->rights->accounting->bind->write', '$conf->accounting->enabled && $conf->expensereport->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_EXPENSEREPORTS) && $leftmenu==\"accountancy_dispatch_expensereport\"', 0, '2021-12-22 02:36:25'),
(18839, 'auguria', 1, '', 'left', 'accountancy', '', 18837, NULL, NULL, 7, '/accountancy/expensereport/lines.php?mainmenu=accountancy', '', 'Dispatched', NULL, 'accountancy', 2, '$user->rights->accounting->bind->write', '$conf->accounting->enabled && $conf->expensereport->enabled && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_EXPENSEREPORTS) && $leftmenu==\"accountancy_dispatch_expensereport\"', 0, '2021-12-22 02:36:25'),
(18847, 'auguria', 1, '', 'left', 'accountancy', 'balance', 18817, NULL, NULL, 10, '/accountancy/bookkeeping/balance.php?mainmenu=accountancy&leftmenu=accountancy_balance', '', 'AccountBalance', NULL, 'accountancy', 1, '$user->rights->accounting->mouvements->lire', '$conf->accounting->enabled', 0, '2021-12-22 02:36:25'),
(18849, 'auguria', 1, '', 'left', 'accountancy', 'bookkeeping', 18817, NULL, NULL, 12, '/accountancy/bookkeeping/listbyaccount.php?mainmenu=accountancy&leftmenu=accountancy_bookeeping', '', 'Bookkeeping', NULL, 'accountancy', 1, '$user->rights->accounting->mouvements->lire', '$conf->accounting->enabled', 0, '2021-12-22 02:36:25'),
(18851, 'auguria', 1, '', 'left', 'accountancy', 'bookkeeping', 18817, NULL, NULL, 15, '/accountancy/bookkeeping/list.php?mainmenu=accountancy&leftmenu=accountancy_bookeeping', '', 'Journals', NULL, 'accountancy', 1, '$user->rights->accounting->mouvements->lire', '$conf->accounting->enabled', 0, '2021-12-22 02:36:25'),
(18853, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_files', 18817, NULL, NULL, 16, '/compta/accounting-files.php?mainmenu=accountancy&leftmenu=accountancy_files', '', 'AccountantFiles', NULL, 'accountancy', 1, '$user->rights->compta->resultat->lire || $user->rights->accounting->mouvements->lire', '$conf->comptabilite->enabled || $conf->accounting->enabled', 0, '2021-12-22 02:36:25'),
(18854, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_closure', 18817, NULL, NULL, 17, '/accountancy/closure/index.php?mainmenu=accountancy&leftmenu=accountancy_closure', '', 'MenuAccountancyClosure', NULL, 'accountancy', 1, '$user->rights->accounting->fiscalyear->write', '$conf->accounting->enabled', 0, '2021-12-22 02:36:25'),
(18857, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_report', 18817, NULL, NULL, 17, '/compta/resultat/index.php?mainmenu=accountancy&leftmenu=accountancy_report', '', 'Reportings', NULL, 'main', 1, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->accounting->enabled', 0, '2021-12-22 02:36:25'),
(18858, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_report', 18857, NULL, NULL, 18, '/compta/resultat/index.php?mainmenu=accountancy&leftmenu=accountancy_report', '', 'MenuReportInOut', NULL, 'main', 2, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->accounting->enabled && $leftmenu==\"accountancy_report\"', 0, '2021-12-22 02:36:25'),
(18859, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_report', 18858, NULL, NULL, 20, '/compta/resultat/result.php?mainmenu=accountancy&leftmenu=accountancy_report', '', 'ByPersonalizedAccountGroups', NULL, 'main', 3, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->accounting->enabled && $leftmenu==\"accountancy_report\"', 0, '2021-12-22 02:36:25'),
(18860, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_report', 18858, NULL, NULL, 19, '/compta/resultat/clientfourn.php?mainmenu=accountancy&leftmenu=accountancy_report', '', 'ByPredefinedAccountGroups', NULL, 'main', 3, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->accounting->enabled && $leftmenu==\"accountancy_report\"', 0, '2021-12-22 02:36:25'),
(18861, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_report', 18857, NULL, NULL, 21, '/compta/stats/index.php?mainmenu=accountancy&leftmenu=accountancy_report', '', 'ReportTurnover', NULL, 'main', 2, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->accounting->enabled && $leftmenu==\"accountancy_report\"', 0, '2021-12-22 02:36:25'),
(18862, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_report', 18861, NULL, NULL, 22, '/compta/stats/casoc.php?mainmenu=accountancy&leftmenu=accountancy_report', '', 'ByCompanies', NULL, 'main', 3, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->accounting->enabled && $leftmenu==\"accountancy_report\"', 0, '2021-12-22 02:36:25'),
(18863, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_report', 18861, NULL, NULL, 23, '/compta/stats/cabyuser.php?mainmenu=accountancy&leftmenu=accountancy_report', '', 'ByUsers', NULL, 'main', 3, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->accounting->enabled && $leftmenu==\"accountancy_report\"', 0, '2021-12-22 02:36:25'),
(18864, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_report', 18861, NULL, NULL, 24, '/compta/stats/cabyprodserv.php?mainmenu=accountancy&leftmenu=accountancy_report', '', 'ByProductsAndServices', NULL, 'main', 3, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->accounting->enabled && $leftmenu==\"accountancy_report\"', 0, '2021-12-22 02:36:25'),
(18867, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_period', 18868, NULL, NULL, 80, '/accountancy/admin/fiscalyear.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'FiscalPeriod', NULL, 'admin', 1, '', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\" && $conf->global->MAIN_FEATURES_LEVEL > 0', 2, '2021-12-22 02:36:25'),
(18868, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin', 18817, NULL, NULL, 1, '/accountancy/index.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'Setup', NULL, 'accountancy', 1, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled', 0, '2021-12-22 02:36:25'),
(18870, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_general', 18868, NULL, NULL, 10, '/accountancy/admin/index.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'General', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18871, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_journal', 18868, NULL, NULL, 20, '/accountancy/admin/journals_list.php?id=35&mainmenu=accountancy&leftmenu=accountancy_admin', '', 'AccountingJournals', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18872, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_chartmodel', 18868, NULL, NULL, 30, '/accountancy/admin/account.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'Pcg_version', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18873, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_chart', 18868, NULL, NULL, 40, '/accountancy/admin/account.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'Chartofaccounts', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18874, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_chartsubledger', 18868, NULL, NULL, 41, '/accountancy/admin/subaccount.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'ChartOfSubaccounts', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18875, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_chart_group', 18868, NULL, NULL, 45, '/accountancy/admin/categories_list.php?id=32&mainmenu=accountancy&leftmenu=accountancy_admin', '', 'AccountingCategory', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18876, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_default', 18868, NULL, NULL, 50, '/accountancy/admin/defaultaccounts.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'MenuDefaultAccounts', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18877, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_vat', 18868, NULL, NULL, 51, '/compta/bank/list.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'MenuBankAccounts', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18878, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_vat', 18868, NULL, NULL, 52, '/admin/dict.php?id=10&from=accountancy&search_country_id=__MYCOUNTRYID__&mainmenu=accountancy&leftmenu=accountancy_admin', '', 'MenuVatAccounts', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18879, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_tax', 18868, NULL, NULL, 53, '/admin/dict.php?id=7&from=accountancy&search_country_id=__MYCOUNTRYID__&mainmenu=accountancy&leftmenu=accountancy_admin', '', 'MenuTaxAccounts', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18880, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_expensereport', 18868, NULL, NULL, 54, '/admin/dict.php?id=17&from=accountancy&mainmenu=accountancy&leftmenu=accountancy_admin', '', 'MenuExpenseReportAccounts', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $conf->expensereport->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18881, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_product', 18868, NULL, NULL, 55, '/accountancy/admin/productaccount.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'MenuProductsAccounts', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18882, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_export', 18868, NULL, NULL, 60, '/accountancy/admin/export.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'ExportOptions', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\"', 0, '2021-12-22 02:36:25'),
(18883, 'auguria', 1, '', 'left', 'accountancy', 'accountancy_admin_closure', 18868, NULL, NULL, 70, '/accountancy/admin/closure.php?mainmenu=accountancy&leftmenu=accountancy_admin', '', 'MenuClosureAccounts', NULL, 'accountancy', 2, '$user->rights->accounting->chartofaccount', '$conf->accounting->enabled && $leftmenu==\"accountancy_admin\" && $conf->global->MAIN_FEATURES_LEVEL > 1', 0, '2021-12-22 02:36:25'),
(18917, 'auguria', 1, '', 'left', 'accountancy', 'withdraw', 16431, NULL, NULL, 9, '/compta/prelevement/index.php?mainmenu=bank&amp;leftmenu=withdraw', '', 'PaymentByDirectDebit', NULL, 'withdrawals', 0, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled', 2, '2021-12-22 02:36:25'),
(18919, 'auguria', 1, '', 'left', 'accountancy', '', 18917, NULL, NULL, 0, '/compta/prelevement/create.php?mainmenu=bank&amp;leftmenu=withdraw', '', 'NewStandingOrder', NULL, 'withdrawals', 1, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled && $leftmenu==\"withdraw\"', 2, '2021-12-22 02:36:25'),
(18920, 'auguria', 1, '', 'left', 'accountancy', '', 18917, NULL, NULL, 2, '/compta/prelevement/orders_list.php?mainmenu=bank&amp;leftmenu=withdraw', '', 'WithdrawalsReceipts', NULL, 'withdrawals', 1, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled && $leftmenu==\"withdraw\"', 2, '2021-12-22 02:36:25'),
(18921, 'auguria', 1, '', 'left', 'accountancy', '', 18917, NULL, NULL, 3, '/compta/prelevement/list.php?mainmenu=bank&amp;leftmenu=withdraw', '', 'WithdrawalsLines', NULL, 'withdrawals', 1, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled && $leftmenu==\"withdraw\"', 2, '2021-12-22 02:36:25'),
(18923, 'auguria', 1, '', 'left', 'accountancy', '', 18917, NULL, NULL, 5, '/compta/prelevement/rejets.php?mainmenu=bank&amp;leftmenu=withdraw', '', 'Rejects', NULL, 'withdrawals', 1, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled && $leftmenu==\"withdraw\"', 2, '2021-12-22 02:36:25'),
(18924, 'auguria', 1, '', 'left', 'accountancy', '', 18917, NULL, NULL, 6, '/compta/prelevement/stats.php?mainmenu=bank&amp;leftmenu=withdraw', '', 'Statistics', NULL, 'withdrawals', 1, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled && $leftmenu==\"withdraw\"', 2, '2021-12-22 02:36:25'),
(18927, 'auguria', 1, '', 'left', 'accountancy', 'banktransfer', 16431, NULL, NULL, 9, '/compta/prelevement/index.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer', '', 'PaymentByBankTransfer', NULL, 'withdrawals', 0, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled', 2, '2021-12-22 02:36:25'),
(18929, 'auguria', 1, '', 'left', 'accountancy', '', 18927, NULL, NULL, 0, '/compta/prelevement/create.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer', '', 'NewStandingOrder', NULL, 'withdrawals', 1, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled && $leftmenu==\"banktransfer\"', 2, '2021-12-22 02:36:25'),
(18930, 'auguria', 1, '', 'left', 'accountancy', '', 18927, NULL, NULL, 2, '/compta/prelevement/orders_list.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer', '', 'WithdrawalsReceipts', NULL, 'withdrawals', 1, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled && $leftmenu==\"banktransfer\"', 2, '2021-12-22 02:36:25'),
(18931, 'auguria', 1, '', 'left', 'accountancy', '', 18927, NULL, NULL, 3, '/compta/prelevement/list.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer', '', 'WithdrawalsLines', NULL, 'withdrawals', 1, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled && $leftmenu==\"banktransfer\"', 2, '2021-12-22 02:36:25'),
(18933, 'auguria', 1, '', 'left', 'accountancy', '', 18927, NULL, NULL, 5, '/compta/prelevement/rejets.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer', '', 'Rejects', NULL, 'withdrawals', 1, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled && $leftmenu==\"banktransfer\"', 2, '2021-12-22 02:36:25'),
(18934, 'auguria', 1, '', 'left', 'accountancy', '', 18927, NULL, NULL, 6, '/compta/prelevement/stats.php?mainmenu=bank&amp;leftmenu=banktransfer&amp;type=bank-transfer', '', 'Statistics', NULL, 'withdrawals', 1, '$user->rights->prelevement->bons->lire', '$conf->prelevement->enabled && $leftmenu==\"banktransfer\"', 2, '2021-12-22 02:36:25'),
(19017, 'auguria', 1, '', 'left', 'accountancy', 'bank', 16431, NULL, NULL, 1, '/compta/bank/list.php?mainmenu=bank&amp;leftmenu=bank', '', 'MenuBankCash', NULL, 'banks', 0, '$user->rights->banque->lire', '$conf->banque->enabled', 0, '2021-12-22 02:36:25'),
(19018, 'auguria', 1, '', 'left', 'accountancy', '', 19017, NULL, NULL, 0, '/compta/bank/card.php?mainmenu=bank&amp;action=create&amp;leftmenu=bank', '', 'MenuNewFinancialAccount', NULL, 'banks', 1, '$user->rights->banque->configurer', '$conf->banque->enabled && ($leftmenu==\"bank\" || $leftmenu==\"checks\" || $leftmenu==\"withdraw\")', 0, '2021-12-22 02:36:25'),
(19020, 'auguria', 1, '', 'left', 'accountancy', '', 19017, NULL, NULL, 2, '/compta/bank/bankentries_list.php?mainmenu=bank&amp;leftmenu=bank', '', 'ListTransactions', NULL, 'banks', 1, '$user->rights->banque->lire', '$conf->banque->enabled && ($leftmenu==\"bank\" || $leftmenu==\"checks\" || $leftmenu==\"withdraw\")', 0, '2021-12-22 02:36:25'),
(19021, 'auguria', 1, '', 'left', 'accountancy', '', 19017, NULL, NULL, 3, '/compta/bank/budget.php?mainmenu=bank&amp;leftmenu=bank', '', 'ListTransactionsByCategory', NULL, 'banks', 1, '$user->rights->banque->lire', '$conf->banque->enabled && ($leftmenu==\"bank\" || $leftmenu==\"checks\" || $leftmenu==\"withdraw\")', 0, '2021-12-22 02:36:25'),
(19023, 'auguria', 1, '', 'left', 'accountancy', '', 19017, NULL, NULL, 5, '/compta/bank/transfer.php?mainmenu=bank&amp;leftmenu=bank', '', 'BankTransfers', NULL, 'banks', 1, '$user->rights->banque->transfer', '$conf->banque->enabled && ($leftmenu==\"bank\" || $leftmenu==\"checks\" || $leftmenu==\"withdraw\")', 0, '2021-12-22 02:36:25'),
(19067, 'auguria', 1, '', 'left', 'accountancy', 'cat', 16431, NULL, NULL, 4, '/categories/index.php?mainmenu=bank&amp;leftmenu=bank&amp;type=5', '', 'Categories', NULL, 'categories', 0, '$user->rights->categorie->lire', '$conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(19068, 'auguria', 1, '', 'left', 'accountancy', '', 19067, NULL, NULL, 0, '/categories/card.php?mainmenu=bank&amp;leftmenu=bank&amp;action=create&amp;type=5', '', 'NewCategory', NULL, 'categories', 1, '$user->rights->categorie->creer', '$conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(19117, 'auguria', 1, '', 'left', 'accountancy', 'ca', 16426, NULL, NULL, 11, '/compta/resultat/index.php?mainmenu=accountancy&amp;leftmenu=ca', '', 'Reportings', NULL, 'main', 0, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->comptabilite->enabled', 0, '2021-12-22 02:36:25'),
(19128, 'auguria', 1, '', 'left', 'accountancy', '', 19117, NULL, NULL, 0, '/compta/resultat/index.php?mainmenu=accountancy&amp;leftmenu=ca', '', 'MenuReportInOut', NULL, 'main', 1, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->comptabilite->enabled && $leftmenu==\"ca\"', 0, '2021-12-22 02:36:25'),
(19129, 'auguria', 1, '', 'left', 'accountancy', '', 19118, NULL, NULL, 0, '/compta/resultat/clientfourn.php?mainmenu=accountancy&amp;leftmenu=ca', '', 'ByCompanies', NULL, 'main', 2, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->comptabilite->enabled && $leftmenu==\"ca\"', 0, '2021-12-22 02:36:25'),
(19130, 'auguria', 1, '', 'left', 'accountancy', '', 19117, NULL, NULL, 1, '/compta/stats/index.php?mainmenu=accountancy&amp;leftmenu=ca', '', 'ReportTurnover', NULL, 'main', 1, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->comptabilite->enabled && $leftmenu==\"ca\"', 0, '2021-12-22 02:36:25'),
(19131, 'auguria', 1, '', 'left', 'accountancy', '', 19120, NULL, NULL, 0, '/compta/stats/casoc.php?mainmenu=accountancy&amp;leftmenu=ca', '', 'ByCompanies', NULL, 'main', 2, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->comptabilite->enabled && $leftmenu==\"ca\"', 0, '2021-12-22 02:36:25'),
(19132, 'auguria', 1, '', 'left', 'accountancy', '', 19120, NULL, NULL, 1, '/compta/stats/cabyuser.php?mainmenu=accountancy&amp;leftmenu=ca', '', 'ByUsers', NULL, 'main', 2, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->comptabilite->enabled && $leftmenu==\"ca\"', 0, '2021-12-22 02:36:25'),
(19133, 'auguria', 1, '', 'left', 'accountancy', '', 19120, NULL, NULL, 1, '/compta/stats/cabyprodserv.php?mainmenu=accountancy&amp;leftmenu=ca', '', 'ByProductsAndServices', NULL, 'main', 2, '$user->rights->compta->resultat->lire || $user->rights->accounting->comptarapport->lire', '$conf->comptabilite->enabled && $leftmenu==\"ca\"', 0, '2021-12-22 02:36:25'),
(19217, 'auguria', 1, '', 'left', 'products', 'product', 16420, NULL, NULL, 0, '/product/index.php?mainmenu=products&amp;leftmenu=product&amp;type=0', '', 'Products', NULL, 'products', 0, '$user->rights->produit->lire', '$conf->product->enabled', 2, '2021-12-22 02:36:25'),
(19218, 'auguria', 1, '', 'left', 'products', '', 19217, NULL, NULL, 0, '/product/card.php?mainmenu=products&amp;leftmenu=product&amp;action=create&amp;type=0', '', 'NewProduct', NULL, 'products', 1, '$user->rights->produit->creer', '$conf->product->enabled', 2, '2021-12-22 02:36:25'),
(19219, 'auguria', 1, '', 'left', 'products', '', 19217, NULL, NULL, 1, '/product/list.php?mainmenu=products&amp;leftmenu=product&amp;type=0', '', 'List', NULL, 'products', 1, '$user->rights->produit->lire', '$conf->product->enabled', 2, '2021-12-22 02:36:25'),
(19220, 'auguria', 1, '', 'left', 'products', '', 19217, NULL, NULL, 4, '/product/reassort.php?mainmenu=products&amp;type=0', '', 'MenuStocks', NULL, 'products', 1, '$user->rights->produit->lire && $user->rights->stock->lire', '$conf->product->enabled', 2, '2021-12-22 02:36:25'),
(19221, 'auguria', 1, '', 'left', 'products', '', 19217, NULL, NULL, 8, '/product/stats/card.php?mainmenu=products&amp;id=all&amp;leftmenu=stats&amp;type=0', '', 'Statistics', NULL, 'main', 1, '$user->rights->produit->lire', '$conf->propal->enabled', 2, '2021-12-22 02:36:25'),
(19222, 'auguria', 1, '', 'left', 'products', '', 19217, NULL, NULL, 5, '/product/reassortlot.php?mainmenu=products&amp;type=0', '', 'StocksByLotSerial', NULL, 'products', 1, '$user->rights->produit->lire && $user->rights->stock->lire', '$conf->productbatch->enabled', 2, '2021-12-22 02:36:25'),
(19223, 'auguria', 1, '', 'left', 'products', '', 19217, NULL, NULL, 6, '/product/stock/productlot_list.php?mainmenu=products', '', 'LotSerial', NULL, 'products', 1, '$user->rights->produit->lire && $user->rights->stock->lire', '$conf->productbatch->enabled', 2, '2021-12-22 02:36:25'),
(19224, 'auguria', 1, '', 'left', 'products', '', 19217, NULL, NULL, 7, '/variants/list.php?mainmenu=products', '', 'VariantAttributes', NULL, 'products', 1, '$user->rights->produit->lire', '$conf->variants->enabled', 2, '2021-12-22 02:36:25'),
(19317, 'auguria', 1, '', 'left', 'products', 'service', 16420, NULL, NULL, 1, '/product/index.php?mainmenu=products&amp;leftmenu=service&amp;type=1', '', 'Services', NULL, 'products', 0, '$user->rights->service->lire', '$conf->service->enabled', 2, '2021-12-22 02:36:25'),
(19318, 'auguria', 1, '', 'left', 'products', '', 19317, NULL, NULL, 0, '/product/card.php?mainmenu=products&amp;leftmenu=service&amp;action=create&amp;type=1', '', 'NewService', NULL, 'products', 1, '$user->rights->service->creer', '$conf->service->enabled', 2, '2021-12-22 02:36:25'),
(19319, 'auguria', 1, '', 'left', 'products', '', 19317, NULL, NULL, 1, '/product/list.php?mainmenu=products&amp;leftmenu=service&amp;type=1', '', 'List', NULL, 'products', 1, '$user->rights->service->lire', '$conf->service->enabled', 2, '2021-12-22 02:36:25'),
(19320, 'auguria', 1, '', 'left', 'products', '', 19317, NULL, NULL, 5, '/product/stats/card.php?mainmenu=products&amp;id=all&amp;leftmenu=stats&amp;type=1', '', 'Statistics', NULL, 'main', 1, '$user->rights->service->lire', '$conf->propal->enabled', 2, '2021-12-22 02:36:25'),
(19417, 'auguria', 1, '', 'left', 'accountancy', 'asset', 16426, NULL, NULL, 20, '/asset/list.php?mainmenu=accountancy&amp;leftmenu=asset', '', 'MenuAssets', NULL, 'assets', 1, '$user->rights->asset->read', '$conf->asset->enabled', 0, '2021-12-22 02:36:25'),
(19418, 'auguria', 1, '', 'left', 'asset', '', 19417, NULL, NULL, 21, '/asset/card.php?mainmenu=accountancy&amp;leftmenu=asset&amp;action=create', '', 'MenuNewAsset', NULL, 'assets', 2, '$user->rights->asset->write', '$conf->asset->enabled && $leftmenu==\"asset\"', 0, '2021-12-22 02:36:25'),
(19420, 'auguria', 1, '', 'left', 'asset', '', 19417, NULL, NULL, 22, '/asset/list.php?mainmenu=accountancy&amp;leftmenu=asset', '', 'MenuListAssets', NULL, 'assets', 2, '$user->rights->asset->read', '$conf->asset->enabled && $leftmenu==\"asset\"', 0, '2021-12-22 02:36:25'),
(19421, 'auguria', 1, '', 'left', 'asset', 'asset_type', 19417, NULL, NULL, 23, '/asset/type.php?mainmenu=accountancy&amp;leftmenu=asset', '', 'MenuTypeAssets', NULL, 'assets', 2, '$user->rights->asset->read', '$conf->asset->enabled && $leftmenu==\"asset\"', 0, '2021-12-22 02:36:25'),
(19422, 'auguria', 1, '', 'left', 'asset', '', 19421, NULL, NULL, 24, '/asset/type.php?mainmenu=accountancy&amp;action=create', '', 'MenuNewTypeAssets', NULL, 'assets', 3, '$user->rights->asset->setup_advance', '$conf->asset->enabled && $leftmenu==\"asset\"', 0, '2021-12-22 02:36:25'),
(19423, 'auguria', 1, '', 'left', 'asset', '', 19421, NULL, NULL, 25, '/asset/type.php?mainmenu=accountancy', '', 'MenuListTypeAssets', NULL, 'assets', 3, '$user->rights->asset->read', '$conf->asset->enabled && $leftmenu==\"asset\"', 0, '2021-12-22 02:36:25'),
(19517, 'auguria', 1, '', 'left', 'products', 'stock', 16420, NULL, NULL, 3, '/product/stock/index.php?mainmenu=products&amp;leftmenu=stock', '', 'Stock', NULL, 'stocks', 0, '$user->rights->stock->lire', '$conf->stock->enabled', 2, '2021-12-22 02:36:25'),
(19518, 'auguria', 1, '', 'left', 'products', '', 19517, NULL, NULL, 0, '/product/stock/card.php?mainmenu=products&amp;action=create', '', 'MenuNewWarehouse', NULL, 'stocks', 1, '$user->rights->stock->creer', '$conf->stock->enabled', 2, '2021-12-22 02:36:25'),
(19519, 'auguria', 1, '', 'left', 'products', '', 19517, NULL, NULL, 1, '/product/stock/list.php?mainmenu=products', '', 'List', NULL, 'stocks', 1, '$user->rights->stock->lire', '$conf->stock->enabled', 2, '2021-12-22 02:36:25'),
(19521, 'auguria', 1, '', 'left', 'products', '', 19517, NULL, NULL, 3, '/product/stock/movement_list.php?mainmenu=products', '', 'Movements', NULL, 'stocks', 1, '$user->rights->stock->mouvement->lire', '$conf->stock->enabled', 2, '2021-12-22 02:36:25'),
(19522, 'auguria', 1, '', 'left', 'products', '', 19517, NULL, NULL, 4, '/product/stock/replenish.php?mainmenu=products', '', 'Replenishments', NULL, 'stocks', 1, '$user->rights->stock->mouvement->creer && $user->rights->fournisseur->lire', '$conf->stock->enabled && $conf->supplier_order->enabled', 2, '2021-12-22 02:36:25'),
(19523, 'auguria', 1, '', 'left', 'products', '', 19517, NULL, NULL, 5, '/product/stock/massstockmove.php?mainmenu=products', '', 'MassStockTransferShort', NULL, 'stocks', 1, '$user->rights->stock->mouvement->creer', '$conf->stock->enabled', 2, '2021-12-22 02:36:25'),
(19617, 'auguria', 1, '', 'left', 'products', 'cat', 16420, NULL, NULL, 4, '/categories/index.php?mainmenu=products&amp;leftmenu=cat&amp;type=0', '', 'Categories', NULL, 'categories', 0, '$user->rights->categorie->lire', '$conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(19618, 'auguria', 1, '', 'left', 'products', '', 19617, NULL, NULL, 0, '/categories/card.php?mainmenu=products&amp;action=create&amp;type=0', '', 'NewCategory', NULL, 'categories', 1, '$user->rights->categorie->creer', '$conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(19817, 'auguria', 1, '', 'left', 'project', '', 16424, NULL, NULL, 3, '/projet/activity/perweek.php?mainmenu=project&amp;leftmenu=projects', '', 'NewTimeSpent', NULL, 'projects', 0, '$user->rights->projet->lire', '$conf->projet->enabled && !$conf->global->PROJECT_HIDE_TASKS', 2, '2021-12-22 02:36:25'),
(20017, 'auguria', 1, '', 'left', 'project', 'projects', 16424, NULL, NULL, 0, '/projet/index.php?mainmenu=project&amp;leftmenu=projects', '', 'LeadsOrProjects', NULL, 'projects', 0, '$user->rights->projet->lire', '$conf->projet->enabled', 2, '2021-12-22 02:36:25'),
(20018, 'auguria', 1, '', 'left', 'project', '', 20017, NULL, NULL, 1, '/projet/card.php?mainmenu=project&amp;leftmenu=projects&amp;action=create', '', 'New', NULL, 'projects', 1, '$user->rights->projet->creer', '$conf->projet->enabled', 2, '2021-12-22 02:36:25'),
(20019, 'auguria', 1, '', 'left', 'project', '', 20017, NULL, NULL, 2, '/projet/list.php?mainmenu=project&amp;leftmenu=projects', '', 'List', NULL, 'projects', 1, '$user->rights->projet->lire', '$conf->projet->enabled', 2, '2021-12-22 02:36:25'),
(20020, 'auguria', 1, '', 'left', 'project', '', 20017, NULL, NULL, 2, '/projet/list.php?mainmenu=project&amp;leftmenu=projects&search_opp_status=openedopp&search_status=99', '', 'ListOpenLeads', NULL, 'projects', 1, '$user->rights->projet->lire', '$conf->projet->enabled && $conf->global->PROJECT_USE_OPPORTUNITIES != 0', 2, '2021-12-22 02:36:25'),
(20021, 'auguria', 1, '', 'left', 'project', '', 20017, NULL, NULL, 2, '/projet/list.php?mainmenu=project&amp;leftmenu=projects&search_opp_status=notopenedopp&search_status=99', '', 'ListOpenProjects', NULL, 'projects', 1, '$user->rights->projet->lire', '$conf->projet->enabled && $conf->global->PROJECT_USE_OPPORTUNITIES != 2', 2, '2021-12-22 02:36:25'),
(20022, 'auguria', 1, '', 'left', 'project', '', 20017, NULL, NULL, 3, '/projet/stats/index.php?mainmenu=project&amp;leftmenu=projects', '', 'Statistics', NULL, 'projects', 1, '$user->rights->projet->lire', '$conf->projet->enabled', 2, '2021-12-22 02:36:25'),
(20117, 'auguria', 1, '', 'left', 'project', '', 16424, NULL, NULL, 0, '/projet/activity/index.php?mainmenu=project&amp;leftmenu=projects', '', 'Activities', NULL, 'projects', 0, '$user->rights->projet->lire', '$conf->projet->enabled && !$conf->global->PROJECT_HIDE_TASKS', 2, '2021-12-22 02:36:25'),
(20118, 'auguria', 1, '', 'left', 'project', '', 20117, NULL, NULL, 1, '/projet/tasks.php?mainmenu=project&amp;leftmenu=projects&amp;action=create', '', 'NewTask', NULL, 'projects', 1, '$user->rights->projet->creer', '$conf->projet->enabled && !$conf->global->PROJECT_HIDE_TASKS', 2, '2021-12-22 02:36:25'),
(20119, 'auguria', 1, '', 'left', 'project', '', 20117, NULL, NULL, 2, '/projet/tasks/list.php?mainmenu=project&amp;leftmenu=projects', '', 'List', NULL, 'projects', 1, '$user->rights->projet->lire', '$conf->projet->enabled && !$conf->global->PROJECT_HIDE_TASKS', 2, '2021-12-22 02:36:25'),
(20121, 'auguria', 1, '', 'left', 'project', '', 20117, NULL, NULL, 4, '/projet/tasks/stats/index.php?mainmenu=project&amp;leftmenu=projects', '', 'Statistics', NULL, 'projects', 1, '$user->rights->projet->lire', '$conf->projet->enabled && !$conf->global->PROJECT_HIDE_TASKS', 2, '2021-12-22 02:36:25'),
(20221, 'auguria', 1, '', 'left', 'project', 'cat', 16424, NULL, NULL, 4, '/categories/index.php?mainmenu=project&amp;leftmenu=cat&amp;type=6', '', 'Categories', NULL, 'categories', 0, '$user->rights->categorie->lire', '$conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(20222, 'auguria', 1, '', 'left', 'project', '', 20221, NULL, NULL, 0, '/categories/card.php?mainmenu=project&amp;action=create&amp;type=6', '', 'NewCategory', NULL, 'categories', 1, '$user->rights->categorie->creer', '$conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(20317, 'auguria', 1, '', 'left', 'tools', 'email_templates', 16425, NULL, NULL, 0, '/admin/mails_templates.php?mainmenu=tools&amp;leftmenu=email_templates', '', 'EMailTemplates', NULL, '', 0, '', 'empty($user->socid)', 0, '2021-12-22 02:36:25'),
(20327, 'auguria', 1, '', 'left', 'tools', 'mailing', 16425, NULL, NULL, 0, '/comm/mailing/index.php?mainmenu=tools&amp;leftmenu=mailing', '', 'EMailings', NULL, 'mails', 0, '$user->rights->mailing->lire', '$conf->mailing->enabled', 0, '2021-12-22 02:36:25'),
(20328, 'auguria', 1, '', 'left', 'tools', '', 20327, NULL, NULL, 0, '/comm/mailing/card.php?mainmenu=tools&amp;leftmenu=mailing&amp;action=create', '', 'NewMailing', NULL, 'mails', 1, '$user->rights->mailing->creer', '$conf->mailing->enabled', 0, '2021-12-22 02:36:25'),
(20329, 'auguria', 1, '', 'left', 'tools', '', 20327, NULL, NULL, 1, '/comm/mailing/list.php?mainmenu=tools&amp;leftmenu=mailing', '', 'List', NULL, 'mails', 1, '$user->rights->mailing->lire', '$conf->mailing->enabled', 0, '2021-12-22 02:36:25'),
(20517, 'auguria', 1, '', 'left', 'tools', 'export', 16425, NULL, NULL, 2, '/exports/index.php?mainmenu=tools&amp;leftmenu=export', '', 'FormatedExport', NULL, 'exports', 0, '$user->rights->export->lire', '$conf->export->enabled', 2, '2021-12-22 02:36:25'),
(20518, 'auguria', 1, '', 'left', 'tools', '', 20517, NULL, NULL, 0, '/exports/export.php?mainmenu=tools&amp;leftmenu=export', '', 'NewExport', NULL, 'exports', 1, '$user->rights->export->creer', '$conf->export->enabled', 2, '2021-12-22 02:36:25'),
(20547, 'auguria', 1, '', 'left', 'tools', 'import', 16425, NULL, NULL, 2, '/imports/index.php?mainmenu=tools&amp;leftmenu=import', '', 'FormatedImport', NULL, 'exports', 0, '$user->rights->import->run', '$conf->import->enabled', 2, '2021-12-22 02:36:25'),
(20548, 'auguria', 1, '', 'left', 'tools', '', 20547, NULL, NULL, 0, '/imports/import.php?mainmenu=tools&amp;leftmenu=import', '', 'NewImport', NULL, 'exports', 1, '$user->rights->import->run', '$conf->import->enabled', 2, '2021-12-22 02:36:25'),
(20617, 'auguria', 1, '', 'left', 'members', 'members', 16430, NULL, NULL, 0, '/adherents/index.php?mainmenu=members&amp;leftmenu=members', '', 'Members', NULL, 'members', 0, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20618, 'auguria', 1, '', 'left', 'members', '', 20617, NULL, NULL, 0, '/adherents/card.php?mainmenu=members&amp;leftmenu=members&amp;action=create', '', 'NewMember', NULL, 'members', 1, '$user->rights->adherent->creer', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20619, 'auguria', 1, '', 'left', 'members', '', 20617, NULL, NULL, 1, '/adherents/list.php', '', 'List', NULL, 'members', 1, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20620, 'auguria', 1, '', 'left', 'members', '', 20619, NULL, NULL, 2, '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=-1', '', 'MenuMembersToValidate', NULL, 'members', 2, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20621, 'auguria', 1, '', 'left', 'members', '', 20619, NULL, NULL, 3, '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=1', '', 'MenuMembersValidated', NULL, 'members', 2, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20622, 'auguria', 1, '', 'left', 'members', '', 20621, NULL, NULL, 4, '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=1&amp;filter=withoutsubscription', '', 'WithoutSubscription', NULL, 'members', 2, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20623, 'auguria', 1, '', 'left', 'members', '', 20621, NULL, NULL, 4, '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=1&amp;filter=outofdate', '', 'UpToDate', NULL, 'members', 2, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20624, 'auguria', 1, '', 'left', 'members', '', 20621, NULL, NULL, 5, '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=1&amp;filter=uptodate', '', 'OutOfDate', NULL, 'members', 2, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20625, 'auguria', 1, '', 'left', 'members', '', 20619, NULL, NULL, 6, '/adherents/list.php?mainmenu=members&amp;leftmenu=members&amp;statut=0', '', 'MenuMembersResiliated', NULL, 'members', 2, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20626, 'auguria', 1, '', 'left', 'members', '', 20617, NULL, NULL, 7, '/adherents/stats/geo.php?mainmenu=members&amp;leftmenu=members&amp;mode=memberbycountry', '', 'MenuMembersStats', NULL, 'members', 1, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20717, 'auguria', 1, '', 'left', 'members', '', 16430, NULL, NULL, 1, '/adherents/index.php?mainmenu=members&amp;leftmenu=members', '', 'Subscriptions', NULL, 'compta', 0, '$user->rights->adherent->cotisation->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20718, 'auguria', 1, '', 'left', 'members', '', 20717, NULL, NULL, 0, '/adherents/list.php?mainmenu=members&amp;statut=-1&amp;leftmenu=accountancy', '', 'NewSubscription', NULL, 'compta', 1, '$user->rights->adherent->cotisation->creer', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20719, 'auguria', 1, '', 'left', 'members', '', 20717, NULL, NULL, 1, '/adherents/subscription/list.php?mainmenu=members&amp;leftmenu=members', '', 'List', NULL, 'compta', 1, '$user->rights->adherent->cotisation->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20720, 'auguria', 1, '', 'left', 'members', '', 20717, NULL, NULL, 7, '/adherents/stats/index.php?mainmenu=members&amp;leftmenu=members', '', 'MenuMembersStats', NULL, 'members', 1, '$user->rights->adherent->lire', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20919, 'auguria', 1, '', 'left', 'members', '', 20617, NULL, NULL, 9, '/adherents/htpasswd.php?mainmenu=members&amp;leftmenu=export', '', 'Filehtpasswd', NULL, 'members', 1, '$user->rights->adherent->export', '! empty($conf->global->MEMBER_LINK_TO_HTPASSWDFILE) && $conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(20920, 'auguria', 1, '', 'left', 'members', '', 20617, NULL, NULL, 10, '/adherents/cartes/carte.php?mainmenu=members&amp;leftmenu=export', '', 'MembersCards', NULL, 'members', 1, '$user->rights->adherent->export', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(21017, 'auguria', 1, '', 'left', 'hrm', 'hrm', 16432, NULL, NULL, 1, '/user/list.php?mainmenu=hrm&amp;leftmenu=hrm&mode=employee', '', 'Employees', NULL, 'hrm', 0, '$user->rights->user->user->lire', '$conf->hrm->enabled', 0, '2021-12-22 02:36:25'),
(21018, 'auguria', 1, '', 'left', 'hrm', '', 21017, NULL, NULL, 1, '/user/card.php?mainmenu=hrm&amp;action=create&employee=1', '', 'NewEmployee', NULL, 'hrm', 1, '$user->rights->user->user->creer', '$conf->hrm->enabled', 0, '2021-12-22 02:36:25'),
(21019, 'auguria', 1, '', 'left', 'hrm', '', 21017, NULL, NULL, 2, '/user/list.php?mainmenu=hrm&amp;leftmenu=hrm&mode=employee&contextpage=employeelist', '', 'List', NULL, 'hrm', 1, '$user->rights->user->user->lire', '$conf->hrm->enabled', 0, '2021-12-22 02:36:25'),
(21117, 'auguria', 1, '', 'left', 'members', 'setup', 16430, NULL, NULL, 5, '/adherents/type.php?mainmenu=members&amp;leftmenu=setup', '', 'MembersTypes', NULL, 'members', 0, '$user->rights->adherent->configurer', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(21118, 'auguria', 1, '', 'left', 'members', '', 21117, NULL, NULL, 0, '/adherents/type.php?mainmenu=members&amp;leftmenu=setup&amp;action=create', '', 'New', NULL, 'members', 1, '$user->rights->adherent->configurer', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(21119, 'auguria', 1, '', 'left', 'members', '', 21117, NULL, NULL, 1, '/adherents/type.php?mainmenu=members&amp;leftmenu=setup', '', 'List', NULL, 'members', 1, '$user->rights->adherent->configurer', '$conf->adherent->enabled', 2, '2021-12-22 02:36:25'),
(21417, 'auguria', 1, '', 'left', 'hrm', 'hrm', 16432, NULL, NULL, 1, '/holiday/list.php?mainmenu=hrm&amp;leftmenu=hrm', '', 'CPTitreMenu', NULL, 'holiday', 0, '$user->rights->holiday->read', '$conf->holiday->enabled', 0, '2021-12-22 02:36:25'),
(21418, 'auguria', 1, '', 'left', 'hrm', '', 21417, NULL, NULL, 1, '/holiday/card.php?mainmenu=hrm&amp;action=create', '', 'MenuAddCP', NULL, 'holiday', 1, '$user->rights->holiday->write', '$conf->holiday->enabled', 0, '2021-12-22 02:36:25'),
(21419, 'auguria', 1, '', 'left', 'hrm', '', 21417, NULL, NULL, 1, '/holiday/list.php?mainmenu=hrm&amp;leftmenu=hrm', '', 'List', NULL, 'holiday', 1, '$user->rights->holiday->read', '$conf->holiday->enabled', 0, '2021-12-22 02:36:26'),
(21420, 'auguria', 1, '', 'left', 'hrm', '', 21419, NULL, NULL, 1, '/holiday/list.php?mainmenu=hrm&amp;search_statut=2&leftmenu=hrm', '', 'ListToApprove', NULL, 'trips', 2, '$user->rights->holiday->read', '$conf->holiday->enabled', 0, '2021-12-22 02:36:26'),
(21421, 'auguria', 1, '', 'left', 'hrm', '', 21417, NULL, NULL, 2, '/holiday/define_holiday.php?mainmenu=hrm&amp;action=request', '', 'MenuConfCP', NULL, 'holiday', 1, '$user->rights->holiday->define_holiday', '$conf->holiday->enabled', 0, '2021-12-22 02:36:26'),
(21422, 'auguria', 1, '', 'left', 'hrm', '', 21417, NULL, NULL, 3, '/holiday/view_log.php?mainmenu=hrm&amp;action=request', '', 'MenuLogCP', NULL, 'holiday', 1, '$user->rights->holiday->define_holiday', '$conf->holiday->enabled', 0, '2021-12-22 02:36:26'),
(21517, 'auguria', 1, '', 'left', '', '', 16422, NULL, NULL, 6, '/fourn/commande/index.php?mainmenu=commercial&leftmenu=orders_suppliers', '', 'SuppliersOrders', '', 'orders', 0, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->disabled', 2, '2021-12-23 06:23:18'),
(21518, 'auguria', 1, '', 'left', 'commercial', '', 21517, NULL, NULL, 0, '/fourn/commande/card.php?mainmenu=commercial&amp;action=create&amp;leftmenu=orders_suppliers', '', 'NewSupplierOrderShort', NULL, 'orders', 1, '($user->rights->fournisseur->commande->creer || $user->rights->supplier_order->creer)', '$conf->supplier_order->enabled', 2, '2021-12-22 02:36:25'),
(21519, 'auguria', 1, '', 'left', 'commercial', '', 21517, NULL, NULL, 1, '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers', '', 'List', NULL, 'orders', 1, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled', 2, '2021-12-22 02:36:25'),
(21520, 'auguria', 1, '', 'left', 'commercial', '', 21519, NULL, NULL, 2, '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;statut=0', '', 'StatusOrderDraftShort', NULL, 'orders', 1, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled && $leftmenu==\"orders_suppliers\"', 2, '2021-12-22 02:36:25'),
(21521, 'auguria', 1, '', 'left', 'commercial', '', 21519, NULL, NULL, 3, '/fourn/commande/list.php?mainmenu=commercial&amp;leftmenu=orders_suppliers&amp;statut=1', '', 'StatusOrderValidated', NULL, 'orders', 1, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled && $leftmenu==\"orders_suppliers\"', 2, '2021-12-22 02:36:25'),
(21522, 'auguria', 1, '', 'left', '', '', 21888, NULL, NULL, 4, '/fourn/commande/list.php?mainmenu=purchaseorders&leftmenu=orders_suppliers&statut=2', '', 'StatusOrderApprovedShort', '', 'orders', 1, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled && $leftmenu==\'orders_suppliers\'', 2, '2021-12-23 06:20:34'),
(21523, 'auguria', 1, '', 'left', '', '', 21888, NULL, NULL, 5, '/fourn/commande/list.php?mainmenu=purchaseorders&leftmenu=orders_suppliers&statut=3', '', 'StatusOrderOnProcessShort', '', 'orders', 1, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled && $leftmenu==\'orders_suppliers\'', 2, '2021-12-23 06:20:58'),
(21524, 'auguria', 1, '', 'left', '', '', 21888, NULL, NULL, 6, '/fourn/commande/list.php?mainmenu=purchaseorders&leftmenu=orders_suppliers&statut=4', '', 'StatusOrderReceivedPartiallyShort', '', 'orders', 1, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->creer)', '$conf->supplier_order->enabled && $leftmenu==\'orders_suppliers\'', 2, '2021-12-23 06:21:12'),
(21525, 'auguria', 1, '', 'left', '', '', 21888, NULL, NULL, 7, '/fourn/commande/list.php?mainmenu=purchaseorders&leftmenu=orders_suppliers&statut=5', '', 'StatusOrderReceivedAll', '', 'orders', 1, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled && $leftmenu==\'orders_suppliers\'', 2, '2021-12-23 06:21:29'),
(21526, 'auguria', 1, '', 'left', '', '', 21888, NULL, NULL, 8, '/fourn/commande/list.php?mainmenu=purchaseorders&leftmenu=orders_suppliers&statut=6,7', '', 'StatusOrderCanceled', '', 'orders', 1, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled && $leftmenu==\'orders_suppliers\'', 2, '2021-12-23 06:21:43'),
(21527, 'auguria', 1, '', 'left', '', '', 21888, NULL, NULL, 9, '/fourn/commande/list.php?mainmenu=purchaseorders&leftmenu=orders_suppliers&statut=9', '', 'StatusOrderRefused', '', 'orders', 1, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled && $leftmenu==\'orders_suppliers\'', 2, '2021-12-23 06:19:45'),
(21528, 'auguria', 1, '', 'left', '', '', 21886, NULL, NULL, 7, '/commande/stats/index.php?mainmenu=purchaseorders&leftmenu=orders_suppliers&mode=supplier', '', 'Statistics', '', 'orders', 1, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled', 2, '2021-12-23 06:22:50');
INSERT INTO `erp_menu` (`rowid`, `menu_handler`, `entity`, `module`, `type`, `mainmenu`, `leftmenu`, `fk_menu`, `fk_mainmenu`, `fk_leftmenu`, `position`, `url`, `target`, `titre`, `prefix`, `langs`, `level`, `perms`, `enabled`, `usertype`, `tms`) VALUES
(21617, 'auguria', 1, '', 'left', 'members', 'cat', 16430, NULL, NULL, 3, '/categories/index.php?mainmenu=members&amp;leftmenu=cat&amp;type=3', '', 'MembersCategoriesShort', NULL, 'categories', 0, '$user->rights->categorie->lire', '$conf->adherent->enabled && $conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(21618, 'auguria', 1, '', 'left', 'members', '', 21617, NULL, NULL, 0, '/categories/card.php?mainmenu=members&amp;action=create&amp;type=3', '', 'NewCategory', NULL, 'categories', 1, '$user->rights->categorie->creer', '$conf->adherent->enabled && $conf->categorie->enabled', 2, '2021-12-22 02:36:25'),
(21717, 'auguria', 1, '', 'left', 'hrm', 'expensereport', 16432, NULL, NULL, 5, '/expensereport/index.php?mainmenu=hrm&amp;leftmenu=expensereport', '', 'TripsAndExpenses', NULL, 'trips', 0, '$user->rights->expensereport->lire', '$conf->expensereport->enabled', 0, '2021-12-22 02:36:26'),
(21718, 'auguria', 1, '', 'left', 'hrm', '', 21717, NULL, NULL, 1, '/expensereport/card.php?mainmenu=hrm&amp;action=create&amp;leftmenu=expensereport', '', 'New', NULL, 'trips', 1, '$user->rights->expensereport->creer', '$conf->expensereport->enabled', 0, '2021-12-22 02:36:26'),
(21719, 'auguria', 1, '', 'left', 'hrm', '', 21717, NULL, NULL, 2, '/expensereport/list.php?mainmenu=hrm&amp;leftmenu=expensereport', '', 'List', NULL, 'trips', 1, '$user->rights->expensereport->lire', '$conf->expensereport->enabled', 0, '2021-12-22 02:36:26'),
(21720, 'auguria', 1, '', 'left', 'hrm', '', 21719, NULL, NULL, 2, '/expensereport/list.php?mainmenu=hrm&amp;search_status=2&amp;leftmenu=expensereport', '', 'ListToApprove', NULL, 'trips', 2, '$user->rights->expensereport->approve', '$conf->expensereport->enabled', 0, '2021-12-22 02:36:26'),
(21721, 'auguria', 1, '', 'left', 'hrm', '', 21717, NULL, NULL, 2, '/expensereport/stats/index.php?mainmenu=hrm&amp;leftmenu=expensereport', '', 'Statistics', NULL, 'trips', 1, '$user->rights->expensereport->lire', '$conf->expensereport->enabled', 0, '2021-12-22 02:36:26'),
(21817, 'auguria', 1, '', 'left', 'mrp', 'bom', 16433, NULL, NULL, 20, '/bom/bom_list.php?mainmenu=mrp&amp;leftmenu=bom', '', 'MenuBOM', NULL, 'mrp', 1, '$user->rights->bom->read', '$conf->bom->enabled', 0, '2021-12-22 02:36:25'),
(21818, 'auguria', 1, '', 'left', 'mrp', '', 21817, NULL, NULL, 21, '/bom/bom_card.php?mainmenu=mrp&amp;leftmenu=bom&amp;action=create', '', 'NewBOM', NULL, 'mrp', 2, '$user->rights->bom->write', '$conf->bom->enabled', 0, '2021-12-22 02:36:25'),
(21820, 'auguria', 1, '', 'left', 'mrp', '', 21817, NULL, NULL, 22, '/bom/bom_list.php?mainmenu=mrp&amp;leftmenu=bom', '', 'List', NULL, 'mrp', 2, '$user->rights->bom->read', '$conf->bom->enabled', 0, '2021-12-22 02:36:25'),
(21867, 'auguria', 1, '', 'left', 'mrp', 'mrp', 16433, NULL, NULL, 20, '/mrp/mo_list.php?mainmenu=mrp&amp;leftmenu=mrp', '', 'MenuMRP', NULL, 'mrp', 1, '$user->rights->mrp->read', '$conf->bom->enabled', 0, '2021-12-22 02:36:25'),
(21868, 'auguria', 1, '', 'left', 'mrp', '', 21867, NULL, NULL, 21, '/mrp/mo_card.php?mainmenu=mrp&amp;leftmenu=mrp&amp;action=create', '', 'NewMO', NULL, 'mrp', 2, '$user->rights->mrp->write', '$conf->bom->enabled', 0, '2021-12-22 02:36:25'),
(21870, 'auguria', 1, '', 'left', 'mrp', '', 21867, NULL, NULL, 22, '/mrp/mo_list.php?mainmenu=mrp&amp;leftmenu=mrp', '', 'List', NULL, 'mrp', 2, '$user->rights->mrp->read', '$conf->bom->enabled', 0, '2021-12-22 02:36:25'),
(21873, 'auguria', 1, 'societe', 'top', 'customers', '', 0, NULL, NULL, 2, '/societe/list.php?mainmenu=customers&type=c&leftmenu=customers&idmenu=21873', '', 'Customers', '', 'companies', NULL, '$user->rights->societe->lire', '$conf->societe->enabled', 2, '2021-12-23 06:24:17'),
(21874, 'auguria', 1, '', 'left', '', '', 21873, NULL, NULL, 1, '/societe/list.php?mainmenu=customers&type=c&leftmenu=customers', '', 'Customers', '', 'companies', NULL, '$user->rights->societe->lire', '$conf->societe->enabled', 2, '2021-12-22 07:56:03'),
(21875, 'auguria', 1, '', 'left', '', NULL, 21874, NULL, NULL, 3, '/societe/list.php?mainmenu=customers&type=p&leftmenu=prospects', '', 'ListProspectsShort', '', 'companies', NULL, '$user->rights->societe->lire', '$conf->societe->enabled', 2, '2021-12-22 07:41:29'),
(21876, 'auguria', 1, '', 'left', 'customers', NULL, 21875, NULL, NULL, 0, '/societe/card.php?mainmenu=customers&leftmenu=prospects&action=create&type=p', '', 'MenuNewProspect', '', 'companies', NULL, '$user->rights->societe->creer', '$conf->societe->enabled', 2, '2021-12-22 07:43:40'),
(21877, 'auguria', 1, '', 'left', '', NULL, 21874, NULL, NULL, 4, '/societe/list.php?mainmenu=customers&type=c&leftmenu=customers', '', 'ListCustomersShort', '', 'companies', NULL, '$user->rights->societe->lire', '$conf->societe->enabled', 2, '2021-12-22 07:46:58'),
(21878, 'auguria', 1, '', 'left', '', NULL, 21877, NULL, NULL, 0, '/societe/card.php?mainmenu=customers&leftmenu=customers&action=create&type=c', '', 'MenuNewCustomer', '', 'companies', NULL, '$user->rights->societe->creer', '$conf->societe->enabled', 2, '2021-12-22 07:49:06'),
(21879, 'auguria', 1, '', 'left', '', '', 21873, NULL, NULL, 2, '/contact/list.php?mainmenu=customers&leftmenu=contacts&type=c', '', 'ContactsAddresses', '', 'customers', NULL, '$user->rights->societe->lire', '$conf->societe->enabled', 2, '2021-12-23 04:16:19'),
(21880, 'auguria', 1, '', 'left', '', '', 21879, NULL, NULL, 0, '/contact/card.php?mainmenu=customers&leftmenu=contacts&action=create&type=c', '', 'NewContactAddress', '', 'companies', NULL, '$user->rights->societe->creer', '$conf->societe->enabled', 2, '2021-12-23 04:29:19'),
(21881, 'auguria', 1, '', 'left', '', NULL, 21879, NULL, NULL, 2, '/contact/list.php?mainmenu=customers&leftmenu=contacts', '', 'List', '', 'customers', NULL, '$user->rights->societe->lire', '$conf->societe->enabled', 2, '2021-12-22 08:01:06'),
(21882, 'auguria', 1, '', 'left', '', NULL, 21881, NULL, NULL, 1, '/contact/list.php?mainmenu=customers&leftmenu=contacts&type=p', '', 'ThirdPartyProspects', '', 'companies', NULL, '$user->rights->societe->contact->lire', '$conf->societe->enabled', 2, '2021-12-22 08:03:51'),
(21883, 'auguria', 1, '', 'left', '', NULL, 21881, NULL, NULL, 2, '/contact/list.php?mainmenu=customers&leftmenu=contacts&type=c', '', 'ThirdPartyCustomers', '', 'companies', NULL, '$user->rights->societe->contact->lire', '$conf->societe->enabled', 2, '2021-12-22 08:05:55'),
(21884, 'auguria', 1, '', 'left', '', NULL, 21873, NULL, NULL, 3, '/categories/index.php?mainmenu=customers&leftmenu=cat&type=2', '', 'CustomersProspectsCategoriesShort', '', 'companies', NULL, '$user->rights->categorie->lire', '(!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) && $conf->categorie->enabled', 2, '2021-12-22 08:08:22'),
(21885, 'auguria', 1, '', 'left', '', NULL, 21884, NULL, NULL, 1, '/categories/card.php?mainmenu=customers&action=create&type=2', '', 'NewCategory', '', 'companies', NULL, '$user->rights->categorie->creer', '(!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) && $conf->categorie->enabled', 2, '2021-12-22 08:09:43'),
(21886, 'auguria', 1, '', 'top', 'purchaseorders', '', 0, NULL, NULL, 4, 'fourn/commande/index.php?mainmenu=purchaseorders&leftmenu=orders_suppliers', '', 'Purchaseorders', '', '', NULL, '$user->rights->societe->lire || $user->rights->societe->contact->lire', '$conf->propal->enabled || $conf->commande->enabled || $conf->supplier_order->enabled || $conf->contrat->enabled || $conf->ficheinter->enabled', 2, '2021-12-23 06:25:16'),
(21887, 'auguria', 1, '', 'left', '', NULL, 21886, NULL, NULL, 0, '/fourn/commande/card.php?mainmenu=purchaseorders&action=create&leftmenu=orders_suppliers', '', 'NewSupplierOrderShort', '', 'orders', NULL, '($user->rights->fournisseur->commande->creer || $user->rights->supplier_order->creer)', '$conf->supplier_order->enabled', 2, '2021-12-23 06:09:35'),
(21888, 'auguria', 1, '', 'left', '', NULL, 21886, NULL, NULL, 1, '/fourn/commande/list.php?mainmenu=purchaseorders&leftmenu=orders_suppliers', '', 'List', '', 'orders', NULL, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled', 2, '2021-12-23 06:11:31'),
(21889, 'auguria', 1, '', 'left', '', NULL, 21888, NULL, NULL, 0, '/fourn/commande/list.php?mainmenu=purchaseorders&leftmenu=orders_suppliers&statut=0', '', 'StatusOrderDraftShort', '', 'orders', NULL, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled && $leftmenu==\'orders_suppliers\'', 2, '2021-12-23 06:13:48'),
(21890, 'auguria', 1, '', 'left', '', NULL, 21888, NULL, NULL, 1, '/fourn/commande/list.php?mainmenu=purchaseorders&leftmenu=orders_suppliers&statut=1', '', 'StatusOrderValidated', '', 'orders', NULL, '($user->rights->fournisseur->commande->lire || $user->rights->supplier_order->lire)', '$conf->supplier_order->enabled && $leftmenu==\'orders_suppliers\'', 2, '2021-12-23 06:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `erp_mrp_mo`
--

CREATE TABLE `erp_mrp_mo` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `mrptype` int(11) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `date_start_planned` datetime DEFAULT NULL,
  `date_end_planned` datetime DEFAULT NULL,
  `fk_bom` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_mrp_mo`
--

INSERT INTO `erp_mrp_mo` (`rowid`, `entity`, `ref`, `mrptype`, `label`, `qty`, `fk_warehouse`, `fk_soc`, `note_public`, `note_private`, `date_creation`, `date_valid`, `tms`, `fk_user_creat`, `fk_user_modif`, `fk_user_valid`, `import_key`, `model_pdf`, `status`, `fk_product`, `date_start_planned`, `date_end_planned`, `fk_bom`, `fk_project`, `last_main_doc`) VALUES
(1, 1, 'MO2111-0001', 0, NULL, 1, 1, NULL, NULL, NULL, '2021-11-12 09:38:28', '2021-11-12 09:38:39', '2021-11-12 09:40:15', 1, NULL, 1, NULL, NULL, 3, 3, '2021-11-12 09:38:00', '2021-11-19 09:38:00', 1, NULL, NULL),
(2, 1, 'MO2112-0002', 0, NULL, 100, 1, NULL, NULL, NULL, '2021-12-08 11:53:14', '2021-12-08 11:54:20', '2021-12-08 11:56:34', 1, 1, 1, NULL, NULL, 3, 1, '2021-12-13 16:00:00', '2021-12-13 16:00:00', 2, NULL, NULL),
(3, 1, '(PROV3)', 0, NULL, 1, 1, NULL, NULL, NULL, '2021-12-12 12:45:23', NULL, '2021-12-12 12:45:23', 1, NULL, NULL, NULL, NULL, 0, 7, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_mrp_mo_extrafields`
--

CREATE TABLE `erp_mrp_mo_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_mrp_production`
--

CREATE TABLE `erp_mrp_production` (
  `rowid` int(11) NOT NULL,
  `fk_mo` int(11) NOT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `origin_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `fk_product` int(11) NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 1,
  `qty_frozen` smallint(6) DEFAULT 0,
  `disable_stock_change` smallint(6) DEFAULT 0,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_mrp_production` int(11) DEFAULT NULL,
  `fk_stock_movement` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_mrp_production`
--

INSERT INTO `erp_mrp_production` (`rowid`, `fk_mo`, `origin_id`, `origin_type`, `position`, `fk_product`, `fk_warehouse`, `qty`, `qty_frozen`, `disable_stock_change`, `batch`, `role`, `fk_mrp_production`, `fk_stock_movement`, `date_creation`, `tms`, `fk_user_creat`, `fk_user_modif`, `import_key`) VALUES
(1, 1, NULL, NULL, 1, 3, NULL, 1, NULL, NULL, NULL, 'toproduce', NULL, NULL, '2021-11-12 09:38:28', '2021-11-12 09:38:28', 1, NULL, NULL),
(2, 1, 1, 'bomline', 2, 1, NULL, 1, 0, 0, NULL, 'toconsume', NULL, NULL, '2021-11-12 09:38:28', '2021-11-12 09:38:28', 1, NULL, NULL),
(3, 1, 2, 'bomline', 4, 2, NULL, 1, 0, 0, NULL, 'toconsume', NULL, NULL, '2021-11-12 09:38:28', '2021-11-12 09:38:28', 1, NULL, NULL),
(4, 1, NULL, NULL, 0, 1, 1, 1, NULL, NULL, '123', 'consumed', 2, 2, '2021-11-12 09:40:15', '2021-11-12 09:40:15', 1, NULL, NULL),
(5, 1, NULL, NULL, 1, 2, 1, 1, NULL, NULL, '', 'consumed', 3, 3, '2021-11-12 09:40:15', '2021-11-12 09:40:15', 1, NULL, NULL),
(6, 1, NULL, NULL, 0, 3, 1, 1, NULL, NULL, '456', 'produced', 1, 4, '2021-11-12 09:40:15', '2021-11-12 09:40:15', 1, NULL, NULL),
(13, 2, NULL, NULL, 1, 1, NULL, 100, NULL, NULL, NULL, 'toproduce', NULL, NULL, '2021-12-08 11:54:14', '2021-12-08 11:54:14', 1, NULL, NULL),
(14, 2, 3, 'bomline', 2, 3, NULL, 100, 0, 0, NULL, 'toconsume', NULL, NULL, '2021-12-08 11:54:14', '2021-12-08 11:54:14', 1, NULL, NULL),
(15, 2, 4, 'bomline', 4, 4, NULL, 100, 0, 0, NULL, 'toconsume', NULL, NULL, '2021-12-08 11:54:14', '2021-12-08 11:54:14', 1, NULL, NULL),
(16, 2, NULL, NULL, 0, 3, 1, 50, NULL, NULL, '456', 'consumed', 14, 6, '2021-12-08 11:56:14', '2021-12-08 11:56:14', 1, NULL, NULL),
(17, 2, NULL, NULL, 1, 4, 1, 50, NULL, NULL, 'Lot Test 02', 'consumed', 15, 7, '2021-12-08 11:56:14', '2021-12-08 11:56:14', 1, NULL, NULL),
(18, 2, NULL, NULL, 0, 1, 1, 50, NULL, NULL, '123', 'produced', 13, 8, '2021-12-08 11:56:14', '2021-12-08 11:56:14', 1, NULL, NULL),
(19, 2, NULL, NULL, 0, 3, 1, 50, NULL, NULL, '456', 'consumed', 14, 9, '2021-12-08 11:56:34', '2021-12-08 11:56:34', 1, NULL, NULL),
(20, 2, NULL, NULL, 1, 4, 1, 50, NULL, NULL, 'Lot Test 02', 'consumed', 15, 10, '2021-12-08 11:56:34', '2021-12-08 11:56:34', 1, NULL, NULL),
(21, 2, NULL, NULL, 0, 1, 1, 50, NULL, NULL, '124', 'produced', 13, 11, '2021-12-08 11:56:34', '2021-12-08 11:56:34', 1, NULL, NULL),
(22, 3, NULL, NULL, 1, 7, NULL, 1, NULL, NULL, NULL, 'toproduce', NULL, NULL, '2021-12-12 12:45:23', '2021-12-12 12:45:23', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_multicurrency`
--

CREATE TABLE `erp_multicurrency` (
  `rowid` int(11) NOT NULL,
  `date_create` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `fk_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_multicurrency`
--

INSERT INTO `erp_multicurrency` (`rowid`, `date_create`, `code`, `name`, `entity`, `fk_user`) VALUES
(1, '2021-11-09 09:21:41', 'EUR', 'Euros (â‚¬)', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_multicurrency_rate`
--

CREATE TABLE `erp_multicurrency_rate` (
  `rowid` int(11) NOT NULL,
  `date_sync` datetime DEFAULT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `fk_multicurrency` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_multicurrency_rate`
--

INSERT INTO `erp_multicurrency_rate` (`rowid`, `date_sync`, `rate`, `fk_multicurrency`, `entity`) VALUES
(1, '2021-11-09 09:21:41', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_notify`
--

CREATE TABLE `erp_notify` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `daten` datetime DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'email',
  `type_target` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objet_type` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objet_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_notify_def`
--

CREATE TABLE `erp_notify_def` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` date DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_notify_def_object`
--

CREATE TABLE `erp_notify_def_object` (
  `id` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `objet_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objet_id` int(11) NOT NULL,
  `type_notif` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'browser',
  `date_notif` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `moreparam` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_oauth_state`
--

CREATE TABLE `erp_oauth_state` (
  `rowid` int(11) NOT NULL,
  `service` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_oauth_token`
--

CREATE TABLE `erp_oauth_token` (
  `rowid` int(11) NOT NULL,
  `service` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tokenstring` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `restricted_ips` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_object_lang`
--

CREATE TABLE `erp_object_lang` (
  `rowid` int(11) NOT NULL,
  `fk_object` int(11) NOT NULL DEFAULT 0,
  `type_object` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_onlinesignature`
--

CREATE TABLE `erp_onlinesignature` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `object_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pathoffile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_opensurvey_comments`
--

CREATE TABLE `erp_opensurvey_comments` (
  `id_comment` int(10) UNSIGNED NOT NULL,
  `id_sondage` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usercomment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_opensurvey_formquestions`
--

CREATE TABLE `erp_opensurvey_formquestions` (
  `rowid` int(11) NOT NULL,
  `id_sondage` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available_answers` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_opensurvey_sondage`
--

CREATE TABLE `erp_opensurvey_sondage` (
  `id_sondage` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `commentaires` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_admin` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_admin` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `titre` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_fin` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `format` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailsonde` tinyint(4) NOT NULL DEFAULT 0,
  `allow_comments` tinyint(4) NOT NULL DEFAULT 1,
  `allow_spy` tinyint(4) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sujet` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_opensurvey_user_formanswers`
--

CREATE TABLE `erp_opensurvey_user_formanswers` (
  `fk_user_survey` int(11) NOT NULL,
  `fk_question` int(11) NOT NULL,
  `reponses` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_opensurvey_user_studs`
--

CREATE TABLE `erp_opensurvey_user_studs` (
  `id_users` int(11) NOT NULL,
  `nom` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sondage` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reponses` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_overwrite_trans`
--

CREATE TABLE `erp_overwrite_trans` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transkey` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transvalue` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_overwrite_trans`
--

INSERT INTO `erp_overwrite_trans` (`rowid`, `entity`, `lang`, `transkey`, `transvalue`) VALUES
(1, 1, 'en_US', 'Suppliers', 'Suppliers'),
(2, 1, 'en_US', 'ListSuppliersShort', 'List of Suppliers'),
(3, 1, 'en_SG', 'ListSuppliersShort', 'List of Suppliers'),
(4, 1, 'en_SG', 'NewSupplier', 'New Supplier'),
(5, 1, 'en_SG', 'ThirdPartySuppliers', 'Suppliers'),
(6, 1, 'en_SG', 'SuppliersCategoriesShort', 'Supplers tags/categories'),
(7, 1, 'en_SG', 'Suppliers', 'Suppliers'),
(8, 1, 'en_SG', 'Customers', 'Customers'),
(9, 1, 'en_SG', 'NewCustomer', 'New Customer'),
(10, 1, 'en_SG', 'Supplier', 'Supplier'),
(11, 1, 'en_SG', 'Type', 'Type'),
(12, 1, 'en_SG', 'Prospect', 'Prospect'),
(13, 1, 'en_SG', 'Prospects', 'Prospects'),
(14, 1, 'en_SG', 'NewProspect', 'New Prospect'),
(16, 1, 'en_SG', 'CustomerProspect', 'Customer/Prospect'),
(17, 1, 'en_SG', 'SelectSupplier', 'Select a supplier'),
(18, 1, 'en_SG', 'SelectCustomerProspect', ' Select a customer/prospect'),
(19, 1, 'en_SG', 'Purchaseorders', 'Purchase orders'),
(20, 1, 'en_SG', 'quotations', 'Quotations'),
(21, 1, 'en_SG', 'NewQuotation', 'New Quotation'),
(22, 1, 'en_SG', 'CommercialQuotation', 'Commercial Quotations'),
(23, 1, 'en_SG', 'Postal', 'Postal code');

-- --------------------------------------------------------

--
-- Table structure for table `erp_paiement`
--

CREATE TABLE `erp_paiement` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_site` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_export_compta` int(11) NOT NULL DEFAULT 0,
  `pos_change` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_paiement`
--

INSERT INTO `erp_paiement` (`rowid`, `ref`, `ref_ext`, `entity`, `datec`, `tms`, `datep`, `amount`, `multicurrency_amount`, `fk_paiement`, `num_paiement`, `note`, `ext_payment_id`, `ext_payment_site`, `fk_bank`, `fk_user_creat`, `fk_user_modif`, `statut`, `fk_export_compta`, `pos_change`) VALUES
(1, 'PAY2111-0001', '', 1, '2021-11-11 06:30:09', '2021-11-11 06:30:10', '2021-11-11 06:30:09', 279.37000000, 279.37000000, 4, 'TC1-2111-0001', '', NULL, NULL, 3, 1, NULL, 0, 0, 0.00000000),
(2, 'PAY2111-0002', '', 1, '2021-11-12 09:26:57', '2021-11-12 09:26:58', '2021-11-12 12:00:00', 821.00000000, 821.00000000, 4, '', '', NULL, NULL, 4, 1, NULL, 0, 0, 0.00000000),
(3, 'PAY2112-0003', '', 1, '2021-12-09 06:56:41', '2021-12-09 06:56:41', '2021-12-09 06:56:41', 25.90000000, 25.90000000, 4, 'TC1-2112-0003', '', NULL, NULL, 5, 1, NULL, 0, 0, 0.00000000),
(4, 'PAY2112-0004', '', 1, '2021-12-17 09:48:25', '2021-12-17 09:48:25', '2021-12-17 12:00:00', 214.00000000, 214.00000000, 2, '', '', NULL, NULL, 6, 1, NULL, 0, 0, 0.00000000),
(5, 'PAY2112-0005', '', 1, '2021-12-17 09:49:07', '2021-12-17 09:49:07', '2021-12-17 12:00:00', 214.00000000, 214.00000000, 2, '', '', NULL, NULL, 7, 1, NULL, 0, 0, 0.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_paiementcharge`
--

CREATE TABLE `erp_paiementcharge` (
  `rowid` int(11) NOT NULL,
  `fk_charge` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_paiementfourn`
--

CREATE TABLE `erp_paiementfourn` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_paiementfourn_facturefourn`
--

CREATE TABLE `erp_paiementfourn_facturefourn` (
  `rowid` int(11) NOT NULL,
  `fk_paiementfourn` int(11) DEFAULT NULL,
  `fk_facturefourn` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_paiement_facture`
--

CREATE TABLE `erp_paiement_facture` (
  `rowid` int(11) NOT NULL,
  `fk_paiement` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_paiement_facture`
--

INSERT INTO `erp_paiement_facture` (`rowid`, `fk_paiement`, `fk_facture`, `amount`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_amount`) VALUES
(1, 1, 6, 279.37000000, NULL, 1.00000000, 279.37000000),
(2, 2, 8, 321.00000000, NULL, 1.00000000, 321.00000000),
(3, 2, 11, 500.00000000, NULL, 1.00000000, 500.00000000),
(4, 3, 27, 25.90000000, NULL, 1.00000000, 25.90000000),
(5, 4, 35, 214.00000000, NULL, 1.00000000, 214.00000000),
(6, 5, 36, 214.00000000, NULL, 1.00000000, 214.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_partnership`
--

CREATE TABLE `erp_partnership` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `status` smallint(6) NOT NULL DEFAULT 0,
  `fk_type` int(11) NOT NULL DEFAULT 0,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `date_partnership_start` date NOT NULL,
  `date_partnership_end` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `reason_decline_or_cancel` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_last_url_check_error` int(11) DEFAULT 0,
  `last_check_backlink` datetime DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_partnership_extrafields`
--

CREATE TABLE `erp_partnership_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_payment_donation`
--

CREATE TABLE `erp_payment_donation` (
  `rowid` int(11) NOT NULL,
  `fk_donation` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_site` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_payment_expensereport`
--

CREATE TABLE `erp_payment_expensereport` (
  `rowid` int(11) NOT NULL,
  `fk_expensereport` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_payment_loan`
--

CREATE TABLE `erp_payment_loan` (
  `rowid` int(11) NOT NULL,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT 0.00000000,
  `amount_insurance` double(24,8) DEFAULT 0.00000000,
  `amount_interest` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_payment_salary`
--

CREATE TABLE `erp_payment_salary` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_payment_various`
--

CREATE TABLE `erp_payment_various` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `sens` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `accountancy_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subledger_account` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_payment_vat`
--

CREATE TABLE `erp_payment_vat` (
  `rowid` int(11) NOT NULL,
  `fk_tva` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_pos_cash_fence`
--

CREATE TABLE `erp_pos_cash_fence` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening` double(24,8) DEFAULT 0.00000000,
  `cash` double(24,8) DEFAULT 0.00000000,
  `card` double(24,8) DEFAULT 0.00000000,
  `cheque` double(24,8) DEFAULT 0.00000000,
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `day_close` int(11) DEFAULT NULL,
  `month_close` int(11) DEFAULT NULL,
  `year_close` int(11) DEFAULT NULL,
  `posmodule` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posnumber` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_pos_cash_fence`
--

INSERT INTO `erp_pos_cash_fence` (`rowid`, `entity`, `ref`, `label`, `opening`, `cash`, `card`, `cheque`, `status`, `date_creation`, `date_valid`, `day_close`, `month_close`, `year_close`, `posmodule`, `posnumber`, `fk_user_creat`, `fk_user_valid`, `tms`, `import_key`) VALUES
(1, 1, '1', NULL, 279.37000000, NULL, NULL, NULL, 1, '2021-12-08 09:59:48', '2021-12-08 10:00:01', 8, 12, 2021, 'takepos', '1', 0, 1, '2021-12-08 10:00:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_prelevement_bons`
--

CREATE TABLE `erp_prelevement_bons` (
  `rowid` int(11) NOT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'debit-order',
  `ref` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `statut` smallint(6) DEFAULT 0,
  `credite` smallint(6) DEFAULT 0,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_trans` datetime DEFAULT NULL,
  `method_trans` smallint(6) DEFAULT NULL,
  `fk_user_trans` int(11) DEFAULT NULL,
  `date_credit` datetime DEFAULT NULL,
  `fk_user_credit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_prelevement_facture`
--

CREATE TABLE `erp_prelevement_facture` (
  `rowid` int(11) NOT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_fourn` int(11) DEFAULT NULL,
  `fk_prelevement_lignes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_prelevement_facture_demande`
--

CREATE TABLE `erp_prelevement_facture_demande` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_fourn` int(11) DEFAULT NULL,
  `sourcetype` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `date_demande` datetime NOT NULL,
  `traite` smallint(6) DEFAULT 0,
  `date_traite` datetime DEFAULT NULL,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_user_demande` int(11) NOT NULL,
  `code_banque` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_guichet` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_rib` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_site` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_prelevement_lignes`
--

CREATE TABLE `erp_prelevement_lignes` (
  `rowid` int(11) NOT NULL,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `statut` smallint(6) DEFAULT 0,
  `client_nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `code_banque` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_guichet` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_rib` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_prelevement_rejet`
--

CREATE TABLE `erp_prelevement_rejet` (
  `rowid` int(11) NOT NULL,
  `fk_prelevement_lignes` int(11) DEFAULT NULL,
  `date_rejet` datetime DEFAULT NULL,
  `motif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_creation` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `afacturer` tinyint(4) DEFAULT 0,
  `fk_facture` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_printing`
--

CREATE TABLE `erp_printing` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `printer_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `printer_location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `printer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copy` int(11) NOT NULL DEFAULT 1,
  `module` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product`
--

CREATE TABLE `erp_product` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_parent` int(11) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customcode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `fk_state` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'HT',
  `cost_price` double(24,8) DEFAULT NULL,
  `default_vat_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT 1,
  `tobuy` tinyint(4) DEFAULT 1,
  `onportal` tinyint(4) DEFAULT 0,
  `tobatch` tinyint(4) NOT NULL DEFAULT 0,
  `batch_mask` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_product_type` int(11) DEFAULT 0,
  `duration` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seuil_stock_alerte` float DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partnumber` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_measure` float DEFAULT NULL,
  `net_measure_units` tinyint(4) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` tinyint(4) DEFAULT NULL,
  `length` float DEFAULT NULL,
  `length_units` tinyint(4) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `width_units` tinyint(4) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `height_units` tinyint(4) DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `surface_units` tinyint(4) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `volume_units` tinyint(4) DEFAULT NULL,
  `stock` double DEFAULT NULL,
  `pmp` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fifo` double(24,8) DEFAULT NULL,
  `lifo` double(24,8) DEFAULT NULL,
  `fk_default_warehouse` int(11) DEFAULT NULL,
  `canvas` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finished` tinyint(4) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `qc_frequency` int(11) DEFAULT NULL,
  `hidden` tinyint(4) DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_price_expression` int(11) DEFAULT NULL,
  `desiredstock` float DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `price_autogen` tinyint(4) DEFAULT 0,
  `fk_project` int(11) DEFAULT NULL,
  `mandatory_period` tinyint(4) DEFAULT 0,
  `fk_default_bom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product`
--

INSERT INTO `erp_product` (`rowid`, `ref`, `entity`, `ref_ext`, `datec`, `tms`, `fk_parent`, `label`, `description`, `note_public`, `note`, `customcode`, `fk_country`, `fk_state`, `price`, `price_ttc`, `price_min`, `price_min_ttc`, `price_base_type`, `cost_price`, `default_vat_code`, `tva_tx`, `recuperableonly`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `fk_user_author`, `fk_user_modif`, `tosell`, `tobuy`, `onportal`, `tobatch`, `batch_mask`, `fk_product_type`, `duration`, `seuil_stock_alerte`, `url`, `barcode`, `fk_barcode_type`, `accountancy_code_sell`, `accountancy_code_sell_intra`, `accountancy_code_sell_export`, `accountancy_code_buy`, `accountancy_code_buy_intra`, `accountancy_code_buy_export`, `partnumber`, `net_measure`, `net_measure_units`, `weight`, `weight_units`, `length`, `length_units`, `width`, `width_units`, `height`, `height_units`, `surface`, `surface_units`, `volume`, `volume_units`, `stock`, `pmp`, `fifo`, `lifo`, `fk_default_warehouse`, `canvas`, `finished`, `lifetime`, `qc_frequency`, `hidden`, `import_key`, `model_pdf`, `fk_price_expression`, `desiredstock`, `fk_unit`, `price_autogen`, `fk_project`, `mandatory_period`, `fk_default_bom`) VALUES
(1, '09112021', 1, NULL, '2021-11-09 09:40:32', '2021-12-19 13:49:55', 0, '09112021', 'Product A', NULL, '', '', NULL, NULL, 26.90000000, 28.78300000, 0.00000000, 0.00000000, 'HT', NULL, '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 1, 1, 0, 1, '', 0, '', 5, NULL, '09112021', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 98, 20.00000000, NULL, NULL, 1, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL),
(2, 'ABC123', 1, NULL, '2021-11-12 06:52:39', '2021-12-17 09:41:39', 0, 'Test Product A', 'This is a test product', NULL, '', '', 29, NULL, 100.00000000, 107.00000000, 50.00000000, 53.50000000, 'HT', 20.00000000, '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 1, 1, 0, 0, '', 0, '', 5, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, -1, 100.00000000, NULL, NULL, NULL, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, 20, NULL, 0, NULL, 0, NULL),
(3, 'Test001', 1, NULL, '2021-11-12 06:57:59', '2021-12-17 09:45:44', 0, 'Sample Product A', '', NULL, '', '', NULL, NULL, 200.00000000, 214.00000000, 50.00000000, 53.50000000, 'HT', NULL, '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 1, 1, 0, 1, '', 0, '', 0, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, -100, 20.00000000, NULL, NULL, 1, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL),
(4, 'TEST002', 1, NULL, '2021-11-12 09:17:46', '2021-12-08 11:56:34', 0, 'Test Product 2', 'This is a test product 2', NULL, '', '', NULL, NULL, 1000.00000000, 1070.00000000, 800.00000000, 856.00000000, 'HT', NULL, '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 1, 1, 0, 1, '', 0, '', 0, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0.00000000, NULL, NULL, 1, '', 1, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL),
(5, '1001', 1, NULL, '2021-11-22 08:04:41', '2021-11-22 08:07:19', 0, 'Testing', '', NULL, '', '', NULL, NULL, 10.00000000, 10.70000000, 8.00000000, 8.56000000, 'HT', 5.00000000, '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 1, 1, 0, 0, '', 0, '', 0, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0.00000000, NULL, NULL, 1, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, 10, NULL, 0, NULL, 0, NULL),
(6, '09112021_BLU', 1, NULL, '2021-12-08 11:35:25', '2021-12-08 11:35:25', 0, '09112021 Blue', 'Product A<br><strong>Colour:</strong> Blue', NULL, '', '', NULL, NULL, 26.90000000, 28.78300000, 0.00000000, 0.00000000, 'HT', NULL, NULL, 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 1, 1, 0, 1, '', 0, '', 5, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0.00000000, NULL, NULL, 1, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL),
(7, '001', 1, NULL, '2021-12-12 12:21:41', '2021-12-12 12:22:06', 0, 'Table', '', NULL, '', '', NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 'HT', NULL, '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 1, 1, 0, 0, '', 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0.00000000, NULL, NULL, NULL, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL),
(8, '002', 1, NULL, '2021-12-12 12:40:33', '2021-12-13 14:29:12', 0, 'Servicing', '', NULL, '', '', NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 'HT', NULL, '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 1, 1, 0, 0, '', 1, '1h', 0, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, NULL, NULL, NULL, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_association`
--

CREATE TABLE `erp_product_association` (
  `rowid` int(11) NOT NULL,
  `fk_product_pere` int(11) NOT NULL DEFAULT 0,
  `fk_product_fils` int(11) NOT NULL DEFAULT 0,
  `qty` double DEFAULT NULL,
  `incdec` int(11) DEFAULT 1,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_attribute`
--

CREATE TABLE `erp_product_attribute` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rang` int(11) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product_attribute`
--

INSERT INTO `erp_product_attribute` (`rowid`, `ref`, `ref_ext`, `label`, `rang`, `entity`) VALUES
(1, 'COR', '', 'Colour', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_attribute_combination`
--

CREATE TABLE `erp_product_attribute_combination` (
  `rowid` int(11) NOT NULL,
  `fk_product_parent` int(11) NOT NULL,
  `fk_product_child` int(11) NOT NULL,
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL,
  `variation_weight` double NOT NULL,
  `variation_ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product_attribute_combination`
--

INSERT INTO `erp_product_attribute_combination` (`rowid`, `fk_product_parent`, `fk_product_child`, `variation_price`, `variation_price_percentage`, `variation_weight`, `variation_ref_ext`, `entity`) VALUES
(1, 1, 6, 0.00000000, 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_attribute_combination2val`
--

CREATE TABLE `erp_product_attribute_combination2val` (
  `rowid` int(11) NOT NULL,
  `fk_prod_combination` int(11) NOT NULL,
  `fk_prod_attr` int(11) NOT NULL,
  `fk_prod_attr_val` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product_attribute_combination2val`
--

INSERT INTO `erp_product_attribute_combination2val` (`rowid`, `fk_prod_combination`, `fk_prod_attr`, `fk_prod_attr_val`) VALUES
(1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_attribute_combination_price_level`
--

CREATE TABLE `erp_product_attribute_combination_price_level` (
  `rowid` int(11) NOT NULL,
  `fk_product_attribute_combination` int(11) NOT NULL DEFAULT 1,
  `fk_price_level` int(11) NOT NULL DEFAULT 1,
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_attribute_value`
--

CREATE TABLE `erp_product_attribute_value` (
  `rowid` int(11) NOT NULL,
  `fk_product_attribute` int(11) NOT NULL,
  `ref` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product_attribute_value`
--

INSERT INTO `erp_product_attribute_value` (`rowid`, `fk_product_attribute`, `ref`, `value`, `entity`) VALUES
(1, 1, 'RED', 'Red', 1),
(2, 1, 'BLU', 'Blue', 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_batch`
--

CREATE TABLE `erp_product_batch` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product_stock` int(11) NOT NULL,
  `eatby` datetime DEFAULT NULL,
  `sellby` datetime DEFAULT NULL,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product_batch`
--

INSERT INTO `erp_product_batch` (`rowid`, `tms`, `fk_product_stock`, `eatby`, `sellby`, `batch`, `qty`, `import_key`) VALUES
(2, '2021-12-19 13:49:55', 2, NULL, NULL, '123', 48, NULL),
(3, '2021-12-17 09:45:44', 4, NULL, NULL, '456', -100, NULL),
(4, '2021-12-08 11:56:34', 2, NULL, NULL, '124', 50, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_customer_price`
--

CREATE TABLE `erp_product_customer_price` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `ref_customer` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'HT',
  `default_vat_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_customer_price_log`
--

CREATE TABLE `erp_product_customer_price_log` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL DEFAULT 0,
  `ref_customer` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'HT',
  `default_vat_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_extrafields`
--

CREATE TABLE `erp_product_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_fournisseur_price`
--

CREATE TABLE `erp_product_fournisseur_price` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `ref_fourn` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_fourn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT 0,
  `remise` double NOT NULL DEFAULT 0,
  `unitprice` double(24,8) DEFAULT 0.00000000,
  `charges` double(24,8) DEFAULT 0.00000000,
  `default_vat_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `tva_tx` double(7,4) NOT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `info_bits` int(11) NOT NULL DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `fk_supplier_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time_days` int(11) DEFAULT NULL,
  `supplier_reputation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packaging` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product_fournisseur_price`
--

INSERT INTO `erp_product_fournisseur_price` (`rowid`, `entity`, `datec`, `tms`, `fk_product`, `fk_soc`, `ref_fourn`, `desc_fourn`, `fk_availability`, `price`, `quantity`, `remise_percent`, `remise`, `unitprice`, `charges`, `default_vat_code`, `barcode`, `fk_barcode_type`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `info_bits`, `fk_user`, `fk_supplier_price_expression`, `import_key`, `delivery_time_days`, `supplier_reputation`, `packaging`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_unitprice`, `multicurrency_price`) VALUES
(1, 1, '2021-11-12 06:56:42', '2021-11-12 06:56:42', 2, 2, 'XYZ123', '', 0, 100.00000000, 1, 0, 0, 100.00000000, 0.00000000, NULL, NULL, NULL, 7.0000, 0.0000, '0', 0.0000, '0', 0, 1, NULL, NULL, NULL, NULL, NULL, 0, 'SGD', 1.00000000, 100.00000000, 100.00000000),
(2, 1, '2021-11-22 08:10:57', '2021-11-22 08:10:57', 5, 2, 'Test123', '', 0, 0.00000000, 5, 0, 0, 0.00000000, 0.00000000, NULL, NULL, NULL, 15.0000, 0.0000, '0', 0.0000, '0', 0, 1, NULL, NULL, NULL, NULL, NULL, 0, 'SGD', 10.00000000, 0.00000000, 0.00000000),
(3, 1, '2021-12-12 12:38:50', '2021-12-12 12:38:50', 7, 5, 'ABC001', '', 0, 10.00000000, 1, 0, 0, 10.00000000, 0.00000000, NULL, NULL, NULL, 3.0000, 0.0000, '0', 0.0000, '0', 0, 1, NULL, NULL, NULL, NULL, NULL, 0, 'SGD', 1.00000000, 10.00000000, 10.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_fournisseur_price_extrafields`
--

CREATE TABLE `erp_product_fournisseur_price_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_fournisseur_price_log`
--

CREATE TABLE `erp_product_fournisseur_price_log` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_product_fournisseur` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `quantity` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product_fournisseur_price_log`
--

INSERT INTO `erp_product_fournisseur_price_log` (`rowid`, `datec`, `fk_product_fournisseur`, `price`, `quantity`, `fk_user`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_unitprice`, `multicurrency_price`) VALUES
(1, '2021-11-12 06:56:42', 1, 100.00000000, 1, 1, 0, 'SGD', 1.00000000, 100.00000000, 100.00000000),
(2, '2021-11-22 08:10:57', 2, 0.00000000, 5, 1, 0, 'SGD', 10.00000000, 0.00000000, 0.00000000),
(3, '2021-12-12 12:38:50', 3, 10.00000000, 1, 1, 0, 'SGD', 1.00000000, 10.00000000, 10.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_lang`
--

CREATE TABLE `erp_product_lang` (
  `rowid` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_lot`
--

CREATE TABLE `erp_product_lot` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `eol_date` datetime DEFAULT NULL,
  `manufacturing_date` datetime DEFAULT NULL,
  `scrapping_date` datetime DEFAULT NULL,
  `barcode` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product_lot`
--

INSERT INTO `erp_product_lot` (`rowid`, `entity`, `fk_product`, `batch`, `eatby`, `sellby`, `eol_date`, `manufacturing_date`, `scrapping_date`, `barcode`, `fk_barcode_type`, `datec`, `tms`, `fk_user_creat`, `fk_user_modif`, `import_key`) VALUES
(1, 1, 4, 'Lot Test 02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-12 09:18:26', '2021-11-12 09:18:26', NULL, NULL, NULL),
(2, 1, 1, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-12 09:40:15', '2021-11-12 09:40:15', NULL, NULL, NULL),
(3, 1, 3, '456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-12 09:40:15', '2021-11-12 09:40:15', NULL, NULL, NULL),
(4, 1, 1, '124', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-08 11:56:34', '2021-12-08 11:56:34', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_lot_extrafields`
--

CREATE TABLE `erp_product_lot_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_perentity`
--

CREATE TABLE `erp_product_perentity` (
  `rowid` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pmp` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_price`
--

CREATE TABLE `erp_product_price` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `date_price` datetime NOT NULL,
  `price_level` smallint(6) DEFAULT 1,
  `price` double(24,8) DEFAULT NULL,
  `price_ttc` double(24,8) DEFAULT NULL,
  `price_min` double(24,8) DEFAULT NULL,
  `price_min_ttc` double(24,8) DEFAULT NULL,
  `price_base_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'HT',
  `default_vat_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_tx` double(7,4) NOT NULL DEFAULT 0.0000,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT 1,
  `price_by_qty` int(11) NOT NULL DEFAULT 0,
  `fk_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product_price`
--

INSERT INTO `erp_product_price` (`rowid`, `entity`, `tms`, `fk_product`, `date_price`, `price_level`, `price`, `price_ttc`, `price_min`, `price_min_ttc`, `price_base_type`, `default_vat_code`, `tva_tx`, `recuperableonly`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `fk_user_author`, `tosell`, `price_by_qty`, `fk_price_expression`, `import_key`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_price`, `multicurrency_price_ttc`) VALUES
(1, 1, '2021-11-09 09:40:32', 1, '2021-11-09 09:40:32', 1, 26.90000000, 26.90000000, 0.00000000, 0.00000000, 'HT', NULL, 0.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(2, 1, '2021-11-11 04:44:10', 1, '2021-11-11 04:44:10', 1, 26.90000000, 28.78300000, 0.00000000, 0.00000000, 'HT', '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(3, 1, '2021-11-12 06:52:39', 2, '2021-11-12 06:52:39', 1, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 'HT', '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(4, 1, '2021-11-12 06:53:33', 2, '2021-11-12 06:53:33', 1, 100.00000000, 107.00000000, 50.00000000, 53.50000000, 'HT', '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(5, 1, '2021-11-12 06:57:59', 3, '2021-11-12 06:57:59', 1, 200.00000000, 214.00000000, 50.00000000, 53.50000000, 'HT', '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(6, 1, '2021-11-12 09:17:46', 4, '2021-11-12 09:17:46', 1, 1000.00000000, 1070.00000000, 800.00000000, 856.00000000, 'HT', '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(7, 1, '2021-11-22 08:04:41', 5, '2021-11-22 08:04:41', 1, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 'HT', '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(8, 1, '2021-11-22 08:06:49', 5, '2021-11-22 08:06:49', 1, 10.00000000, 10.70000000, 8.00000000, 8.56000000, 'HT', '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(9, 1, '2021-12-08 11:35:25', 6, '2021-12-08 11:35:25', 1, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 'HT', '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(10, 1, '2021-12-08 11:35:25', 6, '2021-12-08 11:35:25', 1, 26.90000000, 28.78300000, 0.00000000, 0.00000000, 'HT', NULL, 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(11, 1, '2021-12-12 12:21:41', 7, '2021-12-12 12:21:41', 1, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 'HT', '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL),
(12, 1, '2021-12-12 12:40:33', 8, '2021-12-12 12:40:33', 1, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 'HT', '7', 7.0000, 0, 0.0000, '0', 0.0000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_pricerules`
--

CREATE TABLE `erp_product_pricerules` (
  `rowid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `fk_level` int(11) NOT NULL,
  `var_percent` double NOT NULL,
  `var_min_percent` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_price_by_qty`
--

CREATE TABLE `erp_product_price_by_qty` (
  `rowid` int(11) NOT NULL,
  `fk_product_price` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'HT',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT 0,
  `remise` double NOT NULL DEFAULT 0,
  `unitprice` double(24,8) DEFAULT 0.00000000,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_stock`
--

CREATE TABLE `erp_product_stock` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `reel` double DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_product_stock`
--

INSERT INTO `erp_product_stock` (`rowid`, `tms`, `fk_product`, `fk_entrepot`, `reel`, `import_key`) VALUES
(2, '2021-12-19 13:49:55', 1, 1, 98, NULL),
(4, '2021-12-17 09:45:44', 3, 1, -100, NULL),
(6, '2021-12-17 09:41:39', 2, 1, -1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_product_warehouse_properties`
--

CREATE TABLE `erp_product_warehouse_properties` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `seuil_stock_alerte` float DEFAULT 0,
  `desiredstock` float DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_projet`
--

CREATE TABLE `erp_projet` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `public` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT 0,
  `fk_opp_status` int(11) DEFAULT NULL,
  `opp_percent` double(5,2) DEFAULT NULL,
  `fk_opp_status_end` int(11) DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `fk_user_close` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_msgid` varchar(175) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opp_amount` double(24,8) DEFAULT NULL,
  `budget_amount` double(24,8) DEFAULT NULL,
  `usage_opportunity` int(11) DEFAULT 0,
  `usage_task` int(11) DEFAULT 1,
  `usage_bill_time` int(11) DEFAULT 0,
  `usage_organize_event` int(11) DEFAULT 0,
  `accept_conference_suggestions` int(11) DEFAULT 0,
  `accept_booth_suggestions` int(11) DEFAULT 0,
  `max_attendees` int(11) DEFAULT 0,
  `price_registration` double(24,8) DEFAULT NULL,
  `price_booth` double(24,8) DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_projet`
--

INSERT INTO `erp_projet` (`rowid`, `fk_soc`, `datec`, `tms`, `dateo`, `datee`, `ref`, `entity`, `title`, `description`, `fk_user_creat`, `fk_user_modif`, `public`, `fk_statut`, `fk_opp_status`, `opp_percent`, `fk_opp_status_end`, `date_close`, `fk_user_close`, `note_private`, `note_public`, `email_msgid`, `opp_amount`, `budget_amount`, `usage_opportunity`, `usage_task`, `usage_bill_time`, `usage_organize_event`, `accept_conference_suggestions`, `accept_booth_suggestions`, `max_attendees`, `price_registration`, `price_booth`, `model_pdf`, `last_main_doc`, `import_key`) VALUES
(1, 6, '2021-12-13 14:21:56', '2021-12-20 06:16:23', '2021-12-13', NULL, 'PJ2112-0001', 1, 'Test Project A', '', 1, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, NULL, NULL, NULL, 'projet/PJ2112-0001/PJ2112-0001.pdf', NULL),
(2, NULL, '2021-12-13 14:26:24', '2021-12-13 14:26:24', '2021-12-13', NULL, 'PJ2112-0002', 1, 'Lead 1', '', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_projet_extrafields`
--

CREATE TABLE `erp_projet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_projet_task`
--

CREATE TABLE `erp_projet_task` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_projet` int(11) NOT NULL,
  `fk_task_parent` int(11) NOT NULL DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateo` datetime DEFAULT NULL,
  `datee` datetime DEFAULT NULL,
  `datev` datetime DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_effective` double DEFAULT 0,
  `planned_workload` double DEFAULT 0,
  `progress` int(11) DEFAULT 0,
  `priority` int(11) DEFAULT 0,
  `budget_amount` double(24,8) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_projet_task`
--

INSERT INTO `erp_projet_task` (`rowid`, `ref`, `entity`, `fk_projet`, `fk_task_parent`, `datec`, `tms`, `dateo`, `datee`, `datev`, `label`, `description`, `duration_effective`, `planned_workload`, `progress`, `priority`, `budget_amount`, `fk_user_creat`, `fk_user_modif`, `fk_user_valid`, `fk_statut`, `note_private`, `note_public`, `rang`, `model_pdf`, `import_key`) VALUES
(1, 'TK2112-0001', 1, 1, 0, '2021-12-13 14:23:47', '2021-12-13 14:28:13', '2021-12-13 07:00:00', '2021-12-13 21:00:00', NULL, 'Do something', '', 10800, NULL, 100, 0, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_projet_task_extrafields`
--

CREATE TABLE `erp_projet_task_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_projet_task_time`
--

CREATE TABLE `erp_projet_task_time` (
  `rowid` int(11) NOT NULL,
  `fk_task` int(11) NOT NULL,
  `task_date` date DEFAULT NULL,
  `task_datehour` datetime DEFAULT NULL,
  `task_date_withhour` int(11) DEFAULT 0,
  `task_duration` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `thm` double(24,8) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `invoice_line_id` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_projet_task_time`
--

INSERT INTO `erp_projet_task_time` (`rowid`, `fk_task`, `task_date`, `task_datehour`, `task_date_withhour`, `task_duration`, `fk_user`, `thm`, `invoice_id`, `invoice_line_id`, `import_key`, `datec`, `tms`, `note`) VALUES
(1, 1, '2021-12-13', '2021-12-13 12:00:00', 0, 10800, 1, NULL, 33, 85, NULL, NULL, '2021-12-13 14:30:16', '');

-- --------------------------------------------------------

--
-- Table structure for table `erp_propal`
--

CREATE TABLE `erp_propal` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_signature` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_signature` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_propal`
--

INSERT INTO `erp_propal` (`rowid`, `ref`, `entity`, `ref_ext`, `ref_int`, `ref_client`, `fk_soc`, `fk_projet`, `tms`, `datec`, `datep`, `fin_validite`, `date_valid`, `date_signature`, `date_cloture`, `fk_user_author`, `fk_user_modif`, `fk_user_valid`, `fk_user_signature`, `fk_user_cloture`, `fk_statut`, `price`, `remise_percent`, `remise_absolue`, `remise`, `total_ht`, `total_tva`, `localtax1`, `localtax2`, `total_ttc`, `fk_account`, `fk_currency`, `fk_cond_reglement`, `fk_mode_reglement`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `date_livraison`, `fk_shipping_method`, `fk_warehouse`, `fk_availability`, `fk_input_reason`, `fk_incoterms`, `location_incoterms`, `import_key`, `extraparams`, `fk_delivery_address`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES
(1, 'PR2112-0001', 1, NULL, NULL, '', 3, NULL, '2021-12-17 09:14:33', '2021-12-17 09:09:43', '2021-12-17', '2022-01-01 12:00:00', '2021-12-17 09:14:20', '2021-12-17 09:14:33', NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, 10.00000000, 0.70000000, 0.00000000, 0.00000000, 10.70000000, NULL, NULL, 2, NULL, '', '', 'azur', 'propale/PR2112-0001/PR2112-0001.pdf', '2021-12-17', NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, 0, 'SGD', 1.00000000, 10.00000000, 0.70000000, 10.70000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_propaldet`
--

CREATE TABLE `erp_propaldet` (
  `rowid` int(11) NOT NULL,
  `fk_propal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_propaldet`
--

INSERT INTO `erp_propaldet` (`rowid`, `fk_propal`, `fk_parent_line`, `fk_product`, `label`, `description`, `fk_remise_except`, `vat_src_code`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `qty`, `remise_percent`, `remise`, `price`, `subprice`, `total_ht`, `total_tva`, `total_localtax1`, `total_localtax2`, `total_ttc`, `product_type`, `date_start`, `date_end`, `info_bits`, `buy_price_ht`, `fk_product_fournisseur_price`, `special_code`, `rang`, `fk_unit`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_subprice`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES
(1, 1, NULL, 5, NULL, '', NULL, '7', 7.0000, 0.0000, '0', 0.0000, '0', 1, 0, 0, NULL, 10.00000000, 10.00000000, 0.70000000, 0.00000000, 0.00000000, 10.70000000, 0, NULL, NULL, 0, 5.00000000, NULL, 0, 1, NULL, NULL, 'SGD', 10.00000000, 10.00000000, 0.70000000, 10.70000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_propaldet_extrafields`
--

CREATE TABLE `erp_propaldet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_propal_extrafields`
--

CREATE TABLE `erp_propal_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_propal_merge_pdf_product`
--

CREATE TABLE `erp_propal_merge_pdf_product` (
  `rowid` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `file_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_reception`
--

CREATE TABLE `erp_reception` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_supplier` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_reception` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_reception_extrafields`
--

CREATE TABLE `erp_reception_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_recruitment_recruitmentcandidature`
--

CREATE TABLE `erp_recruitment_recruitmentcandidature` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `fk_recruitmentjobposition` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `firstname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `remuneration_requested` int(11) DEFAULT NULL,
  `remuneration_proposed` int(11) DEFAULT NULL,
  `email_msgid` varchar(175) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_recruitment_origin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_recruitment_recruitmentcandidature_extrafields`
--

CREATE TABLE `erp_recruitment_recruitmentcandidature_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_recruitment_recruitmentjobposition`
--

CREATE TABLE `erp_recruitment_recruitmentjobposition` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_user_recruiter` int(11) DEFAULT NULL,
  `email_recruiter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_supervisor` int(11) DEFAULT NULL,
  `fk_establishment` int(11) DEFAULT NULL,
  `date_planned` date DEFAULT NULL,
  `remuneration_suggested` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_recruitment_recruitmentjobposition_extrafields`
--

CREATE TABLE `erp_recruitment_recruitmentjobposition_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_resource`
--

CREATE TABLE `erp_resource` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_code_type_resource` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_resource_extrafields`
--

CREATE TABLE `erp_resource_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_rights_def`
--

CREATE TABLE `erp_rights_def` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_position` int(11) NOT NULL DEFAULT 0,
  `family_position` int(11) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `perms` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subperms` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bydefault` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_rights_def`
--

INSERT INTO `erp_rights_def` (`id`, `libelle`, `module`, `module_position`, `family_position`, `entity`, `perms`, `subperms`, `type`, `bydefault`) VALUES
(11, 'Read invoices', 'facture', 11, 0, 1, 'lire', NULL, 'a', 0),
(12, 'Create and update invoices', 'facture', 11, 0, 1, 'creer', NULL, 'a', 0),
(13, 'Devalidate invoices', 'facture', 11, 0, 1, 'invoice_advance', 'unvalidate', 'a', 0),
(14, 'Validate invoices', 'facture', 11, 0, 1, 'invoice_advance', 'validate', 'a', 0),
(15, 'Send invoices by email', 'facture', 11, 0, 1, 'invoice_advance', 'send', 'a', 0),
(16, 'Issue payments on invoices', 'facture', 11, 0, 1, 'paiement', NULL, 'a', 0),
(19, 'Delete invoices', 'facture', 11, 0, 1, 'supprimer', NULL, 'a', 0),
(21, 'Read commercial proposals', 'propale', 10, 0, 1, 'lire', NULL, 'r', 0),
(22, 'Create and update commercial proposals', 'propale', 10, 0, 1, 'creer', NULL, 'w', 0),
(24, 'Validate commercial proposals', 'propale', 10, 0, 1, 'propal_advance', 'validate', 'd', 0),
(25, 'Send commercial proposals to customers', 'propale', 10, 0, 1, 'propal_advance', 'send', 'd', 0),
(26, 'Close commercial proposals', 'propale', 10, 0, 1, 'propal_advance', 'close', 'd', 0),
(27, 'Delete commercial proposals', 'propale', 10, 0, 1, 'supprimer', NULL, 'd', 0),
(28, 'Exporting commercial proposals and attributes', 'propale', 10, 0, 1, 'export', NULL, 'r', 0),
(31, 'Read products', 'produit', 26, 0, 1, 'lire', NULL, 'r', 0),
(32, 'Create/modify products', 'produit', 26, 0, 1, 'creer', NULL, 'w', 0),
(34, 'Delete products', 'produit', 26, 0, 1, 'supprimer', NULL, 'd', 0),
(38, 'Export products', 'produit', 26, 0, 1, 'export', NULL, 'r', 0),
(39, 'Ignore minimum price', 'produit', 26, 0, 1, 'ignore_price_min_advance', NULL, 'r', 0),
(61, 'Lire les fiches d\'intervention', 'ficheinter', 41, 0, 1, 'lire', NULL, 'r', 0),
(62, 'Creer/modifier les fiches d\'intervention', 'ficheinter', 41, 0, 1, 'creer', NULL, 'w', 0),
(64, 'Supprimer les fiches d\'intervention', 'ficheinter', 41, 0, 1, 'supprimer', NULL, 'd', 0),
(67, 'Exporter les fiches interventions', 'ficheinter', 41, 0, 1, 'export', NULL, 'r', 0),
(68, 'Envoyer les fiches d\'intervention par courriel', 'ficheinter', 41, 0, 1, 'ficheinter_advance', 'send', 'r', 0),
(69, 'Valider les fiches d\'intervention ', 'ficheinter', 41, 0, 1, 'ficheinter_advance', 'validate', 'a', 0),
(70, 'DĂ©valider les fiches d\'intervention', 'ficheinter', 41, 0, 1, 'ficheinter_advance', 'unvalidate', 'a', 0),
(81, 'Read sales orders', 'commande', 11, 0, 1, 'lire', NULL, 'r', 0),
(82, 'Creeat/modify sales orders', 'commande', 11, 0, 1, 'creer', NULL, 'w', 0),
(84, 'Validate sales orders', 'commande', 11, 0, 1, 'order_advance', 'validate', 'd', 0),
(86, 'Send sale orders by email', 'commande', 11, 0, 1, 'order_advance', 'send', 'd', 0),
(87, 'Close sale orders', 'commande', 11, 0, 1, 'order_advance', 'close', 'd', 0),
(88, 'Cancel sale orders', 'commande', 11, 0, 1, 'order_advance', 'annuler', 'd', 0),
(89, 'Delete sales orders', 'commande', 11, 0, 1, 'supprimer', NULL, 'd', 0),
(91, 'Lire les charges', 'tax', 50, 0, 1, 'charges', 'lire', 'r', 0),
(92, 'Creer/modifier les charges', 'tax', 50, 0, 1, 'charges', 'creer', 'w', 0),
(93, 'Supprimer les charges', 'tax', 50, 0, 1, 'charges', 'supprimer', 'd', 0),
(94, 'Exporter les charges', 'tax', 50, 0, 1, 'charges', 'export', 'r', 0),
(101, 'Lire les expeditions', 'expedition', 40, 0, 1, 'lire', NULL, 'r', 0),
(102, 'Creer modifier les expeditions', 'expedition', 40, 0, 1, 'creer', NULL, 'w', 0),
(104, 'Valider les expeditions', 'expedition', 40, 0, 1, 'shipping_advance', 'validate', 'd', 0),
(105, 'Envoyer les expeditions aux clients', 'expedition', 40, 0, 1, 'shipping_advance', 'send', 'd', 0),
(106, 'Exporter les expeditions', 'expedition', 40, 0, 1, 'shipment', 'export', 'r', 0),
(109, 'Supprimer les expeditions', 'expedition', 40, 0, 1, 'supprimer', NULL, 'd', 0),
(111, 'Read bank account and transactions', 'banque', 51, 0, 1, 'lire', NULL, 'r', 0),
(112, 'Creer/modifier montant/supprimer ecriture bancaire', 'banque', 51, 0, 1, 'modifier', NULL, 'w', 0),
(113, 'Configurer les comptes bancaires (creer, gerer categories)', 'banque', 51, 0, 1, 'configurer', NULL, 'a', 0),
(114, 'Rapprocher les ecritures bancaires', 'banque', 51, 0, 1, 'consolidate', NULL, 'w', 0),
(115, 'Exporter transactions et releves', 'banque', 51, 0, 1, 'export', NULL, 'r', 0),
(116, 'Virements entre comptes', 'banque', 51, 0, 1, 'transfer', NULL, 'w', 0),
(117, 'Gerer les envois de cheques', 'banque', 51, 0, 1, 'cheque', NULL, 'w', 0),
(121, 'Read third parties', 'societe', 9, 0, 1, 'lire', NULL, 'r', 0),
(122, 'Create and update third parties', 'societe', 9, 0, 1, 'creer', NULL, 'w', 0),
(125, 'Delete third parties', 'societe', 9, 0, 1, 'supprimer', NULL, 'd', 0),
(126, 'Export third parties', 'societe', 9, 0, 1, 'export', NULL, 'r', 0),
(161, 'Lire les contrats', 'contrat', 41, 0, 1, 'lire', NULL, 'r', 0),
(162, 'Creer / modifier les contrats', 'contrat', 41, 0, 1, 'creer', NULL, 'w', 0),
(163, 'Activer un service d\'un contrat', 'contrat', 41, 0, 1, 'activer', NULL, 'w', 0),
(164, 'Desactiver un service d\'un contrat', 'contrat', 41, 0, 1, 'desactiver', NULL, 'w', 0),
(165, 'Supprimer un contrat', 'contrat', 41, 0, 1, 'supprimer', NULL, 'd', 0),
(167, 'Export contracts', 'contrat', 41, 0, 1, 'export', NULL, 'r', 0),
(241, 'Lire les categories', 'categorie', 20, 0, 1, 'lire', NULL, 'r', 0),
(242, 'Creer/modifier les categories', 'categorie', 20, 0, 1, 'creer', NULL, 'w', 0),
(243, 'Supprimer les categories', 'categorie', 20, 0, 1, 'supprimer', NULL, 'd', 0),
(251, 'Read information of other users, groups and permissions', 'user', 5, 0, 1, 'user', 'lire', 'r', 0),
(252, 'Read permissions of other users', 'user', 5, 0, 1, 'user_advance', 'readperms', 'r', 0),
(253, 'Create/modify internal and external users, groups and permissions', 'user', 5, 0, 1, 'user', 'creer', 'w', 0),
(254, 'Create/modify external users only', 'user', 5, 0, 1, 'user_advance', 'write', 'w', 0),
(255, 'Modify the password of other users', 'user', 5, 0, 1, 'user', 'password', 'w', 0),
(256, 'Delete or disable other users', 'user', 5, 0, 1, 'user', 'supprimer', 'd', 0),
(262, 'Read all third parties (and their objects) by internal users (otherwise only if commercial contact). Not effective for external users (limited to themselves).', 'societe', 9, 0, 1, 'client', 'voir', 'r', 0),
(281, 'Read contacts', 'societe', 9, 0, 1, 'contact', 'lire', 'r', 0),
(282, 'Create and update contact', 'societe', 9, 0, 1, 'contact', 'creer', 'w', 0),
(283, 'Delete contacts', 'societe', 9, 0, 1, 'contact', 'supprimer', 'd', 0),
(286, 'Export contacts', 'societe', 9, 0, 1, 'contact', 'export', 'd', 0),
(301, 'Read barcodes', 'barcode', 0, 0, 1, 'lire_advance', NULL, 'r', 1),
(302, 'Create/modify barcodes', 'barcode', 0, 0, 1, 'creer_advance', NULL, 'w', 0),
(341, 'Read its own permissions', 'user', 5, 0, 1, 'self_advance', 'readperms', 'r', 0),
(342, 'Create/modify of its own user', 'user', 5, 0, 1, 'self', 'creer', 'w', 0),
(343, 'Modify its own password', 'user', 5, 0, 1, 'self', 'password', 'w', 0),
(344, 'Modify its own permissions', 'user', 5, 0, 1, 'self_advance', 'writeperms', 'w', 0),
(351, 'Read groups', 'user', 5, 0, 1, 'group_advance', 'read', 'r', 0),
(352, 'Read permissions of groups', 'user', 5, 0, 1, 'group_advance', 'readperms', 'r', 0),
(353, 'Create/modify groups and permissions', 'user', 5, 0, 1, 'group_advance', 'write', 'w', 0),
(354, 'Delete groups', 'user', 5, 0, 1, 'group_advance', 'delete', 'd', 0),
(358, 'Export all users', 'user', 5, 0, 1, 'user', 'export', 'r', 0),
(531, 'Read services', 'service', 29, 0, 1, 'lire', NULL, 'r', 0),
(532, 'Create/modify services', 'service', 29, 0, 1, 'creer', NULL, 'w', 0),
(534, 'Delete les services', 'service', 29, 0, 1, 'supprimer', NULL, 'd', 0),
(538, 'Export services', 'service', 29, 0, 1, 'export', NULL, 'r', 0),
(561, 'Read bank transfer payment orders', 'paymentbybanktransfer', 52, 0, 1, 'read', NULL, 'r', 0),
(562, 'Create/modify a bank transfer payment order', 'paymentbybanktransfer', 52, 0, 1, 'create', NULL, 'w', 0),
(563, 'Send/Transmit bank transfer payment order', 'paymentbybanktransfer', 52, 0, 1, 'send', NULL, 'a', 0),
(564, 'Record Debits/Rejects of bank transfer payment order', 'paymentbybanktransfer', 52, 0, 1, 'debit', NULL, 'a', 0),
(651, 'Read bom of Bom', 'bom', 65, 0, 1, 'read', NULL, 'w', 0),
(652, 'Create/Update bom of Bom', 'bom', 65, 0, 1, 'write', NULL, 'w', 0),
(653, 'Delete bom of Bom', 'bom', 65, 0, 1, 'delete', NULL, 'w', 0),
(1001, 'Lire les stocks', 'stock', 39, 0, 1, 'lire', NULL, 'r', 0),
(1002, 'Creer/Modifier les stocks', 'stock', 39, 0, 1, 'creer', NULL, 'w', 0),
(1003, 'Supprimer les stocks', 'stock', 39, 0, 1, 'supprimer', NULL, 'd', 0),
(1004, 'Lire mouvements de stocks', 'stock', 39, 0, 1, 'mouvement', 'lire', 'r', 0),
(1005, 'Creer/modifier mouvements de stocks', 'stock', 39, 0, 1, 'mouvement', 'creer', 'w', 0),
(1011, 'inventoryReadPermission', 'stock', 39, 0, 1, 'inventory_advance', 'read', 'w', 0),
(1012, 'inventoryCreatePermission', 'stock', 39, 0, 1, 'inventory_advance', 'write', 'w', 0),
(1101, 'Read delivery receipts', 'expedition', 40, 0, 1, 'delivery', 'lire', 'r', 0),
(1102, 'Create/modify delivery receipts', 'expedition', 40, 0, 1, 'delivery', 'creer', 'w', 0),
(1104, 'Validate delivery receipts', 'expedition', 40, 0, 1, 'delivery_advance', 'validate', 'd', 0),
(1109, 'Delete delivery receipts', 'expedition', 40, 0, 1, 'delivery', 'supprimer', 'd', 0),
(1121, 'Read supplier proposals', 'supplier_proposal', 35, 0, 1, 'lire', NULL, 'w', 0),
(1122, 'Create/modify supplier proposals', 'supplier_proposal', 35, 0, 1, 'creer', NULL, 'w', 0),
(1123, 'Validate supplier proposals', 'supplier_proposal', 35, 0, 1, 'validate_advance', NULL, 'w', 0),
(1124, 'Envoyer les demandes fournisseurs', 'supplier_proposal', 35, 0, 1, 'send_advance', NULL, 'w', 0),
(1125, 'Delete supplier proposals', 'supplier_proposal', 35, 0, 1, 'supprimer', NULL, 'w', 0),
(1126, 'Close supplier price requests', 'supplier_proposal', 35, 0, 1, 'cloturer', NULL, 'w', 0),
(1181, 'Consulter les fournisseurs', 'fournisseur', 12, 0, 1, 'lire', NULL, 'r', 0),
(1182, 'Consulter les commandes fournisseur', 'fournisseur', 12, 0, 1, 'commande', 'lire', 'r', 0),
(1183, 'Creer une commande fournisseur', 'fournisseur', 12, 0, 1, 'commande', 'creer', 'w', 0),
(1184, 'Valider une commande fournisseur', 'fournisseur', 12, 0, 1, 'supplier_order_advance', 'validate', 'w', 0),
(1185, 'Approuver une commande fournisseur', 'fournisseur', 12, 0, 1, 'commande', 'approuver', 'w', 0),
(1186, 'Commander une commande fournisseur', 'fournisseur', 12, 0, 1, 'commande', 'commander', 'w', 0),
(1187, 'Receptionner une commande fournisseur', 'fournisseur', 12, 0, 1, 'commande', 'receptionner', 'd', 0),
(1188, 'Supprimer une commande fournisseur', 'fournisseur', 12, 0, 1, 'commande', 'supprimer', 'd', 0),
(1189, 'Check/Uncheck a supplier order reception', 'fournisseur', 12, 0, 1, 'commande_advance', 'check', 'w', 0),
(1191, 'Exporter les commande fournisseurs, attributs', 'fournisseur', 12, 0, 1, 'commande', 'export', 'r', 0),
(1201, 'Read exports', 'export', 72, 0, 1, 'lire', NULL, 'r', 0),
(1202, 'Creeate/modify export', 'export', 72, 0, 1, 'creer', NULL, 'w', 0),
(1231, 'Consulter les factures fournisseur', 'fournisseur', 12, 0, 1, 'facture', 'lire', 'r', 0),
(1232, 'Creer une facture fournisseur', 'fournisseur', 12, 0, 1, 'facture', 'creer', 'w', 0),
(1233, 'Valider une facture fournisseur', 'fournisseur', 12, 0, 1, 'supplier_invoice_advance', 'validate', 'w', 0),
(1234, 'Supprimer une facture fournisseur', 'fournisseur', 12, 0, 1, 'facture', 'supprimer', 'd', 0),
(1235, 'Envoyer les factures par mail', 'fournisseur', 12, 0, 1, 'supplier_invoice_advance', 'send', 'a', 0),
(1236, 'Exporter les factures fournisseurs, attributs et reglements', 'fournisseur', 12, 0, 1, 'facture', 'export', 'r', 0),
(1251, 'Run mass imports of external data (data load)', 'import', 70, 0, 1, 'run', NULL, 'r', 0),
(1321, 'Export customer invoices, attributes and payments', 'facture', 11, 0, 1, 'facture', 'export', 'r', 0),
(1322, 'Re-open a fully paid invoice', 'facture', 11, 0, 1, 'invoice_advance', 'reopen', 'r', 0),
(1421, 'Export sales orders and attributes', 'commande', 11, 0, 1, 'commande', 'export', 'r', 0),
(63001, 'Read resources', 'resource', 16, 0, 1, 'read', NULL, 'w', 0),
(63002, 'Create/Modify resources', 'resource', 16, 0, 1, 'write', NULL, 'w', 0),
(63003, 'Delete resources', 'resource', 16, 0, 1, 'delete', NULL, 'w', 0),
(63004, 'Link resources to agenda events', 'resource', 16, 0, 1, 'link', NULL, 'w', 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_salary`
--

CREATE TABLE `erp_salary` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_salary_extrafields`
--

CREATE TABLE `erp_salary_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_session`
--

CREATE TABLE `erp_session` (
  `session_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_variable` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_accessed` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `remote_ip` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe`
--

CREATE TABLE `erp_societe` (
  `rowid` int(11) NOT NULL,
  `nom` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_alias` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 0,
  `parent` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `code_client` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_fournisseur` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_compta` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_compta_fournisseur` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_departement` int(11) DEFAULT 0,
  `fk_pays` int(11) DEFAULT 0,
  `fk_account` int(11) DEFAULT 0,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialnetworks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_effectif` int(11) DEFAULT 0,
  `fk_typent` int(11) DEFAULT NULL,
  `fk_forme_juridique` int(11) DEFAULT 0,
  `fk_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siren` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siret` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ape` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idprof4` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idprof5` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idprof6` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_intra` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` double(24,8) DEFAULT NULL,
  `fk_stcomm` int(11) NOT NULL DEFAULT 0,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix_comm` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client` tinyint(4) DEFAULT 0,
  `fournisseur` tinyint(4) DEFAULT 0,
  `supplier_account` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_prospectlevel` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_bad` tinyint(4) DEFAULT 0,
  `customer_rate` double DEFAULT 0,
  `supplier_rate` double DEFAULT 0,
  `remise_client` double DEFAULT 0,
  `remise_supplier` double DEFAULT 0,
  `mode_reglement` tinyint(4) DEFAULT NULL,
  `cond_reglement` tinyint(4) DEFAULT NULL,
  `transport_mode` tinyint(4) DEFAULT NULL,
  `mode_reglement_supplier` tinyint(4) DEFAULT NULL,
  `cond_reglement_supplier` tinyint(4) DEFAULT NULL,
  `transport_mode_supplier` tinyint(4) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tva_assuj` tinyint(4) DEFAULT 1,
  `localtax1_assuj` tinyint(4) DEFAULT 0,
  `localtax1_value` double(7,4) DEFAULT NULL,
  `localtax2_assuj` tinyint(4) DEFAULT 0,
  `localtax2_value` double(7,4) DEFAULT NULL,
  `barcode` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT 0,
  `price_level` int(11) DEFAULT NULL,
  `outstanding_limit` double(24,8) DEFAULT NULL,
  `order_min_amount` double(24,8) DEFAULT NULL,
  `supplier_order_min_amount` double(24,8) DEFAULT NULL,
  `default_lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_squarred` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canvas` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `webservices_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webservices_key` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_societe`
--

INSERT INTO `erp_societe` (`rowid`, `nom`, `name_alias`, `entity`, `ref_ext`, `ref_int`, `statut`, `parent`, `status`, `code_client`, `code_fournisseur`, `code_compta`, `code_compta_fournisseur`, `address`, `zip`, `town`, `fk_departement`, `fk_pays`, `fk_account`, `phone`, `fax`, `url`, `email`, `socialnetworks`, `fk_effectif`, `fk_typent`, `fk_forme_juridique`, `fk_currency`, `siren`, `siret`, `ape`, `idprof4`, `idprof5`, `idprof6`, `tva_intra`, `capital`, `fk_stcomm`, `note_private`, `note_public`, `model_pdf`, `prefix_comm`, `client`, `fournisseur`, `supplier_account`, `fk_prospectlevel`, `fk_incoterms`, `location_incoterms`, `customer_bad`, `customer_rate`, `supplier_rate`, `remise_client`, `remise_supplier`, `mode_reglement`, `cond_reglement`, `transport_mode`, `mode_reglement_supplier`, `cond_reglement_supplier`, `transport_mode_supplier`, `fk_shipping_method`, `tva_assuj`, `localtax1_assuj`, `localtax1_value`, `localtax2_assuj`, `localtax2_value`, `barcode`, `fk_barcode_type`, `price_level`, `outstanding_limit`, `order_min_amount`, `supplier_order_min_amount`, `default_lang`, `logo`, `logo_squarred`, `canvas`, `fk_warehouse`, `webservices_url`, `webservices_key`, `accountancy_code_sell`, `accountancy_code_buy`, `tms`, `datec`, `fk_user_creat`, `fk_user_modif`, `fk_multicurrency`, `multicurrency_code`, `import_key`) VALUES
(1, 'Rose Ltd', 'Alex Smith', 1, NULL, NULL, 0, NULL, 1, 'CU2111-00001', NULL, NULL, NULL, '102 TAGORE LANE\r\nSINDO INDUSTRIAL ESTATE', '787541', 'Central Singapore', NULL, 29, 0, '64575686', NULL, 'rose.com.sg', 'rose@bona.com.sg', '[]', NULL, 3, NULL, NULL, '', '', '', '', '', '', '', NULL, 0, NULL, NULL, '', NULL, 1, 0, NULL, '', 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0.0000, NULL, 0.0000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-11-11 04:46:41', '2021-11-09 09:23:56', 3, 1, 0, '', NULL),
(2, 'Sunny Ltd', '', 1, NULL, NULL, 0, NULL, 1, NULL, 'SU2111-00001', NULL, NULL, '', NULL, NULL, NULL, 29, 0, NULL, NULL, NULL, NULL, '[]', NULL, -1, NULL, NULL, '', '', '', '', '', '', '', NULL, 0, NULL, NULL, '', NULL, 0, 1, NULL, '', 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0.0000, NULL, 0.0000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-11-09 09:49:56', '2021-11-09 09:49:56', -1, 1, 0, '', NULL),
(3, 'Nana', '', 1, NULL, NULL, 0, NULL, 1, 'CU2111-00002', NULL, NULL, NULL, 'Tanjong Pagar #36-06A', '224466', NULL, NULL, 29, 0, NULL, NULL, NULL, NULL, '[]', NULL, -1, NULL, NULL, '', '', '', '', '', '', '', NULL, 0, NULL, NULL, '', NULL, 1, 0, NULL, '', 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0.0000, NULL, 0.0000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-12-17 09:37:00', '2021-11-22 08:39:03', -1, 1, 0, '', NULL),
(4, 'Prospect Test', '', 1, NULL, NULL, 0, NULL, 1, 'CU2112-00003', NULL, NULL, NULL, 'Test', NULL, NULL, NULL, 29, 0, NULL, NULL, NULL, NULL, '[]', NULL, -1, NULL, NULL, '', '', '', '', '', '', '', NULL, 0, NULL, NULL, '', NULL, 3, 0, NULL, '', 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0.0000, NULL, 0.0000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-12-17 09:18:42', '2021-12-08 11:30:23', -1, 1, 0, '', NULL),
(5, 'Abc Pte Ltd', '', 1, NULL, NULL, 0, NULL, 1, NULL, 'SU2112-00002', NULL, NULL, '', NULL, NULL, NULL, 29, 0, NULL, NULL, NULL, NULL, '[]', NULL, -1, NULL, NULL, '', '', '', '', '', '', '', NULL, 0, NULL, 'test 1', '', NULL, 0, 1, NULL, '', 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-12-12 12:05:57', '2021-12-10 14:50:59', -1, 1, 0, '', NULL),
(6, 'Customer Pte Ltd', '', 1, NULL, NULL, 0, NULL, 1, 'CU2112-00004', NULL, NULL, NULL, '', NULL, NULL, NULL, 29, 0, NULL, NULL, NULL, NULL, '[]', NULL, -1, NULL, NULL, '', '', '', '', '', '', '', NULL, 0, NULL, NULL, '', NULL, 1, 0, NULL, '', 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0.0000, NULL, 0.0000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-12-12 12:14:02', '2021-12-12 12:14:02', -1, 1, 0, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_account`
--

CREATE TABLE `erp_societe_account` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `login` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass_encoding` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_crypted` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_temp` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_website` int(11) DEFAULT NULL,
  `site` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_account` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_account` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `date_previous_login` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_address`
--

CREATE TABLE `erp_societe_address` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_commerciaux`
--

CREATE TABLE `erp_societe_commerciaux` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_contacts`
--

CREATE TABLE `erp_societe_contacts` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_creation` datetime NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_extrafields`
--

CREATE TABLE `erp_societe_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_perentity`
--

CREATE TABLE `erp_societe_perentity` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `accountancy_code_customer` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_supplier` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_prices`
--

CREATE TABLE `erp_societe_prices` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `price_level` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_remise`
--

CREATE TABLE `erp_societe_remise` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_client` double(7,4) NOT NULL DEFAULT 0.0000,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_remise_except`
--

CREATE TABLE `erp_societe_remise_except` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `discount_type` int(11) NOT NULL DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `amount_ht` double(24,8) NOT NULL,
  `amount_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `amount_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  `tva_tx` double(7,4) NOT NULL DEFAULT 0.0000,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `fk_user` int(11) NOT NULL,
  `fk_facture_line` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_invoice_supplier_line` int(11) DEFAULT NULL,
  `fk_invoice_supplier` int(11) DEFAULT NULL,
  `fk_invoice_supplier_source` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `multicurrency_amount_ht` double(24,8) NOT NULL DEFAULT 0.00000000,
  `multicurrency_amount_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `multicurrency_amount_ttc` double(24,8) NOT NULL DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_societe_remise_except`
--

INSERT INTO `erp_societe_remise_except` (`rowid`, `entity`, `fk_soc`, `discount_type`, `datec`, `amount_ht`, `amount_tva`, `amount_ttc`, `tva_tx`, `vat_src_code`, `fk_user`, `fk_facture_line`, `fk_facture`, `fk_facture_source`, `fk_invoice_supplier_line`, `fk_invoice_supplier`, `fk_invoice_supplier_source`, `description`, `multicurrency_amount_ht`, `multicurrency_amount_tva`, `multicurrency_amount_ttc`) VALUES
(1, 1, 1, 0, '2021-11-12 09:31:41', 570.00000000, 0.00000000, 570.00000000, 0.0000, '', 1, NULL, NULL, 12, NULL, NULL, NULL, '(CREDIT_NOTE)', 570.00000000, 0.00000000, 570.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_remise_supplier`
--

CREATE TABLE `erp_societe_remise_supplier` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_supplier` double(7,4) NOT NULL DEFAULT 0.0000,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_societe_rib`
--

CREATE TABLE `erp_societe_rib` (
  `rowid` int(11) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ban',
  `label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_banque` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_guichet` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_rib` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bic` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban_prefix` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domiciliation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proprio` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_rib` smallint(6) NOT NULL DEFAULT 0,
  `rum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_rum` date DEFAULT NULL,
  `frstrecur` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'FRST',
  `last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_date_month` int(11) DEFAULT NULL,
  `exp_date_year` int(11) DEFAULT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` int(11) DEFAULT 0,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `max_total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `preapproval_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `stripe_card_ref` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_account` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ipaddress` varchar(68) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_societe_rib`
--

INSERT INTO `erp_societe_rib` (`rowid`, `type`, `label`, `fk_soc`, `datec`, `tms`, `bank`, `code_banque`, `code_guichet`, `number`, `cle_rib`, `bic`, `iban_prefix`, `domiciliation`, `proprio`, `owner_address`, `default_rib`, `rum`, `date_rum`, `frstrecur`, `last_four`, `card_type`, `cvn`, `exp_date_month`, `exp_date_year`, `country_code`, `approved`, `email`, `ending_date`, `max_total_amount_of_all_payments`, `preapproval_key`, `starting_date`, `total_amount_of_all_payments`, `stripe_card_ref`, `stripe_account`, `comment`, `ipaddress`, `status`, `import_key`) VALUES
(1, 'ban', 'DBS Ltd', 5, '2021-12-12 12:02:18', '2021-12-12 12:02:18', 'DBS', '', '', '1234567', '', '123456', '', '', 'Abc Pte Ltd', '', 1, NULL, NULL, 'FRST', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_socpeople`
--

CREATE TABLE `erp_socpeople` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `civility` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `poste` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_perso` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialnetworks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_email` smallint(6) NOT NULL DEFAULT 0,
  `priv` smallint(6) NOT NULL DEFAULT 0,
  `fk_prospectcontactlevel` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_stcommcontact` int(11) NOT NULL DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT 0,
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canvas` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_socpeople`
--

INSERT INTO `erp_socpeople` (`rowid`, `datec`, `tms`, `fk_soc`, `entity`, `ref_ext`, `civility`, `lastname`, `firstname`, `address`, `zip`, `town`, `fk_departement`, `fk_pays`, `birthday`, `poste`, `phone`, `phone_perso`, `phone_mobile`, `fax`, `email`, `socialnetworks`, `photo`, `no_email`, `priv`, `fk_prospectcontactlevel`, `fk_stcommcontact`, `fk_user_creat`, `fk_user_modif`, `note_private`, `note_public`, `default_lang`, `canvas`, `import_key`, `statut`) VALUES
(1, '2021-11-09 09:48:55', '2021-11-09 09:48:55', NULL, 1, NULL, '', 'V1', '', '102 TAGORE LANE', '787541', '', NULL, 29, NULL, '', '64575686', '', '', '', 'rose@bona.com.sg', '[]', NULL, 0, 0, '', 0, 1, 1, '', '', NULL, NULL, NULL, 1),
(2, '2021-12-12 11:59:52', '2021-12-12 11:59:52', 5, 1, NULL, '', 'Person A', '', '', '', '', NULL, 29, NULL, '', '', '', '', '', '', '[]', NULL, 0, 0, '', 0, 1, 1, '', '', NULL, NULL, NULL, 1),
(3, '2021-12-12 12:15:24', '2021-12-12 12:15:24', 6, 1, NULL, '', 'Warehouse 1', '', '', '', '', NULL, 29, NULL, '', '', '', '', '', '', '[]', NULL, 0, 0, '', 0, 1, 1, '', '', NULL, NULL, NULL, 1),
(4, '2021-12-12 12:15:28', '2021-12-12 12:15:28', 6, 1, NULL, '', 'Warehouse 2', '', '', '', '', NULL, 29, NULL, '', '', '', '', '', '', '[]', NULL, 0, 0, '', 0, 1, 1, '', '', NULL, NULL, NULL, 1),
(5, '2021-12-17 09:25:44', '2021-12-17 09:25:44', NULL, 1, NULL, '', 'Han', 'lim', '', '', '', NULL, 29, NULL, '', '', '', '', '', '', '[]', NULL, 0, 0, '', 0, 1, 1, '', '', NULL, NULL, NULL, 1),
(6, '2021-12-17 09:26:36', '2021-12-17 09:26:36', NULL, 1, NULL, '', 'Kok', 'Fiona', '', '', '', NULL, 29, NULL, '', '', '', '98765432', '', '', '[]', NULL, 0, 0, '', 0, 1, 1, '', '', NULL, NULL, NULL, 1),
(7, '2021-12-17 09:27:53', '2021-12-17 09:27:53', 5, 1, NULL, '', 'Foo', 'See Gin', '', '', '', NULL, 29, NULL, '', '', '', '87878787', '', '', '[]', NULL, 0, 0, '', 0, 1, 1, '', '', NULL, NULL, NULL, 1),
(8, '2021-12-17 09:29:31', '2021-12-17 09:29:31', NULL, 1, NULL, '', 'Yek', 'Andrew', '', '', '', NULL, 29, NULL, '', '', '', '', '', '', '[]', NULL, 0, 0, '', 0, 1, 1, '', '', NULL, NULL, NULL, 1),
(9, '2021-12-17 09:31:22', '2021-12-17 09:36:04', 3, 1, NULL, '', 'Kok', 'Fiona', '1 bona road #01-01', '123456', '', NULL, 29, NULL, '', '', '', '', '', 'cherry@bona.com.sg', '[]', '', 0, 0, '', 0, 1, 1, '', '', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_socpeople_extrafields`
--

CREATE TABLE `erp_socpeople_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_stock_mouvement`
--

CREATE TABLE `erp_stock_mouvement` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datem` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `type_mouvement` smallint(6) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventorycode` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_origin` int(11) DEFAULT NULL,
  `origintype` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_projet` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_stock_mouvement`
--

INSERT INTO `erp_stock_mouvement` (`rowid`, `tms`, `datem`, `fk_product`, `batch`, `eatby`, `sellby`, `fk_entrepot`, `value`, `price`, `type_mouvement`, `fk_user_author`, `label`, `inventorycode`, `fk_project`, `fk_origin`, `origintype`, `model_pdf`, `fk_projet`) VALUES
(1, '2021-11-12 09:18:26', '2021-11-12 09:18:26', 4, 'Lot Test 02', NULL, NULL, 1, 100, 0.00000000, 0, 1, 'Stock correction for product TEST002', '20211112091808', NULL, 0, '', NULL, 0),
(2, '2021-11-12 09:40:15', '2021-11-12 09:40:15', 1, '123', NULL, NULL, 1, -1, 0.00000000, 2, 1, 'Production of MO2111-0001', 'Production of MO2111-0001', NULL, 1, 'mo', NULL, 0),
(3, '2021-11-12 09:40:15', '2021-11-12 09:40:15', 2, NULL, NULL, NULL, 1, -1, 0.00000000, 2, 1, 'Production of MO2111-0001', 'Production of MO2111-0001', NULL, 1, 'mo', NULL, 0),
(4, '2021-11-12 09:40:15', '2021-11-12 09:40:15', 3, '456', NULL, NULL, 1, 1, 20.00000000, 3, 1, 'Production of MO2111-0001', 'Production of MO2111-0001', NULL, 1, 'mo', NULL, 0),
(5, '2021-11-12 09:43:43', '2021-11-12 09:43:43', 2, NULL, NULL, NULL, 1, 1, 100.00000000, 3, 1, 'Receiving purchase order PO2111-0001', NULL, NULL, 0, '', NULL, 0),
(6, '2021-12-08 11:56:14', '2021-12-08 11:56:14', 3, '456', NULL, NULL, 1, -50, 0.00000000, 2, 1, 'Production of MO2112-0002', 'Production of MO2112-0002', NULL, 2, 'mo', NULL, 0),
(7, '2021-12-08 11:56:14', '2021-12-08 11:56:14', 4, 'Lot Test 02', NULL, NULL, 1, -50, 0.00000000, 2, 1, 'Production of MO2112-0002', 'Production of MO2112-0002', NULL, 2, 'mo', NULL, 0),
(8, '2021-12-08 11:56:14', '2021-12-08 11:56:14', 1, '123', NULL, NULL, 1, 50, 20.00000000, 3, 1, 'Production of MO2112-0002', 'Production of MO2112-0002', NULL, 2, 'mo', NULL, 0),
(9, '2021-12-08 11:56:34', '2021-12-08 11:56:34', 3, '456', NULL, NULL, 1, -50, 0.00000000, 2, 1, 'Production of MO2112-0002', 'Production of MO2112-0002', NULL, 2, 'mo', NULL, 0),
(10, '2021-12-08 11:56:34', '2021-12-08 11:56:34', 4, 'Lot Test 02', NULL, NULL, 1, -50, 0.00000000, 2, 1, 'Production of MO2112-0002', 'Production of MO2112-0002', NULL, 2, 'mo', NULL, 0),
(11, '2021-12-08 11:56:34', '2021-12-08 11:56:34', 1, '124', NULL, NULL, 1, 50, 20.00000000, 3, 1, 'Production of MO2112-0002', 'Production of MO2112-0002', NULL, 2, 'mo', NULL, 0),
(13, '2021-12-17 09:41:39', '2021-12-17 09:41:39', 2, NULL, NULL, NULL, 1, -1, 100.00000000, 2, 1, 'Shipment SH2112-0001 validated', NULL, NULL, 0, '', NULL, 0),
(14, '2021-12-17 09:45:44', '2021-12-17 09:45:44', 3, '456', NULL, NULL, 1, -1, 200.00000000, 2, 1, 'Shipment SH2112-0002 validated', NULL, NULL, 0, '', NULL, 0),
(15, '2021-12-19 13:49:55', '2021-12-19 13:49:55', 1, '123', NULL, NULL, 1, -1, 26.90000000, 2, 1, 'Shipment SH2112-0003 validated', NULL, NULL, 0, '', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_subscription`
--

CREATE TABLE `erp_subscription` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `fk_type` int(11) DEFAULT NULL,
  `dateadh` datetime DEFAULT NULL,
  `datef` datetime DEFAULT NULL,
  `subscription` double(24,8) DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_supplier_proposal`
--

CREATE TABLE `erp_supplier_proposal` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_supplier_proposaldet`
--

CREATE TABLE `erp_supplier_proposaldet` (
  `rowid` int(11) NOT NULL,
  `fk_supplier_proposal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `ref_fourn` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_unit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_supplier_proposaldet_extrafields`
--

CREATE TABLE `erp_supplier_proposaldet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_supplier_proposal_extrafields`
--

CREATE TABLE `erp_supplier_proposal_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_takepos_floor_tables`
--

CREATE TABLE `erp_takepos_floor_tables` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leftpos` float DEFAULT NULL,
  `toppos` float DEFAULT NULL,
  `floor` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_takepos_floor_tables`
--

INSERT INTO `erp_takepos_floor_tables` (`rowid`, `entity`, `label`, `leftpos`, `toppos`, `floor`) VALUES
(1, 1, '1', 1, 10, 1),
(2, 1, '2', 11, 10, 1),
(3, 1, '3', 21, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_ticket`
--

CREATE TABLE `erp_ticket` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `track_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `fk_project` int(11) DEFAULT 0,
  `origin_email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_assign` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_statut` int(11) DEFAULT NULL,
  `resolution` int(11) DEFAULT NULL,
  `progress` int(11) DEFAULT 0,
  `timing` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `severity_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `notify_tiers_at_create` tinyint(4) DEFAULT NULL,
  `email_msgid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_ticket_extrafields`
--

CREATE TABLE `erp_ticket_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_tva`
--

CREATE TABLE `erp_tva` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_typepayment` int(11) DEFAULT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_user`
--

CREATE TABLE `erp_user` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` smallint(6) DEFAULT 0,
  `employee` tinyint(4) DEFAULT 1,
  `fk_establishment` int(11) DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass_encoding` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_crypted` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_temp` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `civility` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_state` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT 0,
  `birth` date DEFAULT NULL,
  `job` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialnetworks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_socpeople` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_user_expense_validator` int(11) DEFAULT NULL,
  `fk_user_holiday_validator` int(11) DEFAULT NULL,
  `idpers1` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idpers2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idpers3` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datelastlogin` datetime DEFAULT NULL,
  `datepreviouslogin` datetime DEFAULT NULL,
  `datelastpassvalidation` datetime DEFAULT NULL,
  `datestartvalidity` datetime DEFAULT NULL,
  `dateendvalidity` datetime DEFAULT NULL,
  `iplastlogin` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ippreviouslogin` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `egroupware_id` int(11) DEFAULT NULL,
  `ldap_sid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 1,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT 0,
  `accountancy_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_holiday` int(11) DEFAULT 0,
  `thm` double(24,8) DEFAULT NULL,
  `tjm` double(24,8) DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_range` int(11) DEFAULT NULL,
  `default_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_user`
--

INSERT INTO `erp_user` (`rowid`, `entity`, `ref_ext`, `ref_int`, `admin`, `employee`, `fk_establishment`, `datec`, `tms`, `fk_user_creat`, `fk_user_modif`, `login`, `pass_encoding`, `pass`, `pass_crypted`, `pass_temp`, `api_key`, `gender`, `civility`, `lastname`, `firstname`, `address`, `zip`, `town`, `fk_state`, `fk_country`, `birth`, `job`, `office_phone`, `office_fax`, `user_mobile`, `personal_mobile`, `email`, `personal_email`, `signature`, `socialnetworks`, `fk_soc`, `fk_socpeople`, `fk_member`, `fk_user`, `fk_user_expense_validator`, `fk_user_holiday_validator`, `idpers1`, `idpers2`, `idpers3`, `note_public`, `note`, `model_pdf`, `datelastlogin`, `datepreviouslogin`, `datelastpassvalidation`, `datestartvalidity`, `dateendvalidity`, `iplastlogin`, `ippreviouslogin`, `egroupware_id`, `ldap_sid`, `openid`, `statut`, `photo`, `lang`, `color`, `barcode`, `fk_barcode_type`, `accountancy_code`, `nb_holiday`, `thm`, `tjm`, `salary`, `salaryextra`, `dateemployment`, `dateemploymentend`, `weeklyhours`, `import_key`, `default_range`, `default_c_exp_tax_cat`, `fk_warehouse`) VALUES
(1, 0, NULL, NULL, 1, 1, 0, '2021-11-09 04:37:28', '2021-12-20 03:20:37', NULL, NULL, 'admin', NULL, NULL, '$2y$10$KZjtZX4lczsTZjm4evkDqeGN0kxdNMl8QWRHhYbdroRpZiMQY2r0i', 'BJtjbZ9Bn5E8', NULL, NULL, '', 'SuperAdmin', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', 'nhanh.ngo@tangiaba.com', '', '', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2021-12-23 09:08:08', '2021-12-23 02:49:55', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, '', NULL, 0, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, NULL, NULL, 0, 1, 0, '2021-11-12 09:56:32', '2021-11-12 09:56:32', NULL, NULL, 'Jon', NULL, NULL, '$2y$10$Fqp6dGWPcMeyBZnoxYtBNu52aHVgeRnvuE0sCVTKwvvm3dpDgVOjK', NULL, 'OdLKGHFCP8lE', NULL, 'MR', 'Keith', 'Jon', '', '', '', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, '', NULL, 0, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 0, NULL, NULL, 0, 1, 0, '2021-12-17 08:44:46', '2021-12-17 08:47:26', NULL, NULL, 'han', NULL, NULL, '$2y$10$J21PMU6HmzmsljGVkI2l5.dEYKcI.Alof5QRJpUIwxQp1vNtbzTNK', NULL, 'p6SRMPzQMh4U', 'man', 'MR', 'Shiang Han', 'Lim', '', '', '', NULL, NULL, NULL, '', '', '', '', '', 'pm@bona.com.sg', '', '', '[]', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2021-12-17 08:48:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, '', NULL, 0, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erp_usergroup`
--

CREATE TABLE `erp_usergroup` (
  `rowid` int(11) NOT NULL,
  `nom` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_usergroup_extrafields`
--

CREATE TABLE `erp_usergroup_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_usergroup_rights`
--

CREATE TABLE `erp_usergroup_rights` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_usergroup` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_usergroup_user`
--

CREATE TABLE `erp_usergroup_user` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_usergroup` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_user_alert`
--

CREATE TABLE `erp_user_alert` (
  `rowid` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_user_clicktodial`
--

CREATE TABLE `erp_user_clicktodial` (
  `fk_user` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poste` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_user_employment`
--

CREATE TABLE `erp_user_employment` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_ext` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `job` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_user_extrafields`
--

CREATE TABLE `erp_user_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_user_param`
--

CREATE TABLE `erp_user_param` (
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `param` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_user_param`
--

INSERT INTO `erp_user_param` (`fk_user`, `entity`, `param`, `value`) VALUES
(1, 1, 'MAIN_BOXES_0', '1'),
(1, 1, 'MAIN_SELECTEDFIELDS_cashcontrol', 't.rowid,t.ref,t.posmodule,t.posnumber,t.opening,t.cash,t.cheque,t.card,t.year_close,t.month_close,t.day_close,t.status,'),
(1, 1, 'MAIN_SELECTEDFIELDS_projecttasklist', 't.billed,t.ref,t.label,t.dateo,t.datee,t.planned_workload,t.duration_effective,t.progress_calculated,t.progress,t.progress_summary,t.budget_amount,c.assigned,');

-- --------------------------------------------------------

--
-- Table structure for table `erp_user_rib`
--

CREATE TABLE `erp_user_rib` (
  `rowid` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_banque` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_guichet` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_rib` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bic` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban_prefix` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domiciliation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proprio` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_user_rights`
--

CREATE TABLE `erp_user_rights` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `erp_user_rights`
--

INSERT INTO `erp_user_rights` (`rowid`, `entity`, `fk_user`, `fk_id`) VALUES
(160, 1, 1, 11),
(154, 1, 1, 12),
(155, 1, 1, 13),
(156, 1, 1, 14),
(157, 1, 1, 15),
(159, 1, 1, 16),
(161, 1, 1, 19),
(89, 1, 1, 21),
(83, 1, 1, 22),
(84, 1, 1, 24),
(85, 1, 1, 25),
(86, 1, 1, 26),
(88, 1, 1, 27),
(90, 1, 1, 28),
(237, 1, 1, 31),
(232, 1, 1, 32),
(234, 1, 1, 34),
(236, 1, 1, 38),
(238, 1, 1, 39),
(418, 1, 1, 41),
(415, 1, 1, 42),
(417, 1, 1, 44),
(419, 1, 1, 45),
(76, 1, 1, 61),
(73, 1, 1, 62),
(75, 1, 1, 64),
(77, 1, 1, 67),
(78, 1, 1, 68),
(79, 1, 1, 69),
(80, 1, 1, 70),
(36, 1, 1, 71),
(31, 1, 1, 72),
(33, 1, 1, 74),
(37, 1, 1, 75),
(35, 1, 1, 76),
(39, 1, 1, 78),
(40, 1, 1, 79),
(53, 1, 1, 81),
(48, 1, 1, 82),
(49, 1, 1, 84),
(50, 1, 1, 86),
(51, 1, 1, 87),
(52, 1, 1, 88),
(54, 1, 1, 89),
(169, 1, 1, 91),
(166, 1, 1, 92),
(168, 1, 1, 93),
(170, 1, 1, 94),
(437, 1, 1, 95),
(97, 1, 1, 101),
(93, 1, 1, 102),
(94, 1, 1, 104),
(95, 1, 1, 105),
(96, 1, 1, 106),
(98, 1, 1, 109),
(357, 1, 1, 111),
(348, 1, 1, 112),
(350, 1, 1, 113),
(352, 1, 1, 114),
(354, 1, 1, 115),
(356, 1, 1, 116),
(358, 1, 1, 117),
(61, 1, 1, 121),
(58, 1, 1, 122),
(60, 1, 1, 125),
(62, 1, 1, 126),
(423, 1, 1, 141),
(422, 1, 1, 142),
(424, 1, 1, 144),
(214, 1, 1, 151),
(211, 1, 1, 152),
(213, 1, 1, 153),
(215, 1, 1, 154),
(114, 1, 1, 161),
(107, 1, 1, 162),
(109, 1, 1, 163),
(111, 1, 1, 164),
(113, 1, 1, 165),
(115, 1, 1, 167),
(344, 1, 1, 241),
(343, 1, 1, 242),
(345, 1, 1, 243),
(63, 1, 1, 262),
(69, 1, 1, 281),
(66, 1, 1, 282),
(68, 1, 1, 283),
(70, 1, 1, 286),
(321, 1, 1, 301),
(322, 1, 1, 302),
(178, 1, 1, 511),
(173, 1, 1, 512),
(175, 1, 1, 514),
(177, 1, 1, 517),
(179, 1, 1, 519),
(200, 1, 1, 521),
(195, 1, 1, 522),
(197, 1, 1, 524),
(199, 1, 1, 525),
(201, 1, 1, 527),
(255, 1, 1, 531),
(252, 1, 1, 532),
(254, 1, 1, 534),
(256, 1, 1, 538),
(364, 1, 1, 561),
(361, 1, 1, 562),
(363, 1, 1, 563),
(365, 1, 1, 564),
(370, 1, 1, 651),
(369, 1, 1, 652),
(371, 1, 1, 653),
(375, 1, 1, 661),
(374, 1, 1, 662),
(376, 1, 1, 663),
(44, 1, 1, 750),
(43, 1, 1, 751),
(45, 1, 1, 752),
(27, 1, 1, 771),
(16, 1, 1, 772),
(18, 1, 1, 773),
(20, 1, 1, 775),
(22, 1, 1, 776),
(24, 1, 1, 777),
(26, 1, 1, 778),
(28, 1, 1, 779),
(242, 1, 1, 1001),
(241, 1, 1, 1002),
(243, 1, 1, 1003),
(245, 1, 1, 1004),
(246, 1, 1, 1005),
(248, 1, 1, 1011),
(249, 1, 1, 1012),
(103, 1, 1, 1101),
(101, 1, 1, 1102),
(102, 1, 1, 1104),
(104, 1, 1, 1109),
(150, 1, 1, 1121),
(143, 1, 1, 1122),
(145, 1, 1, 1123),
(147, 1, 1, 1124),
(149, 1, 1, 1125),
(151, 1, 1, 1126),
(116, 1, 1, 1181),
(130, 1, 1, 1182),
(119, 1, 1, 1183),
(120, 1, 1, 1184),
(122, 1, 1, 1185),
(124, 1, 1, 1186),
(126, 1, 1, 1187),
(129, 1, 1, 1188),
(127, 1, 1, 1189),
(131, 1, 1, 1191),
(433, 1, 1, 1201),
(434, 1, 1, 1202),
(139, 1, 1, 1231),
(134, 1, 1, 1232),
(135, 1, 1, 1233),
(137, 1, 1, 1234),
(138, 1, 1, 1235),
(140, 1, 1, 1236),
(451, 1, 1, 1251),
(162, 1, 1, 1321),
(163, 1, 1, 1322),
(55, 1, 1, 1421),
(405, 1, 1, 2401),
(404, 1, 1, 2402),
(406, 1, 1, 2403),
(410, 1, 1, 2411),
(409, 1, 1, 2412),
(411, 1, 1, 2413),
(412, 1, 1, 2414),
(338, 1, 1, 10001),
(333, 1, 1, 10002),
(335, 1, 1, 10003),
(337, 1, 1, 10005),
(339, 1, 1, 10008),
(12, 1, 1, 20001),
(3, 1, 1, 20002),
(5, 1, 1, 20003),
(9, 1, 1, 20004),
(11, 1, 1, 20005),
(13, 1, 1, 20006),
(7, 1, 1, 20007),
(323, 1, 1, 50151),
(324, 1, 1, 50152),
(325, 1, 1, 50153),
(439, 1, 1, 50401),
(447, 1, 1, 50411),
(442, 1, 1, 50412),
(444, 1, 1, 50414),
(446, 1, 1, 50415),
(448, 1, 1, 50418),
(449, 1, 1, 50420),
(450, 1, 1, 50430),
(438, 1, 1, 50440),
(400, 1, 1, 56001),
(397, 1, 1, 56002),
(399, 1, 1, 56003),
(401, 1, 1, 56004),
(304, 1, 1, 59001),
(305, 1, 1, 59002),
(306, 1, 1, 59003),
(430, 1, 1, 63001),
(427, 1, 1, 63002),
(429, 1, 1, 63003),
(431, 1, 1, 63004),
(392, 1, 2, 251),
(393, 1, 2, 253),
(390, 1, 2, 301),
(394, 1, 2, 651),
(391, 1, 2, 50401),
(496, 1, 3, 11),
(497, 1, 3, 12),
(498, 1, 3, 13),
(499, 1, 3, 14),
(500, 1, 3, 15),
(501, 1, 3, 16),
(502, 1, 3, 19),
(513, 1, 3, 21),
(514, 1, 3, 22),
(515, 1, 3, 24),
(516, 1, 3, 25),
(517, 1, 3, 26),
(518, 1, 3, 27),
(519, 1, 3, 28),
(618, 1, 3, 31),
(619, 1, 3, 32),
(620, 1, 3, 34),
(621, 1, 3, 38),
(622, 1, 3, 39),
(534, 1, 3, 41),
(535, 1, 3, 42),
(536, 1, 3, 44),
(537, 1, 3, 45),
(564, 1, 3, 61),
(565, 1, 3, 62),
(566, 1, 3, 64),
(567, 1, 3, 67),
(568, 1, 3, 68),
(569, 1, 3, 69),
(570, 1, 3, 70),
(505, 1, 3, 81),
(506, 1, 3, 82),
(507, 1, 3, 84),
(508, 1, 3, 86),
(509, 1, 3, 87),
(510, 1, 3, 88),
(511, 1, 3, 89),
(571, 1, 3, 91),
(572, 1, 3, 92),
(573, 1, 3, 93),
(574, 1, 3, 94),
(541, 1, 3, 101),
(542, 1, 3, 102),
(543, 1, 3, 104),
(544, 1, 3, 105),
(545, 1, 3, 106),
(546, 1, 3, 109),
(575, 1, 3, 111),
(576, 1, 3, 112),
(577, 1, 3, 113),
(578, 1, 3, 114),
(579, 1, 3, 115),
(580, 1, 3, 116),
(581, 1, 3, 117),
(455, 1, 3, 121),
(456, 1, 3, 122),
(457, 1, 3, 125),
(458, 1, 3, 126),
(538, 1, 3, 141),
(539, 1, 3, 142),
(540, 1, 3, 144),
(558, 1, 3, 161),
(559, 1, 3, 162),
(560, 1, 3, 163),
(561, 1, 3, 164),
(562, 1, 3, 165),
(563, 1, 3, 167),
(615, 1, 3, 241),
(616, 1, 3, 242),
(617, 1, 3, 243),
(459, 1, 3, 262),
(460, 1, 3, 281),
(461, 1, 3, 282),
(462, 1, 3, 283),
(463, 1, 3, 286),
(453, 1, 3, 301),
(623, 1, 3, 531),
(624, 1, 3, 532),
(625, 1, 3, 534),
(626, 1, 3, 538),
(582, 1, 3, 561),
(583, 1, 3, 562),
(584, 1, 3, 563),
(585, 1, 3, 564),
(586, 1, 3, 651),
(587, 1, 3, 652),
(588, 1, 3, 653),
(589, 1, 3, 661),
(590, 1, 3, 662),
(591, 1, 3, 663),
(551, 1, 3, 1001),
(552, 1, 3, 1002),
(553, 1, 3, 1003),
(554, 1, 3, 1004),
(555, 1, 3, 1005),
(556, 1, 3, 1011),
(557, 1, 3, 1012),
(547, 1, 3, 1101),
(548, 1, 3, 1102),
(549, 1, 3, 1104),
(550, 1, 3, 1109),
(593, 1, 3, 1201),
(594, 1, 3, 1202),
(592, 1, 3, 1251),
(503, 1, 3, 1321),
(504, 1, 3, 1322),
(512, 1, 3, 1421),
(527, 1, 3, 2401),
(528, 1, 3, 2402),
(529, 1, 3, 2403),
(530, 1, 3, 2411),
(531, 1, 3, 2412),
(532, 1, 3, 2413),
(533, 1, 3, 2414),
(599, 1, 3, 50151),
(600, 1, 3, 50152),
(601, 1, 3, 50153),
(602, 1, 3, 50401),
(603, 1, 3, 50411),
(604, 1, 3, 50412),
(605, 1, 3, 50414),
(606, 1, 3, 50415),
(607, 1, 3, 50418),
(608, 1, 3, 50420),
(609, 1, 3, 50430),
(610, 1, 3, 50440),
(595, 1, 3, 56001),
(596, 1, 3, 56002),
(597, 1, 3, 56003),
(598, 1, 3, 56004),
(611, 1, 3, 63001),
(612, 1, 3, 63002),
(613, 1, 3, 63003),
(614, 1, 3, 63004);

-- --------------------------------------------------------

--
-- Table structure for table `erp_website`
--

CREATE TABLE `erp_website` (
  `rowid` int(11) NOT NULL,
  `type_container` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'page',
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maincolor` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maincolorbis` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherlang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `fk_default_home` int(11) DEFAULT NULL,
  `use_manifest` int(11) DEFAULT NULL,
  `virtualhost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `lastaccess` datetime DEFAULT NULL,
  `pageviews_month` bigint(20) UNSIGNED DEFAULT 0,
  `pageviews_total` bigint(20) UNSIGNED DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_website_extrafields`
--

CREATE TABLE `erp_website_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_website_page`
--

CREATE TABLE `erp_website_page` (
  `rowid` int(11) NOT NULL,
  `fk_website` int(11) NOT NULL,
  `type_container` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'page',
  `pageurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aliasalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_page` int(11) DEFAULT NULL,
  `allowed_in_frames` int(11) DEFAULT 0,
  `htmlheader` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `grabbed_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `author_alias` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_object` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_workstation_workstation`
--

CREATE TABLE `erp_workstation_workstation` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `nb_operators_required` int(11) DEFAULT NULL,
  `thm_operator_estimated` double DEFAULT NULL,
  `thm_machine_estimated` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_workstation_workstation_resource`
--

CREATE TABLE `erp_workstation_workstation_resource` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_resource` int(11) DEFAULT NULL,
  `fk_workstation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_workstation_workstation_usergroup`
--

CREATE TABLE `erp_workstation_workstation_usergroup` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_usergroup` int(11) DEFAULT NULL,
  `fk_workstation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_zapier_hook`
--

CREATE TABLE `erp_zapier_hook` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `erp_accounting_account`
--
ALTER TABLE `erp_accounting_account`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_accounting_account` (`account_number`,`entity`,`fk_pcg_version`),
  ADD KEY `idx_accounting_account_fk_pcg_version` (`fk_pcg_version`),
  ADD KEY `idx_accounting_account_account_parent` (`account_parent`);

--
-- Indexes for table `erp_accounting_bookkeeping`
--
ALTER TABLE `erp_accounting_bookkeeping`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_accounting_bookkeeping_fk_doc` (`fk_doc`),
  ADD KEY `idx_accounting_bookkeeping_fk_docdet` (`fk_docdet`),
  ADD KEY `idx_accounting_bookkeeping_doc_date` (`doc_date`),
  ADD KEY `idx_accounting_bookkeeping_numero_compte` (`numero_compte`,`entity`),
  ADD KEY `idx_accounting_bookkeeping_code_journal` (`code_journal`,`entity`),
  ADD KEY `idx_accounting_bookkeeping_piece_num` (`piece_num`,`entity`);

--
-- Indexes for table `erp_accounting_bookkeeping_tmp`
--
ALTER TABLE `erp_accounting_bookkeeping_tmp`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_accounting_bookkeeping_tmp_doc_date` (`doc_date`),
  ADD KEY `idx_accounting_bookkeeping_tmp_fk_docdet` (`fk_docdet`),
  ADD KEY `idx_accounting_bookkeeping_tmp_numero_compte` (`numero_compte`),
  ADD KEY `idx_accounting_bookkeeping_tmp_code_journal` (`code_journal`);

--
-- Indexes for table `erp_accounting_fiscalyear`
--
ALTER TABLE `erp_accounting_fiscalyear`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_accounting_groups_account`
--
ALTER TABLE `erp_accounting_groups_account`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_accounting_journal`
--
ALTER TABLE `erp_accounting_journal`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_accounting_journal_code` (`code`,`entity`);

--
-- Indexes for table `erp_accounting_system`
--
ALTER TABLE `erp_accounting_system`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_accounting_system_pcg_version` (`pcg_version`);

--
-- Indexes for table `erp_actioncomm`
--
ALTER TABLE `erp_actioncomm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_actioncomm_ref` (`ref`,`entity`),
  ADD KEY `idx_actioncomm_fk_soc` (`fk_soc`),
  ADD KEY `idx_actioncomm_fk_contact` (`fk_contact`),
  ADD KEY `idx_actioncomm_code` (`code`),
  ADD KEY `idx_actioncomm_fk_element` (`fk_element`),
  ADD KEY `idx_actioncomm_fk_user_action` (`fk_user_action`),
  ADD KEY `idx_actioncomm_fk_project` (`fk_project`),
  ADD KEY `idx_actioncomm_datep` (`datep`),
  ADD KEY `idx_actioncomm_datep2` (`datep2`),
  ADD KEY `idx_actioncomm_recurid` (`recurid`),
  ADD KEY `idx_actioncomm_ref_ext` (`ref_ext`);

--
-- Indexes for table `erp_actioncomm_extrafields`
--
ALTER TABLE `erp_actioncomm_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_actioncomm_extrafields` (`fk_object`);

--
-- Indexes for table `erp_actioncomm_reminder`
--
ALTER TABLE `erp_actioncomm_reminder`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_actioncomm_reminder_unique` (`fk_actioncomm`,`fk_user`,`typeremind`,`offsetvalue`,`offsetunit`),
  ADD KEY `idx_actioncomm_reminder_dateremind` (`dateremind`),
  ADD KEY `idx_actioncomm_reminder_fk_user` (`fk_user`),
  ADD KEY `idx_actioncomm_reminder_status` (`status`);

--
-- Indexes for table `erp_actioncomm_resources`
--
ALTER TABLE `erp_actioncomm_resources`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_actioncomm_resources` (`fk_actioncomm`,`element_type`,`fk_element`),
  ADD KEY `idx_actioncomm_resources_fk_element` (`fk_element`);

--
-- Indexes for table `erp_adherent`
--
ALTER TABLE `erp_adherent`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_adherent_ref` (`ref`,`entity`),
  ADD UNIQUE KEY `uk_adherent_login` (`login`,`entity`),
  ADD UNIQUE KEY `uk_adherent_fk_soc` (`fk_soc`),
  ADD KEY `idx_adherent_fk_adherent_type` (`fk_adherent_type`);

--
-- Indexes for table `erp_adherent_extrafields`
--
ALTER TABLE `erp_adherent_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_adherent_extrafields` (`fk_object`);

--
-- Indexes for table `erp_adherent_type`
--
ALTER TABLE `erp_adherent_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_adherent_type_libelle` (`libelle`,`entity`);

--
-- Indexes for table `erp_adherent_type_extrafields`
--
ALTER TABLE `erp_adherent_type_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_adherent_type_extrafields` (`fk_object`);

--
-- Indexes for table `erp_adherent_type_lang`
--
ALTER TABLE `erp_adherent_type_lang`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_advtargetemailing`
--
ALTER TABLE `erp_advtargetemailing`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_advtargetemailing_name` (`name`);

--
-- Indexes for table `erp_asset`
--
ALTER TABLE `erp_asset`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_asset_rowid` (`rowid`),
  ADD KEY `idx_asset_ref` (`ref`),
  ADD KEY `idx_asset_entity` (`entity`),
  ADD KEY `idx_asset_fk_asset_type` (`fk_asset_type`);

--
-- Indexes for table `erp_asset_extrafields`
--
ALTER TABLE `erp_asset_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_asset_extrafields` (`fk_object`);

--
-- Indexes for table `erp_asset_type`
--
ALTER TABLE `erp_asset_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_asset_type_label` (`label`,`entity`);

--
-- Indexes for table `erp_asset_type_extrafields`
--
ALTER TABLE `erp_asset_type_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_asset_type_extrafields` (`fk_object`);

--
-- Indexes for table `erp_bank`
--
ALTER TABLE `erp_bank`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bank_datev` (`datev`),
  ADD KEY `idx_bank_dateo` (`dateo`),
  ADD KEY `idx_bank_fk_account` (`fk_account`),
  ADD KEY `idx_bank_rappro` (`rappro`),
  ADD KEY `idx_bank_num_releve` (`num_releve`);

--
-- Indexes for table `erp_bank_account`
--
ALTER TABLE `erp_bank_account`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bank_account_label` (`label`,`entity`),
  ADD KEY `idx_fk_accountancy_journal` (`fk_accountancy_journal`);

--
-- Indexes for table `erp_bank_account_extrafields`
--
ALTER TABLE `erp_bank_account_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bank_account_extrafields` (`fk_object`);

--
-- Indexes for table `erp_bank_categ`
--
ALTER TABLE `erp_bank_categ`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_bank_class`
--
ALTER TABLE `erp_bank_class`
  ADD UNIQUE KEY `uk_bank_class_lineid` (`lineid`,`fk_categ`);

--
-- Indexes for table `erp_bank_url`
--
ALTER TABLE `erp_bank_url`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bank_url` (`fk_bank`,`url_id`,`type`);

--
-- Indexes for table `erp_blockedlog`
--
ALTER TABLE `erp_blockedlog`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `signature` (`signature`),
  ADD KEY `fk_object_element` (`fk_object`,`element`),
  ADD KEY `entity` (`entity`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `entity_action` (`entity`,`action`),
  ADD KEY `entity_action_certified` (`entity`,`action`,`certified`);

--
-- Indexes for table `erp_blockedlog_authority`
--
ALTER TABLE `erp_blockedlog_authority`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `signature` (`signature`);

--
-- Indexes for table `erp_bom_bom`
--
ALTER TABLE `erp_bom_bom`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bom_bom_ref` (`ref`,`entity`),
  ADD KEY `idx_bom_bom_rowid` (`rowid`),
  ADD KEY `idx_bom_bom_ref` (`ref`),
  ADD KEY `erp_bom_bom_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_bom_bom_status` (`status`),
  ADD KEY `idx_bom_bom_fk_product` (`fk_product`);

--
-- Indexes for table `erp_bom_bomline`
--
ALTER TABLE `erp_bom_bomline`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bom_bomline_rowid` (`rowid`),
  ADD KEY `idx_bom_bomline_fk_product` (`fk_product`),
  ADD KEY `idx_bom_bomline_fk_bom` (`fk_bom`);

--
-- Indexes for table `erp_bom_bomline_extrafields`
--
ALTER TABLE `erp_bom_bomline_extrafields`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_bom_bom_extrafields`
--
ALTER TABLE `erp_bom_bom_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bom_bom_extrafields_fk_object` (`fk_object`);

--
-- Indexes for table `erp_bookmark`
--
ALTER TABLE `erp_bookmark`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bookmark_title` (`fk_user`,`entity`,`title`);

--
-- Indexes for table `erp_bordereau_cheque`
--
ALTER TABLE `erp_bordereau_cheque`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bordereau_cheque` (`ref`,`entity`);

--
-- Indexes for table `erp_boxes`
--
ALTER TABLE `erp_boxes`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_boxes` (`entity`,`box_id`,`position`,`fk_user`),
  ADD KEY `idx_boxes_boxid` (`box_id`),
  ADD KEY `idx_boxes_fk_user` (`fk_user`);

--
-- Indexes for table `erp_boxes_def`
--
ALTER TABLE `erp_boxes_def`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_boxes_def` (`file`,`entity`,`note`);

--
-- Indexes for table `erp_budget`
--
ALTER TABLE `erp_budget`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_budget_lines`
--
ALTER TABLE `erp_budget_lines`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_budget_lines` (`fk_budget`,`fk_project_ids`);

--
-- Indexes for table `erp_categorie`
--
ALTER TABLE `erp_categorie`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_categories_extrafields`
--
ALTER TABLE `erp_categories_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_categories_extrafields` (`fk_object`);

--
-- Indexes for table `erp_categorie_account`
--
ALTER TABLE `erp_categorie_account`
  ADD PRIMARY KEY (`fk_categorie`,`fk_account`),
  ADD KEY `idx_categorie_account_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_account_fk_account` (`fk_account`);

--
-- Indexes for table `erp_categorie_actioncomm`
--
ALTER TABLE `erp_categorie_actioncomm`
  ADD PRIMARY KEY (`fk_categorie`,`fk_actioncomm`),
  ADD KEY `idx_categorie_actioncomm_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_actioncomm_fk_actioncomm` (`fk_actioncomm`);

--
-- Indexes for table `erp_categorie_contact`
--
ALTER TABLE `erp_categorie_contact`
  ADD PRIMARY KEY (`fk_categorie`,`fk_socpeople`),
  ADD KEY `idx_categorie_contact_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_contact_fk_socpeople` (`fk_socpeople`);

--
-- Indexes for table `erp_categorie_fournisseur`
--
ALTER TABLE `erp_categorie_fournisseur`
  ADD PRIMARY KEY (`fk_categorie`,`fk_soc`),
  ADD KEY `idx_categorie_fournisseur_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_fournisseur_fk_societe` (`fk_soc`);

--
-- Indexes for table `erp_categorie_knowledgemanagement`
--
ALTER TABLE `erp_categorie_knowledgemanagement`
  ADD PRIMARY KEY (`fk_categorie`,`fk_knowledgemanagement`),
  ADD KEY `idx_categorie_knowledgemanagement_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_knowledgemanagement_fk_knowledgemanagement` (`fk_knowledgemanagement`);

--
-- Indexes for table `erp_categorie_lang`
--
ALTER TABLE `erp_categorie_lang`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_category_lang` (`fk_category`,`lang`);

--
-- Indexes for table `erp_categorie_member`
--
ALTER TABLE `erp_categorie_member`
  ADD PRIMARY KEY (`fk_categorie`,`fk_member`),
  ADD KEY `idx_categorie_member_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_member_fk_member` (`fk_member`);

--
-- Indexes for table `erp_categorie_product`
--
ALTER TABLE `erp_categorie_product`
  ADD PRIMARY KEY (`fk_categorie`,`fk_product`),
  ADD KEY `idx_categorie_product_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_product_fk_product` (`fk_product`);

--
-- Indexes for table `erp_categorie_project`
--
ALTER TABLE `erp_categorie_project`
  ADD PRIMARY KEY (`fk_categorie`,`fk_project`),
  ADD KEY `idx_categorie_project_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_project_fk_project` (`fk_project`);

--
-- Indexes for table `erp_categorie_societe`
--
ALTER TABLE `erp_categorie_societe`
  ADD PRIMARY KEY (`fk_categorie`,`fk_soc`),
  ADD KEY `idx_categorie_societe_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_societe_fk_societe` (`fk_soc`);

--
-- Indexes for table `erp_categorie_ticket`
--
ALTER TABLE `erp_categorie_ticket`
  ADD PRIMARY KEY (`fk_categorie`,`fk_ticket`),
  ADD KEY `idx_categorie_ticket_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_ticket_fk_ticket` (`fk_ticket`);

--
-- Indexes for table `erp_categorie_user`
--
ALTER TABLE `erp_categorie_user`
  ADD PRIMARY KEY (`fk_categorie`,`fk_user`),
  ADD KEY `idx_categorie_user_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_user_fk_user` (`fk_user`);

--
-- Indexes for table `erp_categorie_warehouse`
--
ALTER TABLE `erp_categorie_warehouse`
  ADD PRIMARY KEY (`fk_categorie`,`fk_warehouse`),
  ADD KEY `idx_categorie_warehouse_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_warehouse_fk_warehouse` (`fk_warehouse`);

--
-- Indexes for table `erp_categorie_website_page`
--
ALTER TABLE `erp_categorie_website_page`
  ADD PRIMARY KEY (`fk_categorie`,`fk_website_page`),
  ADD KEY `idx_categorie_website_page_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_website_page_fk_website_page` (`fk_website_page`);

--
-- Indexes for table `erp_chargesociales`
--
ALTER TABLE `erp_chargesociales`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_commande`
--
ALTER TABLE `erp_commande`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_commande_ref` (`ref`,`entity`),
  ADD KEY `idx_commande_fk_soc` (`fk_soc`),
  ADD KEY `idx_commande_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_commande_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_commande_fk_user_cloture` (`fk_user_cloture`),
  ADD KEY `idx_commande_fk_projet` (`fk_projet`),
  ADD KEY `idx_commande_fk_account` (`fk_account`),
  ADD KEY `idx_commande_fk_currency` (`fk_currency`);

--
-- Indexes for table `erp_commandedet`
--
ALTER TABLE `erp_commandedet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commandedet_fk_commande` (`fk_commande`),
  ADD KEY `idx_commandedet_fk_product` (`fk_product`),
  ADD KEY `fk_commandedet_fk_unit` (`fk_unit`),
  ADD KEY `fk_commandedet_fk_commandefourndet` (`fk_commandefourndet`);

--
-- Indexes for table `erp_commandedet_extrafields`
--
ALTER TABLE `erp_commandedet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commandedet_extrafields` (`fk_object`);

--
-- Indexes for table `erp_commande_extrafields`
--
ALTER TABLE `erp_commande_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_extrafields` (`fk_object`);

--
-- Indexes for table `erp_commande_fournisseur`
--
ALTER TABLE `erp_commande_fournisseur`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_commande_fournisseur_ref` (`ref`,`fk_soc`,`entity`),
  ADD KEY `idx_commande_fournisseur_fk_soc` (`fk_soc`),
  ADD KEY `billed` (`billed`);

--
-- Indexes for table `erp_commande_fournisseurdet`
--
ALTER TABLE `erp_commande_fournisseurdet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `fk_commande_fournisseurdet_fk_unit` (`fk_unit`),
  ADD KEY `idx_commande_fournisseurdet_fk_commande` (`fk_commande`),
  ADD KEY `idx_commande_fournisseurdet_fk_product` (`fk_product`);

--
-- Indexes for table `erp_commande_fournisseurdet_extrafields`
--
ALTER TABLE `erp_commande_fournisseurdet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseurdet_extrafields` (`fk_object`);

--
-- Indexes for table `erp_commande_fournisseur_dispatch`
--
ALTER TABLE `erp_commande_fournisseur_dispatch`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseur_dispatch_fk_commande` (`fk_commande`),
  ADD KEY `idx_commande_fournisseur_dispatch_fk_reception` (`fk_reception`);

--
-- Indexes for table `erp_commande_fournisseur_dispatch_extrafields`
--
ALTER TABLE `erp_commande_fournisseur_dispatch_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseur_dispatch_extrafields` (`fk_object`);

--
-- Indexes for table `erp_commande_fournisseur_extrafields`
--
ALTER TABLE `erp_commande_fournisseur_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseur_extrafields` (`fk_object`);

--
-- Indexes for table `erp_commande_fournisseur_log`
--
ALTER TABLE `erp_commande_fournisseur_log`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_comment`
--
ALTER TABLE `erp_comment`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_const`
--
ALTER TABLE `erp_const`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_const` (`name`,`entity`);

--
-- Indexes for table `erp_contrat`
--
ALTER TABLE `erp_contrat`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_contrat_ref` (`ref`,`entity`),
  ADD KEY `idx_contrat_fk_soc` (`fk_soc`),
  ADD KEY `idx_contrat_fk_user_author` (`fk_user_author`);

--
-- Indexes for table `erp_contratdet`
--
ALTER TABLE `erp_contratdet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contratdet_fk_contrat` (`fk_contrat`),
  ADD KEY `idx_contratdet_fk_product` (`fk_product`),
  ADD KEY `idx_contratdet_date_ouverture_prevue` (`date_ouverture_prevue`),
  ADD KEY `idx_contratdet_date_ouverture` (`date_ouverture`),
  ADD KEY `idx_contratdet_date_fin_validite` (`date_fin_validite`),
  ADD KEY `fk_contratdet_fk_unit` (`fk_unit`);

--
-- Indexes for table `erp_contratdet_extrafields`
--
ALTER TABLE `erp_contratdet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contratdet_extrafields` (`fk_object`);

--
-- Indexes for table `erp_contratdet_log`
--
ALTER TABLE `erp_contratdet_log`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contratdet_log_fk_contratdet` (`fk_contratdet`),
  ADD KEY `idx_contratdet_log_date` (`date`);

--
-- Indexes for table `erp_contrat_extrafields`
--
ALTER TABLE `erp_contrat_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contrat_extrafields` (`fk_object`);

--
-- Indexes for table `erp_cronjob`
--
ALTER TABLE `erp_cronjob`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_cronjob_status` (`status`),
  ADD KEY `idx_cronjob_datelastrun` (`datelastrun`),
  ADD KEY `idx_cronjob_datenextrun` (`datenextrun`),
  ADD KEY `idx_cronjob_datestart` (`datestart`),
  ADD KEY `idx_cronjob_dateend` (`dateend`);

--
-- Indexes for table `erp_c_accounting_category`
--
ALTER TABLE `erp_c_accounting_category`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_accounting_category` (`code`,`entity`);

--
-- Indexes for table `erp_c_actioncomm`
--
ALTER TABLE `erp_c_actioncomm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_actioncomm` (`code`);

--
-- Indexes for table `erp_c_action_trigger`
--
ALTER TABLE `erp_c_action_trigger`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_action_trigger_code` (`code`),
  ADD KEY `idx_action_trigger_rang` (`rang`);

--
-- Indexes for table `erp_c_availability`
--
ALTER TABLE `erp_c_availability`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_availability` (`code`);

--
-- Indexes for table `erp_c_barcode_type`
--
ALTER TABLE `erp_c_barcode_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_barcode_type` (`code`,`entity`);

--
-- Indexes for table `erp_c_chargesociales`
--
ALTER TABLE `erp_c_chargesociales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_c_civility`
--
ALTER TABLE `erp_c_civility`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_civility` (`code`);

--
-- Indexes for table `erp_c_country`
--
ALTER TABLE `erp_c_country`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_c_country_code` (`code`),
  ADD UNIQUE KEY `idx_c_country_label` (`label`),
  ADD UNIQUE KEY `idx_c_country_code_iso` (`code_iso`);

--
-- Indexes for table `erp_c_currencies`
--
ALTER TABLE `erp_c_currencies`
  ADD PRIMARY KEY (`code_iso`),
  ADD UNIQUE KEY `uk_c_currencies_code_iso` (`code_iso`);

--
-- Indexes for table `erp_c_departements`
--
ALTER TABLE `erp_c_departements`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_departements` (`code_departement`,`fk_region`),
  ADD KEY `idx_departements_fk_region` (`fk_region`);

--
-- Indexes for table `erp_c_ecotaxe`
--
ALTER TABLE `erp_c_ecotaxe`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_ecotaxe` (`code`);

--
-- Indexes for table `erp_c_effectif`
--
ALTER TABLE `erp_c_effectif`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_effectif` (`code`);

--
-- Indexes for table `erp_c_email_senderprofile`
--
ALTER TABLE `erp_c_email_senderprofile`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_email_senderprofile` (`entity`,`label`,`email`);

--
-- Indexes for table `erp_c_email_templates`
--
ALTER TABLE `erp_c_email_templates`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_email_templates` (`entity`,`label`,`lang`),
  ADD KEY `idx_type` (`type_template`);

--
-- Indexes for table `erp_c_exp_tax_cat`
--
ALTER TABLE `erp_c_exp_tax_cat`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_exp_tax_range`
--
ALTER TABLE `erp_c_exp_tax_range`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_field_list`
--
ALTER TABLE `erp_c_field_list`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_format_cards`
--
ALTER TABLE `erp_c_format_cards`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_forme_juridique`
--
ALTER TABLE `erp_c_forme_juridique`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_forme_juridique` (`code`);

--
-- Indexes for table `erp_c_holiday_types`
--
ALTER TABLE `erp_c_holiday_types`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_holiday_types` (`code`);

--
-- Indexes for table `erp_c_hrm_department`
--
ALTER TABLE `erp_c_hrm_department`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_hrm_function`
--
ALTER TABLE `erp_c_hrm_function`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_hrm_public_holiday`
--
ALTER TABLE `erp_c_hrm_public_holiday`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_hrm_public_holiday` (`entity`,`code`),
  ADD UNIQUE KEY `uk_c_hrm_public_holiday2` (`entity`,`fk_country`,`dayrule`,`day`,`month`,`year`);

--
-- Indexes for table `erp_c_incoterms`
--
ALTER TABLE `erp_c_incoterms`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_incoterms` (`code`);

--
-- Indexes for table `erp_c_input_method`
--
ALTER TABLE `erp_c_input_method`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_input_method` (`code`);

--
-- Indexes for table `erp_c_input_reason`
--
ALTER TABLE `erp_c_input_reason`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_input_reason` (`code`);

--
-- Indexes for table `erp_c_lead_status`
--
ALTER TABLE `erp_c_lead_status`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_lead_status_code` (`code`);

--
-- Indexes for table `erp_c_paiement`
--
ALTER TABLE `erp_c_paiement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_paiement_code` (`entity`,`code`);

--
-- Indexes for table `erp_c_paper_format`
--
ALTER TABLE `erp_c_paper_format`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_partnership_type`
--
ALTER TABLE `erp_c_partnership_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_partnership_type` (`entity`,`code`);

--
-- Indexes for table `erp_c_payment_term`
--
ALTER TABLE `erp_c_payment_term`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_payment_term_code` (`entity`,`code`);

--
-- Indexes for table `erp_c_price_expression`
--
ALTER TABLE `erp_c_price_expression`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_price_global_variable`
--
ALTER TABLE `erp_c_price_global_variable`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_price_global_variable_updater`
--
ALTER TABLE `erp_c_price_global_variable_updater`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_productbatch_qcstatus`
--
ALTER TABLE `erp_c_productbatch_qcstatus`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_productbatch_qcstatus` (`code`,`entity`);

--
-- Indexes for table `erp_c_product_nature`
--
ALTER TABLE `erp_c_product_nature`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_product_nature` (`code`);

--
-- Indexes for table `erp_c_propalst`
--
ALTER TABLE `erp_c_propalst`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_propalst` (`code`);

--
-- Indexes for table `erp_c_prospectcontactlevel`
--
ALTER TABLE `erp_c_prospectcontactlevel`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `erp_c_prospectlevel`
--
ALTER TABLE `erp_c_prospectlevel`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `erp_c_recruitment_origin`
--
ALTER TABLE `erp_c_recruitment_origin`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_regions`
--
ALTER TABLE `erp_c_regions`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code_region` (`code_region`),
  ADD KEY `idx_c_regions_fk_pays` (`fk_pays`);

--
-- Indexes for table `erp_c_revenuestamp`
--
ALTER TABLE `erp_c_revenuestamp`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_shipment_mode`
--
ALTER TABLE `erp_c_shipment_mode`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_shipment_mode` (`code`,`entity`);

--
-- Indexes for table `erp_c_shipment_package_type`
--
ALTER TABLE `erp_c_shipment_package_type`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_c_socialnetworks`
--
ALTER TABLE `erp_c_socialnetworks`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_c_socialnetworks_code_entity` (`entity`,`code`);

--
-- Indexes for table `erp_c_stcomm`
--
ALTER TABLE `erp_c_stcomm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_stcomm` (`code`);

--
-- Indexes for table `erp_c_stcommcontact`
--
ALTER TABLE `erp_c_stcommcontact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_stcommcontact` (`code`);

--
-- Indexes for table `erp_c_ticket_category`
--
ALTER TABLE `erp_c_ticket_category`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Indexes for table `erp_c_ticket_resolution`
--
ALTER TABLE `erp_c_ticket_resolution`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Indexes for table `erp_c_ticket_severity`
--
ALTER TABLE `erp_c_ticket_severity`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Indexes for table `erp_c_ticket_type`
--
ALTER TABLE `erp_c_ticket_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Indexes for table `erp_c_transport_mode`
--
ALTER TABLE `erp_c_transport_mode`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_transport_mode` (`code`,`entity`);

--
-- Indexes for table `erp_c_tva`
--
ALTER TABLE `erp_c_tva`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_tva_id` (`fk_pays`,`code`,`taux`,`recuperableonly`);

--
-- Indexes for table `erp_c_typent`
--
ALTER TABLE `erp_c_typent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_typent` (`code`);

--
-- Indexes for table `erp_c_type_contact`
--
ALTER TABLE `erp_c_type_contact`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_type_contact_id` (`element`,`source`,`code`);

--
-- Indexes for table `erp_c_type_container`
--
ALTER TABLE `erp_c_type_container`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_type_container_id` (`code`,`entity`);

--
-- Indexes for table `erp_c_type_fees`
--
ALTER TABLE `erp_c_type_fees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_type_fees` (`code`);

--
-- Indexes for table `erp_c_type_resource`
--
ALTER TABLE `erp_c_type_resource`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_type_resource_id` (`label`,`code`);

--
-- Indexes for table `erp_c_units`
--
ALTER TABLE `erp_c_units`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_units_code` (`code`);

--
-- Indexes for table `erp_c_ziptown`
--
ALTER TABLE `erp_c_ziptown`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ziptown_fk_pays` (`zip`,`town`,`fk_pays`),
  ADD KEY `idx_c_ziptown_fk_county` (`fk_county`),
  ADD KEY `idx_c_ziptown_fk_pays` (`fk_pays`),
  ADD KEY `idx_c_ziptown_zip` (`zip`);

--
-- Indexes for table `erp_default_values`
--
ALTER TABLE `erp_default_values`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_default_values` (`type`,`entity`,`user_id`,`page`,`param`);

--
-- Indexes for table `erp_delivery`
--
ALTER TABLE `erp_delivery`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_delivery_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_delivery_fk_soc` (`fk_soc`),
  ADD KEY `idx_delivery_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_delivery_fk_user_valid` (`fk_user_valid`);

--
-- Indexes for table `erp_deliverydet`
--
ALTER TABLE `erp_deliverydet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_deliverydet_fk_delivery` (`fk_delivery`);

--
-- Indexes for table `erp_deliverydet_extrafields`
--
ALTER TABLE `erp_deliverydet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_deliverydet_extrafields` (`fk_object`);

--
-- Indexes for table `erp_delivery_extrafields`
--
ALTER TABLE `erp_delivery_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_delivery_extrafields` (`fk_object`);

--
-- Indexes for table `erp_deplacement`
--
ALTER TABLE `erp_deplacement`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_document_model`
--
ALTER TABLE `erp_document_model`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_document_model` (`nom`,`type`,`entity`);

--
-- Indexes for table `erp_don`
--
ALTER TABLE `erp_don`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_don_extrafields`
--
ALTER TABLE `erp_don_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_don_extrafields` (`fk_object`);

--
-- Indexes for table `erp_ecm_directories`
--
ALTER TABLE `erp_ecm_directories`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ecm_directories` (`label`,`fk_parent`,`entity`),
  ADD KEY `idx_ecm_directories_fk_user_c` (`fk_user_c`),
  ADD KEY `idx_ecm_directories_fk_user_m` (`fk_user_m`);

--
-- Indexes for table `erp_ecm_directories_extrafields`
--
ALTER TABLE `erp_ecm_directories_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ecm_directories_extrafields` (`fk_object`);

--
-- Indexes for table `erp_ecm_files`
--
ALTER TABLE `erp_ecm_files`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ecm_files` (`filepath`,`filename`,`entity`),
  ADD KEY `idx_ecm_files_label` (`label`);

--
-- Indexes for table `erp_ecm_files_extrafields`
--
ALTER TABLE `erp_ecm_files_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ecm_files_extrafields` (`fk_object`);

--
-- Indexes for table `erp_element_contact`
--
ALTER TABLE `erp_element_contact`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_element_contact_idx1` (`element_id`,`fk_c_type_contact`,`fk_socpeople`),
  ADD KEY `fk_element_contact_fk_c_type_contact` (`fk_c_type_contact`),
  ADD KEY `idx_element_contact_fk_socpeople` (`fk_socpeople`);

--
-- Indexes for table `erp_element_element`
--
ALTER TABLE `erp_element_element`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_element_element_idx1` (`fk_source`,`sourcetype`,`fk_target`,`targettype`),
  ADD KEY `idx_element_element_fk_target` (`fk_target`);

--
-- Indexes for table `erp_element_resources`
--
ALTER TABLE `erp_element_resources`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_element_resources_idx1` (`resource_id`,`resource_type`,`element_id`,`element_type`),
  ADD KEY `idx_element_element_element_id` (`element_id`);

--
-- Indexes for table `erp_element_tag`
--
ALTER TABLE `erp_element_tag`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_element_tag_uk` (`fk_categorie`,`fk_element`);

--
-- Indexes for table `erp_emailcollector_emailcollector`
--
ALTER TABLE `erp_emailcollector_emailcollector`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_emailcollector_emailcollector_ref` (`ref`,`entity`),
  ADD KEY `idx_emailcollector_entity` (`entity`),
  ADD KEY `idx_emailcollector_status` (`status`);

--
-- Indexes for table `erp_emailcollector_emailcollectoraction`
--
ALTER TABLE `erp_emailcollector_emailcollectoraction`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_emailcollector_emailcollectoraction` (`fk_emailcollector`,`type`),
  ADD KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`);

--
-- Indexes for table `erp_emailcollector_emailcollectorfilter`
--
ALTER TABLE `erp_emailcollector_emailcollectorfilter`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_emailcollector_emailcollectorfilter` (`fk_emailcollector`,`type`,`rulevalue`),
  ADD KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`);

--
-- Indexes for table `erp_entrepot`
--
ALTER TABLE `erp_entrepot`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_entrepot_label` (`ref`,`entity`);

--
-- Indexes for table `erp_entrepot_extrafields`
--
ALTER TABLE `erp_entrepot_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_entrepot_extrafields` (`fk_object`);

--
-- Indexes for table `erp_establishment`
--
ALTER TABLE `erp_establishment`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_eventorganization_conferenceorboothattendee`
--
ALTER TABLE `erp_eventorganization_conferenceorboothattendee`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_eventorganization_conferenceorboothattendee` (`fk_project`,`email`,`fk_actioncomm`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_rowid` (`rowid`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_ref` (`ref`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_fk_soc` (`fk_soc`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_fk_actioncomm` (`fk_actioncomm`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_fk_project` (`fk_project`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_email` (`email`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_status` (`status`);

--
-- Indexes for table `erp_eventorganization_conferenceorboothattendee_extrafields`
--
ALTER TABLE `erp_eventorganization_conferenceorboothattendee_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_conferenceorboothattendee_fk_object` (`fk_object`);

--
-- Indexes for table `erp_events`
--
ALTER TABLE `erp_events`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_events_dateevent` (`dateevent`);

--
-- Indexes for table `erp_event_element`
--
ALTER TABLE `erp_event_element`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_expedition`
--
ALTER TABLE `erp_expedition`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_expedition_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_expedition_fk_soc` (`fk_soc`),
  ADD KEY `idx_expedition_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_expedition_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_expedition_fk_shipping_method` (`fk_shipping_method`);

--
-- Indexes for table `erp_expeditiondet`
--
ALTER TABLE `erp_expeditiondet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expeditiondet_fk_expedition` (`fk_expedition`),
  ADD KEY `idx_expeditiondet_fk_origin_line` (`fk_origin_line`);

--
-- Indexes for table `erp_expeditiondet_batch`
--
ALTER TABLE `erp_expeditiondet_batch`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_fk_expeditiondet` (`fk_expeditiondet`);

--
-- Indexes for table `erp_expeditiondet_extrafields`
--
ALTER TABLE `erp_expeditiondet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expeditiondet_extrafields` (`fk_object`);

--
-- Indexes for table `erp_expedition_extrafields`
--
ALTER TABLE `erp_expedition_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expedition_extrafields` (`fk_object`);

--
-- Indexes for table `erp_expedition_package`
--
ALTER TABLE `erp_expedition_package`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_expensereport`
--
ALTER TABLE `erp_expensereport`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_expensereport_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_expensereport_date_debut` (`date_debut`),
  ADD KEY `idx_expensereport_date_fin` (`date_fin`),
  ADD KEY `idx_expensereport_fk_statut` (`fk_statut`),
  ADD KEY `idx_expensereport_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_expensereport_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_expensereport_fk_user_approve` (`fk_user_approve`),
  ADD KEY `idx_expensereport_fk_refuse` (`fk_user_approve`);

--
-- Indexes for table `erp_expensereport_det`
--
ALTER TABLE `erp_expensereport_det`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_expensereport_extrafields`
--
ALTER TABLE `erp_expensereport_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expensereport_extrafields` (`fk_object`);

--
-- Indexes for table `erp_expensereport_ik`
--
ALTER TABLE `erp_expensereport_ik`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_expensereport_rules`
--
ALTER TABLE `erp_expensereport_rules`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_export_compta`
--
ALTER TABLE `erp_export_compta`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_export_model`
--
ALTER TABLE `erp_export_model`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_export_model` (`label`,`type`);

--
-- Indexes for table `erp_extrafields`
--
ALTER TABLE `erp_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_extrafields_name` (`name`,`entity`,`elementtype`);

--
-- Indexes for table `erp_facture`
--
ALTER TABLE `erp_facture`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_facture_ref` (`ref`,`entity`),
  ADD KEY `idx_facture_fk_soc` (`fk_soc`),
  ADD KEY `idx_facture_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_facture_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_facture_fk_facture_source` (`fk_facture_source`),
  ADD KEY `idx_facture_fk_projet` (`fk_projet`),
  ADD KEY `idx_facture_fk_account` (`fk_account`),
  ADD KEY `idx_facture_fk_currency` (`fk_currency`),
  ADD KEY `idx_facture_fk_statut` (`fk_statut`);

--
-- Indexes for table `erp_facturedet`
--
ALTER TABLE `erp_facturedet`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture`),
  ADD KEY `idx_facturedet_fk_facture` (`fk_facture`),
  ADD KEY `idx_facturedet_fk_product` (`fk_product`),
  ADD KEY `idx_facturedet_fk_code_ventilation` (`fk_code_ventilation`),
  ADD KEY `fk_facturedet_fk_unit` (`fk_unit`);

--
-- Indexes for table `erp_facturedet_extrafields`
--
ALTER TABLE `erp_facturedet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facturedet_extrafields` (`fk_object`);

--
-- Indexes for table `erp_facturedet_rec`
--
ALTER TABLE `erp_facturedet_rec`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `fk_facturedet_rec_fk_unit` (`fk_unit`);

--
-- Indexes for table `erp_facturedet_rec_extrafields`
--
ALTER TABLE `erp_facturedet_rec_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facturedet_rec_extrafields` (`fk_object`);

--
-- Indexes for table `erp_facture_extrafields`
--
ALTER TABLE `erp_facture_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_extrafields` (`fk_object`);

--
-- Indexes for table `erp_facture_fourn`
--
ALTER TABLE `erp_facture_fourn`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_facture_fourn_ref` (`ref`,`entity`),
  ADD UNIQUE KEY `uk_facture_fourn_ref_supplier` (`ref_supplier`,`fk_soc`,`entity`),
  ADD KEY `idx_facture_fourn_date_lim_reglement` (`date_lim_reglement`),
  ADD KEY `idx_facture_fourn_fk_soc` (`fk_soc`),
  ADD KEY `idx_facture_fourn_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_facture_fourn_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_facture_fourn_fk_projet` (`fk_projet`);

--
-- Indexes for table `erp_facture_fourn_det`
--
ALTER TABLE `erp_facture_fourn_det`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture_fourn`),
  ADD KEY `idx_facture_fourn_det_fk_facture` (`fk_facture_fourn`),
  ADD KEY `idx_facture_fourn_det_fk_product` (`fk_product`),
  ADD KEY `idx_facture_fourn_det_fk_code_ventilation` (`fk_code_ventilation`),
  ADD KEY `fk_facture_fourn_det_fk_unit` (`fk_unit`);

--
-- Indexes for table `erp_facture_fourn_det_extrafields`
--
ALTER TABLE `erp_facture_fourn_det_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_fourn_det_extrafields` (`fk_object`);

--
-- Indexes for table `erp_facture_fourn_extrafields`
--
ALTER TABLE `erp_facture_fourn_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_fourn_extrafields` (`fk_object`);

--
-- Indexes for table `erp_facture_rec`
--
ALTER TABLE `erp_facture_rec`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_facture_rec_uk_titre` (`titre`,`entity`),
  ADD KEY `idx_facture_rec_fk_soc` (`fk_soc`),
  ADD KEY `idx_facture_rec_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_facture_rec_fk_projet` (`fk_projet`);

--
-- Indexes for table `erp_facture_rec_extrafields`
--
ALTER TABLE `erp_facture_rec_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_rec_extrafields` (`fk_object`);

--
-- Indexes for table `erp_fichinter`
--
ALTER TABLE `erp_fichinter`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_fichinter_ref` (`ref`,`entity`),
  ADD KEY `idx_fichinter_fk_soc` (`fk_soc`);

--
-- Indexes for table `erp_fichinterdet`
--
ALTER TABLE `erp_fichinterdet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_fichinterdet_fk_fichinter` (`fk_fichinter`);

--
-- Indexes for table `erp_fichinterdet_extrafields`
--
ALTER TABLE `erp_fichinterdet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ficheinterdet_extrafields` (`fk_object`);

--
-- Indexes for table `erp_fichinterdet_rec`
--
ALTER TABLE `erp_fichinterdet_rec`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_fichinter_extrafields`
--
ALTER TABLE `erp_fichinter_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ficheinter_extrafields` (`fk_object`);

--
-- Indexes for table `erp_fichinter_rec`
--
ALTER TABLE `erp_fichinter_rec`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_fichinter_rec_uk_titre` (`titre`,`entity`),
  ADD KEY `idx_fichinter_rec_fk_soc` (`fk_soc`),
  ADD KEY `idx_fichinter_rec_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_fichinter_rec_fk_projet` (`fk_projet`);

--
-- Indexes for table `erp_holiday`
--
ALTER TABLE `erp_holiday`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_holiday_entity` (`entity`),
  ADD KEY `idx_holiday_fk_user` (`fk_user`),
  ADD KEY `idx_holiday_fk_user_create` (`fk_user_create`),
  ADD KEY `idx_holiday_date_create` (`date_create`),
  ADD KEY `idx_holiday_date_debut` (`date_debut`),
  ADD KEY `idx_holiday_date_fin` (`date_fin`),
  ADD KEY `idx_holiday_fk_validator` (`fk_validator`);

--
-- Indexes for table `erp_holiday_config`
--
ALTER TABLE `erp_holiday_config`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_holiday_config` (`name`);

--
-- Indexes for table `erp_holiday_extrafields`
--
ALTER TABLE `erp_holiday_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_holiday_extrafields` (`fk_object`);

--
-- Indexes for table `erp_holiday_logs`
--
ALTER TABLE `erp_holiday_logs`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_holiday_users`
--
ALTER TABLE `erp_holiday_users`
  ADD UNIQUE KEY `uk_holiday_users` (`fk_user`,`fk_type`);

--
-- Indexes for table `erp_hrm_evaluation`
--
ALTER TABLE `erp_hrm_evaluation`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_hrm_evaluation_rowid` (`rowid`),
  ADD KEY `idx_hrm_evaluation_ref` (`ref`),
  ADD KEY `erp_hrm_evaluation_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_hrm_evaluation_status` (`status`);

--
-- Indexes for table `erp_hrm_evaluationdet`
--
ALTER TABLE `erp_hrm_evaluationdet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_hrm_evaluationdet_rowid` (`rowid`),
  ADD KEY `erp_hrm_evaluationdet_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_hrm_evaluationdet_fk_skill` (`fk_skill`),
  ADD KEY `idx_hrm_evaluationdet_fk_evaluation` (`fk_evaluation`);

--
-- Indexes for table `erp_hrm_evaluationdet_extrafields`
--
ALTER TABLE `erp_hrm_evaluationdet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_evaluationdet_fk_object` (`fk_object`);

--
-- Indexes for table `erp_hrm_evaluation_extrafields`
--
ALTER TABLE `erp_hrm_evaluation_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_evaluation_fk_object` (`fk_object`);

--
-- Indexes for table `erp_hrm_job`
--
ALTER TABLE `erp_hrm_job`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_hrm_job_rowid` (`rowid`),
  ADD KEY `idx_hrm_job_label` (`label`);

--
-- Indexes for table `erp_hrm_job_extrafields`
--
ALTER TABLE `erp_hrm_job_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_job_fk_object` (`fk_object`);

--
-- Indexes for table `erp_hrm_job_user`
--
ALTER TABLE `erp_hrm_job_user`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_hrm_job_user_rowid` (`rowid`);

--
-- Indexes for table `erp_hrm_job_user_extrafields`
--
ALTER TABLE `erp_hrm_job_user_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_position_fk_object` (`fk_object`);

--
-- Indexes for table `erp_hrm_skill`
--
ALTER TABLE `erp_hrm_skill`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_hrm_skill_rowid` (`rowid`),
  ADD KEY `erp_hrm_skill_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_hrm_skill_skill_type` (`skill_type`);

--
-- Indexes for table `erp_hrm_skilldet`
--
ALTER TABLE `erp_hrm_skilldet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_hrm_skilldet_rowid` (`rowid`),
  ADD KEY `erp_hrm_skilldet_fk_user_creat` (`fk_user_creat`);

--
-- Indexes for table `erp_hrm_skilldet_extrafields`
--
ALTER TABLE `erp_hrm_skilldet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_skilldet_fk_object` (`fk_object`);

--
-- Indexes for table `erp_hrm_skillrank`
--
ALTER TABLE `erp_hrm_skillrank`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_hrm_skillrank_rowid` (`rowid`),
  ADD KEY `idx_hrm_skillrank_fk_skill` (`fk_skill`),
  ADD KEY `erp_hrm_skillrank_fk_user_creat` (`fk_user_creat`);

--
-- Indexes for table `erp_hrm_skill_extrafields`
--
ALTER TABLE `erp_hrm_skill_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_skill_fk_object` (`fk_object`);

--
-- Indexes for table `erp_import_model`
--
ALTER TABLE `erp_import_model`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_import_model` (`label`,`type`);

--
-- Indexes for table `erp_intracommreport`
--
ALTER TABLE `erp_intracommreport`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_inventory`
--
ALTER TABLE `erp_inventory`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_inventory_ref` (`ref`,`entity`),
  ADD KEY `idx_inventory_tms` (`tms`),
  ADD KEY `idx_inventory_date_creation` (`date_creation`);

--
-- Indexes for table `erp_inventorydet`
--
ALTER TABLE `erp_inventorydet`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_inventorydet` (`fk_inventory`,`fk_warehouse`,`fk_product`,`batch`),
  ADD KEY `idx_inventorydet_tms` (`tms`),
  ADD KEY `idx_inventorydet_datec` (`datec`),
  ADD KEY `idx_inventorydet_fk_inventory` (`fk_inventory`);

--
-- Indexes for table `erp_knowledgemanagement_knowledgerecord`
--
ALTER TABLE `erp_knowledgemanagement_knowledgerecord`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_knowledgemanagement_knowledgerecord_rowid` (`rowid`),
  ADD KEY `idx_knowledgemanagement_knowledgerecord_ref` (`ref`),
  ADD KEY `erp_knowledgemanagement_knowledgerecord_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_knowledgemanagement_knowledgerecord_status` (`status`);

--
-- Indexes for table `erp_knowledgemanagement_knowledgerecord_extrafields`
--
ALTER TABLE `erp_knowledgemanagement_knowledgerecord_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_knowledgerecord_fk_object` (`fk_object`);

--
-- Indexes for table `erp_links`
--
ALTER TABLE `erp_links`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_links` (`objectid`,`label`);

--
-- Indexes for table `erp_loan`
--
ALTER TABLE `erp_loan`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_loan_schedule`
--
ALTER TABLE `erp_loan_schedule`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_localtax`
--
ALTER TABLE `erp_localtax`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_mailing`
--
ALTER TABLE `erp_mailing`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_mailing_cibles`
--
ALTER TABLE `erp_mailing_cibles`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_mailing_cibles` (`fk_mailing`,`email`),
  ADD KEY `idx_mailing_cibles_email` (`email`),
  ADD KEY `idx_mailing_cibles_tag` (`tag`);

--
-- Indexes for table `erp_mailing_unsubscribe`
--
ALTER TABLE `erp_mailing_unsubscribe`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_mailing_unsubscribe` (`email`,`entity`,`unsubscribegroup`);

--
-- Indexes for table `erp_menu`
--
ALTER TABLE `erp_menu`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_menu_uk_menu` (`menu_handler`,`fk_menu`,`position`,`url`,`entity`),
  ADD KEY `idx_menu_menuhandler_type` (`menu_handler`,`type`);

--
-- Indexes for table `erp_mrp_mo`
--
ALTER TABLE `erp_mrp_mo`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_mrp_mo_ref` (`ref`),
  ADD KEY `idx_mrp_mo_entity` (`entity`),
  ADD KEY `idx_mrp_mo_fk_soc` (`fk_soc`),
  ADD KEY `fk_mrp_mo_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_mrp_mo_status` (`status`),
  ADD KEY `idx_mrp_mo_fk_product` (`fk_product`),
  ADD KEY `idx_mrp_mo_date_start_planned` (`date_start_planned`),
  ADD KEY `idx_mrp_mo_date_end_planned` (`date_end_planned`),
  ADD KEY `idx_mrp_mo_fk_bom` (`fk_bom`),
  ADD KEY `idx_mrp_mo_fk_project` (`fk_project`);

--
-- Indexes for table `erp_mrp_mo_extrafields`
--
ALTER TABLE `erp_mrp_mo_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_mrp_mo_fk_object` (`fk_object`);

--
-- Indexes for table `erp_mrp_production`
--
ALTER TABLE `erp_mrp_production`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `fk_mrp_production_product` (`fk_product`),
  ADD KEY `fk_mrp_production_stock_movement` (`fk_stock_movement`),
  ADD KEY `idx_mrp_production_fk_mo` (`fk_mo`);

--
-- Indexes for table `erp_multicurrency`
--
ALTER TABLE `erp_multicurrency`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_multicurrency_rate`
--
ALTER TABLE `erp_multicurrency_rate`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_notify`
--
ALTER TABLE `erp_notify`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_notify_def`
--
ALTER TABLE `erp_notify_def`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_notify_def_object`
--
ALTER TABLE `erp_notify_def_object`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_oauth_state`
--
ALTER TABLE `erp_oauth_state`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_oauth_token`
--
ALTER TABLE `erp_oauth_token`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_object_lang`
--
ALTER TABLE `erp_object_lang`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_object_lang` (`fk_object`,`type_object`,`property`,`lang`);

--
-- Indexes for table `erp_onlinesignature`
--
ALTER TABLE `erp_onlinesignature`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_opensurvey_comments`
--
ALTER TABLE `erp_opensurvey_comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `idx_id_comment` (`id_comment`),
  ADD KEY `idx_id_sondage` (`id_sondage`);

--
-- Indexes for table `erp_opensurvey_formquestions`
--
ALTER TABLE `erp_opensurvey_formquestions`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_opensurvey_sondage`
--
ALTER TABLE `erp_opensurvey_sondage`
  ADD PRIMARY KEY (`id_sondage`),
  ADD KEY `idx_date_fin` (`date_fin`);

--
-- Indexes for table `erp_opensurvey_user_studs`
--
ALTER TABLE `erp_opensurvey_user_studs`
  ADD PRIMARY KEY (`id_users`),
  ADD KEY `idx_opensurvey_user_studs_id_users` (`id_users`),
  ADD KEY `idx_opensurvey_user_studs_nom` (`nom`),
  ADD KEY `idx_opensurvey_user_studs_id_sondage` (`id_sondage`);

--
-- Indexes for table `erp_overwrite_trans`
--
ALTER TABLE `erp_overwrite_trans`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_overwrite_trans` (`lang`,`transkey`);

--
-- Indexes for table `erp_paiement`
--
ALTER TABLE `erp_paiement`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_paiementcharge`
--
ALTER TABLE `erp_paiementcharge`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_paiementfourn`
--
ALTER TABLE `erp_paiementfourn`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_paiementfourn_facturefourn`
--
ALTER TABLE `erp_paiementfourn_facturefourn`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_paiementfourn_facturefourn` (`fk_paiementfourn`,`fk_facturefourn`),
  ADD KEY `idx_paiementfourn_facturefourn_fk_facture` (`fk_facturefourn`),
  ADD KEY `idx_paiementfourn_facturefourn_fk_paiement` (`fk_paiementfourn`);

--
-- Indexes for table `erp_paiement_facture`
--
ALTER TABLE `erp_paiement_facture`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_paiement_facture` (`fk_paiement`,`fk_facture`),
  ADD KEY `idx_paiement_facture_fk_facture` (`fk_facture`),
  ADD KEY `idx_paiement_facture_fk_paiement` (`fk_paiement`);

--
-- Indexes for table `erp_partnership`
--
ALTER TABLE `erp_partnership`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_partnership_ref` (`ref`,`entity`),
  ADD KEY `idx_partnership_entity` (`entity`);

--
-- Indexes for table `erp_partnership_extrafields`
--
ALTER TABLE `erp_partnership_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_partnership_extrafields` (`fk_object`);

--
-- Indexes for table `erp_payment_donation`
--
ALTER TABLE `erp_payment_donation`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_payment_expensereport`
--
ALTER TABLE `erp_payment_expensereport`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_payment_loan`
--
ALTER TABLE `erp_payment_loan`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_payment_salary`
--
ALTER TABLE `erp_payment_salary`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_payment_salary_ref` (`num_payment`),
  ADD KEY `idx_payment_salary_user` (`fk_user`,`entity`),
  ADD KEY `idx_payment_salary_datep` (`datep`),
  ADD KEY `idx_payment_salary_datesp` (`datesp`),
  ADD KEY `idx_payment_salary_dateep` (`dateep`);

--
-- Indexes for table `erp_payment_various`
--
ALTER TABLE `erp_payment_various`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_payment_vat`
--
ALTER TABLE `erp_payment_vat`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_pos_cash_fence`
--
ALTER TABLE `erp_pos_cash_fence`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_prelevement_bons`
--
ALTER TABLE `erp_prelevement_bons`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_prelevement_bons_ref` (`ref`,`entity`);

--
-- Indexes for table `erp_prelevement_facture`
--
ALTER TABLE `erp_prelevement_facture`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_prelevement_facture_fk_prelevement_lignes` (`fk_prelevement_lignes`);

--
-- Indexes for table `erp_prelevement_facture_demande`
--
ALTER TABLE `erp_prelevement_facture_demande`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_prelevement_facture_demande_fk_facture` (`fk_facture`),
  ADD KEY `idx_prelevement_facture_demande_fk_facture_fourn` (`fk_facture_fourn`);

--
-- Indexes for table `erp_prelevement_lignes`
--
ALTER TABLE `erp_prelevement_lignes`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_prelevement_lignes_fk_prelevement_bons` (`fk_prelevement_bons`);

--
-- Indexes for table `erp_prelevement_rejet`
--
ALTER TABLE `erp_prelevement_rejet`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_printing`
--
ALTER TABLE `erp_printing`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_product`
--
ALTER TABLE `erp_product`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_ref` (`ref`,`entity`),
  ADD UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  ADD KEY `idx_product_label` (`label`),
  ADD KEY `idx_product_barcode` (`barcode`),
  ADD KEY `idx_product_import_key` (`import_key`),
  ADD KEY `idx_product_seuil_stock_alerte` (`seuil_stock_alerte`),
  ADD KEY `idx_product_fk_country` (`fk_country`),
  ADD KEY `idx_product_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  ADD KEY `idx_product_fk_project` (`fk_project`),
  ADD KEY `fk_product_fk_unit` (`fk_unit`),
  ADD KEY `fk_product_finished` (`finished`),
  ADD KEY `fk_product_default_warehouse` (`fk_default_warehouse`);

--
-- Indexes for table `erp_product_association`
--
ALTER TABLE `erp_product_association`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_association` (`fk_product_pere`,`fk_product_fils`),
  ADD KEY `idx_product_association_fils` (`fk_product_fils`);

--
-- Indexes for table `erp_product_attribute`
--
ALTER TABLE `erp_product_attribute`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_attribute_ref` (`ref`);

--
-- Indexes for table `erp_product_attribute_combination`
--
ALTER TABLE `erp_product_attribute_combination`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_att_com_product_parent` (`fk_product_parent`),
  ADD KEY `idx_product_att_com_product_child` (`fk_product_child`);

--
-- Indexes for table `erp_product_attribute_combination2val`
--
ALTER TABLE `erp_product_attribute_combination2val`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_product_attribute_combination_price_level`
--
ALTER TABLE `erp_product_attribute_combination_price_level`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `fk_product_attribute_combination` (`fk_product_attribute_combination`,`fk_price_level`);

--
-- Indexes for table `erp_product_attribute_value`
--
ALTER TABLE `erp_product_attribute_value`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_attribute_value` (`fk_product_attribute`,`ref`);

--
-- Indexes for table `erp_product_batch`
--
ALTER TABLE `erp_product_batch`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_batch` (`fk_product_stock`,`batch`),
  ADD KEY `idx_fk_product_stock` (`fk_product_stock`),
  ADD KEY `idx_batch` (`batch`);

--
-- Indexes for table `erp_product_customer_price`
--
ALTER TABLE `erp_product_customer_price`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_customer_price_fk_product_fk_soc` (`fk_product`,`fk_soc`),
  ADD KEY `idx_product_customer_price_fk_user` (`fk_user`),
  ADD KEY `idx_product_customer_price_fk_soc` (`fk_soc`);

--
-- Indexes for table `erp_product_customer_price_log`
--
ALTER TABLE `erp_product_customer_price_log`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_product_extrafields`
--
ALTER TABLE `erp_product_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_extrafields` (`fk_object`);

--
-- Indexes for table `erp_product_fournisseur_price`
--
ALTER TABLE `erp_product_fournisseur_price`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_fournisseur_price_ref` (`ref_fourn`,`fk_soc`,`quantity`,`entity`),
  ADD UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  ADD KEY `idx_product_fournisseur_price_fk_user` (`fk_user`),
  ADD KEY `idx_product_fourn_price_fk_product` (`fk_product`,`entity`),
  ADD KEY `idx_product_fourn_price_fk_soc` (`fk_soc`,`entity`),
  ADD KEY `idx_product_barcode` (`barcode`),
  ADD KEY `idx_product_fk_barcode_type` (`fk_barcode_type`);

--
-- Indexes for table `erp_product_fournisseur_price_extrafields`
--
ALTER TABLE `erp_product_fournisseur_price_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_fournisseur_price_extrafields` (`fk_object`);

--
-- Indexes for table `erp_product_fournisseur_price_log`
--
ALTER TABLE `erp_product_fournisseur_price_log`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_product_lang`
--
ALTER TABLE `erp_product_lang`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_lang` (`fk_product`,`lang`);

--
-- Indexes for table `erp_product_lot`
--
ALTER TABLE `erp_product_lot`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_lot` (`fk_product`,`batch`);

--
-- Indexes for table `erp_product_lot_extrafields`
--
ALTER TABLE `erp_product_lot_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_lot_extrafields` (`fk_object`);

--
-- Indexes for table `erp_product_perentity`
--
ALTER TABLE `erp_product_perentity`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_perentity` (`fk_product`,`entity`),
  ADD KEY `idx_product_perentity_fk_product` (`fk_product`);

--
-- Indexes for table `erp_product_price`
--
ALTER TABLE `erp_product_price`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_price_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_product_price_fk_product` (`fk_product`);

--
-- Indexes for table `erp_product_pricerules`
--
ALTER TABLE `erp_product_pricerules`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `unique_level` (`level`);

--
-- Indexes for table `erp_product_price_by_qty`
--
ALTER TABLE `erp_product_price_by_qty`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_price_by_qty_level` (`fk_product_price`,`quantity`),
  ADD KEY `idx_product_price_by_qty_fk_product_price` (`fk_product_price`);

--
-- Indexes for table `erp_product_stock`
--
ALTER TABLE `erp_product_stock`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_stock` (`fk_product`,`fk_entrepot`),
  ADD KEY `idx_product_stock_fk_product` (`fk_product`),
  ADD KEY `idx_product_stock_fk_entrepot` (`fk_entrepot`);

--
-- Indexes for table `erp_product_warehouse_properties`
--
ALTER TABLE `erp_product_warehouse_properties`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_projet`
--
ALTER TABLE `erp_projet`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_projet_ref` (`ref`,`entity`),
  ADD KEY `idx_projet_fk_soc` (`fk_soc`);

--
-- Indexes for table `erp_projet_extrafields`
--
ALTER TABLE `erp_projet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_projet_extrafields` (`fk_object`);

--
-- Indexes for table `erp_projet_task`
--
ALTER TABLE `erp_projet_task`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_projet_task_ref` (`ref`,`entity`),
  ADD KEY `idx_projet_task_fk_projet` (`fk_projet`),
  ADD KEY `idx_projet_task_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_projet_task_fk_user_valid` (`fk_user_valid`);

--
-- Indexes for table `erp_projet_task_extrafields`
--
ALTER TABLE `erp_projet_task_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_projet_task_extrafields` (`fk_object`);

--
-- Indexes for table `erp_projet_task_time`
--
ALTER TABLE `erp_projet_task_time`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_projet_task_time_task` (`fk_task`),
  ADD KEY `idx_projet_task_time_date` (`task_date`),
  ADD KEY `idx_projet_task_time_datehour` (`task_datehour`);

--
-- Indexes for table `erp_propal`
--
ALTER TABLE `erp_propal`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_propal_ref` (`ref`,`entity`),
  ADD KEY `idx_propal_fk_soc` (`fk_soc`),
  ADD KEY `idx_propal_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_propal_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_propal_fk_user_signature` (`fk_user_signature`),
  ADD KEY `idx_propal_fk_user_cloture` (`fk_user_cloture`),
  ADD KEY `idx_propal_fk_projet` (`fk_projet`),
  ADD KEY `idx_propal_fk_account` (`fk_account`),
  ADD KEY `idx_propal_fk_currency` (`fk_currency`),
  ADD KEY `idx_propal_fk_warehouse` (`fk_warehouse`);

--
-- Indexes for table `erp_propaldet`
--
ALTER TABLE `erp_propaldet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_propaldet_fk_propal` (`fk_propal`),
  ADD KEY `idx_propaldet_fk_product` (`fk_product`),
  ADD KEY `fk_propaldet_fk_unit` (`fk_unit`);

--
-- Indexes for table `erp_propaldet_extrafields`
--
ALTER TABLE `erp_propaldet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_propaldet_extrafields` (`fk_object`);

--
-- Indexes for table `erp_propal_extrafields`
--
ALTER TABLE `erp_propal_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_propal_extrafields` (`fk_object`);

--
-- Indexes for table `erp_propal_merge_pdf_product`
--
ALTER TABLE `erp_propal_merge_pdf_product`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_reception`
--
ALTER TABLE `erp_reception`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_reception_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_reception_fk_soc` (`fk_soc`),
  ADD KEY `idx_reception_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_reception_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_reception_fk_shipping_method` (`fk_shipping_method`);

--
-- Indexes for table `erp_reception_extrafields`
--
ALTER TABLE `erp_reception_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_reception_extrafields` (`fk_object`);

--
-- Indexes for table `erp_recruitment_recruitmentcandidature`
--
ALTER TABLE `erp_recruitment_recruitmentcandidature`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_recruitmentcandidature_email_msgid` (`email_msgid`),
  ADD KEY `idx_recruitment_recruitmentcandidature_rowid` (`rowid`),
  ADD KEY `idx_recruitment_recruitmentcandidature_ref` (`ref`),
  ADD KEY `erp_recruitment_recruitmentcandidature_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_recruitment_recruitmentcandidature_status` (`status`);

--
-- Indexes for table `erp_recruitment_recruitmentcandidature_extrafields`
--
ALTER TABLE `erp_recruitment_recruitmentcandidature_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_recruitmentcandidature_fk_object` (`fk_object`);

--
-- Indexes for table `erp_recruitment_recruitmentjobposition`
--
ALTER TABLE `erp_recruitment_recruitmentjobposition`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_recruitment_recruitmentjobposition_rowid` (`rowid`),
  ADD KEY `idx_recruitment_recruitmentjobposition_ref` (`ref`),
  ADD KEY `idx_recruitment_recruitmentjobposition_fk_soc` (`fk_soc`),
  ADD KEY `idx_recruitment_recruitmentjobposition_fk_project` (`fk_project`),
  ADD KEY `erp_recruitment_recruitmentjobposition_fk_user_recruiter` (`fk_user_recruiter`),
  ADD KEY `erp_recruitment_recruitmentjobposition_fk_user_supervisor` (`fk_user_supervisor`),
  ADD KEY `erp_recruitment_recruitmentjobposition_fk_establishment` (`fk_establishment`),
  ADD KEY `erp_recruitment_recruitmentjobposition_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_recruitment_recruitmentjobposition_status` (`status`);

--
-- Indexes for table `erp_recruitment_recruitmentjobposition_extrafields`
--
ALTER TABLE `erp_recruitment_recruitmentjobposition_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_recruitmentjobposition_fk_object` (`fk_object`);

--
-- Indexes for table `erp_resource`
--
ALTER TABLE `erp_resource`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_resource_ref` (`ref`,`entity`),
  ADD KEY `fk_code_type_resource_idx` (`fk_code_type_resource`),
  ADD KEY `idx_resource_fk_country` (`fk_country`);

--
-- Indexes for table `erp_resource_extrafields`
--
ALTER TABLE `erp_resource_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_resource_extrafields` (`fk_object`);

--
-- Indexes for table `erp_rights_def`
--
ALTER TABLE `erp_rights_def`
  ADD PRIMARY KEY (`id`,`entity`);

--
-- Indexes for table `erp_salary`
--
ALTER TABLE `erp_salary`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_salary_extrafields`
--
ALTER TABLE `erp_salary_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_salary_extrafields` (`fk_object`);

--
-- Indexes for table `erp_session`
--
ALTER TABLE `erp_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `erp_societe`
--
ALTER TABLE `erp_societe`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_prefix_comm` (`prefix_comm`,`entity`),
  ADD UNIQUE KEY `uk_societe_code_client` (`code_client`,`entity`),
  ADD UNIQUE KEY `uk_societe_code_fournisseur` (`code_fournisseur`,`entity`),
  ADD UNIQUE KEY `uk_societe_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  ADD KEY `idx_societe_user_creat` (`fk_user_creat`),
  ADD KEY `idx_societe_user_modif` (`fk_user_modif`),
  ADD KEY `idx_societe_stcomm` (`fk_stcomm`),
  ADD KEY `idx_societe_pays` (`fk_pays`),
  ADD KEY `idx_societe_account` (`fk_account`),
  ADD KEY `idx_societe_prospectlevel` (`fk_prospectlevel`),
  ADD KEY `idx_societe_typent` (`fk_typent`),
  ADD KEY `idx_societe_forme_juridique` (`fk_forme_juridique`),
  ADD KEY `idx_societe_shipping_method` (`fk_shipping_method`);

--
-- Indexes for table `erp_societe_account`
--
ALTER TABLE `erp_societe_account`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_account_login_website_soc` (`entity`,`fk_soc`,`login`,`site`,`fk_website`),
  ADD UNIQUE KEY `uk_societe_account_key_account_soc` (`entity`,`fk_soc`,`key_account`,`site`,`fk_website`),
  ADD KEY `idx_societe_account_rowid` (`rowid`),
  ADD KEY `idx_societe_account_login` (`login`),
  ADD KEY `idx_societe_account_status` (`status`),
  ADD KEY `idx_societe_account_fk_website` (`fk_website`),
  ADD KEY `idx_societe_account_fk_soc` (`fk_soc`);

--
-- Indexes for table `erp_societe_address`
--
ALTER TABLE `erp_societe_address`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_societe_commerciaux`
--
ALTER TABLE `erp_societe_commerciaux`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_commerciaux` (`fk_soc`,`fk_user`);

--
-- Indexes for table `erp_societe_contacts`
--
ALTER TABLE `erp_societe_contacts`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_societe_contacts_idx1` (`entity`,`fk_soc`,`fk_c_type_contact`,`fk_socpeople`),
  ADD KEY `fk_societe_contacts_fk_c_type_contact` (`fk_c_type_contact`),
  ADD KEY `fk_societe_contacts_fk_soc` (`fk_soc`),
  ADD KEY `fk_societe_contacts_fk_socpeople` (`fk_socpeople`);

--
-- Indexes for table `erp_societe_extrafields`
--
ALTER TABLE `erp_societe_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_extrafields` (`fk_object`);

--
-- Indexes for table `erp_societe_perentity`
--
ALTER TABLE `erp_societe_perentity`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_perentity` (`fk_soc`,`entity`),
  ADD KEY `idx_societe_perentity_fk_soc` (`fk_soc`);

--
-- Indexes for table `erp_societe_prices`
--
ALTER TABLE `erp_societe_prices`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_societe_remise`
--
ALTER TABLE `erp_societe_remise`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_societe_remise_except`
--
ALTER TABLE `erp_societe_remise_except`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_societe_remise_except_fk_user` (`fk_user`),
  ADD KEY `idx_societe_remise_except_fk_soc` (`fk_soc`),
  ADD KEY `idx_societe_remise_except_fk_facture_line` (`fk_facture_line`),
  ADD KEY `idx_societe_remise_except_fk_facture` (`fk_facture`),
  ADD KEY `idx_societe_remise_except_fk_facture_source` (`fk_facture_source`),
  ADD KEY `idx_societe_remise_except_discount_type` (`discount_type`),
  ADD KEY `fk_soc_remise_fk_invoice_supplier_line` (`fk_invoice_supplier_line`),
  ADD KEY `fk_societe_remise_fk_invoice_supplier_source` (`fk_invoice_supplier`);

--
-- Indexes for table `erp_societe_remise_supplier`
--
ALTER TABLE `erp_societe_remise_supplier`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_societe_rib`
--
ALTER TABLE `erp_societe_rib`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_rib` (`label`,`fk_soc`),
  ADD KEY `erp_societe_rib_fk_societe` (`fk_soc`);

--
-- Indexes for table `erp_socpeople`
--
ALTER TABLE `erp_socpeople`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_socpeople_fk_soc` (`fk_soc`),
  ADD KEY `idx_socpeople_fk_user_creat` (`fk_user_creat`);

--
-- Indexes for table `erp_socpeople_extrafields`
--
ALTER TABLE `erp_socpeople_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_socpeople_extrafields` (`fk_object`);

--
-- Indexes for table `erp_stock_mouvement`
--
ALTER TABLE `erp_stock_mouvement`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_stock_mouvement_fk_product` (`fk_product`),
  ADD KEY `idx_stock_mouvement_fk_entrepot` (`fk_entrepot`);

--
-- Indexes for table `erp_subscription`
--
ALTER TABLE `erp_subscription`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_subscription` (`fk_adherent`,`dateadh`);

--
-- Indexes for table `erp_supplier_proposal`
--
ALTER TABLE `erp_supplier_proposal`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_supplier_proposaldet`
--
ALTER TABLE `erp_supplier_proposaldet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_supplier_proposaldet_fk_supplier_proposal` (`fk_supplier_proposal`),
  ADD KEY `idx_supplier_proposaldet_fk_product` (`fk_product`),
  ADD KEY `fk_supplier_proposaldet_fk_unit` (`fk_unit`);

--
-- Indexes for table `erp_supplier_proposaldet_extrafields`
--
ALTER TABLE `erp_supplier_proposaldet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_supplier_proposaldet_extrafields` (`fk_object`);

--
-- Indexes for table `erp_supplier_proposal_extrafields`
--
ALTER TABLE `erp_supplier_proposal_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_supplier_proposal_extrafields` (`fk_object`);

--
-- Indexes for table `erp_takepos_floor_tables`
--
ALTER TABLE `erp_takepos_floor_tables`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_ticket`
--
ALTER TABLE `erp_ticket`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ticket_track_id` (`track_id`),
  ADD UNIQUE KEY `uk_ticket_ref` (`ref`,`entity`),
  ADD KEY `idx_ticket_entity` (`entity`),
  ADD KEY `idx_ticket_fk_soc` (`fk_soc`),
  ADD KEY `idx_ticket_fk_user_assign` (`fk_user_assign`),
  ADD KEY `idx_ticket_fk_project` (`fk_project`),
  ADD KEY `idx_ticket_fk_statut` (`fk_statut`);

--
-- Indexes for table `erp_ticket_extrafields`
--
ALTER TABLE `erp_ticket_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ticket_extrafields` (`fk_object`);

--
-- Indexes for table `erp_tva`
--
ALTER TABLE `erp_tva`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_user`
--
ALTER TABLE `erp_user`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_user_login` (`login`,`entity`),
  ADD UNIQUE KEY `uk_user_fk_socpeople` (`fk_socpeople`),
  ADD UNIQUE KEY `uk_user_fk_member` (`fk_member`),
  ADD UNIQUE KEY `uk_user_api_key` (`api_key`),
  ADD KEY `idx_user_fk_societe` (`fk_soc`);

--
-- Indexes for table `erp_usergroup`
--
ALTER TABLE `erp_usergroup`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_usergroup_name` (`nom`,`entity`);

--
-- Indexes for table `erp_usergroup_extrafields`
--
ALTER TABLE `erp_usergroup_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_usergroup_extrafields` (`fk_object`);

--
-- Indexes for table `erp_usergroup_rights`
--
ALTER TABLE `erp_usergroup_rights`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_usergroup_rights` (`entity`,`fk_usergroup`,`fk_id`),
  ADD KEY `fk_usergroup_rights_fk_usergroup` (`fk_usergroup`);

--
-- Indexes for table `erp_usergroup_user`
--
ALTER TABLE `erp_usergroup_user`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_usergroup_user` (`entity`,`fk_user`,`fk_usergroup`),
  ADD KEY `fk_usergroup_user_fk_user` (`fk_user`),
  ADD KEY `fk_usergroup_user_fk_usergroup` (`fk_usergroup`);

--
-- Indexes for table `erp_user_alert`
--
ALTER TABLE `erp_user_alert`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_user_clicktodial`
--
ALTER TABLE `erp_user_clicktodial`
  ADD PRIMARY KEY (`fk_user`);

--
-- Indexes for table `erp_user_employment`
--
ALTER TABLE `erp_user_employment`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_user_employment` (`ref`,`entity`),
  ADD KEY `fk_user_employment_fk_user` (`fk_user`);

--
-- Indexes for table `erp_user_extrafields`
--
ALTER TABLE `erp_user_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_user_extrafields` (`fk_object`);

--
-- Indexes for table `erp_user_param`
--
ALTER TABLE `erp_user_param`
  ADD UNIQUE KEY `uk_user_param` (`fk_user`,`param`,`entity`);

--
-- Indexes for table `erp_user_rib`
--
ALTER TABLE `erp_user_rib`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_user_rights`
--
ALTER TABLE `erp_user_rights`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_user_rights` (`entity`,`fk_user`,`fk_id`),
  ADD KEY `fk_user_rights_fk_user_user` (`fk_user`);

--
-- Indexes for table `erp_website`
--
ALTER TABLE `erp_website`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_website_ref` (`ref`,`entity`);

--
-- Indexes for table `erp_website_extrafields`
--
ALTER TABLE `erp_website_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_website_extrafields` (`fk_object`);

--
-- Indexes for table `erp_website_page`
--
ALTER TABLE `erp_website_page`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_website_page_url` (`fk_website`,`pageurl`);

--
-- Indexes for table `erp_workstation_workstation`
--
ALTER TABLE `erp_workstation_workstation`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_workstation_workstation_rowid` (`rowid`),
  ADD KEY `idx_workstation_workstation_ref` (`ref`),
  ADD KEY `fk_workstation_workstation_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_workstation_workstation_status` (`status`);

--
-- Indexes for table `erp_workstation_workstation_resource`
--
ALTER TABLE `erp_workstation_workstation_resource`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_workstation_workstation_usergroup`
--
ALTER TABLE `erp_workstation_workstation_usergroup`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `erp_zapier_hook`
--
ALTER TABLE `erp_zapier_hook`
  ADD PRIMARY KEY (`rowid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `erp_accounting_account`
--
ALTER TABLE `erp_accounting_account`
  MODIFY `rowid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_accounting_bookkeeping`
--
ALTER TABLE `erp_accounting_bookkeeping`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_accounting_bookkeeping_tmp`
--
ALTER TABLE `erp_accounting_bookkeeping_tmp`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_accounting_fiscalyear`
--
ALTER TABLE `erp_accounting_fiscalyear`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_accounting_groups_account`
--
ALTER TABLE `erp_accounting_groups_account`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_accounting_journal`
--
ALTER TABLE `erp_accounting_journal`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `erp_accounting_system`
--
ALTER TABLE `erp_accounting_system`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `erp_actioncomm`
--
ALTER TABLE `erp_actioncomm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `erp_actioncomm_extrafields`
--
ALTER TABLE `erp_actioncomm_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_actioncomm_reminder`
--
ALTER TABLE `erp_actioncomm_reminder`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_actioncomm_resources`
--
ALTER TABLE `erp_actioncomm_resources`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `erp_adherent`
--
ALTER TABLE `erp_adherent`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_adherent_extrafields`
--
ALTER TABLE `erp_adherent_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_adherent_type`
--
ALTER TABLE `erp_adherent_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_adherent_type_extrafields`
--
ALTER TABLE `erp_adherent_type_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_adherent_type_lang`
--
ALTER TABLE `erp_adherent_type_lang`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_advtargetemailing`
--
ALTER TABLE `erp_advtargetemailing`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_asset`
--
ALTER TABLE `erp_asset`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_asset_extrafields`
--
ALTER TABLE `erp_asset_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_asset_type`
--
ALTER TABLE `erp_asset_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_asset_type_extrafields`
--
ALTER TABLE `erp_asset_type_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_bank`
--
ALTER TABLE `erp_bank`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `erp_bank_account`
--
ALTER TABLE `erp_bank_account`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `erp_bank_account_extrafields`
--
ALTER TABLE `erp_bank_account_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_bank_categ`
--
ALTER TABLE `erp_bank_categ`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_bank_url`
--
ALTER TABLE `erp_bank_url`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `erp_blockedlog`
--
ALTER TABLE `erp_blockedlog`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_blockedlog_authority`
--
ALTER TABLE `erp_blockedlog_authority`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_bom_bom`
--
ALTER TABLE `erp_bom_bom`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `erp_bom_bomline`
--
ALTER TABLE `erp_bom_bomline`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `erp_bom_bomline_extrafields`
--
ALTER TABLE `erp_bom_bomline_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_bom_bom_extrafields`
--
ALTER TABLE `erp_bom_bom_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_bookmark`
--
ALTER TABLE `erp_bookmark`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_bordereau_cheque`
--
ALTER TABLE `erp_bordereau_cheque`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_boxes`
--
ALTER TABLE `erp_boxes`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `erp_boxes_def`
--
ALTER TABLE `erp_boxes_def`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `erp_budget`
--
ALTER TABLE `erp_budget`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_budget_lines`
--
ALTER TABLE `erp_budget_lines`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_categorie`
--
ALTER TABLE `erp_categorie`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `erp_categories_extrafields`
--
ALTER TABLE `erp_categories_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_categorie_lang`
--
ALTER TABLE `erp_categorie_lang`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_chargesociales`
--
ALTER TABLE `erp_chargesociales`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_commande`
--
ALTER TABLE `erp_commande`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `erp_commandedet`
--
ALTER TABLE `erp_commandedet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `erp_commandedet_extrafields`
--
ALTER TABLE `erp_commandedet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_commande_extrafields`
--
ALTER TABLE `erp_commande_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_commande_fournisseur`
--
ALTER TABLE `erp_commande_fournisseur`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `erp_commande_fournisseurdet`
--
ALTER TABLE `erp_commande_fournisseurdet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `erp_commande_fournisseurdet_extrafields`
--
ALTER TABLE `erp_commande_fournisseurdet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_commande_fournisseur_dispatch`
--
ALTER TABLE `erp_commande_fournisseur_dispatch`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_commande_fournisseur_dispatch_extrafields`
--
ALTER TABLE `erp_commande_fournisseur_dispatch_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_commande_fournisseur_extrafields`
--
ALTER TABLE `erp_commande_fournisseur_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_commande_fournisseur_log`
--
ALTER TABLE `erp_commande_fournisseur_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_comment`
--
ALTER TABLE `erp_comment`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_const`
--
ALTER TABLE `erp_const`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=729;

--
-- AUTO_INCREMENT for table `erp_contrat`
--
ALTER TABLE `erp_contrat`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_contratdet`
--
ALTER TABLE `erp_contratdet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `erp_contratdet_extrafields`
--
ALTER TABLE `erp_contratdet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_contratdet_log`
--
ALTER TABLE `erp_contratdet_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_contrat_extrafields`
--
ALTER TABLE `erp_contrat_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_cronjob`
--
ALTER TABLE `erp_cronjob`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `erp_c_accounting_category`
--
ALTER TABLE `erp_c_accounting_category`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `erp_c_action_trigger`
--
ALTER TABLE `erp_c_action_trigger`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `erp_c_availability`
--
ALTER TABLE `erp_c_availability`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `erp_c_barcode_type`
--
ALTER TABLE `erp_c_barcode_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `erp_c_chargesociales`
--
ALTER TABLE `erp_c_chargesociales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4110;

--
-- AUTO_INCREMENT for table `erp_c_civility`
--
ALTER TABLE `erp_c_civility`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `erp_c_departements`
--
ALTER TABLE `erp_c_departements`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1541;

--
-- AUTO_INCREMENT for table `erp_c_ecotaxe`
--
ALTER TABLE `erp_c_ecotaxe`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `erp_c_email_senderprofile`
--
ALTER TABLE `erp_c_email_senderprofile`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_c_email_templates`
--
ALTER TABLE `erp_c_email_templates`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `erp_c_exp_tax_cat`
--
ALTER TABLE `erp_c_exp_tax_cat`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `erp_c_exp_tax_range`
--
ALTER TABLE `erp_c_exp_tax_range`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `erp_c_field_list`
--
ALTER TABLE `erp_c_field_list`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_c_format_cards`
--
ALTER TABLE `erp_c_format_cards`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `erp_c_forme_juridique`
--
ALTER TABLE `erp_c_forme_juridique`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `erp_c_holiday_types`
--
ALTER TABLE `erp_c_holiday_types`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `erp_c_hrm_public_holiday`
--
ALTER TABLE `erp_c_hrm_public_holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `erp_c_incoterms`
--
ALTER TABLE `erp_c_incoterms`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `erp_c_input_method`
--
ALTER TABLE `erp_c_input_method`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `erp_c_input_reason`
--
ALTER TABLE `erp_c_input_reason`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `erp_c_lead_status`
--
ALTER TABLE `erp_c_lead_status`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `erp_c_paiement`
--
ALTER TABLE `erp_c_paiement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `erp_c_paper_format`
--
ALTER TABLE `erp_c_paper_format`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `erp_c_partnership_type`
--
ALTER TABLE `erp_c_partnership_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_c_payment_term`
--
ALTER TABLE `erp_c_payment_term`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `erp_c_price_expression`
--
ALTER TABLE `erp_c_price_expression`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_c_price_global_variable`
--
ALTER TABLE `erp_c_price_global_variable`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_c_price_global_variable_updater`
--
ALTER TABLE `erp_c_price_global_variable_updater`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_c_productbatch_qcstatus`
--
ALTER TABLE `erp_c_productbatch_qcstatus`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `erp_c_product_nature`
--
ALTER TABLE `erp_c_product_nature`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `erp_c_recruitment_origin`
--
ALTER TABLE `erp_c_recruitment_origin`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_c_regions`
--
ALTER TABLE `erp_c_regions`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT for table `erp_c_revenuestamp`
--
ALTER TABLE `erp_c_revenuestamp`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1543;

--
-- AUTO_INCREMENT for table `erp_c_shipment_mode`
--
ALTER TABLE `erp_c_shipment_mode`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `erp_c_shipment_package_type`
--
ALTER TABLE `erp_c_shipment_package_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_c_socialnetworks`
--
ALTER TABLE `erp_c_socialnetworks`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `erp_c_ticket_category`
--
ALTER TABLE `erp_c_ticket_category`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_c_ticket_resolution`
--
ALTER TABLE `erp_c_ticket_resolution`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `erp_c_ticket_severity`
--
ALTER TABLE `erp_c_ticket_severity`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `erp_c_ticket_type`
--
ALTER TABLE `erp_c_ticket_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `erp_c_transport_mode`
--
ALTER TABLE `erp_c_transport_mode`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `erp_c_tva`
--
ALTER TABLE `erp_c_tva`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2463;

--
-- AUTO_INCREMENT for table `erp_c_type_container`
--
ALTER TABLE `erp_c_type_container`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `erp_c_type_fees`
--
ALTER TABLE `erp_c_type_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `erp_c_type_resource`
--
ALTER TABLE `erp_c_type_resource`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `erp_c_units`
--
ALTER TABLE `erp_c_units`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `erp_c_ziptown`
--
ALTER TABLE `erp_c_ziptown`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_default_values`
--
ALTER TABLE `erp_default_values`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_delivery`
--
ALTER TABLE `erp_delivery`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_deliverydet`
--
ALTER TABLE `erp_deliverydet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_deliverydet_extrafields`
--
ALTER TABLE `erp_deliverydet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_delivery_extrafields`
--
ALTER TABLE `erp_delivery_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_deplacement`
--
ALTER TABLE `erp_deplacement`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_document_model`
--
ALTER TABLE `erp_document_model`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `erp_don`
--
ALTER TABLE `erp_don`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_don_extrafields`
--
ALTER TABLE `erp_don_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_ecm_directories`
--
ALTER TABLE `erp_ecm_directories`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_ecm_directories_extrafields`
--
ALTER TABLE `erp_ecm_directories_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_ecm_files`
--
ALTER TABLE `erp_ecm_files`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `erp_ecm_files_extrafields`
--
ALTER TABLE `erp_ecm_files_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_element_contact`
--
ALTER TABLE `erp_element_contact`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `erp_element_element`
--
ALTER TABLE `erp_element_element`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `erp_element_resources`
--
ALTER TABLE `erp_element_resources`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_element_tag`
--
ALTER TABLE `erp_element_tag`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_emailcollector_emailcollector`
--
ALTER TABLE `erp_emailcollector_emailcollector`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_emailcollector_emailcollectoraction`
--
ALTER TABLE `erp_emailcollector_emailcollectoraction`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_emailcollector_emailcollectorfilter`
--
ALTER TABLE `erp_emailcollector_emailcollectorfilter`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_entrepot`
--
ALTER TABLE `erp_entrepot`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `erp_entrepot_extrafields`
--
ALTER TABLE `erp_entrepot_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_establishment`
--
ALTER TABLE `erp_establishment`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_eventorganization_conferenceorboothattendee`
--
ALTER TABLE `erp_eventorganization_conferenceorboothattendee`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_eventorganization_conferenceorboothattendee_extrafields`
--
ALTER TABLE `erp_eventorganization_conferenceorboothattendee_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_events`
--
ALTER TABLE `erp_events`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_event_element`
--
ALTER TABLE `erp_event_element`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_expedition`
--
ALTER TABLE `erp_expedition`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `erp_expeditiondet`
--
ALTER TABLE `erp_expeditiondet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `erp_expeditiondet_batch`
--
ALTER TABLE `erp_expeditiondet_batch`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `erp_expeditiondet_extrafields`
--
ALTER TABLE `erp_expeditiondet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_expedition_extrafields`
--
ALTER TABLE `erp_expedition_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_expedition_package`
--
ALTER TABLE `erp_expedition_package`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_expensereport`
--
ALTER TABLE `erp_expensereport`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_expensereport_det`
--
ALTER TABLE `erp_expensereport_det`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_expensereport_extrafields`
--
ALTER TABLE `erp_expensereport_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_expensereport_ik`
--
ALTER TABLE `erp_expensereport_ik`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `erp_expensereport_rules`
--
ALTER TABLE `erp_expensereport_rules`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_export_compta`
--
ALTER TABLE `erp_export_compta`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_export_model`
--
ALTER TABLE `erp_export_model`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_extrafields`
--
ALTER TABLE `erp_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_facture`
--
ALTER TABLE `erp_facture`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `erp_facturedet`
--
ALTER TABLE `erp_facturedet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `erp_facturedet_extrafields`
--
ALTER TABLE `erp_facturedet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_facturedet_rec`
--
ALTER TABLE `erp_facturedet_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_facturedet_rec_extrafields`
--
ALTER TABLE `erp_facturedet_rec_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_facture_extrafields`
--
ALTER TABLE `erp_facture_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_facture_fourn`
--
ALTER TABLE `erp_facture_fourn`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_facture_fourn_det`
--
ALTER TABLE `erp_facture_fourn_det`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_facture_fourn_det_extrafields`
--
ALTER TABLE `erp_facture_fourn_det_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_facture_fourn_extrafields`
--
ALTER TABLE `erp_facture_fourn_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_facture_rec`
--
ALTER TABLE `erp_facture_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_facture_rec_extrafields`
--
ALTER TABLE `erp_facture_rec_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_fichinter`
--
ALTER TABLE `erp_fichinter`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `erp_fichinterdet`
--
ALTER TABLE `erp_fichinterdet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_fichinterdet_extrafields`
--
ALTER TABLE `erp_fichinterdet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_fichinterdet_rec`
--
ALTER TABLE `erp_fichinterdet_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_fichinter_extrafields`
--
ALTER TABLE `erp_fichinter_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_fichinter_rec`
--
ALTER TABLE `erp_fichinter_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_holiday`
--
ALTER TABLE `erp_holiday`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_holiday_config`
--
ALTER TABLE `erp_holiday_config`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_holiday_extrafields`
--
ALTER TABLE `erp_holiday_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_holiday_logs`
--
ALTER TABLE `erp_holiday_logs`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_evaluation`
--
ALTER TABLE `erp_hrm_evaluation`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_evaluationdet`
--
ALTER TABLE `erp_hrm_evaluationdet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_evaluationdet_extrafields`
--
ALTER TABLE `erp_hrm_evaluationdet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_evaluation_extrafields`
--
ALTER TABLE `erp_hrm_evaluation_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_job`
--
ALTER TABLE `erp_hrm_job`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_job_extrafields`
--
ALTER TABLE `erp_hrm_job_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_job_user`
--
ALTER TABLE `erp_hrm_job_user`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_job_user_extrafields`
--
ALTER TABLE `erp_hrm_job_user_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_skill`
--
ALTER TABLE `erp_hrm_skill`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_skilldet`
--
ALTER TABLE `erp_hrm_skilldet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_skilldet_extrafields`
--
ALTER TABLE `erp_hrm_skilldet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_skillrank`
--
ALTER TABLE `erp_hrm_skillrank`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_hrm_skill_extrafields`
--
ALTER TABLE `erp_hrm_skill_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_import_model`
--
ALTER TABLE `erp_import_model`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_intracommreport`
--
ALTER TABLE `erp_intracommreport`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_inventory`
--
ALTER TABLE `erp_inventory`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_inventorydet`
--
ALTER TABLE `erp_inventorydet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_knowledgemanagement_knowledgerecord`
--
ALTER TABLE `erp_knowledgemanagement_knowledgerecord`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_knowledgemanagement_knowledgerecord_extrafields`
--
ALTER TABLE `erp_knowledgemanagement_knowledgerecord_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_links`
--
ALTER TABLE `erp_links`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_loan`
--
ALTER TABLE `erp_loan`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_loan_schedule`
--
ALTER TABLE `erp_loan_schedule`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_localtax`
--
ALTER TABLE `erp_localtax`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_mailing`
--
ALTER TABLE `erp_mailing`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_mailing_cibles`
--
ALTER TABLE `erp_mailing_cibles`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_mailing_unsubscribe`
--
ALTER TABLE `erp_mailing_unsubscribe`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_menu`
--
ALTER TABLE `erp_menu`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21891;

--
-- AUTO_INCREMENT for table `erp_mrp_mo`
--
ALTER TABLE `erp_mrp_mo`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `erp_mrp_mo_extrafields`
--
ALTER TABLE `erp_mrp_mo_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_mrp_production`
--
ALTER TABLE `erp_mrp_production`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `erp_multicurrency`
--
ALTER TABLE `erp_multicurrency`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_multicurrency_rate`
--
ALTER TABLE `erp_multicurrency_rate`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_notify`
--
ALTER TABLE `erp_notify`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_notify_def`
--
ALTER TABLE `erp_notify_def`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_notify_def_object`
--
ALTER TABLE `erp_notify_def_object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_oauth_state`
--
ALTER TABLE `erp_oauth_state`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_oauth_token`
--
ALTER TABLE `erp_oauth_token`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_object_lang`
--
ALTER TABLE `erp_object_lang`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_onlinesignature`
--
ALTER TABLE `erp_onlinesignature`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_opensurvey_comments`
--
ALTER TABLE `erp_opensurvey_comments`
  MODIFY `id_comment` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_opensurvey_formquestions`
--
ALTER TABLE `erp_opensurvey_formquestions`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_opensurvey_user_studs`
--
ALTER TABLE `erp_opensurvey_user_studs`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_overwrite_trans`
--
ALTER TABLE `erp_overwrite_trans`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `erp_paiement`
--
ALTER TABLE `erp_paiement`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `erp_paiementcharge`
--
ALTER TABLE `erp_paiementcharge`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_paiementfourn`
--
ALTER TABLE `erp_paiementfourn`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_paiementfourn_facturefourn`
--
ALTER TABLE `erp_paiementfourn_facturefourn`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_paiement_facture`
--
ALTER TABLE `erp_paiement_facture`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `erp_partnership`
--
ALTER TABLE `erp_partnership`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_partnership_extrafields`
--
ALTER TABLE `erp_partnership_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_payment_donation`
--
ALTER TABLE `erp_payment_donation`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_payment_expensereport`
--
ALTER TABLE `erp_payment_expensereport`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_payment_loan`
--
ALTER TABLE `erp_payment_loan`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_payment_salary`
--
ALTER TABLE `erp_payment_salary`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_payment_various`
--
ALTER TABLE `erp_payment_various`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_payment_vat`
--
ALTER TABLE `erp_payment_vat`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_pos_cash_fence`
--
ALTER TABLE `erp_pos_cash_fence`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_prelevement_bons`
--
ALTER TABLE `erp_prelevement_bons`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_prelevement_facture`
--
ALTER TABLE `erp_prelevement_facture`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_prelevement_facture_demande`
--
ALTER TABLE `erp_prelevement_facture_demande`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_prelevement_lignes`
--
ALTER TABLE `erp_prelevement_lignes`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_prelevement_rejet`
--
ALTER TABLE `erp_prelevement_rejet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_printing`
--
ALTER TABLE `erp_printing`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product`
--
ALTER TABLE `erp_product`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `erp_product_association`
--
ALTER TABLE `erp_product_association`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_attribute`
--
ALTER TABLE `erp_product_attribute`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_product_attribute_combination`
--
ALTER TABLE `erp_product_attribute_combination`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_product_attribute_combination2val`
--
ALTER TABLE `erp_product_attribute_combination2val`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_product_attribute_combination_price_level`
--
ALTER TABLE `erp_product_attribute_combination_price_level`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_attribute_value`
--
ALTER TABLE `erp_product_attribute_value`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `erp_product_batch`
--
ALTER TABLE `erp_product_batch`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `erp_product_customer_price`
--
ALTER TABLE `erp_product_customer_price`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_customer_price_log`
--
ALTER TABLE `erp_product_customer_price_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_extrafields`
--
ALTER TABLE `erp_product_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_fournisseur_price`
--
ALTER TABLE `erp_product_fournisseur_price`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `erp_product_fournisseur_price_extrafields`
--
ALTER TABLE `erp_product_fournisseur_price_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_fournisseur_price_log`
--
ALTER TABLE `erp_product_fournisseur_price_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `erp_product_lang`
--
ALTER TABLE `erp_product_lang`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_lot`
--
ALTER TABLE `erp_product_lot`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `erp_product_lot_extrafields`
--
ALTER TABLE `erp_product_lot_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_perentity`
--
ALTER TABLE `erp_product_perentity`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_price`
--
ALTER TABLE `erp_product_price`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `erp_product_pricerules`
--
ALTER TABLE `erp_product_pricerules`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_price_by_qty`
--
ALTER TABLE `erp_product_price_by_qty`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_product_stock`
--
ALTER TABLE `erp_product_stock`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `erp_product_warehouse_properties`
--
ALTER TABLE `erp_product_warehouse_properties`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_projet`
--
ALTER TABLE `erp_projet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `erp_projet_extrafields`
--
ALTER TABLE `erp_projet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_projet_task`
--
ALTER TABLE `erp_projet_task`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_projet_task_extrafields`
--
ALTER TABLE `erp_projet_task_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_projet_task_time`
--
ALTER TABLE `erp_projet_task_time`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_propal`
--
ALTER TABLE `erp_propal`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_propaldet`
--
ALTER TABLE `erp_propaldet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_propaldet_extrafields`
--
ALTER TABLE `erp_propaldet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_propal_extrafields`
--
ALTER TABLE `erp_propal_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_propal_merge_pdf_product`
--
ALTER TABLE `erp_propal_merge_pdf_product`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_reception`
--
ALTER TABLE `erp_reception`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_reception_extrafields`
--
ALTER TABLE `erp_reception_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_recruitment_recruitmentcandidature`
--
ALTER TABLE `erp_recruitment_recruitmentcandidature`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_recruitment_recruitmentcandidature_extrafields`
--
ALTER TABLE `erp_recruitment_recruitmentcandidature_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_recruitment_recruitmentjobposition`
--
ALTER TABLE `erp_recruitment_recruitmentjobposition`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_recruitment_recruitmentjobposition_extrafields`
--
ALTER TABLE `erp_recruitment_recruitmentjobposition_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_resource`
--
ALTER TABLE `erp_resource`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_resource_extrafields`
--
ALTER TABLE `erp_resource_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_salary`
--
ALTER TABLE `erp_salary`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_salary_extrafields`
--
ALTER TABLE `erp_salary_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_societe`
--
ALTER TABLE `erp_societe`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `erp_societe_account`
--
ALTER TABLE `erp_societe_account`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_societe_address`
--
ALTER TABLE `erp_societe_address`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_societe_commerciaux`
--
ALTER TABLE `erp_societe_commerciaux`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_societe_contacts`
--
ALTER TABLE `erp_societe_contacts`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_societe_extrafields`
--
ALTER TABLE `erp_societe_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_societe_perentity`
--
ALTER TABLE `erp_societe_perentity`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_societe_prices`
--
ALTER TABLE `erp_societe_prices`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_societe_remise`
--
ALTER TABLE `erp_societe_remise`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_societe_remise_except`
--
ALTER TABLE `erp_societe_remise_except`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_societe_remise_supplier`
--
ALTER TABLE `erp_societe_remise_supplier`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_societe_rib`
--
ALTER TABLE `erp_societe_rib`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_socpeople`
--
ALTER TABLE `erp_socpeople`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `erp_socpeople_extrafields`
--
ALTER TABLE `erp_socpeople_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_stock_mouvement`
--
ALTER TABLE `erp_stock_mouvement`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `erp_subscription`
--
ALTER TABLE `erp_subscription`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_supplier_proposal`
--
ALTER TABLE `erp_supplier_proposal`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_supplier_proposaldet`
--
ALTER TABLE `erp_supplier_proposaldet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_supplier_proposaldet_extrafields`
--
ALTER TABLE `erp_supplier_proposaldet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_supplier_proposal_extrafields`
--
ALTER TABLE `erp_supplier_proposal_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_takepos_floor_tables`
--
ALTER TABLE `erp_takepos_floor_tables`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `erp_ticket`
--
ALTER TABLE `erp_ticket`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_ticket_extrafields`
--
ALTER TABLE `erp_ticket_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_tva`
--
ALTER TABLE `erp_tva`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_user`
--
ALTER TABLE `erp_user`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `erp_usergroup`
--
ALTER TABLE `erp_usergroup`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_usergroup_extrafields`
--
ALTER TABLE `erp_usergroup_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_usergroup_rights`
--
ALTER TABLE `erp_usergroup_rights`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_usergroup_user`
--
ALTER TABLE `erp_usergroup_user`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_user_alert`
--
ALTER TABLE `erp_user_alert`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_user_employment`
--
ALTER TABLE `erp_user_employment`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_user_extrafields`
--
ALTER TABLE `erp_user_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_user_rib`
--
ALTER TABLE `erp_user_rib`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_user_rights`
--
ALTER TABLE `erp_user_rights`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=627;

--
-- AUTO_INCREMENT for table `erp_website`
--
ALTER TABLE `erp_website`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_website_extrafields`
--
ALTER TABLE `erp_website_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_website_page`
--
ALTER TABLE `erp_website_page`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_workstation_workstation`
--
ALTER TABLE `erp_workstation_workstation`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_workstation_workstation_resource`
--
ALTER TABLE `erp_workstation_workstation_resource`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_workstation_workstation_usergroup`
--
ALTER TABLE `erp_workstation_workstation_usergroup`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_zapier_hook`
--
ALTER TABLE `erp_zapier_hook`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `erp_accounting_account`
--
ALTER TABLE `erp_accounting_account`
  ADD CONSTRAINT `fk_accounting_account_fk_pcg_version` FOREIGN KEY (`fk_pcg_version`) REFERENCES `erp_accounting_system` (`pcg_version`);

--
-- Constraints for table `erp_adherent`
--
ALTER TABLE `erp_adherent`
  ADD CONSTRAINT `adherent_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_adherent_adherent_type` FOREIGN KEY (`fk_adherent_type`) REFERENCES `erp_adherent_type` (`rowid`);

--
-- Constraints for table `erp_asset`
--
ALTER TABLE `erp_asset`
  ADD CONSTRAINT `fk_asset_asset_type` FOREIGN KEY (`fk_asset_type`) REFERENCES `erp_asset_type` (`rowid`);

--
-- Constraints for table `erp_bank_account`
--
ALTER TABLE `erp_bank_account`
  ADD CONSTRAINT `fk_bank_account_accountancy_journal` FOREIGN KEY (`fk_accountancy_journal`) REFERENCES `erp_accounting_journal` (`rowid`);

--
-- Constraints for table `erp_bom_bom`
--
ALTER TABLE `erp_bom_bom`
  ADD CONSTRAINT `erp_bom_bom_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_bom_bomline`
--
ALTER TABLE `erp_bom_bomline`
  ADD CONSTRAINT `erp_bom_bomline_fk_bom` FOREIGN KEY (`fk_bom`) REFERENCES `erp_bom_bom` (`rowid`);

--
-- Constraints for table `erp_boxes`
--
ALTER TABLE `erp_boxes`
  ADD CONSTRAINT `fk_boxes_box_id` FOREIGN KEY (`box_id`) REFERENCES `erp_boxes_def` (`rowid`);

--
-- Constraints for table `erp_budget_lines`
--
ALTER TABLE `erp_budget_lines`
  ADD CONSTRAINT `fk_budget_lines_budget` FOREIGN KEY (`fk_budget`) REFERENCES `erp_budget` (`rowid`);

--
-- Constraints for table `erp_categorie_account`
--
ALTER TABLE `erp_categorie_account`
  ADD CONSTRAINT `fk_categorie_account_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_account_fk_account` FOREIGN KEY (`fk_account`) REFERENCES `erp_bank_account` (`rowid`);

--
-- Constraints for table `erp_categorie_actioncomm`
--
ALTER TABLE `erp_categorie_actioncomm`
  ADD CONSTRAINT `fk_categorie_actioncomm_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_actioncomm_fk_actioncomm` FOREIGN KEY (`fk_actioncomm`) REFERENCES `erp_actioncomm` (`id`);

--
-- Constraints for table `erp_categorie_contact`
--
ALTER TABLE `erp_categorie_contact`
  ADD CONSTRAINT `fk_categorie_contact_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_contact_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `erp_socpeople` (`rowid`);

--
-- Constraints for table `erp_categorie_fournisseur`
--
ALTER TABLE `erp_categorie_fournisseur`
  ADD CONSTRAINT `fk_categorie_fournisseur_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`);

--
-- Constraints for table `erp_categorie_knowledgemanagement`
--
ALTER TABLE `erp_categorie_knowledgemanagement`
  ADD CONSTRAINT `fk_categorie_knowledgemanagement_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`);

--
-- Constraints for table `erp_categorie_lang`
--
ALTER TABLE `erp_categorie_lang`
  ADD CONSTRAINT `fk_category_lang_fk_category` FOREIGN KEY (`fk_category`) REFERENCES `erp_categorie` (`rowid`);

--
-- Constraints for table `erp_categorie_member`
--
ALTER TABLE `erp_categorie_member`
  ADD CONSTRAINT `fk_categorie_member_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_member_member_rowid` FOREIGN KEY (`fk_member`) REFERENCES `erp_adherent` (`rowid`);

--
-- Constraints for table `erp_categorie_product`
--
ALTER TABLE `erp_categorie_product`
  ADD CONSTRAINT `fk_categorie_product_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `erp_product` (`rowid`);

--
-- Constraints for table `erp_categorie_project`
--
ALTER TABLE `erp_categorie_project`
  ADD CONSTRAINT `fk_categorie_project_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_project_fk_project_rowid` FOREIGN KEY (`fk_project`) REFERENCES `erp_projet` (`rowid`);

--
-- Constraints for table `erp_categorie_societe`
--
ALTER TABLE `erp_categorie_societe`
  ADD CONSTRAINT `fk_categorie_societe_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_societe_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`);

--
-- Constraints for table `erp_categorie_ticket`
--
ALTER TABLE `erp_categorie_ticket`
  ADD CONSTRAINT `fk_categorie_ticket_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_ticket_ticket_rowid` FOREIGN KEY (`fk_ticket`) REFERENCES `erp_ticket` (`rowid`);

--
-- Constraints for table `erp_categorie_user`
--
ALTER TABLE `erp_categorie_user`
  ADD CONSTRAINT `fk_categorie_user_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_categorie_warehouse`
--
ALTER TABLE `erp_categorie_warehouse`
  ADD CONSTRAINT `fk_categorie_warehouse_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_warehouse_fk_warehouse_rowid` FOREIGN KEY (`fk_warehouse`) REFERENCES `erp_entrepot` (`rowid`);

--
-- Constraints for table `erp_categorie_website_page`
--
ALTER TABLE `erp_categorie_website_page`
  ADD CONSTRAINT `fk_categorie_websitepage_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_websitepage_website_page_rowid` FOREIGN KEY (`fk_website_page`) REFERENCES `erp_website_page` (`rowid`);

--
-- Constraints for table `erp_commande`
--
ALTER TABLE `erp_commande`
  ADD CONSTRAINT `fk_commande_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `erp_projet` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_commandedet`
--
ALTER TABLE `erp_commandedet`
  ADD CONSTRAINT `fk_commandedet_fk_commande` FOREIGN KEY (`fk_commande`) REFERENCES `erp_commande` (`rowid`),
  ADD CONSTRAINT `fk_commandedet_fk_commandefourndet` FOREIGN KEY (`fk_commandefourndet`) REFERENCES `erp_commande_fournisseurdet` (`rowid`),
  ADD CONSTRAINT `fk_commandedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `erp_c_units` (`rowid`);

--
-- Constraints for table `erp_commande_fournisseur`
--
ALTER TABLE `erp_commande_fournisseur`
  ADD CONSTRAINT `fk_commande_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`);

--
-- Constraints for table `erp_commande_fournisseurdet`
--
ALTER TABLE `erp_commande_fournisseurdet`
  ADD CONSTRAINT `fk_commande_fournisseurdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `erp_c_units` (`rowid`);

--
-- Constraints for table `erp_commande_fournisseur_dispatch`
--
ALTER TABLE `erp_commande_fournisseur_dispatch`
  ADD CONSTRAINT `fk_commande_fournisseur_dispatch_fk_reception` FOREIGN KEY (`fk_reception`) REFERENCES `erp_reception` (`rowid`);

--
-- Constraints for table `erp_contrat`
--
ALTER TABLE `erp_contrat`
  ADD CONSTRAINT `fk_contrat_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_contrat_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_contratdet`
--
ALTER TABLE `erp_contratdet`
  ADD CONSTRAINT `fk_contratdet_fk_contrat` FOREIGN KEY (`fk_contrat`) REFERENCES `erp_contrat` (`rowid`),
  ADD CONSTRAINT `fk_contratdet_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `erp_product` (`rowid`),
  ADD CONSTRAINT `fk_contratdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `erp_c_units` (`rowid`);

--
-- Constraints for table `erp_contratdet_log`
--
ALTER TABLE `erp_contratdet_log`
  ADD CONSTRAINT `fk_contratdet_log_fk_contratdet` FOREIGN KEY (`fk_contratdet`) REFERENCES `erp_contratdet` (`rowid`);

--
-- Constraints for table `erp_c_departements`
--
ALTER TABLE `erp_c_departements`
  ADD CONSTRAINT `fk_departements_fk_region` FOREIGN KEY (`fk_region`) REFERENCES `erp_c_regions` (`code_region`);

--
-- Constraints for table `erp_c_regions`
--
ALTER TABLE `erp_c_regions`
  ADD CONSTRAINT `fk_c_regions_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `erp_c_country` (`rowid`);

--
-- Constraints for table `erp_c_ziptown`
--
ALTER TABLE `erp_c_ziptown`
  ADD CONSTRAINT `fk_c_ziptown_fk_county` FOREIGN KEY (`fk_county`) REFERENCES `erp_c_departements` (`rowid`),
  ADD CONSTRAINT `fk_c_ziptown_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `erp_c_country` (`rowid`);

--
-- Constraints for table `erp_delivery`
--
ALTER TABLE `erp_delivery`
  ADD CONSTRAINT `fk_delivery_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_delivery_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_delivery_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_deliverydet`
--
ALTER TABLE `erp_deliverydet`
  ADD CONSTRAINT `fk_deliverydet_fk_delivery` FOREIGN KEY (`fk_delivery`) REFERENCES `erp_delivery` (`rowid`);

--
-- Constraints for table `erp_ecm_directories`
--
ALTER TABLE `erp_ecm_directories`
  ADD CONSTRAINT `fk_ecm_directories_fk_user_c` FOREIGN KEY (`fk_user_c`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_ecm_directories_fk_user_m` FOREIGN KEY (`fk_user_m`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_element_contact`
--
ALTER TABLE `erp_element_contact`
  ADD CONSTRAINT `fk_element_contact_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `erp_c_type_contact` (`rowid`);

--
-- Constraints for table `erp_element_tag`
--
ALTER TABLE `erp_element_tag`
  ADD CONSTRAINT `fk_element_tag_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `erp_categorie` (`rowid`);

--
-- Constraints for table `erp_emailcollector_emailcollectoraction`
--
ALTER TABLE `erp_emailcollector_emailcollectoraction`
  ADD CONSTRAINT `fk_emailcollectoraction_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `erp_emailcollector_emailcollector` (`rowid`);

--
-- Constraints for table `erp_emailcollector_emailcollectorfilter`
--
ALTER TABLE `erp_emailcollector_emailcollectorfilter`
  ADD CONSTRAINT `fk_emailcollectorfilter_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `erp_emailcollector_emailcollector` (`rowid`);

--
-- Constraints for table `erp_expedition`
--
ALTER TABLE `erp_expedition`
  ADD CONSTRAINT `fk_expedition_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `erp_c_shipment_mode` (`rowid`),
  ADD CONSTRAINT `fk_expedition_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_expedition_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_expedition_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_expeditiondet`
--
ALTER TABLE `erp_expeditiondet`
  ADD CONSTRAINT `fk_expeditiondet_fk_expedition` FOREIGN KEY (`fk_expedition`) REFERENCES `erp_expedition` (`rowid`);

--
-- Constraints for table `erp_expeditiondet_batch`
--
ALTER TABLE `erp_expeditiondet_batch`
  ADD CONSTRAINT `fk_expeditiondet_batch_fk_expeditiondet` FOREIGN KEY (`fk_expeditiondet`) REFERENCES `erp_expeditiondet` (`rowid`);

--
-- Constraints for table `erp_facture`
--
ALTER TABLE `erp_facture`
  ADD CONSTRAINT `fk_facture_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `erp_facture` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `erp_projet` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_facturedet`
--
ALTER TABLE `erp_facturedet`
  ADD CONSTRAINT `fk_facturedet_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `erp_facture` (`rowid`),
  ADD CONSTRAINT `fk_facturedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `erp_c_units` (`rowid`);

--
-- Constraints for table `erp_facturedet_rec`
--
ALTER TABLE `erp_facturedet_rec`
  ADD CONSTRAINT `fk_facturedet_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `erp_c_units` (`rowid`);

--
-- Constraints for table `erp_facture_fourn`
--
ALTER TABLE `erp_facture_fourn`
  ADD CONSTRAINT `fk_facture_fourn_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `erp_projet` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_facture_fourn_det`
--
ALTER TABLE `erp_facture_fourn_det`
  ADD CONSTRAINT `fk_facture_fourn_det_fk_facture` FOREIGN KEY (`fk_facture_fourn`) REFERENCES `erp_facture_fourn` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_det_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `erp_c_units` (`rowid`);

--
-- Constraints for table `erp_facture_rec`
--
ALTER TABLE `erp_facture_rec`
  ADD CONSTRAINT `fk_facture_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `erp_projet` (`rowid`),
  ADD CONSTRAINT `fk_facture_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_facture_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_fichinter`
--
ALTER TABLE `erp_fichinter`
  ADD CONSTRAINT `fk_fichinter_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`);

--
-- Constraints for table `erp_fichinterdet`
--
ALTER TABLE `erp_fichinterdet`
  ADD CONSTRAINT `fk_fichinterdet_fk_fichinter` FOREIGN KEY (`fk_fichinter`) REFERENCES `erp_fichinter` (`rowid`);

--
-- Constraints for table `erp_fichinter_rec`
--
ALTER TABLE `erp_fichinter_rec`
  ADD CONSTRAINT `fk_fichinter_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `erp_projet` (`rowid`),
  ADD CONSTRAINT `fk_fichinter_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_hrm_evaluation`
--
ALTER TABLE `erp_hrm_evaluation`
  ADD CONSTRAINT `erp_hrm_evaluation_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_hrm_evaluationdet`
--
ALTER TABLE `erp_hrm_evaluationdet`
  ADD CONSTRAINT `erp_hrm_evaluationdet_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_hrm_skill`
--
ALTER TABLE `erp_hrm_skill`
  ADD CONSTRAINT `erp_hrm_skill_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_hrm_skilldet`
--
ALTER TABLE `erp_hrm_skilldet`
  ADD CONSTRAINT `erp_hrm_skilldet_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_hrm_skillrank`
--
ALTER TABLE `erp_hrm_skillrank`
  ADD CONSTRAINT `erp_hrm_skillrank_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_knowledgemanagement_knowledgerecord`
--
ALTER TABLE `erp_knowledgemanagement_knowledgerecord`
  ADD CONSTRAINT `erp_knowledgemanagement_knowledgerecord_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_mrp_mo`
--
ALTER TABLE `erp_mrp_mo`
  ADD CONSTRAINT `fk_mrp_mo_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_mrp_production`
--
ALTER TABLE `erp_mrp_production`
  ADD CONSTRAINT `fk_mrp_production_mo` FOREIGN KEY (`fk_mo`) REFERENCES `erp_mrp_mo` (`rowid`),
  ADD CONSTRAINT `fk_mrp_production_product` FOREIGN KEY (`fk_product`) REFERENCES `erp_product` (`rowid`),
  ADD CONSTRAINT `fk_mrp_production_stock_movement` FOREIGN KEY (`fk_stock_movement`) REFERENCES `erp_stock_mouvement` (`rowid`);

--
-- Constraints for table `erp_paiement_facture`
--
ALTER TABLE `erp_paiement_facture`
  ADD CONSTRAINT `fk_paiement_facture_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `erp_facture` (`rowid`),
  ADD CONSTRAINT `fk_paiement_facture_fk_paiement` FOREIGN KEY (`fk_paiement`) REFERENCES `erp_paiement` (`rowid`);

--
-- Constraints for table `erp_payment_salary`
--
ALTER TABLE `erp_payment_salary`
  ADD CONSTRAINT `fk_payment_salary_user` FOREIGN KEY (`fk_user`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_prelevement_facture`
--
ALTER TABLE `erp_prelevement_facture`
  ADD CONSTRAINT `fk_prelevement_facture_fk_prelevement_lignes` FOREIGN KEY (`fk_prelevement_lignes`) REFERENCES `erp_prelevement_lignes` (`rowid`);

--
-- Constraints for table `erp_prelevement_lignes`
--
ALTER TABLE `erp_prelevement_lignes`
  ADD CONSTRAINT `fk_prelevement_lignes_fk_prelevement_bons` FOREIGN KEY (`fk_prelevement_bons`) REFERENCES `erp_prelevement_bons` (`rowid`);

--
-- Constraints for table `erp_product`
--
ALTER TABLE `erp_product`
  ADD CONSTRAINT `fk_product_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `erp_c_barcode_type` (`rowid`),
  ADD CONSTRAINT `fk_product_default_warehouse` FOREIGN KEY (`fk_default_warehouse`) REFERENCES `erp_entrepot` (`rowid`),
  ADD CONSTRAINT `fk_product_finished` FOREIGN KEY (`finished`) REFERENCES `erp_c_product_nature` (`code`),
  ADD CONSTRAINT `fk_product_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `erp_c_country` (`rowid`),
  ADD CONSTRAINT `fk_product_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `erp_c_units` (`rowid`);

--
-- Constraints for table `erp_product_batch`
--
ALTER TABLE `erp_product_batch`
  ADD CONSTRAINT `fk_product_batch_fk_product_stock` FOREIGN KEY (`fk_product_stock`) REFERENCES `erp_product_stock` (`rowid`);

--
-- Constraints for table `erp_product_customer_price`
--
ALTER TABLE `erp_product_customer_price`
  ADD CONSTRAINT `fk_product_customer_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `erp_product` (`rowid`),
  ADD CONSTRAINT `fk_product_customer_price_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_product_customer_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_product_fournisseur_price`
--
ALTER TABLE `erp_product_fournisseur_price`
  ADD CONSTRAINT `fk_product_fournisseur_price_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `erp_c_barcode_type` (`rowid`),
  ADD CONSTRAINT `fk_product_fournisseur_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `erp_product` (`rowid`),
  ADD CONSTRAINT `fk_product_fournisseur_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_product_lang`
--
ALTER TABLE `erp_product_lang`
  ADD CONSTRAINT `fk_product_lang_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `erp_product` (`rowid`);

--
-- Constraints for table `erp_product_price`
--
ALTER TABLE `erp_product_price`
  ADD CONSTRAINT `fk_product_price_product` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_product_price_user_author` FOREIGN KEY (`fk_product`) REFERENCES `erp_product` (`rowid`);

--
-- Constraints for table `erp_product_price_by_qty`
--
ALTER TABLE `erp_product_price_by_qty`
  ADD CONSTRAINT `fk_product_price_by_qty_fk_product_price` FOREIGN KEY (`fk_product_price`) REFERENCES `erp_product_price` (`rowid`);

--
-- Constraints for table `erp_projet`
--
ALTER TABLE `erp_projet`
  ADD CONSTRAINT `fk_projet_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`);

--
-- Constraints for table `erp_projet_task`
--
ALTER TABLE `erp_projet_task`
  ADD CONSTRAINT `fk_projet_task_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `erp_projet` (`rowid`),
  ADD CONSTRAINT `fk_projet_task_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_projet_task_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_propal`
--
ALTER TABLE `erp_propal`
  ADD CONSTRAINT `fk_propal_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `erp_projet` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_signature` FOREIGN KEY (`fk_user_signature`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_propaldet`
--
ALTER TABLE `erp_propaldet`
  ADD CONSTRAINT `fk_propaldet_fk_propal` FOREIGN KEY (`fk_propal`) REFERENCES `erp_propal` (`rowid`),
  ADD CONSTRAINT `fk_propaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `erp_c_units` (`rowid`);

--
-- Constraints for table `erp_reception`
--
ALTER TABLE `erp_reception`
  ADD CONSTRAINT `fk_reception_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `erp_c_shipment_mode` (`rowid`),
  ADD CONSTRAINT `fk_reception_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_reception_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_reception_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_recruitment_recruitmentcandidature`
--
ALTER TABLE `erp_recruitment_recruitmentcandidature`
  ADD CONSTRAINT `erp_recruitment_recruitmentcandidature_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_recruitment_recruitmentjobposition`
--
ALTER TABLE `erp_recruitment_recruitmentjobposition`
  ADD CONSTRAINT `erp_recruitment_recruitmentjobposition_fk_establishment` FOREIGN KEY (`fk_establishment`) REFERENCES `erp_establishment` (`rowid`),
  ADD CONSTRAINT `erp_recruitment_recruitmentjobposition_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `erp_recruitment_recruitmentjobposition_fk_user_recruiter` FOREIGN KEY (`fk_user_recruiter`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `erp_recruitment_recruitmentjobposition_fk_user_supervisor` FOREIGN KEY (`fk_user_supervisor`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_resource`
--
ALTER TABLE `erp_resource`
  ADD CONSTRAINT `fk_resource_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `erp_c_country` (`rowid`);

--
-- Constraints for table `erp_societe_account`
--
ALTER TABLE `erp_societe_account`
  ADD CONSTRAINT `erp_societe_account_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `erp_societe_account_fk_website` FOREIGN KEY (`fk_website`) REFERENCES `erp_website` (`rowid`);

--
-- Constraints for table `erp_societe_contacts`
--
ALTER TABLE `erp_societe_contacts`
  ADD CONSTRAINT `fk_societe_contacts_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `erp_c_type_contact` (`rowid`),
  ADD CONSTRAINT `fk_societe_contacts_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_societe_contacts_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `erp_socpeople` (`rowid`);

--
-- Constraints for table `erp_societe_remise_except`
--
ALTER TABLE `erp_societe_remise_except`
  ADD CONSTRAINT `fk_soc_remise_fk_facture_line` FOREIGN KEY (`fk_facture_line`) REFERENCES `erp_facturedet` (`rowid`),
  ADD CONSTRAINT `fk_soc_remise_fk_invoice_supplier_line` FOREIGN KEY (`fk_invoice_supplier_line`) REFERENCES `erp_facture_fourn_det` (`rowid`),
  ADD CONSTRAINT `fk_soc_remise_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `erp_facture` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `erp_facture` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_invoice_supplier` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `erp_facture_fourn` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_invoice_supplier_source` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `erp_facture_fourn` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_societe_rib`
--
ALTER TABLE `erp_societe_rib`
  ADD CONSTRAINT `erp_societe_rib_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`);

--
-- Constraints for table `erp_socpeople`
--
ALTER TABLE `erp_socpeople`
  ADD CONSTRAINT `fk_socpeople_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `erp_societe` (`rowid`),
  ADD CONSTRAINT `fk_socpeople_user_creat_user_rowid` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_supplier_proposaldet`
--
ALTER TABLE `erp_supplier_proposaldet`
  ADD CONSTRAINT `fk_supplier_proposaldet_fk_supplier_proposal` FOREIGN KEY (`fk_supplier_proposal`) REFERENCES `erp_supplier_proposal` (`rowid`),
  ADD CONSTRAINT `fk_supplier_proposaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `erp_c_units` (`rowid`);

--
-- Constraints for table `erp_usergroup_rights`
--
ALTER TABLE `erp_usergroup_rights`
  ADD CONSTRAINT `fk_usergroup_rights_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `erp_usergroup` (`rowid`);

--
-- Constraints for table `erp_usergroup_user`
--
ALTER TABLE `erp_usergroup_user`
  ADD CONSTRAINT `fk_usergroup_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `erp_user` (`rowid`),
  ADD CONSTRAINT `fk_usergroup_user_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `erp_usergroup` (`rowid`);

--
-- Constraints for table `erp_user_employment`
--
ALTER TABLE `erp_user_employment`
  ADD CONSTRAINT `fk_user_employment_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_user_rights`
--
ALTER TABLE `erp_user_rights`
  ADD CONSTRAINT `fk_user_rights_fk_user_user` FOREIGN KEY (`fk_user`) REFERENCES `erp_user` (`rowid`);

--
-- Constraints for table `erp_website_page`
--
ALTER TABLE `erp_website_page`
  ADD CONSTRAINT `fk_website_page_website` FOREIGN KEY (`fk_website`) REFERENCES `erp_website` (`rowid`);

--
-- Constraints for table `erp_workstation_workstation`
--
ALTER TABLE `erp_workstation_workstation`
  ADD CONSTRAINT `fk_workstation_workstation_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `erp_user` (`rowid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

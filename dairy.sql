-- phpMyAdmin SQL Dump
-- version 4.5.1
-- 
http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2016 at 08:16 PM
-- Server version: 10.1.9-MariaDB
-- 
PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */
;




CREATE TABLE `delivery`
 (
  `id` int(11) NOT NULL,

  `r_f_no` varchar(50) NOT NULL,

 `r_kg` float NOT NULL,
 
 `r_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

  `r_received_by` varchar(50) NOT NULL,
 
 `r_deliverer` varchar(50) DEFAULT NULL
) 
ENGINE=InnoDB DEFAULT CHARSET=latin1;





CREATE TABLE `employees` 
(
  `id` int(11) NOT NULL,
 
 `e_name` varchar(50) NOT NULL,
 
 `e_mail` varchar(50) DEFAULT NULL,

  `username` varchar(50) NOT NULL,
 
 `e_pass` varchar(50) NOT NULL,
  
`e_role` varchar(50) DEFAULT NULL,
 
 `e_payroll_no` varchar(50) NOT NULL
) 
ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--
 Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `e_name`, `e_mail`, `username`, `e_pass`, `e_role`, `e_payroll_no`) 
VALUES
(3, 'Catherine Muendi', 'cnmuend@yahoo.com', '', '827ccb0eea8a706c4c34a16891f84e7b', 'Manager', '3456'),

(7, 'Awesome Supervisor', 'supervisor@example.com', '', '1425d5d3160aa6bd140605cc75e63ce0', 'Supervisor', '6'),

(8, 'Clerk Kent', 'clerk@example.com', '', 'ad4ac7fa40b0af2bae7374c57173f26c', 'Clerk', '7'),

(9, 'Overall Manager', 'manager@example.com', '', '0795151defba7a4b5dfa89170de46277', 'Manager', '1');




CREATE TABLE `farmers`
 (
  `f_no` varchar(50) NOT NULL,
 
 `f_id` text NOT NULL,
 
 `f_name` varchar(50) NOT NULL,
 
 `f_locallity` varchar(50) DEFAULT NULL,

  `f_ac` varchar(50) DEFAULT NULL,
  
`last_paid` date DEFAULT NULL,
 
 `f_phone` varchar(20) DEFAULT NULL
) 
ENGINE=InnoDB DEFAULT CHARSET=latin1;
 



CREATE TABLE `payment` 
(
  `id` int(11) NOT NULL,
  
`p_to` varchar(50) NOT NULL,

  `p_date` date NOT NULL,
  
`p_ac` bigint(20) NOT NULL,

  `p_method` varchar(30) NOT NULL,
 
 `p_transaction_code` int(11) NOT NULL COMMENT 'Bank or Mpesa confirmation or receipt no',
 
 `p_transacted_by` varchar(50) NOT NULL
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;


   
CREATE TABLE `settings_rates` 
(
  `id` int(11) NOT NULL,
 
 `from` date NOT NULL,
  
`to` date NOT NULL,
 
 `rate` float NOT NULL COMMENT 'sh per kg'
) 
ENGINE=InnoDB DEFAULT CHARSET=latin1;
Indexes for dumped tables
--

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `r_f_no` (`r_f_no`),
  ADD KEY `r_received_by` (`r_received_by`);


--
-- Indexes for table `employees`
-
-
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `e_name` (`e_name`),
  ADD UNIQUE KEY `e_payroll_no_2` (`e_payroll_no`),
  
ADD KEY `e_payroll_no` (`e_payroll_no`);


--
-- Indexes for table `farmers`
--

ALTER TABLE `farmers`
  ADD PRIMARY KEY (`f_no`),
  ADD KEY `f_no` (`f_no`);

--
--
 Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_to` (`p_to`),
  ADD KEY `p_transacted_by` (`p_transacted_by`);

--
--
 Indexes for table `settings_rates`
--
ALTER TABLE `settings_rates`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

-
-
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- 
AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 
AUTO_INCREMENT for table `settings_rates`
--
ALTER TABLE `settings_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, 
AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
--
 Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`r_f_no`) REFERENCES `farmers` (`f_no`) ON DELETE CASCADE ON UPDATE CASCADE;

-
-
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`p_transacted_by`) REFERENCES `employees` (`e_payroll_no`) ON UPDATE CASCADE,
  
ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`p_to`) REFERENCES `farmers` (`f_no`) ON DELETE CASCADE ON UPDATE CASCADE;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

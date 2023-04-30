-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2023 at 07:46 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college-space`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `assignment-name` varchar(50) NOT NULL,
  `assignment-desc` varchar(50) NOT NULL,
  `teamname` varchar(50) NOT NULL,
  `duedate` datetime NOT NULL,
  `creationdate` datetime NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`assignment-name`, `assignment-desc`, `teamname`, `duedate`, `creationdate`, `id`) VALUES
('Tutoiral 1', 'SEM IV tut 1', 'MPR', '2022-04-30 00:45:00', '2022-04-29 20:45:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `assignment-upload`
--

CREATE TABLE `assignment-upload` (
  `id` int(11) NOT NULL,
  `teamname` varchar(20) NOT NULL,
  `assign-name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `teamname` varchar(50) NOT NULL,
  `test` varchar(50) NOT NULL,
  `marks` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `student` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `teamname`, `test`, `marks`, `subject`, `student`) VALUES
(1, 'Computer C1', 'PT1', 12, 'DBMS', 'rashid@gmail.com'),
(2, 'Computer C1', 'PT1', 16, 'DBMS', 'rehan@gmail.com'),
(3, 'Computer C1', 'PT1', 18, 'DBMS', 'yasin@gmail.com'),
(4, 'Computer C1', 'PT1', 20, 'DBMS', 'amit@gmail.com'),
(5, 'Computer C1', 'PT1', 20, 'DBMS', 'akhil@gmail.com'),
(6, 'Computer C1', 'PT1', 16, 'DBMS', 'komalika@gmail.com'),
(7, 'Computer C1', 'PT1', 15, 'DBMS', 'prem@gmail.com'),
(8, 'Computer C1', 'PT1', 12, 'DBMS', 'daksha@gmail.com'),
(9, 'Computer C1', 'AS2', 78, 'OS', 'rashid@gmail.com'),
(10, 'Computer C1', 'AS2', 65, 'OS', 'rehan@gmail.com'),
(11, 'Computer C1', 'AS2', 35, 'OS', 'yasin@gmail.com'),
(12, 'Computer C1', 'AS2', 56, 'OS', 'amit@gmail.com'),
(13, 'Computer C1', 'AS2', 65, 'OS', 'akhil@gmail.com'),
(14, 'Computer C1', 'AS2', 45, 'OS', 'komalika@gmail.com'),
(15, 'Computer C1', 'AS2', 76, 'OS', 'prem@gmail.com'),
(16, 'Computer C1', 'AS2', 50, 'OS', 'daksha@gmail.com'),
(17, 'Computer C1', 'PT2', 20, 'OS', 'rashid@gmail.com'),
(18, 'Computer C1', 'PT2', 16, 'OS', 'rehan@gmail.com'),
(19, 'Computer C1', 'PT2', 18, 'OS', 'yasin@gmail.com'),
(20, 'Computer C1', 'PT2', 12, 'OS', 'amit@gmail.com'),
(21, 'Computer C1', 'PT2', 19, 'OS', 'akhil@gmail.com'),
(22, 'Computer C1', 'PT2', 20, 'OS', 'komalika@gmail.com'),
(23, 'Computer C1', 'PT2', 18, 'OS', 'prem@gmail.com'),
(24, 'Computer C1', 'PT2', 12, 'OS', 'daksha@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `teamname` varchar(50) NOT NULL,
  `uqid` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(50) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`teamname`, `uqid`, `date`, `title`, `id`) VALUES
('Maths', 'd5ad743f-28b9-41f1-81b8-c1d285503d0e', '2022-04-13 20:16:00', 'Maths LPP', 1),
('Operating System', '2b2d65c6-0bda-4575-9f09-273082828289', '2022-04-30 00:39:00', 'Meet 1', 2),
('MPR', '7ad2186b-7446-4f81-8b3f-99cabc2fa3f3', '2022-04-30 20:46:00', 'Meet 1', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `teamname` varchar(50) NOT NULL,
  `fileaddress` varchar(200) NOT NULL,
  `id` int(11) NOT NULL,
  `filename` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`teamname`, `fileaddress`, `id`, `filename`) VALUES
('MPR', 'C:UserskhushDesktop\nawabcollege-spacepublicuploads/AOA JOURNAL.pdf', 1, 'AOA JOURNAL.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `msg` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `email`, `date`, `msg`) VALUES
(1, 'tasneem@gmail.com', '2022-04-29 20:48:25', 'notice from teacher side');

-- --------------------------------------------------------

--
-- Table structure for table `study_on`
--

CREATE TABLE `study_on` (
  `id` int(11) NOT NULL,
  `team_name` varchar(20) NOT NULL,
  `member` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `study_on`
--

INSERT INTO `study_on` (`id`, `team_name`, `member`) VALUES
(4, 'Computer C1', 'rashid@gmail.com'),
(5, 'Computer C1', 'rehan@gmail.com'),
(6, 'Computer C1', 'yasin@gmail.com'),
(7, 'Computer C1', 'amit@gmail.com'),
(8, 'Computer C1', 'akhil@gmail.com'),
(9, 'Computer C1', 'komalika@gmail.com'),
(10, 'Computer C1', 'prem@gmail.com'),
(11, 'Computer C1', 'daksha@gmail.com'),
(12, 'Computer C2', 'viren@gmail.com'),
(13, 'Computer C2', 'dhirit@gmail.com'),
(14, 'Computer C2', 'ishita@gmail.com'),
(15, 'Computer C2', 'tamanna@gmail.com'),
(16, 'Computer C2', 'aditya@gmail.com'),
(17, 'Computer C2', 'amaan@gmail.com'),
(18, 'Computer C2', 'rachit@gmail.com'),
(19, 'Computer C2', 'jay@gmail.com'),
(20, 'Electical E1', 'riya@gmail.com'),
(21, 'Electical E1', 'khushi@gmail.com'),
(22, 'Electical E1', 'roshan@gmail.com'),
(23, 'Electical E1', 'hiten@gmail.com'),
(24, 'Electical E1', 'leena@gmail.com'),
(25, 'Electical E1', 'mainsh@gmail.com'),
(26, 'Electical E1', 'piyus@gmail.com'),
(27, 'Electical E1', 'tanhishq@gmail.com'),
(28, 'Electical E2', 'makek@gmail.com'),
(29, 'Electical E2', 'yuvraj@gmail.com'),
(30, 'Electical E2', 'omkar@gmail.com'),
(31, 'Electical E2', 'auysh@gmail.com'),
(32, 'Electical E2', 'jas@gmail.com'),
(33, 'Electical E2', 'mohit@gmail.com'),
(34, 'Electical E2', 'hiten@gmail.com'),
(35, 'Electical E2', 'karan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `teaches_on`
--

CREATE TABLE `teaches_on` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `team_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaches_on`
--

INSERT INTO `teaches_on` (`id`, `email`, `team_name`) VALUES
(2, 'tasneem@gmail.com', 'Computer C1'),
(3, 'tasneem@gmail.com', 'Computer C2'),
(4, 'tasneem@gmail.com', 'Electical E1'),
(5, 'tasneem@gmail.com', 'Electical E2');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `team_name` varchar(20) NOT NULL,
  `team_description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `team_name`, `team_description`) VALUES
(2, 'Computer C1', ''),
(3, 'Computer C2', ''),
(4, 'Electical E1', ''),
(5, 'Electical E2', '');

-- --------------------------------------------------------

--
-- Table structure for table `userdetail`
--

CREATE TABLE `userdetail` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` text NOT NULL,
  `uname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdetail`
--

INSERT INTO `userdetail` (`id`, `email`, `password`, `status`, `uname`) VALUES
(8, 'tasneem@gmail.com', '123', 'teacher', 'Tasneem Mirza'),
(9, 'rashid@gmail.com', '123', 'student', 'Md. Rashid Aziz'),
(10, 'rehan@gmail.com', '123', 'student', 'Rehan Gandhi'),
(11, 'yasin@gmail.com', '123', 'student', 'Yasin Khan'),
(12, 'amit@gmail.com', '123', 'student', 'Amit Dubey'),
(13, 'akhil@gmail.com', '123', 'student', 'Akhil Achairya'),
(17, 'komalika@gmail.com', '123', 'student', 'Komalika Achairya'),
(18, 'prem@gmail.com', '123', 'student', 'Prem Achairya'),
(19, 'daksha@gmail.com', '123', 'student', 'Daksha Aeer'),
(20, 'viren@gmail.com', '123', 'student', 'Viren Agicha'),
(21, 'dhirit@gmail.com', '123', 'student', 'Dhirti Ahuja'),
(22, 'ishita@gmail.com', '123', 'student', 'Ishita Ahuja'),
(23, 'tamanna@gmail.com', '123', 'student', 'Tammana Ahuja'),
(24, 'aditya@gmail.com', '123', 'student', 'Aditya Rajesh'),
(25, 'amaan@gmail.com', '123', 'student', 'Amaan Ansari'),
(26, 'rachit@gmail.com', '123', 'student', 'Rachit Arora'),
(27, 'jay@gmail.com', '123', 'student', 'Jay Aslaliya'),
(28, 'riya@gmail.com', '123', 'student', 'Riya Bajaj'),
(29, 'khushi@gmail.com', '123', 'student', 'Khushi Batra'),
(30, 'roshan@gmail.com', '123', 'student', 'Roshan Bagchandani'),
(31, 'hiten@gmail.com', '123', 'student', 'Hiten Bharti'),
(32, 'leena@gmail.com', '123', 'student', 'Leena Bhatia'),
(33, 'mainsh@gmail.com', '123', 'student', 'Manish Bhatia'),
(34, 'piyus@gmail.com', '123', 'student', 'Piyush Bhatia'),
(35, 'tanhishq@gmail.com', '123', 'student', 'Tanhisq Bhatia'),
(36, 'tanhishq@gmail.com', '123', 'student', 'Tanhisq Bhatia'),
(37, 'tanhishq@gmail.com', '123', 'student', 'Tanhisq Bhatia'),
(38, 'yuvraj@gmail.com', '123', 'student', 'Yuvraj Kaustubh'),
(39, 'omkar@gmail.com', '123', 'student', 'Omkar Bhosle'),
(40, 'auysh@gmail.com', '123', 'student', 'Auyush Bothra'),
(41, 'makek@gmail.com', '123', 'student', 'Mahek Budrani');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignment-upload`
--
ALTER TABLE `assignment-upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `study_on`
--
ALTER TABLE `study_on`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teaches_on`
--
ALTER TABLE `teaches_on`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userdetail`
--
ALTER TABLE `userdetail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assignment-upload`
--
ALTER TABLE `assignment-upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `study_on`
--
ALTER TABLE `study_on`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `teaches_on`
--
ALTER TABLE `teaches_on`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userdetail`
--
ALTER TABLE `userdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

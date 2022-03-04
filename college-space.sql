-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2022 at 07:35 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

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
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `msg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `email`, `date`, `msg`) VALUES
(1, 'md.r.a.n.786@gmail.c', '2022-03-03 22:23:52', 'aaaaa'),
(4, 'tr@g', '2022-03-03 23:11:36', 'hhh'),
(5, 'tr@g', '2022-03-03 23:20:51', 'hello'),
(6, 'tr@g', '2022-03-04 10:18:23', 'hello rashid');

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
(6, 'Maths', 's1@g'),
(7, 'Maths', 's2@g');

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
(2, 'tr@g', 'hulalla'),
(3, 'tr@g', 'Maths');

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
(8, 'Maths', 'lets teach maths');

-- --------------------------------------------------------

--
-- Table structure for table `userdetail`
--

CREATE TABLE `userdetail` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdetail`
--

INSERT INTO `userdetail` (`id`, `email`, `password`, `status`) VALUES
(1, 'md.r.a.n.786@gmail.com', '123', 'student'),
(2, 'tr@g', '123', 'teacher'),
(3, 's1@g', '123', 'student'),
(4, 's2@g', '123', 'student');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `study_on`
--
ALTER TABLE `study_on`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teaches_on`
--
ALTER TABLE `teaches_on`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `userdetail`
--
ALTER TABLE `userdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

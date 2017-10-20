--
-- Database: `myapp`
--

CREATE DATABASE IF NOT EXISTS `myapp`;

USE `myapp`;


--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `_id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profession` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`_id`, `username`, `password`, `profession`) VALUES
(1479131260, 'nazmul', '123', 'Software Engineer'),
(1479145349, 'saiham', '456', 'Software Engineer'),
(1479194134, 'raju', '555', 'Jr Reliability Engineer'),
(1506349843, 'Sayed', '123', 'Software Engineer');
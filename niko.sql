-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2024 at 12:34 AM
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
-- Database: `niko`
--
CREATE DATABASE IF NOT EXISTS `niko` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `niko`;

-- --------------------------------------------------------

--
-- Table structure for table `compañia`
--

CREATE TABLE `compañia` (
  `Id_Compañia` int(5) NOT NULL,
  `Actividad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compañia_cuartel`
--

CREATE TABLE `compañia_cuartel` (
  `Id_Compañia` int(10) DEFAULT NULL,
  `Id_Cuartel` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuartel`
--

CREATE TABLE `cuartel` (
  `Id_Cuartel` int(5) NOT NULL,
  `Nombre_Cuartel` varchar(30) DEFAULT NULL,
  `Pais_Cuartel` varchar(30) DEFAULT NULL,
  `Departamento_Cuartel` varchar(30) DEFAULT NULL,
  `Ciudad_Cuartel` varchar(30) DEFAULT NULL,
  `Barrio_Cuartel` varchar(30) DEFAULT NULL,
  `Direccion_Cuartel` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuerpo`
--

CREATE TABLE `cuerpo` (
  `Id_Cuerpo` int(5) NOT NULL,
  `Denominacion_Infanteria` varchar(30) DEFAULT NULL,
  `Denominacion_Artilleria` varchar(30) DEFAULT NULL,
  `Denominacion_Armada` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servicio`
--

CREATE TABLE `servicio` (
  `Id_Servicio` int(5) NOT NULL,
  `Actividad_Guardia` varchar(20) DEFAULT NULL,
  `Actividad_Cuartelero` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soldado`
--

CREATE TABLE `soldado` (
  `Id_Soldado` int(5) NOT NULL,
  `Nombre_Soldado` varchar(30) DEFAULT NULL,
  `Apellido_Soldado` varchar(30) DEFAULT NULL,
  `Grado` varchar(10) DEFAULT NULL,
  `id_cuartel_fk` int(10) DEFAULT NULL,
  `Id_cuerpo_FK` int(10) DEFAULT NULL,
  `Id_compañia_FK` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soldado_servicio`
--

CREATE TABLE `soldado_servicio` (
  `Id_Soldado` int(10) DEFAULT NULL,
  `Id_Servicio` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compañia`
--
ALTER TABLE `compañia`
  ADD PRIMARY KEY (`Id_Compañia`);

--
-- Indexes for table `compañia_cuartel`
--
ALTER TABLE `compañia_cuartel`
  ADD KEY `fk_cuatro` (`Id_Cuartel`),
  ADD KEY `fk_cinco` (`Id_Compañia`);

--
-- Indexes for table `cuartel`
--
ALTER TABLE `cuartel`
  ADD PRIMARY KEY (`Id_Cuartel`);

--
-- Indexes for table `cuerpo`
--
ALTER TABLE `cuerpo`
  ADD PRIMARY KEY (`Id_Cuerpo`);

--
-- Indexes for table `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`Id_Servicio`);

--
-- Indexes for table `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`Id_Soldado`),
  ADD KEY `fk_iduno` (`id_cuartel_fk`),
  ADD KEY `fk_seis` (`Id_cuerpo_FK`),
  ADD KEY `fk_siete` (`Id_compañia_FK`);

--
-- Indexes for table `soldado_servicio`
--
ALTER TABLE `soldado_servicio`
  ADD KEY `fk_iddos` (`Id_Soldado`),
  ADD KEY `fk_idtres` (`Id_Servicio`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compañia`
--
ALTER TABLE `compañia`
  MODIFY `Id_Compañia` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cuartel`
--
ALTER TABLE `cuartel`
  MODIFY `Id_Cuartel` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cuerpo`
--
ALTER TABLE `cuerpo`
  MODIFY `Id_Cuerpo` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servicio`
--
ALTER TABLE `servicio`
  MODIFY `Id_Servicio` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soldado`
--
ALTER TABLE `soldado`
  MODIFY `Id_Soldado` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compañia_cuartel`
--
ALTER TABLE `compañia_cuartel`
  ADD CONSTRAINT `fk_cinco` FOREIGN KEY (`Id_Compañia`) REFERENCES `compañia` (`Id_Compañia`),
  ADD CONSTRAINT `fk_cuatro` FOREIGN KEY (`Id_Cuartel`) REFERENCES `cuartel` (`Id_Cuartel`);

--
-- Constraints for table `soldado`
--
ALTER TABLE `soldado`
  ADD CONSTRAINT `fk_iduno` FOREIGN KEY (`id_cuartel_fk`) REFERENCES `cuartel` (`Id_Cuartel`),
  ADD CONSTRAINT `fk_seis` FOREIGN KEY (`Id_cuerpo_FK`) REFERENCES `cuerpo` (`Id_Cuerpo`),
  ADD CONSTRAINT `fk_siete` FOREIGN KEY (`Id_compañia_FK`) REFERENCES `compañia` (`Id_Compañia`);

--
-- Constraints for table `soldado_servicio`
--
ALTER TABLE `soldado_servicio`
  ADD CONSTRAINT `fk_iddos` FOREIGN KEY (`Id_Soldado`) REFERENCES `soldado` (`Id_Soldado`),
  ADD CONSTRAINT `fk_idtres` FOREIGN KEY (`Id_Servicio`) REFERENCES `servicio` (`Id_Servicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

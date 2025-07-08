-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hotel_booking_system
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- User Table
CREATE TABLE `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(15) DEFAULT NULL,
  `usertype` ENUM('admin', 'user') DEFAULT 'user',
  `email_verified_at` DATETIME DEFAULT NULL,
  `password` VARCHAR(255) DEFAULT NULL,
  `remember_token` VARCHAR(255) DEFAULT NULL,
  `current_team_id` INT(11) DEFAULT NULL,
  `profile_photo_path` VARCHAR(255) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

INSERT INTO `user` (`id`, `name`, `email`, `phone`) 
VALUES
  (1, 'faizan', 'awanf9377@gmail.com', '+9203445222128'),
  (2, 'Emma', 'emma.smith@example.co.uk', '+441234567890'),
  (3, 'Liam', 'liam.johnson@example.de', '+4915123456789'),
  (4, 'Sofia', 'sofia.garcia@example.es', '+34600123456'),
  (5, 'Lucas', 'lucas.mueller@example.ch', '+41791234567'),
  (6, 'Mia', 'mia.dubois@example.fr', '+33123456789');


-- Room Table
CREATE TABLE `room` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `room_title` VARCHAR(255) NOT NULL,
  `image` VARCHAR(255) DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `price` DECIMAL(10, 2) DEFAULT NULL,
  `wifi` ENUM('yes', 'no') DEFAULT NULL,
  `room_type` VARCHAR(50) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

INSERT INTO `room` (`id`, `room_title`, `room_type`, `status`) 
VALUES
  (101, 'Single', 'Single', 'Available'),
  (102, 'Double', 'Double', 'Booked'),
  (103, 'Suite', 'Suite', 'Available'),
  (104, 'Double', 'Double', 'Maintenance'),
  (105, 'Single', 'Single', 'Available');


-- Booking Table
CREATE TABLE `booking` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `room_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`room_id`) REFERENCES `room`(`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
);

INSERT INTO `booking` (`id`, `room_id`, `user_id`, `start_date`, `end_date`)
VALUES
  (1, 101, 1, '2025-06-01', '2025-06-05'),
  (2, 102, 2, '2025-06-03', '2025-06-07'),
  (3, 103, 3, '2025-06-10', '2025-06-15'),
  (4, 101, 4, '2025-06-20', '2025-06-22'),
  (5, 104, 5, '2025-06-18', '2025-06-21');


-- Contact Table
CREATE TABLE `contact` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(15) DEFAULT NULL,
  `subject` VARCHAR(255) NOT NULL,
  `message` TEXT NOT NULL,
  `status` ENUM('unread', 'read', 'replied') DEFAULT 'unread',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

-- Example Insert for Contact
INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `subject`, `message`, `status`)
VALUES
  (1, 'John Doe', 'john.doe@example.com', '+123456789', 'Room Inquiry', 'I would like to know more about the available rooms.', 'unread');

CREATE TABLE IF NOT EXISTS `Customer` (
    `customer_id` INT AUTO_INCREMENT NOT NULL,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `phone_number` VARCHAR(25) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`customer_id`)
);

CREATE TABLE IF NOT EXISTS `Service` (
    `service_id` INT AUTO_INCREMENT NOT NULL,
    `service_name` VARCHAR(100) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`service_id`)
);

CREATE TABLE IF NOT EXISTS `Reservation` (
    `reservation_id` INT AUTO_INCREMENT NOT NULL,
    `check_in_date` DATE NOT NULL,
    `check_out_date` DATE NOT NULL,
    `employee_id` INT NOT NULL,
    `room_id` INT NOT NULL,
    PRIMARY KEY (`reservation_id`)
);

CREATE TABLE IF NOT EXISTS `Room` (
    `room_id` INT AUTO_INCREMENT NOT NULL,
    `room_number` VARCHAR(20) NOT NULL,
    `room_type` VARCHAR(50) NOT NULL,
    `price_per_night` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`room_id`)
);

CREATE TABLE IF NOT EXISTS `Payment` (
    `payment_id` INT AUTO_INCREMENT NOT NULL,
    `payment_date` DATE NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`payment_id`)
);

CREATE TABLE `Customer` (
    `customer_id` INT AUTO_INCREMENT NOT NULL,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `phone_number` VARCHAR(25) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`customer_id`)
);

CREATE TABLE `Service` (
    `service_id` INT AUTO_INCREMENT NOT NULL,
    `service_name` VARCHAR(100) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`service_id`)
);

CREATE TABLE `Reservation` (
    `reservation_id` INT AUTO_INCREMENT NOT NULL,
    `check_in_date` DATE NOT NULL,
    `check_out_date` DATE NOT NULL,
    `employee_id` INT NOT NULL,
    `room_id` INT NOT NULL,
    PRIMARY KEY (`reservation_id`)
);

CREATE TABLE `Room` (
    `room_id` INT AUTO_INCREMENT NOT NULL,
    `room_number` VARCHAR(20) NOT NULL,
    `room_type` VARCHAR(50) NOT NULL,
    `price_per_night` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`room_id`)
);

CREATE TABLE `Payment` (
    `payment_id` INT AUTO_INCREMENT NOT NULL,
    `payment_date` DATE NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `reservation_id` INT NOT NULL,
    `payment_method` VARCHAR(50) NOT NULL,
    `customer_ID` INT NOT NULL,
    PRIMARY KEY (`payment_id`)
);

CREATE TABLE `Employee` (
    `employee_id` INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `position` VARCHAR(50) NOT NULL,
    `work_schedule` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`employee_id`)
);

CREATE TABLE `Order` (
    `order_id` INT AUTO_INCREMENT NOT NULL,
    `reservation_id` INT NOT NULL,
    `service_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    `comments` TEXT,
    PRIMARY KEY (`order_id`)
);

-- Зв'язки між таблицями
ALTER TABLE `Payment` 
ADD CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_ID`) REFERENCES `Customer`(`customer_id`),
ADD CONSTRAINT `fk_payment_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation`(`reservation_id`);

ALTER TABLE `Reservation` 
ADD CONSTRAINT `fk_reservation_room` FOREIGN KEY (`room_id`) REFERENCES `Room`(`room_id`),
ADD CONSTRAINT `fk_reservation_employee` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `Order` 
ADD CONSTRAINT `fk_order_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation`(`reservation_id`),
ADD CONSTRAINT `fk_order_service` FOREIGN KEY (`service_id`) REFERENCES `Service`(`service_id`);

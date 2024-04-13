CREATE TABLE `users` (
  `id` long PRIMARY KEY,
  `email` nvarchar(50),
  `password` nvarchar(255),
  `role_id` long
);

CREATE TABLE `roles` (
  `id` long PRIMARY KEY,
  `name` varchar(50)
);

CREATE TABLE `customers` (
  `id` long PRIMARY KEY,
  `fullname` varchar(255),
  `username` varchar(255),
  `phone_number` varchar(15),
  `dob` varchar(15),
  `address` varchar(255)
);

CREATE TABLE `venders` (
  `id` long PRIMARY KEY,
  `name` varchar(255),
  `phone` varchar(255),
  `tax` varchar(255),
  `address` varchar(255),
  `hotel_id` long
);

CREATE TABLE `hotels` (
  `id` long PRIMARY KEY,
  `name` varchar(255),
  `address` varchar(255),
  `room_number` long,
  `service_id` long,
  `room_id` long,
  `start_number` int,
  `score_feedback` float,
  `category_hotel_id` long
);

CREATE TABLE `feedbacks` (
  `id` long PRIMARY KEY,
  `customer_id` long,
  `hotel_id` long,
  `content` varchar(255),
  `score_feedback` int,
  `image_feedback_id` long
);

CREATE TABLE `image_feedbacks` (
  `id` long PRIMARY KEY,
  `path` nvarchar(255)
);

CREATE TABLE `services` (
  `id` long PRIMARY KEY,
  `name` varchar(255),
  `service_detail_id` long
);

CREATE TABLE `service_detail` (
  `id` long PRIMARY KEY,
  `name` varchar(255),
  `description` varchar(255)
);

CREATE TABLE `rooms` (
  `id` long PRIMARY KEY,
  `category_room_id` long,
  `name` varchar(255),
  `room_service_id` long,
  `image_room_id` long
);

CREATE TABLE `image_rooms` (
  `id` long PRIMARY KEY,
  `path` varchar(255)
);

CREATE TABLE `room_details` (
  `id` long PRIMARY KEY,
  `room_id` long,
  `customer_max` varchar(255),
  `price` long,
  `room_code` varchar(10),
  `option_id` long,
  `status` varchar(10)
);

CREATE TABLE `options` (
  `id` long PRIMARY KEY,
  `name` varchar(255),
  `description` varchar(255)
);

CREATE TABLE `category_room` (
  `id` long PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `room_services` (
  `id` long PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `booking` (
  `id` long PRIMARY KEY,
  `checkin` varchar(255),
  `checkout` varchar(255),
  `sum_price` long,
  `note` varchar(255),
  `status` varchar(255)
);

CREATE TABLE `booking_room` (
  `id` long PRIMARY KEY,
  `booking_id` long,
  `room_detail_id` long,
  `quantity` long
);

CREATE TABLE `bill` (
  `id` long PRIMARY KEY,
  `customer_id` long,
  `booking_id` long,
  `payment_date` varchar(255),
  `payment_amount` varchar(255),
  `note` varchar(255)
);

ALTER TABLE `booking_room` ADD FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`);

ALTER TABLE `booking_room` ADD FOREIGN KEY (`room_detail_id`) REFERENCES `room_details` (`id`);

ALTER TABLE `bill` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

ALTER TABLE `bill` ADD FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`);

ALTER TABLE `rooms` ADD FOREIGN KEY (`category_room_id`) REFERENCES `category_room` (`id`);

ALTER TABLE `rooms` ADD FOREIGN KEY (`image_room_id`) REFERENCES `image_rooms` (`id`);

ALTER TABLE `rooms` ADD FOREIGN KEY (`room_service_id`) REFERENCES `room_services` (`id`);

ALTER TABLE `room_details` ADD FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

ALTER TABLE `room_details` ADD FOREIGN KEY (`option_id`) REFERENCES `options` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

ALTER TABLE `customers` ADD FOREIGN KEY (`id`) REFERENCES `users` (`id`);

ALTER TABLE `venders` ADD FOREIGN KEY (`id`) REFERENCES `users` (`id`);

ALTER TABLE `hotels` ADD FOREIGN KEY (`id`) REFERENCES `venders` (`hotel_id`);

ALTER TABLE `services` ADD FOREIGN KEY (`id`) REFERENCES `hotels` (`service_id`);

ALTER TABLE `service_detail` ADD FOREIGN KEY (`id`) REFERENCES `services` (`service_detail_id`);

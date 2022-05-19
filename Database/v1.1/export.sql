CREATE TABLE `user` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `nickname` varchar(255),
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime
);

CREATE TABLE `deck` (
  `deck_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `format` varchar(255),
  `type` varchar(255),
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime,
  `user_id` int,
  `representing_card_uuid` varchar(255)
);

CREATE TABLE `cards` (
  `uuid` varchar(255) PRIMARY KEY
);

CREATE TABLE `user_card` (
  `user_id` int,
  `uuid` varchar(255),
  `amount` int NOT NULL
);

CREATE TABLE `card_deck` (
  `deck_id` int,
  `uuid` varchar(255),
  `amount` int NOT NULL,
  `sideboard` ENUM ('1', '0') NOT NULL
);

ALTER TABLE `deck` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `deck` ADD FOREIGN KEY (`representing_card_uuid`) REFERENCES `cards` (`uuid`);

ALTER TABLE `user_card` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `user_card` ADD FOREIGN KEY (`uuid`) REFERENCES `cards` (`uuid`);

ALTER TABLE `card_deck` ADD FOREIGN KEY (`deck_id`) REFERENCES `deck` (`deck_id`);

ALTER TABLE `card_deck` ADD FOREIGN KEY (`uuid`) REFERENCES `cards` (`uuid`);

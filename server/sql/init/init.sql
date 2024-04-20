-- Adminer 4.8.1 MySQL 5.5.5-10.4.33-MariaDB-1:10.4.33+maria~ubu2004 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `forum`;
CREATE TABLE forum
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(255) NOT NULL,
    created_at DATE         NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `role`;
CREATE TABLE role
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO role (name) VALUES ('admin');
INSERT INTO role (name) VALUES ('user');


DROP TABLE IF EXISTS `user`;
CREATE TABLE user
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    pseudo   VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id  INT,
    FOREIGN KEY (role_id) REFERENCES role (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO user (pseudo, password, role_id) VALUES ('admin', 'admin', 1);

DROP TABLE IF EXISTS `subject`;
CREATE TABLE subject
(
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    name                VARCHAR(255) NOT NULL,
    forum_id            INT,
    created_at          DATE         NOT NULL,
    FOREIGN KEY (forum_id) REFERENCES forum (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `message`;
CREATE TABLE message
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    text         VARCHAR(255) NOT NULL,
    user_id      INT,
    subject_id   INT,
    last_updated DATE,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (subject_id) REFERENCES subject (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




-- 2024-04-09 11:00:58
drop database transactions;

create database transactions;
use transactions;

CREATE TABLE `checking` (
  `balance` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL unique
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `saving` (
  `balance` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL unique
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into checking value (100, 1315);
insert into saving value (150, 1315);

START TRANSACTION;
    UPDATE checking set balance = checking.balance - 80 where checking.customer_id = 1315;
    UPDATE saving set balance = saving.balance + 80 where saving.customer_id = 1315;
COMMIT;
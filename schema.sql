CREATE TABLE machines (machine_id INT PRIMARY KEY, machine_name VARCHAR(100), location VARCHAR(50));
CREATE TABLE production_logs (log_id INT PRIMARY KEY, machine_id INT, defects INT, production_date DATE, status VARCHAR(20));

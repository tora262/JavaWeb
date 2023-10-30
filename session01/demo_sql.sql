/*
Demo tạo mới database
Sử dụng SQL
*/

-- Tạo mới cơ sở dữ liệu
CREATE DATABASE employee_management;
-- Sử dụng câu lệnh này để chọn db mình sẽ thao tác
USE employee_management;

-- Tạo mới bảng employees
CREATE TABLE employees (
	employee_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- khóa chính, kiểu dữ liệu số nguyên, không được phép null, tự động tăng
    employee_name TEXT NOT NULL, -- tên nhân viên không được để trống
    employee_address TEXT,
    department_id INT
);

-- Tạo mới bảng departments
CREATE TABLE departments (
	department_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    department_name TEXT NOT NULL
);

-- Thêm cột số lượng nhân viên 
ALTER TABLE departments
	ADD COLUMN employee_quantity INT;

-- Thêm dữ liệu mẫu
INSERT INTO departments (
	department_name, 
    employee_quantity
) VALUES (
	'Marketing',
    10
);
INSERT INTO departments (
	department_name, 
    employee_quantity
) VALUES (
	'Sale',
    20
);
INSERT INTO departments (
	department_name, 
    employee_quantity
) VALUES (
	'Operation',
    12
);
INSERT INTO employees (
	employee_name,
    department_id
) VALUES (
	'Thắng Nguyễn',
    1
);
INSERT INTO employees (
	employee_name,
    department_id
) VALUES (
	'Tiến Hồ',
    1
);
INSERT INTO employees (
	employee_name,
    department_id
) VALUES (
	'Hoàng Nguyễn',
    2
);



-- Các câu lệnh truy vấn data
-- -SELECT
SELECT * FROM departments;
SELECT department_name, employee_quantity FROM departments;
SELECT 
	department_name 
FROM departments
WHERE employee_quantity > 10 AND department_name = 'Sale';

SELECT
	COUNT(department_id) AS department_count
FROM departments 
WHERE employee_quantity > 10;

SELECT * FROM employees;
SELECT
	department_id,
	COUNT(employee_id) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) > 1;

UPDATE employees SET employee_name = "Nguyễn Sỹ Hoàng" WHERE employee_id > 0;
DELETE FROM employees WHERE employee_id = 3;


-- Thêm cột is_delelted để thực hiện xóa logic    
ALTER TABLE employees
	ADD COLUMN is_deleted BIT DEFAULT 0;
ALTER TABLE departments
	ADD COLUMN is_deleted BIT DEFAULT 0;

UPDATE employees SET is_deleted = 1 WHERE employee_id = 2;

SELECT * FROM employees WHERE is_deleted = 0;

DROP TABLE employee;
DROP DATABASE employee_management;


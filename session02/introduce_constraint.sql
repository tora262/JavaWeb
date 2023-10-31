CREATE DATABASE product_management;
USE product_management;
CREATE TABLE category (
	category_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(30)
);

CREATE TABLE product(
	product_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(45) NOT NULL,
    price DECIMAL(10, 0) NOT NULL,
    description TEXT,
    category_id INT
);

ALTER TABLE product 
ADD CONSTRAINT fk_categogry FOREIGN KEY (category_id) 
REFERENCES category(category_id);





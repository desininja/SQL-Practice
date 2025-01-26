-- Create the Products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity_in_stock INTEGER,
    sold_quantity INTEGER DEFAULT 0
);


-- Insert data into the Products table
INSERT INTO products (product_name, unit_price, quantity_in_stock, sold_quantity)
VALUES
    ('Laptop', 1200.00, 50,3),
    ('Smartphone', 800.00, 100,5),
    ('Headphones', 150.00, 200,6),
    ('Keyboard', 75.00, 150,88),
    ('Mouse', 30.00, 250,55);


-- CREATE the sales table
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INTEGER,
    quantity_sold INTEGER,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into sales table
INSERT INTO sales (product_id, quantity_sold, sale_date)
VALUES
    (1, 10, '2023-11-15'),
    (2, 20, '2023-11-18'),
    (1, 5, '2023-11-20'),
    (3, 30, '2023-11-22'),
    (2, 15, '2023-11-25'),
    (4, 25, '2023-11-28'),
    (5, 50, '2023-11-30');
-- For every given product and the quantity:
--  1) Check if product is available based on the required quantity.
--  2) If available then modify the database tables accordingly.

select * from products;
select * from sales;


CREATE OR REPLACE PROCEDURE products_update(p_product_name VARCHAR, p_quantity INT, )
LANGUAGE plpgsql
AS $$
DECLARE 
		v_prod_id INT;
		v_price DECIMAL(10,2);
		v_count INT;
BEGIN
      SELECT count(1)
	  into v_count
	  from products
	  where product_name = p_product_name
	  and quantity_in_stock >= p_quantity;
	  
	  IF v_count > 0 THEN 	  	  
      		SELECT product_id, unit_price
	  		INTO v_prod_id, v_price
	  		FROM products
	  		WHERE product_name = p_product_name;
	  
	  		INSERT INTO sales (product_id,quantity_sold,sale_date)
	  		VALUES (v_prod_id,p_quantity,current_date);
	
	  		UPDATE products
	  		SET quantity_in_stock = (quantity_in_stock - p_quantity)
				,sold_quantity = (sold_quantity + p_quantity)
	  		WHERE product_id = v_prod_id;
	  
	  		RAISE NOTICE 'Products Sold';
	  ELSE
	  		RAISE NOTICE 'Insufficient Quantity!';
	  END IF;
END;
$$







call products_update('Headphones',1000);
select * from products;
select * from sales;

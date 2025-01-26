-- Total Sales Stored Procedure:

CREATE OR REPLACE PROCEDURE proc_total_sales(IN p_prod_name VARCHAR, OUT total_units_sold DECIMAL(10,2))
LANGUAGE plpgsql 
AS
$$
DECLARE
		v_prod_id INT;
BEGIN 
		SELECT product_id
		INTO v_prod_id
		FROM products
		WHERE product_name = p_prod_name;


		SELECT sum(quantity_sold) INTO total_units_sold
		FROM sales
		WHERE product_id = v_prod_id;
		
		IF total_units_sold IS NULL THEN
			total_units_sold :=0;
		END IF;
END;
$$


-- Call the procedure
CALL proc_total_sales('Laptop', null); 

--When output variables are passed then while calling the procedure
--need to pass null in place of output variable.    
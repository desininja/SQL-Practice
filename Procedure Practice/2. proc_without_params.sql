select * from products;
select * from sales;

-- update for laptop in products table for single sale.
CREATE OR REPLACE Procedure products_update()
language plpgsql
as $$ 
declare
		v_product_id int;
		v_unit_price decimal(10,2);
begin 
		select product_id,unit_price
		into v_product_id, v_unit_price
		from products
		where product_name='Laptop';
		
		insert into sales (product_id,quantity_sold,sale_date)
			values (v_product_id,1,current_date);
		
		Update products
		set quantity_in_stock = (quantity_in_stock -1)
			,sold_quantity = (sold_quantity +1)
		where product_id = v_product_id;
		
		raise notice 'Product Sold!';
END;
$$



select * from products;
select * from sales;
-- Calling procedure
call products_update();

select * from products;
select * from sales;


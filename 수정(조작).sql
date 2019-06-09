UPDATE product
	SET price = price - 1000
	WHERE brand_num = 
			(SELECT brand_num
			FROM product
			WHERE pro_num = 2);
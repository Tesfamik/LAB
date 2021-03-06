USE [Sakila]
GO
/****** Object:  View [dbo].[sales_by_film_category]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW [dbo].[sales_by_film_category] ([category], [total_sales])
AS 
   SELECT TOP (9223372036854775807) c.name AS category, sum(p.amount) AS total_sales
   FROM (((((dbo.payment  AS p 
      INNER JOIN dbo.rental  AS r 
      ON ((p.rental_id = r.rental_id))) 
      INNER JOIN dbo.inventory  AS i 
      ON ((r.inventory_id = i.inventory_id))) 
      INNER JOIN dbo.film  AS f 
      ON ((i.film_id = f.film_id))) 
      INNER JOIN dbo.film_category  AS fc 
      ON ((f.film_id = fc.film_id))) 
      INNER JOIN dbo.category  AS c 
      ON ((fc.category_id = c.category_id)))
   GROUP BY c.name
      ORDER BY total_sales DESC
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.sales_by_film_category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sales_by_film_category'
GO

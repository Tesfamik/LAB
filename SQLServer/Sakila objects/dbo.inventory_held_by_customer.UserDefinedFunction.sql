USE [Sakila]
GO
/****** Object:  UserDefinedFunction [dbo].[inventory_held_by_customer]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   READS SQL DATA.
*/

CREATE FUNCTION [dbo].[inventory_held_by_customer] 
( 
   @p_inventory_id int
)
RETURNS int
AS 
   BEGIN

      DECLARE
         @v_customer_id int

      SELECT @v_customer_id = rental.customer_id
      FROM dbo.rental
      WHERE rental.return_date IS NULL AND rental.inventory_id = @p_inventory_id

      RETURN @v_customer_id

   END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.inventory_held_by_customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'inventory_held_by_customer'
GO

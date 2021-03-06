USE [Sakila]
GO
/****** Object:  UserDefinedFunction [dbo].[inventory_in_stock]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
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

CREATE FUNCTION [dbo].[inventory_in_stock] 
( 
   @p_inventory_id int
)
RETURNS smallint
AS 
   BEGIN

      DECLARE
         @v_rentals int

      DECLARE
         @v_out int

      /*
      *   SSMA informational messages:
      *   M2SS0134: Conversion of following Comment(s) is not supported : AN ITEM IS IN-STOCK IF THERE ARE EITHER NO ROWS IN THE rental TABLE
      *   FOR THE ITEM OR ALL ROWS HAVE return_date POPULATED
      *
      */

      SELECT @v_rentals = count_big(*)
      FROM dbo.rental
      WHERE rental.inventory_id = @p_inventory_id

      IF @v_rentals = 0
         /*
         *   SSMA informational messages:
         *   M2SS0052: BOOLEAN literal was converted to SMALLINT literal
         */

         RETURN 1

      SELECT @v_out = count_big(rental.rental_id)
      FROM 
         dbo.inventory 
            LEFT JOIN dbo.rental 
            ON inventory.inventory_id = rental.inventory_id
      WHERE inventory.inventory_id = @p_inventory_id AND rental.return_date IS NULL

      IF @v_out > 0
         /*
         *   SSMA informational messages:
         *   M2SS0052: BOOLEAN literal was converted to SMALLINT literal
         */

         RETURN 0
      ELSE 
         /*
         *   SSMA informational messages:
         *   M2SS0052: BOOLEAN literal was converted to SMALLINT literal
         */

         RETURN 1

      RETURN NULL

   END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.inventory_in_stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'inventory_in_stock'
GO

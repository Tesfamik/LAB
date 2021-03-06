USE [Sakila]
GO
/****** Object:  StoredProcedure [dbo].[film_not_in_stock]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
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

CREATE PROCEDURE [dbo].[film_not_in_stock]  
   @p_film_id int,
   @p_store_id int,
   @p_film_count int  OUTPUT
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SET @p_film_count = NULL

      SELECT inventory.inventory_id
      FROM dbo.inventory
      WHERE 
         inventory.film_id = @p_film_id AND 
         inventory.store_id = @p_store_id AND 
         NOT dbo.inventory_in_stock(inventory.inventory_id) <> 0

      /* 
      *   SSMA error messages:
      *   M2SS0201: MySQL standard function FOUND_ROWS is not supported in current SSMA version

      SELECT @p_film_count = FOUND_ROWS
      */



   END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.film_not_in_stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'film_not_in_stock'
GO

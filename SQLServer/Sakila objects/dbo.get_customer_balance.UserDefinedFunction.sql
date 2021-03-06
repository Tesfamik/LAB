USE [Sakila]
GO
/****** Object:  UserDefinedFunction [dbo].[get_customer_balance]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
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
*   M2SS0003: The following SQL clause was ignored during conversion: DETERMINISTIC.
*   M2SS0134: Conversion of following Comment(s) is not supported : OK, WE NEED TO CALCULATE THE CURRENT BALANCE GIVEN A CUSTOMER_ID AND A DATE
*   THAT WE WANT THE BALANCE TO BE EFFECTIVE FOR. THE BALANCE IS:
*      1) RENTAL FEES FOR ALL PREVIOUS RENTALS
*      2) ONE DOLLAR FOR EVERY DAY THE PREVIOUS RENTALS ARE OVERDUE
*      3) IF A FILM IS MORE THAN RENTAL_DURATION * 2 OVERDUE, CHARGE THE REPLACEMENT_COST
*      4) SUBTRACT ALL PAYMENTS MADE BEFORE THE DATE SPECIFIED
*
*/

CREATE FUNCTION [dbo].[get_customer_balance] 
( 
   @p_customer_id int,
   @p_effective_date datetime2(0)
)
RETURNS decimal(5, 2)
AS 
   BEGIN

      /*
      *   SSMA informational messages:
      *   M2SS0134: Conversion of following Comment(s) is not supported : FEES PAID TO RENT THE VIDEOS INITIALLY
      *
      */

      DECLARE
         @v_rentfees decimal(5, 2)

      /*
      *   SSMA informational messages:
      *   M2SS0134: Conversion of following Comment(s) is not supported : LATE FEES FOR PRIOR RENTALS
      *
      */

      DECLARE
         @v_overfees int

      /*
      *   SSMA informational messages:
      *   M2SS0134: Conversion of following Comment(s) is not supported : SUM OF PAYMENTS MADE PREVIOUSLY
      *
      */

      DECLARE
         @v_payments decimal(5, 2)

      SELECT @v_rentfees = ISNULL(sum(film.rental_rate), 0)
      FROM dbo.film, dbo.inventory, dbo.rental
      WHERE 
         film.film_id = inventory.film_id AND 
         inventory.inventory_id = rental.inventory_id AND 
         rental.rental_date <= @p_effective_date AND 
         rental.customer_id = @p_customer_id

      SELECT @v_overfees = ISNULL(sum(
         CASE 
            WHEN (((DATEDIFF(DAY, '1900-01-01', rental.return_date) + 693961) - (DATEDIFF(DAY, '1900-01-01', rental.rental_date) + 693961)) > film.rental_duration) THEN (((DATEDIFF(DAY, '1900-01-01', rental.return_date) + 693961) - (DATEDIFF(DAY, '1900-01-01', rental.rental_date) + 693961)) - film.rental_duration)
            ELSE 0
         END), 0)
      FROM dbo.rental, dbo.inventory, dbo.film
      WHERE 
         film.film_id = inventory.film_id AND 
         inventory.inventory_id = rental.inventory_id AND 
         rental.rental_date <= @p_effective_date AND 
         rental.customer_id = @p_customer_id

      SELECT @v_payments = ISNULL(sum(payment.amount), 0)
      FROM dbo.payment
      WHERE payment.payment_date <= @p_effective_date AND payment.customer_id = @p_customer_id

      RETURN @v_rentfees + @v_overfees - @v_payments

   END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.get_customer_balance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'get_customer_balance'
GO

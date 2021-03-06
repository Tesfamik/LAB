USE [Sakila]
GO
/****** Object:  StoredProcedure [dbo].[rewards_report]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
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
*   M2SS0003: The following SQL clause was ignored during conversion: COMMENT 'Provides a customizable report on best customers'.
*/

CREATE PROCEDURE [dbo].[rewards_report]  
   @min_monthly_purchases tinyint,
   @min_dollar_amount_purchased decimal(10, 2),
   @count_rewardees int  OUTPUT
AS 
   /*
   *   SSMA informational messages:
   *   M2SS0003: The following SQL clause was ignored during conversion:
   *   proc : .
   */

   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SET @count_rewardees = NULL

      DECLARE
         @last_month_start date

      DECLARE
         @last_month_end date

      /*
      *   SSMA informational messages:
      *   M2SS0134: Conversion of following Comment(s) is not supported :  Some sanity checks... 
      *
      */

      IF @min_monthly_purchases = 0
         BEGIN

            SELECT N'Minimum monthly purchases parameter must be > 0'

            GOTO proc$leave

         END

      IF @min_dollar_amount_purchased = 0.00
         BEGIN

            SELECT N'Minimum monthly dollar amount purchased parameter must be > $0.00'

            GOTO proc$leave

         END

      SET @last_month_start = dateadd(month, -1, CAST(getdate() AS DATE))

      /* 
      *   SSMA error messages:
      *   M2SS0201: MySQL standard function STR_TO_DATE is not supported in current SSMA version

      SET @last_month_start = STR_TO_DATE((CAST(year(@last_month_start) AS varchar(50))) + (N'-') + (CAST(datepart(MONTH, @last_month_start) AS varchar(50))) + (N'-01'), '%Y-%m-%d')
      */



      SET @last_month_end = DATEADD(DAY, -1, DATEADD(MONTH, DATEDIFF(MONTH, CAST('1900-01-01' AS DATE), @last_month_start) + 1, CAST('1900-01-01' AS DATE)))

      CREATE TABLE #tmpCustomer
      (
         customer_id int NOT NULL PRIMARY KEY
      )

      INSERT #tmpCustomer(customer_id)
         SELECT p.customer_id
         FROM dbo.payment  AS p
         WHERE p.payment_date BETWEEN @last_month_start AND @last_month_end
         GROUP BY p.customer_id
         HAVING sum(p.amount) > @min_dollar_amount_purchased AND count_big(p.customer_id) > @min_monthly_purchases
            ORDER BY p.customer_id

      /*
      *   SSMA informational messages:
      *   M2SS0134: Conversion of following Comment(s) is not supported :  Populate OUT parameter with count of found customers 
      *
      */

      SELECT @count_rewardees = count_big(*)
      FROM #tmpCustomer

      /*
      *   SSMA informational messages:
      *   M2SS0134: Conversion of following Comment(s) is not supported : 
      *           Output ALL customer information of matching rewardees.
      *           Customize output as needed.
      *       
      *
      */

      SELECT 
         c.customer_id, 
         c.store_id, 
         c.first_name, 
         c.last_name, 
         c.email, 
         c.address_id, 
         c.active, 
         c.create_date, 
         c.last_update
      FROM 
         #tmpCustomer  AS t 
            INNER JOIN dbo.customer  AS c 
            ON t.customer_id = c.customer_id

      DROP TABLE #tmpCustomer

   END
   proc$leave:
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.rewards_report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'rewards_report'
GO

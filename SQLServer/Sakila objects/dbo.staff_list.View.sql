USE [Sakila]
GO
/****** Object:  View [dbo].[staff_list]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
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

CREATE VIEW [dbo].[staff_list] (
   [ID], 
   [name], 
   [address], 
   [zip code], 
   [phone], 
   [city], 
   [country], 
   [SID])
AS 
   SELECT 
      s.staff_id AS ID, 
      s.first_name + N' ' + s.last_name AS name, 
      a.address AS address, 
      a.postal_code AS [zip code], 
      a.phone AS phone, 
      city.city AS city, 
      country.country AS country, 
      s.store_id AS SID
   FROM (((dbo.staff  AS s 
      INNER JOIN dbo.address  AS a 
      ON ((s.address_id = a.address_id))) 
      INNER JOIN dbo.city 
      ON ((a.city_id = city.city_id))) 
      INNER JOIN dbo.country 
      ON ((city.country_id = country.country_id)))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.staff_list' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'staff_list'
GO

USE [Sakila]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$film$rating]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$film$rating] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'G'
            WHEN 2 THEN 'PG'
            WHEN 3 THEN 'PG-13'
            WHEN 4 THEN 'R'
            WHEN 5 THEN 'NC-17'
            ELSE ''
         END
   END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.film' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'enum2str$film$rating'
GO

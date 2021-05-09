USE [Sakila]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_set$film$special_features]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_set$film$special_features] 
( 
   @setval varchar(max)
)
RETURNS varchar(max)
AS 
   BEGIN
      RETURN dbo.set2str$film$special_features(dbo.str2set$film$special_features(@setval))
   END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.film' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'norm_set$film$special_features'
GO

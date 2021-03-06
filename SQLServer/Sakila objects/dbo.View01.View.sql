USE [Sakila]
GO
/****** Object:  View [dbo].[View01]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View01]
AS
SELECT dbo.actor.first_name AS actor_first_name, dbo.actor.last_name AS actor_last_name, dbo.film.title AS film_title, dbo.film.description AS film_description, dbo.film.release_year AS film_release_year, 
                  dbo.film.rental_duration AS film_rental_duration, dbo.film.rental_rate AS film_rental_rate, dbo.film.length AS film_length, dbo.film.replacement_cost AS film_replacement, dbo.film.rating AS film_rating, dbo.category.name AS Catategory, 
                  dbo.city.city AS costomer_city, dbo.country.country AS customer_country, dbo.customer.first_name AS customer_first_name, dbo.customer.last_name AS customer_last_name, dbo.customer.email AS customer_email, 
                  dbo.address.postal_code AS customer_postal_code, dbo.address.phone AS customer_phone, dbo.address.address AS customer_address, dbo.address.address2 AS customer_address2, dbo.address.district AS customer_district, 
                  dbo.rental.rental_date, dbo.payment.amount, dbo.payment.payment_date
FROM     dbo.actor INNER JOIN
                  dbo.film_actor INNER JOIN
                  dbo.film ON dbo.film_actor.film_id = dbo.film.film_id ON dbo.actor.actor_id = dbo.film_actor.actor_id INNER JOIN
                  dbo.film_category ON dbo.film.film_id = dbo.film_category.film_id INNER JOIN
                  dbo.category ON dbo.film_category.category_id = dbo.category.category_id CROSS JOIN
                  dbo.payment INNER JOIN
                  dbo.country INNER JOIN
                  dbo.city INNER JOIN
                  dbo.address ON dbo.city.city_id = dbo.address.city_id ON dbo.country.country_id = dbo.city.country_id INNER JOIN
                  dbo.customer ON dbo.address.address_id = dbo.customer.address_id ON dbo.payment.customer_id = dbo.customer.customer_id INNER JOIN
                  dbo.rental ON dbo.payment.rental_id = dbo.rental.rental_id AND dbo.customer.customer_id = dbo.rental.customer_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[25] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "actor"
            Begin Extent = 
               Top = 3
               Left = 4
               Bottom = 166
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "film_actor"
            Begin Extent = 
               Top = 11
               Left = 259
               Bottom = 152
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "film"
            Begin Extent = 
               Top = 8
               Left = 511
               Bottom = 171
               Right = 691
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "film_category"
            Begin Extent = 
               Top = 12
               Left = 747
               Bottom = 129
               Right = 941
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "category"
            Begin Extent = 
               Top = 7
               Left = 990
               Bottom = 148
               Right = 1135
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "payment"
            Begin Extent = 
               Top = 221
               Left = 1087
               Bottom = 384
               Right = 1281
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "country"
            Begin Extent = 
               Top = 370
               Left = 1304
               Bottom = 511
               Right = 1465
            End
            DisplayFlags ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 280
            TopColumn = 0
         End
         Begin Table = "city"
            Begin Extent = 
               Top = 7
               Left = 1191
               Bottom = 170
               Right = 1346
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "address"
            Begin Extent = 
               Top = 179
               Left = 648
               Bottom = 342
               Right = 842
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "customer"
            Begin Extent = 
               Top = 379
               Left = 878
               Bottom = 542
               Right = 1072
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "rental"
            Begin Extent = 
               Top = 356
               Left = 288
               Bottom = 519
               Right = 482
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 52
         Width = 284
         Width = 1200
         Width = 1200
         Width = 2832
         Width = 9180
         Width = 1728
         Width = 1872
         Width = 1560
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1728
         Width = 1848
         Width = 1848
         Width = 1872
         Width = 2928
         Width = 2604
         Width = 1932
         Width = 1932
         Width = 1200
         Width = 2208
         Width = 2484
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2580
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View01'
GO

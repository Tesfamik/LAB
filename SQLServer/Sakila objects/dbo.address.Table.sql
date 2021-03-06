USE [Sakila]
GO
/****** Object:  Table [dbo].[address]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(606,1) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[address2] [nvarchar](50) NULL,
	[district] [nvarchar](20) NOT NULL,
	[city_id] [int] NOT NULL,
	[postal_code] [nvarchar](10) NULL,
	[phone] [nvarchar](20) NOT NULL,
	[location] [geometry] NOT NULL,
	[last_update] [datetime] NOT NULL,
 CONSTRAINT [PK_address_address_id] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_city_id]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
CREATE NONCLUSTERED INDEX [idx_fk_city_id] ON [dbo].[address]
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address] ADD  DEFAULT (NULL) FOR [address2]
GO
ALTER TABLE [dbo].[address] ADD  DEFAULT (NULL) FOR [postal_code]
GO
ALTER TABLE [dbo].[address] ADD  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[address]  WITH NOCHECK ADD  CONSTRAINT [address$fk_address_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [address$fk_address_city]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address'
GO

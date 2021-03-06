USE [Sakila]
GO
/****** Object:  Table [dbo].[film]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film](
	[film_id] [int] IDENTITY(1001,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[release_year] [smallint] NULL,
	[language_id] [tinyint] NOT NULL,
	[original_language_id] [tinyint] NULL,
	[rental_duration] [tinyint] NOT NULL,
	[rental_rate] [decimal](4, 2) NOT NULL,
	[length] [int] NULL,
	[replacement_cost] [decimal](5, 2) NOT NULL,
	[rating] [nvarchar](5) NULL,
	[special_features] [nvarchar](54) NULL,
	[last_update] [datetime] NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_film_film_id] PRIMARY KEY CLUSTERED 
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_film_ssma$rowid] UNIQUE NONCLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_language_id]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
CREATE NONCLUSTERED INDEX [idx_fk_language_id] ON [dbo].[film]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_original_language_id]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
CREATE NONCLUSTERED INDEX [idx_fk_original_language_id] ON [dbo].[film]
(
	[original_language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_title]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
CREATE NONCLUSTERED INDEX [idx_title] ON [dbo].[film]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (NULL) FOR [release_year]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (NULL) FOR [original_language_id]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT ((3)) FOR [rental_duration]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT ((4.99)) FOR [rental_rate]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (NULL) FOR [length]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT ((19.99)) FOR [replacement_cost]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (N'G') FOR [rating]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (NULL) FOR [special_features]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[film]  WITH NOCHECK ADD  CONSTRAINT [film$fk_film_language] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([language_id])
GO
ALTER TABLE [dbo].[film] CHECK CONSTRAINT [film$fk_film_language]
GO
ALTER TABLE [dbo].[film]  WITH NOCHECK ADD  CONSTRAINT [film$fk_film_language_original] FOREIGN KEY([original_language_id])
REFERENCES [dbo].[language] ([language_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film] CHECK CONSTRAINT [film$fk_film_language_original]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.film' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'film'
GO

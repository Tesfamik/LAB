USE [Sakila]
GO
/****** Object:  Table [dbo].[film_actor]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film_actor](
	[actor_id] [int] NOT NULL,
	[film_id] [int] NOT NULL,
	[last_update] [datetime] NOT NULL,
 CONSTRAINT [PK_film_actor_actor_id] PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC,
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_film_id]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
CREATE NONCLUSTERED INDEX [idx_fk_film_id] ON [dbo].[film_actor]
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[film_actor] ADD  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[film_actor]  WITH NOCHECK ADD  CONSTRAINT [film_actor$fk_film_actor_actor] FOREIGN KEY([actor_id])
REFERENCES [dbo].[actor] ([actor_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film_actor] CHECK CONSTRAINT [film_actor$fk_film_actor_actor]
GO
ALTER TABLE [dbo].[film_actor]  WITH NOCHECK ADD  CONSTRAINT [film_actor$fk_film_actor_film] FOREIGN KEY([film_id])
REFERENCES [dbo].[film] ([film_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film_actor] CHECK CONSTRAINT [film_actor$fk_film_actor_film]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.film_actor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'film_actor'
GO

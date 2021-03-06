USE [Sakila]
GO
/****** Object:  Table [dbo].[film_text]    Script Date: 09/05/2021 10:16:59 ንጉሆ ሰዓተ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film_text](
	[film_id] [smallint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_film_text_film_id] PRIMARY KEY CLUSTERED 
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sakila.film_text' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'film_text'
GO

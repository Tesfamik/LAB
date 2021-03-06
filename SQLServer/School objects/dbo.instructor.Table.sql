USE [School]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 09/05/2021 10:15:57 ንጉሆ ሰዓተ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[ID] [varchar](5) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[dept_name] [varchar](20) NULL,
	[salary] [numeric](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD FOREIGN KEY([dept_name])
REFERENCES [dbo].[department] ([dept_name])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD CHECK  (([salary]>(29000)))
GO

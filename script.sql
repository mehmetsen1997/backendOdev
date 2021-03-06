USE [WebApp]
GO
/****** Object:  Table [dbo].[OnlineUsers]    Script Date: 1.09.2020 18:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineUsers](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[FK_UserId] [int] NULL,
	[LoginAttemp] [datetime] NULL,
	[LoginTime] [datetime] NULL,
 CONSTRAINT [PK_OnlineUsers] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1.09.2020 18:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](20) NULL,
	[LastName] [nchar](20) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[ActivationCode] [nchar](6) NULL,
	[RegisterDate] [datetime] NULL,
	[Role] [nchar](10) NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OnlineUsers]  WITH CHECK ADD  CONSTRAINT [FK_Login_User] FOREIGN KEY([FK_UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[OnlineUsers] CHECK CONSTRAINT [FK_Login_User]
GO

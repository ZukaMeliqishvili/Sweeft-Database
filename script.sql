USE [SweeftDigital]
GO
/****** Object:  Table [dbo].[pupils]    Script Date: 7/13/2022 8:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pupils](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](30) NULL,
	[lastname] [nvarchar](40) NULL,
	[grade] [tinyint] NULL,
	[sex] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachers]    Script Date: 7/13/2022 8:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](30) NULL,
	[lastname] [nvarchar](40) NULL,
	[subject] [nvarchar](50) NULL,
	[sex] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachers-pupils]    Script Date: 7/13/2022 8:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers-pupils](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teacherId] [int] NULL,
	[pupilId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[teachers-pupils]  WITH CHECK ADD FOREIGN KEY([pupilId])
REFERENCES [dbo].[pupils] ([Id])
GO
ALTER TABLE [dbo].[teachers-pupils]  WITH CHECK ADD FOREIGN KEY([teacherId])
REFERENCES [dbo].[teachers] ([Id])
GO
insert into pupils /****** pupils ცხრილში მონაცემების შეტანა *******/
values (N'გიროგი',N'კომლაძე',7,N'მამრობითი')
Go
insert into pupils
values (N'გიორგი',N'ჯინორია',11,N'მამრობითი')
Go
insert into pupils
values(N'ბარბარე',N'ქადაგიშვილი',7,N'მდედრობითი')
Go
insert into pupils
values(N'გიორგი', N'როსტომაშვილი',12,N'მამრობითი')
Go
insert into teachers /****** teachers ცხრილში მონაცემების შეტანა *******/
values (N'რუსუდან',N'ბოჭორიშვილი',N'მათემატიკა',N'მდედრობითი')
Go
insert into teachers
values(N'ცირა',N'ჯობავა',N'ფიზიკა',N'მდედრობითი')
Go
insert into teachers
values (N'მერაბ',N'გოგია',N'ბიოლოგია',N'მამრობითი')
Go 
insert into [teachers-pupils] /***** teachers-pupils ცხრილში მონაცემების შეტანა******/
values(1,1)
Go 
insert into [teachers-pupils]
values(1,4)
Go 
insert into [teachers-pupils]
values(2,2)
Go 
insert into [teachers-pupils]
values(2,3)
Go 
insert into [teachers-pupils]
values(3,3)
Go
/****** query რომელიც აბრუნებს ყველა მასწავლებლის
		მონაცემს ვინც ასწავლის მოსწავლეს სახელად გიორგი ******/
select distinct t.firstname, t.lastname, t.subject, t.sex 
from [teachers-pupils] as a
	inner join pupils as p
		on a.pupilId = p.Id
	inner join teachers as t
		on a.teacherId = t.Id
where p.firstname=N'გიორგი'
Go
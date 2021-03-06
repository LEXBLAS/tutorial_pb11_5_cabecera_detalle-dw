USE [master]
GO
/****** Object:  Database [bd_tutorial]    Script Date: 22/10/2020 22:43:50 ******/
CREATE DATABASE [bd_tutorial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_tutorial', FILENAME = N'D:\programas\sqlserver_2017\MSSQL14.MSSQLSERVER\MSSQL\DATA\bd_tutorial.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_tutorial_log', FILENAME = N'D:\programas\sqlserver_2017\MSSQL14.MSSQLSERVER\MSSQL\DATA\bd_tutorial_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_tutorial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_tutorial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_tutorial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_tutorial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_tutorial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_tutorial] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_tutorial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd_tutorial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_tutorial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_tutorial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_tutorial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_tutorial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_tutorial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_tutorial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_tutorial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_tutorial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bd_tutorial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_tutorial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_tutorial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_tutorial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_tutorial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_tutorial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_tutorial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_tutorial] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bd_tutorial] SET  MULTI_USER 
GO
ALTER DATABASE [bd_tutorial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_tutorial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_tutorial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_tutorial] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_tutorial] SET DELAYED_DURABILITY = DISABLED 
GO
USE [bd_tutorial]
GO
/****** Object:  Table [dbo].[document]    Script Date: 22/10/2020 22:43:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[document](
	[document_number] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[po_number] [varchar](10) NULL,
	[supplier_code] [char](10) NULL,
	[receive_number] [int] NULL,
 CONSTRAINT [PK_document] PRIMARY KEY CLUSTERED 
(
	[document_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[document_detail]    Script Date: 22/10/2020 22:43:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[document_detail](
	[document_number] [int] NULL,
	[id_detail] [int] IDENTITY(1,1) NOT NULL,
	[product_code] [char](4) NULL,
	[name] [varchar](50) NULL,
	[quantity] [int] NULL,
	[info] [varchar](50) NULL,
 CONSTRAINT [PK_document_detail] PRIMARY KEY CLUSTERED 
(
	[id_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatcol]    Script Date: 22/10/2020 22:43:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pbcatcol](
	[pbc_tnam] [char](129) NOT NULL,
	[pbc_tid] [int] NULL,
	[pbc_ownr] [char](129) NOT NULL,
	[pbc_cnam] [char](129) NOT NULL,
	[pbc_cid] [smallint] NULL,
	[pbc_labl] [varchar](254) NULL,
	[pbc_lpos] [smallint] NULL,
	[pbc_hdr] [varchar](254) NULL,
	[pbc_hpos] [smallint] NULL,
	[pbc_jtfy] [smallint] NULL,
	[pbc_mask] [varchar](31) NULL,
	[pbc_case] [smallint] NULL,
	[pbc_hght] [smallint] NULL,
	[pbc_wdth] [smallint] NULL,
	[pbc_ptrn] [varchar](31) NULL,
	[pbc_bmap] [char](1) NULL,
	[pbc_init] [varchar](254) NULL,
	[pbc_cmnt] [varchar](254) NULL,
	[pbc_edit] [varchar](31) NULL,
	[pbc_tag] [varchar](254) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatedt]    Script Date: 22/10/2020 22:43:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pbcatedt](
	[pbe_name] [varchar](30) NOT NULL,
	[pbe_edit] [varchar](254) NULL,
	[pbe_type] [smallint] NULL,
	[pbe_cntr] [int] NULL,
	[pbe_seqn] [smallint] NOT NULL,
	[pbe_flag] [int] NULL,
	[pbe_work] [char](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatfmt]    Script Date: 22/10/2020 22:43:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pbcatfmt](
	[pbf_name] [varchar](30) NOT NULL,
	[pbf_frmt] [varchar](254) NULL,
	[pbf_type] [smallint] NULL,
	[pbf_cntr] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcattbl]    Script Date: 22/10/2020 22:43:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pbcattbl](
	[pbt_tnam] [char](129) NOT NULL,
	[pbt_tid] [int] NULL,
	[pbt_ownr] [char](129) NOT NULL,
	[pbd_fhgt] [smallint] NULL,
	[pbd_fwgt] [smallint] NULL,
	[pbd_fitl] [char](1) NULL,
	[pbd_funl] [char](1) NULL,
	[pbd_fchr] [smallint] NULL,
	[pbd_fptc] [smallint] NULL,
	[pbd_ffce] [char](18) NULL,
	[pbh_fhgt] [smallint] NULL,
	[pbh_fwgt] [smallint] NULL,
	[pbh_fitl] [char](1) NULL,
	[pbh_funl] [char](1) NULL,
	[pbh_fchr] [smallint] NULL,
	[pbh_fptc] [smallint] NULL,
	[pbh_ffce] [char](18) NULL,
	[pbl_fhgt] [smallint] NULL,
	[pbl_fwgt] [smallint] NULL,
	[pbl_fitl] [char](1) NULL,
	[pbl_funl] [char](1) NULL,
	[pbl_fchr] [smallint] NULL,
	[pbl_fptc] [smallint] NULL,
	[pbl_ffce] [char](18) NULL,
	[pbt_cmnt] [varchar](254) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatvld]    Script Date: 22/10/2020 22:43:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pbcatvld](
	[pbv_name] [varchar](30) NOT NULL,
	[pbv_vald] [varchar](254) NULL,
	[pbv_type] [smallint] NULL,
	[pbv_cntr] [int] NULL,
	[pbv_msg] [varchar](254) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 22/10/2020 22:43:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_code] [char](4) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier]    Script Date: 22/10/2020 22:43:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[supplier_code] [char](10) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_supplier] PRIMARY KEY CLUSTERED 
(
	[supplier_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [pbcatc_x]    Script Date: 22/10/2020 22:43:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [pbcatc_x] ON [dbo].[pbcatcol]
(
	[pbc_tnam] ASC,
	[pbc_ownr] ASC,
	[pbc_cnam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [pbcate_x]    Script Date: 22/10/2020 22:43:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [pbcate_x] ON [dbo].[pbcatedt]
(
	[pbe_name] ASC,
	[pbe_seqn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [pbcatf_x]    Script Date: 22/10/2020 22:43:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [pbcatf_x] ON [dbo].[pbcatfmt]
(
	[pbf_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [pbcatt_x]    Script Date: 22/10/2020 22:43:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [pbcatt_x] ON [dbo].[pbcattbl]
(
	[pbt_tnam] ASC,
	[pbt_ownr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [pbcatv_x]    Script Date: 22/10/2020 22:43:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [pbcatv_x] ON [dbo].[pbcatvld]
(
	[pbv_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[document]  WITH CHECK ADD  CONSTRAINT [FK_document_supplier] FOREIGN KEY([supplier_code])
REFERENCES [dbo].[supplier] ([supplier_code])
GO
ALTER TABLE [dbo].[document] CHECK CONSTRAINT [FK_document_supplier]
GO
ALTER TABLE [dbo].[document_detail]  WITH CHECK ADD  CONSTRAINT [FK_document_detail_document] FOREIGN KEY([document_number])
REFERENCES [dbo].[document] ([document_number])
GO
ALTER TABLE [dbo].[document_detail] CHECK CONSTRAINT [FK_document_detail_document]
GO
ALTER TABLE [dbo].[document_detail]  WITH CHECK ADD  CONSTRAINT [FK_document_detail_product] FOREIGN KEY([product_code])
REFERENCES [dbo].[product] ([product_code])
GO
ALTER TABLE [dbo].[document_detail] CHECK CONSTRAINT [FK_document_detail_product]
GO
USE [master]
GO
ALTER DATABASE [bd_tutorial] SET  READ_WRITE 
GO

CREATE TABLE [dbo].[ProductItems]
(
  [Id] uniqueidentifier NOT NULL PRIMARY KEY  DEFAULT (NEWID()),
  [productName] NVARCHAR(100) NOT NULL,
  [department] NVARCHAR(100) NOT NULL,
  [color] NVARCHAR(100) NOT NULL,
  [price] float NOT NULL,
  [productAdjective] NVARCHAR(100) NOT NULL,
  [productMaterial] NVARCHAR(100) NOT NULL,
  [producttype] NVARCHAR(100) NOT NULL,
)

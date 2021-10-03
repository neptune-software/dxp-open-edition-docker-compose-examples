IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = "planet9")
BEGIN
    EXEC('CREATE DATABASE planet9')
END
GO
USE planet9;
GO
IF NOT EXISTS (Select * from sys.schemas where name = "planet9")
BEGIN
    EXEC('CREATE SCHEMA planet9')
END

USE [testDB2]
GO

DECLARE	@return_value int

EXEC [dbo].[PRP_Insertuser]
		@Id = 14,
		@firtName = N'ram',
		@lastName = N'test',
		@email = N'ram2@yopmail.com',
		@age = 33

SELECT	'Return Value' = @return_value

GO

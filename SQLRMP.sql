USE [testDB2]
GO
/****** Object:  StoredProcedure [dbo].[PRP_Insertuser]    Script Date: 08-04-2023 16:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- EXEC PRP_Insertuser @Id = 0,@firtName = '',@lastName = '',@email = '',@age = 55
ALTER PROCEDURE [dbo].[PRP_Insertuser]
(
	@Id INT,
	@firtName VARCHAR(50),
	@lastName Varchar(50),
	@email varchar(50),
	@age int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @ResultStatus INT = 0;
	DECLARE @Resultmessage VARCHAR(50);

    -- Insert statements for procedure here
  IF(@id = 0)
	BEGIN
		INSERT INTO users2 
		(
			first_name,
			last_name,
			email,
			age
		)
		VALUES
		(
			@firtName,
			@lastName,
			@email,
			@age
		)
		SET @ResultStatus = 1
		SET @Resultmessage = 'Data Added'
	END
  ELSE 
	BEGIN
		UPDATE users2
		SET first_name = @firtName,
			last_name = @lastName,
			age = @age
		WHERE user_id = @Id;

		SET @ResultStatus = 1
		SET @Resultmessage = 'Data Updated'
	END 
	SELECT @ResultStatus AS Status,@Resultmessage AS Message
END

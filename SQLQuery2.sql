SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE PRP_Insertuser
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
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
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
END
GO

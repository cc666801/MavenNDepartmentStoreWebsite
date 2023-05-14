USE [MavenNDepartmentStoreWebsite]
GO

/****** Object:  StoredProcedure [dbo].[UpdateCompaniesToDelisted]    Script Date: 2023/5/15 �W�� 12:13:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateCompaniesToDelisted]
AS
BEGIN 
  -- Update the companies to "�b�d��"
  UPDATE Company
  SET fk_cooperation_status_id = (
    SELECT cooperation_status_id
    FROM cooperation_status
    WHERE cooperation_status_name = '���d'
  )
  WHERE fk_cooperation_status_id IN (
    SELECT cooperation_status_id
    FROM cooperation_status
    WHERE cooperation_status_name = '�b�d��'
  )
  AND company_id NOT IN (
    SELECT DISTINCT cc.fk_company_id
    FROM company_counter cc
    WHERE GETDATE() BETWEEN cc.on_counter_time AND cc.off_counter_time
  )
END;
GO



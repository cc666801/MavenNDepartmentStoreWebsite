USE [MavenNDepartmentStoreWebsite]
GO

/****** Object:  StoredProcedure [dbo].[delete_expired_shopping_carts]    Script Date: 2023/5/15 ¤W¤È 12:13:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[delete_expired_shopping_carts]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @last_updated_time DATETIME;
    DECLARE @shopping_cart_id INT;

    DECLARE cur CURSOR FOR
    SELECT shopping_cart_id, last_updated_time
    FROM shopping_cart
    WHERE last_updated_time < DATEADD(DAY, -3, GETDATE());

    OPEN cur;

    FETCH NEXT FROM cur INTO @shopping_cart_id, @last_updated_time;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DELETE FROM shopping_cart_commodity WHERE fk_shoppingCart_id = @shopping_cart_id;
        DELETE FROM shopping_cart WHERE shopping_cart_id = @shopping_cart_id;
        FETCH NEXT FROM cur INTO @shopping_cart_id, @last_updated_time;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;
GO



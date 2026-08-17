-- Name: Fatemeh Kamrani
-- Course: SQL
-- Exercise: 06
-- Date: 2026-08-11



/*
کد محصولاتی را بدست آورید که تمام واریانت‌های فعال آنها در پلتفرم 
MarketPlace
عرضه می‌شوند

*/

USE master;

-- Drop the table if it already exists (optional)
IF OBJECT_ID('ProductVariants', 'U') IS NOT NULL
    DROP TABLE ProductVariants;

-- Create the table
CREATE TABLE ProductVariants (
    ID INT IDENTITY(1,1) PRIMARY KEY,   -- Auto-incrementing primary key
    ProductCode NVARCHAR(50) NOT NULL,
    ProductVariantCode NVARCHAR(50) NOT NULL UNIQUE, -- Ensures uniqueness
    IsActive BIT NOT NULL,              -- Binary value (0 or 1)
    BusinessType NVARCHAR(20) NOT NULL CHECK (BusinessType IN ('MarketPlace', 'Retail')),
    BusinessCode BIT NOT NULL           -- 0 for MarketPlace, 1 for Retail
);

-- Insert unique data into the table
DECLARE @i INT = 1;
DECLARE @TotalRecords INT = 500;

WHILE @i <= @TotalRecords
BEGIN
    DECLARE @ProductCode NVARCHAR(50) = CONCAT('P', FORMAT((@i + ABS(CHECKSUM(NEWID()))) % 100, '000'));
    DECLARE @VariantCode NVARCHAR(50) = CONCAT(@ProductCode, '-', FORMAT(@i, '000')); -- Ensures uniqueness
    DECLARE @IsActive BIT = ABS(CHECKSUM(NEWID())) % 2;
    DECLARE @BusinessType NVARCHAR(20);
    DECLARE @BusinessCode BIT;

    -- Randomly assign Retail or MarketPlace
    IF (ABS(CHECKSUM(NEWID())) % 2 = 0)
    BEGIN
        SET @BusinessType = 'MarketPlace';
        SET @BusinessCode = 0;
    END
    ELSE
    BEGIN
        SET @BusinessType = 'Retail';
        SET @BusinessCode = 1;
    END;

    -- Insert into the table
    INSERT INTO ProductVariants (ProductCode, ProductVariantCode, IsActive, BusinessType, BusinessCode)
    VALUES (@ProductCode, @VariantCode, @IsActive, @BusinessType, @BusinessCode);

    SET @i = @i + 1;
END;
GO


---------------------------------------------
SELECT ProductCode
FROM ProductVariants
GROUP BY ProductCode
HAVING  COUNT(
    CASE
        WHEN IsActive = 1  AND BusinessType = 'Retail'   THEN 1
   END) =0
   AND COUNT ( CASE WHEN IsActive=1 then 1 
   end ) > 0
-- Task 1

DELIMITER $$

CREATE FUNCTION FormatSeconds(seconds INT) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE sec INT;
    DECLARE result VARCHAR(100);

    SET days = FLOOR(seconds / 86400);
    SET seconds = seconds MOD 86400;
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds MOD 3600;
    SET minutes = FLOOR(seconds / 60);
    SET sec = seconds MOD 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', sec, ' seconds');

    RETURN result;
END $$

DELIMITER ;
SELECT FormatSeconds(123456);

-- ============================================================================================================

-- Task2
SELECT number
FROM (SELECT 1 AS number UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 
      UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS numbers
WHERE number % 2 = 0;
USE little_lemon_db_capstone;
DELIMITER //
CREATE PROCEDURE getMaxQuantity()
BEGIN
    SELECT MenuID, SUM(Quantity) AS TotalQuantity
    FROM Orders
    GROUP BY MenuID
    ORDER BY TotalQuantity DESC
    LIMIT 1;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE addBooking(
    IN p_BookingID INT,
    IN p_BookingDate DATE,
    IN p_TableNumber INT,
    IN p_CustomerID INT
)
BEGIN
    INSERT INTO Bookings(BookingID, BookingDate, TableNumber, CustomerID)
    VALUES (p_BookingID, p_BookingDate, p_TableNumber, p_CustomerID);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateBooking(
    IN p_BookingID INT,
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    UPDATE Bookings
    SET BookingDate = p_BookingDate,
        TableNumber = p_TableNumber
    WHERE BookingID = p_BookingID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE cancelBooking(
    IN p_BookingID INT
)
BEGIN
    DELETE FROM Bookings WHERE BookingID = p_BookingID;
END //
DELIMITER ;


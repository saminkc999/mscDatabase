-- Table Creation
CREATE TABLE Inventory (
    ItemID INTEGER PRIMARY KEY,
    ProductID INTEGER,
    UnitPrice FLOAT,
    QuantitySold INTEGER,
    TotalSales FLOAT,
    MonthID INTEGER CHECK (MonthID BETWEEN 1 AND 12),
    YearID INTEGER
);

-- Insert Values
INSERT INTO Inventory VALUES (10001, 3, 50.5, 20, 1010.0, 1, 2021);
INSERT INTO Inventory VALUES (10002, 4, 75.8, 15, 1137.0, 1, 2021);
INSERT INTO Inventory VALUES (10003, 2, 40.0, 25, 1000.0, 2, 2021);
INSERT INTO Inventory VALUES (10004, 3, 55.0, 30, 1650.0, 3, 2021);
INSERT INTO Inventory VALUES (10005, 5, 65.3, 18, 1175.4, 3, 2022);
INSERT INTO Inventory VALUES (10006, 2, 40.0, 22, 880.0, 4, 2022);
INSERT INTO Inventory VALUES (10007, 4, 75.8, 14, 1061.2, 5, 2022);
INSERT INTO Inventory VALUES (10008, 5, 60.0, 28, 1680.0, 6, 2022);

-- Select Data
SELECT * FROM Inventory;


---------------

-- SQL Query to Determine Total Units Sold per Product per Month per Year


SELECT ProductID, MonthID, YearID, SUM(QuantitySold) AS total_units_sold
FROM Inventory
GROUP BY ProductID, MonthID, YearID
ORDER BY YearID, MonthID, ProductID;
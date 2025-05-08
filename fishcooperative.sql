-- This SQL script creates a a database schema for the fish markerking cooperative system.
CREATE DATABASE fishcooperative;

-- This is for using the created database
USE fishcooperative;

-- This table is for details of the fishermen present in the cooperative.
CREATE TABLE fisherman(
fishermanId INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50), 
address VARCHAR(100),
contact INT
);

CREATE TABLE fishsupplyData(
quantity INT PRIMARY KEY,
priceperunit INT,
catchDate DATE,
FOREIGN KEY(fishermanId) REFERENCES fisherman(fishermanId)
);

-- Table: FishSale
CREATE TABLE FishSale (
saleID INT PRIMARY KEY AUTO_INCREMENT,
saleDate DATE,
saleAmount DECIMAL(10, 2)
FOREIGN KEY(catchDate) REFERENCES fishsupplyData(catchDate)
);

-- Table: Transactions
CREATE TABLE Transactions (
transactionID INT PRIMARY KEY AUTO_INCREMENT,
transactionDate DATETIME,  --  Use DATETIME for timestamp
paymentAmount DECIMAL(10, 2),
FOREIGN KEY (FishermanID) REFERENCES Fisherman(FishermanID),
FOREIGN KEY (SaleID) REFERENCES FishSale(SaleID)
);

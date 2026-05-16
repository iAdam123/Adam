-- ================================================
-- AdamGarage Database Schema
-- ================================================

-- Users Table
CREATE TABLE Users (
      UserName      TEXT(50)    NOT NULL PRIMARY KEY,
      Password      TEXT(255)   NOT NULL,
      Role          TEXT(20)    NOT NULL
  );

-- Sellers Table (linked to Users)
CREATE TABLE Sellers (
      SellerID      AUTOINCREMENT PRIMARY KEY,
      Phone_1       TEXT(20),
      Phone_2       TEXT(20),
      UserName      TEXT(50)    NOT NULL,
      CONSTRAINT fk_Sellers_Users FOREIGN KEY (UserName) REFERENCES Users(UserName)
  );

-- Providers Table
CREATE TABLE Providers (
      ID            AUTOINCREMENT PRIMARY KEY
  );

-- Customers Table
CREATE TABLE Customers (
      CustomerID    AUTOINCREMENT PRIMARY KEY,
      FirstName     TEXT(50)    NOT NULL,
      LastName      TEXT(50)    NOT NULL,
      Phone         TEXT(20),
      Email         TEXT(100),
      Address       TEXT(255),
      Gender        TEXT(10),
      BirthDate     DATE
  );

-- Cars Table
CREATE TABLE Cars (
      Car_Id        AUTOINCREMENT PRIMARY KEY,
      Car_Model     TEXT(50),
      Car_Type      TEXT(50),
      Car_Name      TEXT(100),
      Plate_Number  TEXT(20),
      Engine        TEXT(50),
      Color         TEXT(30),
      Year          INTEGER,
      Status        TEXT(20),
      Seats         INTEGER,
      Horses        INTEGER,
      Transmission  TEXT(20),
      Fuel_Type     TEXT(20),
      Mileage       DOUBLE,
      Price         CURRENCY
  );

-- Sales Table
CREATE TABLE Sales (
      SaleID          AUTOINCREMENT PRIMARY KEY,
      SaleDate        DATE,
      SalePrice       CURRENCY,
      PaymentMethod   TEXT(50),
      SellerID        INTEGER,
      CustomerID      INTEGER,
      CarID           INTEGER,
      Notes           MEMO,
      Discount        CURRENCY,
      CONSTRAINT fk_Sales_Sellers   FOREIGN KEY (SellerID)   REFERENCES Sellers(SellerID),
      CONSTRAINT fk_Sales_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
      CONSTRAINT fk_Sales_Cars      FOREIGN KEY (CarID)      REFERENCES Cars(Car_Id)
  );

-- Services Table
CREATE TABLE Services (
      ServiceID       AUTOINCREMENT PRIMARY KEY,
      CarID           INTEGER,
      ServiceDate     DATE,
      PerformedBy     TEXT(100),
      PartName        TEXT(100),
      Price           CURRENCY,
      Comments        MEMO,
      CONSTRAINT fk_Services_Cars FOREIGN KEY (CarID) REFERENCES Cars(Car_Id)
  );

-- Car_Sellings Table (links Cars, Sellers, Providers)
CREATE TABLE Car_Sellings (
      ID              AUTOINCREMENT PRIMARY KEY,
      CarID           INTEGER,
      SellerID        INTEGER,
      ProviderID      INTEGER,
      CONSTRAINT fk_CarSellings_Cars      FOREIGN KEY (CarID)      REFERENCES Cars(Car_Id),
      CONSTRAINT fk_CarSellings_Sellers   FOREIGN KEY (SellerID)   REFERENCES Sellers(SellerID),
      CONSTRAINT fk_CarSellings_Providers FOREIGN KEY (ProviderID) REFERENCES Providers(ID)
  );

-- Test_Drive Table
CREATE TABLE Test_Drive (
      TestDriveID     AUTOINCREMENT PRIMARY KEY,
      CarID           INTEGER,
      CustomerID      INTEGER,
      Time            DATETIME,
      Rate            INTEGER,
      FeedBack        MEMO,
      SellerID        INTEGER,
      CONSTRAINT fk_TestDrive_Cars      FOREIGN KEY (CarID)      REFERENCES Cars(Car_Id),
      CONSTRAINT fk_TestDrive_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
      CONSTRAINT fk_TestDrive_Sellers   FOREIGN KEY (SellerID)   REFERENCES Sellers(SellerID)
  );

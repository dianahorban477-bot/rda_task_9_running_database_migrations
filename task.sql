--liquibase formatted sql

--changeset mate.acamemy:0 labels:0.0.1
CREATE DATABASE IF NOT EXISTS ShopDB;

--changeset mate.acamemy:1 labels:0.0.1
CREATE TABLE ShopDB.Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);
--rollback DROP TABLE ShopDB.Countries;

--changeset mate.acamemy:2 labels:0.0.1
CREATE TABLE ShopDB.Products (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);
--rollback DROP TABLE ShopDB.Products;

--changeset mate.acamemy:3 labels:0.0.1
CREATE TABLE ShopDB.Warehouses (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES ShopDB.Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
--rollback DROP TABLE ShopDB.Warehouses;

--changeset mate.acamemy:4 labels:0.0.1
CREATE TABLE ShopDB.ProductInventory (
    ID INT,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES ShopDB.Products(ID) ON DELETE NO ACTION,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES ShopDB.Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
--rollback DROP TABLE ShopDB.ProductInventory;

--changeset mate.acamemy:5 labels:0.0.2
CREATE TABLE ShopDB.Users (
    ID INT AUTO_INCREMENT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(200),
    PRIMARY KEY (ID)
);
--rollback DROP TABLE ShopDB.Users;

--changeset mate.acamemy:6 labels:0.0.3
CREATE INDEX idx_users_email ON ShopDB.Users (Email);
--rollback DROP INDEX idx_users_email ON ShopDB.Users;

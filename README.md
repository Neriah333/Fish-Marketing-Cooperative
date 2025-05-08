# Fish-Marketing-Cooperative
Database for my Fish Marketing Cooperative System

     DATABASE FOR FISH MARKETING COOPERATIVE SYSTEM

A relational database designed to manage fisherman details, fish supply data, fish sale and transactions made for a Fish Market Cooperative.This project includes well-structured tables, relationships, and sample data for testing and development.

Data Structure
The database consists of the following tables:
1.Fisherman
| Column Name    | Data Type    | Description                          |
| -------------- | ------------ | ------------------------------------ |
| `fisherman_id` | INT (PK)     | Unique identifier for each fisherman |
| `name`         | VARCHAR(100) | Full name of the fisherman           |
| `address`      | VARCHAR(150) | Residential or working address       |
| `contact_info` | VARCHAR(100) | Contact number or email              |
2.Fish Supply Data
| Column Name      | Data Type     | Description                          |
| ---------------- | ------------- | ------------------------------------ |
| `fisherman_id`   | INT (FK)      | References `Fisherman(fisherman_id)` |
| `quantity`       | DECIMAL(10,2) | Quantity of fish supplied (in kg)    |
| `price_per_unit` | DECIMAL(10,2) | Price per kg or unit of fish         |
| `catch_date`     | DATE          | Date when the fish was caught        |
3.Fish sale
| Column Name   | Data Type     | Description                                 |
| ------------- | ------------- | ------------------------------------------- |
| `sale_id`     | INT (PK)      | Unique ID for the sale                      |
| `catch_date`  | DATE          | Date of fish catch associated with the sale |
| `sale_date`   | DATE          | Date when the fish was sold                 |
| `sale_amount` | DECIMAL(10,2) | Total amount earned from the sale           |
4.Transactions
| Column Name        | Data Type     | Description                            |
| ------------------ | ------------- | -------------------------------------- |
| `transaction_id`   | INT (PK)      | Unique ID for the transaction          |
| `transaction_date` | DATE          | Date when the transaction was recorded |
| `fisherman_id`     | INT (FK)      | References `Fisherman(fisherman_id)`   |
| `sale_id`          | INT (FK)      | References `Fish_Sale(sale_id)`        |
| `payment_amount`   | DECIMAL(10,2) | Amount paid in the transaction         |

# How to run/setup the project (or import SQL)
🚀 How to Set Up and Run the Project
🔧 Requirements
MySQL Server or compatible DBMS 

SQL script file: fishing_project.sql 

📥 Steps to Import SQL and Run the Project
✅ Option 1: Using MySQL Workbench
1.Open MySQL Workbench.

2.Connect to your local or remote database server.

3.Click File > Open SQL Script and select fishing_project.sql.

4.Press Execute (lightning bolt icon) to run the script and create all tables and data.

✅ Option 2: Using Command Line
1.Open your terminal or command prompt.

2.Login to MySQL:
mysql -u your_username -p

3.Select or create your database:
CREATE DATABASE fishing_db;
USE fishing_db;

4.Import the SQL file:
SOURCE path/to/fishing_project.sql;


ERD
Fisherman
-------------
FishermanID (PK)
Name
Address
ContactInfo

    |
    | 1
    |——< supplies
          Fish_Supply_Data
          ---------------------
          FishermanID (FK)
          Quantity
          PricePerUnit
          CatchDate

    |
    | 1
    |——< does
          Transactions
          ---------------------
          TransactionID (PK)
          TransactionDate
          FishermanID (FK)
          SaleID (FK)
          PaymentAmount

                        ^
                        |
                      ∞ |
                Fish_Sale
                -----------------
                SaleID (PK)
                CatchDate
                SaleDate
                SaleAmount
🔗 Relationships
Fisherman 1 ↔ ∞ Fish_Supply_Data
A fisherman can have multiple supply records.

Fisherman 1 ↔ ∞ Transactions
A fisherman can be involved in multiple transactions.

Fish_Sale 1 ↔ ∞ Transactions
A fish sale can be part of multiple transactions.
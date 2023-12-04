DROP DATABASE IF EXISTS bacchus;
CREATE DATABASE bacchus;
USE bacchus;


CREATE TABLE Suppliers(
                          supplier_id INT NOT NULL,
                          supplier_name VARCHAR(50) NOT NULL,
                          PRIMARY KEY(supplier_id)

                      );

CREATE TABLE Supply(
                       supply_id INT NOT NULL,
                       supply_name VARCHAR(50) NOT NULL,
                       supply_quantity INT NOT NULL,
                       PRIMARY KEY(supply_id));


CREATE TABLE Shipments
(
    shipment_id     INT NOT NULL,
    purchase_id     INT NOT NULL,
    supply_id       INT NOT NULL,
    supply_quantity INT NOT NULL,
    expected_date   INT NOT NULL,
    actual_date     INT NOT NULL,
    supplier_id     INT NOT NULL,
    PRIMARY KEY (shipment_id),
    CONSTRAINT FOREIGN KEY (supply_id) REFERENCES Supply (supply_id),
    CONSTRAINT FOREIGN KEY (supplier_id) REFERENCES Suppliers (supplier_id)
);


CREATE TABLE Employees(
                          employee_id INT NOT NULL,
                          firstname VARCHAR(50) NOT NULL,
                          lastname VARCHAR(50) NOT NULL,
                          position VARCHAR(50) NOT NULL,
                          PRIMARY KEY(employee_id)
                          );

CREATE TABLE Hours(
                      record_id INT NOT NULL,
                      employee_id INT NOT NULL,
                      hours_worked INT NOT NULL,
                      fiscal_week INT NOT NULL,
                      PRIMARY KEY(record_id),
                      CONSTRAINT FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
                  );

CREATE TABLE Wines(
                      wine_id INT NOT NULL,
                      name VARCHAR(50) NOT NULL,
                      onhand INT NOT NULL,
                      price INT NOT NULL,
                      PRIMARY KEY(wine_id));

CREATE TABLE Distributer(
                            distributer_id INT NOT NULL,
                            distributer_name VARCHAR(50) NOT NULL,
                            PRIMARY KEY(distributer_id));
CREATE TABLE Receipts(
                         receipt_number INT NOT NULL,
                         tracking_number INT NOT NULL,
                         expected_date INT NOT NULL,
                         actual_date INT NOT NULL,
                         PRIMARY KEY(receipt_number));
CREATE TABLE Sales(
                      sale_id INT NOT NULL,
                      quantity_sold INT NOT NULL,
                      wine_id INT NOT NULL,
                      distributer_id INT NOT NULL,
                      receipt_number INT NOT NULL,
                      PRIMARY KEY(sale_id),
                      CONSTRAINT FOREIGN KEY (wine_id) REFERENCES wines(wine_id),
                      CONSTRAINT FOREIGN KEY (distributer_id) REFERENCES distributer(distributer_id),
                      CONSTRAINT FOREIGN KEY (receipt_number) REFERENCES receipts(receipt_number));

INSERT INTO suppliers(
    supplier_name)
VALUES('Bottle Boys');

INSERT INTO suppliers(
    supplier_name)
VALUES('Box Brothers');

INSERT INTO suppliers(
    supplier_name)
VALUES('Vats the Tuber');

INSERT INTO shipments(
    purchase_id,
    supply_id,
    supply_quantity,
    expected_date,
    actual_date,
        supplier_id)
VALUES( 1, 1, '20', NULL, '12-25-2023', NULL);

INSERT INTO supply(
    supply_id,
    supply_name,
    supply_quantity)
VALUES(NULL,'Bottles','50');

INSERT INTO employees(
    firstname,
    lastname,
    position)
VALUES( 'Janet', 'Collins', 'Head of Finance');

INSERT INTO employees(
    firstname,
    lastname,
    position)
VALUES('Roz', 'Murphy', 'Head of Marketing');

INSERT INTO employees(
    firstname,
    lastname,
    position)
VALUES( 'Bob', 'Ulrich', 'Assistant to Roz');

INSERT INTO employees(
    firstname,
    lastname,
    position)
VALUES('Maria', 'Costanza', 'Head of Distribution');

INSERT INTO employees(

    firstname,
    lastname,
    position)
VALUES(NULL, 'Stan', 'Bacchus', 'Owner');

INSERT INTO employees(
    employee_id,
    firstname,
    lastname,
    position)
VALUES(NULL, 'Davis', 'Bacchus', 'Owner');

INSERT INTO hours(
    record_id,
    employee_id,
    hours_worked,
    fiscal_week)
VALUES(NULL, NULL, '36', '44');

INSERT INTO wines(
    wine_id,
    name,
    onhand,
    price)
VALUES(NULL, 'Merlot', '200', '$9.99');

INSERT INTO wines(
    wine_id,
    name,
    onhand,
    price)
VALUES(NULL, 'Cabernet', '350', '$13.99');

INSERT INTO wines(
    wine_id,
    name,
    onhand,
    price)
VALUES(NULL, 'Chablis', '150', '$19.99');

INSERT INTO wines(
    wine_id,
    name,
    onhand,
    price)
VALUES(NULL, 'Chardonnay', '300', '$19.99');

INSERT INTO distributer(
    distributer_id,
    distributer_name)
VALUES(NULL, 'Publix');

INSERT INTO sales(
    sale_id,
    quantity_sold,
    wine_id,
    distributer_id,
    receipt_number)
VALUES(NULL, '10', NULL, NULL, NULL);

INSERT INTO receipts(
    receipt_number,
    tracking_number,
    expected_date,
    actual_date)
VALUES(NULL, NULL, '12-03-2023', NULL);
-- Catalogue table
CREATE TABLE Catalogue (
    Serial_No INT PRIMARY KEY,
    Manufacturer VARCHAR(25),
    Date_of_Manufacturing DATE,
    Model VARCHAR(25),
    Type VARCHAR(25)
);

-- Maintenance table
CREATE TABLE Maintenance (
    ID INT PRIMARY KEY,
    Type VARCHAR(25),
    Date_of_Entry DATE,
    Date_of_Exit DATE
);

-- Procurement table
CREATE TABLE Procurement (
    Invoice_ID INT PRIMARY KEY,
    Replacement_Parts VARCHAR(25),
    Vendor_Selection VARCHAR(25),
    ID INT,
    FOREIGN KEY (ID) REFERENCES Maintenance(ID)
);

-- Usage History table
CREATE TABLE Usage_History (
    Serial_No INT,
    "Date" DATE,
    Month INT,
    Year INT,
    Department VARCHAR(25),
    FOREIGN KEY (Serial_No) REFERENCES Catalogue(Serial_No)
);

-- Availability table
CREATE TABLE Availability (
    Serial_No INT,
    ID INT,
    Issue VARCHAR(25),
    Status VARCHAR(25),
    PRIMARY KEY (Serial_No, ID),
    FOREIGN KEY (Serial_No) REFERENCES Catalogue(Serial_No),
    FOREIGN KEY (ID) REFERENCES Maintenance(ID)
);

-- Reports table
CREATE TABLE Reports (
    Utilization VARCHAR(25),
    Compliance_Metrics VARCHAR(25),
    Invoice_ID INT,
    PRIMARY KEY (Utilization, Compliance_Metrics),
    FOREIGN KEY (Invoice_ID) REFERENCES Procurement(Invoice_ID)
);

-- Analysis table
CREATE TABLE Analysis (
    ID INT,
    Utilization VARCHAR(25),
    Compliance_Metrics VARCHAR(25),
    PRIMARY KEY (ID, Utilization, Compliance_Metrics),
    FOREIGN KEY (ID) REFERENCES Maintenance(ID)
);

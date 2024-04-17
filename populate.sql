-- Catalogue table
INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (101, 'Siemens Healthineers', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'ACUSON X300', 'Ultrasound Machine');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (102, 'Philips Healthcare', TO_DATE('2022-02-15', 'YYYY-MM-DD'), 'IntelliVue MX700', 'Patient Monitor');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (103, 'GE Healthcare', TO_DATE('2022-03-20', 'YYYY-MM-DD'), 'SIGNA Artist', 'MRI Machine');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (104, 'Siemens Healthineers', TO_DATE('2022-04-10', 'YYYY-MM-DD'), 'MAGNETOM Lumina', 'MRI Machine');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (105, 'Philips Healthcare', TO_DATE('2022-05-25', 'YYYY-MM-DD'), 'Azurion 7', 'C-Arm');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (106, 'GE Healthcare', TO_DATE('2022-06-30', 'YYYY-MM-DD'), 'Vscan Extend', 'Portable Ultrasound');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (107, 'Siemens Healthineers', TO_DATE('2022-07-15', 'YYYY-MM-DD'), 'ACUSON Juniper', 'Ultrasound Machine');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (108, 'Philips Healthcare', TO_DATE('2022-08-20', 'YYYY-MM-DD'), 'EPIQ Elite', 'Ultrasound Machine');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (109, 'GE Healthcare', TO_DATE('2022-09-05', 'YYYY-MM-DD'), 'Vivid E95', 'Echocardiography Machine');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (110, 'Siemens Healthineers', TO_DATE('2022-10-10', 'YYYY-MM-DD'), 'MAGNETOM Altea', 'MRI Machine');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (111, 'Philips Healthcare', TO_DATE('2022-11-15', 'YYYY-MM-DD'), 'Avalon CL', 'Fetal Monitor');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (112, 'GE Healthcare', TO_DATE('2022-12-20', 'YYYY-MM-DD'), 'Optima XR240amx', 'X-Ray Machine');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (113, 'Siemens Healthineers', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'ACUSON P500', 'Portable Ultrasound');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (114, 'Philips Healthcare', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 'HeartStart MRx', 'Defibrillator');

INSERT INTO Catalogue (Serial_No, Manufacturer, Date_of_Manufacturing, Model, Type)
VALUES (115, 'GE Healthcare', TO_DATE('2023-03-20', 'YYYY-MM-DD'), 'LOGIQ E10', 'Ultrasound Machine');


-- Maintenance table
INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (1, 'Routine Checkup', TO_DATE('2022-01-05', 'YYYY-MM-DD'), TO_DATE('2022-01-06', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (2, 'Emergency Repair', TO_DATE('2022-02-20', 'YYYY-MM-DD'), TO_DATE('2022-02-21', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (3, 'Calibration', TO_DATE('2022-03-25', 'YYYY-MM-DD'), TO_DATE('2022-03-26', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (4, 'Software Update', TO_DATE('2022-04-12', 'YYYY-MM-DD'), TO_DATE('2022-04-13', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (5, 'Repair', TO_DATE('2022-05-30', 'YYYY-MM-DD'), TO_DATE('2022-05-31', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (6, 'Preventive Maintenance', TO_DATE('2022-06-18', 'YYYY-MM-DD'), TO_DATE('2022-06-19', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (7, 'Upgrade', TO_DATE('2022-07-22', 'YYYY-MM-DD'), TO_DATE('2022-07-23', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (8, 'Emergency Checkup', TO_DATE('2022-08-10', 'YYYY-MM-DD'), TO_DATE('2022-08-11', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (9, 'Cleaning', TO_DATE('2022-09-15', 'YYYY-MM-DD'), TO_DATE('2022-09-16', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (10, 'Battery Replacement', TO_DATE('2022-10-28', 'YYYY-MM-DD'), TO_DATE('2022-10-29', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (11, 'Calibration', TO_DATE('2022-09-05', 'YYYY-MM-DD'), TO_DATE('2022-09-06', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (12, 'Repair', TO_DATE('2022-10-15', 'YYYY-MM-DD'), TO_DATE('2022-10-16', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (13, 'Preventive Maintenance', TO_DATE('2022-11-20', 'YYYY-MM-DD'), TO_DATE('2022-11-21', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (14, 'Calibration', TO_DATE('2022-12-05', 'YYYY-MM-DD'), TO_DATE('2022-12-06', 'YYYY-MM-DD'));

INSERT INTO Maintenance (ID, Type, Date_of_Entry, Date_of_Exit)
VALUES (15, 'Repair', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-16', 'YYYY-MM-DD'));


-- Procurement table
INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1001, 'Probe', 'Medical Supplies Co.', 1);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1002, 'Monitor', 'Healthcare Solutions Ltd.', 2);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1003, 'Coils', 'MedTech Corp.', 3);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1004, 'Battery', 'Equipment Inc.', 4);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1005, 'Cables', 'ServeMed', 5);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1006, 'Sensors', 'MediTech Solutions', 6);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1007, 'Printer', 'Health Equipment Supplier', 7);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1008, 'Lenses', 'MediOptics', 8);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1009, 'Fluids', 'MediChemicals', 9);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1010, 'Probes', 'MediProbe Systems', 10);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1011, 'Sensors', 'MediTech Solutions', 14);

INSERT INTO Procurement (Invoice_ID, Replacement_Parts, Vendor_Selection, ID)
VALUES (1012, 'Printer', 'Health Equipment Supplier', 15);


-- Usage History table
INSERT INTO Usage_History (Serial_No, "Date", Month, Year, Department)
VALUES (101, TO_DATE('2022-01-10', 'YYYY-MM-DD'), 1, 2022, 'Radiology');

INSERT INTO Usage_History (Serial_No, "Date", Month, Year, Department)
VALUES (102, TO_DATE('2022-02-20', 'YYYY-MM-DD'), 2, 2022, 'Intensive Care Unit');

INSERT INTO Usage_History (Serial_No, "Date", Month, Year, Department)
VALUES (103, TO_DATE('2022-03-25', 'YYYY-MM-DD'), 3, 2022, 'Orthopedics');

INSERT INTO Usage_History (Serial_No, "Date", Month, Year, Department)
VALUES (104, TO_DATE('2022-04-15', 'YYYY-MM-DD'), 4, 2022, 'Cardiology');

INSERT INTO Usage_History (Serial_No, "Date", Month, Year, Department)
VALUES (105, TO_DATE('2022-05-20', 'YYYY-MM-DD'), 5, 2022, 'Emergency Department');

INSERT INTO Usage_History (Serial_No, "Date", Month, Year, Department)
VALUES (106, TO_DATE('2022-06-30', 'YYYY-MM-DD'), 6, 2022, 'Outpatient Clinic');

INSERT INTO Usage_History (Serial_No, "Date", Month, Year, Department)
VALUES (107, TO_DATE('2022-07-10', 'YYYY-MM-DD'), 7, 2022, 'Surgery');

INSERT INTO Usage_History (Serial_No, "Date", Month, Year, Department)
VALUES (108, TO_DATE('2022-08-25', 'YYYY-MM-DD'), 8, 2022, 'Neurology');

INSERT INTO Usage_History (Serial_No, "Date", Month, Year, Department)
VALUES (109, TO_DATE('2022-09-10', 'YYYY-MM-DD'), 9, 2022, 'Pediatrics');

INSERT INTO Usage_History (Serial_No, "Date", Month, Year, Department)
VALUES (110, TO_DATE('2022-10-20', 'YYYY-MM-DD'), 10, 2022, 'Laboratory');


-- Availability table
INSERT INTO Availability (Serial_No, ID, Issue, Status)
VALUES (104, 11, 'Calibration Required', 'Functional');

INSERT INTO Availability (Serial_No, ID, Issue, Status)
VALUES (105, 12, 'Display Issue', 'Under Maintenance');

INSERT INTO Availability (Serial_No, ID, Issue, Status)
VALUES (106, 13, 'Routine Maintenance', 'Functional');

INSERT INTO Availability (Serial_No, ID, Issue, Status)
VALUES (107, 14, 'Calibration Required', 'Functional');

INSERT INTO Availability (Serial_No, ID, Issue, Status)
VALUES (108, 15, 'Display Issue', 'Under Maintenance');


-- Reports table
INSERT INTO Reports (Utilization, Compliance_Metrics, Invoice_ID)
VALUES ('80%', 'Compliant', 1006);

INSERT INTO Reports (Utilization, Compliance_Metrics, Invoice_ID)
VALUES ('75%', 'Compliant', 1007);

INSERT INTO Reports (Utilization, Compliance_Metrics, Invoice_ID)
VALUES ('85%', 'Compliant', 1008);

INSERT INTO Reports (Utilization, Compliance_Metrics, Invoice_ID)
VALUES ('90%', 'Compliant', 1011);

INSERT INTO Reports (Utilization, Compliance_Metrics, Invoice_ID)
VALUES ('85%', 'Non-Compliant', 1012);


-- Analysis table
INSERT INTO Analysis (ID, Utilization, Compliance_Metrics)
VALUES (11, 'High', 'Compliant');

INSERT INTO Analysis (ID, Utilization, Compliance_Metrics)
VALUES (12, 'Medium', 'Compliant');

INSERT INTO Analysis (ID, Utilization, Compliance_Metrics)
VALUES (13, 'Low', 'Compliant');

INSERT INTO Analysis (ID, Utilization, Compliance_Metrics)
VALUES (14, 'High', 'Compliant');

INSERT INTO Analysis (ID, Utilization, Compliance_Metrics)
VALUES (15, 'Medium', 'Compliant');


commit;

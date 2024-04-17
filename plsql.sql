CREATE OR REPLACE PACKAGE Equipment_Maintenance AS
    -- Procedures
    PROCEDURE Generate_Procurement_Summary_Report;
    PROCEDURE Update_Usage_History_Department;
    PROCEDURE Generate_Availability_Status_Report;
    PROCEDURE Generate_Maintenance_Schedule;
    PROCEDURE Update_Availability_Status;
    PROCEDURE Update_Analysis_Data;
    PROCEDURE Generate_Detailed_Maintenance_Report (p_ID INT);

    -- Functions
    FUNCTION Calculate_Average_Utilization RETURN NUMBER;
    FUNCTION Calculate_Total_Downtime (p_ID INT) RETURN INT;
    FUNCTION Calculate_Equipment_Age (p_Serial_No INT) RETURN NUMBER;

    -- Custom Exceptions
    Equipment_Not_Found EXCEPTION;
    Maintenance_Record_Not_Found EXCEPTION;
    Procurement_Record_Not_Found EXCEPTION;
    Analysis_Record_Not_Found EXCEPTION;
    Invalid_Status EXCEPTION;

    PRAGMA EXCEPTION_INIT(Equipment_Not_Found, -20001);
    PRAGMA EXCEPTION_INIT(Maintenance_Record_Not_Found, -20002);
    PRAGMA EXCEPTION_INIT(Procurement_Record_Not_Found, -20003);
    PRAGMA EXCEPTION_INIT(Analysis_Record_Not_Found, -20004);
    PRAGMA EXCEPTION_INIT(Invalid_Status, -20005);

END Equipment_Maintenance;
/

CREATE OR REPLACE PACKAGE BODY Equipment_Maintenance AS
    PROCEDURE Generate_Procurement_Summary_Report IS
    BEGIN
        FOR rec IN (SELECT Invoice_ID, Replacement_Parts, Vendor_Selection FROM Procurement) LOOP
            DBMS_OUTPUT.PUT_LINE(rec.Invoice_ID || ' | ' || rec.Replacement_Parts || ' | ' || rec.Vendor_Selection);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE Equipment_Not_Found;
        WHEN others THEN
            RAISE;
    END Generate_Procurement_Summary_Report;

    PROCEDURE Update_Usage_History_Department IS
    BEGIN
        FOR rec IN (SELECT Serial_No FROM Usage_History) LOOP
            UPDATE Usage_History
            SET Department = 'New Department'
            WHERE Serial_No = rec.Serial_No;
            DBMS_OUTPUT.PUT_LINE('Updated Department for Serial No ' || rec.Serial_No);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE Maintenance_Record_Not_Found;
        WHEN others THEN
            RAISE;
    END Update_Usage_History_Department;

    PROCEDURE Generate_Availability_Status_Report IS
    BEGIN
        FOR rec IN (SELECT Serial_No, Status FROM Availability) LOOP
            DBMS_OUTPUT.PUT_LINE(rec.Serial_No || ' | ' || rec.Status);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE Procurement_Record_Not_Found;
        WHEN others THEN
            RAISE;
    END Generate_Availability_Status_Report;

    PROCEDURE Generate_Maintenance_Schedule IS
    BEGIN
        FOR rec IN (SELECT DISTINCT ID FROM Maintenance) LOOP
            DBMS_OUTPUT.PUT_LINE('Maintenance schedule for ID : ' || rec.ID);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE Analysis_Record_Not_Found;
        WHEN others THEN
            RAISE;
    END Generate_Maintenance_Schedule;

    PROCEDURE Update_Availability_Status IS
    BEGIN
        FOR rec IN (SELECT ID FROM Availability WHERE STATUS = 'Functional') LOOP
            DECLARE
                v_maintenance_exists NUMBER;
            BEGIN
                -- Check if equipment has ongoing maintenance
                SELECT COUNT(*) INTO v_maintenance_exists 
                FROM Maintenance
                WHERE ID = rec.ID
                AND Date_of_Exit IS NULL;
                IF v_maintenance_exists > 0 THEN
                    UPDATE Availability SET STATUS = 'Under Maintenance' WHERE ID = rec.ID;
                    DBMS_OUTPUT.PUT_LINE('Availability status updated for ID ' || rec.ID || ' to Under Maintenance');
                END IF;
            END;
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE Invalid_Status;
        WHEN others THEN
            RAISE;
    END Update_Availability_Status;

    PROCEDURE Update_Analysis_Data IS
    BEGIN
        FOR rec IN (SELECT * FROM Analysis) LOOP
            UPDATE Analysis SET Utilization = 'New Utilization Data', Compliance_Metrics = 'New Compliance Metrics' WHERE ID = rec.ID;
            DBMS_OUTPUT.PUT_LINE('Analysis data updated for ID ' || rec.ID);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE Invalid_Status;
        WHEN others THEN
            RAISE;
    END Update_Analysis_Data;

    PROCEDURE Generate_Detailed_Maintenance_Report (p_ID INT) IS
    BEGIN
        FOR rec IN (SELECT ID, Type, Date_of_Entry, Date_of_Exit FROM Maintenance WHERE ID = p_ID) LOOP
            DBMS_OUTPUT.PUT_LINE('--- Detailed Maintenance Report ---');
            DBMS_OUTPUT.PUT_LINE('Maintenance ID: ' || rec.ID || ', Type: ' || rec.Type ||
                                ', Date of Entry: ' || TO_CHAR(rec.Date_of_Entry, 'DD-MON-YYYY') ||
                                ', Date of Exit: ' || TO_CHAR(rec.Date_of_Exit, 'DD-MON-YYYY'));

            -- Retrieve and display procurement details
            FOR proc_rec IN (SELECT Invoice_ID, Replacement_Parts, Vendor_Selection FROM Procurement WHERE ID = rec.ID) LOOP
                DBMS_OUTPUT.PUT_LINE('   Procurement Details - Invoice ID: ' || proc_rec.Invoice_ID ||
                                    ', Replacement Parts: ' || proc_rec.Replacement_Parts ||
                                    ', Vendor Selection: ' || proc_rec.Vendor_Selection);
            END LOOP;
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE Maintenance_Record_Not_Found;
        WHEN others THEN
            RAISE;
    END Generate_Detailed_Maintenance_Report;

    FUNCTION Calculate_Average_Utilization RETURN NUMBER IS
        v_Total_Utilization NUMBER := 0;
        v_Count NUMBER := 0;
    BEGIN
        FOR rec IN (SELECT Utilization FROM Reports) LOOP
            v_Total_Utilization := v_Total_Utilization + TO_NUMBER(REPLACE(rec.Utilization, '%', ''));
            v_Count := v_Count + 1;
        END LOOP;
        RETURN v_Total_Utilization / v_Count;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE Analysis_Record_Not_Found;
        WHEN others THEN
            RAISE;
    END Calculate_Average_Utilization;

    FUNCTION Calculate_Total_Downtime (p_ID INT) RETURN INT IS
        v_Total_Downtime INT:=0;
    BEGIN
        FOR rec IN (SELECT Date_of_Entry, Date_of_Exit FROM Maintenance WHERE ID = p_ID) LOOP
            v_Total_Downtime := v_Total_Downtime + (rec.Date_of_Exit - rec.Date_of_Entry);
        END LOOP;
        RETURN v_Total_Downtime;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE Maintenance_Record_Not_Found;
        WHEN others THEN
            RAISE;
    END Calculate_Total_Downtime;

    FUNCTION Calculate_Equipment_Age (p_Serial_No INT) RETURN NUMBER IS
        v_Age NUMBER;
    BEGIN
        SELECT EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM Date_of_Manufacturing)
        INTO v_Age
        FROM Catalogue
        WHERE Serial_No = p_Serial_No;
        RETURN v_Age;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE Equipment_Not_Found;
        WHEN others THEN
            RAISE;
    END Calculate_Equipment_Age;

END Equipment_Maintenance;
/

SET SERVEROUTPUT ON;
BEGIN
    BEGIN
        Equipment_Maintenance.Generate_Procurement_Summary_Report;
    EXCEPTION
        WHEN Equipment_Maintenance.Equipment_Not_Found THEN
            DBMS_OUTPUT.PUT_LINE('Error: Equipment not found.');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error: Unexpected error occurred.');
    END;

    BEGIN
        Equipment_Maintenance.Update_Usage_History_Department;
    EXCEPTION
        WHEN Equipment_Maintenance.Maintenance_Record_Not_Found THEN
            DBMS_OUTPUT.PUT_LINE('Error: Maintenance record not found.');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error: Unexpected error occurred.');
    END;

    BEGIN
        Equipment_Maintenance.Generate_Availability_Status_Report;
    EXCEPTION
        WHEN Equipment_Maintenance.Procurement_Record_Not_Found THEN
            DBMS_OUTPUT.PUT_LINE('Error: Procurement record not found.');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error: Unexpected error occurred.');
    END;

    BEGIN
        Equipment_Maintenance.Generate_Maintenance_Schedule;
    EXCEPTION
        WHEN Equipment_Maintenance.Analysis_Record_Not_Found THEN
            DBMS_OUTPUT.PUT_LINE('Error: Analysis record not found.');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error: Unexpected error occurred.');
    END;

    BEGIN
        Equipment_Maintenance.Update_Availability_Status;
    EXCEPTION
        WHEN Equipment_Maintenance.Invalid_Status THEN
            DBMS_OUTPUT.PUT_LINE('Error: Invalid status.');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error: Unexpected error occurred.');
    END;

    BEGIN
        Equipment_Maintenance.Update_Analysis_Data;
    EXCEPTION
        WHEN Equipment_Maintenance.Invalid_Status THEN
            DBMS_OUTPUT.PUT_LINE('Error: Invalid status.');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error: Unexpected error occurred.');
    END;

    BEGIN
        Equipment_Maintenance.Generate_Detailed_Maintenance_Report('&ID');
    EXCEPTION
        WHEN Equipment_Maintenance.Maintenance_Record_Not_Found THEN
            DBMS_OUTPUT.PUT_LINE('Error: Maintenance record not found.');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error: Unexpected error occurred.');
    END;

    DBMS_OUTPUT.PUT_LINE('Average Utilization: ' || Equipment_Maintenance.Calculate_Average_Utilization || ' %');

    BEGIN
        DBMS_OUTPUT.PUT_LINE('Total Downtime : ' || Equipment_Maintenance.Calculate_Total_Downtime('&ID'));
    EXCEPTION
        WHEN Equipment_Maintenance.Maintenance_Record_Not_Found THEN
            DBMS_OUTPUT.PUT_LINE('Error: Maintenance record not found.');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error: Unexpected error occurred.');
    END;

    BEGIN
        DBMS_OUTPUT.PUT_LINE('Equipment Age : ' || Equipment_Maintenance.Calculate_Equipment_Age('&Serial_No'));
    EXCEPTION
        WHEN Equipment_Maintenance.Equipment_Not_Found THEN
            DBMS_OUTPUT.PUT_LINE('Error: Equipment not found.');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error: Unexpected error occurred.');
    END;
END;
/

CREATE OR REPLACE TRIGGER update_availability_status
AFTER INSERT OR UPDATE ON Maintenance
FOR EACH ROW
BEGIN
    IF :NEW.Type = 'Emergency Repair' THEN
        UPDATE Availability
        SET Status = 'Under Maintenance'
        WHERE Serial_No = :NEW.ID;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER update_reports
AFTER INSERT OR UPDATE ON Maintenance
FOR EACH ROW
BEGIN
    UPDATE Reports
    SET Utilization = CASE
                        WHEN :NEW.Type = 'Routine Checkup' THEN '90%'
                        WHEN :NEW.Type = 'Emergency Repair' THEN '80%'
                        ELSE 'Unknown'
                      END,
        Compliance_Metrics = CASE
                               WHEN :NEW.Type = 'Routine Checkup' THEN 'Compliant'
                               WHEN :NEW.Type = 'Emergency Repair' THEN 'Non-Compliant'
                               ELSE 'Unknown'
                             END
    WHERE Invoice_ID = :NEW.ID;
END;
/

CREATE OR REPLACE TRIGGER update_analysis
AFTER INSERT OR UPDATE ON Reports
FOR EACH ROW
BEGIN
    UPDATE Analysis
    SET Utilization = CASE
                        WHEN :NEW.Utilization >= '90%' THEN 'High'
                        WHEN :NEW.Utilization >= '80%' THEN 'Medium'
                        ELSE 'Low'
                      END,
        Compliance_Metrics = :NEW.Compliance_Metrics
    WHERE ID = :NEW.Invoice_ID;
END;
/

CREATE OR REPLACE TRIGGER update_availability_status
AFTER INSERT ON Maintenance
FOR EACH ROW
BEGIN
    UPDATE Availability
    SET Status = 'Under Maintenance'
    WHERE Serial_No = :NEW.ID;
END;
/

CREATE OR REPLACE TRIGGER update_reports
AFTER INSERT ON Maintenance
FOR EACH ROW
BEGIN
    UPDATE Reports
    SET Utilization = '80%',
        Compliance_Metrics = 'Compliant'
    WHERE Invoice_ID = :NEW.ID;
END;
/

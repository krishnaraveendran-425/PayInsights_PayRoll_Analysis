CREATE DATABASE PayInsight_Payroll;
USE PayInsight_Payroll;

CREATE TABLE Payroll_Data (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100),
    Department VARCHAR(50),
    Job_Role VARCHAR(100),
    Pay_Month VARCHAR(20),
    Basic_Salary DECIMAL(10,2),
    HRA DECIMAL(10,2),
    Other_Allowances DECIMAL(10,2),
    Overtime_Hours DECIMAL(6,2),
    Overtime_Pay DECIMAL(10,2),
    Gross_Salary DECIMAL(10,2),
    PF_Deduction DECIMAL(10,2),
    Tax_Deduction DECIMAL(10,2),
    Other_Deductions DECIMAL(10,2),
    Total_Deductions DECIMAL(10,2),
    Net_Salary DECIMAL(10,2)
);

DESCRIBE Payroll_Data;
SELECT * FROM Payroll_Data;
SELECT COUNT(*) AS Total_Employees FROM Payroll_Data;
SHOW TABLES FROM PayInsight_Payroll;
SELECT COUNT(*) AS Total_Records
FROM PayInsight_Payroll.payroll_analysis1;
SELECT Employee_ID, Employee_Name, Department,Job_Role, Net_Salary FROM PayInsight_Payroll.payroll_analysis1 ORDER BY Net_Salary DESC LIMIT 5;
SELECT Department, COUNT(*) AS Employee_Count, ROUND(AVG(Net_Salary), 2) AS Average_Net_Salary FROM PayInsight_Payroll.payroll_analysis1 GROUP BY Department ORDER BY Average_Net_Salary DESC;
SELECT Department, COUNT(*) AS Employee_Count, SUM(Net_Salary) AS Total_Net_Payroll FROM PayInsight_Payroll.payroll_analysis1 GROUP BY Department ORDER BY Total_Net_Payroll DESC;          
SELECT Employee_ID, Employee_Name,Department,Job_Role,Net_Salary FROM PayInsight_Payroll.payroll_analysis1 WHERE Net_Salary > ( SELECT AVG(Net_Salary) FROM PayInsight_Payroll.payroll_analysis1 ) ORDER BY Net_Salary DESC;
SELECT Employee_ID, Employee_Name, Department,Overtime_Hours,Overtime_Pay FROM PayInsight_Payroll.payroll_analysis1 ORDER BY Overtime_Pay DESC LIMIT 5;
SELECT Department, COUNT(*) AS Employee_Count, SUM(Overtime_Hours) AS Total_Overtime_Hours, SUM(Overtime_Pay) AS Total_Overtime_Pay FROM PayInsight_Payroll.payroll_analysis1 GROUP BY Department ORDER BY Total_Overtime_Pay DESC;
SELECT Employee_ID, Employee_Name, Department, Overtime_Hours, Overtime_Pay FROM PayInsight_Payroll.payroll_analysis1 WHERE Department IN ('IT', 'Sales') ORDER BY Department, Employee_ID;
SELECT Department, SUM(Overtime_Hours) AS Total_Overtime_Hours, SUM(Overtime_Pay) AS Total_Overtime_Pay FROM PayInsight_Payroll.payroll_analysis1 GROUP BY Department ORDER BY Total_Overtime_Pay DESC;
SELECT Employee_ID, Department, Overtime_Hours, Overtime_Pay FROM PayInsight_Payroll.payroll_analysis1 WHERE Department IN ('IT', 'Sales') ORDER BY Department, Employee_ID;
SHOW COLUMNS FROM PayInsight_Payroll.payroll_analysis1;
UPDATE PayInsight_Payroll.payroll_analysis1 SET Overtime_Pay = REPLACE(Overtime_Pay, ',', '');
ALTER TABLE PayInsight_Payroll.payroll_analysis1 MODIFY COLUMN Overtime_Pay DECIMAL(10,2);
SELECT Department, SUM(Overtime_Hours) AS Total_Overtime_Hours, SUM(Overtime_Pay) AS Total_Overtime_Pay FROM PayInsight_Payroll.payroll_analysis1 GROUP BY Department ORDER BY Total_Overtime_Pay DESC;
SELECT Employee_ID, Department, Overtime_Pay FROM PayInsight_Payroll.payroll_analysis1 WHERE Department IN ('IT', 'Sales') ORDER BY Department, Employee_ID;
UPDATE PayInsight_Payroll.payroll_analysis1
SET Overtime_Pay = CASE Employee_ID
    WHEN 'E001' THEN 1000
    WHEN 'E006' THEN 750
    WHEN 'E010' THEN 1250
    WHEN 'E015' THEN 1500
    WHEN 'E019' THEN 1000
    WHEN 'E025' THEN 1250
    WHEN 'E004' THEN 1440
    WHEN 'E013' THEN 1260
    WHEN 'E021' THEN 1620
    WHEN 'E027' THEN 1080
    ELSE Overtime_Pay
END
WHERE Employee_ID IN ('E001','E006','E010','E015','E019','E025','E004','E013','E021','E027');
SHOW INDEX FROM PayInsight_Payroll.payroll_analysis1;
SELECT Employee_ID, Overtime_Pay FROM PayInsight_Payroll.payroll_data WHERE Employee_ID IN ('E001','E006','E010','E015','E019','E025','E004','E013','E021','E027');
SELECT Employee_ID, Overtime_Pay, Gross_Salary, Net_Salary FROM PayInsight_Payroll.payroll_analysis1 LIMIT 5;
SET SQL_SAFE_UPDATES = 0;
UPDATE PayInsight_Payroll.payroll_analysis1
SET Overtime_Pay = CASE Employee_ID
    WHEN 'E001' THEN 1000
    WHEN 'E006' THEN 750
    WHEN 'E010' THEN 1250
    WHEN 'E015' THEN 1500
    WHEN 'E019' THEN 1000
    WHEN 'E025' THEN 1250
    WHEN 'E004' THEN 1440
    WHEN 'E013' THEN 1260
    WHEN 'E021' THEN 1620
    WHEN 'E027' THEN 1080
    ELSE Overtime_Pay
END
WHERE Employee_ID IN ('E001','E006','E010','E015','E019','E025','E004','E013','E021','E027');
SELECT Department, SUM(Overtime_Hours) AS Total_Overtime_Hours, SUM(Overtime_Pay) AS Total_Overtime_Pay FROM PayInsight_Payroll.payroll_analysis1 GROUP BY Department ORDER BY Total_Overtime_Pay DESC;
SELECT COUNT(*) AS Total_Employees, SUM(Net_Salary) AS Total_Net_Payroll, ROUND(AVG(Net_Salary), 2) AS Average_Net_Salary FROM PayInsight_Payroll.payroll_analysis1;
SELECT Employee_ID, Net_Salary FROM PayInsight_Payroll.payroll_analysis1 LIMIT 10;
UPDATE PayInsight_Payroll.payroll_analysis1 SET Net_Salary = REPLACE(Net_Salary, ',', '');
ALTER TABLE PayInsight_Payroll.payroll_analysis1 MODIFY COLUMN Net_Salary DECIMAL(10,2);
SELECT COUNT(*) AS Total_Employees, SUM(Net_Salary) AS Total_Net_Payroll, ROUND(AVG(Net_Salary), 2) AS Average_Net_Salary FROM PayInsight_Payroll.payroll_analysis1;
UPDATE PayInsight_Payroll.payroll_analysis1 SET Gross_Salary = REPLACE(Gross_Salary, ',', '');
ALTER TABLE PayInsight_Payroll.payroll_analysis1 MODIFY COLUMN Gross_Salary DECIMAL(10,2);
UPDATE PayInsight_Payroll.payroll_analysis1 SET Basic_Salary = REPLACE(Basic_Salary, ',', '');
ALTER TABLE PayInsight_Payroll.payroll_analysis1 MODIFY COLUMN Basic_Salary DECIMAL(10,2);
UPDATE PayInsight_Payroll.payroll_analysis1 SET HRA = REPLACE(HRA, ',', '');
ALTER TABLE PayInsight_Payroll.payroll_analysis1 MODIFY COLUMN HRA DECIMAL(10,2);
UPDATE PayInsight_Payroll.payroll_analysis1 SET Other_Allowances = REPLACE(Other_Allowances, ',', '');
ALTER TABLE PayInsight_Payroll.payroll_analysis1 MODIFY COLUMN Other_Allowances DECIMAL(10,2);
UPDATE PayInsight_Payroll.payroll_analysis1 SET PF_Deduction = REPLACE(PF_Deduction, ',', '');
ALTER TABLE PayInsight_Payroll.payroll_analysis1 MODIFY COLUMN PF_Deduction DECIMAL(10,2);

UPDATE PayInsight_Payroll.payroll_analysis1 SET Tax_Deduction = REPLACE(Tax_Deduction, ',', '');
ALTER TABLE PayInsight_Payroll.payroll_analysis1 MODIFY COLUMN Tax_Deduction DECIMAL(10,2);

UPDATE PayInsight_Payroll.payroll_analysis1 SET Total_Deductions = REPLACE(Total_Deductions, ',', '');
ALTER TABLE PayInsight_Payroll.payroll_analysis1 MODIFY COLUMN Total_Deductions DECIMAL(10,2);
SELECT Employee_ID, Gross_Salary, Total_Deductions, Net_Salary, (Gross_Salary - Total_Deductions) AS Calculated_Net_Salary FROM PayInsight_Payroll.payroll_analysis1 LIMIT 10;
SELECT COUNT(*) AS Incorrect_Records FROM PayInsight_Payroll.payroll_analysis1 WHERE Net_Salary <> (Gross_Salary - Total_Deductions);
SELECT COUNT(*) AS Incorrect_Gross_Salary_Records FROM PayInsight_Payroll.payroll_analysis1 WHERE Gross_Salary <> (Basic_Salary + HRA + Other_Allowances + Overtime_Pay);
SELECT Employee_ID, Employee_Name, Basic_Salary, HRA, Other_Allowances, Overtime_Pay, Gross_Salary, (Basic_Salary + HRA + Other_Allowances + Overtime_Pay) AS Calculated_Gross_Salary FROM PayInsight_Payroll.payroll_analysis1 WHERE Gross_Salary <> (Basic_Salary + HRA + Other_Allowances + Overtime_Pay);
UPDATE PayInsight_Payroll.payroll_analysis1 SET Overtime_Pay = 1080 WHERE Employee_ID = 'E009';
SELECT Department, COUNT(*) AS Employee_Count, SUM(Gross_Salary) AS Total_Gross_Payroll FROM PayInsight_Payroll.payroll_analysis1 GROUP BY Department ORDER BY Total_Gross_Payroll DESC;
SELECT Department, SUM(PF_Deduction) AS Total_PF_Deductions, SUM(Tax_Deduction) AS Total_Tax_Deductions, SUM(Other_Deductions) AS Total_Other_Deductions, SUM(Total_Deductions) AS Total_Deductions FROM PayInsight_Payroll.payroll_analysis1 GROUP BY Department ORDER BY Total_Deductions DESC;
SELECT Job_Role, COUNT(*) AS Employee_Count, ROUND(AVG(Net_Salary), 2) AS Average_Net_Salary FROM PayInsight_Payroll.payroll_analysis1 GROUP BY Job_Role ORDER BY Average_Net_Salary DESC;
SELECT Employee_ID, Employee_Name, Department, Overtime_Hours, Overtime_Pay FROM PayInsight_Payroll.payroll_analysis1 WHERE Overtime_Hours > 5 ORDER BY Overtime_Hours DESC;
SELECT Employee_ID, Employee_Name, Department, Job_Role, Gross_Salary FROM PayInsight_Payroll.payroll_analysis1 ORDER BY Gross_Salary DESC LIMIT 5;
SELECT
    COUNT(*) AS Total_Employees,
    SUM(Gross_Salary) AS Total_Gross_Payroll,
    SUM(Total_Deductions) AS Total_Deductions,
    SUM(Net_Salary) AS Total_Net_Payroll,
    ROUND(AVG(Net_Salary), 2) AS Average_Net_Salary
FROM PayInsight_Payroll.payroll_analysis1;
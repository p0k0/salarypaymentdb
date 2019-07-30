DROP PROCEDURE IF EXISTS save_employee;
CREATE PROCEDURE save_employee(IN name VARCHAR(255), IN rate DECIMAL(30,10), IN kind VARCHAR(255))
  BEGIN
    DECLARE employee_uuid BINARY(32) DEFAULT uuid_short();

    INSERT INTO bookkeeping.salary(employee_id, rate, kind)
      VALUES (employee_uuid, rate, kind);

    INSERT INTO bookkeeping.employee(id, name)
      VALUES (employee_uuid, name);


  END;

#CALL save_employee('s', 1200.25, 'monthly');
#CALL save_employee('abc', 120.725, 'hourly');
#CALL save_employee('jj', 1200.25, 'by-monthly');



DROP PROCEDURE IF EXISTS get_employee;
CREATE PROCEDURE get_employee(IN name VARCHAR(255))
  BEGIN
    SELECT employee.id, employee.name, salary.rate, salary.kind
      FROM employee, salary
        WHERE (employee.name LIKE name) AND (employee.id = salary.employee_id);
  END;

#CALL get_employee('ABC')
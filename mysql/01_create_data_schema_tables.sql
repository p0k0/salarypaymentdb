drop SCHEMA bookkeeping;
create SCHEMA bookkeeping;
SAVEPOINT schema_created_point;

create TABLE bookkeeping.employee(
  id BINARY(16) PRIMARY KEY,
  name VARCHAR(20)
);
SAVEPOINT create_employee_point;


CREATE TABLE bookkeeping.salary_kind(
  kind VARCHAR(10) PRIMARY KEY
);
SAVEPOINT create_paymentkind_point;

CREATE TABLE bookkeeping.salary(
  employee_id BINARY(16) NOT NULL,
  rate DECIMAL(30, 10),
  kind VARCHAR(10),
  CONSTRAINT salary_kind_fk FOREIGN KEY (kind)
    REFERENCES bookkeeping.salary_kind (kind)
);
SAVEPOINT create_salary_point;

COMMIT WORK;

